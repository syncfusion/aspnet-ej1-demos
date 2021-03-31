<%@ Page Title="TreeMap-DrillDown-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This sample demonstrates drill down feature based on the countries in the continent in the Syncfusion ASP.NET Web Forms Treemap control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DrillDown.aspx.cs" Inherits="WebSampleBrowser.TreeMap.DrillDown" %>

<%@ Register TagPrefix="a" Namespace="Syncfusion.JavaScript.DataVisualization.Models" Assembly="Syncfusion.EJ" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="ScriptSection">

    <script>
        $(window).on('load', function() {

            $("#LayoutSection_ControlsSection_treemap").ejTreeMap("refresh");
        });
    </script>

</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="ControlsSection">
    <div style="min-height:405px">
    <ej:TreeMap ID="treemap" runat="server"  EnableDrillDown = "true" drillDownSelectionColor = "#199DAF" WeightValuePath="Population" OnClientHeaderTemplateRendering="loadTemplate">
        <TreeMapUniColorMapping Color = "#CCDFE3"></TreeMapUniColorMapping>
        <Levels>
            <ej:TreeMapLevel GroupPath = "Continent" ShowLabels = "true" GroupGap = "5" ShowHeader="false" LabelPosition="TopLeft" HeaderHeight = "25"></ej:TreeMapLevel>
            <ej:TreeMapLevel GroupPath = "Country" ShowLabels = "true" GroupGap = "0" ShowHeader="false" LabelPosition="TopLeft" HeaderHeight = "25"></ej:TreeMapLevel>
            <ej:TreeMapLevel GroupPath = "Name" ShowLabels = "true" GroupGap = "0" ShowHeader="false" LabelPosition="TopLeft" HeaderHeight = "25"></ej:TreeMapLevel>
        </Levels>
    </ej:TreeMap>
    </div>
    <script type="text/javascript">
        function loadTemplate(sender) {
            if (sender.headerItem.drilldownHeaders) {
                var length = sender.childItems.length;
                population = 0;
                for (var i = 0; i < length; i++) {
                    population = population + sender.childItems[i].Population;
                }
                for (var j = 0; j < sender.headerItem.drilldownHeaders.length; j++) {                   
                    if (j == sender.headerItem.drilldownHeaders.length - 1)
                        sender.headerItem.drilldownHeaders[j] = sender.headerItem.originalHeaders[j] + " - Population : " + population.toLocaleString();
                    else
                        sender.headerItem.drilldownHeaders[j] = sender.headerItem.originalHeaders[j];
                }
            }
        }
    </script>
</asp:Content>

