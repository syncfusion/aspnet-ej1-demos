<%@ Page Title="" Language="C#" MetaDescription="This demo explains how to render the datagrid content and header with plain HTML elements using Syncfusion ASP.NET Web Forms DataGrid control." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="HtmlEncode.aspx.cs" Inherits="WebSampleBrowser.Grid.HtmlEncode" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadSection">
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Columns / Html Encode</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
       <ej:Grid ID="EmployeesGrid" runat="server"  DataSourceID="ObjectData" AllowSorting="True" AllowPaging="True" AllowGrouping="true" >
            <ToolbarSettings ShowToolbar="true" ToolbarItems="add,edit,delete,update,cancel"/>
            <EditSettings RowPosition="Bottom" AllowAdding="true" AllowEditing="true" AllowDeleting="true" />           
            <Columns>
                <ej:Column Field="Country" HeaderText=" Country" IsPrimaryKey="True" Width="100" />
                <ej:Column Field="EmployeeID" HeaderText="<div>Employee ID</div>" Width="100" disableHtmlEncode="true"  />
                <ej:Column Field="FirstName" HeaderText="<div>First Name</div>" TextAlign="Right" Width="80" disableHtmlEncode="true" />
                <ej:Column Field="LastName" HeaderText="Last Name" TextAlign="Right" Width="80" />
                <ej:Column Field="TestDate" HeaderText="Date" TextAlign="Right" Width="150" />
                <ej:Column Field="Title" HeaderText="Title" Width="100" />
            </Columns>
            <PageSettings PageSize="5" />
        </ej:Grid>
    </div>
    <asp:ObjectDataSource ID="ObjectData" runat="server" TypeName="EmployeeDetails" SelectMethod="GetRecords">
    </asp:ObjectDataSource>
 </script>
    </asp:Content>