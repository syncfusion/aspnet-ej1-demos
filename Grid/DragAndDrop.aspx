<%@ Page Title="Grid-Drag-and-Drop-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo explains how to drag and drop rows from one datagrid to another datagrid or any other custom control using Syncfusion ASP.NET Web Forms DataGrid control." AutoEventWireup="true" CodeBehind="DragAndDrop.aspx.cs" MasterPageFile="~/Samplebrowser.Master" Inherits="WebSampleBrowser.Grid.DragAndDrop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Rows / Row Reordering</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <div style="float:left;width:50%">
        <ej:Grid ID="OrdersGrid" runat="server" AllowPaging="True" AllowRowDragAndDrop="true" Selectiontype="Multiple">
            <RowDropSettings DropMapper="DragAndDrop.aspx/Reordering"/>
            <PageSettings ShowDefaults="false" PageSize="9" EnableTemplates="true" Template="#pagerTemplate" />
            <EditSettings AllowEditing="true"/>
            <Columns>
                <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="True" TextAlign="Right" Width="55" />
                <ej:Column Field="CustomerID" HeaderText="Customer ID" Width="70" />
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" TextAlign="Right" Width="70" />
                <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Width="55" Format="{0:C}" />
            </Columns>
            <ClientSideEvents RowDrag="rowDrag" RowDragStart="rowDragStart" RowDrop="rowDrop" ActionComplete="complete" />
        </ej:Grid>
            </div>
        <div style="float:right;width:49%">
            <ej:Grid ID="DestGrid" runat="server" AllowPaging="True" AllowRowDragAndDrop="true" Selectiontype="Multiple">
                <RowDropSettings DropMapper="DragAndDrop.aspx/Reordering"/>
                <PageSettings ShowDefaults="false" PageSize="9" EnableTemplates="true" Template="#pagerTemplate" />
            <Columns>
                <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="True" TextAlign="Right" Width="50" />
                <ej:Column Field="CustomerID" HeaderText="Customer ID" Width="70" />
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" TextAlign="Right" Width="70" />
                <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Width="50" Format="{0:C}" />
            </Columns>
            <ClientSideEvents RowDrag="rowDrag" RowDragStart="rowDragStart" RowDrop="rowDrop" ActionComplete="complete" />
                </ej:Grid>
            </div>
    </div>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="EventSection">
    <div class="cols-prop-area event-tracer">
        <div>
            <div class="heading">
                <span>Event Trace</span>
            </div>
            <div class="prop-grid content"> 
                <div class="eventarea">
                    <div class="EventLog" id="EventLog">
                    </div>
                </div>              
                <div class="evtbtn">
                    <ej:Button ID="Clear" runat="server" Type="Button" Text="Clear" ClientSideOnClick="onClear"></ej:Button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/x-jsrender" id="pagerTemplate">
        <div class="e-pagercontainer">
            <div class="e-first e-icon e-mediaback e-firstpagedisabled e-disable" title="Go to first page"></div><div class="e-prev e-icon e-arrowheadleft-2x e-prevpagedisabled e-disable" style="border-right:none" title="Go to previous page"></div>
        </div>
        <div class="e-pagercontainer" style="border-radius:0px" >
            <input id="currentPage" class="e-pagercontainer" type="text" style="text-align:center; margin:0px;border:none;width:32px;height:23px" />
        </div>
        <div id="totalPages" class="e-pagercontainer" style="margin-left:2px;margin-bottom:5px;border:none">
            <span></span>
        </div>
        <div class="e-pagercontainer">
            <div class="e-nextpage e-icon e-arrowheadright-2x e-default" title="Go to next page"></div><div class="e-lastpage e-icon e-mediaforward e-default" title="Go to last page"></div>
        </div>
    </script>
    <style>
	    #currentPage{
		   background-color:white;
		}
	   .darktheme #currentPage{
		   background-color:black;
		}
       .e-pager .e-pagercontainer {
           margin:0px;
           margin-left: 6px;
       } 
 	   .e-pagercontainer .e-icon {
           display: inline-block;
           height: 8px;
        }
	</style>
    <script type="text/javascript">
        function complete(args) {
            this.element.find("#totalPages").find('span').text('of ' + this.model.pageSettings.totalPages);
            if (this.initialRender)
                this.element.find("#currentPage").val(1);
            this.element.find(".e-pagercontainer:first").css('border-style', 'none');
            if (args.requestType == 'paging') {
                if (this.model.pageSettings.currentPage == this.model.pageSettings.totalPages) {
                    this.element.find('.e-nextpage').addClass('e-nextpagedisabled').removeClass('e-nextpage');
                    this.element.find('.e-lastpage').addClass('e-lastpagedisabled').removeClass('e-lastpage');
                }
                else {
                    this.element.find('.e-nextpagedisabled').addClass('e-nextpage').removeClass('e-nextpagedisabled');
                    this.element.find('.e-lastpagedisabled').addClass('e-lastpage').removeClass('e-lastpagedisabled');
                }
                if (this.model.pageSettings.currentPage == 1) {
                    this.element.find('.e-prevpage').addClass('e-prevpagedisabled e-disable').removeClass('e-prevpage');
                    this.element.find('.e-firstpage').addClass('e-firstpagedisabled e-disable').removeClass('e-firstpage');
                }
                else {
                    this.element.find('.e-prevpagedisabled').addClass('e-prevpage').removeClass('e-prevpagedisabled e-disable');
                    this.element.find('.e-firstpagedisabled').addClass('e-firstpage').removeClass('e-firstpagedisabled e-disable');
                }
                this.element.find("#currentPage").val(this.model.pageSettings.currentPage);
            }
            if (this.model.pageSettings.totalPages != null)
                this.element.find(".e-pager").css("display", "block");
            else
                this.element.find(".e-pager").css("display", "none");
        }
        function rowDrag(args) {
            jQuery.addEventLog("Grid <span class='eventTitle'>rowDrag</span> event called");
        }
        function rowDragStart(args) {
            jQuery.addEventLog("Grid <span class='eventTitle'>rowDragStart</span> event called");
        }
        function rowDrop(args) {
            jQuery.addEventLog("Grid <span class='eventTitle'>rowDrop</span> event called");
        }
        function onClear() {
            $("#EventLog").html("");
        }
    </script>
</asp:Content>

