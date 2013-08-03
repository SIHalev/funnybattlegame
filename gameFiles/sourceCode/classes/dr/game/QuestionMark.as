package sourceCode.classes.dr.game
{
	import flash.display.Bitmap;
	
	public class QuestionMark extends SimpleGameObjects
	{
		public var questionMark:Bitmap;

		public function QuestionMark()
		{
			questionMark = new Bitmap(new questionMarkImg(0,0));
			addChild(questionMark);
		}
		// Set mine X and Y, add the mine to the screen.
		override public function setCoordinates(X:int,Y:int):void
		{
			XLocation = X;
			YLocation = Y;
			questionMark.x = XLocation;
			questionMark.y = YLocation;
		}
		override public function setRotation(angle:int):void
		{
			questionMark.rotation = angle;
		}
	}
}