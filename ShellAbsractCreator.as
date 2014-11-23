package
{
	import flash.events.EventDispatcher;

	/**
	 * Allows chosen shell software, to be referenced.<br /><br />
	 * ABSTRACT CLASS - should be overriden and not directly instantiated.
	 * @author Christopher Grigg
	 */
	public class ShellAbsractCreator extends EventDispatcher
	{	
		/** @public */
		public static const SWF_STUDIO:uint = 0;
		/** @public */
		public static const ZINC:uint = 1;
		/** @private */
		private const ERROR_ABSTRACT:String = "Abstract method! please override this method."
		/** @private */
		protected var _commands:IShellCommands;
		/** @private */
		protected var _err:Error;
		
		/**
		 * Invokes a method in the chosen shell class.<br /><br />
	 	 * ABSTRACT METHOD - should be overriden and not directly instantiated.
		 * @return null
		 */
		public function get shellMode():Boolean
		{
			_err = new Error(ERROR_ABSTRACT);
			trace(_err.toString());    // Error
			return null;
		}
		
		/**
		 * Invokes a method in the chosen shell class.<br /><br />
	 	 * ABSTRACT METHOD - should be overriden and not directly instantiated.
		 * @return null
		 */
		public function get zincMode():Boolean
		{
			_err = new Error(ERROR_ABSTRACT);
			trace(_err.toString());    // Error
			return null;
		}
		
		/**
		 * Invokes a method in the chosen shell class.<br /><br />
	 	 * ABSTRACT METHOD - should be overriden and not directly instantiated.
		 * @return null
		 */
		public function get swfStudioMode():Boolean
		{
			_err = new Error(ERROR_ABSTRACT);
			trace(_err.toString());    // Error
			return null;
		}
		
		/**
		 * Invokes a method in the chosen shell class.<br /><br />
	 	 * ABSTRACT METHOD - should be overriden and not directly instantiated.
		 */
		public function addShellType(cKind:uint = 0):void 
		{
			this._commands = this.createShellSoftware(cKind);
		}
		
		/**
		 * Invokes a method in the chosen shell class.<br /><br />
	 	 * ABSTRACT METHOD - should be overriden and not directly instantiated.
		 * @return null
		 */
		protected function createShellSoftware(cKind:uint):IShellCommands 
		{
			_err = new Error(ERROR_ABSTRACT);
            trace(_err.toString());    // Error
			return null;
		}
		
		/**
		 * Invokes a method in the chosen shell class.<br /><br />
	 	 * ABSTRACT METHOD - should be overriden and not directly instantiated.
		 * @param subFolder null
		 * @return null
		 */
		public function specialFolder(subFolder:String):String
		{
			_err = new Error(ERROR_ABSTRACT);
            trace(_err.toString());    // Error
			return null;
		}
		
		/**
		 * Invokes a method in the chosen shell class.<br /><br />
	 	 * ABSTRACT METHOD - should be overriden and not directly instantiated.
		 * @param subFolder a parameter to be passed on
		 * @return the string method in the chosen shell class
		 * @return null
		 */
		public function deployableFolder(subFolder:String='', forceSWFStudioCommand:Boolean=false):String
		{
			_err = new Error(ERROR_ABSTRACT);
            trace(_err.toString());    // Error
			return null;
		}
		
		/**
		 * Invokes a method in the chosen shell class.<br /><br />
	 	 * ABSTRACT METHOD - should be overriden and not directly instantiated.
		 * 
		 * @param null
		 * @param null
		 * @return null
		 */
		public function startpath(subFolder:String='', includeBackslash:Boolean=true):String
		{
			_err = new Error(ERROR_ABSTRACT);
			trace(_err.toString());    // Error
			return null;
		}
		
		/**
		 * Invokes a method in the chosen shell class.<br /><br />
	 	 * ABSTRACT METHOD - should be overriden and not directly instantiated.
		 */
		public function setKioskMode():void
		{
			_err = new Error(ERROR_ABSTRACT);
			trace(_err.toString());    // Error
		}
	}
}