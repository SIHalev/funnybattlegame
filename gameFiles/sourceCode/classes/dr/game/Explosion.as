package sourceCode.classes.dr.game
{
	import flash.display.Sprite;
	import flash.display.Bitmap;
	
	public class Explosion extends Sprite
	{
		
	public var explosion:Bitmap;
	public var explosions:Array = []; // 1009 if you forgot to = []
	public var XLocation:int; 
	public var YLocation:int;
	
	
		public function Explosion()
		{
			
		}
		public function generateExplosions(X:int,Y:int,explosionNumber:int = 4):void // defaul 4
		{
			// moje random da se izbira explosionNumber
			for (var i:int = 0; i < explosionNumber; i++)
			{
				var explosionScale:Number = 0.1;
				explosionScale = (10-(Math.floor(Math.random() * 3)))/10
				XLocation = X + Math.floor(Math.random() * 15);
				YLocation = Y + Math.floor(Math.random() * 15);
				
				explosion = new Bitmap(new explosionImg(0,0));
				
				explosion.scaleX = explosionScale;
				explosion.scaleY = explosionScale;
				explosion.x = XLocation;
				explosion.y = YLocation;
				
				explosions.push(explosion);
				addChild(explosion);
			}
		}
		public function generateBigBang(X:int,Y:int):void
		{
			for (var i:int = 0; i < 50; i++)
			{
				var explosionScale:Number = 0.1;
				explosionScale = (10-(Math.floor(Math.random() * 3)))/10
				XLocation = X + Math.floor(Math.random() * 70);
				YLocation = Y + Math.floor(Math.random() * 70);
				
				explosion = new Bitmap(new explosionImg(0,0));
				
				explosion.scaleX = explosionScale;
				explosion.scaleY = explosionScale;
				explosion.x = XLocation;
				explosion.y = YLocation;
				
				explosions.push(explosion);
				addChild(explosion);
			}
		}
		public function generateBlueExplosions(X:int,Y:int,explosionNumber:int = 4):void // defaul 4
		{
			// moje random da se izbira explosionNumber
			for (var i:int = 0; i < explosionNumber; i++)
			{
				var explosionScale:Number = 0.1;
				explosionScale = (10-(Math.floor(Math.random() * 3)))/10
				XLocation = X + Math.floor(Math.random() * 15);
				YLocation = Y + Math.floor(Math.random() * 15);
				
				explosion = new Bitmap(new blueExplosionImg(0,0));
				
				explosion.scaleX = explosionScale;
				explosion.scaleY = explosionScale;
				explosion.x = XLocation;
				explosion.y = YLocation;
				
				explosions.push(explosion);
				addChild(explosion);
			}
		}
		
		public function generateOrangeExplosions(X:int,Y:int,explosionNumber:int = 4):void // defaul 4
		{
			// moje random da se izbira explosionNumber
			for (var i:int = 0; i < explosionNumber; i++)
			{
				var explosionScale:Number = 0.1;
				explosionScale = (10-(Math.floor(Math.random() * 3)))/10
				XLocation = X + Math.floor(Math.random() * 15);
				YLocation = Y + Math.floor(Math.random() * 15);
				
				explosion = new Bitmap(new orangeExplosion(0,0));
				
				explosion.scaleX = explosionScale;
				explosion.scaleY = explosionScale;
				explosion.x = XLocation;
				explosion.y = YLocation;
				
				explosions.push(explosion);
				addChild(explosion);
			}
		}
		public function generatePurpleExplosions(X:int,Y:int,explosionNumber:int = 4):void // defaul 4
		{
			// moje random da se izbira explosionNumber
			for (var i:int = 0; i < explosionNumber; i++)
			{
				var explosionScale:Number = 0.1;
				explosionScale = (10-(Math.floor(Math.random() * 3)))/10
				XLocation = X + Math.floor(Math.random() * 15);
				YLocation = Y + Math.floor(Math.random() * 15);
				
				explosion = new Bitmap(new purpleExplosion(0,0));
				
				explosion.scaleX = explosionScale;
				explosion.scaleY = explosionScale;
				explosion.x = XLocation;
				explosion.y = YLocation;
				explosions.push(explosion);
				addChild(explosion);
			}
		}
		public function getExplosions():Array
		{
			return explosions;
		}
		public function setAlpha():void
		{
			var tempExplosion:Bitmap;
			var reduceAlpha:Number = 0.1;
			for(var i:int = explosions.length -1; i >= 0; i--)
			{
				reduceAlpha =(Math.floor(Math.random() * 2))/10
				tempExplosion = explosions[i];
				tempExplosion.alpha -= reduceAlpha;
				// ako 0 da iz4ezvat !!! trqbva napravq.
			}
		}
		public function getAlpha():Number
		{
			var tempAlpha:Number = explosions[0].alpha;
			for(var i:int = explosions.length -1; i >= 0; i--)
			{
				if(tempAlpha < explosions[i].alpha) tempAlpha = explosions[i].alpha;
			}
			return tempAlpha;
		}
	}
}