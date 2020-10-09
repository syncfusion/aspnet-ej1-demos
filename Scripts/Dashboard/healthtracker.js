var sumColl = {};
$(function () {
    //grid is loaded with food information
    var dataManger1 = ej.DataManager({
        url: "//js.syncfusion.com/ejServices/api/HealthTracker/Load", crossDomain:true
    });
    dataManger1.executeQuery(ej.Query()).done(function (e) {
        $("#Grid1").data("ejGrid").dataSource(e.result.FoodInfo);

        //calculate summary 
        sumColl = getSummaryDetails();
        updateChartSeries();

        //render the series for calories chart
        var calChart = $("#ChartCal").data("ejChart");
        calChart.model.series[0].dataSource = e.result.ChartDB.CalData;

        //generate the series for steps moved chart
        var burntChart = $("#ChartBurnt").data("ejChart");
        burntChart.model.series[0].dataSource = e.result.ChartDB.BurntData;

        //generate the series for meals intake chart
        var mealChart = $("#MealDetails").data("ejChart");
        mealChart.model.series[0].dataSource = e.result.ChartDB.MealData.Open;
        calChart.model.series[0].xName = burntChart.model.series[0].xName = mealChart.model.series[0].xName = mealChart.model.series[1].xName = mealChart.model.series[2].xName = "XValue";
        calChart.model.series[0].yName = burntChart.model.series[0].yName = mealChart.model.series[0].yName = mealChart.model.series[1].yName = mealChart.model.series[2].yName = "YValue";
        mealChart.model.series[1].dataSource = e.result.ChartDB.MealData.Close;
        mealChart.model.series[2].dataSource = e.result.ChartDB.MealData.OpenClose;
        calChart.redraw();
        burntChart.redraw();
        mealChart.redraw();
    });

    //add new food dialog box is opened when "AddMeal" button is clicked
    $(".addbutton").bind("click", function () {
        $("#Grid1").ejGrid("addRecord");
    });

    //load the monthly reported chart when we scroll down
    $('.loadondemand').ejSmartScroller({
        reach: "renderControl"
    });
});


//update calories burnt gauge
function updateGauge(caloriesValue) {
    var gaugeObj = $("#GaugeRDI").data("ejCircularGauge");
    gaugeObj.setPointerValue(0, 0, caloriesValue);
    gaugeObj.setRangeStartValue(0, 0, 0);
    gaugeObj.setRangeEndValue(0, 0, caloriesValue);
    gaugeObj.setRangeStartValue(0, 1, caloriesValue);
    gaugeObj.setRangeEndValue(0, 1, 2200);
    $(".rdilabel").text("Calories Intake - " + caloriesValue + "/1000");
    $(".rdipenlabel").text(2200 - caloriesValue + " calories pending");
}

//update chart with summary values of grid
function updateChartSeries() {
    $("#Chart").ejChart("option", {
        "model": {
            series: [{
                "points": [{ x: 'Carb', y: sumColl[1], fill: "#B44A4A", text: sumColl[1] + "g" + " Carb" },
                    { x: 'Protein', y: sumColl[2], fill: "#53B2C1", text: sumColl[2] + "g" + " Protein" },
                    { x: 'Fat', y: sumColl[0], fill: "#F9AF3C", text: sumColl[0] + "g" + " Fat" }
                ]
            }]
        }
    });
}

function actionComplete(args) {
    if (args.requestType == "beginedit" || args.requestType == "add") {
        $('#Time').ejTimePicker();
        $("#Fat,#Carbohydrate,#Protein,#Calorie").ejNumericTextbox({ width: "120px", minValue: 1, maximum: 1000 });
        if (args.requestType == "beginedit")
            $("#MealSummary span.e-title").text("Edit");
        else {
            $("#Time").data("ejTimePicker").setCurrentTime();
            $("#MealSummary span.e-title").text("Add Meal");
        }
        $("#EditDialog_Grid1_Save").val("Done");
        $("#Fat, #Carbohydrate, #Protein, #Calorie,#Time, #FoodName").css("text-align", "left");
        $("#EditDialog_Grid1_Cancel").remove();
    }
    
    if (args.requestType != "refresh" && args.requestType == "save") {
        args.data.FoodId = getRandomNum(6, 50);
        sumColl = getSummaryDetails();
        //refresh the chart if the new food item is added.
        updateChartSeries();

        //calories sum to refresh Gauge
        updateGauge(sumColl[3]);
    }
}

//load the monthly reported charts when we scroll down
function renderControl(args) {
    if (args.element.hasClass("titlecss"))
        renderBurntCal();
    else
        renderMealIntake();
}

//get the summary details of the grid
function getSummaryDetails() {
    var griddata = $("#Grid1").data("ejGrid");
    var sumValue = griddata.model.summaryRows[0].summaryColumns;
    var sumColl = [];
    $.each(sumValue, function (index, item) {
        sumColl.push(Math.round(griddata.getSummaryValues(item)));
    });
    return sumColl;
}

//generate random numbers
function getRandomNum(ubound, lbound) {
    return (Math.floor(Math.random() * (ubound - lbound)) + lbound);
}

//render the series for the steps moved and calories burnt chart
function renderBurntCal() {
    var chartCalObj = $("#ChartCal").data("ejChart");
    var chartBurntObj = $("#ChartBurnt").data("ejChart");
    chartCalObj.seriesRender();
    chartBurntObj.seriesRender();
}

//render the series for the meal intake chart
function renderMealIntake() {
    var chartMealObj = $("#MealDetails").data("ejChart");
    chartMealObj.seriesRender();
}

(function ($, ej, undefined) {
    // Example plugin creation code
    // ejScr is the plugin name 
    // "ej.Scr" is "namespace.className" will hold functions and properties
    ej.widget("ejSmartScroller", "ej.SmartScroller", {
        // widget element will be automatically set in this
        element: null,
        // user defined model will be automatically set in this
        model: null,
        //Root Css Class
        _rootCSS: "",
        // default model
        defaults: {
            /// <summary>This Contains default property of button </summary>
            triggerOnce: true,
            reach: null
        },
        //Data Types
        dataTypes: {
            triggerOnce: "boolean"
        },

        // constructor function
        _init: function () {
            this._initialize();
            this._wireEvents();
        },

        // all events bound using this._on will be unbind automatically
        _destroy: function () {
            this._off($(window), "scroll", this._scrollHandler);
        },
        _setModel: function (options) {

        },

        _initialize: function () {
            this._oldScroll = this._newScroll = 0;
            this._triggered = false;
            if (this._oldScroll >= this._getOffset())
                this._triggerFn();
        },
        _scrollHandler: function (e) {
            if (!this._triggered || !this.model.triggerOnce) {
                this._triggerOnReach();
                this._oldScroll = this._newScroll;
            }
        },
        _getOffset: function () {
            return $(this.element).offset().top - (document.documentElement.clientHeight - $(this.element).outerHeight());
        },
        _triggerOnReach: function () {
            this._newScroll = $(document).scrollTop();
            var offset = this._getOffset();
            if (this._oldScroll < offset && offset <= this._newScroll) {
                this._triggerFn();
            } else if (this._newScroll < offset && offset <= this._oldScroll) {
                this._triggerFn();
            }
        },
        _triggerFn: function () {
            this._triggered = true;
            this._trigger("reach", { element: this.element, offsetTop: this._newScroll });
        },
        /*-----------------------Event Handlers -----------------------------------------*/
        _wireEvents: function () {
            this._on($(window), "scroll", this._scrollHandler);
        },
    });

})(jQuery, Syncfusion);