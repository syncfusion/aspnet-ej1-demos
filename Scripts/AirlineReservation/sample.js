var oneWay = false;
var roundTrip = false;
var selectedNode = null;
var adultCount = 0;
var childCount = 0;
var initSelectedAdult = 0;
var initSelectedChild = 0;
var minPrice = 200;
var maxPrice = 3200;
var minTime = null;
var maxTime = null;
var data;

var nHoverNode = null;
var oHoverNode = null;

$(window).on("load", function () {

    if ((ej.browserInfo().name === "msie" && Number(ej.browserInfo().version) < 9)) {
        alert("Diagram will not be supported in IE Version < 9");
    }
    $("#priceRangeSlider").ejSlider('option', 'values', [25, 75]);
    $("#timeRangeSlider").ejSlider('option', 'values', [25, 75]);

    var gridObj = $("#FlightTicketBooking").data("ejGrid");
    if (gridObj.model.selectedRow >= 0)
        var gridObj = $("#FlightTicketBooking").data("ejGrid");
    $("#btnOpenPopup").css("display", "block");

});
$(window).resize(function () {
    //$("#Property_space").css("width", 340);
    $("#gid_space").css("width", document.body.clientWidth - 340);
    //$("#diagramContent_canvas_svg")[0].setAttribute("height", "328px");
    //$("#diagramContent_canvas_svg")[0].setAttribute("width", "623px");
})

