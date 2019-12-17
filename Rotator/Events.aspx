<%@ Page Title="Rotator-Client-Side Events-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates client-side events when particular operations are performed in the Syncfusion ASP.NET Web Forms Rotator component." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="WebSampleBrowser.Rotator.myevent" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">

    <div class="frame">
            <ej:Rotator ID="Rotatorcontent"
                FrameSpace="0px"
                DisplayItemCount="1"
                SlideHeight="300"
                NavigateSteps="1"
                EnableResize="true"
                PagerPosition="Outside"
                Orientation="Horizontal"
                ShowPager='true'
                Enabled="true"
                ShowCaption="false"
                AllowKeyboardNavigation="true"
                EnalbeRtl="true"
                ShowPlayButton="true"
                AnimationType="slide"
                ShowThumbnail="false"
                ClientSideOnCreate="oncreate"
                ClientSideOnChange="onchange"
                ClientSideOnStart="onstart"
                ClientSideOnStop="onstop"
                ClientSideOnThumbClick="onnavClick"
                ClientSideOnPagerClick="onpagerClick" 
                SlideWidth="100%" IsResponsive="true" runat="server">
            </ej:Rotator>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="EventSection" runat="server">
    <div class="cols-prop-area event-tracer">
        <div>
            <div class="heading">
                <span>Event Trace</span>
                <div class="pull-right">
                    <ej:DropDownList ID="selectControls" ClientSideOnPopupShown="adjustpopupposition" ClientSideOnCheckChange="evtpropscheckedevent" ShowCheckbox="true" CheckAll="true" runat="server">
                        <Items>
                            <ej:DropDownListItem Value="create" Text="Create"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="start" Text="start"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="stop" Text="stop"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="thumbItemClick" Text="thumbClick"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="change" Text="change"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="pagerClick" Text="pagerClick"></ej:DropDownListItem>
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
                    <ej:Button ID="clearbutton" Type="Button" CssClass="eventclear e-btn" ClientSideOnClick="onClear" Text="Clear" runat="server"></ej:Button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script src="../Scripts/Rotator/Events.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
         .frame{
             height:300px;
             width:500px;
        }
           #<%=Rotatorcontent.ClientID%> > li img {
            width: 100%; 
			height:300px;
         }
    </style>
</asp:Content>

