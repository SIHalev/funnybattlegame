package sourceCode.classes.dr.game
{
	import flash.display.Bitmap;
	
	public class Chest extends SimpleGameObjects
	{
		public var chest:Bitmap;
		// Heal amount.
		
		public function Chest()
		{
			chest = new Bitmap(new chestImg(0,0));
			addChild(chest);
		}
		// Set mine X and Y, add the mine to the screen.
		override public function setCoordinates(X:int,Y:int):void
		{
			XLocation = X;
			YLocation = Y;
			chest.x = XLocation;
			chest.y = YLocation;
		}
		override public function setRotation(angle:int):void
		{
			chest.rotation = angle;
		}
	}
}