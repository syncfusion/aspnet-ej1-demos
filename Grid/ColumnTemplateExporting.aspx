<%@ Page Title="Grid-ColumnTemplate Exporting-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo explains how to include the template column while exporting data to Excel, Word, and PDF using Syncfusion ASP.NET Web Forms DataGrid control." AutoEventWireup="true" CodeBehind="ColumnTemplateExporting.aspx.cs" MasterPageFile="~/Samplebrowser.Master" Inherits="WebSampleBrowser.Grid.ColumnTemplateExporting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Exporting / ColumnTemplate Exporting</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="EmployeesGrid" runat="server" AllowPaging="True" OnServerExcelExporting="EmployeesGrid_ServerExcelExporting" OnServerWordExporting="EmployeesGrid_ServerWordExporting" OnServerPdfExporting="EmployeesGrid_ServerPdfExporting" OnServerExcelColumnTemplateInfo="EmployeesGrid_ServerExcelColumnTemplateInfo" OnServerWordColumnTemplateInfo="EmployeesGrid_ServerWordColumnTemplateInfo" OnServerPdfColumnTemplateInfo="EmployeesGrid_ServerPdfColumnTemplateInfo">
            <ToolbarSettings ShowToolbar="true" ToolbarItems="excelExport,wordExport,pdfExport"></ToolbarSettings>
            <Columns>
                <ej:Column HeaderText="First Name" Template="#columnTemplate" TextAlign="Center" Width="110" />
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" TextAlign="Right" Width="100" />
                <ej:Column Field="LastName" HeaderText="Last Name" Width="100" />
                <ej:Column Field="BirthDate" HeaderText="Birth Date" TextAlign="Right" Width="100" Format="{0:MM/dd/yyyy}" />
                <ej:Column Field="Country" Width="100" HeaderText="Country" />
            </Columns>
        </ej:Grid>
    </div>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/x-jsrender" id="columnTemplate">
        <a href="https://www.syncfusion.com">{{:FirstName}}</a>
    </script>
</asp:Content>

