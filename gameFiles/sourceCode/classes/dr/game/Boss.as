package sourceCode.classes.dr.game
{
	import flash.display.Sprite;
	import flash.display.Bitmap;
	//import flash.display.BitmapData; 

	public class Boss extends Sprite 
	{
		public var XLocation:Number;
		public var YLocation:Number;
		public var bulletsDelay:Number = 8;
		public var HP:Number = 500;
		//public var enemy:Bitmap;
		public var bossBody:bossBodyMC;
		public var bossCannon:bossCannonMC;
		public var boss:Sprite;
		public var bossBullet:BossBullet;
		public var bossBullets:Array = [];
		public var destroyed:Boolean = false;
		public var CannonAngle:Number = 0;
		
		public var cannonNum:int = 6;
		public var cannonAngleDistance:int = 360/cannonNum;
		
		public function Boss()
		{
			//bossBody //= new Bitmap(new bossImg(0,0));
			//bossCannon
			boss = new Sprite();
			bossBody = new bossBodyMC();
			bossCannon = new bossCannonMC();
			
			boss.addChild(bossBody);
			boss.addChild(bossCannon);
			addChild(boss);
		}
		public function setCoordinates(X:Number,Y:Number):void
		{
			XLocation = X;
			YLocation = Y;
			
			boss.x = XLocation;
			boss.y = YLocation;
		}
		public function rotateCannon(ang:Number):void
		{
			CannonAngle += ang;
			bossCannon.rotation += ang;
			//trace(CannonAngle);
		}
		public function fire():void
		{
						var startLocationX:Number = XLocation;
						var startLocationY:Number = YLocation;
						var endLocationX:Number;
						var endLocationY:Number;
						
						//startLocationX = XLocation + Math.cos(toRad(CannonAngle)) * bossCannon.width/2;
						//startLocationY = YLocation + Math.sin(toRad(CannonAngle)) * bossCannon.height/2; hahahahahha :D
						/*var bossBullet2:BossBullet;
						bossBullet2 = new BossBullet();
						addChild(bossBullet2);
						*/
						
						for(var i:int =1; i<=7; i++)
						{
							bossBullet = new BossBullet();
							//startLocationX = XLocation - 8 + Math.cos(toRad(CannonAngle)) * 30;
							//startLocationY = YLocation - 8 + Math.sin(toRad(CannonAngle)) * 30;
							startLocationX = XLocation - 8 + Math.cos(toRad(CannonAngle + i*cannonAngleDistance)) * 30;
							startLocationY = YLocation - 8 + Math.sin(toRad(CannonAngle + i*cannonAngleDistance)) * 30;
							//trace(startLocationX);
							endLocationX = startLocationX + Math.cos(toRad(CannonAngle + i*cannonAngleDistance)) * 400 ;
							endLocationY = startLocationY + Math.sin(toRad(CannonAngle + i*cannonAngleDistance)) * 400 ;
							
							bossBullet.setCoordinates(startLocationX,startLocationY,endLocationX,endLocationY);
							
							addChild(bossBullet);
							bossBullets.push(bossBullet);
						}
		}
		public function bossBulletNextLocation(pos:int):void
		{
			 bossBullets[pos].moveToNextPoint();
		}
		
		public function removeBullet(pos:int):void
		{
			removeChild(bossBullets[pos]);
			bossBullets.splice(pos,1);
		}
		public function removeBoss():void
		{
			removeChild(boss);
		}
		public function toRad(ang:Number):Number
		{
			return (ang)*(Math.PI/180)
		}
		
		
	}
}