function addDiagramContents() {
    var nodes = [];

    return nodes;
}
function openPopup() {

    var adultCount = getAdultCount();
    var childCount = getChildCount();
    if ((adultCount > 0 || childCount > 0)) {
        initSelectedAdult = adultCount;
        initSelectedChild = childCount;


        $("#diagramView").ejDialog("open");
        $("#popupContent").css("display", "block");
        $("#diagramView").css("height", "100%");
        $("#diagramView").css("width", "100%");

        //$(".sampleOuterTable").css("display", "none");
        //$("#diagramView").css("display", "block");


    }
    else if (document.getElementById("travelType") && document.getElementById("travelType").innerText == "") {
        alert("Please select the travel type");
    }
    else if (adultCount == 0 && childCount == 0)
        alert("Please select at least one passenger for booking");
    intializeDiagram();
    hideFrontLayer();
    showPopupContent();
    updateAdultCountIcon();
    updateChildCountIcon();
}
function intializeDiagram() {
    adultCount = 0;
    childCount = 0;
    var diagram = $("#diagramContent").ejDiagram("instance");
    var nodes = diagram.model.nodes;
    for (var i = 0; i < nodes.length; i++) {
        var node = nodes[i];
        //if (node instanceof ej.datavisualization.Diagram.Node) {
        if (!node.line && node.type != "group") {
            if (node.addInfo != "" && (node.addInfo == "AdultSeat" || node.addInfo == "ChildSeat")) {
                node.addInfo = "";
                if (node.type == "image")
                    diagram.updateNode(node.name, { type: "basic", shape: "rectangle" });
            }
        }
    }
    diagram.updateViewPort();
    //$("#diagramContent_canvas_svg")[0].setAttribute("height", "328px");
    //$("#diagramContent_canvas_svg")[0].setAttribute("width", "623px");
}
function isNumber(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
}
function getAdultCount() {
    var adultTextBoxElement = document.getElementById("adultCount");
    if (adultTextBoxElement) {
        adultCount = Number(adultTextBoxElement.value);
        return adultCount
    }
    return 0;
}
function getChildCount() {
    var childTextBoxElement = document.getElementById("childCount");
    if (childTextBoxElement) {
        childCount = Number(childTextBoxElement.value);
        return childCount;
    }
    return 0;
}
function updateAdultCountIcon() {
    var adultIconElement = document.getElementById("adultIconDisplay");
    removeAllChilds(adultIconElement);
    var adultCount = getAdultCount();
    updateAdultText();
    for (var i = 1; i <= adultCount; i++) {
        addAdultIcon();
    }
}
function addAdultIcon() {
    var adultIconElement = document.getElementById("adultIconDisplay");
    var span = document.createElement("span");
    var img = document.createElement("img");
    img.setAttribute("class", "selectAdultObject");
    img.setAttribute("style", "margin-top:10px;margin-left:10px;border:2px solid lightblue");
    img.setAttribute("src", "../Content/AirlineReservation/images/icon_Adult.png");
    img.setAttribute("draggable", "true");
    $(span).ejDraggable({
        clone: true,
        helper: function (event) {
            var helperContainer = $(event.element[0]).clone();

            $(helperContainer).addClass("dragClone");
            if (document.body) {
                //  document.getElementById("popupContent").appendChild(helperContainer[0]);
                $(helperContainer).css("z-index", "99999999999999");
                document.body.appendChild(helperContainer[0]);
                helperContainer.css("opacity", ".7");
            }
            return $(helperContainer);
        },
        drag: function (args) {
            var proxy = this;

            var element = $(".dragClone")[0];
        }
    });
    span.appendChild(img);
    adultIconElement.appendChild(span);
}
function removeLastAdultIcon() {
    var adultIconElement = document.getElementById("adultIconDisplay");
    if (adultIconElement.childNodes && adultIconElement.childNodes.length > 0) {
        adultIconElement.removeChild(adultIconElement.childNodes[adultIconElement.childNodes.length - 1]);
    }
}
function addChildIcon() {
    var childIconElement = document.getElementById("childIconDisplay");
    var span = document.createElement("span");
    var img = document.createElement("img");
    img.setAttribute("class", "selectchildObject");
    img.setAttribute("style", "margin-top:10px;margin-left:10px;border:2px solid lightblue");
    img.setAttribute("src", "../Content/AirlineReservation/images/icon_Child.png");
    img.setAttribute("draggable", "true");

    $(span).ejDraggable({
        clone: true,
        helper: function (event) {
            var helperContainer = $(event.element[0]).clone();
            $(helperContainer).addClass("dragClone");
            if (document.body) {
                $(helperContainer).css("z-index", "99999999999999");
                document.body.appendChild(helperContainer[0]);
                helperContainer.css("opacity", ".7");
            }
            helperContainer.css("opacity", ".7");
            return $(helperContainer);
        },
        drag: function () {
            var proxy = this;
            var element = $(".dragClone")[0];
        }
    });

    span.appendChild(img);
    childIconElement.appendChild(span);
}
function removeLastChildIcon() {
    var childIconElement = document.getElementById("childIconDisplay");
    if (childIconElement.childNodes && childIconElement.childNodes.length > 0) {
        childIconElement.removeChild(childIconElement.childNodes[childIconElement.childNodes.length - 1]);
    }
}
function updateChildCountIcon() {
    var childIconElement = document.getElementById("childIconDisplay");
    removeAllChilds(childIconElement);
    var childCount = getChildCount();
    updateChildText();
    for (var i = 1; i <= childCount; i++) {
        addChildIcon();
    }
}
function updateChildText() {
    var childCountElement = document.getElementById("childCountDisplay");
    childCountElement.textContent = "Child " + childCount;
}
function updateAdultText() {
    var adultCountElement = document.getElementById("adultCountDisplay");
    adultCountElement.textContent = "Adult " + adultCount;
}
function removeAllChilds(element) {
    var childNodes = element.childNodes;
    if (childNodes.length > 0) {
        var childNodeLength = childNodes.length;
        for (var i = childNodes.length; i > 0; i--) {
            element.removeChild(childNodes[childNodes.length - 1]);
        }
    }
}



function btnOneWayChange(event) {
    oneWay = !oneWay;
    roundTrip = !roundTrip;
    updateWayText();
}
function btnRoundTripChange(event) {
    roundTrip = !roundTrip;
    oneWay = !oneWay;
    updateWayText();
}
function updateWayText() {
    var labelElement = document.getElementById("travelType");
    if (oneWay)
        labelElement.textContent = "Round Trip";
    else
        labelElement.textContent = "One Way";
}
function convertRange(value, oldMin, oldMax, newMin, newMax) {
    var newValue = Math.round((value - oldMin) / (oldMax - oldMin) * (newMax - newMin) + newMin);
    if (newValue)
        return newValue;
    return value;

}

