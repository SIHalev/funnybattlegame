package sourceCode.classes.dr.game
{
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import flash.display.Graphics;
	
	public class Shock extends Sprite
	{
		// the cursor was not very accurate, thats why i replace all int to Number -> solve the problem XD WIN.
		//public var nextX:Number;
		//public var nextY:Number;
		public var beginLocationX:Number;
		public var beginLocationY:Number;
		public var endLocationX:Number;
		public var endLocationY:Number;
		//public var bullet:Bitmap;
		//public var speed:Number = 15;
		public var dmg:Number = 1;
		public var shock:Sprite;
		//public var moves:Number;
		//public var distance:Number;
		public var finished:Boolean = false;
		public function Shock()
		{
			//bullet = new Bitmap(new bulletImg(0,0));
			shock = new Sprite();
			addChild(shock);
			
		}
		public function setCoordinates(startX:Number,startY:Number,endX:Number,endY:Number):void
		{
			
			beginLocationX = startX;
			beginLocationY = startY;
			endLocationX = endX;
			endLocationY = endY;
			//bullet.x = startX;
			//bullet.y = startY;
			//trace(startX + startY);
			if(finished != true)
			{
				
				//addChild(shock);
				shock.graphics.clear();
				shock.graphics.lineStyle(6, 0x0000FF, 1);
				shock.graphics.moveTo(beginLocationX,beginLocationY);
				shock.graphics.lineTo(endLocationX,endLocationY);
				shock.alpha = 1;
				
			}
		}
		public function hideShock():void
		{
			shock.alpha = 0;
			//removeChild(shock);
		}
		public function getAlpha():Number
		{
			return shock.alpha;
		}
		public function setRotation(ang:Number):void
		{
			//bullet.rotation = ang;
		}
	}
}