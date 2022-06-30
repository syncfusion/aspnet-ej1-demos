var autocomplete;
$(function () {
    var countryList = ["United States", "Australia", "Austria", "India", "United Kingdom", "China", "Mexico", "Canada",
    "Afganistan", "Iran", "Indonesia", "Russia", "Egypt", "Brazil", "Poland", "Portugal", "Sweden", "Saudi Arabia", "Turkey"];
    // declaration             
    var ViewModel = function () {
        this.countryName = ko.observable("New York");
				this.countryList = ko.observable(countryList);
    };
    ko.applyBindings(new ViewModel());
});
