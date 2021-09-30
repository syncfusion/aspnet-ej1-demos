<%@ Page Title="Grid-Default Server Events-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo explains the functionalities of the default server side events that are available in Syncfusion ASP.NET Web Forms DataGrid control" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="DefaultServerEvents.aspx.cs" Inherits="WebSampleBrowser.Grid.DefaultServerEvents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Server Side Events / Default Server Events</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
           <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
        <ej:Grid ID="OrdersGrid" runat="server" EnableViewState="False" AllowPaging="True" AllowGrouping="True" 
            OnServerRowSelected="DefaultEvents_OnServerRowSelected" OnServerToolBarClick="DefaultEvents_OnServerToolBarClick" >
            <ClientSideEvents RecordClick="recordClick" ToolbarClick="onToolBarClick" />
            <ToolbarSettings ShowToolbar="True">
                <CustomToolbarItem>
                    <ej:CustomToolbarItem Text="Expand" />
                    <ej:CustomToolbarItem Text="Collapse" />
                    <ej:CustomToolbarItem Text="Refresh" />
                </CustomToolbarItem>
            </ToolbarSettings>
            <GroupSettings GroupedColumns="CustomerID"></GroupSettings>
            <Columns>
                <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="True" TextAlign="Right" Width="75" />
                <ej:Column Field="CustomerID" HeaderText="Customer ID" Width="80" />
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" TextAlign="Right" Width="75" />
                <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Width="75" Format="{0:C}" EditType="NumericEdit" />
                <ej:Column Field="ShipCity" HeaderText="Ship City" Width="110" />
            </Columns>
        </ej:Grid>
                <script type="text/javascript">
                    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(expandCollapse);
                </script>
                  </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="EventSection">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
         <ContentTemplate>
    <div class="cols-prop-area event-tracer">
        <div>
            <div class="heading">
                <span>Event Trace</span>
            </div>
            <div class="prop-grid content">
                <div class="eventarea">
                    <div class="EventLog" id="EventLog">
                        <div id="serverEvent" class="sf-event-panel" runat="server">
                        </div>
                    </div>
                </div>
                <div class="evtbtn">
                    <ej:Button ID="Clear" runat="server" Type="Button" Text="Clear" OnClick="Clear_OnClick"></ej:Button>
                </div>
            </div>
        </div>
    </div>
       </ContentTemplate>
        </asp:UpdatePanel>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">    
    <script type="text/javascript">        
        function expandCollapse() {
            var gridObj = $('#<%= OrdersGrid.ClientID %>').data("ejGrid");
            if (localStorage.getItem("isExpand") == "null" || $.parseJSON(localStorage.getItem("isExpand"))) {
                gridObj.expandAll();
            }
            else if (localStorage.getItem("isExpand") != null) {
                gridObj.collapseAll();
                localStorage.setItem("isExpand", "null");
            }
            $('#<%= OrdersGrid.ClientID %>').ejWaitingPopup("show");
            setTimeout(function () {
                $('#<%= OrdersGrid.ClientID %>').ejWaitingPopup("hide");
            }, 1000);
        }
        function onToolBarClick(sender, args) {
            $('#<%= OrdersGrid.ClientID %>').ejWaitingPopup("show");
            var tbarObj = $(sender.target);
            if (tbarObj.hasClass("Expand")) {
                this.expandAll();
                localStorage.setItem("isExpand", true);
            }
            else if (tbarObj.hasClass("Collapse")) {
                this.collapseAll();
                localStorage.setItem("isExpand", false);
            }
            else {
                this.refreshContent();
            }
        }
        function recordClick(args) {
            $('#<%= OrdersGrid.ClientID %>').ejWaitingPopup("show");
        }
    </script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css" class="cssStyles">
        .Expand {
            background-position: -180px 3px;
        }

        .Collapse {
            background-position: -205px 3px;
        }

        .Refresh {
            background-position: -80px 3px;
        }

        .e-toolbaricons {
            background-image: url("../Content/ejthemes/common-images/icons-gray.png");
        }

        .Expand:hover, .Collapse:hover, .refresh:hover {
            background-image: url("../Content/ejthemes/common-images/icons-white.png");
        }
    </style>
</asp:Content>

