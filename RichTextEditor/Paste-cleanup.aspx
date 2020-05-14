<%@ Page Language="C#" Title="RichTextEditor-Paste Options-ASP.NET-SYNCFUSION" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Paste-cleanup.aspx.cs" MetaDescription="This example demonstrates how the content copied from a word document is pasted after cleaning unwanted elements and CSS in ASP.NET Web Forms RichTextEditor." Inherits="WebSampleBrowser.RichTextEditor.Paste_cleanup" %>

<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    Paste Options
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
        <ej:RTE ID="pastecleanupSample" Width="100%" Height="440" ShowFooter="true" ShowHtmlSource="true" runat="server" MinWidth="200px" >
            <RTEContent>
                <p><b>Description:</b></p>
        <p>The Rich Text Editor (RTE) control is an easy to render in
        client side. Customer easy to edit the contents and get the HTML content for
        the displayed content. A rich text editor control provides users with a toolbar
        that helps them to apply rich text formats to the text entered in the text
        area. </p>
       <p><b>Functional
        Specifications/Requirements:</b></p>
        <ol><li><p>Provide
        the tool bar support, it’s also customizable.</p></li><li><p>Options
        to get the HTML elements with styles.</p></li><li><p>Support
        to insert image from a defined path.</p></li><li><p>Footer
        elements and styles(tag / Element information , Action button (Upload, Cancel))</p></li><li><p>Re-size
        the editor support.</p></li><li><p>Provide
        efficient public methods and client side events.</p></li><li><p>Keyboard
        navigation support.</p></li></ol>
            </RTEContent>
            <Tools Font="fontName,fontSize,fontColor,backgroundColor"
				Edit="findAndReplace"
                Styles="bold,italic,underline,strikethrough"
                Alignment="justifyLeft,justifyCenter,justifyRight,justifyFull"
                Lists="unorderedList,orderedList"
                Clipboard="cut,copy,paste"
                DoAction="undo,redo"
                Clear="clearFormat,clearAll"
                Links="createLink,removeLink"
                Images="image"
                Tables="createTable,addRowAbove,addRowBelow,addColumnLeft,addColumnRight,deleteRow,deleteColumn,deleteTable"
                Effects="superscript,subscript"
                Casing="upperCase,lowerCase"
                FormatStyle="format"
                View="fullScreen,zoomIn,zoomOut"
                Indenting="outdent,indent" 
                Media="video"
				Print="print">               
                <CustomOrderedList>
                    <ej:CustomOrderedList Text="Lower-Greek"   ListStyle="lower-greek" Name="orderInsert" Tooltip="Custom OrderList"  Css="e-rte-toolbar-icon e-rte-listitems customOrder" />
                </CustomOrderedList> 
                <CustomUnorderedList>
                    <ej:CustomUnorderedList Text="Smiley" ListImage="url('../Content/images/rte/Smiley-GIF.gif')" Name="unOrderInsert" Tooltip="Custom UnOrderList"    Css="e-rte-toolbar-icon e-rte-unlistitems customUnOrder" />
                </CustomUnorderedList>  
            </Tools>
			<PasteCleanupSettings CleanCSS="true" CleanElements="true" ListConversion="true" RemoveStyles="true" />
        </ej:RTE>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        var target, chkobj;
        $(function () {
            target = $("#<%=pastecleanupSample.ClientID%>").data("ejRTE");
            chkobj = $("#<%=check2.ClientID%>").data("ejCheckBox");
            $("#sampleProperties").ejPropertiesPanel();
        });
        function OnCheck(args) {

            if (args.isChecked) {
                target.model.pasteCleanupSettings.listConversion = true;
            } else {
                target.model.pasteCleanupSettings.listConversion = false;
            }

        }
        function OnCheck1(args) {

            if (args.isChecked) {
                chkobj.setModel({ checked: true })
                target.model.pasteCleanupSettings.cleanCSS = true;
                target.model.pasteCleanupSettings.removeStyles = true;
            } else {
                chkobj.setModel({ checked: false })
                target.model.pasteCleanupSettings.cleanCSS = false;
                target.model.pasteCleanupSettings.removeStyles = false;
            }

        }
        function OnCheck2(args) {

            if (args.isChecked) {
                target.model.pasteCleanupSettings.removeStyles = true;
            } else {
                target.model.pasteCleanupSettings.removeStyles = false;
            }

        }
        function OnCheck3(args) {

            if (args.isChecked) {
                target.model.pasteCleanupSettings.cleanElements = true;
            } else {
                target.model.pasteCleanupSettings.cleanElements = false;
            }

        }

    </script>
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
       .customUnOrder,.customOrder{
		   height:25px;
		}
		.customUnOrder:after {
		  content: "\e7f1";
		  font-size:20px;
		  float:left;
		  padding: 0px 4px 0px 4px;
		}
		.customOrder:after {
		  content: "\e7f0";
		  font-size:20px;
		  float:left;
		  padding: 0px 4px 0px 4px;
		}
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="PropertySection" runat="server">
     <div id="sampleProperties">
         <div class="prop-grid"><h4>Cleanup Option</h4>
                <div class="row">
                    <div class="col-md-6">List conversion</div>
                    <div class="col-md-6">
                        <ej:CheckBox ID="check" runat="server" Checked="true" ClientSideOnChange="OnCheck"></ej:CheckBox>
                    </div></div>
					<br />
                <div class="row">
                    <div class="col-md-6">Clean unwanted CSS</div>
                <div class="col-md-6">
                       <ej:CheckBox ID="check1" runat="server" Checked="true" ClientSideOnChange="OnCheck1"></ej:CheckBox>
                </div></div><br/>
				<div class="row">
                    <div class="col-md-6">Remove styles</div>
                <div class="col-md-6">
                         <ej:CheckBox ID="check2" runat="server" Checked="true" ClientSideOnChange="OnCheck2"></ej:CheckBox>
                </div>
                    </div><br/>
				<div class="row">
                    <div class="col-md-6">Clean unwanted elements</div>
                <div class="col-md-6">
                         <ej:CheckBox ID="check3" runat="server" Checked="true" ClientSideOnChange="OnCheck3"></ej:CheckBox>
                </div>
                </div>
    </div></div>
</asp:Content>




