<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ShowCaseTab.ascx.cs" Inherits="WebSampleBrowser.Dashboard.ShowCaseTab" %>
<%@ Register Assembly="WebSampleBrowser" Namespace="AspSamplebrowser" TagPrefix="Sync" %>
<Sync:ShowCaseTab ID="codetabview1" runat="server" />
<script type="text/javascript">
    $(document).ready(function () {
        $("#SourceTabDiv").ejTab({ enableTabScroll: false });
        $(".cols-source.sourcecodeTab ").addClass("selectable");
        $("<span>").attr("id", "copyclipboard").attr('title','Copy To Clipboard').addClass(" e-icon e-select copycodeicon copycode").appendTo($("#SourceTabDiv .e-header"));       
        var title = window.location.href.split('=')[1];
        var newtitle = title.charAt(0).toUpperCase() + title.substr(1).toLowerCase();
        document.title = "Essential Studio for ASP.NET : Sourcecode of Dashboard | " + newtitle;

        //Copy to clipboard behavior 
        if (!$("#clipboard").length) {
            $("<div>").insertAfter($("#SourceTabDiv")).attr("id", "clipboard");
            $("#SourceTabDiv div").each(function () {
                $("<span>").appendTo($(this)).addClass("copycode copycodedown").text("COPY TO CLIPBOARD");
            });

            $("<textarea>").attr("style", "display:none").attr("id", "copytextarea").appendTo($("#clipboard"));
        }
       
        initiateCopyHandler();
        $('#SourceTabDiv').bind("mouseover", '.copycode', function () {
            $("#copytextarea").val(copytoclip.Selector.getSelected());
        });
    });

    function initiateCopyHandler() {
      
        try {
            var client = new ZeroClipboard($('.copycode'));

            client.on('ready', function (event) {
                client.on('copy', function (event) {
                    event.clipboardData.setData('text/plain', copycontent());
                });
            });

            client.on('error', function (event) {
                console.log('ZeroClipboard error of type "' + event.name + '": ' + event.message);
                ZeroClipboard.destroy();
            });

            function copycontent(e) {
                if ($("#copytextarea").val() == "" || $("#copytextarea").val() == null) {
                    $("#copytextarea").val("");
                    $("#SourceTabDiv div:visible").each(function () { $("#copytextarea").val($("#copytextarea").val() + $(this).text().replace("COPY TO CLIPBOARD", "")); });
                }
                return $("#copytextarea").val();
            }

        }
        catch (e) { }
        if (!window.copytoclip) {
            copytoclip = {};
        }
        copytoclip.Selector = {};
        copytoclip.Selector.getSelected = function () {
            var t = '';
            if (window.getSelection) {
                t = window.getSelection();
            } else if (document.getSelection) {
                t = document.getSelection();
            } else if (document.selection) {
                t = document.selection.createRange().text;
            }
            return t;
        }
    }
</script>

