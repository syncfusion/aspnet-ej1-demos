<%@ Page Title="DropDownList-Server-Side Events-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Event.aspx.cs" MetaDescription="This sample demonstrates the server side OnSelect event in ASP.NET Web Forms DropDownList control." Inherits="WebSampleBrowser.DropDownList.Event" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">

    <div class="frame">
        <div class="control">
            <ej:DropDownList ID="selectCountry" runat="server" OnValueSelect="selectCountry_ValueSelect" WatermarkText="Select a country" Width="100%">
                <Items>
                    <ej:DropDownListItem Text="America" Value="America"></ej:DropDownListItem>
                    <ej:DropDownListItem Text="Australia" Value="Australia"></ej:DropDownListItem>
                    <ej:DropDownListItem Text="Austria" Value="Austria"></ej:DropDownListItem>
                    <ej:DropDownListItem Text="Bangladesh" Value="Bangladesh"></ej:DropDownListItem>
                    <ej:DropDownListItem Text="Brazil" Value="Brazil"></ej:DropDownListItem>
                    <ej:DropDownListItem Text="Canada" Value="Canada"></ej:DropDownListItem>
                    <ej:DropDownListItem Text="China" Value="China"></ej:DropDownListItem>
                    <ej:DropDownListItem Text="Denmark" Value="Denmark"></ej:DropDownListItem>
                    <ej:DropDownListItem Text="Europe" Value="Europe"></ej:DropDownListItem>
                    <ej:DropDownListItem Text="France" Value="France"></ej:DropDownListItem>
                    <ej:DropDownListItem Text="Germany" Value="Germany"></ej:DropDownListItem>
                    <ej:DropDownListItem Text="India" Value="India"></ej:DropDownListItem>
                    <ej:DropDownListItem Text="Japan" Value="Japan"></ej:DropDownListItem>
                    <ej:DropDownListItem Text="Kuwait" Value="Kuwait"></ej:DropDownListItem>
                    <ej:DropDownListItem Text="Malaysia" Value="Malaysia"></ej:DropDownListItem>
                    <ej:DropDownListItem Text="New Zealand" Value="New Zealand"></ej:DropDownListItem>
                </Items>
            </ej:DropDownList>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="EventSection" runat="server">
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
                            <ej:Button ID="Clear" Type="Button" Text="Clear" OnClick="Clear_Click" ClientSideOnClick="onClear" CssClass="eventclear e-btn" runat="server"></ej:Button>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>


