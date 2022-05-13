<%@ Page Title="Textboxes-Server-Side Events-ASP.NET-SYNCFUSION"   Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" 
CodeBehind="Events.aspx.cs" Inherits="WebSampleBrowser.Textboxes.Events" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="row">
            <div class="col-xs-6 col-sm-5">
                <span>Numeric Textbox</span>
            </div>
            <div class="col-xs-6 col-sm-4">
                <ej:NumericTextBox ID="numeric" runat="server" Name="numeric" Value="5" OnFocusOut="numeric_focusOut" Width="100%" />
            </div>
        </div>
        <div class="row">
            <div class="col-xs-6 col-sm-5">
                <span>Percentage Textbox</span>
            </div>
            <div class="col-xs-6 col-sm-4">
                <ej:PercentageTextBox ID="percent" Name="percentage" Value="55" runat="server" OnFocusOut="percent_focusOut" Width="100%"/>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-6 col-sm-5">
                <span>Currency Textbox</span>
            </div>
            <div class="col-xs-6 col-sm-4">
                <ej:CurrencyTextBox ID="currency" Name="currency" Value="555" runat="server" OnFocusOut="currency_focusOut" Width="100%"/>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-6 col-sm-5">
                <span>MaskEdit Textbox</span>
            </div>
            <div class="col-xs-6 col-sm-4">
                <ej:MaskEdit runat="server" ID="maskedit" MaskFormat="99-999" InputMode="Text" 
                             OnFocusOut="maskedit_FocusOut" Width="100%"/>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .frame {
            width:40%;
        }

        .col-xs-6.col-sm-5 {
            margin-top: 10px;
        }

       .col-xs-6.col-sm-4{
            padding-top: 7px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="EventSection" runat="server">
    <asp:UpdatePanel ID="UpdatePanelProp" UpdateMode="Conditional" runat="server">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="Clear" EventName="click" />
        </Triggers>
        <ContentTemplate>
            <div class="cols-prop-area event-tracer">
                <div>
                    <div class="heading">
                        <span>Event Trace</span>
                    </div>
                    <div class="prop-grid content">
                        <div class="eventarea">
                            <div class="EventLog" id="EventLog" runat="server">
                            </div>
                        </div>
                        <div class="evtbtn">
                            <ej:Button ID="Clear" Type="Button" Text="Clear" OnClick="Clear_Click" runat="server"></ej:Button>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

