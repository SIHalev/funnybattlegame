package sourceCode.classes.dr.game
{
	import flash.display.Sprite;
	import flash.display.Bitmap;

	// this class generates mines.
	
	public class ExplosionGenerator extends Sprite
	{
		public var explosion:Explosion;
		public var explosions:Array = [];
		
		public function ExplosionGenerator() {}// empty constructor.

		public function makeExplosion(X:int,Y:int,explNum)
		{
			explosion = new Explosion();
			explosion.generateExplosions(X,Y,explNum);
			explosions.push(explosion);
			addChild(explosion);
		}
		public function makeBlueExplosion(X:int,Y:int,explNum):void
		{
			explosion = new Explosion();
			explosion.generateBlueExplosions(X,Y,explNum);
			explosions.push(explosion);
			addChild(explosion);
		}
		public function makeOrangeExplosion(X:int,Y:int,explNum):void
		{
			explosion = new Explosion();
			explosion.generateOrangeExplosions(X,Y,explNum);
			explosions.push(explosion);
			addChild(explosion);
		}
		public function makePurpleExplosion(X:int,Y:int,explNum):void
		{
			explosion = new Explosion();
			explosion.generatePurpleExplosions(X,Y,explNum);
			explosions.push(explosion);
			addChild(explosion);
		}
		public function makeBigBang(X:int,Y:int):void
		{
			explosion = new Explosion();
			explosion.generateBigBang(X,Y);
			explosions.push(explosion);
			addChild(explosion);
		}
		public function getExplosions():Array
		{
			return explosions;
		}
		public function removeExplosion(pos:int):void
		{
			if(this.contains(explosions[pos]))
			   {
				removeChild(explosions[pos]);
				explosions.slice(pos,1);
			   }
		}
	}
}

