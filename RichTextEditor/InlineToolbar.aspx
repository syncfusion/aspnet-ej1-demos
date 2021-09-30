<%@ Page Language="C#" Title="RichTextEditor-Inline Toolbar-ASP.NET-SYNCFUSION" AutoEventWireup="true"  MasterPageFile="~/Samplebrowser.Master" CodeBehind="InlineToolbar.aspx.cs" MetaDescription="This sample demonstrates to display the exceeding toolbar items as inline toolbar in ASP.NET WebForms RichTextEditor control." Inherits="WebSampleBrowser.RichTextEditor.InlineToolbar" %>

<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    Inline Toolbar
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
        <ej:RTE ID="InlinetoolbarSample" ShowFooter="true" ShowHtmlSource="true" runat="server" Width="100%" MinWidth="200px" IsResponsive="true" ToolbarOverflowMode="Inline" >
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
        </ej:RTE>
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



