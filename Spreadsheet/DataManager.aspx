<%@ Page Title="Spreadsheet-Data Manager-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" MetaDescription="This demo shows Datamanager functionalities in the Syncfusion ASP.NET Web Spreadsheet control" CodeBehind="DataManager.aspx.cs" Inherits="WebSampleBrowser.SpreadsheetASP.DataManager" %>

<%@ Register assembly="Syncfusion.EJ" namespace="Syncfusion.JavaScript.Models" tagprefix="ej" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadSection">
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.validate.unobtrusive.min.js" type="text/javascript"></script>
    <link href="../Content/Spreadsheet/SpreadsheetStyles.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Spreadsheet / Data Binding / Data Manager</span>
</asp:Content>
<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
         <ej:DataManager ID="dataManager" runat="server" URL="//js.syncfusion.com/demos/ejServices/Wcf/Northwind.svc/Orders/" CrossDomain = "true" />
    </div>
    <div>
        </div>
        <ej:Spreadsheet ID="FlatSpreadsheet" AllowFormulaBar="false" ShowRibbon="false" RowCount="32" ColumnWidth="100" runat="server">
            <ClientSideEvents LoadComplete="loadComplete" />
            <ScrollSettings Height="450" />
            <Sheets>
                <ej:Sheet DataManagerID="dataManager" Query="ej.Query().take(150).select(['OrderID', 'CustomerID', 'EmployeeID', 'ShipName', 'ShipAddress', 'ShipCity', 'ShipCountry'])" PrimaryKey="OrderID" FieldAsColumnHeader="true">
                </ej:Sheet>
            </Sheets>
        </ej:Spreadsheet>
    <div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        function loadComplete(args) {
            this.setWidthToColumns([80, 100, 80, 200, 290, 100, 110]);
        }
    </script>
</asp:Content>

