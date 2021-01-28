<%@ Page Title="Textboxes-RTL-ASP.NET-SYNCFUSION"   Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master"
    CodeBehind="RTL.aspx.cs" Inherits="WebSampleBrowser.Textboxes.RTL" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="row">
            <div class="col-xs-6 col-sm-5 e-rtl">
                <span>Numeric Textbox</span>
            </div>
            <div class="col-xs-6 col-sm-3">
                <ej:NumericTextBox ID="numeric" Name="numeric" Width="100%" EnableRTL="true" Value="5" runat="server" />
            </div>
        </div>
        <div class="row">
            <div class="col-xs-6 col-sm-5 e-rtl">
                <span>Percentage Textbox</span>
            </div>
            <div class="col-xs-6 col-sm-3">
                <ej:PercentageTextBox ID="percent" Name="percentage" Width="100%" EnableRTL="true" Value="55" runat="server" />
            </div>
        </div>
        <div class="row">
            <div class="col-xs-6 col-sm-5 e-rtl">
                <span>Currency Textbox</span>
            </div>
            <div class="col-xs-6 col-sm-3">
                <ej:CurrencyTextBox ID="currency" Name="currency" Width="100%" EnableRTL="true" Value="555" runat="server" />
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .frame {
            width: 50%;
        }

        .col-xs-6.col-sm-5 {
            margin-top: 10px;
        }
    </style>
</asp:Content>

