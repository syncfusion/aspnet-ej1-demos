<%@ Page Title="ListView-Template-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to customize the list items in the Syncfusion ASP.NET Web Forms ListView component." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Template.aspx.cs" Inherits="WebSampleBrowser.ListView.Template" %>


<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <link href="<%=ResolveClientUrl("~/Content/ListView/Template.css")%>" rel="stylesheet" />
    <style type="text/css">
        .htmljssamplebrowser.office-365 .jacob, .htmljssamplebrowser.office-365 .grace, .htmljssamplebrowser.office-365 .erik, .htmljssamplebrowser.office-365 .claire, .htmljssamplebrowser.office-365 .brooke {
            height: 50px;
            width: 50px;
            padding: 0;
            margin: 10px;
        }

        .htmljssamplebrowser.office-365 .cont-bg{
            height: 98px;
            padding: 0;
            border-bottom: 1px solid #eaeaea;
        }

        .htmljssamplebrowser.office-365 .aboutstyle{
            color: #333333;
            font-size: 13px !important;
            padding: 12px 0 0 !important;
        }

        .htmljssamplebrowser.office-365 .templatetext {
            height: 25px;
            display: block;
            font-size: 21px !important;
            color: #333333;
            font-weight: lighter !important;
        }

        .htmljssamplebrowser.office-365 .templatetext, .htmljssamplebrowser.office-365 .aboutstyle {
            padding-top: 12px;
        }

        .htmljssamplebrowser.office-365 .designationstyle {
            color: #666666;
            padding: 6px 0px 0px !important;
            float: none !important;
            font-size: 13px !important;
            display: block;
            right: 0 !important;
        }

        .htmljssamplebrowser.office-365 #templatelist {
            min-width: 440px;
        }

        .htmljssamplebrowser.office-365 .listrightdiv{
            left: 0;
        }

        .htmljssamplebrowser.office-365 .e-lv.e-parentlv {
            height: 500px !important;
        }

        .htmljssamplebrowser.office-365 .e-lv .e-list, .htmljssamplebrowser.office-365 .cont-bg{
            padding: 0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">
            <div id="templatelist">
                <div class="cont-bg">
                    <div class="{{>Class}}">
                    </div>
                    <div class="listrightdiv">
                        <span class="templatetext">{{>Name}}</span> <span class="designationstyle">{{>Designation}}</span>
                        <div class="aboutstyle">
                            {{>About}}
                        </div>
                    </div>
                </div>
            </div>
            <ej:ListView ID="ListView1" runat="server" AllowScrolling="false" DataSourceID="ObjectDataSource1" ShowHeader="false" RenderTemplate="true" TemplateId="templatelist" Height="415" Width="450">
            </ej:ListView>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" TypeName="ListviewData" SelectMethod="GetListItems"></asp:ObjectDataSource>
</asp:Content>

