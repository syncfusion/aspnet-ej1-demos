<%@ Page Title="UploadBox-Server-Side Events-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Events.aspx.cs" MetaDescription="This sample demonstrates the upload control OnComplete server side event in ASP.NET Web Forms." Inherits="WebSampleBrowser.UploadBox.Events" %>


<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .posupload {
            margin-left: 50px;
            margin-top: 20px;
        }

        .cols-sample-area {
            position: relative;
        }
    </style>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <div class="posupload">
                <ej:UploadBox ID="Upload1" runat="server" SaveUrl="saveFiles.ashx" RemoveUrl="removeFiles.ashx" OnLoad="Upload1_Load" OnComplete="Upload1_Complete"></ej:UploadBox>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="EventSection" runat="server">
    <asp:UpdatePanel ID="UpdatePanelProp" UpdateMode="Conditional" runat="server">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="Clear" EventName="click" />
        </Triggers>
        <ContentTemplate>
            <div class="cols-prop-area event-tracer">
                <div>
                    <div class="heading">
                        <span>Event Trace</span>
                    </div>
                    <div class="prop-grid content">
                        <div class="eventarea">
                            <div class="EventLog" id="EventLog" runat="server" clientidmode="Static">
                            </div>
                        </div>
                        <div class="evtbtn">
                            <ej:Button ID="Clear" Type="Button" Text="Clear" OnClick="Clear_Click" CssClass="eventclear e-btn" runat="server"></ej:Button>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

