<%@ Page  Language="C#" Title="ProgressBar / Server-Side Events" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="Events.aspx.cs" MetaDescription="This example demonstrates the clientside side complete event in a ASP.NET Web Forms ProgressBar." Inherits="WebSampleBrowser.ProgressBar.events" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptSection" runat="server">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/ProgressBar/events.js")%>' type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">

            <div id="progressBar"></div>
            <div>
                <ej:ProgressBar ID="ProgressBar1" ClientSideOnComplete="completed"
                    OnComplete="ProgressBar1_Complete" runat="server" Height="20px">
                </ej:ProgressBar>
            </div>

        </div>
        <div class="startButton">
            <ej:ToggleButton ID="startButton" Type="Button" Size="Small" DefaultText="Start" ActiveText="Pause" ClientSideOnClick="startProcess" runat="server">
            </ej:ToggleButton>


        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="EventSection" runat="server">
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
                            <div class="EventLog" id="EventLog" runat="server">
                            </div>
                        </div>
                        <div class="evtbtn">
                            <ej:Button ID="Clear" Type="Button" OnClick="Clear_Click" Text="Clear" CssClass="eventclear e-btn" runat="server"></ej:Button>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .frame {
            width: 40%;
        }
        .startButton {
            text-align:center;
            padding:10px;
        }
		.darktheme .e-progressbar .e-progress-txt {
            background-color: black;
        }
    </style>
</asp:Content>
