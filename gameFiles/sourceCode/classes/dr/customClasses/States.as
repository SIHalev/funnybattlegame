package sourceCode.classes.dr.customClasses
{
	public class States
	{
		/* I will write "_" after the state,
		because in the stateMachine it's hard to see is "NewGame" a class, function or variable.
		 I will start classes with first capital letter "NewGame", functions with lower "newGame".
		 Variables will end with "_".
		 */
		public static const GameOver_:int = 0;
		public static const NewGame_:int = 1;
		public static const GamePlay_:int = 2;
		public static const GameMenu_:int = 3;
		public static const GameInstructions_:int = 4;
		public static const GameOptions_:int = 5;
		public static const GameWait_:int = 6;
		public static const GameWon_:int = 7;
		public static const GameCredits_:int = 8;
		//public static const GamePaused_:int = 3;
		//public static const SaveGame_:int = 6;
		//public static const LoadGame_:int = 7;
		//public static const GameLevelIn_:int = 9;
	}
}