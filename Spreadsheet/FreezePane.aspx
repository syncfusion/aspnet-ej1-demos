<%@ Page Title="Spreadsheet-Freeze Pane-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" MetaDescription="This demo shows to keep a portion of the sheet visible, while scrolling through the rest of the worksheet using Syncfusion ASP.NET Web Spreadsheet control." CodeBehind="FreezePane.aspx.cs" Inherits="WebSampleBrowser.SpreadsheetASP.FreezePane" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadSection">
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.validate.unobtrusive.min.js" type="text/javascript"></script>
    <link href="../Content/Spreadsheet/SpreadsheetStyles.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Spreadsheet / Freeze Pane</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Spreadsheet ID="FlatSpreadsheet" AllowFormulaBar="false" ShowRibbon="false" EnableContextMenu="false" runat="server">
            <ClientSideEvents LoadComplete="loadComplete" />
            <ScrollSettings Height="450" />
            <Sheets>
                <ej:Sheet SheetName="Freeze Pane">
                    <RangeSettings>
                        <ej:RangeSetting/>
                    </RangeSettings>
                </ej:Sheet>
            </Sheets>
        </ej:Spreadsheet>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        function loadComplete(args) {
            this.setWidthToColumns([125, 204, 153, 224, 106, 133]);
            this.XLFormat.format({ "style": { "font-weight": "bold" } }, "A1:G1");
            this.XLFormat.format({ "style": { "text-align": "left" } }, "F2:F30");
            this.XLFreeze.freezePanes("C6");
        }
    </script>
</asp:Content>

