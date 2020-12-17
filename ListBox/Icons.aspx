<%@ Page Title="ListBox-Icons-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to pair an image with list items using the Syncfusion ASP.NET Web Forms ListBox component." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Icons.aspx.cs" Inherits="WebSampleBrowser.ListBox.Icons" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="control listbox" style="display:none">
        <div class="frame">
            <div class="ctrllabel">Select an item</div>
            <ej:ListBox ID="selectmailtools" runat="server" TargetID="mailtoolslist" Height="215" ClientSideOnCreate="OnCreated"></ej:ListBox>

            <ul id="mailtoolslist">
                <li>
                    <img src="../Content/images/listbox/Categorize.png" alt="Categorize" />
                    Categorize and Move</li>
                <li>
                    <img src="../Content/images/listbox/Done.png" alt="Done" />
                    Done</li>
                <li>
                    <img src="../Content/images/listbox/Flag.png" alt="Flag" />
                    Flag & Move</li>
                <li>
                    <img src="../Content/images/listbox/Forward.png" alt="Forward" />
                    Forward</li>
                <li>
                    <img src="../Content/images/listbox/Move.png" alt="Move" />
                    Move to Folder</li>
                <li>
                    <img src="../Content/images/listbox/Email.png" alt="E-mail" />
                    New E-mail</li>
                <li>
                    <img src="../Content/images/listbox/Meeting.png" alt="Meeting" />
                    New Meeting</li>
                <li>
                    <img src="../Content/images/listbox/Reply.png" alt="Reply" />
                    Reply</li>
            </ul>
        </div>
    </div>
    <script type="text/javascript">
function OnCreated() {
    if (document.body.firstElementChild.className = "htmljssamplebrowser material"){
        setTimeout(function () {
                    var obj = $("#<%=selectmailtools.ClientID%>").ejListBox("instance");
                    obj._refreshScroller();
                }, 800);
            }
    setTimeout(function () {
        $(".listbox").css("display", "block");
    }, 300);
        }
</script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .e-ddl-popup {
            margin: 0 auto;
        }

        .ctrllabel {
            font-weight: 600;
            padding-bottom: 12px;
        }

        img {
            padding-right: 10px;
            padding-top: 3px;
            width: 15px;
            height: 15px;
        }
    </style>
</asp:Content>

