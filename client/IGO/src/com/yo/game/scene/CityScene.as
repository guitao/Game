package com.yo.game.scene
{
	import com.yo.framework.logger.Log;
	import com.yo.framework.manager.resource.ResourceManager;
	import com.yo.framework.manager.ui.UIManager;
	import com.yo.framework.scene.PathFindingScene;
	import com.yo.game.data.vo.EntityVo;
	import com.yo.game.objects.EntityFactory;
	import com.yo.game.objects.Player;
	
	import flash.display.MovieClip;
	import flash.events.Event;

	public class CityScene extends PathFindingScene
	{
		private var _player:Player;
		
		public function CityScene()
		{
			super();
		}
		
		override public function enter():void{
			super.enter();
			Log.getLog(this).debug("进入主场景");
//			ResourceManager.instance.loadResource("boy", "avatar", __loadComplete);
			
			var vo:EntityVo = new EntityVo()
			_player = EntityFactory.instance.createPlayer(vo, this);
		}
		
		private function __loadComplete(e:Event):void
		{
//			var mc:MovieClip = ResourceManager.instance.create("Person") as MovieClip;
//			mc.x = 500;
//			mc.y = 300;
//			UIManager.instance.addChild(mc);
		}
		
		override public function update():void{
			super.update();
		}
		
		override public function exit():void{
			super.exit();
		}
		
		override public function dispose():void{
			super.dispose();
		}
	}
}