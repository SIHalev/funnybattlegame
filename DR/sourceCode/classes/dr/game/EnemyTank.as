package sourceCode.classes.dr.game
{
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import flash.display.MovieClip;

	//import flash.display.BitmapData; 

	public class EnemyTank extends Sprite 
	{
		public var XLocation:Number;
		public var YLocation:Number;
		public var endLocationX:Number;
		public var endLocationY:Number;
		public var beginLocationX:Number;
		public var beginLocationY:Number;
		public var nextX:Number;
		public var nextY:Number;
		public var moves:Number;
		
		public var finished:Boolean = false;
		
		public var enemyBodyRadAngle:Number = 0;
		public var tankAngle:int = 0;
		public var distance:Number;
		public var speed:Number = 2;
		public var newDirectionDelay = 1;
		//public var bulletsDelay:int = 8;
		public var HP:Number = 100;
		//public var enemyTank:Sprite;
		public var enemyTank:Sprite;
		public var enemyBullet:EnemyBullet;
		public var enemyBullets:Array = [];
		public var destroyed:Boolean = false;
		public var detectionArea:Sprite;
		public var moveDetectionArea:Sprite;
		//public var fireArea:Sprite;
		public var delayCounter:int = 0;
		
		public var bulletStartX:Number;
		public var bulletStartY:Number;
		public var bulletEndX:Number;
		public var bulletEndY:Number;
		public var bulletX:Number;
		public var bulletY:Number;
		public var bulletDistance:Number;
		//public var bulletSpeed:Number = 10;
		public var bulletDelay:Number = 20;
		public var bulletCounter:Number = 20;
		//public var bulletDmg
		public var bullet:BossBullet;
		public var bullets:Array = [];
		
		public var enemyTankBody:enemyTankMC;
		public function EnemyTank()
		{
			
			enemyTank = new Sprite();
			//enemyTankBody = new Bitmap(new enemyTankBodyImg(0,0));
			enemyTankBody = new enemyTankMC();
			enemyTank.addChild(enemyTankBody);
			//enemyTankCannon = new Bitmap(new enemyTankCannon(0,0));
			//enemyTank.addChild(enemyTankCannon);
			
			addChild(enemyTank);
		}
		public function setCoordinates(X:Number,Y:Number):void
		{
			XLocation = X;
			YLocation = Y;
			
			enemyTank.x = XLocation + 2;
			enemyTank.y = YLocation + 2;
			
			moveDetectionArea = new Sprite();
			detectionArea = new Sprite();
			//fireArea = new Sprite();
			//moveDetectionArea.graphics.lineStyle(3,0x00ff00);
			moveDetectionArea.graphics.drawCircle(XLocation + enemyTankBody.width/2 ,YLocation + enemyTankBody.height/2, 350); 
			
			//fireArea.graphics.beginFill(0x0000FF);
			//detectionArea.graphics.drawRect(XLocation ,YLocation,100,100);
			detectionArea.graphics.drawCircle(XLocation + enemyTankBody.width/2 ,YLocation + enemyTankBody.height/2, 200);
			//fireArea.graphics.drawCircle(XLocation + enemyTankBody.width/2 ,YLocation + enemyTankBody.height/2, 2);
			//detectionArea.graphics.endFill();
			//detectionArea.x = XLocation;
			//detectionArea.y = YLocation
			//detectionArea.alpha = 0;
			//enemyTank.addChild(moveDetectionArea);
			//enemyTank.addChild(detectionArea);
			addChild(moveDetectionArea);
			addChild(detectionArea);
			//addChild(fireArea);
		}
		
		public function moveEnemy(endX:int,endY:int):void
		{
			newDirectionDelay--;
			if(newDirectionDelay <= 0)
			{
				endLocationX = endX ;
				endLocationY = endY ;
				beginLocationX = XLocation + enemyTankBody.width/2;
				beginLocationY = YLocation+ enemyTankBody.height/2;
				
				
				var dx:Number = beginLocationX - endX;
				var dy:Number = beginLocationY - endY;
				
				distance = Math.sqrt(dx*dx + dy*dy);
				if(distance >= 100)
				{
				moves = Math.floor(Math.abs(distance/speed));
				// modife for bullet effect
				nextX = (endLocationX - beginLocationX)/moves;
				nextY = (endLocationY - beginLocationY)/moves;
			}
			newDirectionDelay = 100;
			}
		}
		public function moveToNextPoint():void
		{
			if(moves>0) 
			{ 
				if(distance >220)
				{
				enemyTank.x +=  nextX;
				XLocation = enemyTank.x;
				enemyTank.y +=  nextY;
				YLocation = enemyTank.y;
				
				moveDetectionArea.x += nextX;
				moveDetectionArea.y += nextY;
				detectionArea.x += nextX;
				detectionArea.y += nextY;
				
				moves--;
				}
			}
			else 
			{
				finished = true;
				beginLocationX = endLocationX;
				beginLocationY = endLocationY;
			}
		}
		public function setRotationRad(x:Number,y:Number):void
		{
			enemyBodyRadAngle = Math.atan2(y,x);
		}
		public function rotateEnemyTankBody():void
		{
			tankAngle = (enemyBodyRadAngle)*(180/Math.PI) + 180;
			enemyTankBody.rotation = tankAngle;
		}
		
		public function fire(endLocationX,endLocationY):void
		{
			//trace("fire");
			var startLocationX:int;
			var startLocationY:int;
			startLocationX = XLocation;
			startLocationY = YLocation;
			
			
			bullet = new BossBullet();
						
						
			addChild(bullet);
			bullet.setCoordinates(startLocationX,startLocationY,endLocationX,endLocationY);
			bullets.push(bullet); 
		}
		public function bulletNextLocation(pos:int):void
		{
			bullets[pos].moveToNextPoint();
		}
		public function removeBullet(pos:int):void
		{
			removeChild(enemyBullets[pos]);
			enemyBullets.splice(pos,1);
		}
		
	}
}














