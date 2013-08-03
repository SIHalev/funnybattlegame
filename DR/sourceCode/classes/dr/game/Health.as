package sourceCode.classes.dr.game
{
	import flash.display.Bitmap;
	
	public class Health extends SimpleGameObjects
	{
		public var health:Bitmap;
		public var heal:int = 20;
		// Heal amount.
		
		public function Health()
		{
			health = new Bitmap(new healthImg(0,0));
			health.scaleX = 0.6;
			health.scaleY = 0.6;
			addChild(health);
		}
		// Set mine X and Y, add the mine to the screen.
		override public function setCoordinates(X:int,Y:int):void
		{
			XLocation = X;
			YLocation = Y;
			health.x = XLocation;
			health.y = YLocation;
		}
		override public function setRotation(angle:int):void
		{
			health.rotation = angle;
		}
	}
}