package sourceCode.classes.dr.game
{
	import flash.display.Sprite;
	import flash.display.Bitmap;
	
	public class Bullet extends Sprite
	{
		// the cursor was not very accurate, thats why i replace all int to Number -> solve the problem XD WIN.
		public var nextX:Number;
		public var nextY:Number;
		public var beginLocationX:Number;
		public var beginLocationY:Number;
		public var endLocationX:Number;
		public var endLocationY:Number;
		public var bullet:Bitmap;
		public var speed:Number = 15;
		public var dmg:Number = 10;
		public var moves:Number;
		public var distance:Number;
		public var finished:Boolean = false;
		public function Bullet()
		{
			bullet = new Bitmap(new bulletImg(0,0));
			
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
			var dx:Number = startX - endX;
			var dy:Number = startY - endY;
			
			distance = Math.sqrt(dx*dx + dy*dy);
			moves = Math.floor(Math.abs(distance/speed));
			addChild(bullet);
			// modife for bullet effect
			nextX = (endLocationX - beginLocationX)/moves;
			nextY = (endLocationY - beginLocationY)/moves;
			bullet.x = beginLocationX;
			bullet.y = beginLocationY;
		}
		public function moveToNextPoint():void
		{
			if(moves>0) 
			{ 
				/*
				nextX = (beginLocationX - endLocationX)/moves;
				nextY = (beginLocationY - endLocationY)/moves;
				trace(nextX);
				
				bullet.x = beginLocationX - nextX;
				bullet.y = beginLocationY - nextY; // or +=
				moves--;*/
				// rocket effect must switch beginX and endX
				//trace(nextX);
				
				bullet.x +=  nextX;
				bullet.y +=  nextY; // or +=
				//trace(bullet.x);
				moves--;
				//trace(moves);
			}
			//if(moves<=0){
			else {
				//trace("remove bullet");
				finished = true;
				//removeChild(bullet);
				
				// if they are many 1009 error garbige collector :P
				// delay after shots
				// and try if containts
				// NOTE: i hate garbige collector ...
			}
		}
		
		public function setRotation(ang:Number):void
		{
			bullet.rotation = ang;
		}
	}
}