function onPriceRangeSlide(sender) {
    var minValue = sender.value[0];
    var maxValue = sender.value[1];
    var minPrice = convertRange(minValue, 0, 100, 400, 5000);
    var maxPrice = convertRange(maxValue, 0, 100, 400, 5000);
    updatePrice(minPrice, maxPrice);
}
function updatePrice(minPrice, maxPrice) {
    var minPriceElement = document.getElementById("minPrice");
    minPriceElement.innerText = "$" + minPrice;
    var maxPriceElement = document.getElementById("maxPrice");
    maxPriceElement.innerText = "$" + maxPrice;
}
function onTimeRangeSlide(sender) {
    var minValue = sender.value[0];
    var maxValue = sender.value[1];
    var minTime = convertRange(minValue, 0, 100, 0, 24);
    var maxTime = convertRange(maxValue, 0, 100, 0, 24);
    minTime = setTimeFormat(minTime);
    maxTime = setTimeFormat(maxTime);
    updateTime(minTime, maxTime);

}
function updateTime(minTime, maxTime) {
    var minTimeElement = document.getElementById("minTime");
    minTimeElement.innerText = minTime.hh + ":" + (minTime.mm ? minTime.mm : "00");
    var maxPriceElement = document.getElementById("maxTime");
    maxPriceElement.innerText = maxTime.hh + ":" + (maxTime.mm ? minTime.mm : "00");
}
function setTimeFormat(time) {
    var minutesList = time.toString().split(".")[1];
    time = Math.floor(time);
    var minutes = minutesList ? minutesList : null;
    if (minutes || minutes == "0") {
        minutes = minutesList[0] ? minutesList[0] : minutes;
        if (minutesList[1] != null) {
            minutes = minutes + "" + minutesList[1];
        }
        var hours = Math.floor(Number(minutes) / 60) ? Math.floor(Number(minutes) / 60) : 0;
        minutes = Number(minutes) % 60;

        if (minutes != 0) {
            if (minutes >= 0 && minutes <= 9)
                minutes = "0" + minutes;
            time = (Math.floor(time) + Number(hours));
        }
    }
    minutes = minutes ? minutes : 0;
    return { hh: time, mm: minutes };
}
function onPriceRangechange(sender) {
    filterByPrice(sender);
}
function onTimeRangechange(sender) {
    filterByTime(sender);
}
function filterByPrice(sender) {
    var minValue = sender.value[0];
    var maxValue = sender.value[1];
    minPrice = convertRange(minValue, 0, 100, 400, 5000);
    maxPrice = convertRange(maxValue, 0, 100, 400, 5000);
    updatePrice(minPrice, maxPrice);
    if (!minTime && !maxTime) {
        var tempMinTime = convertRange(minValue, 0, 100, 0, 24);
        var tempMaxTime = convertRange(maxValue, 0, 100, 0, 24);
        minTimeObj = setTimeFormat(tempMinTime);
        maxTimeObj = setTimeFormat(tempMaxTime);
        updateTime(minTimeObj, maxTimeObj);
        minTime = String(minTimeObj.hh) + "." + String(minTimeObj.mm);
        maxTime = String(maxTimeObj.hh) + "." + String(maxTimeObj.mm);
    }
    var query = ej.Query()
    .search(minPrice, ["Price"], ej.FilterOperators.greaterThan)
    .search(maxPrice, ["Price"], ej.FilterOperators.lessThan)
    .search(minTime, ["Depart"], ej.FilterOperators.greaterThan)
    .search(maxTime, ["Depart"], ej.FilterOperators.lessThan)
    if (data == undefined) {
        var model = $("#FlightTicketBooking").ejGrid("model");
        data = model.dataSource;
    }
    var result;
    var dataManager = ej.DataManager(data);

    result = dataManager.executeLocal(query);

    var gridObj = $("#FlightTicketBooking").data("ejGrid");
    gridObj.option("dataSource", result);
    if ($("#FlightTicketBooking").ejGrid("option", "selectedRow") < 0)
        $("#FlightTicketBooking").ejGrid("option", { selectedRow: 0 });
}
function filterByTime(sender) {
    var minValue = sender.value[0];
    var maxValue = sender.value[1];
    var tempMinTime = convertRange(minValue, 0, 100, 0, 24);
    var tempMaxTime = convertRange(maxValue, 0, 100, 0, 24);
    minTimeObj = setTimeFormat(tempMinTime);
    maxTimeObj = setTimeFormat(tempMaxTime);
    updateTime(minTimeObj, maxTimeObj);
    minTime = String(minTimeObj.hh) + "." + String(minTimeObj.mm);
    maxTime = String(maxTimeObj.hh) + "." + String(maxTimeObj.mm);
    var query = ej.Query()
    .search(minTime, ["Depart"], ej.FilterOperators.greaterThan)
    .search(maxTime, ["Depart"], ej.FilterOperators.lessThan)
    .search(minPrice, ["Price"], ej.FilterOperators.greaterThan)
    .search(maxPrice, ["Price"], ej.FilterOperators.lessThan)
    if (data == undefined) {
        var model = $("#FlightTicketBooking").ejGrid("model");
        data = model.dataSource;
    }
    var dataManager = ej.DataManager(data);
    result = dataManager.executeLocal(query);
    var gridObj = $("#FlightTicketBooking").data("ejGrid");
    gridObj.option("dataSource", result);
    if ($("#FlightTicketBooking").ejGrid("option", "selectedRow") < 0)
        $("#FlightTicketBooking").ejGrid("option", { selectedRow: 0 });
}
function btnSearchClick(sender) {
    var fromCity = document.getElementById("fromCityName").value;
    var toCity = document.getElementById("toCityName").value;

    var query = ej.Query()
     .search(fromCity, ["From"])
     .search(toCity, ["To"])
    var result;
    if (data == undefined) {
        var model = $("#FlightTicketBooking").ejGrid("model");
        data = model.dataSource;
    }
    var dataManager = ej.DataManager(data);

    result = dataManager.executeLocal(query);


    if (result && !result[0]) {
        query = ej.Query()
   .search(fromCity, ["From"])
        result = dataManager.executeLocal(query);

    }

    if (result && !result[0]) {
        query = ej.Query()
   .search(fromCity, ["To"])
        result = dataManager.executeLocal(query);

    }

    var gridObj = $("#FlightTicketBooking").data("ejGrid");
    gridObj.option("dataSource", result);

    var gridObj = $("#FlightTicketBooking").data("ejGrid");
    if (gridObj.model.selectedRow >= 0)
        $("#btnOpenPopup").css("display", "block");
    else
        $("#btnOpenPopup").css("display", "none");

}
function bookNow() {


    if (checkBookingSeats()) {
        $("#airlineRating").ejRating({ currentValue: 3 });
        ratingObj = $("#airlineRating").data("ejRating");
        //ratingObj.hideResetButton();
        hidePopupContent();
        showFrontLayer();
        $("#popupContent").css("display", "none");
        $("#diagramView").css("height", "100%");
        $("#diagramView").css("width", "100%");
    }
    else alert("Choose all your seats for booking");
}
function checkBookingSeats() {
    var diagram = $("#diagramContent").ejDiagram("instance");
    var nodes = diagram.model.nodes;
    var adultSeat = 0, childSeat = 0;
    for (var i = 0; i < nodes.length; i++) {
        if (nodes[i].addInfo == "AdultSeat")
            adultSeat++;
        else if (nodes[i].addInfo == "ChildSeat")
            childSeat++;
    }
    if (initSelectedAdult > adultSeat || initSelectedChild > childSeat)
        return false;
    return true;
}
function showFrontLayer() {
    document.getElementById('bg_mask').style.visibility = 'visible';
    document.getElementById('frontlayer').style.visibility = 'visible';
}
function hideFrontLayer() {
    document.getElementById('bg_mask').style.visibility = 'hidden';
    document.getElementById('frontlayer').style.visibility = 'hidden';
}
function showPopupContent() {
    document.getElementById('popupContent').style.visibility = 'visible';
}
function hidePopupContent() {
    document.getElementById('popupContent').style.visibility = 'hidden';
}




