package sourceCode.classes.dr.game
{
	import flash.display.Sprite;
	import flash.display.Bitmap;
	//import flash.display.BitmapData; 

	public class Enemy extends Sprite 
	{
		public var XLocation:int;
		public var YLocation:int;
		public var bulletsDelay:int = 8;
		public var HP:Number = 100;
		public var enemy:Bitmap;
		public var enemyBullet:EnemyBullet;
		public var enemyBullets:Array = [];
		public var destroyed:Boolean = false;
		public var detectionArea:Sprite;
		public var bulletDelay:int = 20;
		public var delayCounter:int = 0;
		
		public function Enemy()
		{
			enemy = new Bitmap(new enemyImg(0,0));
			addChild(enemy);
		}
		public function setCoordinates(X:int,Y:int):void
		{
			XLocation = X;
			YLocation = Y;
			
			enemy.x = XLocation;
			enemy.y = YLocation;
			
			detectionArea = new Sprite();
			//detectionArea.graphics.lineStyle(3,0x00ff00);
			//detectionArea.graphics.beginFill(0x0000FF);
			//detectionArea.graphics.drawRect(XLocation ,YLocation,100,100);
			detectionArea.graphics.drawCircle(XLocation + enemy.width/2 ,YLocation + enemy.height/2, 200);
			//detectionArea.graphics.endFill();
			//detectionArea.x = XLocation;
			//detectionArea.y = YLocation
			//detectionArea.alpha = 0;
			addChild(detectionArea);
		}
		public function fire(endLocationX,endLocationY):void
		{
			//myTank.fire(stage.mouseX,stage.mouseY)
			var startLocationX:int;
			var startLocationY:int;
			startLocationX = XLocation + 8;
			startLocationY = YLocation + 8;
						enemyBullet = new EnemyBullet();
						//enemyBullet.setRotation(cannonAngle);
						
						addChild(enemyBullet);
						enemyBullet.setCoordinates(startLocationX,startLocationY,endLocationX,endLocationY);
						enemyBullets.push(enemyBullet); // switch the places with add child
		}
		public function enemyBulletNextLocation(pos:int):void
		{
			 enemyBullets[pos].moveToNextPoint();
		}
		public function removeBullet(pos:int):void
		{
			removeChild(enemyBullets[pos]);
			enemyBullets.splice(pos,1);
		}
		public function explode():void
		{
			//explosion
		}
		
	}
}














