package test
{
	import com.gorillalogic.flexmonkey.commands.CallCommand;
	import com.gorillalogic.flexmonkey.commands.CommandRunner;
	import com.gorillalogic.flexmonkey.commands.FlexCommand;
	import com.gorillalogic.flexmonkey.core.MonkeyEvent;
	import com.gorillalogic.flexmonkey.core.MonkeyUtils;
	
	import flexunit.framework.Assert;
	import flexunit.framework.TestCase;
	
	import mx.collections.ArrayCollection;
	import mx.controls.DataGrid;
	import mx.controls.DateField;


	public class FlexUnitTests extends TestCase {

	// Test method
	public function testSomething():void {
		var cmdRunner:CommandRunner = new CommandRunner();
		cmdRunner.addEventListener(MonkeyEvent.READY_FOR_VALIDATION, addAsync(verifySomething, 10000));
		cmdRunner.runCommands([
			new FlexCommand("inName", "SelectText", ["0", "0"], "automationName"),
			new FlexCommand("inName", "Input", ["Fred"], "automationName"),
			new FlexCommand("inType", "Open", ["null"], "automationName"),
			new FlexCommand("inType", "Select", ["Work", "1", "0"], "automationName"),
			new FlexCommand("inPhone", "SelectText", ["0", "0"], "automationName"),
			new FlexCommand("inPhone", "Input", ["555 555 5555"], "automationName"),
			// The following command was inserted manually to demonstrate a workaround for DateField bug
			// See http://groups.google.com/group/flexmonkey/browse_thread/thread/bf4af5e1d8164608# for more info
			new CallCommand(function():void {DateField(MonkeyUtils.findComponentWith("inDate")).open()}),			
			new FlexCommand("inDate", "Open", ["null"], "automationName"),
			new FlexCommand("inDate", "Change", ["Fri Dec 26 2008"], "automationName"),
			new FlexCommand("Add", "Click", ["0"], "automationName"),
			new FlexCommand("grid", "Select", ["  | Fred | *Work* | 555 555 5555 | Fri Dec 26 00:00:00 GMT-0700 2008", "1", "0"], "automationName"),
			new FlexCommand("className{FlexMonkeyLauncher string}automationIndex{index:-1 string}automationName{index:-1 string}automationClassName{FlexApplication string}label{ string}id{null object}|automationClassName{FlexApplication string}className{MonkeyContacts string}automationIndex{index:1 string}label{ string}automationName{MonkeyContacts.swf string}id{null object}|className{mx.containers.TitleWindow string}automationIndex{index:0 string}automationName{index:0 string}automationClassName{FlexTitleWindow string}label{ string}id{null object}|className{mx.containers.VDividedBox string}automationIndex{index:0 string}automationName{index:0 string}automationClassName{FlexDividedBox string}label{ string}id{null object}|automationClassName{FlexDataGrid string}className{mx.controls.DataGrid string}automationName{grid string}id{grid string}automationIndex{index:6 string}|automationClassName{FlexComboBox string}className{MonkeyContacts_inlineComponent1 string}automationName{%20%20%7C%20Fred%20%7C%20Work%20%7C%20555%20555%205555%20%7C%20Fri%20Dec%2026%2000:00:00%20GMT-0700%202008 string}id{null object}automationIndex{type:0 string}", "Open", ["null"], "automationID"),
			new FlexCommand("className{FlexMonkeyLauncher string}automationIndex{index:-1 string}automationName{index:-1 string}automationClassName{FlexApplication string}label{ string}id{null object}|automationClassName{FlexApplication string}className{MonkeyContacts string}automationIndex{index:1 string}label{ string}automationName{MonkeyContacts.swf string}id{null object}|className{mx.containers.TitleWindow string}automationIndex{index:0 string}automationName{index:0 string}automationClassName{FlexTitleWindow string}label{ string}id{null object}|className{mx.containers.VDividedBox string}automationIndex{index:0 string}automationName{index:0 string}automationClassName{FlexDividedBox string}label{ string}id{null object}|automationClassName{FlexDataGrid string}className{mx.controls.DataGrid string}automationName{grid string}id{grid string}automationIndex{index:6 string}|automationClassName{FlexComboBox string}className{MonkeyContacts_inlineComponent1 string}automationName{%20%20%7C%20Fred%20%7C%20Work%20%7C%20555%20555%205555%20%7C%20Fri%20Dec%2026%2000:00:00%20GMT-0700%202008 string}id{null object}automationIndex{type:0 string}", "Select", ["Mobile", "1", "0"], "automationID"),
			new FlexCommand("className{FlexMonkeyLauncher string}automationIndex{index:-1 string}automationName{index:-1 string}automationClassName{FlexApplication string}label{ string}id{null object}|automationClassName{FlexApplication string}className{MonkeyContacts string}automationIndex{index:1 string}label{ string}automationName{MonkeyContacts.swf string}id{null object}|className{mx.containers.TitleWindow string}automationIndex{index:0 string}automationName{index:0 string}automationClassName{FlexTitleWindow string}label{ string}id{null object}|className{mx.containers.VDividedBox string}automationIndex{index:0 string}automationName{index:0 string}automationClassName{FlexDividedBox string}label{ string}id{null object}|className{mx.containers.VBox string}automationIndex{index:0 string}automationName{index:0 string}automationClassName{FlexBox string}label{ string}id{null object}", "Click", ["0"], "automationID")]);
   }
	// Called after commands have been run
	private function verifySomething(event:MonkeyEvent):void {
		   var comp:DataGrid = MonkeyUtils.findComponentWith("grid","id") as DataGrid;
		   Assert.assertEquals("Fred1", ArrayCollection(comp.dataProvider).getItemAt(0).name);
		   Assert.assertEquals("Mobile", ArrayCollection(comp.dataProvider).getItemAt(0).type);		   

	}   }
}