function onNodeClick(sender) {
    if (sender.element && sender.element.type == "image") {
        var diagram = $("#diagramContent").ejDiagram("instance");
        selectedNode = sender.element;
        if (selectedNode && (selectedNode.addInfo == undefined || selectedNode.addInfo == "")) {
            var imageSrc = "";
            var adultAdded = false;
            var childAdded = false;
            if (adultCount > 0) {
                adultAdded = true;
                imageSrc = "themes/images/icon_Adult.png";
            } else if (childCount > 0) {
                childAdded = true;
                imageSrc = "themes/images/icon_Child.png";
            }
            if (adultCount > 0 || childCount > 0) {
                var diagram = $("#diagramContent").ejDiagram("instance");
                //if (selectedNode instanceof ej.datavisualization.Diagram.Node) {
                if (!selectedNode.line && selectedNode.type != "group") {
                    diagram.updateNode(selectedNode.name, { type: "image", source: imageSrc, border: "gray" });
                    if (adultAdded) {
                        selectedNode.addInfo = "AdultSeat";
                        removeLastAdultIcon();
                        adultCount = adultCount - 1;
                    }
                    if (childAdded) {
                        selectedNode.addInfo = "ChildSeat";
                        removeLastChildIcon();
                        childCount = childCount - 1;
                    }
                }
            }
        } else if (selectedNode.addInfo != "" && selectedNode.addInfo != "booked") {
            var diagram = $("#diagramContent").ejDiagram("instance");
            //if (selectedNode instanceof ej.datavisualization.Diagram.Node) {
            if (!selectedNode.line && selectedNode.type != "group") {
                diagram.updateNode(selectedNode.name, { shape: "rectangle", type: "basic" });
                if (selectedNode.addInfo == "AdultSeat") {
                    addAdultIcon();
                    adultCount = adultCount + 1;
                }
                if (selectedNode.addInfo == "ChildSeat") {
                    addChildIcon();
                    childCount = childCount + 1;
                }
                selectedNode.addInfo = "";
            }
        } else if (selectedNode.addInfo == "booked") {
            //alert("Selected " + selectedNode.name + " is already booked");
        }
        updateAdultText();
        updateChildText();
    }
    var diagram = $("#diagramContent").ejDiagram("instance");
    diagram._clearSelection();
}

