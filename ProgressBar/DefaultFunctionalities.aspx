<%@ Page  Language="C#" Title="ProgressBar-Default Functionalities-ASP.NET-SYNCFUSION" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DefaultFunctionalities.aspx.cs" MetaDescription="This demo explains how to initialize the Syncfusion ASP.NET Web Forms ProgressBar control." Inherits="WebSampleBrowser.ProgressBar._default" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="imgframe controlframe">
        <div class="control">
            <span class="txt">Water Purification</span>
            <div>
                <ej:ProgressBar ID="ProgressBar1" runat="server" Value="45" Height="20px"></ej:ProgressBar>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .imgframe {
            background: url("../Content/images/progressbar/water.png") no-repeat scroll 0 0 transparent;
            height: 200px;
            padding: 60px;
            background-size: 100% 100%;
        }

        .txt {
            color: #676767;
            display: block;
            font-size: 21px;
            margin-bottom: 12px;
        }
    </style>
</asp:Content>

