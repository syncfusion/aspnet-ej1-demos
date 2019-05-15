<%@ Page Title="Rotator-Data Binding - Local-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to bind the local data source key value mapping in the Syncfusion ASP.NET Web Forms Rotator component." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Databinding-Local.aspx.cs" Inherits="WebSampleBrowser.Rotator.databinding_json" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
            <ej:Rotator ID="sliderContent" runat="server"
                SlideWidth="100%"
                FrameSpace="0px"
                DisplayItemCount="1"
                SlideHeight="300"
                NavigateSteps="1"
                EnableResize="true"
                ShowPager="true"
                Enabled="true"
                ShowCaption="true"
                AllowKeyboardNavigation="true"
                ShowPlayButton="true"
                AnimationType="slide"
                DataSourceID="ObjectDataSource1"
                DataCaptionField="Caption"
                DataUrlField="Url" 
                IsResponsive="true">
            </ej:Rotator>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" TypeName="RotatorData"
                SelectMethod="GetRotatorItems"></asp:ObjectDataSource>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .frame {
            width: 500px;
        height: 300px
        }
        #<%=sliderContent.ClientID%> > li img {
            width: 100%; 
			height:300px;
         }
    </style>
</asp:Content>