var oldSelectedRow;
function onGridRecordClick() {
    $("#btnOpenPopup").css("display", "block");
}

function onGridActionComplete(sender) {
    if (oldSelectedRow > 0)
        sender.model.selectedRow = oldSelectedRow;
}

function onGridActionBegin(sender) {
    oldSelectedRow = sender.model.selectedRow;
}

function onGridLoad(sender) {
    var x = sender.model.dataSource[Math.floor(Math.random() * sender.model.dataSource.length - 1)];
    if (document.getElementById("fromCityName")) {
        document.getElementById("fromCityName").value = String(x.From);
        document.getElementById("toCityName").value = String(x.To);
    }
}

$(window).on("load", function () {
    $("#adultIncrement").bind("click", function (event) {
        var adultTextElement = document.getElementById("adultCount");
        var lastValue = Number(adultTextElement.value);
        adultTextElement.value = lastValue + 1;

    });

    $("#adultDecrement").bind("click", function (event) {
        var adultTextElement = document.getElementById("adultCount");
        var lastValue = Number(adultTextElement.value);
        if (lastValue != 0)
            adultTextElement.value = lastValue - 1;

    });

    $("#childIncrement").bind("click", function (event) {
        var childTextElement = document.getElementById("childCount");
        var lastValue = Number(childTextElement.value);
        childTextElement.value = lastValue + 1;

    });

    $("#childDecrement").bind("click", function (event) {
        var childTextElement = document.getElementById("childCount");
        var lastValue = Number(childTextElement.value);
        if (lastValue != 0)
            childTextElement.value = lastValue - 1;

    });

    $("#btnOpenPopup").bind("click", function () {
        openPopup();
    });
    $("#btnBookNow").bind("click", function () {
        bookNow();
    });
});

function actionComplete(args) {
    if (oldSelectedRow > 0)
        args.model.selectedRow = oldSelectedRow;
}

