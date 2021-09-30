<%@ Page Language="C#" Title="TagCloud-Client-Side Events-ASP.NET-SYNCFUSION" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="ClientSideEvents.aspx.cs" Inherits="WebSampleBrowser.TagCloud.ClientSideEvents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="controlframe" style="width: 350px;">
    <ej:TagCloud ID="tagEvents" Title="Car Models"
        DataSourceID="ObjectDataSource1" DataTextField="text" ClientSideOnCreate="oncreate" ClientSideOnClick="onclick" ClientSideOnMouseOver="onmouseover" ClientSideOnMouseOut="onmouseout" DataUrlField="url" DataFrequencyField="frequency"
        runat="server"></ej:TagCloud>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" TypeName="TagCloudData"
        SelectMethod="GetTagCloudItems"></asp:ObjectDataSource>
        </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="EventSection" runat="server">
    <div class="cols-prop-area event-tracer">
        <div>
            <div class="heading">
                <span>Event Trace</span>
                <div class="pull-right">
                    <ej:DropDownList ID="selectControls" ClientSideOnPopupShown="adjustpopupposition" ClientSideOnCheckChange="evtpropscheckedevent" ShowCheckbox="true" CheckAll="true" runat="server">
                        <Items>
                            <ej:DropDownListItem Value="click" Text="click"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="mouseout" Text="mouseout"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="mouseover" Text="mouseover"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            <div class="prop-grid content">
                <div class="eventarea">
                    <div class="EventLog" id="EventLog">
                    </div>
                </div>
                <div class="evtbtn">
                    <ej:Button ID="Clear" Text="Clear" ClientSideOnClick="onClear" Type="Button" CssClass="eventclear e-btn" runat="server"></ej:Button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/TagCloud/Events.js")%>' type="text/javascript"></script>
</asp:Content>


