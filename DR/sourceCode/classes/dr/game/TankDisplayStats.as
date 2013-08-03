package sourceCode.classes.dr.game
{
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	// This extends Sprite because i want to add childs on the screen.
	public class TankDisplayStats extends Sprite
	{
		private var upHolder:Bitmap;
		private var downHolder:Bitmap;
		// This is the up Holder.
		private var redBar:Bitmap; 
		// This is the tank HP bar.
		private var blueBar:Bitmap;
		// This is the tank ST bar. // Slow Time.
		private var greyBar1:Bitmap; 
		private var greyBar2:Bitmap;
		private var HPtext:Bitmap;
		private var STtext:Bitmap;
		
		private var normalWeapon:Bitmap;
		private var laserWeapon:Bitmap;
		private var shockWeapon:Bitmap;
		private var cannonWeapon:Bitmap;
		private var weaponSwitcherImg:Bitmap;
		
		public var currWeapon:int = 0;
		public const firstWeapon:int = 0;
		public const lastWeapon:int = 3; // 4 weapons in the game.
		
		public var haveNormalWeapon:Boolean = true;
		public var haveLaserWeapon:Boolean = false;
		public var haveShockWeapon:Boolean = false;
		public var haveCannonWeapon:Boolean = false;
		
		public var ammoField:TextField;
		public var scoreField:TextField;
		public var textFormat:TextFormat;
		
		// When red or blue bar are scaled, this will be behind them. I do this only for visual effect.
		public function TankDisplayStats()
		{
			// Getting the images.
			// up
			upHolder = new Bitmap(new upRampImg(0,0));
			redBar   = new Bitmap(new redBarImg(0,0));
			blueBar  = new Bitmap(new blueBarImg(0,0));
			greyBar1 = new Bitmap(new greyBarImg(0,0));
			greyBar2 = new Bitmap(new greyBarImg(0,0));
			HPtext = new Bitmap(new HPtextImg(0,0));
			STtext = new Bitmap(new STtextImg(0,0));
			textFormat = new TextFormat();
			ammoField = new TextField();
			scoreField = new TextField();
			
			
			// down
			downHolder = new Bitmap(new downRampImg(0,0));
			normalWeapon = new Bitmap(new normalWeaponImg(0,0));
			laserWeapon = new Bitmap(new laserWeaponImg(0,0));
			shockWeapon = new Bitmap(new shockWeaponImg(0,0));
			cannonWeapon = new Bitmap(new cannonWeaponImg(0,0));
			weaponSwitcherImg = new Bitmap(new weaponSwitchImg(0,0));
			textFormat.size = 15;
			textFormat.color = 0xFFFF00;
			textFormat.font = "Arial";
			ammoField.text = "Ammo: ";
			ammoField.setTextFormat(textFormat);
			scoreField.text = "Score: ";
			scoreField.setTextFormat(textFormat);
			
			//trace(normalWeapon.height); 45 output
			downHolder.y = 480 - downHolder.height;
			var weaponY:Number = 480 - downHolder.height/2 - 22.5;
			normalWeapon.y = weaponY;
			normalWeapon.x = downHolder.x + 10;
			laserWeapon.y = weaponY;
			laserWeapon.x = normalWeapon.x + 70;
			shockWeapon.y = weaponY;
			shockWeapon.x = laserWeapon.x + 70;
			cannonWeapon.y = weaponY;
			cannonWeapon.x = shockWeapon.x + 70;
			
			weaponSwitcherImg.y = weaponY;
			weaponSwitcherImg.x = normalWeapon.x;
			
			// Simple calculations for bars...etc, position.
			redBar.x = 10;
			redBar.y = upHolder.height/2 - redBar.height;
			greyBar1.x = redBar.x;
			greyBar1.y = redBar.y;
			
			blueBar.x = 10;
			blueBar.y = upHolder.height/2 + 5;
			greyBar2.x = blueBar.x;
			greyBar2.y = blueBar.y;
			
			HPtext.x = redBar.width + 20;
			HPtext.y = redBar.y - 5;
			
			STtext.x = blueBar.width + 20;
			STtext.y = blueBar.y - 5;
			ammoField.x = 550;
			ammoField.y = 10;
			//ammoField.y = ;
			scoreField.x = 450;
			scoreField.y = 10;
			//scoreFiled.y = ;
			
			// Adding the childrens to the screen.
			addChild(upHolder);
			addChild(greyBar1);
			addChild(greyBar2);
			addChild(redBar);
			addChild(blueBar);
			addChild(HPtext);
			addChild(STtext);
			addChild(ammoField);
			addChild(scoreField);
			//
			addChild(downHolder);
			addChild(normalWeapon);
			addChild(laserWeapon);
			addChild(shockWeapon);
			addChild(cannonWeapon);
			addChild(weaponSwitcherImg);
			// weapon swithcer
			refreshWeapons();
		}
		public function setAmmo(num:int):void
		{
			var numString:String = new String(num);
			ammoField.text = "Ammo: " + numString;
			ammoField.setTextFormat(textFormat);
		}
		public function setScore(num:int):void
		{
			var numString:String = new String(num);
			scoreField.text = "Score: " + numString;
			scoreField.setTextFormat(textFormat);
		}
		public function unlockWeapon(weaponNumber:int):void
		{
			switch(weaponNumber)
			{
				case Weapons.NormalWeapon_:
					haveLaserWeapon = true;
				break;
				
				case Weapons.LaserWeapon_:
					haveLaserWeapon = true;
				break;
				
				case Weapons.ShockWeapon_:
					haveShockWeapon = true;
				break;
				
				case Weapons.CannonWeapon_:
					haveCannonWeapon = true;
				break;
			}
			refreshWeapons();
		}
		public function switchWeapon(weaponNumber:int):void
		{
			
			if((weaponNumber>=firstWeapon)&&(weaponNumber<=lastWeapon))
			{
				currWeapon = weaponNumber;
				
				switch (weaponNumber)
				{
					case Weapons.NormalWeapon_:
						weaponSwitcherImg.x = normalWeapon.x;
						break;
					case Weapons.LaserWeapon_:
						weaponSwitcherImg.x = laserWeapon.x;
						break;
					case Weapons.ShockWeapon_:
						weaponSwitcherImg.x = shockWeapon.x;
						break;
					case Weapons.CannonWeapon_:
						weaponSwitcherImg.x = cannonWeapon.x;
						break;
						//deff
				}
			} else { trace("invalid weapon number."); }
			
		}
		
		
		public function refreshWeapons():void
		{
			(haveNormalWeapon == true) ? (normalWeapon.alpha = 1):(normalWeapon.alpha = 0);
			(haveLaserWeapon == true) ? (laserWeapon.alpha = 1):(laserWeapon.alpha = 0);
			(haveShockWeapon == true) ? (shockWeapon.alpha = 1):(shockWeapon.alpha = 0);
			(haveCannonWeapon == true) ? (cannonWeapon.alpha = 1):(cannonWeapon.alpha = 0);
		}
		// fucntion scales the red bar.
		public function scaleHP(scaleSize:Number):void
		{
			//if(scaleSize>=0) // the check is in the PlayerTank class.
			
				scaleSize /= 100;
				redBar.scaleX = scaleSize;
			
		}
		public function negativeScaleHP(scaleSize:Number):void
		{
			redBar.scaleX -= scaleSize;
		}
		public function positiveScaleHP(scaleSize:Number):void
		{
			redBar.scaleX += scaleSize;
		}
		public function scaleST(scaleSize:Number):void
		{
			if(scaleSize>=0)
			{
				scaleSize /= 100;
				blueBar.scaleX = scaleSize;
			}
		}
		public function negativeScaleST(scaleSize:Number):void
		{
			blueBar.scaleX -= scaleSize;
		}
		public function positiveScaleST(scaleSize:Number):void
		{
			blueBar.scaleX += scaleSize;
		}
		
	}
}