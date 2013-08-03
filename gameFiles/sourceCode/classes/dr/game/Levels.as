package sourceCode.classes.dr.game
{
	/// imports
	import flash.display.Sprite;
	
	///
	
	//public var gameFieldBitmap:Bitmap;
	public class Levels extends Sprite
	{
		
		public var enemiesGen:EnemiesGenerator;
		public var objectsField:ObjectFieldGenerator;
		public var containsQMark:Boolean = false;
		public var containsChest:Boolean = false;
		public var containsTPoint:Boolean = false;
		public var containsBoss:Boolean = false;
		public var containsGCarrot:Boolean = false;
		public function Levels()
		{
			
			//addChild(gameFieldBitmap);
		}
		public function generateLevel1()
		{
			objectsField = new ObjectFieldGenerator();
			enemiesGen = new EnemiesGenerator();
			enemiesGen.generateRandomEnemy(1600,1500,12,600,600);
			//enemiesGen.generateEnemyTank(500,500);
			//enemiesGen.generateEnemyTank(600,600);
			//enemiesGen.generateEnemyTank(700,700);
			
			objectsField.generateRandomMines(50,1600,1500,400,400);
			objectsField.generateChest(500,300);
			objectsField.generateChest(1000,750);
			objectsField.generateChest(1450,100);
			objectsField.generateChest(350,1000);
			objectsField.generateTeleportPoint(50,50);
			objectsField.generateQuestionMark(400,400);
			objectsField.generateQuestionMark(1500,1500);
			
			
			containsQMark = true;
			containsChest = true;
			containsTPoint = true;
			
			addChild(enemiesGen);
			addChild(objectsField);
		}
		public function generateLevel2():void
		{
			removeLevel1();
			containsQMark = true;
			containsChest = false;
			containsTPoint = true;
			containsGCarrot = false;
			enemiesGen = new EnemiesGenerator();
			objectsField = new ObjectFieldGenerator();
			objectsField.generateQuestionMark(400,400);
			//enemiesGen.generateEnemySeeker(150,150);
			
			//for(var i:int = 0; i<500;i+=100){
			//enemiesGen.generateEnemySeeker(700 - i,700); }
			//objectsField.generateCarrot(425,425);
			for(var i:int = 0; i<1000;i+=100)
			{
			//enemiesGen.generateEnemySeeker(900 - i,1050);
			enemiesGen.generateEnemySeeker(800 - i,800);
			enemiesGen.generateEnemySeeker(1200 - i,1400);
			}
			
			objectsField.generateTeleportPoint(900,1050);
			
			//
			enemiesGen.generateRandomEnemy(1600,1500,5);
			objectsField.generateRandomMines(50,1600,1500);
			objectsField.generateRandomHealths(10,1600,1500);
			enemiesGen.generateEnemyTank(700,800);
			enemiesGen.generateEnemyTank(1000,600);
			enemiesGen.generateEnemyTank(500,1250);
			//enemiesGen.generateEnemyTank(500,500);
			
			//enemiesGen.generateBoss(400,400);
			//containsBoss = true;
			//enemiesGen.generateEnemy(850,385);
//			enemiesGen.generateEnemy(710,385);
//			enemiesGen.generateEnemy(380,450);
//			enemiesGen.generateEnemy(380,315);
			objectsField.generateQuestionMark(1200,400);
			
			//enemiesGen.generateEnemyTank(500,500);
			//for(var i:int = 0; i<1000;i+=100){
			//enemiesGen.generateEnemySeeker(700 - i,700);}
			
			addChild(objectsField);
			addChild(enemiesGen);
		}
		public function generateLevel3():void
		{
			removeLevel2();
			containsQMark = false;
			containsChest = false;
			containsTPoint = false;
			containsGCarrot = true;
			////
			objectsField = new ObjectFieldGenerator();
			objectsField.generateCarrot(785,375);
			//objectsField.generateRandomHealths(35,700,700);
			enemiesGen = new EnemiesGenerator();
			//objectsField.generateRandomMines(50,1600,1500);
			objectsField.generateHealth(800,700);
			objectsField.generateHealth(800,100);
			objectsField.generateHealth(1100,800);
			objectsField.generateHealth(500,800);
			enemiesGen.generateBoss(800,400);
			containsBoss = true;
			enemiesGen.generateEnemy(850,385);
			enemiesGen.generateEnemy(710,385);
			enemiesGen.generateEnemy(780,450);
			enemiesGen.generateEnemy(780,315);
			addChild(objectsField);
			addChild(enemiesGen);
		}
		public function removeLevel1():void
		{
			if(this.contains(enemiesGen))
			{
			   removeChild(enemiesGen);
			}
			if(this.contains(objectsField))
			{
				removeChild(objectsField);  
			}
			
		}
		public function removeLevel2():void
		{
			if(this.contains(enemiesGen))
			{
				removeChild(enemiesGen);
			}
			if(this.contains(objectsField))
			{
				removeChild(objectsField);
			}
		}
		
		public function removeBoss():void
		{
			enemiesGen.removeBoss();
			containsBoss = false;
		}
		public function removePoint():void
		{
			objectsField.removeTeleportPoint();
		}
	}
	
}