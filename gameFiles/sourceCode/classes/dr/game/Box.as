package sourceCode.classes.dr.game
{
	import flash.display.Bitmap;
	
	public class Box extends SimpleGameObjects
	{
		public var box:Bitmap;

		public function Box()
		{
			box = new Bitmap(new boxImg(0,0)); // not imported
			box.scaleX = 0.1;
			box.scaleY = 0.1;
			addChild(mine);
		}
		// Set mine X and Y, add the mine to the screen.
		override public function setCoordinates(X:int,Y:int):void
		{
			XLocation = X;
			YLocation = Y;
			box.x = XLocation;
			box.y = YLocation;
		}

		override public function destoyed():void
		{
			destroyed = true;
			// boom goes here
			effectAfterDestroy();
			//removeChild(mine);
		}
		// Set different mine angle 
		override public function effectAfterDestroy():void
		{
			// random something in the box
		}
		override public function setRotation(angle:int):void
		{
			box.rotation = angle;
		}
		
	}
}