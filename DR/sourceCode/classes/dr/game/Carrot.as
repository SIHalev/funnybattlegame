package sourceCode.classes.dr.game
{
	import flash.display.Bitmap;
	
	public class Carrot extends SimpleGameObjects
	{
		public var carrot:Bitmap;
		
		public function Carrot()
		{
			carrot = new Bitmap(new carrotImg(0,0));
			addChild(carrot);
		}
		// Set mine X and Y, add the mine to the screen.
		override public function setCoordinates(X:int,Y:int):void
		{
			XLocation = X;
			YLocation = Y;
			carrot.x = XLocation;
			carrot.y = YLocation;
		}
		override public function setRotation(angle:int):void
		{
			carrot.rotation = angle;
		}
	}
}