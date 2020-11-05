<%@ Page Title="Textboxes-Default Functionalities-ASP.NET-SYNCFUSION"   Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" 
CodeBehind="DefaultFunctionalities.aspx.cs" Inherits="WebSampleBrowser.Textboxes.DefaultFunctionalities" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="row">
            <div class="col-xs-6 col-sm-3"><span>Kilometers</span></div>
            <div class="col-xs-6 col-sm-3">
                <ej:NumericTextBox ID="numeric" Value="35" Name="numeric" runat="server" width="150px" />
            </div>
        </div>
        <div class="row">
            <div class="col-xs-6 col-sm-3">
                <span>Service Tax</span>
            </div>
            <div class="col-xs-6 col-sm-3">
                <ej:PercentageTextBox ID="percent" Value="3" Name="percentage" runat="server" width="150px" />
            </div>
        </div>
        <div class="row">
            <div class="col-xs-6 col-sm-3">
                <span>Fare</span>
            </div>
            <div class="col-xs-6 col-sm-3">
                <ej:CurrencyTextBox ID="currency" Value="555" Name="currency" runat="server" width="150px" />
            </div>
        </div>
        <div class="row">
            <div class="col-xs-6 col-sm-3">
                <span>Mobile No</span>
            </div>
            <div class="col-xs-6 col-sm-3">
                <ej:MaskEdit InputMode="Text" ID="maskedit" MaskFormat="99-999-99999" 
                             WatermarkText="99-999-99999" runat="server" width="150px"></ej:MaskEdit>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-6 col-sm-3"></div>
            <div class="col-xs-6 col-sm-3">
                <ej:Button Type="Button" CssClass="e-btn" ID="pbill" Width="90" Height="25" 
                           runat="server" Text="Pay Bill"></ej:Button>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css" class="cssStyles">
        .frame {
            width: 35%;
        }
    </style>
</asp:Content>

