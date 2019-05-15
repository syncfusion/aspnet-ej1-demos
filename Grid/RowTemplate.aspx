<%@ Page Title="Grid-Row Template-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo explains how to render datagrid rows with predefined custom template using the Row Template feature of Syncfusion ASP.NET Web Forms DataGrid." AutoEventWireup="true" CodeBehind="RowTemplate.aspx.cs" MasterPageFile="~/Samplebrowser.Master" Inherits="WebSampleBrowser.Grid.RowTemplate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Rows / Row Template</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="EmployeesGrid" runat="server" AllowScrolling="True" RowTemplate="#templateData">
            <ScrollSettings Height="380" Width="500"></ScrollSettings>
            <Columns>
                <ej:Column HeaderText="Photo" Width="30" />
                <ej:Column HeaderText="Employee Details" Width="70" />
            </Columns>
        </ej:Grid>
    </div>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script id="templateData" type="text/x-jsrender">
        <tr>
            <td class="photo">
                <img src="../Content/images/Employees/{{:EmployeeID}}.png" alt="{{ : EmployeeID }}" />
            </td>
            <td class="details">
                <table class="cardTable" cellpadding="3" cellspacing="2">
                    <colgroup>
                        <col width="50%">
                        <col width="50%">
                    </colgroup>
                    <tbody>
                        <tr>
                            <td class="CardHeader">First Name </td>
                            <td>{{:FirstName}} </td>
                        </tr>
                        <tr>
                            <td class="CardHeader">Last Name</td>
                            <td>{{:LastName}} </td>
                        </tr>
                        <tr>
                            <td class="CardHeader">Title </td>
                            <td>{{:Title}} </td>
                        </tr>
                        <tr>
                            <td class="CardHeader">Birth Date </td>
                            <td>{{:BirthDate.toLocaleDateString()}} </td>
                        </tr>
                        <tr>
                            <td class="CardHeader">Hire Date </td>
                            <td>{{:HireDate.toLocaleDateString()}} </td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .photo img {
            width: 130px;
			height: 115px;
        }
        .photo, .details {
            border-color: #c4c4c4;
            border-style: solid;
        }
        .photo {
            border-width: 1px 0px 0px 0px;
        }
        .details {
            border-width: 1px 0px 0px 1px;
        }
        .details > table {
             width: 100%;
        }   
        .CardHeader {
            font-weight: bolder;
        }
		td
		{
			padding: 2px 2px 3px 2px;
		}
    </style>
</asp:Content>

