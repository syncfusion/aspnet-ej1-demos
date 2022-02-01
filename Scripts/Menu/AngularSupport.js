var data = [
           { id: 1, text: "Mail", parentId: null },
           { id: 2, text: "Calender", parentId: null },
           { id: 3, text: "Notes", parentId: null },
           { id: 4, text: "Contacts", parentId: null },
        //first level child
           { id: 11, parentId: 1, text: "Inbox", sprite: "mailicon sprite-inbox" },
           { id: 12, parentId: 1, text: "Drafts", sprite: "mailicon sprite-drafts" },
           { id: 13, parentId: 1, text: "Sent items", sprite: "mailicon sprite-sentitems" },
           { id: 14, parentId: 1, text: "Deleted", sprite: "mailicon sprite-deleted" },
           { id: 15, parentId: 1, text: "Junk mails", sprite: "mailicon sprite-junk" },
           { id: 16, parentId: 1, text: "Personal", sprite: "mailicon sprite-folders" },
           { id: 17, parentId: 2, text: "My Calender", sprite: "mailicon sprite-calendar" },
           { id: 18, parentId: 2, text: "Team", sprite: "mailicon sprite-calendar" },
           { id: 19, parentId: 2, text: "Others", sprite: "mailicon sprite-calendar" },
           { id: 20, parentId: 3, text: "My Reference", sprite: "mailicon sprite-folder" },
           { id: 21, parentId: 3, text: "Team Meeting", sprite: "mailicon sprite-folder" },
           { id: 22, parentId: 3, text: "Others", sprite: "mailicon sprite-folder" },
           { id: 23, parentId: 4, text: "Suggested", sprite: "mailicon sprite-contacts" },
           { id: 24, parentId: 4, text: "My Team", sprite: "mailicon sprite-contacts" },
           { id: 25, parentId: 4, text: "Others", sprite: "mailicon sprite-contacts" },
        //second level child
           { id: 111, parentId: 11, text: "Development", sprite: "mailicon sprite-folders" },
           { id: 111, parentId: 11, text: "Supports", sprite: "mailicon sprite-folders" },
           { id: 111, parentId: 11, text: "HR Team", sprite: "mailicon sprite-folders" },
           { id: 112, parentId: 12, text: "Support Template", sprite: "mailicon sprite-folders" },
           { id: 112, parentId: 12, text: "Personal", sprite: "mailicon sprite-folders" }
];
angular.module('menuApp', ['ejangular']).controller('MenuCtrl', function ($scope) {
    $scope.dataList = data;
});