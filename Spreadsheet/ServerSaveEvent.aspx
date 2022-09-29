<%@  Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" MetaDescription="This demo shows detail about the server-side events available in the ASP.NET Web Spreadsheet control" CodeBehind="ServerSaveEvent.aspx.cs" Inherits="WebSampleBrowser.SpreadsheetASP.ServerSaveEvent" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadSection">
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.validate.unobtrusive.min.js" type="text/javascript"></script>
    <link href="../Content/Spreadsheet/SpreadsheetStyles.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Spreadsheet / Server Side Events / SaveEvent</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <ej:Spreadsheet ID="FlatSpreadsheet" ShowRibbon="false" AllowFormulaBar="false" OnServerCellSave="Spreadsheet_ServerCellSave" runat="server">
                    <ClientSideEvents LoadComplete="loadComplete" CellSave="cellSave" />
                    <ScrollSettings Height="450" />
                    <Sheets>
                        <ej:Sheet>
                            <RangeSettings>
                                <ej:RangeSetting ShowHeader="false" />
                            </RangeSettings>
                        </ej:Sheet>
                    </Sheets>
                </ej:Spreadsheet>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="EventSection">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div class="cols-prop-area event-tracer">
                <div>
                    <div class="heading">
                        <span>Event Trace</span>
                    </div>
                    <div class="prop-grid content">
                        <div class="eventarea">
                            <div class="EventLog" id="EventLog">
                                <div id="serverEvent" class="sf-event-panel" runat="server">
                                </div>
                            </div>
                        </div>
                        <div class="evtbtn">
                            <ej:Button ID="Clear" runat="server" Type="Button" Text="Clear" OnClick="Clear_OnClick"></ej:Button>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        
        function loadComplete(args) {
            this.setWidthToColumns([104, 145, 145, 175, 190, 186]);
        }

        function cellSave(args) {
            this.showWaitingPopUp();
        }

    </script>
</asp:Content>

