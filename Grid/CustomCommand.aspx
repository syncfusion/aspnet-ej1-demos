<%@ Page Title="Grid-Custom Command-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo explains how to include custom buttons as one of the columns in Syncfusion ASP.NET Web Forms DataGrid control." AutoEventWireup="true" CodeBehind="CustomCommand.aspx.cs" MasterPageFile="~/Samplebrowser.Master" Inherits="WebSampleBrowser.Grid.CustomCommand" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Column / Custom Command</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
   <div style="position:relative">
        <ej:Grid ID="EmployeesGrid" ClientIDMode="Static" runat="server" AllowSelection="False" EnableRowHover="False">
            <Columns>
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" IsPrimaryKey="True" TextAlign="Right" Width="100" />
                <ej:Column Field="FirstName" HeaderText="First Name" Width="100" />
                <ej:Column Field="LastName" HeaderText="Last Name" Width="100" />
                <ej:Column Field="HireDate" HeaderText="Hire Date" TextAlign="Right" Width="100" Format="{0:MM/dd/yyyy}" />
                <ej:Column Field="Country" Width="100" HeaderText="Country" />
                <ej:Column HeaderText="Employee Details" IsUnbound="True" TextAlign="Left" Width="150">
                    <Command>
                        <ej:Commands Type="detail">
                            <ButtonOptions Text="Details" Width="100" Click="onClick"></ButtonOptions>
                        </ej:Commands>
                    </Command>
                </ej:Column>
            </Columns>
        </ej:Grid>
        <ej:Dialog ID="commanddialog" ClientIDMode="Static" runat="server" Width="450" Title="Details of employee" ShowOnInit="false"
            EnableResize="False" Target="#EmployeesGrid">
        </ej:Dialog>
    </div>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script id="templateData" type="text/x-jsrender">
        <table>
            <tr>
                <td style="text-align: center">
                    <img class="emp-img" src="../Content/images/Employees/{{:EmployeeID}}.png" alt="{{: EmployeeID }}" />
                </td>
                <td>
                    <table class="CardTable" cellpadding="3" cellspacing="2">
                        <tr>
                            <td>Name</td>
                            <td>: {{:TitleOfCourtesy}} {{:FirstName}} {{:LastName}}</td>
                        </tr>
                        <tr>
                            <td>Birth Date</td>
                            <td>: {{:BirthDate}} </td>
                        </tr>
                        <tr>
                            <td>Title</td>
                            <td>: {{:Title}} </td>
                        </tr>
                        <tr>
                            <td>City</td>
                            <td>: {{:City}} </td>
                        </tr>
                        <tr>
                            <td>Code</td>
                            <td>: {{:PostalCode}} </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </script>

    <script type="text/javascript">
        function onClick(args) {
            var grid = $("#EmployeesGrid").ejGrid("instance");
            var index = this.element.closest("tr").index();
            var record = grid.getCurrentViewData()[index];
            record["BirthDate"] = ej.format(record["BirthDate"], "MM/dd/yyyy");
            $("#commanddialog").html($("#templateData").render(record))
                .ejDialog("option", { position: { X: this.element.position().left - 761, Y: this.element.position().top - 161 } })
                .ejDialog("open");
            if (navigator.userAgent.indexOf("MSIE 8.0") != -1)
                $("#commanddialog").find("img").width(150);
        }
    </script>
</asp:Content>

