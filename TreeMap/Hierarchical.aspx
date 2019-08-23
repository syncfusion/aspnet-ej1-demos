<%@ Page Title="TreeMap-Hierarchical-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This sample indicates to define levels for hierarchical data collection in the Syncfusion ASP.NET Web Forms Treemap control"MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Hierarchical.aspx.cs" Inherits="WebSampleBrowser.TreeMap.Hierarchical" %>

<%@ Register TagPrefix="a" Namespace="Syncfusion.JavaScript.Web" Assembly="Syncfusion.EJ.Web" %>
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
    <ej:TreeMap ID="treemap" runat="server" IsHierarchicalDatasource="true" TooltipTemplate ="tooltiptemp" ShowTooltip = "true" ColorValuePath = "Expense" WeightValuePath="Sales" >
        <TreeMapDesaturationColorMapping From = "1" To ="0.5" Color="#41B8C4" RangeMinimum="2000" RangeMaximum = "8000">
        </TreeMapDesaturationColorMapping>

        <Levels>
            <ej:TreeMapLevel GroupPath = "States" GroupGap = "3" HeaderHeight = "25" ShowLabels = "true" LabelTemplate = "labeltemplate"></ej:TreeMapLevel>
        </Levels>
        <LeafItemSettings LabelPath = "Name"></LeafItemSettings>
    </ej:TreeMap>
    </div>
</asp:Content>

<asp:Content runat="server" ID="stylecontent" ContentPlaceHolderID="StyleSection">

    

    <div id="tooltiptemp" style="display: none;">
        <table style="background-color: #222222; width: 166px; height: 107px;">
            <tr>
                <td colspan="3">
                    <label style="font-size: 18px; color: white; margin-left: 10px; opacity: 0.8; font-weight: normal;">{{:Country}}</label>
                </td>
            </tr>
            <tr>
                <td>
                    <label style="font-size: 14px; color: white; margin-left: 10px; opacity: 0.8; font-weight: normal;">Region</label></td>
                <td>
                    <label style="font-size: 14px; color: white; margin-left: 10px; opacity: 0.8; font-weight: normal;">:</label></td>
                <td colspan="3">
                    <label style="font-size: 14px; color: white; margin-left: 10px; opacity: 0.8; font-weight: normal;">{{:Name}}</label></td>
                <td style="width: 20px;"></td>
            </tr>
            <tr>
                <td>
                    <label style="font-size: 14px; color: white; margin-left: 10px; opacity: 0.8; font-weight: normal;">Sales</label></td>
                <td>
                    <label style="font-size: 14px; color: white; margin-left: 10px; opacity: 0.8; font-weight: normal;">:</label></td>
                <td colspan="3">
                    <label style="font-size: 14px; color: white; margin-left: 10px; opacity: 0.8; font-weight: normal;">{{:Sales}}</label></td>
            </tr>
            <tr>
                <td>
                    <label style="font-size: 14px; color: white; margin-left: 10px; opacity: 0.8; font-weight: normal;">Expense</label></td>
                <td>
                    <label style="font-size: 14px; color: white; margin-left: 10px; opacity: 0.8; font-weight: normal;">:</label></td>
                <td colspan="3">
                    <label style="font-size: 14px; color: white; margin-left: 10px; opacity: 0.8; font-weight: normal;">{{:Expense}}</label></td>
            </tr>
            <tr></tr>
            <tr></tr>
        </table>        
    </div> 

     <script id="headertemplate" type="application/jsrender">
     
	        <div>
                <label style="color:gray;font-size:18px;font-weight:normal;" id="Label1">{{:header}}</label><br />            
            </div>                        
          </script>     

         <script id="labeltemplate" type="application/jsrender">    
           <div align="center"  style="width:120px; height:120px;background-image:url('../Content/images/TreeMap/circle.png');">
             <table style="text-align:center;margin-left:-10px; margin-top:10px;" >
               <tr>
                <td></td>
                <th>
	            <div style="margin-top:10px;margin-left:10px;">
	            <label style="color:white;font-size:16px;font-weight:normal;" id="Label2">Sales</label>
	            </div></th>  
              </tr>

              <tr>
                <td></td>
                <td>
	            <div style="margin-top:-5px;">
	            <label style="color:white;font-size:15px;font-weight:normal;" id="Label5">98486</label>
	            </div>
	            </td>    
              </tr>

              <tr>
                <td></td>
                <th>
	            <div style="margin-top:3px;margin-left:2px;">
	            <label style="color:white;font-size:16px;margin-top:-5px;font-weight:normal;" id="Label3">Expense</label>
	            </div></th>     
              </tr>

              <tr>
                 <td></td>
                <td>
	            <div style="margin-top:-5px;">
	            <label style="color:white;font-size:15px;font-weight:normal;" id="Label4">87000</label>
	            </div></td>    
              </tr>
            </table>
          </div>     
   </script>
</asp:Content>

