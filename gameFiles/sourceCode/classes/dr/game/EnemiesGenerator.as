package sourceCode.classes.dr.game
{
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import flash.sensors.Accelerometer;
	
	public class EnemiesGenerator extends Sprite
	{
		public var enemy:Enemy;
		public var enemies:Array = [];
		public var enemyTank:EnemyTank;
		public var enemyTanks:Array = [];
		public var enemySeeker:EnemySeeker;
		public var enemySeekers:Array = [];
		public var boss:Boss;
		
		public function EnemiesGenerator()
		{}
		public function generateRandomEnemy(maxX:int,maxY:int,numEnem:int,minX:int = 0,minY:int = 0):void
		{
			for(var i:int = 0; i<numEnem ; i++)
			{
				var randX:int = Math.floor(Math.random() * maxX);
				var randY:int = Math.floor(Math.random() * maxY);
				if((randX>minX)||(randY>minY))
				{
					enemy = new Enemy();
					enemy.setCoordinates(randX,randY);
					enemies.push(enemy);
					addChild(enemy);
				}
			}
		}
		
		public function generateEnemy(X:int,Y:int):void
		{
			enemy = new Enemy();
			enemy.setCoordinates(X,Y);
			enemies.push(enemy);
			addChild(enemy);
		}
		public function getEnemies():Array
		{
			return enemies;
		}
		public function removeEnemy(pos:int):void
		{
			removeChild(enemies[pos]);
			enemies.slice(pos,1);
		}
		public function generateEnemyTank(X:int,Y:int)
		{
			enemyTank = new EnemyTank();
			enemyTank.setCoordinates(X,Y);
			enemyTanks.push(enemyTank);
			addChild(enemyTank);
		}
		public function getEnemyTanks():Array
		{
			return enemyTanks;
		}
		public function removeEnemyTank(pos:int):void
		{
			removeChild(enemyTanks[pos]);
			enemyTanks.slice(pos,1);
		}
		public function generateEnemySeeker(X:int,Y:int)
		{
			enemySeeker = new EnemySeeker();
			enemySeeker.setCoordinates(X,Y);
			enemySeekers.push(enemySeeker);
			addChild(enemySeeker);
		}
		public function getEnemySeekers():Array
		{
			return enemySeekers;
		}
		public function removeEnemySeeker(pos:int):void
		{
			removeChild(enemySeekers[pos]);
			enemySeekers.slice(pos,1);
		}
		
		public function generateBoss(X:int,Y:int)
		{
			boss = new Boss();
			boss.setCoordinates(X,Y);
			addChild(boss);
		}
		public function getBoss():Object
		{
			return boss;
		}
		public function removeBoss():void
		{
			removeChild(boss);
		}
	}
}