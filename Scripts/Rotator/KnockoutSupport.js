
$(function () {
    var imageList = [
      { text: "bird", url: "../Content/images/rotator/bird.jpg" },
      { text: "night", url: "../Content/images/rotator/night.jpg" },
      { text: "tablet", url: "../Content/images/rotator/tablet.jpg" },
      { text: "nature", url: "../Content/images/rotator/nature.jpg" },
      { text: "snowfall", url: "../Content/images/rotator/snowfall.jpg" },
      { text: "card", url: "../Content/images/rotator/card.jpg" },
      { text: "sculpture", url: "../Content/images/rotator/sculpture.jpg" }
    ];

    window.viewModel = {
        dataList: ko.observableArray(imageList),
        height: ko.observable("350px"),
        width: ko.observable("100%"),
    };
    ko.applyBindings(viewModel);
});