function actionBegin(args) {
    oldSelectedRow = args.model.selectedRow;
}

function gridLoad(args) {
    var x = args.model.dataSource[Math.floor(Math.random() * args.model.dataSource.length - 1)];
    if (document.getElementById("fromCityName")) {
        document.getElementById("fromCityName").value = String(x.From);
        document.getElementById("toCityName").value = String(x.To);
    }
    args.model.selectedRowIndex = 0;
}

function recordClick() {
    $("#btnOpenPopup").css("display", "block");
}

function nodemouseenter(args) {
    if (args.element.fillColor != "red") {
        if (nHoverNode && args.element.name != nHoverNode.name) {
            diagram = $("#diagramContent").ejDiagram("instance");
            var obj = new Object();
            obj.fillColor = "white";
            diagram.updateNode(nHoverNode.name, obj);
        }
        nHoverNode = args.element;
        var diagram = $("#diagramContent").ejDiagram("instance");
        var obj = new Object();
        obj.fillColor = "#8CC63F";
        diagram.updateNode(args.element.name, obj);
    }
}

function nodemouseleave(args) {
    if (args.element.fillColor != "red") {
        var diagram = $("#diagramContent").ejDiagram("instance");
        var obj = new Object();
        obj.fillColor = "white";
        diagram.updateNode(args.element.name, obj);
    }
}

function testChildParent(args) {
    if (args.childNodes[0].className == "selectchildObject")
        return ("child");
    else
        return ("adult");
}

function onItemDrop(args) {
	$(".dragClone").remove();
    var diagram = $("#diagramContent").ejDiagram("instance");
    diagram._clearSelection();
    var element = diagram._findNode($("#" + args.e.target.id)[0].parentNode.id);

    if (element && element.shape && element.shape == "rectangle") {
        var selectedNode = element;
        if (selectedNode && (selectedNode.addInfo == undefined || selectedNode.addInfo == "" || !jQuery.isEmptyObject(selectedNode))) {
            var imageSrc = "";
            var adultAdded = false;
            var childAdded = false;
            var result = testChildParent(args.draggable[0]);
            if (result == "adult") {
                adultAdded = true;
                imageSrc = "../Content/AirlineReservation/images/icon_Adult.png";
            }
            else {
                childAdded = true;
                imageSrc = "../Content/AirlineReservation/images/icon_Child.png";
            }
            if (adultCount > 0 || childCount > 0) {
                var diagram = $("#diagramContent").ejDiagram("instance");
                if (!selectedNode.segments && selectedNode.type != "group") {
                    diagram.updateNode(selectedNode.name, { type: "image", source: imageSrc, border: "gray" });
                    if (adultAdded) {
                        selectedNode.addInfo = "AdultSeat";
                        removeLastAdultIcon();
                        adultCount = adultCount - 1;
                    }
                    if (childAdded) {
                        selectedNode.addInfo = "ChildSeat";
                        removeLastChildIcon();
                        childCount = childCount - 1;
                    }
                }
            }
        } else if (selectedNode.addInfo != "" && selectedNode.addInfo != "booked") {
            var diagram = $("#diagramContent").ejDiagram("instance");
            //if (selectedNode instanceof ej.datavisualization.Diagram.Node) {
            if (!selectedNode.line && selectedNode.type != "group") {
                diagram.updateNode(selectedNode.name, { type: "basic", shape: "rectangle" });
                if (selectedNode.addInfo == "AdultSeat") {
                    addAdultIcon();
                    adultCount = adultCount + 1;
                }
                if (selectedNode.addInfo == "ChildSeat") {
                    addChildIcon();
                    childCount = childCount + 1;
                }
                selectedNode.addInfo = "";
            }
        } else if (selectedNode.addInfo == "booked") {
            //alert("Selected " + selectedNode.name + " is already booked");
        }
        updateAdultText();
        updateChildText();
    }

}

function nodedragging(args) {
    var diagram = $("#diagramContent").ejDiagram("instance");
    diagram._clearSelection();
    args.cancel = true;
}

function backButtonClick() {
    $("#diagramView").ejDialog("close");
}