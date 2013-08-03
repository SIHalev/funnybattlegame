package sourceCode.classes.dr.game
{
	import flash.display.Sprite;
	
	public class SimpleGameObjects extends Sprite
	{
		public var destroyed:Boolean = false;
		public var XLocation:int; 
		public var YLocation:int;
		
		public function SimpleGameObjects() {}
		
		public function setCoordinates(X:int,Y:int):void
		{

		}
		public function setRotation(angle:int):void
		{
			
		}
		public function destroyObject():void
		{
			destroyed = true;
			effectAfterDestroy();
		}
		public function effectAfterDestroy():void
		{
			
		}
		public function getX():int
		{
			return XLocation;
		}
		public function getY():int 
		{
			return YLocation;
		}
	}
}