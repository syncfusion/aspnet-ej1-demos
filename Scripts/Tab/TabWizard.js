var tabctrl, trainchosen,data, themechange;
$(function () {
    $("#ejdarktext input, #ejlighttext input").change(function () {
        if (((ej.browserInfo().name == "msie" && ej.browserInfo().version != "8.0") && ($(".darktheme").length != 0)) || ((ej.browserInfo().name == "msie" && ej.browserInfo().version == "8.0") && ($(".darktheme").length == 0)) || (ej.browserInfo().name != "msie" && $(".darktheme").length == 1)) {
            $(".frame-tab").css("background-color", "#1f1f1f");
            $(".frame-tab").css("border", "1px solid #5e5f5e");
            $(".frame-tab").css("color", "#8f8f8f");
            $("table#Table1, #Table1 th, #Table1 td").css("background-color", "#1f1f1f");
            $("table#Table1, #Table1 th, #Table1 td").css("border", "1px solid #5e5f5e");
            $("table#Table1, #Table1 th, #Table1 td").css("color", "#fff");
            $("#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_age1,#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_age2,#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_age3,#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_age4,#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_age5,#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_name1,#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_name2,#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_name3,#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_name4,#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_name5").css("background-color", "#000");
            $("#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_age1,#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_age2,#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_age3,#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_age4,#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_age5,#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_name1,#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_name2,#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_name3,#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_name4,#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_name5").css("border", "1px solid #5e5f5e");
            $("#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_age1,#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_age2,#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_age3,#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_age4,#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_age5,#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_name1,#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_name2,#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_name3,#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_name4,#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_name5").css("color", "#fff");
        }
        else {
            $(".frame-tab").css("background-color", "#f9f8fa");
            $(".frame-tab").css("border", "1px solid #BBBCBB");
            $("table#Table1, #Table1 th, #Table1 td").css("background-color", "#f9f8fa");
            $("table#Table1, #Table1 th, #Table1 td").css("border", "1px solid #BBBCBB");
            $("table#Table1, #Table1 th, #Table1 td").css("color", "#000");
            $("#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_age1,#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_age2,#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_age3,#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_age4,#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_age5,#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_name1,#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_name2,#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_name3,#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_name4,#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_name5").css("background-color", "#fff");
            $("#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_age1,#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_age2,#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_age3,#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_age4,#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_age5,#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_name1,#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_name2,#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_name3,#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_name4,#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_name5").css("border", "1px solid #BBBCBB");
            $("#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_age1,#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_age2,#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_age3,#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_age4,#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_age5,#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_name1,#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_name2,#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_name3,#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_name4,#Table1 #LayoutSection_ControlsSection_wizardTab_ctl02_pass_name5").css("color", "#000");
        }
        var colorvalue = $("#LayoutSection_ControlsSection_wizardTab .e-header").css("background-color");
        if (colorvalue.startsWith("#"))
            $("table#Table1 th").css("border-bottom", "3px solid " + colorvalue);
        else {
            var digits = /(.*?)rgb\((\d+), (\d+), (\d+)\)/.exec(colorvalue);
            if (digits != undefined) {
                var red = parseInt(digits[2]);
                var green = parseInt(digits[3]);
                var blue = parseInt(digits[4]);

                var rgb = blue | (green << 8) | (red << 16);
                hexcol = digits[1] + '#' + rgb.toString(16);
                $("table#Table1 th").css("border-bottom", "3px solid " + hexcol);
            }
        }
    });
    tabctrl = $("#LayoutSection_ControlsSection_wizardTab").data("ejTab");
    from = $("#startpoint").data("ejAutocomplete");
    to = $("#endpoint").data("ejAutocomplete");
    jdate = $("#journeydate").data("ejDatePicker");
    tktype = $("#tickettype").data("ejDropDownList");
});
function TabNavigations(args) {

    switch (this._id) {
        case "searchTrain":
            if (from.getValue() != "" && to.getValue() != "" && tktype.getValue() != "" && jdate.getValue() != null) {
                if (from.getValue() != "" && from.getValue() == to.getValue()) {
                    $("#tab1_err").text("");
                    $("#tab1_err").append("*Arrival point can't be same as Depature");
                }
                else {
                    $("#LayoutSection_ControlsSection_wizardTab").ejTab({
                        disabledItemIndex: [0, 2, 3],
                        enabledItemIndex: [1],
                        selectedItemIndex: 1
                    });
                    filterTrains(args);
                }
            }
            else {
                $("#tab1_err").text("");
                $("#tab1_err").append("*Please fill all the details before proceeding");
            }
            break;
        case "gotosearch":
            trainchosen = [];
            $("#LayoutSection_ControlsSection_wizardTab").ejTab({
                disabledItemIndex: [1, 2, 3],
                enabledItemIndex: [0],
                selectedItemIndex: 0
            });
            break;
        case "booktickets":
            if (trainchosen == undefined || trainchosen.length <= 0) {
                $("#tab2_err").text("");
                $("#tab2_err").append("*Select your convenient train");
            }
            else {
                $("#LayoutSection_ControlsSection_wizardTab").ejTab({
                    disabledItemIndex: [0, 1, 3],
                    enabledItemIndex: [2],
                    selectedItemIndex: 2
                });
                var colorvalue = $("#LayoutSection_ControlsSection_wizardTab .e-header").css("background-color");
               if(colorvalue.startsWith("#"))
                $("table#Table1 th").css("border-bottom", "3px solid " + colorvalue);
               else{
                var digits = /(.*?)rgb\((\d+), (\d+), (\d+)\)/.exec(colorvalue);

                var red = parseInt(digits[2]);
                var green = parseInt(digits[3]);
                var blue = parseInt(digits[4]);

                var rgb = blue | (green << 8) | (red << 16);
                hexcol= digits[1] + '#' + rgb.toString(16);
                $("table#Table1 th").css("border-bottom", "3px solid " + hexcol);
                }
            }
            break;
        case "gobacktobook":
            $("#LayoutSection_ControlsSection_wizardTab").ejTab({
                disabledItemIndex: [0, 2, 3],
                enabledItemIndex: [1],
                selectedItemIndex: 1
            });
            break;
        case "confirmtickets":
            if ($("#LayoutSection_ControlsSection_wizardTab_ctl02_pass_name1").val() == "") {
                $("#tab3_err").text("");
                $("#tab3_err").append("*Please enter passenger details");
            }
            else {
                $("#LayoutSection_ControlsSection_wizardTab").ejTab({
                    disabledItemIndex: [0, 1, 2],
                    enabledItemIndex: [3],
                    selectedItemIndex: 3
                });
                finaldetails(args);
            }
            break;
        case "gobacktodetails":
            $("#LayoutSection_ControlsSection_wizardTab").ejTab({
                disabledItemIndex: [0, 1, 3],
                enabledItemIndex: [2],
                selectedItemIndex: 2
            });
            dialogmsg = $("#confirmmsg").data("ejDialog");
            dialogmsg.close();
            var colorvalue = $("#LayoutSection_ControlsSection_wizardTab .e-header").css("background-color");
            if(colorvalue.startsWith("#"))
                $("table#Table1 th").css("border-bottom", "3px solid " + colorvalue);
            else{
            var digits = /(.*?)rgb\((\d+), (\d+), (\d+)\)/.exec(colorvalue);

            var red = parseInt(digits[2]);
            var green = parseInt(digits[3]);
            var blue = parseInt(digits[4]);

            var rgb = blue | (green << 8) | (red << 16);
            hexcol= digits[1] + '#' + rgb.toString(16);
            $("table#Table1 th").css("border-bottom", "3px solid " + hexcol);
            }
            break;
        case "payment":
            $("#LayoutSection_ControlsSection_wizardTab").ejTab({
                disabledItemIndex: [0, 1, 2],
                enabledItemIndex: [3],
                selectedItemIndex: 3
            });
            dialogmsg = $("#confirmmsg").data("ejDialog");
            dialogmsg.open();
            break;
    }

}
function filterTrains(args) {
    $("#tab1_err").text("");
    var fromCity = document.getElementById("startpoint").value;
    var toCity = document.getElementById("endpoint").value;

    var query = ej.Query()
.search(fromCity, ["Depature"])
.search(toCity, ["Arrival"])
    var result;
    if(data==undefined){
        var model = $("#TrainAvailability").ejGrid("model");
        data = model.dataSource;
    }
    var dataManager = ej.DataManager(data);
        result = dataManager.executeLocal(query);
    if (result && !result[0]) {
        query = ej.Query()
   .search(fromCity, ["Depature"])
        result = dataManager.executeLocal(query);

    }

    if (result && !result[0]) {
        query = ej.Query()
   .search(fromCity, ["Arrival"])
        result = dataManager.executeLocal(query);

    }

    var gridObj = $("#TrainAvailability").data("ejGrid");
    gridObj.option("dataSource", result);   
}

function finaldetails(args) {
    var reserved = [];
    $("#tab3_err").text("");
    for (i = 1; i <= 5; i++) {
        if ($("#LayoutSection_ControlsSection_wizardTab_ctl02_pass_name" + i).val() != "") {
            details = {}
            details["TrainNo"] = trainchosen.TrainNo.toString();
            details["PassName"] = $("#LayoutSection_ControlsSection_wizardTab_ctl02_pass_name" + i).val();
            details["Gender"] = $("#pass_gender" + i).val();
            details["CoachNo"] = "S" + i;
            details["SeatNo"] = i * 2;
            reserved.push(details);

        }
    }

    $("#TicketConfirmation").ejGrid({ dataSource: reserved });
}

function selectedTrain(args) {
    trainchosen = args.data;
}
