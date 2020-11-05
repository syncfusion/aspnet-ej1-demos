<%@ Page Title="Buttons-Server-Side Events-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="Events.aspx.cs" Inherits="WebSampleBrowser.Buttons.events" MetaDescription="This example demonstrates the various events like click and itemselect in a ASP.NET Web Forms Button, ToggleButton, SplitButton, GroupButton controls" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <table>
                <tr>
                    <td class="btnsht">Button
                    </td>
                    <td class="btnsht">
                        <ej:Button ID="ButtonNormal" runat="server" Size="Large" Type="Reset" OnClick="ButtonNormal_Click" ShowRoundedCorner="true" Text="Button"></ej:Button>
                    </td>
                </tr>
                <tr>
                    <td class="btnsht">Toggle Button
                    </td>
                    <td class="btnsht">
                        <ej:ToggleButton ID="ToggleButton" runat="server" Size="Large" OnClick="ToggleButton_Click" ShowRoundedCorner="true" DefaultText="Play" ActiveText="Stop"></ej:ToggleButton>
                    </td>
                </tr>
                <tr>
                    <td class="btnsht">Split Button
                    </td>
                    <td class="splttd btnsht">
                        <ej:SplitButton ID="SplitButton" runat="server" Size="Large" ShowRoundedCorner="true" Text="Save" OnClick="SplitButton_Click" OnItemSelect="SplitButton_ItemSelect">
                            <Items>
                                <ej:SplitItem Text="Open"></ej:SplitItem>
                                <ej:SplitItem Text="Save"></ej:SplitItem>
                                <ej:SplitItem Text="Delete"></ej:SplitItem>
                            </Items>
                        </ej:SplitButton>
                    </td>
                </tr>               
            </table>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="EventSection" runat="server">
    <asp:UpdatePanel ID="UpdatePanelProp" UpdateMode="Conditional" runat="server">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ClearButton" EventName="click" />
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
                            <ej:Button ID="ClearButton" Type="Button" runat="server" Text="Clear" OnClick="ClearButton_Click"></ej:Button>
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
            width: 50%;
        }
    </style>
</asp:Content>

