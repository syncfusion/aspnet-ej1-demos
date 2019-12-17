<%@ Page Title="Signature-Server-Side Events-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates server-side events when particular operations are performed in the Syncfusion ASP.NET Web Forms Signature component." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="ServerSideEvents.aspx.cs" Inherits="WebSampleBrowser.Signature.ServerSideEvents" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame ">
        <div class="control">
		 <h3>Sign here</h3>
            <ej:Signature ID="signature" Height="400px" StrokeWidth="3" IsResponsive="true" OnChange="signature_Change" runat="server"></ej:Signature>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="EventSection" runat="server">
    <asp:UpdatePanel ID="UpdatePanelProp" UpdateMode="Conditional" runat="server">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="clearbutton" EventName="click" />
        </Triggers>
        <ContentTemplate>
            <div id="Event-Tracer" class="cols-prop-area event-tracer">
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
                            <ej:Button ID="clearbutton" Type="Button" CssClass="eventclear e-btn" Text="Clear" OnClick="clearbutton_Click" runat="server"></ej:Button>
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
            width: 80%;
        }
        #Event-Tracer {
            height: 450px;
        }

        #EventLog {
            height: 340px;
        }
    </style>
</asp:Content>

