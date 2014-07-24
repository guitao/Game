package com.yo.game
{
	import com.yo.framework.core.Game;
	import com.yo.framework.manager.layer.LayerManager;
	import com.yo.framework.manager.resource.ResourceManager;
	import com.yo.framework.manager.ui.UIManager;
	import com.yo.game.core.Config;
	import com.yo.game.core.URLCreator;
	import com.yo.game.enum.State;
	import com.yo.game.scene.SceneManager;
	import com.yo.game.scene.SceneStateCreator;
	
	[SWF(width="1000", height="600", frameRate="60", backgroundColor="#0")]
	public class IGO extends Game
	{
		public function IGO()
		{
			super();
		}
		
		override protected function init():void{
			super.init();
			SceneManager.instance.changeState(State.LOGIN_SCENE);
		}
		
		override protected function initModel():void{
			super.initModel();
			
			Config.host = _config.host;
			Config.port = _config.port;
			Config.lang = _config.lang;
			Config.resourcePath = _config.resource;
			Config.encryptResourcePath = _config.encryptResource;
			Config.encrypt = Boolean(int(_config.encrypt));
			
			Config.stage = stage;
		}
		
		override protected function initManager():void{
			super.initManager();
			
			ResourceManager.instance.setup(new URLCreator());
			SceneManager.instance.setup(new SceneStateCreator());
			LayerManager.instance.setup(this);
			UIManager.instance.setup();
		}
		
		override protected function update():void
		{
			SceneManager.instance.update();
		}
	}
}