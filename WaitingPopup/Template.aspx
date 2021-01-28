<%@ Page Language="C#" Title="WaitingPopup-Template-ASP.NET-SYNCFUSION" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Template.aspx.cs" MetaDescription="This demo shows templates using Syncfusion ASP.NET Web WaitingPopup control." Inherits="WebSampleBrowser.WaitingPopup.Template" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
     <div class="controlframe"  style="position:relative;">
    <ej:WaitingPopup ID="target" runat="server" ShowOnInit="True"  AppendTo=".controlframe" Template="#content" CssClass="waiting"></ej:WaitingPopup>
    <div id="content">
        <div class="block">
            <div class="logo"></div>
            <div class="txt">
                <p>Create cutting-edge </p>
                <p><b>HTML5</b> web applications </p>
                <p>with ease </p>
            </div>
        </div>
        <div class="loader"></div>
    </div>
         </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css" class="cssStyles">
        #<%=target.ClientID%> {
            height: 320px;
        }

        .block {
            height: 76px;
        }

        .logo {
            background-image: url("../Content/images/waitingpopup/js_logo.png");
            float: left;
            height: 100%;
            width: 77px;
            margin-right: 15px;
            background-repeat: no-repeat;
        }

        .txt {
            float: left;
            font-size: 17px;
            height: 100%;
            text-align: left;
        }

            .txt p {
                margin: 0;
            }

        .loader {
            background: url("../Content/images/waitingpopup/load_light.gif") no-repeat scroll -5px 18px transparent;
            height: 40px;
        }

        .darktheme .loader {
            background-image: url("../Content/images/waitingpopup/load_dark.gif");
        }

        #content {
            cursor: default;
            height: 112px;
            top: 104px;
            margin: 0 auto;
            width: 300px;
            left: 0px !important;
        }

        @media (min-width:0px) and (max-width:450px){
            #content{
                width:200px !important;
            }

            .logo {
                margin-right: 0px;
                background-size: 88% 88%;
                margin-top: 8px;
                width: 67px;
            }

            .txt {
                font-size: 14px;
                width: 130px;
            }
        }
    </style>
</asp:Content>

