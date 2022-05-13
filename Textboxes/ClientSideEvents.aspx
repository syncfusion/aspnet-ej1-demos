<%@ Page Title="Textboxes-Client-Side Events-ASP.NET-SYNCFUSION"   Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" 
CodeBehind="ClientSideEvents.aspx.cs" Inherits="WebSampleBrowser.Textboxes.ClientSideEvents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="row">
            <div class="col-xs-6 col-sm-5">
                <span>Numeric Textbox</span>
            </div>
            <div class="col-xs-6 col-sm-4">
                <ej:NumericTextBox ID="numeric" ClientSideOnCreate="onNumericCreate" ClientSideOnChange="numericValChange" 
                                   ClientSideOnFocusIn="numericFocusIn" ClientSideOnFocusOut="numericFocusOut" runat="server" 
                                   Name="numeric" Value="5" Width="100%"/>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-6 col-sm-5">
                <span>Percentage Textbox</span>
            </div>
            <div class="col-xs-6 col-sm-4">
                <ej:PercentageTextBox ID="percent" ClientSideOnChange="percentValChange" ClientSideOnFocusOut="percentFocusOut" 
                                      ClientSideOnFocusIn="percentFocusIn" ClientSideOnCreate="onPercentageCreate" Name="percentage" 
                                      Value="55" runat="server" Width="100%"/>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-6 col-sm-5">
                <span>Currency Textbox</span>
            </div>
            <div class="col-xs-6 col-sm-4">
                <ej:CurrencyTextBox ID="currency" Name="currency" Value="555" ClientSideOnFocusOut="currencyFocusOut" 
                                    ClientSideOnFocusIn="currencyFocusIn" ClientSideOnChange="currencyValChange" 
                                    ClientSideOnCreate="onCurrencyCreate" runat="server" Width="100%"/>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-6 col-sm-5">
                <span>MaskEdit Textbox</span>
            </div>
            <div class="col-xs-6 col-sm-4">
                <ej:MaskEdit runat="server" ID="maskedit" ClientSideOnFocusOut="maskFocusOut" ClientSideOnFocusIn="maskFocusIn" 
                             ClientSideOnChange="maskValueChange" ClientSideOnCreate="onMaskCreate" MaskFormat="99-999" 
                             InputMode="Text" Width="100%"/>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/TextBox/Events.js")%>' type="text/javascript"></script>
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
    <div class="cols-prop-area event-tracer">
        <div>
            <div class="heading">
                <span>Event Trace</span>
                <div class="pull-right">
                    <ej:DropDownList ID="selectControls" ClientSideOnPopupShown="adjustpopupposition" 
                                     ClientSideOnCheckChange="evtpropscheckedevent" ShowCheckbox="true" CheckAll="true" runat="server">
                        <Items>
                            <ej:DropDownListItem Value="change" Text="valueChange"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="focusIn" Text="focusIn"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="focusOut" Text="focusOut"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            <div class="prop-grid content">
                <div class="eventarea">
                    <div class="EventLog" id="EventLog">
                    </div>
                </div>
                <div class="evtbtn">
                    <ej:Button ID="Clear" Type="Button" Text="Clear" ClientSideOnClick="onClear" 
                               CssClass="eventclear e-btn" runat="server"></ej:Button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

