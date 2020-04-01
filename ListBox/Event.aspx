<%@ Page Title="ListBox-Server-Side Events-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates server-side events when particular operations are performed in the Syncfusion ASP.NET Web Forms ListBox component." Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Event.aspx.cs" Inherits="WebSampleBrowser.ListBox.Event" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="control listbox" style="display:none">
        <div class="frame">
            <div class="ctrllabel">Select your skill</div>
            <ej:ListBox runat="server" ID="select1" OnValueSelect="select1_ValueSelect" ClientSideOnCreate="OnCreated">
                <Items>
                    <ej:ListBoxItems Text="ASP.NET"></ej:ListBoxItems>
                    <ej:ListBoxItems Text="ActionScript"></ej:ListBoxItems>
                    <ej:ListBoxItems Text="Basic"></ej:ListBoxItems>
                    <ej:ListBoxItems Text="C++"></ej:ListBoxItems>
                    <ej:ListBoxItems Text="C#"></ej:ListBoxItems>
                    <ej:ListBoxItems Text="dBase"></ej:ListBoxItems>
                    <ej:ListBoxItems Text="Delphi"></ej:ListBoxItems>
                    <ej:ListBoxItems Text="ESPOL"></ej:ListBoxItems>
                    <ej:ListBoxItems Text="F#"></ej:ListBoxItems>
                </Items>
            </ej:ListBox>
        </div>
    </div>
    <script type="text/javascript">
function OnCreated() {
    if (document.body.firstElementChild.className = "htmljssamplebrowser material"){
        setTimeout(function () {
                    var obj = $("#<%=select1.ClientID%>").ejListBox("instance");
                    obj._refreshScroller();
                }, 800);
            }
    setTimeout(function () {
        $(".listbox").css("display", "block");
    }, 300);
        }
</script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PropertySection" runat="server">
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
                            <ej:Button ID="Clear" Text="Clear" OnClick="Clear_Click" Type="Button" CssClass="eventclear e-btn" runat="server"></ej:Button>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css" class="cssStyles">
        .e-ddl-popup {
            margin: 0 auto;
        }

        .ctrllabel {
            font-weight: 600;
            padding-bottom: 12px;
        }
    </style>
</asp:Content>

