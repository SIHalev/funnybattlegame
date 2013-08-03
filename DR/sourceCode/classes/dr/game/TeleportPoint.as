package sourceCode.classes.dr.game
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	
	public class TeleportPoint extends SimpleGameObjects
	{
		public var teleportPoint:Bitmap;
		public var teleportArea:Sprite;
		
		public function TeleportPoint()
		{
			teleportPoint = new Bitmap(new teleportPointImg(0,0));
			addChild(teleportPoint);
		}
		// Set mine X and Y, add the mine to the screen.
		override public function setCoordinates(X:int,Y:int):void
		{
			/*teleportArea = new Sprite();
			teleportArea.graphics.drawCircle(X + teleportPoint.width/2, Y + teleportPoint.height/2, 75);
			teleportArea.graphics.beginFill(0x0000FF);
			teleportArea.graphics.endFill();
			teleportArea.alpha = 0.5;
			addChild(teleportArea);*/
			
			XLocation = X;
			YLocation = Y;
			teleportPoint.x = XLocation;
			teleportPoint.y = YLocation;
		}
		override public function setRotation(angle:int):void
		{
			teleportPoint.rotation = angle;
		}
	}
}