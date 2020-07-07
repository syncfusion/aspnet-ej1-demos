<%@ Page Title="Dialog-RTL-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to display dialog contents from right to left in the Syncfusion ASP.NET Web Forms Dialog component." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="RTL.aspx.cs" Inherits="WebSampleBrowser.Dialog.RTL" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="control">
        <ej:Button ID="btnOpen" Type="Button" ClientSideOnClick="btnclick" CssClass="e-btn" Text="Click to open dialog" runat="server"></ej:Button>
        <ej:Dialog ID="rtlDialog" ClientSideOnClose="onDialogClose" Title="أودي Q3 محرك" IsResponsive="True" EnableRTL="true" Width="550" minHeight="215" minWidth="325" Containment=".control" runat="server">
            <DialogContent>
                <h1>الاستماع Q3</h1>
                <div class="audi-q3">
                    <img src="../Content/images/dialog/audiq3-1.png" class="img" alt="audi-q3" />
                    <br />
                    <img src="../Content/images/dialog/audiq3-2.png" alt="audi"/>
                </div>
                <div class="cnt">
                    بل هو مفهوم السيارة مع السائل فضة لون الجسم، وعجلات 20 بوصة، سقف قابلة للطي النسيج، وغطاء محرك السيارة التي تسيطر عليها كهربائيا، 4 أسطوانات محرك 2.0 TDI تصنيف 204 حصانا (150 كيلوواط؛ 201 حصان)
                                 و 400 نيوتن متر (295.02 باوند · قدم)، الديزل جسيمات مرشح وبلوتك نظام التحكم في الانبعاثات، كواترو دائم نظام الدفع الرباعي مع HALDEX القابض،
                                 أودي S ترونيك علبة التروس ذات القابض المزدوج، ماكفرسون-تبختر المحور الأمامي والمحور الخلفي أربعة الارتباط، أودي محرك أقراص النظام SELECT مع 3 طرق (الديناميكية، والرياضة، والكفاءة)،
                                 MMI لوحة التحكم مع لوحة اللمس والرؤية المزدوجة والتكنولوجيا، ونظام الصوت مع مكبرات الصوت تمديد بارز.
                </div>
            </DialogContent>
        </ej:Dialog>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/Dialog/RTL.js")%>' type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .audi-q3 {
            float: left;
            margin: 0px;
            height: 360px;
            width: 267px;
            margin-right: 17px;
        }

        .control {
            height: 600px;
            position: relative;
        }
          .htmljssamplebrowser.material  .control {
            height: 700px;
        }


        .img {
            margin-bottom: 8px;
        }
        #LayoutSection_ControlsSection_rtlDialog {
            text-align: justify;
        }

       .htmljssamplebrowser:not(.material):not(.office-365)  #LayoutSection_ControlsSection_rtlDialog {
            padding: 15px;
        }

       .htmljssamplebrowser.office-365 .cnt {
            min-height: 356px;
        }

        #LayoutSection_maincontrolarea {
            padding: 0;
        }

        h1 {
            margin: 0 0 10px 0;
        }
    </style>
</asp:Content>


