function onChartLoad (sender) {
    if (!ej.util.isNullOrUndefined(window.orientation) && sender) {           //to modify chart properties for mobile view
        var model = sender.model,
		seriesLength = model.series.length;
        model.title.enableTrim = true;
        model.elementSpacing = 5;
        model.legend.visible = false;
        model.size.height = null;
        model.size.width = null;
        for (var i = 0; i < seriesLength; i++) {
            if (!model.series[i].marker)
                model.series[i].marker = {};
            if (!model.series[i].marker.size)
                model.series[i].marker.size = {};
            model.series[i].marker.size.width = 6;
            model.series[i].marker.size.height = 6;
        }
        model.primaryXAxis.labelIntersectAction = "rotate45";
		if (model.primaryXAxis.title)
			model.primaryXAxis.title.text = "";
        model.primaryXAxis.edgeLabelPlacement = "hide";
        model.primaryYAxis.labelIntersectAction = "rotate45";
		if (model.primaryYAxis.title)
			model.primaryYAxis.title.text = "";
        model.primaryYAxis.edgeLabelPlacement = "hide";
        if (model.axes) {
            for (var j = 0; j < model.axes.length; j++) {
                model.axes[j].labelIntersectAction = "rotate45";
				if (model.axes[j].title)
					model.axes[j].title.text = "";
                model.axes[j].edgeLabelPlacement = "hide";
            }
        }
    }
}