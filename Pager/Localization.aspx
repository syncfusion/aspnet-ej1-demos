<%@ Page Title="Pager-Localization-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" MetaDescription="This example demonstrates how to localize the pager in a ASP.NET Web Forms DatePicker" AutoEventWireup="true" CodeBehind="Localization.aspx.cs" Inherits="WebSampleBrowser.Pager.Localization" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:Rotator ID="sliderContent" runat="server"
                SlideWidth="100%"
                ShowPager="false"
                ShowNavigateButton="false"
                Enabled="true"
                IsResponsive="true">
                <Items>
                    <ej:RotatorItem Url="../Content/images/rotator/nature.jpg"></ej:RotatorItem>
                    <ej:RotatorItem Url="../Content/images/rotator/bird.jpg"></ej:RotatorItem>
                    <ej:RotatorItem Url="../Content/images/rotator/sculpture.jpg"></ej:RotatorItem>
                    <ej:RotatorItem Url="../Content/images/rotator/seaview.jpg"></ej:RotatorItem>
                    <ej:RotatorItem Url="../Content/images/rotator/snowfall.jpg"></ej:RotatorItem>
                    <ej:RotatorItem Url="../Content/images/rotator/card.jpg"></ej:RotatorItem>
                    <ej:RotatorItem Url="../Content/images/rotator/night.jpg"></ej:RotatorItem>
                </Items>
            </ej:Rotator>
    <ej:Pager runat="server" ID="pager" PageCount="5" PageSize="1" TotalRecordsCount="5" ClientSideOnChange="change" IsResponsive="true"></ej:Pager>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                    <span>Select Culture</span>
                </div>
                <div class="col-md-3">
                    <ej:DropDownList runat="server" ID="culture" TargetID="culturelist" ClientSideOnChange="onChange" Width="100px" SelectedItemIndex="0"></ej:DropDownList>
                    <div id="culturelist">
                        <ul>
                            <li>en-US</li>
                            <li>de-DE</li>
                            <li>es-ES</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/cultures/ej.culture.en-US.min.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/cultures/ej.culture.de-DE.min.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/cultures/ej.culture.es-ES.min.js")%>' type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            var ddobject = $("#<%=culture.ClientID%>").data("ejDropDownList");
            slider_obj = $("#<%=sliderContent.ClientID%>").ejRotator("instance");
            $("#sampleProperties").ejPropertiesPanel();
        });
        function change(args) {
            slider_obj.gotoIndex(args.currentPage - 1);
        }
        function onChange(args) {
            var paegrObject = $("#<%=pager.ClientID%>").data("ejPager");
            // localizable text
            if (args.text == "de-DE") {
                ej.Pager.Locale["de-DE"] = {
                    pagerInfo: "{0} von {1} Seiten ({2} Beiträge)",
                    firstPageTooltip: "Zur ersten Seite",
                    lastPageTooltip: "Zur letzten Seite",
                    nextPageTooltip: "Zur nächsten Seite",
                    previousPageTooltip: "Zurück zur letzten Seite",
                    nextPagerTooltip: "Zum nächsten Pager",
                    previousPagerTooltip: "Zum vorherigen Pager"
                };
            }
            else if (args.text == "es-ES") {
                ej.Pager.Locale["es-ES"] = {
                    pagerInfo: "{0} de {1} páginas ({2} artículos)",
                    firstPageTooltip: "Ir a la primera página",
                    lastPageTooltip: "Ir a la última página",
                    nextPageTooltip: "Ir a la página siguiente",
                    previousPageTooltip: "Ir a la página anterior",
                    nextPagerTooltip: "Ir al siguiente Pager",
                    previousPagerTooltip: "Ir a Pager anterior"
                };
            }
            else {
                ej.Pager.Locale["en-US"] = {
                    pagerInfo: "{0} of {1} pages ({2} items)",
                    firstPageTooltip: "Go to first page",
                    lastPageTooltip: "Go to last page",
                    nextPageTooltip: "Go to next page",
                    previousPageTooltip: "Go to previous page",
                    nextPagerTooltip: "Go to next pager",
                    previousPagerTooltip: "Go to previous pager"
                };
            }
            paegrObject.setModel({ locale: args.text });
        }

    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .frame {
             height:330px;
             width:500px;
        }
           #<%=sliderContent.ClientID%> > li img {
            width: 100%; 
			height:300px;
         }
    </style>
    </asp:Content>

