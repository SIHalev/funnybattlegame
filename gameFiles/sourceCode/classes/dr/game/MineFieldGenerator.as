package sourceCode.classes.dr.game
{
	import flash.display.Sprite;
	import flash.display.Bitmap;

	// this class generates mines.
	
	public class ObjectFieldGenerator extends Sprite
	{
		public var mine:Mine;
		public var mines:Array = [];
		
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
		public function getMines():Array
		{
			return mines;
		}
	}
}

