<%@ Page Title="Pager-Default Functionalities-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" MetaDescription="This example demonstrates the default functionalities of the Pager in ASP.NET Web Forms" AutoEventWireup="true" CodeBehind="DefaultFunctionalities.aspx.cs" Inherits="WebSampleBrowser.Pager.DefaultFunctionalities" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame ">
        <div class="control">
            <ej:Rotator ID="sliderContent" runat="server"
                SlideWidth="100%"
                ShowPager="false"
                Enabled="true"
                ShowNavigateButton="false"
                IsResponsive="true">
                <Items>
                    <ej:RotatorItem Url="../Content/images/rotator/nature.jpg"></ej:RotatorItem>
                    <ej:RotatorItem Url="../Content/images/rotator/bird.jpg"></ej:RotatorItem>
                    <ej:RotatorItem Url="../Content/images/rotator/sculpture.jpg"></ej:RotatorItem>
                    <ej:RotatorItem Url="../Content/images/rotator/seaview.jpg"></ej:RotatorItem>
                    <ej:RotatorItem Url="../Content/images/rotator/snowfall.jpg"></ej:RotatorItem>
                    <ej:RotatorItem Url="../Content/images/rotator/card.jpg"></ej:RotatorItem>
                    <ej:RotatorItem Url="../Content/images/rotator/night.jpg"></ej:RotatorItem>
                </Items>
            </ej:Rotator>
    <ej:Pager runat="server" ID="pager" PageSize="1" PageCount="5" TotalRecordsCount="5" ClientSideOnChange="change" IsResponsive="true"></ej:Pager>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        $(function () {
            slider_obj = $("#<%=sliderContent.ClientID%>").ejRotator("instance");
        });
        function change(args) {
            slider_obj.gotoIndex(args.currentPage - 1);
        }
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .frame {
             height:330px;
             width:500px;
        }
           #<%=sliderContent.ClientID%> > li img {
            width: 100%; 
			height:300px;
         }
    </style>
</asp:Content>

