<%@ Page Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="PresentationViewer.aspx.cs" Inherits="WebSampleBrowser.PPTX.PresentationViewer" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">

    <table style="width: 690px; height: 448px;">
        <tr style="width: 690px;">
            <td class="auto-style56" colspan="6">
                 <div style="height: 400px; width: 690px;">
                     <ej:Rotator ID="sliderContent" runat="server" 
                        SlideWidth="690px"
                        FrameSpace="0px"
                        DisplayItemCount="1"
                        SlideHeight="400px"
                        NavigateSteps="1"
                        EnableResize="true"
                        Enabled="true"
                        AllowKeyboardNavigation="true"
                        AnimationType="slide"
                        ShowPager="False" ShowNavigateButton="False" >
                    </ej:Rotator>
                </div>

            </td>
        </tr>
        <tr style="width: 690px;">
            <td class="auto-style57">
                <div>
                     <asp:ImageButton runat="server" OnClick="PdfExport_Click" Height=" 25" Width="27" AlternateText="PdfExport" ImageUrl="../Content/images/presentation/PDF.png" ID="ImageButton1" />
                </div>
            </td>
            <td class="auto-style60"></td>
            <td class="auto-style62" style="margin-right:13px">
                <div class="col-md-3">
                    <ej:Button  ID="previous" Type="Button" ShowRoundedCorner="true"  Size="Normal" ContentType="ImageOnly" PrefixIcon="e-icon e-uiLight e-arrowheadleft" CssClass="e-btn" ClientSideOnClick="previous"  runat="server"></ej:Button>
                </div>
            </td>
            <td class="auto-style57" >
                <div style="margin-left:33px">
                   <asp:Label ID="SlideCount" runat="server"/>
               </div>
            </td>
            <td class="auto-style62" >
                <div class="col-md-3">
                    <ej:Button ID="next" Type="Button" ShowRoundedCorner="true" Size="Normal" ContentType="ImageOnly" PrefixIcon="e-icon e-uiLight e-arrowheadright" CssClass="e-btn" ClientSideOnClick="next" runat="server"></ej:Button>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="EventSection" runat="server">
    <table style="width: 20%; height: 200px;">
        <tr>
            <td class="auto-style54">
                <div style="margin-bottom: 10px; margin-left: 50px;">
                    <asp:ImageButton ID="slide2" runat="server" OnClick="Slide2_Click" ToolTip="NewCharts.pptx" Height=" 120" Width="200" AlternateText="Presentation2" ImageUrl="../Content/images/presentation/NewCharts/NewCharts1.jpg" />
                </div>
            </td>
        </tr>
        <tr>
            <td class="auto-style54">
                <div style="margin-bottom: 10px; margin-left: 50px;">
                    <asp:ImageButton ID="slide4" runat="server" OnClick="Slide4_Click" ToolTip="Syncfusion Presentation.pptx" Height=" 120" Width="200" AlternateText="Presentation4" ImageUrl="../Content/images/presentation/Syncfusion Presentation/Syncfusion Presentation1.jpg" />
                </div>
            </td>
        </tr>
    </table>

</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="ScriptSection" runat="server">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/Rotator/Properties.js")%>' type="text/javascript"> </script>
</asp:Content>


<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
         .e-bgdefault:hover .e-buttondiv .e-icon.e-uiLight.e-arrowheadleft, .e-bgdefault:active .e-buttondiv .e-icon.e-uiLight {
            background-image: url('../Content/ejthemes/common-images/icons-black.png');
        }
           .e-bgdefault:hover .e-buttondiv .e-icon.e-uiLight.e-arrowheadright, .e-bgdefault:active .e-buttondiv .e-icon.e-uiLight {
            background-image: url('../Content/ejthemes/common-images/icons-black.png');
        }
        .frame {
            width: 600px;
        }
       
        #sliderContent > li .image {
            width: 600px;
            height: 350px;
        }

        .auto-style54 {
            width: 221px;
        }
        .auto-style56 {
            height: 351px;
            width: 84px;
        }
        .auto-style57 {
            width: 84px;
        }
        .auto-style58 {
            width: 90px;
        }
        .auto-style59 {
        width: 223px;
    }
    .auto-style60 {
        width: 480px;
    }
    </style>

</asp:Content>

