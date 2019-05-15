<%@ Page Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DataBindingRemote.aspx.cs" Inherits="WebSampleBrowser.ReportViewer.DataBindingRemote" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">ReportViewer / DataBindingLocal</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div style="width: 100%; height: 100%;">
        <ej:ReportViewer ClientIDMode="Static" ID="ReportViewer1" runat="server" ReportPath="~/App_Data/Reports/DatabindingRemote.rdlc" ProcessingMode="Local" OnClientReportLoaded="onreportloaded">
        </ej:ReportViewer>
    </div>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ScriptSection">
    <style type="text/css">
        #ReportViewer1 {
            height: 650px;
        }
    </style>
    <script type="text/javascript">
        function onreportloaded(senderObj) {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: '../wcf/Reportservice.svc/GetOrderDetails',
                    dataType: "json",
                    processData: false, 
                    crossDomain: true,
                    async: false,
                    timeout: 5000,
                    success: function (result) {
                        reportdata = result.d;  
                        var dataManger = ej.DataManager(reportdata);
                        var query = ej.Query().select("OrderID", "CustomerID", "EmployeeID", "Freight", "ShipCity", "ShipCountry");
                        reportResult = dataManger.executeLocal(query);
                        var reportModel = $("#ReportViewer1").data('ejReportViewer');
                        reportModel.model.dataSources = [{ value: reportResult, name: "remote" }];
                    },
                    error: function (result) {
                        alert(result);
                    }
            });
           }
    </script>

</asp:Content>

