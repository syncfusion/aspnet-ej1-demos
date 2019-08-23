<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Sourcecodetab.ascx.cs"
    Inherits="WebSampleBrowser.Sourcecodetab" %>
<%@ Register Assembly="WebSampleBrowser" Namespace="AspSamplebrowser" TagPrefix="Sync" %>
<Sync:SourceCodeTab ID="codetabview" runat="server" />

<script type="text/javascript">
    $(document).ready(function () {
        $("#SourceTabDiv ul li a").each(function () {
            var hrefvalue = $(this).attr("href");
            hrefvalue = hrefvalue.replace("SourceCodeTab/", "");
            hrefvalue = hrefvalue.replace("../", "");
            $(this).attr("href", hrefvalue);
        });
        $("#SourceTabDiv").ejTab({ enableTabScroll: false });
        $(".cols-source.sourcecodeTab ").addClass("selectable");
        if ($(window).width() < 981) {
            $("<span>").attr("id", "newwindow-wrapper").prependTo($("#SourceTabDiv .e-header"));
            $("<button>").attr({ "id": "newcodewindow","style": "float:right", "title": "New Code Window" }).prependTo($("#SourceTabDiv #newwindow-wrapper"));
            $("<span>").attr("id", "copy-wrapper").prependTo($("#SourceTabDiv .e-header"));
            $("<button>").attr({ "id": "copyclipboard", "title": "Copy To Clipboard", "style": "float:right" }).prependTo($("#SourceTabDiv #copy-wrapper"));
        }
        else {
            $("<span>").attr("id", "newwindow-wrapper").appendTo($("#SourceTabDiv .e-header"));
            $("<button>").attr({ "id": "newcodewindow", "style": "float:right", "title": "New Code Window" }).appendTo($("#SourceTabDiv #newwindow-wrapper"));
            $("<span>").attr("id", "copy-wrapper").appendTo($("#SourceTabDiv .e-header"));
            $("<button>").attr({ "id": "copyclipboard", "title": "Copy To Clipboard", "style": "float:right" }).appendTo($("#SourceTabDiv #copy-wrapper"));
        }
        $("<div>").attr({ "class": "copysuccess", "style": "display:none" }).appendTo($("#copy-wrapper")).html("Copied to clipboard");
        $("#newcodewindow").ejButton({
            size: "small",
            contentType: "textandimage",
            text: "New",
            type: "Button",
            prefixIcon: "e-icon newsrcwindow",
            showRoundedCorner:true
        });
        $("#copyclipboard").ejButton({
            size: "small",
            contentType: "textandimage",
            text: "Copy", type: "Button",
            prefixIcon: "e-icon copycodeicon",
            showRoundedCorner: true
        });

        $("#newcodewindow").click(function () {
            var popupWin = window.open();
            $('.copysuccess').css('display', 'none');
            var head,title = '<title> Essential Studio for ASP.NET </title>' ;
            var meta = '<meta content="width=device-width, initial-scale=1.0" name="viewport">' + '<meta content="Essential Studio for ASP.NET" name="description">' + '<meta content="Syncfusion" name="author">' + '<meta charset="utf-8">';
            var version = "";
            if (ej.browserInfo().name == "msie" && parseInt(ej.browserInfo().version) == 8) {
                head = navigator.userAgent.indexOf("MSIE 8.0") > 0 ? title + ' <meta http-equiv="x-ua-compatible" content="IE=Edge">' + meta : title + meta;
                version = "1.11.3";
            }
            else {
                head = navigator.userAgent.indexOf("MSIE 9.0") > 0 ? title + ' <meta http-equiv="x-ua-compatible" content="IE=Edge">' + meta : title + meta;
                version = "2.1.4";
            }
            var links = $(document.head || document.getElementsByTagName('head')[0]).find("link");
            var serverconfig = links[0].href.substr(0, links[0].href.indexOf("Content") - 1);
            var scriptendtag = "<" + "/" + "script" + ">";
            var scripttag = '<script type="text/javascript" src="' + serverconfig + '/scripts/jquery-' + version + '.min.js">' + scriptendtag;
            scripttag += '<script type="text/javascript" src="' + serverconfig + '/Scripts/ej.web.all.min.js">' + scriptendtag;
            scripttag += '<script type="text/javascript" src="' + serverconfig + '/Scripts/jquery.easing-1.3.min.js">' + scriptendtag;
            scripttag += '<script type="text/javascript" src="' + serverconfig + '/Scripts/ZeroClipboard.js">' + scriptendtag;
            scripttag += '<script type="text/javascript" src="' + serverconfig + '/Scripts/CopyToClipBoard.js">' + scriptendtag;
            var linkelement = $(links).clone();
            var linktag = "";
            for (i = 0; i < linkelement.length; i++) {
                linktag += $(linkelement[i]).wrap("<p>").parent().html();
            }
            var tabcontent = $(".cols-source.sourcecodeTab").clone();
            $(tabcontent).find(".newsrcwindow").each(function () { $(this).remove(); });
            $(tabcontent).find(".copycode").each(function () { $(this).remove(); });
            $(tabcontent).find("script").each(function () { $(this).remove(); });
            tabcontent = $(tabcontent).html();
            var a = $("#SourceTabDiv").ejTab("instance");
            a = parseInt(a.option("selectedItemIndex"));            
            popupWin.document.writeln('<!DOCTYPE html> <html><head>' + head + linktag + scripttag + '</head><body><div id="windowOpen" style="width: 97%"><div class="cols-source sourcecodetab">' + tabcontent + '</div></div><script type="text/Javascript"> $(function(){$("#SourceTabDiv").ejTab({  selectedItemIndex:' + a + '});}); initiateCopyHandler(); $("#SourceTabDiv").bind("mouseover", "#copyclipboard", function () {$("#copytextarea").val(copytoclip.Selector.getSelected());});' + scriptendtag + '</body></html>');
            popupWin.document.close();
        });

        //Copy to clipboard behavior 
        if (!$("#clipboard").length) {
            $("<textarea>").attr("style", "display:none").attr("id", "copytextarea").appendTo($("#copy-wrapper"));
        }
        if ($(window).width() < 450) {
            $("#copyclipboard .e-btntxt").text(""); $("#newcodewindow .e-btntxt").text("");
        }
        initiateCopyHandler();
        $('#SourceTabDiv').bind("mouseover", '#copyclipboard', function (e) {
            $(e.currentTarget).val(copytoclip.Selector.getSelected());
        });
    });
</script>

