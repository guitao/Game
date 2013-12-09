package loaderqueue.adapter
{
import flash.events.ErrorEvent;
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.net.URLRequest;
import flash.utils.getTimer;

import loaderqueue.LoaderAdapterState;
import loaderqueue.LoaderQueueEvent;

/**
 * 任务完成后派发
 * @eventType net.manaca.loaderqueue.LoaderQueueEvent.TASK_COMPLETED
 */
[Event(name="taskCompleted", type="loaderqueue.LoaderQueueEvent")]

/**
 * 任务出错后派发
 * @eventType net.manaca.loaderqueue.LoaderQueueEvent.TASK_ERROR
 */
[Event(name="taskError", type="loaderqueue.LoaderQueueEvent")]

/**
 * 任务进程中派发
 * @eventType net.manaca.loaderqueue.LoaderQueueEvent.TASK_PROGRESS
 */
[Event(name="taskProgress", type="loaderqueue.LoaderQueueEvent")]

/**
 * 任务启动后派发
 * @eventType net.manaca.loaderqueue.LoaderQueueEvent.TASK_START
 */
[Event(name="taskStart", type="loaderqueue.LoaderQueueEvent")]

/**
 * 任务停止或移出后派发
 * @eventType net.manaca.loaderqueue.LoaderQueueEvent.TASK_STOP
 */
[Event(name="taskStop", type="loaderqueue.LoaderQueueEvent")]

/**
 * 任务消毁时派发
 * @eventType net.manaca.loaderqueue.LoaderQueueEvent.TASK_DISPOSE
 */
[Event(name="taskDispose", type="loaderqueue.LoaderQueueEvent")]

/**
 * 虚构类，用于提供给adapter子类继承使用，同时adapter子类需引用ILoaderAdapter接口
 */
public class AbstractLoaderAdapter extends EventDispatcher
{
   
    /**
     * 构造函数.
     *
     */
    public function AbstractLoaderAdapter(priority:uint, urlRequest:URLRequest, loaderContext:* = null)
    {
        _priority = priority;
        this.urlRequest = urlRequest;
        this.loaderContext = loaderContext;
        this._url = urlRequest.url;
    }
   
    protected var loaderContext:*;
    protected var urlRequest:URLRequest;

    private var _customData:*;

    /**
     * 提供给开发者用于数据或参数传递
     * LoaderQueue或是任何Adapter自身并不对此变量附值
     */
    public function get customData():*
    {
        return _customData;
    }

    public function set customData(value:*):void
    {
        _customData = value;
    }
    
    private var _maxTries:int = 3;
    /**
     * 加载失败重试次数。
     * @default 3 
     * 
     */    
    public function get maxTries():int
    {
        return _maxTries;
    }
    
    public function set maxTries(value:int):void
    {
        _maxTries = value;
    }
    
    private var _numTries:int = 0;
    public function get numTries():int
    {
        return _numTries;
    }
    
    /**
     * 指示该加载对象是(true)否(false)开始加载。
     * @return
     *
     */
    public function get isStarted():Boolean
    {
        return state == LoaderAdapterState.STARTED;
    }
    
    /**
     * 指示该加载对象是(true)否(false)完成加载。
     * @return
     *
     */
    public function get isCompleted():Boolean
    {
        return state == LoaderAdapterState.COMPLETED;
    }
    
    private var _priority:uint;

    /**
     * 加载优先级。
     * @return
     *
     */
    public function get priority():uint
    {
        return _priority;
    }

    private var _state:String = LoaderAdapterState.WAITING;

    /**
     * 适配器的状态。
     * @return 可能的值为LoaderQueueConst中的常量
     * @see net.manaca.loaderqueue#LoaderQueueConst
     */
    public function get state():String
    {
        return _state;
    }

    public function set state(value:String):void
    {
        _state = value;
    }
    
    private var _adapteeAgent:IEventDispatcher;

    /**
     * 将子类的adaptee传给本类的adapteeAgent,用于在此处理一些事件侦听.
     */
    protected function set adapteeAgent(loader:IEventDispatcher):void
    {
        _adapteeAgent = loader;
    }

    protected function get adapteeAgent():IEventDispatcher
    {
        return _adapteeAgent;
    }

    private var _url:String;
	
    /**
     * 加载对象的url地址。
     */
    public function get url():String
    {
        return _url;
    }
    
    private var _preventCache:Boolean = false;
    /**
     * 为url地址添加一个随机数，用于清除缓存。
     * 也可以通过设置ILoaderQueue.preventAllCache = true来清除所有加载项的缓存。
     * @see net.manaca.loaderqueue.ILoaderQueue#preventAllCache
     * @return 
     * 
     */  
    public function get preventCache():Boolean
    {
        return _preventCache;
    }
    
    public function set preventCache(value:Boolean):void
    {
        _preventCache = value;
    }
   
    /**
     * @private
     */    
    public function start():void
    {
        throw new Error("AbstractLoaderAdapter.start() method is abstract " +
            "and must be implemented by subclasses.");
    }
    
    /**
     * 消毁此对象内在引用
     * 调用此方法后，此adapter实例会自动从LoaderQueue中移出
     * p.s: 停止下载的操作LoaderQueue会自动处理
     */
    public function dispose():void
    {
        dispatchEvent(new LoaderQueueEvent(LoaderQueueEvent.TASK_DISPOSE, customData));
        removeAllListener();
        loaderContext = null;
        urlRequest = null;
    }
    
    /**
     * 为指定url地址添加一个随机参数用于清空缓存。
     * <p>例如添加前为:http://www.mysize.com/file.xml</p>
     * <p>添加后则为:http://www.mysize.com/file.xml?LoaderQueueNoCache=1736444222</p>
     * @param url 需要添加清除缓存信息的url
     * @return 
     * 
     */    
    protected function getPreventCacheURL(url:String):String
    {
        var result:String = url;
		var date:Date = new Date();
        var cacheString:String = "LoaderQueueNoCache=" + date.getTime();
        if(result.indexOf("LoaderQueueNoCache=") == -1)
        {
            if(result.indexOf("?") != -1)
            {
                result += "&" + cacheString;
            }
            else
            {
                result += "?" + cacheString;
            }
        }
        return result;
    }

    /**
     * 此方法应包含在子类start()函数中调用
     */
    protected function preStartHandle():void
    {
        state = LoaderAdapterState.STARTED;
        //判断是否需要添加清除缓存参数
        if(preventCache)
        {
            urlRequest.url = getPreventCacheURL(urlRequest.url);
        }
        with (adapteeAgent)
        {
            addEventListener(Event.COMPLETE, container_completeHandler);
            addEventListener(ProgressEvent.PROGRESS, container_progressHandler);
            addEventListener(IOErrorEvent.DISK_ERROR, container_errorHandler);
            addEventListener(IOErrorEvent.IO_ERROR, container_errorHandler);
            addEventListener(IOErrorEvent.NETWORK_ERROR, container_errorHandler);
        }
        dispatchEvent(new LoaderQueueEvent(LoaderQueueEvent.TASK_START, customData));
    }

    /**
     * 此方法应包含在子类stop()函数中调用
     */
    protected function preStopHandle():void
    {
        state = LoaderAdapterState.WAITING;
        removeAllListener();
        dispatchEvent(new LoaderQueueEvent(LoaderQueueEvent.TASK_STOP, customData));
    }
    
    /**
     * 移除所有被适配者对象的事件侦听.
     * 
     */    
    protected function removeAllListener():void
    {
        if(adapteeAgent)
        {
            adapteeAgent.removeEventListener(Event.COMPLETE, container_completeHandler);
            adapteeAgent.removeEventListener(ProgressEvent.PROGRESS, container_progressHandler);
            adapteeAgent.removeEventListener(IOErrorEvent.DISK_ERROR, container_errorHandler);
            adapteeAgent.removeEventListener(IOErrorEvent.IO_ERROR, container_errorHandler);
            adapteeAgent.removeEventListener(IOErrorEvent.NETWORK_ERROR, container_errorHandler);
        }
    }

    protected function createErrorEvent(error:Error):ErrorEvent
    {
        return new ErrorEvent(LoaderQueueEvent.TASK_ERROR, false, false, error.message);
    }

    /**
     * 目下载完成后调用,由preStartHandle()触发
     * @param event
     */
    protected function container_completeHandler(event:Event):void
    {
        state = LoaderAdapterState.COMPLETED;
        dispatchEvent(new LoaderQueueEvent(LoaderQueueEvent.TASK_COMPLETED, customData));
    }

    /**
     * 加载出现IOError时的处理
     * @param event
     * 
     */    
    protected function container_errorHandler(event:IOErrorEvent):void
    {
        _numTries++;
        //停止冒泡
        event.stopPropagation();
        //判断重试次数
        if (numTries < maxTries)
        {
            removeAllListener();
            state = LoaderAdapterState.WAITING;
            start();
        }
        else
        {
            state = LoaderAdapterState.ERROR;
            var errorEvent:LoaderQueueEvent = new LoaderQueueEvent(LoaderQueueEvent.TASK_ERROR, customData);
            errorEvent.errorMsg = event.text;
            dispatchEvent(errorEvent);
        }
    }

    /**
     * 项目下载过程中调用,由preStartHandle()触发
     */
    protected function container_progressHandler(event:ProgressEvent):void
    {
        var progressEvent:LoaderQueueEvent = new LoaderQueueEvent(LoaderQueueEvent.TASK_PROGRESS, customData);
        progressEvent.bytesLoaded = event.bytesLoaded;
        progressEvent.bytesTotal = event.bytesTotal;
        dispatchEvent(progressEvent);
    }
}
}
