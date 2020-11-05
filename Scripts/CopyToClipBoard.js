function initiateCopyHandler() {

    try {
        var client = new ZeroClipboard($('#copyclipboard'));

        client.on('ready', function (event) {
            client.on('copy', function (event) {
                event.clipboardData.setData('text/plain', copycontent());
                $('.copysuccess').stop().fadeIn(400).delay(1000).fadeOut(400);
            });
        });

        client.on('error', function (event) {
            console.log('ZeroClipboard error of type "' + event.name + '": ' + event.message);
            ZeroClipboard.destroy();
        });

        function copycontent(e) {
            if ($("#copytextarea").val() === null || $("#copytextarea").val() === "") {
                $("#copytextarea").val("");
                $("#SourceTabDiv div:visible").each(function () { $("#copytextarea").val($(this).text()); });
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