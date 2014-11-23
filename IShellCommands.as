package
{
	/**
	 * Lists functionality to adhere to when using shell software commands.
	 * @author Christopher Grigg
	 */
	internal interface IShellCommands
	{
		function get shellMode():Boolean;
		function get zincMode():Boolean;
		function get swfStudioMode():Boolean;
		function specialFolder(subFolder:String):String
		function deployableFolder(subFolder:String='', forceSWFStudioCommand:Boolean=false):String;
		function startpath(subFolder:String='', includeBackslash:Boolean = true):String;
		function setKioskMode():void
	}
}
