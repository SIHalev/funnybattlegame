package sourceCode.classes.dr.game
{
	import flash.display.Bitmap;
	
	public class Mine extends SimpleGameObjects
	{
		public var mine:Bitmap;
		// how much dmg will make the mine.
		public var dmg:int = 10;
		//public var destroyed:Boolean = false;
		public var explosion:Explosion;
		// I will remember the mine X and Y coordinates.
		// Constructor.
		public function Mine()
		{
			mine = new Bitmap(new mineImg(0,0));
			mine.scaleX = 0.1;
			mine.scaleY = 0.1;
			addChild(mine);
			
			explosion = new Explosion();
			addChild(explosion);
		}
		// Set mine X and Y, add the mine to the screen.
		override public function setCoordinates(X:int,Y:int):void
		{
			XLocation = X;
			YLocation = Y;
			mine.x = XLocation;
			mine.y = YLocation;
		}
		// Set the destroyed property to true, i will check for the property when i wan't to remove the mine.
		//override... fix the sample method 
		public function destroy():void
		{
			destroyed = true;
			// boom goes here
			effectAfterDestroy();
			//removeChild(mine);
		}
		// Set different mine angle 
		override public function effectAfterDestroy():void
		{
			explosion.generateExplosions(XLocation,YLocation,4);
		}
		override public function setRotation(angle:int):void
		{
			mine.rotation = angle;
		}
		// i have them in the parrent
		/*public function getMineX():int
		{
			return mine.x
		}
		public function getMineY():int
		{
			return mine.y
		}*/
	}
}