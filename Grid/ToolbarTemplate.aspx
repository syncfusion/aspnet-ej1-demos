<%@ Page Title="Grid-ToolBar Template-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo explains how to render custom template elements in a toolbar by which any custom operation can be performed in Syncfusion ASP.NET Web Forms DataGrid." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="ToolbarTemplate.aspx.cs" Inherits="WebSampleBrowser.Grid.ToolbarTemplate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / ToolBar Template</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="OrdersGrid" runat="server" AllowPaging="True" AllowGrouping="True">
            <ClientSideEvents ToolbarClick="onToolBarClick" />
            <EditSettings AllowAdding="True" AllowDeleting="True" AllowEditing="True"></EditSettings>
            <GroupSettings ShowGroupedColumn="True" GroupedColumns="ShipCity"></GroupSettings>
            <ToolbarSettings ShowToolbar="True">
                <CustomToolbarItem>
                    <ej:CustomToolbarItem Text="Expand" />
                    <ej:CustomToolbarItem Text="Collapse" />
                    <ej:CustomToolbarItem TemplateID="#Refresh" />
                </CustomToolbarItem>
            </ToolbarSettings>
            <Columns>
                <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="True" TextAlign="Right" Width="75" />
                <ej:Column Field="CustomerID" HeaderText="Customer ID" Width="100" />
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" TextAlign="Right" Width="75" />
                <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Width="70" Format="{0:C}" />
                <ej:Column Field="ShipCity" HeaderText="Ship City" Width="110" />
            </Columns>
        </ej:Grid>
    </div>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script id="Refresh" type="text/x-jsrender">
        <a class="e-toolbaricons refresh" />
    </script>
    <script type="text/javascript">
        function onToolBarClick(sender) {
            if (sender.itemName == "Expand")
                this.expandAll();
            else if (sender.itemName == "Collapse")
                this.collapseAll();
            else
                this.refreshContent();
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
        .refresh {
            background-position: -76px 3px;
        }
        .e-toolbaricons {
            background-image: url("../Content/ejthemes/common-images/icons-gray.png");
        }
        .Expand:hover, .Collapse:hover, .refresh:hover {
            background-image: url("../Content/ejthemes/common-images/icons-white.png");
        }
    </style>
</asp:Content>

