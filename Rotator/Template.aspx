<%@ Page Title="Rotator-Template-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to customize the Syncfusion ASP.NET Web Forms Rotator component slides with different needs." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Template.aspx.cs" Inherits="WebSampleBrowser.Rotator.template" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:Rotator ID="sliderContent" runat="server"
                SlideWidth="100%"
                FrameSpace="0px"
                SlideHeight="223px"
                ShowPager="true"
                AnimationSpeed=1200
                enableAutoPlay="true"
                ShowPlayButton="true" IsResponsive="true"
                Template="<div style='background-color:${color}; height:300px'> <div style='padding: 32px 10px 20px 40px'> <img class='eimgs' src='../Content/images/rotator/${eimg}.png' alt='employee' /> </div>  <div style='padding: 0 100px 0 250px'><div class='ename'> ${text} </div> <div class='desig'> ${desig} </div><div class='cont'> ${country} </div></div></div>">
            </ej:Rotator>
         </div>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
     .frame {
        width: 452px;
        height: 250px;
    }

    .eimgs {
        border-radius: 50%;
        background-color: #DDDDDD;
        float: left;
        height: 159px !important;
        width: 159px !important;
    }

    .ename {
        font-family: segoe UI;
        font-weight: bold;
        font-size: 20px;
        padding-top: 10px;
        color: white;
    }

    .desig {
        font-family: segoe UI;
        font-size: 14px;
        opacity: 0.8;
        color: white;
        padding-bottom: 3px;
    }

    .cont {
        font-family: segoe UI;
        font-size: 14px;
        padding-top: 3px;
        border-top: 1px solid white;
    }
    </style>
</asp:Content>

