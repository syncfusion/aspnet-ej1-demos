<%@ Page Title="Grid-Summary Template-ASP.NET-SYNCFUSION"   Language="C#" AutoEventWireup="true" CodeBehind="SummaryTemplate.aspx.cs" MasterPageFile="~/Samplebrowser.Master" Inherits="WebSampleBrowser.Grid.SummaryTemplate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Summary / Summary Template</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="OrdersGrid" runat="server" AllowPaging="True" ShowSummary="True">
            <PageSettings PageSize="10"></PageSettings>
            <SummaryRows>
                <ej:SummaryRow>
                    <SummaryColumn>
                        <ej:SummaryColumn SummaryType="Sum" DisplayColumn="Freight" DataMember="Freight"
                            Template="#summaryTemplate" Format="{0:C}" />
                    </SummaryColumn>
                </ej:SummaryRow>
            </SummaryRows>
            <ClientSideEvents ActionComplete="complete" DataBound="complete" />
            <Columns>
                <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="True" TextAlign="Right" Width="80" />
                <ej:Column Field="CustomerID" HeaderText="Customer ID" TextAlign="Left" Width="80" />
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" TextAlign="Right" Width="80" />
                <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Width="80" Format="{0:C}" />
                <ej:Column Field="ShipCity" HeaderText="Ship City" Width="90" />
            </Columns>
        </ej:Grid>
    </div>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script id="summaryTemplate" type="text/x-jsrender">
        <input type="text" id="summaryType" />
        <div style="padding-top: 5px; text-align: center">: {{:summaryValue}}</div>
        <div id="typeList">
            <ul>
                <li value="sum">Sum</li>
                <li value="average">Average</li>
                <li value="count">Count</li>
                <li value="minimum">Minimum</li>
                <li value="maximum">Maximum</li>
            </ul>
        </div>
    </script>
    <script type="text/javascript">
        var selectedText = null;
        function complete(args) {
            if (args.requestType == "refresh" || args.type == "dataBound" || args.requestType == "paging") {
                $("#summaryType").ejDropDownList({
                    targetID: "typeList",
                    change: "change",
                    value: ej.isNullOrUndefined(selectedText) ? "sum" : selectedText,
                    htmlAttributes: { style: "float:left;width:100px" }
                });
            }
        }
        function change(args) {
            selectedText = args.selectedValue;
            var gridObj = $("#<%= OrdersGrid.ClientID %>").ejGrid("instance");
            var summaryColumn = gridObj.model.summaryRows[0].summaryColumns[0];
            summaryColumn.summaryType = selectedText;
            summaryColumn.format = selectedText == "count" ? "{0:N0}" : "{0:C2}";
            gridObj.refreshContent();
        }
    </script>
</asp:Content>

