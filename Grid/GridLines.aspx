<%@ Page Title="Grid-GridLines-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This demo explains how to customize the grid lines in datagrid using Syncfusion ASP.NET Web Forms DataGrid control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="InlineOnLocalData.aspx.cs" Inherits="WebSampleBrowser.Grid.InlineOnLocalData" %>


<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / GridLines</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <ej:Grid ID="OrdersGrid" runat="server" AllowPaging="True" GridLines="Both" AllowTextWrap="true">
                    
                    <Columns>
                        <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="true" TextAlign="Right" Width="80"></ej:Column>
                        <ej:Column Field="CustomerID" HeaderText="Customer ID" Width="80"></ej:Column>
                        <ej:Column Field="EmployeeID" HeaderText="Employee ID" TextAlign="Right" Width="80" />
                        <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Width="80" Format="{0:C}"></ej:Column>
                        <ej:Column Field="ShipCountry" HeaderText="ShipCountry" Width="90" EditType="DropdownEdit" />
                        <ej:Column Field="ShipName" HeaderText="ShipName" Width="180" />
                     </Columns>
                </ej:Grid>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                    GridLines
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ID="rowPosition" runat="server" ClientSideOnChange="selectChange" SelectedItemIndex="0" Width="120px">
                        <Items>
                            <ej:DropDownListItem Text="Both" Value="both" />
                            <ej:DropDownListItem Text="Vertical" Value="vertical" />
                            <ej:DropDownListItem Text="Horizontal" Value="horizontal" />
                            <ej:DropDownListItem Text="None" Value="none" />
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="ScriptContent" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
            
        });
        
        function selectChange(args) {
            $('#<%= OrdersGrid.ClientID %>').ejGrid("model.gridLines", args.selectedValue);
        }
    </script>
</asp:Content>



