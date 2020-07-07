var progresObj, buttonObj, k = 10, timer = window.clearInterval(timer);



function evtpropscheckedevent(args) {
    progresObj = $("#LayoutSection_ControlsSection_ProgressBar1").data("ejProgressBar");
    if (args.isChecked) {
        switch (args.value) {
            case "start": progresObj.option(args.value, "onstart"); break;
            case "change": progresObj.option(args.value, "onchange"); break;
        }
    }
    else progresObj.option(args.value, null);
}

function startProcess(args) {
    buttonObj = $("#LayoutSection_ControlsSection_startButton").data("ejToggleButton");
    progresObj = $("#LayoutSection_ControlsSection_ProgressBar1").data("ejProgressBar");
    if (args.isChecked)
        timer = window.setInterval(draw, 100);
    else {
        buttonObj.setModel({ "defaultText": "Start" });
        timer = window.clearInterval(timer);
    }
}
function draw() {
    progresObj = $("#LayoutSection_ControlsSection_ProgressBar1").data("ejProgressBar");
    progresObj.option("text", ++k + " %");
    progresObj.option("percentage", k);
}
function completed(args) {
    buttonObj = $("#LayoutSection_ControlsSection_startButton").data("ejToggleButton");
    progresObj = $("#LayoutSection_ControlsSection_ProgressBar1").data("ejProgressBar");
    progresObj.option("text", "Completed");
    timer = window.clearInterval(timer);
    k = 0;

    $("#LayoutSection_ControlsSection_startButton").ejToggleButton({
        defaultText: "Restart",
        checkedStatus: false,
    });
}


function onClear() {
    $("#EventLog").html("");
}