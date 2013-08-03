package sourceCode.classes.dr.game
{
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import flash.display.Graphics;
	
	public class Laser extends Sprite
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
		public var laser:Sprite;
		//public var moves:Number;
		//public var distance:Number;
		public var finished:Boolean = false;
		public function Laser()
		{
			laser = new Sprite();
			addChild(laser);
		}
		public function setCoordinates(startX:Number,startY:Number,endX:Number,endY:Number):void
		{
			
			beginLocationX = startX;
			beginLocationY = startY;
			endLocationX = endX;
			endLocationY = endY;

			if(finished != true)
			{
				
				//addChild(laser);
				laser.graphics.clear();
				laser.graphics.lineStyle(3, 0xFF0000, 1);
				laser.graphics.moveTo(beginLocationX,beginLocationY);
				laser.graphics.lineTo(endLocationX,endLocationY);
				laser.alpha = 1;
				
			}
			/*if(finished == true)
			{
				//removeChild(laser);
				laser.alpha = 0;
				trace("alpha = 0");
			}*/
		}
		public function hideLaser():void
		{
			laser.alpha = 0;
			//removeChild(laser);
		}
		public function getAlpha():Number
		{
			return laser.alpha;
		}
		public function refreshL():void
		{
			laser.graphics.clear();
				laser.graphics.lineStyle(3, 0xFF0000, 1);
				
				laser.graphics.moveTo(beginLocationX,beginLocationY);
				laser.graphics.lineTo(endLocationX,endLocationY);
				laser.alpha = 1;
		}
	}
}