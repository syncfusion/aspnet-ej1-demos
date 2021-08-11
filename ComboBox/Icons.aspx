<%@ Page Title="ComboBox-Icons-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Icons.aspx.cs" MetaDescription="This sample demonstrates how to add icons for the items in ASP.NET Web Forms ComboBox control."  Inherits="WebSampleBrowser.ComboBox.Icons" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:ComboBox ID="selectmailtools" runat="server" DataTextField="text" Placeholder="Select a icon" Width="100%"></ej:ComboBox>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        /*controls*/
        .mailtools {
            display: block;
            background-image: url("../Content/images/dropdownlist/iconsapps.png");
            height: 25px;
            width: 25px;
            background-position: center center;
            background-repeat: no-repeat;
        }

            .mailtools.done {
                background-position: 0 0;
            }

            .mailtools.movetofolder {
                background-position: 0 -22px;
            }

            .mailtools.categorize {
                background-position: 0 -46px;
            }

            .mailtools.flag {
                background-position: 0 -70px;
            }

            .mailtools.forward {
                background-position: 0 -94px;
            }

            .mailtools.newmail {
                background-position: 0 -116px;
            }

            .mailtools.reply {
                background-position: 0 -140px;
            }

            .mailtools.meeting {
                background-position: 0 -164px;
            }
        .ctrllabel {
            padding-bottom: 3px;
        }
    </style>
</asp:Content>

