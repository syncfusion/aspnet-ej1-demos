<%@ Page  Language="C#" Title="ProgressBar-RTL-ASP.NET-SYNCFUSION" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="RTL.aspx.cs" MetaDescription="This example demonstrates how to enable the rtl property in a ASP.NET Web Forms ProgressBar." Inherits="WebSampleBrowser.ProgressBar.rtl" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">

            <div>
                <ej:ProgressBar ID="ProgressBar1" runat="server" Value="35" Height="20px" EnableRTL="true"></ej:ProgressBar>
            </div>

        </div>
    </div>
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .frame {
            width: 35%;
        }
    </style>
</asp:Content>

