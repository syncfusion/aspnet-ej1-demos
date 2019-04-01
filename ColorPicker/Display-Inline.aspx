<%@ Page Title="ColorPicker-Display Inline-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="Display-Inline.aspx.cs" MetaDescription="This example demonstrates how to show the ColorPicker in the inline mode in ASP.NET Web Forms" Inherits="WebSampleBrowser.ColorPicker.DisplayInline" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame" >
        <div id="col-md-3">
            Select a color
        </div>
        <ej:ColorPicker ID="inlinePicker" runat="server" TagName="div" ModelType="Picker" DisplayInline="true" Value="#278787" ClientSideOnChange="onChange"></ej:ColorPicker>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        function onChange(args) {
            $("#col-md-3").html("Color Value  " + args.value + " is choosen");
        }
        $("#sampleProperties").ejPropertiesPanel();
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
	<style>

		.frame {
		padding: 50px;
		width: 223px;
	}

	.material .frame{
		width: 265px;
		}

	@media (max-width: 979px) and (min-width: 312px){
		.frame {
			width: 223px !important;
			padding: 50px !important;
		}
		.material .frame{
		width: 265px !important;

		}
	}
	</style>
</asp:Content>

