package builder
{
	import com.api.services.base.AsTranslater;
	import com.api.services.base.Attrib;
	import com.api.services.base.CommandObj;
	import com.api.services.base.ConstMap;
	import com.api.services.base.Obj;
	import com.api.services.base.Param;
	
	import core.BuilderBase;
	import core.PathManager;
	
	import flash.utils.setTimeout;
	
	public class RequestBuilder extends BuilderBase
	{
		protected var funRes:String;
		
	    public function RequestBuilder(cmds:Array, objMap:Object)
	    {
	        super(cmds, objMap);
	    }
	
		override public function build():void
	    {
	        for each (var cmd:CommandObj in _cmds)
	        {
	            var subPath:String = cmd.value.toLocaleLowerCase();
	            var url:String = PathManager.appPath + PathManager.protocolOutputPath + "/request/" + subPath + "/"
	
	            for each (var p:Param in cmd.params)
	            {
	                if (!p.isServerToClint && !p.useless)
	                {
						writeFile(url + "/" + p.requestClassName + ".as", toRequestCode(p, subPath));
	                }
	            }
	        }
	    }
	    public function toRequestCode(p:Param, subPath:String):String
	    {
			funRes = "";
	        var result:String = "/**\n * " + PathManager.copyRight + "\n */";
	        result += "\npackage " + PathManager.packagePrefix + "request." + subPath;
	        result += "\n{";
	        result += "\n    import " + PathManager.iRequestPath;
	        result += "\n    import " + PathManager.voPackagePath;
            result += "\n    import " + PathManager.packetPath;
	        result += "\n";
	        result += "\n    /**";
	        result += "\n     * " + p.info + "(" + p.cmdIndex + ":" + p.paramIndex + ")";
	        result += "\n     */";
	        result += "\n    public class " + p.requestClassName + " implements IRequest";
	        result += "\n    {";
//	        result += "\n    //==========================================================================";
//	        result += "\n    //  Constructor";
//	        result += "\n    //==========================================================================";
//	        result += "\n    /**";
//	        result += "\n     * 构造 " + p.getRequestClassName() + "实例";
//	        result += "\n     */";
//	        result += "\n    public function " + p.getRequestClassName() + "()";
//	        result += "\n    {";
//	        result += "\n    }";
//	        result += "\n    //==========================================================================";
//	        result += "\n    //  Properties";
//	        result += "\n    //==========================================================================";
	        var len:int = p.attribList.length;
	        for (var i:uint = 0; i < len; i++)
	        {
	            var attrib:Attrib = p.attribList[i];
	            var type:String = attrib.getCleardType();
	            var t:String = AsTranslater.typeSwitch(type);
	            var v:String = attrib.value;
	            if (attrib.isArrayValue())
	            {
	                t = "Array";
	                v = attrib.getArrayValue() + ConstMap.ARRAY_SUF;
					
					var count:String = "len";
					if(attrib.getArrayLenName() != "num"){
						count = attrib.getArrayLenName();
					}
					
					funRes += "\n			var len:int = " + v + ".length;";
					funRes += "\n			for (var i:int = 0; i < " + count + "; i++){";
					if(AsTranslater.typeSwitch(type) != type){
						funRes += "\n				p." + AsTranslater.writeSwitch(type) + ";";
						funRes = funRes.replace("{0}", v + "[i]");
					}else{
						funRes += "\n				var info:" + AsTranslater.typeSwitch(type) + " = " + v + "[i] as " + type + ";";
					}
						
					for each(var data:Obj in Obj.objMap){
						if(data.value == type){
							var numData:int = data.attribList.length;
							for (var k:uint = 0; k < numData; k++)
							{
								var dataAttrib:Attrib = data.attribList[k];
								var dataType:String = dataAttrib.getCleardType();
								var dataValue:String = dataAttrib.value;
								
								funRes += "\n				p." + AsTranslater.writeSwitch(dataType) + ";";
								funRes = funRes.replace("{0}", "info." + dataValue);
							}
						}
					}

					funRes += "\n			}"
					
	            }else if(attrib.isVOType()){
					decodeInfo(t, v);
				}else{
					funRes += "\n            p." + AsTranslater.writeSwitch(type) + ";";
					funRes = funRes.replace("{0}",  v);
				}
	            result += "\n        /**";
	            result += "\n         * " + attrib.info + "";
	            result += "\n         */";
	            result += "\n        public var " + v + ":" + t + ";";
				
//	            result += "\n    public function get " + v + "():" + t + "";
//	            result += "\n    {";
//	            result += "\n        return _" + v + ";";
//	            result += "\n    }";
//	            result += "\n    public function set " + v + "(value:" + t + "):void";
//	            result += "\n    {";
//	            result += "\n        _" + v + " = value;";
//	            result += "\n    }";
				
	            result += "\n    ";
	
	            if (AsTranslater.typeSwitch(type) == null)
	            {
	                trace("找不到指定的数据类型：" + type);
	            }
	        }
			
			result += "\n        public function get module():uint";
			result += "\n        {";
			result += "\n            return " + p.cmdIndex + ";";
			result += "\n        }";
			result += "\n"
			result += "\n        public function get action():uint";
			result += "\n        {";
			result += "\n            return " + p.paramIndex + ";";
			result += "\n        }";
			result += "\n"
			result += "\n        public function write(p:Packet):void";
			result += "\n        {";
			result += "\n            " + funRes;
			result += "\n        }";
			
//				public function write(p:Packet):void {
//					p.writeUnsignedInt(accId);
//					p.writeUnsignedInt(key);
//				}
	        result += "\n    }";
	        result += "\n}";
	
	        return result;
	    }
		
		private function decodeInfo(type:String, v:String):void
		{
			var space:String =  "            ";
			for each(var obj:Obj in Obj.objMap){
				if(obj.value == type){
					var num:int = obj.attribList.length;
					for (var j:uint = 0; j < num; j++)
					{
						var infoAttrib:Attrib = obj.attribList[j];
						var infoType:String = infoAttrib.getCleardType();
						var value:String = infoAttrib.value;
						
						funRes += "\n" + space + "p." + AsTranslater.writeSwitch(infoType) + ";";
						funRes = funRes.replace("{0}",  v + "." + value);
					}
				}
			}
		}
	}
}