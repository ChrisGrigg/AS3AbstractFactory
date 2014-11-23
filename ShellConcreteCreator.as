package
{	
	import SSCommands;
	
	/**
	 * Chooses a class to invoke when communicating with chosen shell software.
	 * @author Christopher Grigg
	 */
	public class ShellConcreteCreator extends ShellAbsractCreator
	{
		/**
		 * Invokes a method in the chosen shell class.
		 * Establishes if the app is running in dev or RC mode.
		 * @return Boolean
		 */
		override public function get shellMode():Boolean
		{
			return this._commands.shellMode;
		}
		
		/**
		 * Invokes a method in the chosen shell class.
		 * Establishes if the app is running Zinc.
		 * @return Boolean
		 */
		override public function get zincMode():Boolean
		{
			return this._commands.zincMode;
		}
		
		/**
		 * Invokes a method in the chosen shell class.
		 * Establishes if the app is running SWF Studio.
		 * @return Boolean
		 */
		override public function get swfStudioMode():Boolean
		{
			return this._commands.swfStudioMode;
		}

		/**
		 * Constructor.
		 */
		public function ShellConcreteCreator()
		{
			super();
		}

		// choose a class depending on the shell software to be utilised
		override protected function createShellSoftware(cKind:uint):IShellCommands 
		{
			if(cKind == 0) {
				this._commands = new SSCommands(this._dataModel);
				return this._commands;
			} else if(cKind == 1) {
				this._commands = new ZincCommands(this._dataModel);
				return this._commands;
			} else {
				throw new Error("Variable is empty or not available");
				return null;
			}
		}

		/**
		 * Invokes a method in the chosen shell class.
		 * Provides a path to the folder in which the Customisation Tool writes to.
		 * @param subFolder any subfolder to be added to the returned path
		 * @return the path string
		 */
		override public function specialFolder(subFolder:String):String
		{
			return this._commands.specialFolder(subFolder);
		}
		
		/**
		 * Invokes a method in the chosen shell class.
		 * Provides a path to the deployable folder i.e. the folder containing the editable files.
		 * @param subFolder any subfolder to be added to the returned path
		 * @param forceSWFStudioCommand the SWF Studio syntax may be required to point to the "AppData" or "ProgramData" folders even if a preview folder is specified
		 * @return the path string
		 */
		override public function deployableFolder(subFolder:String=''):String
		{
			return this._commands.deployableFolder(subFolder);
		}

		/**
		 * Invokes a method in the chosen shell class.
		 * Provides a path to the folder where the executable file is located.
		 * @param subFolder any subfolder to be added to the returned path
		 * @return the path string
		 */
		override public function startpath(subFolder:String='', includeBackslash:Boolean=true):String
		{
			return this._commands.startpath(subFolder, includeBackslash);
		}

		/**
		 * Invokes a method in the chosen shell class.
		 * Sets properties on app to act like a kiosk.
		 */
		override public function setKioskMode():void
		{
			this._commands.setKioskMode();
		}
	}
}
