<%@ Page Title="Spreadsheet-Protect Sheet-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" MetaDescription="This demo shows how to prevent the unwanted changes from others using Syncfusion ASP.NET Web Spreadsheet control" CodeBehind="ProtectSheet.aspx.cs" Inherits="WebSampleBrowser.SpreadsheetASP.ProtectSheet" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadSection">
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.validate.unobtrusive.min.js" type="text/javascript"></script>
    <link href="../Content/Spreadsheet/SpreadsheetStyles.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Spreadsheet / Protect Sheet</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Spreadsheet ID="FlatSpreadsheet" ColumnWidth="100" AllowLockCell="true" AllowFormulaBar="false" ShowRibbon="false" runat="server">
            <ClientSideEvents LoadComplete="loadComplete" />
            <ScrollSettings Height="450" />
        </ej:Spreadsheet>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                    <ej:Button ID="lockBtn" runat="server" ClientSideOnClick="lockcell" Type="Button" Text="Lock Cell" ShowRoundedCorner="true" Size="Small" Width="105px">
                    </ej:Button>
                </div>
                <div class="col-md-3">
                    <ej:Button ID="UnlockBtn" runat="server" ClientSideOnClick="unLockcell" Type="Button" Text="Unlock Cell" ShowRoundedCorner="true" Size="Small" Width="105px">
                    </ej:Button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
        });

        function loadComplete(args) {
            this.XLFormat.format({ "style": { "font-weight": "bold", "vertical-align": "middle", "text-align": "center", "background-color": "#559ad9", "color": "#FFFFFF" } }, "A1:F1");
            this.XLFormat.format({ type: "currency" }, "F2:F25");
        }
        
        function lockcell() {
            var xlObj = $('#<%= FlatSpreadsheet.ClientID %>').data("ejSpreadsheet");
            xlObj.protectSheet(false);
            xlObj.lockCells(xlObj.getSheet(xlObj.getActiveSheetIndex()).selectedRange, true);
            xlObj.protectSheet(true);
        }

        function unLockcell() {
            var xlObj = $('#<%= FlatSpreadsheet.ClientID %>').data("ejSpreadsheet");
            xlObj.protectSheet(false);
            xlObj.lockCells(xlObj.getSheet(xlObj.getActiveSheetIndex()).selectedRange, false);
        }
    </script>
</asp:Content>

