package sourceCode.classes.dr.game
{
	import flash.display.Sprite;
	import flash.display.Bitmap;

	public class Cursor extends Sprite
	{
		private var cursor:Bitmap;
		public var cursorX:Number = 0;
		public var cursorY:Number = 0;
		public function Cursor()
		{
			cursor = new Bitmap(new cursorImg(0,0));
			cursor.x = -100;
			cursor.y = -100; 
			// i the cursor to be invisible before mouse move //!!!!! better hide than add and remove
			addChild(cursor);
		}
		public function moveCursor(X:Number,Y:Number):void
		{
			cursorX = X - cursor.width/2;
			cursorY = Y - cursor.height/2;
			cursor.x = cursorX;
			cursor.y = cursorY;
		}
		public function onPressed():void
		{
			//effect
		}
	}
}