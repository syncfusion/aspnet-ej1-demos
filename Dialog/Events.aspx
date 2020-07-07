<%@ Page Title="Dialog-Server-Side Events-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates server-side events when particular operations are performed in the Syncfusion ASP.NET Web Forms Dialog component." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="WebSampleBrowser.Dialog.Events" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="control">
        <ej:Button ID="dlgOpen" Type="Button" CssClass="e-btn" Text="Click to open dialog" ClientSideOnClick="btnclick" runat="server"></ej:Button>
        <ej:Dialog ID="eventDialog" Title="Facebook" runat="server" IsResponsive="True" OnInit="eventDialog_Init" OnClose="eventDialog_Close" Containment=".control" Width="550">
            <DialogContent>
                <div class="cnt">
                    Facebook is an online social networking service headquartered in Menlo Park, California. Its website was launched on February 4, 2004, by Mark Zuckerberg with his Harvard College roommates and fellow students Eduardo Saverin, Andrew McCollum, Dustin Moskovitz and Chris Hughes.The founders had initially limited the website's membership to Harvard students, but later expanded it to colleges in the Boston area, the Ivy League, and Stanford University. It gradually added support for students at various other universities and later to high-school students.
                </div>
            </DialogContent>
        </ej:Dialog>
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
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        function btnclick() {
            var dialogObj = $("#<%=eventDialog.ClientID%>").data("ejDialog");
            dialogObj.open();
            $("#<%=dlgOpen.ClientID%>").hide();
        }
    </script>
    <style type="text/css">
        #LayoutSection_maincontrolarea {
            padding: 0;
        }

        .control {
            height: 450px;
            position: relative;
        }

        #Event-Tracer {
            height: 450px;
        }

        #EventLog {
            height: 340px;
        }

        .cnt {
            text-align: justify;
        }
        #LayoutSection_ControlsSection_dlgOpen {
            position: absolute;
            margin: 10px;
        }
    </style>
</asp:Content>

