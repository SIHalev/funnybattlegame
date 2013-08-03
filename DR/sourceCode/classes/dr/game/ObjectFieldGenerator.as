package sourceCode.classes.dr.game
{
	import flash.display.Sprite;
	import flash.display.Bitmap;

	// this class generates objects.
	
	public class ObjectFieldGenerator extends Sprite
	{
		public var mine:Mine;
		public var mines:Array = [];
		public var health:Health;
		public var healths:Array = [];
		public var chest:Chest;
		public var chests:Array = [];
		public var questionMark:QuestionMark;
		public var questionMarks:Array = [];
		public var carrot:Carrot;
		public var teleportPoint:TeleportPoint;
		//public var carrots:Array = [];
		
		public function ObjectFieldGenerator() {}// empty constructor.

		public function generateRandomMines(minesNumber:int,maxX:int,maxY:int,minX:int = 0,minY:int = 0):void
		{
			for (var i:int = 0; i < minesNumber; i++)
			{
				var randX:int = Math.floor(Math.random() * maxX);
				var randY:int = Math.floor(Math.random() * maxY);
				if((randX>minX)||(randY>minY))
				{
					mine = new Mine();
					mine.setCoordinates(randX,randY);
					mines.push(mine);
					addChild(mine);
				}
			}
		}
		public function generateRandomHealths(healthsNumber:int,maxX:int,maxY:int):void
		{
			for (var i:int = 0; i < healthsNumber; i++)
			{
				var randX:int = Math.floor(Math.random() * maxX);
				var randY:int = Math.floor(Math.random() * maxY);

				health = new Health();
				health.setCoordinates(randX,randY);
				healths.push(health);
				addChild(health);
			}
		}
		public function generateRandomChests(chestsNumber:int,maxX:int,maxY:int):void
		{
			for (var i:int = 0; i < chestsNumber; i++)
			{
				var randX:int = Math.floor(Math.random() * maxX);
				var randY:int = Math.floor(Math.random() * maxY);

				chest = new Chest();
				chest.setCoordinates(randX,randY);
				chests.push(chest);
				addChild(chest);
			}
		}
		
		public function generateMine(X,Y):void
		{
			mine = new Mine();
			mine.setCoordinates(X,Y);
			mines.push(mine);
			addChild(mine);
		}
		public function generateHealth(X,Y):void
		{
			health = new Health();
			health.setCoordinates(X,Y);
			healths.push(health);
			addChild(health);
		}
		public function generateChest(X,Y):void
		{
			chest = new Chest();
			chest.setCoordinates(X,Y);
			chests.push(chest);
			addChild(chest);
		}
		public function generateCarrot(X,Y):void
		{
			carrot = new Carrot();
			carrot.setCoordinates(X,Y);
			//carrots.push(carrot);
			addChild(carrot);
		}
		public function generateQuestionMark(X,Y):void
		{
			 questionMark = new QuestionMark();
			 questionMark.setCoordinates(X,Y);
			 questionMarks.push(questionMark);
			 addChild(questionMark);
		}
		public function generateTeleportPoint(X,Y):void
		{
			teleportPoint = new TeleportPoint();
			teleportPoint.setCoordinates(X,Y);
			addChild(teleportPoint);
		}
		public function removeTeleportPoint():void
		{
			removeChild(teleportPoint);
		}
		public function getQuestionMarks():Array
		{
			return questionMarks;
		}
		public function getChests():Array
		{
			return chests;
		}
		public function getMines():Array
		{
			return mines;
		}
		public function getHealths():Array
		{
			return healths;
		}
	}
}

