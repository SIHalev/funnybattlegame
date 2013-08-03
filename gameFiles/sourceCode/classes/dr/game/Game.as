package sourceCode.classes.dr.game
{
	/// imports
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.events.KeyboardEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.ui.Mouse;

	public class Game extends MovieClip
	{
		///Key Codes
		public static const KEY_UP:int        = 38;
		public static const KEY_DOWN:int      = 40;
		public static const KEY_LEFT:int      = 37;
		public static const KEY_RIGHT:int     = 39;
		public static const KEY_W:int         = 87;
		public static const KEY_S:int         = 83;
		public static const KEY_A:int         = 65;
		public static const KEY_D:int         = 68;
		public static const KEY_SHIFT:int     = 16;
		public static const KEY_SPACEBAR:int  = 32;
		public static const KEY_Q:int         = 81;
		public static const KEY_E:int         = 69;
		public static const KEY_P:int         = 80; 
		public static const KEY_END:int 	  = 35; //27 esc
		public static const KEY_ESC:int       = 27;
		
		public var pressedButtons:Array = [];// A dynamic array - when a key is pressed i will store a bool of the keyCode.
		// just stop the frame rate and the listeners.
		///Game States
		// I will fire an event to signal the StateMachine class.
		public static const GameOver:String = "game over";
		public static const ExitGame:String = "exit game";
		public static const GamePaused:String = "game paused";
		public static const GameWon:String = "game won";
		public var gamePausedImg:Bitmap;
		//public static const MuteSound:String = "mute sound";

		
		public var mouseClick:Boolean = false;
		public var mouseDown:Boolean = false;
		public var myTank:PlayerTank;
		public var gameFieldBitmap:Bitmap;
		public var tankNumChild:int;
		public var gameLava:Bitmap;
		public var gameLavaNumIndex:int;

		//public var bullets:Array = [];
		//public var bullet:Bullet;

		public var mines:Array = [];
		public var mine:Mine;
		//public var enemies:Array = [];
		//public var enemiesBullets:Array = [];

		public var counter:int = 0;
		public var pauseCounter:int = 0;
		public var gamePaused:Boolean = false;
		public var slowTimeCounter:int = 0;
		public var slowTimeSize:int = 0;
		public var slowTime:Boolean = false;
		public var shockCounter:int = 3;
		public var shockON:Boolean = false;
		public var weaponSwitchCounter:int = 8;
		//public var checkCollision:CollisionDetector = new CollisionDetector();
		public var displayStats;
		public var displayStatsNumChild:int;
		public var cursorNumChild:int;
		public var boundsRectangle:Sprite = new Sprite();
		
		public var cursor:Cursor;
		//public var explosion:Explosion;
		//public var explosions:Array = []; // here i will store the explosions .
		
		//public var enemy:Enemy;
		//public var enemies:Array = [];
		public var tempBullet:Bullet;
		public var tempCannonBullet:CannonBullet;
		public var tempEnBullet:EnemyBullet;
		public var enemyDelayCounter:int = 0;
		public var enemiesGen:EnemiesGenerator;
		public var explosionGen:ExplosionGenerator;
		public var tempMine:Mine;
		public var tempExpl:Explosion;
		public var tempHealth:Health;
		public var tempChest:Chest;
		public var tempQMark:QuestionMark;
		public var tempEnemySeeker:EnemySeeker;
		public var tempEnemyTank:EnemyTank;
		public var enemyTanks:Array = [];
		public var tempEnemyBullet:BossBullet;
		// boss
		public var boss:Boss;
		public var tempBossBullet:BossBullet;
		public var bossFireCounter:int = 0;
		public var bossFireDelay:int = 10;
		public var bossFireRight:Boolean = true;
		public var switchDirectionDelay:int = 80;
		public var switchDirectionCounter:int = 0;
		//public var boss
		
		
		public var level:Levels;
		public var currLevel:int = 1;
		
		public var story:Story;
		public var storyCounter:int = 0;

		public function Game()
		{
			//(\___/) <-- game constructor
			//(='.'=)
		}
		public function newGame():void
		{
			gameLava = new Bitmap(new lavaTexture(0,0));
			gameLava.name = "gameLava";
			addChild(gameLava);
			gameLavaNumIndex = this.getChildIndex(this.getChildByName("gameLava"));
			
			gamePausedImg = new Bitmap(new pauseImg(0,0));
			gamePausedImg.x = 320 - gamePausedImg.width/2;
			gamePausedImg.y = 240 - gamePausedImg.height/2;
			//explosion = new Explosion();
			displayStats  = new TankDisplayStats();
			displayStats.name = "displayStats";
			// adding weapons
			displayStats.haveNormalWeapon = true;//////////////////////////////////////////////////////////////////////////
			//displayStats.haveLaserWeapon = true;
			//displayStats.haveShockWeapon = true;
			//displayStats.haveCannonWeapon = true;
			displayStats.refreshWeapons();
			
			myTank = new PlayerTank();
			//create new instance of PlayerTank class.
			myTank.name = "myTank";
			// set the instance name, i will use it to find what number is that child.
			myTank.x = 320;
			myTank.y = 240;
			myTank.realTankX = 320;
			myTank.realTankY = 240;
			//set tank coordinates 320x240 is the midgle of the screen.
			
			gameFieldBitmap = new Bitmap(new gameField4Img(0,0));
			//gameFieldBitmap.scaleX = 3;
			//gameFieldBitmap.scaleY = 3;
			// gameFiled2Img // creates the game field img.
			addChild(gameFieldBitmap);
			addChild(myTank);
			addChild(myTank.laser);
			addChild(myTank.shock);
			
			////////////////////////////////////////////////////////////////////////////////////////////
			level = new Levels;
			addChild(level);
			newLevel(currLevel);
			//
			
			//tankNumChild = this.getChildByName("myTank");
			tankNumChild = this.getChildIndex(this.getChildByName("myTank"));
	
			//trace(tankNumChild);
			//trace(this.getChildAt(1));
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN,keyDownListener);
			stage.addEventListener(KeyboardEvent.KEY_UP,keyUpListener);
			stage.addEventListener(MouseEvent.CLICK,mouseClickListener);
			stage.addEventListener(MouseEvent.MOUSE_DOWN,mouseDownListener);
			stage.addEventListener(MouseEvent.MOUSE_UP,mouseUpListener);
			stage.addEventListener(MouseEvent.MOUSE_MOVE,mouseMoveListener);
			
			/*enemy = new Enemy();
			enemy.setCoordinates(100,100);
			addChild(enemy);*/
			
			
			/*
			enemiesGen = new EnemiesGenerator();
			addChild(enemiesGen);*/
			
			explosionGen = new ExplosionGenerator();
			addChild(explosionGen);
			
			addChild(displayStats);
			displayStatsNumChild = this.getChildIndex(this.getChildByName("displayStats"));
			//trace(displayStatsNumChild);
			//
			cursor = new Cursor();
			cursor.name = "cursor";
			Mouse.hide();
			
			addChild(cursor);
			cursorNumChild = this.getChildIndex(this.getChildByName("cursor"));
			
			story = new Story();
			
			addChild(story);
			
			story.moveToNextStory();
			
			
		}
	
		public function runGame():void
		{
			checkForPause();
			if((slowTimeCounter >= slowTimeSize)&&(!gamePaused))
			{
				input();
				update();
				collisions();
				render();
				endGame();
				slowTimeCounter = 0;
			} 
			else 
			{
				slowTimeCounter++;
			}
		}
		public function checkForPause():void
		{
			pauseCounter++;
			if(pauseCounter >=5)
			{
				if(pressedButtons[KEY_P])
				{
					gamePaused = !gamePaused;
					pauseCounter = 0;
				}
				if(gamePaused == true)
				{
					addChild(gamePausedImg);
				}
				else
				{
					if(this.contains(gamePausedImg))
					   {
						   removeChild(gamePausedImg);
					   }
				}
			}
		}
		public function input():void
		{
			
			if(pressedButtons[KEY_END] || pressedButtons[KEY_ESC])
			{
				dispatchEvent(new Event(GameOver));
			}
			if(pressedButtons[KEY_SPACEBAR])
			{
				if((story.finished == false)&&(storyCounter >= 5))
				{
					story.moveToNextStory();
					storyCounter = 0
				}
			}

			if(pressedButtons[KEY_UP] || pressedButtons[KEY_W])
			{
				myTank.upKeyPressed();
				//myTank.forwardMotion();
			}
			if(! pressedButtons[KEY_UP] || ! pressedButtons[KEY_W])
			{
				myTank.upKeyNotPressed();
				//myTank.
			}
			if(pressedButtons[KEY_DOWN] || pressedButtons[KEY_S])
			{
				myTank.downKeyPressed();
				//myTank.backwardMotion();
			}
			if(! pressedButtons[KEY_DOWN] || ! pressedButtons[KEY_S])
			{
				myTank.downKeyNotPressed();
				//myTank.
			}
			if(pressedButtons[KEY_LEFT] || pressedButtons[KEY_A])
			{
				myTank.leftKeyPressed();
				//myTank.leftMotion();
			}
			if(pressedButtons[KEY_RIGHT] || pressedButtons[KEY_D])
			{
				myTank.rightKeyPressed();
				//myTank.rightMotion();
			}
			if(pressedButtons[KEY_SHIFT]&&(myTank.currST>0))
			{
				slowTimeSize = 1;
				myTank.currST--;
			}
			else 
			{
				slowTimeSize = 0;
				if(myTank.currST < myTank.maxST)
				{
					myTank.currST += 0.2;
				}
			}
			weaponSwitchCounter--;
			if(weaponSwitchCounter <= 0)
			{
				if(pressedButtons[KEY_Q])
				{
					
					myTank.switchWeapon(myTank.getPrevWeapon());
					displayStats.switchWeapon(myTank.currWeapon);
				}
				if(pressedButtons[KEY_E])
				{
					
					myTank.switchWeapon(myTank.getNextWeapon());
					displayStats.switchWeapon(myTank.currWeapon);
				}
				weaponSwitchCounter = 8;
			}
		}
		public function update():void
		{
			// update Ammo.
			displayStats.setAmmo(myTank.getCurrAmmo());
			// update Score.
			displayStats.setScore(myTank.score);
			// update slow time bar (blue one).
			displayStats.scaleST(myTank.currST);
			// update health bar.
			displayStats.scaleHP(myTank.currHP);
			
			if(story.finished == false)
			{
				storyCounter++;
			}
			// Calculating nextX and nextY.
			var tankRadians:Number = myTank.getRadNextRotation();
			myTank.nextX +=  myTank.getSpeedX(tankRadians);
			myTank.nextY +=  myTank.getSpeedY(tankRadians);
			// update tank cannon angle.
			myTank.cannonRadAngle = myTank.getTankCannonRad(stage.mouseY - myTank.y,stage.mouseX - myTank.x);
			//rotating tank cannon.
			myTank.rotateTankCannon(myTank.cannonRadAngle);
			
			// Change explosions alpha and removing them.
			for(var zzi:int = explosionGen.explosions.length -1; zzi>= 0; zzi--)
			{
				explosionGen.explosions[zzi].setAlpha();
				tempExpl = explosionGen.explosions[zzi];
				if(tempExpl.getAlpha() <= 0)
				{
						explosionGen.removeExplosion(zzi); 
						// If alpha is zero or less i remove the explosion.
				}
			}
			
			// mouse Down logic, Fire bullets from the current weapon or updating laser. 
			if (mouseDown == true)
			{
				counter++;
					if(myTank.currWeapon == Weapons.NormalWeapon_)
					{
						if(counter >= myTank.normalWeaponDelay)
						{
							myTank.fire(stage.mouseX,stage.mouseY);
							addChild(myTank.bullet);
							counter = 0;
						}
					}
					if(myTank.currWeapon == Weapons.CannonWeapon_)
					{
						if(counter >= myTank.cannonWeaponDelay)
						{
							myTank.fire(stage.mouseX,stage.mouseY);
							addChild(myTank.cannonBullet);
							counter = 0;
						}
					}
					if(myTank.currWeapon == Weapons.ShockWeapon_)
					{
						if(shockON == false)
						{
							if(counter >= myTank.shockWeaponDelay)
							{
								myTank.fire(stage.mouseX,stage.mouseY);
								myTank.shock.finished = false;
								counter = 0;
								shockON = true;
								shockCounter = 3;
							}
						}
					}
					if(shockON == true)
					{
						shockCounter--;
						if(shockCounter<=0)
						{
							myTank.shock.hideShock();
							shockON = false;
						}
					}
					if(myTank.currWeapon == Weapons.LaserWeapon_)
					{
						myTank.fire(stage.mouseX,stage.mouseY);
						myTank.laser.finished = false;
						if(myTank.laserWeaponAmmo <= 0)
						{
							myTank.laser.hideLaser();
						}
					}
			}
			
			if((mouseDown == false)||(myTank.currWeapon != Weapons.LaserWeapon_))
				{
					myTank.laser.hideLaser(); 
				}
			// boss begin.
			
			if(level.containsBoss == true)
			{
				
				boss = level.enemiesGen.boss;
				bossFireCounter++;
				switchDirectionCounter++;
				
				if(switchDirectionCounter >= 300)
					{
						bossFireRight = !bossFireRight;
						switchDirectionCounter = 0;
					}
					if(bossFireRight == true)
					{
						boss.rotateCannon(0.5);
					} 
					else
					{
						boss.rotateCannon(-0.5);
					}
					
				if(bossFireCounter >= bossFireDelay)
				{
					boss.fire();
					bossFireCounter = 0;
				}
				if(boss.bossBody.hitTestObject(myTank.tankBody))
				{
					myTank.damageHP(100);
				}
				for (var nn:int = boss.bossBullets.length - 1; nn >= 0; nn--)
					{
						tempBossBullet = boss.bossBullets[nn];
						if(tempBossBullet.finished == true) 
						{
							if(this.contains(boss.bossBullets[nn]))
							{
								boss.removeBullet(nn);
							}
						}
						if (tempBossBullet.finished == false)
						{
								boss.bossBulletNextLocation(nn);
						} 
						if(tempBossBullet.hitTestObject(myTank.tankBody))
						{
							//trace(tempBossBullet.XLocation);
							//trace(tempBossBullet.YLocation);
							explosionGen.makePurpleExplosion(tempBossBullet.XLocation,tempBossBullet.YLocation, 5);
							tempBossBullet.finished = true;
							myTank.damageHP(5);
							//myTank.damageHP(tempBossBullet.dmg);
							
						}
					}
					for(var nes:int = myTank.bullets.length -1; nes>=0;nes--)
				{
					tempBullet = myTank.bullets[nes];
					
						if(tempBullet.hitTestObject(boss.bossBody))
						{
							if(tempBullet.finished == false)
							{
								boss.HP -= tempBullet.dmg;
								tempBullet.finished = true;
							}
						
					}
				}
				//
				for(var ns:int = myTank.cannonBullets.length -1; ns>=0;ns--)
				{
					tempCannonBullet = myTank.cannonBullets[ns];
					
						if(tempCannonBullet.hitTestObject(boss.bossBody))
						{
							if(tempCannonBullet.finished == false)
							{
								boss.HP -= tempCannonBullet.dmg;
								tempCannonBullet.finished = true;
							}
						}
					
				}
				
					if(myTank.laser.hitTestObject(boss.bossBody) && myTank.laser.getAlpha() != 0)
					{
						boss.HP -= 1;
					}
					if(myTank.shock.hitTestObject(boss.bossBody) && myTank.shock.getAlpha() != 0)
					{
						boss.HP -= 10;
						//trace(boss.HP);
					}
					if(boss.HP <= 0)
					{
						myTank.score += 250;
						level.removeBoss();  
						explosionGen.makeBigBang(boss.XLocation - 50,boss.YLocation - 50);
						//explosionGen.makeExplosion(boss.XLocation,boss.YLocation,10);
						/////////////////////////////////////////////////////////////////////////////////////////
						// explosions and score and carrot.
					}
				
				
			}
			
			// boss end.
		}
		public function collisions():void
		{
			
			for(var enemiesTankAr:int = level.enemiesGen.enemyTanks.length -1; enemiesTankAr>= 0; enemiesTankAr--)
			{
				//if(tempEnemyTank.destroyed != true)
				//{
				
				tempEnemyTank = level.enemiesGen.enemyTanks[enemiesTankAr];
				
				if((myTank.hitTestObject(tempEnemyTank.moveDetectionArea)))
				{
					  
					  tempEnemyTank.rotateEnemyTankBody();
					  
					   tempEnemyTank.setRotationRad(tempEnemyTank.XLocation - myTank.realTankX,tempEnemyTank.YLocation - myTank.realTankY);
				   	   tempEnemyTank.moveEnemy(myTank.realTankX,myTank.realTankY); //320,240  
					  
					  
				}
				
				if((myTank.hitTestObject(tempEnemyTank.detectionArea))&&(tempEnemyTank.destroyed == false))
				{
					
					tempEnemyTank.bulletCounter += 1;
					if(tempEnemyTank.bulletCounter >= 20)
					{
						tempEnemyTank.fire(myTank.realTankX,myTank.realTankY);
						tempEnemyTank.bulletCounter = 0;
					}
				}
				if(myTank.hitTestObject(tempEnemyTank.enemyTank))
				{
					myTank.damageHP(15);
					tempEnemyTank.destroyed = true;
					level.enemiesGen.removeEnemyTank(enemiesTankAr);
					explosionGen.makeExplosion(tempEnemyTank.XLocation,tempEnemyTank.YLocation, 4);
				}
				//}
				
				//

				for (var bf:int = tempEnemyTank.bullets.length - 1; bf >= 0; bf--)
					{
						tempEnemyBullet = tempEnemyTank.bullets[bf];
					
						
							if(tempEnemyBullet.finished == false)
							{
								tempEnemyTank.bulletNextLocation(bf);
								if(myTank.hitTestObject(tempEnemyBullet))
								{
									if(tempEnemyTank.contains(tempEnemyBullet))
								   {
									tempEnemyBullet.finished = true;
									tempEnemyTank.removeChild(tempEnemyBullet);
									tempEnemyTank.bullets.slice(bf,1);
									myTank.damageHP(3);
									//trace(myTank.currHP);
									explosionGen.makePurpleExplosion(myTank.realTankX,myTank.realTankY,7);
								   }
							} 
							if(tempEnemyBullet.finished == true)
							{
								   if(tempEnemyTank.contains(tempEnemyBullet))
									{
								   		tempEnemyTank.removeChild(tempEnemyBullet);
										tempEnemyTank.bullets.slice(bf,1);
									 }
							}
						}
						
					}
					
					if(tempEnemyTank.destroyed == false)
					{
					 tempEnemyTank.moveToNextPoint();
					}
					////////////////////////////////////////////////////////
					if(tempEnemyTank.destroyed == false)
					   {
					
					
					if(myTank.laser.hitTestObject(tempEnemyTank.enemyTank))
					{
							    tempEnemyTank.HP -= 1;
					}
				   if(myTank.shock.hitTestObject(tempEnemyTank.enemyTank))
				   {
					   tempEnemyTank.HP -= 10;
				   }
					for(var n:int = myTank.bullets.length -1; n>=0;n--)
					{
					tempBullet = myTank.bullets[n];
					
						if(this.contains(tempBullet))
						{
							if(tempBullet.hitTestObject(tempEnemyTank.enemyTank))
							{
							  tempBullet.finished = true;
							 tempEnemyTank.HP -= 5;
							
							}
						}
						
					} 
				for(var cb:int = myTank.cannonBullets.length -1; cb>=0;cb--)
				{
					tempCannonBullet = myTank.cannonBullets[cb]
				if(this.contains(tempCannonBullet))
					{
						if(tempCannonBullet.hitTestObject(tempEnemyTank.enemyTank))
						{
							tempCannonBullet.finished = true;
						  tempEnemyTank.HP -= 50;
						}
					}
				}
				
				if(tempEnemyTank.HP <= 0)
					{
						tempEnemyTank.destroyed = true;
						level.enemiesGen.removeEnemyTank(enemiesTankAr);
						explosionGen.makeExplosion(tempEnemyTank.XLocation,tempEnemyTank.YLocation, 4);
					}
					   }
					///////////////////////////////////////////////////////
					
				
			}

			
			
			// Seekers.
			var tempEnemySeeker:EnemySeeker;
			for(var enemiesSeekerAr:int = level.enemiesGen.enemySeekers.length -1; enemiesSeekerAr>= 0; enemiesSeekerAr--)
			{
				
				tempEnemySeeker = level.enemiesGen.enemySeekers[enemiesSeekerAr];
				if(myTank.hitTestObject(tempEnemySeeker.moveDetectionArea))
				   {
					   tempEnemySeeker.rotateEnemySeeker();
					   tempEnemySeeker.setRotationRad(tempEnemySeeker.XLocation - myTank.realTankX,tempEnemySeeker.YLocation - myTank.realTankY);
				   	   tempEnemySeeker.moveEnemy(myTank.realTankX,myTank.realTankY); //320,240  
					   //trace(tempEnemySeeker.distance);
				   }
			}
			for(var enemiesSeekerAr2:int = level.enemiesGen.enemySeekers.length -1; enemiesSeekerAr2>= 0; enemiesSeekerAr2--)
			{
				tempEnemySeeker = level.enemiesGen.enemySeekers[enemiesSeekerAr2];
				if(tempEnemySeeker.destroyed == false)
						{
						if(myTank.tankBody.hitTestObject(tempEnemySeeker.seekerHitArea))
						{
						//trace(tempEnemySeeker.finished);
						
								myTank.damageHP(tempEnemySeeker.dmg); 
								
								tempEnemySeeker.destroyed = true;
								explosionGen.makeExplosion(tempEnemySeeker.endLocationX,tempEnemySeeker.endLocationY,6);
								level.enemiesGen.removeEnemySeeker(enemiesSeekerAr2);
						}
						if((myTank.laser.hitTestObject(tempEnemySeeker.seekerHitArea))||(myTank.shock.hitTestObject(tempEnemySeeker.seekerHitArea)))
						   {
							    tempEnemySeeker.destroyed = true;
								explosionGen.makeExplosion(tempEnemySeeker.XLocation,tempEnemySeeker.YLocation,6);
								level.enemiesGen.removeEnemySeeker(enemiesSeekerAr2);
						   }
				for(var nono:int = myTank.bullets.length -1; nono>=0;nono--)
				{
				tempBullet = myTank.bullets[nono];
				
					if(this.contains(tempBullet))
					{
						if(tempBullet.hitTestObject(tempEnemySeeker.seekerHitArea))
						{
						  myTank.score += 5;
						 tempEnemySeeker.destroyed = true;
								explosionGen.makeExplosion(tempEnemySeeker.XLocation,tempEnemySeeker.YLocation,6);
								level.enemiesGen.removeEnemySeeker(enemiesSeekerAr2);
						 // mines.slice(m,1)
						}
					}
					
				}
				for(var ccb:int = myTank.cannonBullets.length -1; ccb>=0;ccb--)
				{
					tempCannonBullet = myTank.cannonBullets[ccb]
				if(this.contains(tempCannonBullet))
					{
						if(tempCannonBullet.hitTestObject(tempEnemySeeker.seekerHitArea))
						{
							myTank.score += 5;
							tempCannonBullet.finished = true;
							tempEnemySeeker.destroyed = true;
							explosionGen.makeExplosion(tempEnemySeeker.XLocation,tempEnemySeeker.YLocation,6);
							level.enemiesGen.removeEnemySeeker(enemiesSeekerAr2);
						  //mines.slice(m,1)
						}
					}
				}
					}
				if(tempEnemySeeker.destroyed == false)
				{
					tempEnemySeeker.moveToNextPoint();
				}
			}
			//

			if(!gameFieldBitmap.hitTestObject(myTank))
			{
				myTank.damageHP(1);
			}
			if(level.containsGCarrot == true)
			{
				if(myTank.tankBody.hitTestObject(level.objectsField.carrot))
				{
					   gameWon();
				}
			}
			if(level.containsTPoint == true)
			{
				if(myTank.tankBody.hitTestObject(level.objectsField.teleportPoint))
				{
					myTank.score += 100;
					newLevel(++currLevel);
					trace(currLevel);
					//level.removePoint();
				}
			}
			// Cheking for mines destroying mines.
			var mines:Array = level.objectsField.getMines();
			for (var m:int = mines.length - 1; m>= 0; m--)
			{
				tempMine = mines[m];
				if (myTank.tankBody.hitTestObject(tempMine))
				{
					if (tempMine.destroyed != true)
					{
						explosionGen.makeExplosion(tempMine.XLocation,tempMine.YLocation,4);
						myTank.damageHP(tempMine.dmg); 
						
						tempMine.destroyed = true;
						level.objectsField.removeChild(tempMine);
						mines.slice(m,1);
					}
				}
				
				if(myTank.laser.hitTestObject(tempMine) || myTank.shock.hitTestObject(tempMine))
				{
					if(level.objectsField.contains(tempMine))
					{
						myTank.score += 5;
					    explosionGen.makeExplosion(tempMine.XLocation,tempMine.YLocation,4);
						tempMine.destroyed = true;
						level.objectsField.removeChild(tempMine);
						mines.slice(m,1)
				    }
				}
				// Destroying mines by Bullets and Lasers.
				for(var ni:int = myTank.bullets.length -1; ni>=0;ni--)
				{
				tempBullet = myTank.bullets[ni];
				
					if(this.contains(tempBullet) && level.objectsField.contains(tempMine))
					{
						if(tempBullet.hitTestObject(tempMine))
						{
						  myTank.score += 5;
						  tempBullet.finished = true;
						  tempMine.destroyed = true; 
						  explosionGen.makeExplosion(tempMine.XLocation,tempMine.YLocation,4);
						  level.objectsField.removeChild(tempMine);
						  mines.slice(m,1)
						}
					}
					
				}
				for(var cbi:int = myTank.cannonBullets.length -1; cbi>=0;cbi--)
				{
					tempCannonBullet = myTank.cannonBullets[cbi]
				if(this.contains(tempCannonBullet) && level.objectsField.contains(tempMine))
					{
						if(tempCannonBullet.hitTestObject(tempMine))
						{
						  myTank.score += 5;
						  tempCannonBullet.finished = true;
						  tempMine.destroyed = true; 
						  level.objectsField.removeChild(tempMine);
						  mines.slice(m,1)
						}
					}
				}
			}
			var chests:Array = level.objectsField.getChests();
			for (var ch:int = chests.length - 1; ch >= 0; ch--)
			{
				tempChest = chests[ch];
				if (myTank.tankBody.hitTestObject(tempChest))
				{
					if (tempChest.destroyed != true)
					{
						myTank.score += 20;
						myTank.giveAmmo();
						tempChest.destroyed = true;
						level.objectsField.removeChild(tempChest);
						chests.slice(ch,1);
					}
				}
			}
			var healths:Array = level.objectsField.getHealths();
			
			for (var h:int = healths.length - 1; h >= 0; h--)
			{
				tempHealth = healths[h];
				if (myTank.tankBody.hitTestObject(tempHealth))
				{
					if (tempHealth.destroyed != true)
					{
						myTank.score += 5;
						myTank.healHP(tempHealth.heal);
						tempHealth.destroyed = true;
						level.objectsField.removeChild(tempHealth);
						healths.slice(h,1);
					}
				}
			}
			if(level.containsQMark == true)
			{
				var qMarks:Array = level.objectsField.getQuestionMarks();
				for (var q:int = qMarks.length - 1; q >= 0; q--)
				{
					tempQMark = qMarks[q];
					if (myTank.tankBody.hitTestObject(tempQMark))
					{
						if (tempQMark.destroyed != true)
						{
							myTank.score += 30;
							myTank.unlockNextWeapon();
							displayStats.unlockWeapon(myTank.lastWeapon);
							//displayStats.haveLaserWeapon = true;
				//displayStats.haveShockWeapon = true;
				//displayStats.haveCannonWeapon = true;
							tempQMark.destroyed = true;
							level.objectsField.removeChild(tempQMark);
							qMarks.slice(q,1);
						}
					}
				}
			}
			
			
			var tempEnemy:Enemy;
			for(var enemiesAr:int = level.enemiesGen.enemies.length -1; enemiesAr>= 0; enemiesAr--)
			{
				tempEnemy = level.enemiesGen.enemies[enemiesAr];
				for(var nes:int = myTank.bullets.length -1; nes>=0;nes--)
				{
					tempBullet = myTank.bullets[nes];
					if(level.enemiesGen.contains(tempEnemy))
					{
						if(tempBullet.hitTestObject(tempEnemy.enemy))
						{
							if(tempBullet.finished == false)
							{
								tempEnemy.HP -= tempBullet.dmg;
								tempBullet.finished = true;
							}
						}
					}
				}
				//
				for(var ns:int = myTank.cannonBullets.length -1; ns>=0;ns--)
				{
					tempCannonBullet = myTank.cannonBullets[ns];
					if(level.enemiesGen.contains(tempEnemy))
					{
						if(tempCannonBullet.hitTestObject(tempEnemy.enemy))
						{
							if(tempCannonBullet.finished == false)
							{
								tempEnemy.HP -= tempCannonBullet.dmg;
								tempCannonBullet.finished = true;
							}
						}
					}
				}
				//
				if(level.enemiesGen.contains(tempEnemy))
				{
					if(myTank.laser.hitTestObject(tempEnemy.enemy) && myTank.laser.getAlpha() != 0)
					{
						tempEnemy.HP -= 1;
					}
					if(myTank.shock.hitTestObject(tempEnemy.enemy) && myTank.shock.getAlpha() != 0)
					{
						tempEnemy.HP -= 10;
						//trace(tempEnemy.HP);
					}
				}
				//Check for enemy bullets.
				for(var enb:int = tempEnemy.enemyBullets.length -1;enb>=0;enb--)
				{
					tempEnBullet = tempEnemy.enemyBullets[enb];
					if(tempEnBullet.hitTestObject(myTank.tankBody))
					{
						if((tempEnBullet.finished == false)&&(tempEnemy.contains(tempEnBullet)))
						{
								myTank.damageHP(1); 
								explosionGen.makeBlueExplosion(tempEnBullet.endLocationX,tempEnBullet.endLocationY,6);
								tempEnBullet.finished = true;
						}
					}
				}
			}
			}
			
		public function render():void
		{
			
			var enemies:Array;
			enemies = level.enemiesGen.getEnemies();
				for(var cc:int = enemies.length -1; cc >= 0; cc--)
				{
					tempEnemy = enemies[cc];
					if(tempEnemy.HP <= 0) 
					{
						if(level.enemiesGen.contains(tempEnemy))
						   {
							   myTank.score += 50;
							   explosionGen.makeExplosion(tempEnemy.XLocation,tempEnemy.YLocation,5);
							   level.enemiesGen.enemies[cc].destroyed = true;
							   level.enemiesGen.removeEnemy(cc);
						   }
					}
				}
			
			//enemyDelayCounter++;
			var tempEnemy:Enemy;
			
			
				for(var qe:int = level.enemiesGen.enemies.length -1; qe>=0; qe--) 
				{
					tempEnemy = level.enemiesGen.enemies[qe]
					
					for (var n:int = tempEnemy.enemyBullets.length - 1; n >= 0; n--)
					{
						tempEnBullet = tempEnemy.enemyBullets[n];
						if (tempEnBullet.finished == false)
						{
								tempEnemy.enemyBulletNextLocation(n);
						} 
						if(tempEnBullet.finished == true) 
						{
							if(this.contains(tempEnemy.enemyBullets[n]))
							{
								//trace(n);
								tempEnemy.removeBullet(n);
							}
						}
					}
			}
				for(var enem:int = level.enemiesGen.enemies.length -1; enem>=0; enem--) 
				{
					tempEnemy = level.enemiesGen.enemies[enem]
					
					if(tempEnemy.delayCounter >= tempEnemy.bulletDelay)
					{
						if(tempEnemy.detectionArea.hitTestObject(myTank)) 
						{
							if(tempEnemy.destroyed == false)
							{
								
								enemies[enem].fire(myTank.realTankX,myTank.realTankY); // enemy
							}
							tempEnemy.delayCounter = 0;
						}
					}
					else
					{
						tempEnemy.delayCounter++;
					}
					
				}
				
			myTank.rotateTankBody(myTank.nextRotation);
			for (var b:int = myTank.bullets.length - 1; b >= 0; b--)
			{
				
				var tempBullet:Bullet;
				tempBullet = myTank.bullets[b];
				if (tempBullet.finished == false)
				{
					//if(this.contains(tempBullet))
					//{
						//tempBullet.setCoordinates(myTank.realTankX,myTank.realTankY,stage.mouseX + myTank.nextX,stage.mouseY + myTank.nextY);
						//tempBullet.moveToNextPoint();
						myTank.bulletNextLocation(b);
					//}
				} 
				//else
				if(tempBullet.finished == true) //if(tempBullet.moves<=0)
				{
					if(this.contains(myTank.bullets[b]))
					{
						removeChild(myTank.bullets[b]);
						myTank.bullets.slice(b,1);
					}
					//if(bullets.contains[n]) {
					// you can get bad errors if you don't check.
					//if(myTank.contains(tempBullet)) 
					//{
						//myTank.removeBullet(n);
						//explosion.generateExplosions(tempBullet.endLocationX,tempBullet.endLocationY,5);
						//addChild(explosion);
						//myTank.removeChild(tempBullet);
						//if(!this.contains(tempBullet)){
						//myTank.bullets.splice(n,1);
						
						//}
					//}
					//}
				}
			}
				for (var ner:int = myTank.cannonBullets.length - 1; ner >= 0; ner--)
				{
				
					var tempCannonBullet:CannonBullet;
					tempCannonBullet = myTank.cannonBullets[ner];
					if (tempCannonBullet.finished == false)
					{
						myTank.cannonBulletNextLocation(ner);
					} 
					if(tempCannonBullet.finished == true) 
					{
						if(this.contains(myTank.cannonBullets[ner]))
						{
							removeChild(myTank.cannonBullets[ner]);
							myTank.cannonBullets.slice(ner,1);
						}
					}
				
				}
			
			for (var i:int=0; i < this.numChildren; i++)
			{
				myTank.realTankX = myTank.nextX + 320;
				myTank.realTankY = myTank.nextY + 240;
				if ((i!=tankNumChild) && (i!=displayStatsNumChild) && (i!=cursorNumChild) && (i!=gameLavaNumIndex))
				{
					this.getChildAt(i).x =  -  myTank.nextX;
					this.getChildAt(i).y =  -  myTank.nextY;
				}
			}
			
		}
		public function newLevel(num:int):void
		{
				switch(num)
				{
					case 1:
					level.generateLevel1();
					
					break;
					case 2:
					level.generateLevel2();
					
					break;
					case 3:
					level.generateLevel3();
					break;
				}
		}
		public function gameWon():void
		{
			dispatchEvent(new Event(GameWon));
		}
		public function endGame():void
		{
			if(myTank.currHP <= 0)
			{
				dispatchEvent(new Event(GameOver));
			}
		}
		private function mouseMoveListener(e:MouseEvent):void
		{
			cursor.moveCursor(e.stageX,e.stageY);
		}
		private function keyDownListener(e:KeyboardEvent):void
		{
			pressedButtons[e.keyCode] = true;
		}
		private function keyUpListener(e:KeyboardEvent):void
		{
			pressedButtons[e.keyCode] = false;
		}
		private function mouseClickListener(e:MouseEvent):void
		{
			mouseClick = true;
		}
		private function mouseDownListener(e:MouseEvent):void
		{
			mouseDown = true;
		}
		private function mouseUpListener(e:MouseEvent):void
		{
			mouseDown = false;
		}
	}

}