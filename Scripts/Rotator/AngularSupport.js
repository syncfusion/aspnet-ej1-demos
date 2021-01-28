
var list = [
           { text: "snowfall", url: '<%= Page.ResolveClientUrl("~/Content/images/rotator/snowfall.jpg")%>' },
           { text: "tablet", url: '<%= Page.ResolveClientUrl("~/Content/images/rotator/tablet.jpg")%>' },
           { text: "nature", url: '<%= Page.ResolveClientUrl("~/Content/images/rotator/nature.jpg")%>' },
           { text: "card", url: '<%= Page.ResolveClientUrl("~/Content/images/rotator/card.jpg")%>' },
           { text: "bird", url: '<%= Page.ResolveClientUrl("~/Content/images/rotator/bird.jpg")%>' },
           { text: "wheat", url: '<%= Page.ResolveClientUrl("~/Content/images/rotator/wheat.jpg")%>' },
           { text: "night", url: '<%= Page.ResolveClientUrl("/Content/images/rotator/night.jpg")%>' }];

angular.module('syncApp', ['ejangular']).controller('RotatCtrl', function ($scope) {
    $scope.dataList = list;
});