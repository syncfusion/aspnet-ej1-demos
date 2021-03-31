<%@ Page Language="C#" Title="Tooltip-API's-ASP.NET-SYNCFUSION" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Methods.aspx.cs" MetaDescription="This example demonstrates the various methods like show, hide, enable and disable in a ASP.NET Web Forms Tooltip" Inherits="WebSampleBrowser.Tooltip.Methods" %>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
   <div class="content-container-fluid">
        <div class="row">
           
                <div class="frame">
                    <div class="ctrl">
                        <table>
                            <tr>
                                <td>
                                    <div id="backBtn">
                                         <ej:Button ID="back" runat="server" Type="Button" Text="Back" ShowRoundedCorner="true" Width="100%"></ej:Button>
                                    </div>
                                </td>
                            
                                <td>
                                    <input type="text" class="e-textbox" placeholder="Search for...">
                                </td>
                           
                                <td>
                                    <div id="goBtn">
                                        <ej:Button ID="go" runat="server" Type="Button" Text="Go" ShowRoundedCorner="true" Width="100%"></ej:Button>
                                    </div>
                                </td>
                            
                                <td>
                                    <div ID="reloadBtn">
                                        <ej:Button ID="btn" runat="server" Type="Button" Text="Reload" ShowRoundedCorner="true" Width="100%" ContentType="ImageOnly" PrefixIcon="e-icon e-uiLight e-reload"></ej:Button>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                
            </div>

        
        </div>
    </div>
    <ej:Tooltip For="reloadBtn" IsBalloon="false"  Content="Reload current page" runat="server" ClientIDMode="Static" ClientSideOnCreate="onCreate" >
        <Position>
            <Stem Horizontal="left" Vertical="bottom" />
            <Target Horizontal="center" Vertical="top" />
        </Position>
    </ej:Tooltip>
    <ej:Tooltip For="goBtn"  Content="search" runat="server" ClientIDMode="Static" >
        <Position>
            <Stem Horizontal="left" Vertical="bottom" />
            <Target Horizontal="center" Vertical="top" />
        </Position>
    </ej:Tooltip>
    <ej:Tooltip For="backBtn"  Content="Go back one page" runat="server" ClientIDMode="Static" >
        <Position>
            <Stem Horizontal="left" Vertical="bottom" />
            <Target Horizontal="center" Vertical="top" />
        </Position>
    </ej:Tooltip>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="PropertySection">
                   <div id="sampleProperties">
                <div class="prop-grid">
                    <div class="row">
                        <div class="col-md-6"> Target Element </div>
                        <div class="col-md-6">
                         
                       <ej:DropDownList runat="server" ID="refresh" TargetID="list" SelectedIndex="2" Width="110px" ClientSideOnChange="onEffectChange" ClientIDMode="Static" ></ej:DropDownList>
                        <div id="list">
                        <ul >
                            <li value="backBtn">Back Button</li>
                            <li value="goBtn">Go Button</li>
                            <li value="reloadBtn">Reload Button</li>
                        </ul>
                      </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6"> Disable\Enable </div>
                        <div class="col-md-6">
                              
                            <ej:Button ID="btnEnable" Type="Button"  runat="server" Text="Disable" Width="107px" Enabled="false" ShowRoundedCorner="true" ClientSideOnClick="onEnableDisable" ClientIDMode="Static" ></ej:Button>
                    
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6"> Show\Hide </div>
                        <div class="col-md-6">
                            <ej:Button ID="hideButton" Type="Button"  runat="server" Text="Show" Width="107px" Enabled="true" ShowRoundedCorner="true" ClientSideOnClick="onShowHide" ClientIDMode="Static" ></ej:Button>
                           
                        </div>
                    </div>
                </div>
            </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        var target, value, count = 0;
        
		var DropDownListObj = $("#<%=refresh.ClientID%>").data("ejDropDownList");
        $(function () {
            
            $("#sampleProperties").ejPropertiesPanel();
            $("#temp").hide();
        });

        function onCreate(args) {
            target = $("#reloadBtn").data("ejTooltip");
        }
        
        function onEffectChange(args) {

            target.show($("#" + args.value));
            $('#hideButton').ejButton({ text: "Hide" });
		}
        function onEnableDisable(args) {
            var text;
            var btnObj = $("#<%=hideButton.ClientID%>").data("ejButton");
            var DropDownListObj = $("#<%=refresh.ClientID%>").data("ejDropDownList");
            if (args.model.text == "Disable") {
                target.disable();
                text = "Enable";
                btnObj.disable();
                DropDownListObj.disable();
            }
            else {
                target.enable();
                text = "Disable";
                btnObj.enable();
                DropDownListObj.enable();
            }

            $('#btnEnable').ejButton({ text: text });
        }
        function onShowHide(args) {
            var text;
            var DropDownListObj =  $("#<%=refresh.ClientID%>").data("ejDropDownList");
            var value = DropDownListObj.getSelectedValue();
            enableBtn = $("#<%=btnEnable.ClientID%>").data("ejButton");
            if (args.model.text == "Hide") {
                target.hide();
                text = "Show";
                enableBtn.disable();
            }
            else {
                target.show($("#" + value));
                text = "Hide";
                enableBtn.enable();
            }
            $('#hideButton').ejButton({ text: text }); 
        }

        </script>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="StyleSection" runat="server">
    
    <style type="text/css">
		 .frame {
            width: 100%;
            height:250px;
            box-sizing: border-box;

        }
        .ctrl{
            margin-top: 80px;
        }
        table{
            width: 100%;
        }
		.material input{
			width: 100%;
			height: 36px;
		}
	</style>
</asp:Content>

