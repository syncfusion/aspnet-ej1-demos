<%@ Page Title="Grid-Custom Summary-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo explains how to show custom summary values for numeric columns in Syncfusion ASP.NET Web Forms DataGrid control." MasterPageFile="~/Samplebrowser.Master"  AutoEventWireup="true" CodeBehind="CustomSummary.aspx.cs" Inherits="WebSampleBrowser.Grid.CustomSummary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Summary / Custom Summary</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="OrdersGrid" runat="server" AllowPaging="True" ShowSummary="True">
                     
             <SummaryRows>
                <ej:SummaryRow Title="Currency" >
                    <SummaryColumn>
                        <ej:SummaryColumn SummaryType="Custom" CustomSummaryValue="currency" DisplayColumn="Freight"
                            Format="{0:C2}" />
                    </SummaryColumn>
                </ej:SummaryRow>
            </SummaryRows>
            <Columns>
                <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="True" TextAlign="Right" Width="80" />
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" TextAlign="Right" Width="80" />
                <ej:Column Field="ShipCity" HeaderText="Ship City" Width="90" />
                <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Width="80" Format="{0:C}" />
            </Columns>
        </ej:Grid>
    </div>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        function currency() {
            var gridObj = $('#<%= OrdersGrid.ClientID %>').ejGrid("instance")
            var rs = ej.sum(gridObj.model.dataSource, "Freight")
            var dol = 0.017;
            return (rs * dol);
        }
    </script>
   </asp:Content>




