<%@ Page Title="Spreadsheet-PivotTable-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" MetaDescription="This demo shows how to summarize and analyze large amounts of data using Syncfusion ASP.NET Web Spreadsheet control." CodeBehind="Pivot.aspx.cs" Inherits="WebSampleBrowser.SpreadsheetASP.Pivot" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadSection">
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.validate.unobtrusive.min.js" type="text/javascript"></script>
    <link href="../Content/Spreadsheet/SpreadsheetStyles.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Spreadsheet / PivotTable</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Spreadsheet ID="FlatSpreadsheet" EnablePivotTable="true" AllowFormulaBar="false" OnServerExcelExporting="Spreadsheet_ServerExcelExporting" OnServerCsvExporting="Spreadsheet_ServerCsvExporting" OnServerPdfExporting="Spreadsheet_ServerPdfExporting" runat="server">
            <ClientSideEvents LoadComplete="loadComplete" OpenFailure="openfailure" />
            <ScrollSettings Height="540" />    
            <ImportSettings ImportMapper="SpreadsheetHandler.ashx" />
        </ej:Spreadsheet>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">

        function loadComplete(args) {
            if (!this.model.isImport) {
                var settings = {
                    rows: [
                                  {
                                      fieldName: "Country",
                                  },
                                  {
                                      fieldName: "State",
                                  }
                    ],
                    columns: [
                        {
                            fieldName: "Product",
                        }
                    ],
                    values: [
                        {
                            fieldName: "Amount",
                        },
                        {
                            fieldName: "Quantity",
                        }
                    ],
                    filters: [
                        {
                            fieldName: "Date",
                        }
                    ]
                };
                this.XLPivot.createPivotTable("Sheet1!$A$1:$F$25", null, null, settings);
            }
        }

        function openfailure(args) {
            this.alert(args.statusText);
        }

    </script>
</asp:Content>

