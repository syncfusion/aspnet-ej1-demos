<%@ Page Language="C#" Title="ComboBox-API's-ASP.NET-SYNCFUSION" AutoEventWireup="true" CodeBehind="Api.aspx.cs" MasterPageFile="~/Samplebrowser.Master" MetaDescription="This example demonstrates the various properties like sortOrder and autofill in a ASP.NET Web Forms ComboBox control." Inherits="WebSampleBrowser.ComboBox.Api" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:ComboBox ID="selectFlower" runat="server" Width="100%" DataTextField="text" Placeholder="Select a flower"></ej:ComboBox>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    AutoFill
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:ToggleButton Type="Button" ID="chkAutofillbtn" ActiveText="Disable" DefaultText="Enable" ClientSideOnChange="onAutofill" runat="server"></ej:ToggleButton>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Sorting
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:ToggleButton Type="Button" ID="chkSorting" ActiveText="Ascending" DefaultText="Descending" ClientSideOnChange="onSorting" runat="server"></ej:ToggleButton>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
	     $(function () {
            $("#sampleProperties").ejPropertiesPanel();
        });
			function onAutofill(args){
			   var listObj = $('#<%=selectFlower.ClientID%>').ejComboBox("instance");
				if (listObj.model) {
					if (args.isChecked)
						listObj.option({ autofill: true});
					else
						listObj.option({ autofill: false });
				}
			}
			function onSorting(args){
			var listObj = $('#<%=selectFlower.ClientID%>').ejComboBox("instance");
				if (listObj.model) {
					if (args.isChecked){
						 listObj.option({sortOrder: 'Descending'			
					});
					}
					else
					{
						listObj.option({sortOrder: 'Ascending'			
					});
					}
			}
			}
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .frame {
            width: 30%;
            padding: 50px;
        }
    </style>
</asp:Content>


