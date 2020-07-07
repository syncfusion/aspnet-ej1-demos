<%@ Page Language="C#" Title="Menu-RTL-ASP.NET-SYNCFUSION" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="RTL.aspx.cs" MetaDescription="This example demonstrates how to enable the rtl property in a ASP.NET Web Forms Menu control" Inherits="WebSampleBrowser.Menu.RTL" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="controlframe" style="width: 334px;">
    <ej:Menu ID="menuRTL" EnableRTL="true" runat="server">
        <Items>
            <ej:MenuItem Text="كتب">
                <Items>
                    <ej:MenuItem Text="الإصدارات الجديدة"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="جديد إصدارات الكتب السمعية"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="أكثر الكتب مبيعا"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="قادمة"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="مجموعات مربع"></ej:MenuItem>
                </Items>
            </ej:MenuItem>
        </Items>
        <Items>
            <ej:MenuItem Text="الألعاب">
                <Items>
                    <ej:MenuItem Text="قادمة"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="PC"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="PS فيتا"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem SpriteCssClass="separator" Text=""></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="PS3"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="اكس بوكس"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="لوحات المفاتيح"></ej:MenuItem>
                </Items>
            </ej:MenuItem>
        </Items>
        <Items>
            <ej:MenuItem Text="متنقل">
                <Items>
                    <ej:MenuItem Text="القادمون الجدد"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="أكثر الكتب مبيعا"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="منخفض السعر"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="أقراص"></ej:MenuItem>
                </Items>
            </ej:MenuItem>
        </Items>
        <Items>
            <ej:MenuItem Text="الكاميرات">
                <Items>
                    <ej:MenuItem Text="حدد و صور"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="SLR الرقمية"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="كاميرات الفيديو الرقمية"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="أكثر الكتب مبيعا"></ej:MenuItem>
                </Items>
            </ej:MenuItem>
        </Items>
        <Items>
            <ej:MenuItem Text="موسيقى">
                <Items>
                    <ej:MenuItem Text="الإصدارات الجديدة"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="أكثر الكتب مبيعا"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="موسيقى الروك"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="التعبدية والروحية"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="الصوفية وغزال"></ej:MenuItem>
                </Items>
            </ej:MenuItem>
        </Items>


    </ej:Menu>
        </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .e-menu.e-rtl li > ul > li > a {
            padding: 3px 18px 3px 28px;
        }

        .e-menu-res-wrap {
            height: 32px;
            overflow: hidden;
        }
		
		.office-365 .controlframe{
            width: 343px !important;
        }
    </style>
</asp:Content>

