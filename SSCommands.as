package
{
	import flash.events.EventDispatcher;

	/**
	 * Provides SWF Studio commands for all functionality listed in IShellCommands.
	 * @author Christopher Grigg
	 */
	internal class SSCommands extends EventDispatcher implements IShellCommands
	{	
		/** @public */
		public static const LINK_BACKSLASH:String = "\\";
		/** @private */
		private const BASE_RELATIVE:String = "relative";
		/** @private */
		private const BASE_GLOBAL:String = "global";
		/** @private */
		private const BASE_LOCAL:String = "local";
		/** @private */
		private var _configInfo:ConfigInfo;
		/** @private */
		private var _deployablePath:String;
		/** 
		 * @private 
		 * Substitute this for a value from config source such as an XML.
		 */
		private var _configValue:Object;
		
		/**
		 * Establishes if the app is running in dev or RC mode.
		 * @return Boolean
		 */
		public function get shellMode():Boolean
		{
			return ssCore.isEXE;
		}
		
		/**
		 * Not applicable for SWF Studio
		 * @return Boolean
		 */
		public function get zincMode():Boolean
		{
			return false;
		}
		
		/**
		 * Establishes if the app is running SWF Studio.
		 * @return Boolean
		 */
		public function get swfStudioMode():Boolean
		{
			return ssCore.isEXE;
		}
		
		/**
		 * Constructor.
		 */
		public function SSCommands()
		{
			trace("[SSCommandModel.SSCommands]");
			this.bootShellFunctionality();
		}
		
		// implement functionality to set up shell software
		private function bootShellFunctionality():void
		{
			// init SWF Studio
			ssCore.init();
			// allows synchronous syntax
			ssDefaults.synchronousCommands = true;
		}
		
		/**
		 * Provides a path to the folder in which the Customisation Tool writes to.
		 * @param subFolder any subfolder to be added to the returned path
		 * @return the path string
		 */
		public function specialFolder(subFolder:String):String
		{
			var returnObject:Object = ssCore.FileSys.specialFolder( {folderID:subFolder} );
			return returnObject.result;
		}
		
		/**
		 * Provides a path to the deployable folder i.e. the folder containing the editable files
		 * @param subFolder if a sub folder is required
		 * @return the path string
		 */
		public function deployableFolder(subFolder:String=''):String
		{
			trace("[SSCommandModel.deployableFolder]");
			if(this.shellMode && forceSWFStudioCommand)
			{
				if(_configValue == this.BASE_LOCAL)
				{
					// identify "User/AppData/Local" folder
					var return_obj:Object = ssCore.FileSys.specialFolder({folderID:"0x001c"});
					_deployablePath = return_obj.result + LINK_BACKSLASH + subFolder;
				} 
				else if(_configValue == this.BASE_GLOBAL)
				{
					// identify "c:/ProgramData" folder
					_deployablePath = ssGlobals.ssAllUsersAppDataDir + LINK_BACKSLASH + subFolder;
				} 
				else if(_configValue == this.BASE_RELATIVE)
				{
					// relative path
					_deployablePath = this.startpath(subFolder);
				} 
				else
				{
					// default to relative path if nothing is found in xml node
					_deployablePath = subFolder;
				}
			}
			else
			{
				// relative path
				_deployablePath = subFolder;
			}
			return _deployablePath;
		}
		
		/**
		 * Provides a path to the folder where the executable file is located.
		 * @param subFolder any subfolder to be added to the returned path
		 * @param includeBackslash gives the option to include backslashes in the path
		 * @return the path string
		 */
		public function startpath(subFolder:String='', includeBackslash:Boolean=true):String
		{
			trace("[SSCommandModel.startpath]");
			var path:String;
			if(this.shellMode){
				if(includeBackslash)
					path = ssGlobals.ssStartDir + LINK_BACKSLASH + subFolder;
				else
					path = ssGlobals.ssStartDir + subFolder;
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
			if(this.shellMode) {
				// kiosk mode disables specific functionality
				ssCore.App.setKioskMode({flag:true, skipRegMods:true});
			}
		}
	}
}
