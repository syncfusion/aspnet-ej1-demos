<%@ Page Language="C#" MetaDescription="This example demonstrates server-side events and triggers when particular operations are performed in the Syncfusion ASP.NET Web Forms Radial Slider component." AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Event.aspx.cs" Inherits="WebSampleBrowser.RadialSlider.Event" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="control listbox">
        <div class="frame">
			<ej:RadialSlider ID="slider"  InnerCircleImageUrl="../Content/images/radialslider/chevron-right.png" OnChange="sliderchange" runat="server"></ej:RadialSlider>
		</div>
	</div>
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
<asp:Content ID="Content1" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .row [class*="cols-"] {
            overflow-x: auto;
        }
    </style>
</asp:Content>