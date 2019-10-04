<%@ Page Title="Textboxes-Localization-ASP.NET-SYNCFUSION"   Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" 
CodeBehind="Localization.aspx.cs" Inherits="WebSampleBrowser.Textboxes.Localization" %>

<asp:Content ID="Heading1" ContentPlaceHolderID="SampleHeading" runat="server">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/cultures/ej.culture.de-DE.min.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/cultures/ej.culture.en-US.min.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/cultures/ej.culture.fr-FR.min.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/cultures/ej.culture.zh-CN.min.js")%>' type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="row">
            <div class="col-xs-6 col-sm-5">
                <span>Numeric Textbox</span>
            </div>
            <div class="col-xs-6 col-sm-4">
                <ej:NumericTextBox ID="numeric" runat="server" Name="numeric" Value="10.23" Locale="de-DE" DecimalPlaces="2" Width="100%"/>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-6 col-sm-5">
                <span>Percentage Textbox</span>
            </div>
            <div class="col-xs-6 col-sm-4">
                <ej:PercentageTextBox ID="percent" Name="percentage" Value="40.5" Locale="de-DE" DecimalPlaces="2" runat="server" Width="100%"/>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-6 col-sm-5">
                <span>Currency Textbox</span>
            </div>
            <div class="col-xs-6 col-sm-4">
                <ej:CurrencyTextBox ID="currency" Name="currency" Value="10.50" Locale="de-DE" DecimalPlaces="2" runat="server" Width="100%"/>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-6 col-sm-5">
                <span>MaskEdit Textbox</span>
            </div>
            <div class="col-xs-6 col-sm-4">
                <ej:MaskEdit InputMode="Text" ID="maskedit" Name="mask" MaskFormat="$99,999.99" runat="server" width="100%" Locale="de-DE"></ej:MaskEdit>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        var numobject, percentobject, currencyobject,maskobject;
        $(function () {

            numobject = $("#<%=numeric.ClientID%>").data("ejNumericTextbox");
            percentobject = $("#<%=percent.ClientID%>").data("ejPercentageTextbox");
            currencyobject = $("#<%=currency.ClientID%>").data("ejCurrencyTextbox");
            maskobject = $("#<%=maskedit.ClientID%>").data("ejMaskEdit");
            var ddobject = $("#<%=culture.ClientID%>").data("ejDropDownList");
            $("#sampleProperties").ejPropertiesPanel();
        });

        function onChange(args) {
            var maskFormat;
            args.value == "de-DE" || args.value == "fr-FR" ? maskFormat = "99,999.99$" : maskFormat = "$99,999.99";
            numobject.option("locale", args.value);
            percentobject.option("locale", args.value);
            currencyobject.option("locale", args.value);
            maskobject.option({ "maskFormat": maskFormat, "locale": args.value });
        }
        ej.NumericTextbox.Locale['de-DE'] = ej.PercentageTextbox.Locale['de-DE'] = ej.CurrencyTextbox.Locale['de-DE'] = {
            watermarkText: "Geben Sie Wert"
        };
        ej.NumericTextbox.Locale['fr-FR'] = ej.PercentageTextbox.Locale['fr-FR'] = ej.CurrencyTextbox.Locale['fr-FR'] = {
            watermarkText: "Entrer la valeur"
        };
        ej.NumericTextbox.Locale['zh-CN'] = ej.PercentageTextbox.Locale['zh-CN'] = ej.CurrencyTextbox.Locale['zh-CN'] = {
            watermarkText: "輸入值"
        };
    </script>
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
<asp:Content ID="Content4" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                    <span>Select Culture</span>
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ID="culture" runat="server" ClientSideOnChange="onChange" SelectedItemIndex="1" 
                                     Width="95px">
                        <Items>
                            <ej:DropDownListItem Text="en-US" Value="en-US" />
                            <ej:DropDownListItem Text="de-DE" Value="de-DE" />
                            <ej:DropDownListItem Text="fr-FR" Value="fr-FR" />
                            <ej:DropDownListItem Text="zh-CN" Value="zh-CN" />
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

