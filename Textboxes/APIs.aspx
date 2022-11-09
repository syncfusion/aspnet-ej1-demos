<%@ Page Title="Textboxes-API's-ASP.NET-SYNCFUSION"   Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" 
CodeBehind="APIs.aspx.cs" Inherits="WebSampleBrowser.Textboxes.APIs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="row">
            <div class="col-xs-6 col-sm-5">
                <span>Numeric Textbox</span>
            </div>
            <div class="col-xs-6 col-sm-3">
                <ej:NumericTextBox ID="numeric" Name="numeric" Value="5" runat="server" Width="150px" />
            </div>
        </div>
        <div class="row">
            <div class="col-xs-6 col-sm-5">
                <span>Percentage Textbox</span>
            </div>
            <div class="col-xs-6 col-sm-3">
                <ej:PercentageTextBox ID="percent" Name="percentage" Value="55" runat="server" Width="150px" />
             </div>
        </div>
        <div class="row">
            <div class="col-xs-6 col-sm-5">
                <span>Currency Textbox</span>
            </div>
            <div class="col-xs-6 col-sm-3">
                <ej:CurrencyTextBox ID="currency" Name="currency" Value="555" runat="server" Width="150px" />
            </div>
        </div>
        <div class="row">
            <div class="col-xs-6 col-sm-5">
                <span>MaskEdit Textbox</span>
            </div>
            <div class="col-xs-6 col-sm-3">
                <ej:MaskEdit InputMode="Text" ID="maskedit" MaskFormat="(999)999-9999" 
                             WatermarkText="(999)999-9999" CustomCharacter="$" runat="server" Width="150px"></ej:MaskEdit>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/TextBox/APIs.js")%>' type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
        });
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .frame {
            width: 50%;
        }
        .input {
            width: 110px;
            height: 22px;
            text-indent: 10px;
        }

        .inputBtn, .e-togglebutton {
            width: 114px;
        }
        .col-xs-6.col-sm-5 {
            margin-top: 10px;
        }

        .material .e-numeric, .material .e-percent, .material .e-currency, .material .e-mask{
            width: 200px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Enable / Disable
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:ToggleButton ID="ToggleButton" runat="server" DefaultText="Disable" ActiveText="Enable" 
                                     ClientSideOnClick="changeState" Width="110px"></ej:ToggleButton>
                </div>
                <div class="col-md-3 col-xs-4">
                    IncrementStep
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:NumericTextBox ID="incrementStep" runat="server" WatermarkText="Increment step" 
                                       Width="105px" ShowSpinButton="false"></ej:NumericTextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Min Value
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:NumericTextBox ID="minValue" WatermarkText="Min Value" runat="server" Width="105px" 
                                       ShowSpinButton="false"></ej:NumericTextBox>
                </div>
                <div class="col-md-3 col-xs-4">
                    Max Value
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:NumericTextBox ID="maxValue" runat="server" WatermarkText="Max Value" Width="105px" 
                                       ShowSpinButton="false"></ej:NumericTextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Decimal Value
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:NumericTextBox ID="decimalValue" runat="server" WatermarkText="Decimal Value" Width="105px"
                                       ShowSpinButton="false" MinValue = "0" MaxValue="5"></ej:NumericTextBox>  
                </div>
			</div>
			<div class="row">
                <div class="col-md-3 col-xs-4">
                    Apply Values
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:Button runat="server" ID="applybtn" Text="Apply" Width="107px" ClientSideOnClick="applyChanges" 
                               Type="Button"></ej:Button>
                </div>
			</div>
            <div class="row">
                 <span id="error" style="color: red"></span>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    MaskEdit:
                </div>
                <div class="col-md-3 col-xs-4"></div>
                <div class="col-md-3 col-xs-4">
                    Mask
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:DropDownList ID="masks" runat="server" ClientSideOnChange="onMaskChange" 
                                     Width="140px" SelectedItemIndex="0">
                        <Items>
                            <ej:DropDownListItem Value="(999)999-9999" Text="Phone No" />
                            <ej:DropDownListItem Value="aa-99-99-a" Text="Insurance No" />
                            <ej:DropDownListItem Value="AAA-AA-AAAA" Text="AlphaNumeric" />
                            <ej:DropDownListItem Value="C99999" Text="Currency" />
                            <ej:DropDownListItem Value="99999 - 9999" Text="ZipCode" />
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

