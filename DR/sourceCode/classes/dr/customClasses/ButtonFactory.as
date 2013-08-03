package sourceCode.classes.dr.customClasses
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextFormatAlign;

	import flash.net.URLRequest;
	import flash.display.Loader;

	import sourceCode.classes.dr.customClasses.TestButton;
	public class ButtonFactory extends Sprite
	{
		public var Button:TestButton;
		public function ButtonFactory()
		{

			//trace("ButtonFactory created");
		}

		public function createBackground():void
		{

		}

		public function createButton(ID:int,x:Number,y:Number,text:String):void
		{

			Button = new TestButton(ID,x,y,text);
			addChild(Button);

			Button.addEventListener(MouseEvent.MOUSE_OVER,
			ButtonOverListener, false,0, true);
			Button.addEventListener(MouseEvent.MOUSE_OUT,
			ButtonOffListener, false, 0, true);
			Button.addEventListener(MouseEvent.CLICK,
			ButtonClickListener, false, 0, true);
		}


		private function ButtonClickListener(e:MouseEvent):void
		{
			Button.onClick();
		}
		private function ButtonOverListener(e:MouseEvent):void
		{
			Button.over();
		}
		private function ButtonOffListener(e:MouseEvent):void
		{
			Button.off();
		}
	}
}