package sourceCode.classes.dr.game
{
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import flash.display.BitmapData;

	public class PlayerTank extends Sprite 
	{
		public var realTankX:int;
		public var realTankY:int;
		public var tankBody:tankBodyMC;
		public var tankCannon:tankCannonMC;
		public var tank:Sprite = new Sprite();
		public var speed:Number = 0;
		public var maxSpeed:int = 4;
		public var tankAngle:int = 0;
		public var acceleration:Number = 1;
		public var deceleration:Number = 0.6;
		public var turnSpeed:Number = 3;
		public var nextRotation:Number = 0;
		public var nextX:Number = 0;
		public var nextY:Number = 0;
		public var currX:int;
		public var currY:int;
		public var cannonAngle:int = 0;
		public var cannonRadAngle:Number = 0;
		public var maxHP:int = 100;
		public var currHP:int = 100;
		//public var maxMoney:int = 10000; //10 000
		//public var currMoney:int = 0;
		public var score:int = 0;
		public var maxST:Number = 100;
		public var currST:Number = 100;
		
		public var currWeapon:int = 0;
		public var nextWeapon:int = 1;
		public var prevWeapon:int = 0;
		public var firstWeapon:int = 0;
		public var lastWeapon:int = 0;
		public var allWeapons:int = 3;
		
		public var normalWeaponDelay:int = 7;
		//public var laserWeaponDelay:int = 0;
		public var shockWeaponDelay:int = 20;
		public var cannonWeaponDelay:int = 20;
		
		public var counter:int = 0;
		//public var delayBullets:int = 7; //7
		public var bullet:Bullet;
		public var bullets:Array = [];
		public var laser:Laser;
		public var shock:Shock;
		public var cannonBullet:CannonBullet;
		public var cannonBullets:Array = [];
		
		public var normalWeaponAmmo:int = 100;
		public var laserWeaponAmmo:int = 200;
		public var shockWeaponAmmo:int = 30;
		public var cannonWeaponAmmo:int = 10;
		
		public function PlayerTank()
		{
			laser = new Laser();
			addChild(laser);
			shock = new Shock();
			addChild(shock);
			bullet = new Bullet();
			//tankBody = new Bitmap(new tankBodyImg(34,52.5));
			//tankCannon = new Bitmap(new tankCannonImg(0,0));
			//trace(tankBody.height); Output --> 53
			//trace(tankBody.width);  Output --> 39
			tankBody = new tankBodyMC();
			tankCannon = new tankCannonMC();
			//trace(stage.mouseX);
			tank.addChild(tankBody);
			tank.addChild(tankCannon);
			
			//tank.x = 100;
			//tank.y = 100;
			//TIP ! Dont ever,ever set cordinates in class !!!....
			
			addChild(tank);
		}
		public function unlockNextWeapon():void
		{
			if(lastWeapon<allWeapons) lastWeapon++;
		}
		public function getCurrAmmo():int
		{
			switch(currWeapon)
			{
				case Weapons.NormalWeapon_:
					return normalWeaponAmmo;
				break;
				case Weapons.LaserWeapon_:
					return laserWeaponAmmo;
				break;
				case Weapons.ShockWeapon_:
					return shockWeaponAmmo;
				break;
				case Weapons.CannonWeapon_:
					return cannonWeaponAmmo;
				break;
			}
			return 0;
		}
		public function fire(endLocationX:int,endLocationY):void
		{
			var startLocationX:int = realTankX;
			var startLocationY:int = realTankY;
			
			switch(currWeapon)
			{
				case Weapons.NormalWeapon_:
				if(normalWeaponAmmo > 0)
				{
						bullet = new Bullet();
						bullet.setRotation(cannonAngle);
						addChild(bullet);
						bullet.setCoordinates(realTankX,realTankY,endLocationX + nextX,endLocationY + nextY);
						bullets.push(bullet);
						normalWeaponAmmo--;
				}
				break;
				case Weapons.LaserWeapon_:
				if(laserWeaponAmmo > 0)
				{
					laser.setCoordinates(realTankX,realTankY,endLocationX + nextX,endLocationY + nextY);
					laserWeaponAmmo--;
				}
				break;
				case Weapons.ShockWeapon_:
				if(shockWeaponAmmo > 0)
				{
					shock.setCoordinates(realTankX,realTankY,endLocationX + nextX,endLocationY + nextY);
					shockWeaponAmmo--;
				}
				break;
				case Weapons.CannonWeapon_:
				if(cannonWeaponAmmo > 0)
				{
					cannonBullet = new CannonBullet();
					cannonBullet.setRotation(cannonAngle);
					addChild(cannonBullet);
					cannonBullet.setCoordinates(realTankX,realTankY,endLocationX + nextX,endLocationY + nextY);
					cannonBullets.push(cannonBullet); 
					cannonWeaponAmmo--;
				}
				break;
			}
		}
		public function giveAmmo():void
		{
			normalWeaponAmmo += 100;
			laserWeaponAmmo += 20;
			shockWeaponAmmo += 10;
			cannonWeaponAmmo += 5;
		}
		public function refreshLaser():void
		{
			laser.refreshL();
		}
		public function bulletNextLocation(pos:int):void
		{
			 bullets[pos].moveToNextPoint();
		}
		public function cannonBulletNextLocation(pos:int):void
		{
			cannonBullets[pos].moveToNextPoint();
		}
		public function getBullets():Array
		{
			return bullets;
		}
		public function removeBullet(pos:int):void
		{
			removeChild(bullets[pos]);
			bullets.slice(pos,1);
		}
		public function switchWeapon(wantedWeapon:int):void
		{
			if((wantedWeapon>=firstWeapon)&&(wantedWeapon<=lastWeapon))
			{
				currWeapon = wantedWeapon;
				//trace(currWeapon);
				setNextWeapon();
				setPrevWeapon();
			} else { trace("invalid weapon number."); }
		}
		public function setNextWeapon():void
		{
			nextWeapon = currWeapon + 1;
			if(nextWeapon>lastWeapon) nextWeapon = lastWeapon;
		}
		public function setPrevWeapon():void
		{
			prevWeapon = currWeapon - 1;
			if(prevWeapon < firstWeapon) prevWeapon = firstWeapon;
		}
		public function switchNextWeapon():void
		{
			switchWeapon(nextWeapon);
		}
		public function switchPrevWeapon():void
		{
			switchWeapon(prevWeapon);
		}
		public function getNextWeapon():int
		{
			return nextWeapon;
		}
		public function getPrevWeapon():int
		{
			return prevWeapon;
		}
		
		
		public function healHP(amount:Number):void
		{
			currHP += amount;
			if(currHP > maxHP) currHP = maxHP;
		}
		public function damageHP(amount:Number):void
		{
			currHP -= amount;
			if(currHP < 0) currHP = 0;
		}
		public function healST(amount:Number):void
		{
			currST += amount;
			if(currST > maxST) currST = maxST;
		}
		public function damageST(amount:Number):void
		{
			currST -= amount;
			if(currST < 0) currST = 0;
		}
		public function setTankCoordinates(setX:int,setY:int):void
		{
			tank.x = setX;
			tank.y = setY;
			currX = setX;
			currY = setY;
		}
		/*
		public function getCannonX():int
		{
			return nextX;
		}
		public function getCannonY():int
		{
			return nextY;
		}*/
		public function rotateTankBody(ang:int):void
		{
			tankAngle = ang;
			tankBody.rotation = ang;
		}
		public function getTankCannonRad(y:Number,x:Number):Number
		{
			return Math.atan2(y,x);
		}
		public function rotateTankCannon(rad:Number):void
		{
			cannonAngle = toAng(rad);
			tankCannon.rotation = toAng(rad);
		}
		public function rotateTankCannonAng(ang:int):void
		{
			cannonAngle = ang;
			tankCannon.rotation = ang;
		}
		
		public function rotateTo(ang:int):void
		{
			tankAngle += ang;
			tankBody.rotation += ang;
		}
		
		public function rotateToLeft(ang:int):void
		{
			tankAngle -= ang;
			tankBody.rotation -= ang;
			//trace(tankBody.rotation)
		}
		
		public function rotateToRight(ang:int):void
		{
			tankAngle += ang;
			tankBody.rotation += ang;
			//trace(tankBody.rotation)
		}
		
		public function getBodyAngle():int
		{
			return tankAngle;
		}
		
		public function toAng(rad:Number):Number
		{
			return (rad)*(180/Math.PI);
		}
		
		public function toRad(ang:Number):Number
		{
			return (ang)*(Math.PI/180);
		}
		
		public function getBodyRadAngle():Number
		{
			return (tankAngle)*(Math.PI/180);
		}
		
		public function getSpeed():int
		{
			return speed;
		}
		
		public function getNextRotation():Number
		{
			return nextRotation;
		}
		
		public function getRadNextRotation():Number
		{
			return toRad(nextRotation);
		}
		
		public function getSpeedX(rad:Number):Number
		{
			return Math.cos(rad) * speed; 
		}
		
		public function getSpeedY(rad:Number):Number
		{
			return Math.sin(rad) * speed; 
		}
		
		public function getSpeedXAngle(ang:Number):Number
		{
			return Math.cos((ang)*(Math.PI/180)) * speed; 
		}
		
		public function getSpeedYAngle(ang:Number):Number
		{
			return Math.sin((ang)*(Math.PI/180)) * speed; 
		}
		
		public function I_LOVE_YOU():void
		{
			trace("I_LOVE_YOU");
		}
		
		public function upKeyPressed():void
		{
			speed += acceleration;
			if (speed > maxSpeed) speed = maxSpeed;
		}
		
		public function upKeyNotPressed():void
		{
			if(speed>0) 
			{
				speed -= deceleration;
				if (speed < 0) speed = 0;
			}
		}
		
		public function downKeyPressed():void
		{
			speed -= acceleration;
			if (speed < -maxSpeed) speed = -maxSpeed;
		}
		
		public function downKeyNotPressed():void
		{
			if (speed < 0) 
			{
				speed += deceleration;
				if (speed > 0) speed = 0;
			}
		}
		
		public function leftKeyPressed():void
		{	
			nextRotation -= turnSpeed;
			//nextRotation -= speed * turnSpeed;
			// if i multiply by the speed, when taret speed is 0 (not moving) you cannot turn
		}
		
		public function rightKeyPressed():void
		{
			nextRotation += turnSpeed;
		}
	}
}