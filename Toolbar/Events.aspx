<%@ Page Language="C#" Title="Toolbar-Server-Side Events-ASP.NET-SYNCFUSION" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Events.aspx.cs" Inherits="WebSampleBrowser.Toolbar.Events" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:Toolbar ID="toolbarEvents" runat="server" OnItemClick="toolbarEvents_ItemClick">
                <Items>
                    <ej:ToolbarItem Id="Mail" SpriteCssClass="mailtools movetofolder" TooltipText="Mail"></ej:ToolbarItem>
                    <ej:ToolbarItem Id="Scheduler" SpriteCssClass="mailtools categorize" TooltipText="Scheduler"></ej:ToolbarItem>
                    <ej:ToolbarItem Id="Calculator" SpriteCssClass="mailtools flag" TooltipText="Calculator"></ej:ToolbarItem>
                    <ej:ToolbarItem Id="StickyNotes" SpriteCssClass="mailtools forward" TooltipText="Sticky Notes"></ej:ToolbarItem>
                    <ej:ToolbarItem Id="Calendar" SpriteCssClass="mailtools newmail" TooltipText="Calendar"></ej:ToolbarItem>
                    <ej:ToolbarItem Id="Notes" SpriteCssClass="mailtools reply" TooltipText="Notes"></ej:ToolbarItem>
                    <ej:ToolbarItem Id="Delete" SpriteCssClass="mailtools done" TooltipText="Delete"></ej:ToolbarItem>
                </Items>
            </ej:Toolbar>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="EventSection">
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
                            <ej:Button ID="Clear" Type="Button" OnClick="Clear_Click" Text="Clear" runat="server"></ej:Button>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript" src="../Scripts/Toolbar/toolbarevent.js"></script>
    <script type="text/javascript">
        var toolbarObj;
        $(function () {
            toolbarObj = $("#<%=toolbarEvents.ClientID%>").data("ejToolbar");
        });


    </script>
    <style>
    .material .frame{
			width: 430px;
		}
    </style>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="StyleSection" runat="server">
    <link href="../Content/Toolbar/events.css" rel="stylesheet" />
</asp:Content>


