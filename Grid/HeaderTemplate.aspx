<%@ Page Title="Grid-Header Template-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo explains how to customize column headers to show additional HTML elements, such as icons, images, etc. in Syncfusion ASP.NET Web Forms DataGrid control." AutoEventWireup="true" CodeBehind="HeaderTemplate.aspx.cs" MasterPageFile="~/Samplebrowser.Master" Inherits="WebSampleBrowser.Grid.HeaderTemplate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Columns / Header Template</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="OrdersGrid" runat="server" AllowPaging="True">
            <Columns>
                <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="True" TextAlign="Right" Width="75" />
                <ej:Column Field="CustomerID" HeaderText="Customer ID" Width="90" />
                <ej:Column Field="ShipCity" HeaderText="Ship City" Width="90" />
                <ej:Column Field="OrderDate" HeaderText="Order Date" HeaderTemplateID="#dateTemplate"
                    TextAlign="Right" Width="100" Format="{0:MM/dd/yyyy}" />
                <ej:Column Field="ShipCountry" HeaderText="Ship Country" Width="110" />
                <ej:Column Field="EmployeeID" HeaderText="Emp ID" HeaderTemplateID="#employeeTemplate" TextAlign="Right" Width="90" />
            </Columns>
        </ej:Grid>
    </div>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script id="dateTemplate" type="text/x-jsrender">
        <span class="date headericon"></span>Order Date
    </script>
    <script id="employeeTemplate" type="text/x-jsrender">
        <span class="headericon employee"></span>Emp ID
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .headericon {
            background-image: url(../Content/ejthemes/common-images/icons-gray.png);
            padding-left: 20px;
        }
        .date {
            background-position: -3px -86px;
        }
        .employee {
            background-position: -82px -62px;
        }
    </style>
</asp:Content>



