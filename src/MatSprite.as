package
{
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	public class MatSprite extends Sprite
	{
		public var type:String;
		
		
		public function MatSprite(_type:String)
		{
			this.type = _type;
			var path:String = Data.getInstance().matsData[_type].sourcePath;
			var loader = new Loader;
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadSkin);
			loader.load(new URLRequest("Resource/"+path));
		}
		
		private function onLoadSkin(e:Event):void
		{
			var skin:Bitmap = Bitmap((e.target as LoaderInfo).loader.content);
			skin.x = -skin.width*0.5;
			skin.y = -skin.height*0.5;
			addChild(skin);
		}
	}
}