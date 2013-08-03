package sourceCode.classes.dr.game
{
	import flash.display.Sprite;
	import flash.display.Bitmap; 

	public class EnemySeeker extends Sprite 
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
		public var dmg:int = 10;
		
		public var finished:Boolean = false;
		public var destroyed:Boolean = false;
		
		public var enemySeekerRadAngle:Number = 0;
		public var seekerAngle:int = 0;
		public var distance:Number;
		public var speed:Number = 5;
		//public var HP:Number = 100;
		public var moveDetectionArea:Sprite;
		public var seekerHitArea:Sprite;
		
		public var enemySeeker:Bitmap;
		public function EnemySeeker()
		{
			
			enemySeeker = new Bitmap(new enemySeekerImg(0,0));
			addChild(enemySeeker);
		}
		public function setCoordinates(X:Number,Y:Number):void
		{
			XLocation = X;
			YLocation = Y;
			
			enemySeeker.x = XLocation;
			enemySeeker.y = YLocation;
			
			moveDetectionArea = new Sprite();
			//moveDetectionArea.graphics.lineStyle(3,0x00ff00);
			moveDetectionArea.graphics.drawCircle(XLocation + enemySeeker.width/2 ,YLocation + enemySeeker.height/2, 300); 
			
			seekerHitArea = new Sprite();
			seekerHitArea.graphics.drawCircle(XLocation + enemySeeker.width/2 ,YLocation + enemySeeker.height/2, 30);
			addChild(moveDetectionArea);
			addChild(seekerHitArea);
		}
		
		public function moveEnemy(endX:int,endY:int):void
		{
			
				endLocationX = endX;
				endLocationY = endY;
				beginLocationX = XLocation;
				beginLocationY = YLocation;
				
				
				var dx:Number = beginLocationX - endX;
				var dy:Number = beginLocationY - endY;
				
				distance = Math.sqrt(dx*dx + dy*dy);
				moves = Math.floor(Math.abs(distance/speed));
				// modife for bullet effect
				nextX = (endLocationX - beginLocationX)/moves;
				nextY = (endLocationY - beginLocationY)/moves;
				
		}
		public function moveToNextPoint():void
		{
			if(moves>0) 
			{ 
				enemySeeker.x +=  nextX;
				XLocation = enemySeeker.x;
				enemySeeker.y +=  nextY;
				YLocation = enemySeeker.y;
				
				moveDetectionArea.x += nextX;
				moveDetectionArea.y += nextY;
				seekerHitArea.x += nextX;
				seekerHitArea.y += nextY;
				//moveArea too
				moves--;
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
			enemySeekerRadAngle = Math.atan2(y,x);
		}
		public function rotateEnemySeeker():void
		{
			seekerAngle = (enemySeekerRadAngle)*(180/Math.PI);;
			enemySeeker.rotation = seekerAngle + 180
			
		}
		
		
	}
}














