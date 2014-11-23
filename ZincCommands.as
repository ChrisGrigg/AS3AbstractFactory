package
{
	import mdm.System;
	
	/**
	 * Provides Zinc commands for all functionality
	 * @author Christopher Grigg
	 */
	internal class ZincCommands implements IShellCommands
	{
		/* @private */
		private var _deployablePath:String;
		
		/**
		 * Establishes if the app is running in dev or RC mode.
		 * @return Boolean
		 */
		public function get shellMode():Boolean
		{
			if(mdm.Forms.getFormByName(IPosProj2120.IPOS).isCreated || mdm.Forms.getFormByName(CTProj2120.CUSTOMISATION_TOOL).isCreated)
				return true;
			else
				return false
		}
		
		/**
		 * Establishes if the app is running SZinc.
		 * @return Boolean
		 */
		public function get zincMode():Boolean
		{
			if(mdm.Forms.getFormByName(IPosProj2120.IPOS).isCreated || mdm.Forms.getFormByName(CTProj2120.CUSTOMISATION_TOOL).isCreated)
				return true;
			else
				return false
		}
		
		/**
		 * Not applicable for Zinc.
		 * @return Boolean
		 */
		public function get swfStudioMode():Boolean
		{
			return false;
		}
		
		/**
		 * Constructor.
		 */
		public function ZincCommands()
		{
			trace("[ZincCommands.ZincCommands]");
			this.bootShellFunctionality();
		}
		
		private function bootShellFunctionality():void
		{
			mdm.Application.init()
		}
		
		/**
		 * Not available for Zinc.
		 * @param subFolder any subfolder to be added to the returned path
		 * @return null
		 */
		public function specialFolder(subFolder:String):String
		{
			return null;
		}
		
		/**
		 * Provides a path to the deployable folder i.e. the folder containing the editable files
		 * @param subFolder if a sub folder is required
		 * @return the path string
		 */
		public function deployableFolder(subFolder:String=''):String
		{
			if (this.shellMode){
				// utilise format string class to manage the slash direction in the path string 
				// as Linux requires forward slashes and Windows back slashes
				_deployablePath = this._formatString.manageSlashDirection(mdm.FileSystem.getCurrentDir() + subFolder, ConcreteMultiDataModel.OS_LINUX);
			}else{
				_deployablePath = subFolder;
			}

			return _deployablePath;
		}
		
		/**
		 * Provides a path to the folder where the executable file is located.
		 * @param subFolder any subfolder to be added to the returned path
		 * @param includeBackslash should not be utilised for Zinc (Linux)
		 * @return the path string
		 */
		public function startpath(subFolder:String='', includeBackslash:Boolean=true):String
		{
			var path:String;
			if(this.shellMode) {
				// utilise format string class to manage the slash direction in the path string 
				// as Linux requires forward slashes and Windows back slashes
				path = this._formatString.manageSlashDirection(mdm.FileSystem.getCurrentDir() + subFolder, ConcreteMultiDataModel.OS_LINUX);
			} else {
				path = subFolder;
			}
			return path;
		}
		
		/**
		 * Sets properties on app to act like a kiosk.
		 */
		public function setKioskMode():void
		{
			//TODO: implement function
		}
	}
}
