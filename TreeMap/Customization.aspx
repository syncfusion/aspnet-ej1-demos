<%@ Page Title="TreeMap-Customization-ASP.NET-SYNCFUSION" Language="C#"  MetaDescription="This sample demonstrates USA Olympics medals 2012 in the Syncfusion ASP.NET Web Forms Treemap control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Customization.aspx.cs" Inherits="WebSampleBrowser.TreeMap.Customization" %>
<%@ Register TagPrefix="a" Namespace="Syncfusion.JavaScript.DataVisualization.Models" Assembly="Syncfusion.EJ" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="ScriptSection">
    
    <script>
         $(window).on('load', function() {
            
             $("#customization").ejTreeMap("refresh");
         });
    </script>

</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="ControlsSection">

     <div>
        <label style="color:gray;font-size:x-large;font-family:'Segoe UI';font-weight:normal;" id="Label2">US Olympic Medals FY2012</label>
    </div>

    <div style="min-height:380px">
    <ej:Treemap ID="customization" runat="server" WeightValuePath = "TotalMedals" ColorValuePath = "GoldMedals">
        <TreeMapUniColorMapping Color = "#D73028"></TreeMapUniColorMapping>
        <LeafItemSettings ShowLabels = "true" LabelPath = "GameName" ItemTemplate="imageTemplate"></LeafItemSettings>
    </ej:Treemap>
    </div>

</asp:Content>

<asp:Content runat="server" ID="stylecontent" ContentPlaceHolderID="StyleSection">

   <script id="imageTemplate" type="application/jsrender">
            <div style="border:1px solid white;background:url({{:Data.GameImage}}) no-repeat center center;height:{{:ItemHeight}}px;width:{{:ItemWidth}}px;" />
      </script>
   

</asp:Content>

