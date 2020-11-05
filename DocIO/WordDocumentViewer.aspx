<%@ Page Title="" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="WordDocumentViewer.aspx.cs" Inherits="WebSampleBrowser.DocIO.WordDocumentViewer" %>



<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/Rotator/Properties.js")%>' type="text/javascript"> </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
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
<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">
    <table style="width: 810px; height: 990px;">
        <tr style="width: 810px;">
            <td class="auto-style56" colspan="6">
                 <div style="height: 995px; width: 810px;">
                     <ej:Rotator ID="sliderContent" runat="server"
                        SlideWidth="793px"
                        FrameSpace="0px"
                        DisplayItemCount="1"
                        SlideHeight="990px"
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
        <tr style="width: 810px;">
            <td class="auto-style57">
                <div>
                    <asp:ImageButton runat="server" OnClick="PdfExport_Click" Height=" 25" Width="27" AlternateText="PdfExport" ImageUrl="../Content/images/DocIO/PDF.png" ID="ImageButton1" />
                </div>
            </td>
            <td class="auto-style60"></td>
            <td class="auto-style60"></td>
            <td class="auto-style62" style="margin-right:13px">
                <div class="col-md-3">
                    <ej:Button ID="previous" Type="Button" ShowRoundedCorner="true"  Size="Normal" ContentType="ImageOnly" PrefixIcon="e-uiLight e-arrowheadleft" CssClass="e-btn" ClientSideOnClick="previous" runat="server" ></ej:Button>
                   
                </div>
            </td>
            <td class="auto-style57" align="center">
                <div style="margin-left:15px">
                    <asp:Label ID="SlideCount" runat="server" ></asp:Label>                   
               </div>
            </td>
            <td class="auto-style62" align="right" >
                <div class="col-md-3">
                    <ej:Button ID="next" Type="Button" ShowRoundedCorner="true" Size="Normal" ContentType="ImageOnly" PrefixIcon="e-uiLight e-arrowheadright" CssClass="e-btn" ClientSideOnClick="next" runat="server"></ej:Button>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="EventSection" runat="server">
     <table style="width: 20%; height: 200px;">
        <tr>
            <td class="auto-style54">
                <div style="margin-bottom: 10px; margin-left: 50px;">
                    <asp:ImageButton ID="slide2" runat="server" OnClick="Slide2_Click" ToolTip="DocToImage.docx" Height=" 120" Width="200" AlternateText="WordDocument2" ImageUrl="../Content/images/DocIO/Sample_Images/DocToImage1.jpg" />
                    
                </div>
            </td>
        </tr>
        <tr>
            <td class="auto-style54">
                <div style="margin-bottom: 10px; margin-left: 50px;">
                    <asp:ImageButton ID="slide4" runat="server" OnClick="Slide4_Click" ToolTip="DoctoPDF.docx" Height=" 120" Width="200" AlternateText="WordDocument4" ImageUrl="../Content/images/DocIO/Sample_Images/DoctoPDF1.jpg" />
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
