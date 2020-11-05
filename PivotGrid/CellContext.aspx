<%@ Page Title="PivotGrid-Cell Context-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo for Syncfusion Essential JS1 for ASP.NET pivot grid control describes how to retrieve the cell information when right-clicking on it" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="CellContext.aspx.cs" Inherits="WebSampleBrowser.CellContext" %>

<%@ Register Assembly="Syncfusion.EJ.Pivot" Namespace="Syncfusion.JavaScript.Web" TagPrefix="ej" %>
<%@ Register Assembly="Syncfusion.EJ.Pivot" Namespace="Syncfusion.JavaScript.Models" TagPrefix="ej" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ControlsSection">
   <ej:PivotGrid ID="PivotGrid1" IsResponsive="true" runat="server"  ClientIDMode="Static" enablecellcontext="true">
       <DataSource>
            <Rows>
                <ej:Field FieldName="Country" FieldCaption="Country"></ej:Field>
                <ej:Field FieldName="State" FieldCaption="State"></ej:Field>
            </Rows>
            <Columns>
                <ej:Field FieldName="Product" FieldCaption="Product"></ej:Field>
            </Columns>
            <Values>
                <ej:Field FieldName="Amount" FieldCaption="Amount"></ej:Field>
                <ej:Field FieldName="Quantity" FieldCaption="Quantity"></ej:Field>
            </Values>
        </DataSource>
        <ClientSideEvents Load="onLoad" cellcontext="cell_RightClick"/>
   </ej:PivotGrid>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="EventSection">
    <div class="cols-prop-area event-tracer">
        <div>
            <div class="heading">
                <span>Event Trace</span>
            </div>
            <div class="prop-grid content">
                <div class="eventarea">
                    <div class="EventLog" id="EventLog"></div>
                </div>
                <div class="evtbtn">
                    <input type="button" class="eventclear e-btn" value="Clear" onclick="onClear()" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        function onLoad(args) {
            args.model.dataSource.data = pivot_dataset;
        }
        $(function () {
            $(document).bind("click", function () {
                $(".contextMenuPopup").remove();
            });
        });
        onClear = function () {
            jQuery.clearEventLog();
        },
        cell_RightClick = function (evt) {
            jQuery.addEventLog("Cell Context Menu is opened");
            $(".contextMenuPopup").remove();
            var contextMenu = $('<div class="contextMenuPopup"></div>');
            $(contextMenu[0]).html('<div class="menuItem">Cell Type</div><div class="menuItem">Position</div><div class="menuItem">Value</div>');
            $(contextMenu[0]).css("left", evt.args.args.clientX + 10).css("top", evt.args.args.clientY + 10);
            $("#PivotGrid1").append(contextMenu[0]);
            $(".menuItem").click(function (e) {
                if (e.target.innerHTML == "Value")
                    jQuery.addEventLog("Cell Value: " + evt.args.cellValue);
                else if (e.target.innerHTML == "Cell Type") {
                    var cellType = evt.args.cellType == "value" ? "Value Cell" : (evt.args.cellType == "colheader" ? "Column Header" : (evt.args.cellType == "rowheader" ? "Row Header" : ((evt.args.role == "rowheader" || evt.args.role == "columnheader") ? "Summary Header" : "Summary Cell")));
                    jQuery.addEventLog("Cell Type: " + cellType);
                }
                else if (e.target.innerHTML == "Position")
                    jQuery.addEventLog("Cell Position: Column-" + (parseInt(evt.args.cellPosition.split(',')[0]) + 1) + " Row-" + (parseInt(evt.args.cellPosition.split(',')[1]) + 1));
            });
        }
	 window.loadPivotGridFrameTheme = function () {
            window.setTimeout(function () {
                var pivotGridElement = $("#PivotGrid1").data("ejPivotGrid");
                if (pivotGridElement && pivotGridElement.model.enableGroupingBar && pivotGridElement.getJSONRecords() != null)
                    pivotGridElement.renderControlFromJSON();
            }, 2500);
        }
     </script>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="StyleSection">
    <style type="text/css">
        #PivotGrid1 {
            height: 350px;
            width: 100%;
            overflow: auto;
            float:left;
        }
        .menuItem {
            padding:5px 50px 5px 20px;
        }
        .contextMenuPopup {
            position: fixed;
            background-color: #e6e6e6;
            border: #BBBCBB solid 1px;
            padding: 1px;
            color:#565656;
        }
                 .row .cols-sample-area
         {
             float:left;
             width:72%;
         }
                    .row .cols-prop-area {
            width: 25%;
            float:right;
        }
    </style>
</asp:Content>

