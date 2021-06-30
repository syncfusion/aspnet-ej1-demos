<%@ Page Title="Spreadsheet-Show or Hide-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" MetaDescription="This demo shows how to show or hide the rows and columns using Syncfusion ASP.NET Web Spreadsheet control" CodeBehind="ShowHide.aspx.cs" Inherits="WebSampleBrowser.SpreadsheetASP.ShowHide" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadSection">
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.validate.unobtrusive.min.js" type="text/javascript"></script>
    <link href="../Content/Spreadsheet/SpreadsheetStyles.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Spreadsheet / Show or Hide</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Spreadsheet ID="FlatSpreadsheet" AllowFormulaBar="false" ShowRibbon="false" runat="server">
            <ClientSideEvents LoadComplete="loadComplete" />
            <ScrollSettings Height="450" />
            <Sheets>
                <ej:Sheet SheetName="Show Hide Row Column">
                    <RangeSettings>
                        <ej:RangeSetting />
                    </RangeSettings>
                </ej:Sheet>
            </Sheets>
        </ej:Spreadsheet>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">

        function loadComplete(args) {
            this.setWidthToColumns([105, 119, 159, 219, 154, 154, 154]);
            this.XLFormat.format({ "style": { "font-weight": "bold" } }, "A1:G1");
            this.XLFormat.format({ "style": { "text-align": "right" } }, "F2:F30");
            this.hideRow(5, 8);
            this.hideRow(10, 15);
            this.hideColumn(2, 2);
            this.performSelection("A1");
        }

    </script>
</asp:Content>

