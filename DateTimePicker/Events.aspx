<%@ Page Title="DateTimePicker-Server-Side Events-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="Events.aspx.cs" MetaDescription="This example demonstrates the various events like create, change, open and close in a ASP.NET Web Forms DateTimePicker" Inherits="WebSampleBrowser.DateTimePicker.events" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:DateTimePicker ID="dateTime" runat="server" Width="100%" OnFocusOut="dateTime_FocusOut" OnChange="dateTime_Change" Value="05/28/2018 2:47 AM"></ej:DateTimePicker>
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
                            <ej:Button ID="Clear" Type="Button" OnClick="Clear_Click" Text="Clear" ClientSideOnClick="onClear" CssClass="eventclear e-btn" runat="server"></ej:Button>
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
            padding: 50px;
            width: 30%;
        }
    </style>
</asp:Content>

