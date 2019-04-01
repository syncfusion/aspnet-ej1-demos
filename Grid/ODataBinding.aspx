<%@ Page Title="Grid-OData Binding-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo explains how to bind the OData services as data source to the datagrid using Syncfusion ASP.NET Web Forms DataGrid." AutoEventWireup="true" CodeBehind="ODataBinding.aspx.cs" MasterPageFile="~/Samplebrowser.Master" Inherits="WebSampleBrowser.Grid.Urlbinding" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Data Binding / OData Binding </span>
</asp:Content>


<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
     <div>
        <ej:Grid ID="OrdersGrid" runat="server" Query="ej.Query().where(ej.Predicate('OrderID', ej.FilterOperators.lessThan, 10448, true).and('ShipCountry', 'notequal', 'null', true))" AllowPaging="True" AllowSorting="True" AllowFiltering="True" AllowGrouping="True" >
            <DataManager URL="//js.syncfusion.com/demos/ejServices/Wcf/Northwind.svc/Orders/" CrossDomain="true"></DataManager>
            <FilterSettings FilterType="Menu"></FilterSettings>
            <Columns>
                <ej:Column Field="OrderID" HeaderText=" OrderID" IsPrimaryKey="True" TextAlign="Right" Width="75" />
                <ej:Column Field="OrderDate" HeaderText="Order Date" Format="{0:dd/MM/yyyy}" Type="date" Width="90" />
                <ej:Column Field="ShipName" HeaderText="Ship Name" TextAlign="Right" Width="90" />
                <ej:Column Field="ShipCity" HeaderText="Ship City" Width="80" />
                <ej:Column Field="ShipCountry" HeaderText="Ship Country" Width="100" />
            </Columns>
            <PageSettings PageSize="10" />
            <GroupSettings GroupedColumns="ShipCountry" EnableDropAreaAnimation="false"></GroupSettings>
        </ej:Grid>
    </div>
</asp:Content>


<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="EventSection">
    <div class="cols-prop-area event-tracer">
                <div>
                    <div class="heading">
                        <span>RESTful APIs</span>
                    </div>

                    <div class="prop-grid content">
                        <div class="eventarea" style="margin:5px 0px;">
                            <span class="eventTitle" style="overflow-wrap: break-word; font-weight: bold; padding:20px 0px;">//js.syncfusion.com/demos/ejServices/Wcf/Northwind.svc/Orders/?</span>
                        </div>
                        <div class="eventarea">
                            <div class="EventLog" id="EventLog" style="word-break: break-all;">
                            </div>
                        </div>
                        <div class="evtbtn">
                            <ej:Button ID="Clear" runat="server" Type="Button" Text="Clear" ClientSideOnClick="onClear"></ej:Button>
                        </div>
                    </div>
                </div>
            </div>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        $(document).ajaxSend(function (event, jqxhr, settings) {
            jQuery.addEventLog("<span class='eventTitle' id='url'> " + settings.url.split("?")[1] + " </span>");
        });

        function onClear() {
            $("#EventLog").html("");
        }
    </script>
</asp:Content>



