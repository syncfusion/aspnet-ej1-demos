<%@ Page Title="Grid-Column Template-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo explains how to render HTML elements in the cells of datagrid columns using Syncfusion ASP.NET Web Forms DataGrid control." AutoEventWireup="true" CodeBehind="ColumnTemplate.aspx.cs" MasterPageFile="~/Samplebrowser.Master" Inherits="WebSampleBrowser.Grid.ColumnTemplate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Columns / Column Template</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="EmployeesGrid" runat="server" AllowPaging="True">
            <PageSettings PageSize="4"></PageSettings>
            <Columns>
                <ej:Column HeaderText="Employee Image" Template="#columnTemplate" TextAlign="Center" Width="110" />
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" IsPrimaryKey="True" TextAlign="Right" Width="100" />
                <ej:Column Field="FirstName" HeaderText="First Name" Width="100" />
                <ej:Column Field="LastName" HeaderText="Last Name" Width="100" />
                <ej:Column Field="BirthDate" HeaderText="Birth Date" TextAlign="Right" Width="100" Format="{0:MM/dd/yyyy}" />
                <ej:Column Field="Country" Width="100" HeaderText="Country" />
            </Columns>
        </ej:Grid>
    </div>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/x-jsrender" id="columnTemplate">
        <img style="width: 75px; height: 70px" src="../Content/images/Employees/{{:EmployeeID}}.png" alt="{{ : EmployeeID }}" />
    </script>
</asp:Content>

