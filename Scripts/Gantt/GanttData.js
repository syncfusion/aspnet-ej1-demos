var dayData = [
          {
              "TaskID": 1,
              "TaskName": "Parent Task 1",
              "StartDate": "02/27/2017",
              "duration":7,
              "Progress": "40",
              "Children": [
                   { "TaskID": 2, "TaskName": "Child Task 1", "StartDate": "02/27/2017 08:00:00 AM", "duration": 7, "Progress": "40" },
                   { "TaskID": 3, "TaskName": "Child Task 2", "StartDate": "02/27/2017 08:00:00 AM", "duration": 7, "Progress": "40", },
                   { "TaskID": 4, "TaskName": "Child Task 3", "StartDate": "02/27/2017 08:00:00 AM", "duration": 7, "Progress": "40", }
              ]
          },
          {
              "TaskID": 5,
              "TaskName": "Parent Task 2",
              "StartDate": "02/27/2017",
              "duration": 7,
              "Progress": "40",
              "Children": [
                   { "TaskID": 6, "TaskName": "Child Task 1", "StartDate": "02/27/2017 10:00:00 PM", "duration": 7, "Progress": "40" },
                   { "TaskID": 7, "TaskName": "Child Task 2", "StartDate": "02/27/2017 10:00:00 PM", "duration": 7, "Progress": "40", },
                   { "TaskID": 8, "TaskName": "Child Task 3", "StartDate": "02/27/2017 10:00:00 PM", "duration": 7, "Progress": "40", },
                   { "TaskID": 9, "TaskName": "Child Task 4", "StartDate": "02/27/2017 10:00:00 PM", "duration": 7, "Progress": "40" }
              ]
          },
          {
              "TaskID": 10,
              "TaskName": "Parent Task 3",
              "StartDate": "02/28/2017",
              "duration": 7,
              "Progress": "40",
              "Children": [
                   { "TaskID": 11, "TaskName": "Child Task 1", "StartDate": "02/28/2017 12:00:00 PM", "duration": 7, "Progress": "40" },
                   { "TaskID": 12, "TaskName": "Child Task 2", "StartDate": "02/28/2017 12:00:00 PM", "duration": 7, "Progress": "40", },
                   { "TaskID": 13, "TaskName": "Child Task 3", "StartDate": "02/28/2017 12:00:00 PM", "duration": 7, "Progress": "40", },
                   { "TaskID": 14, "TaskName": "Child Task 4", "StartDate": "02/28/2017 12:00:00 PM", "duration": 7, "Progress": "40", },
                   { "TaskID": 15, "TaskName": "Child Task 5", "StartDate": "02/28/2017 12:00:00 PM", "duration": 7, "Progress": "40", }
              ]
          }

];
var hourData = [
          {
              "TaskID": 1,
              "TaskName": "Parent Task 1",
              "StartDate": "02/27/2017",
              "duration": 40,
              "Progress": "40",
              "Children": [
                   { "TaskID": 2, "TaskName": "Child Task 1", "StartDate": "02/27/2017 01:00:00 AM", "duration": 40, "Progress": "40" },
                   { "TaskID": 3, "TaskName": "Child Task 2", "StartDate": "02/27/2017 01:00:00 AM", "duration": 40, "Progress": "40", },
                   { "TaskID": 4, "TaskName": "Child Task 3", "StartDate": "02/27/2017 01:00:00 AM", "duration": 40, "Progress": "40", }
              ]
          },
          {
              "TaskID": 5,
              "TaskName": "Parent Task 2",
              "StartDate": "02/27/2017",
              "duration": 40,
              "Progress": "40",
              "Children": [
                   { "TaskID": 6, "TaskName": "Child Task 1", "StartDate": "02/27/2017 02:00:00 AM", "duration": 40, "Progress": "40" },
                   { "TaskID": 7, "TaskName": "Child Task 2", "StartDate": "02/27/2017 02:00:00 AM", "duration": 40, "Progress": "40", },
                   { "TaskID": 8, "TaskName": "Child Task 3", "StartDate": "02/27/2017 02:00:00 AM", "duration": 40, "Progress": "40", },
                   { "TaskID": 9, "TaskName": "Child Task 4", "StartDate": "02/27/2017 02:00:00 AM", "duration": 40, "Progress": "40" }
              ]
          },
          {
              "TaskID": 10,
              "TaskName": "Parent Task 3",
              "StartDate": "02/27/2017",
              "duration": 40,
              "Progress": "40",
              "Children": [
                   { "TaskID": 11, "TaskName": "Child Task 1", "StartDate": "02/27/2017 03:00:00 AM", "duration": 40, "Progress": "40" },
                   { "TaskID": 12, "TaskName": "Child Task 2", "StartDate": "02/27/2017 03:00:00 AM", "duration": 40, "Progress": "40", },
                   { "TaskID": 13, "TaskName": "Child Task 3", "StartDate": "02/27/2017 03:00:00 AM", "duration": 40, "Progress": "40", },
                   { "TaskID": 14, "TaskName": "Child Task 4", "StartDate": "02/27/2017 03:00:00 AM", "duration": 40, "Progress": "40", },
                   { "TaskID": 15, "TaskName": "Child Task 5", "StartDate": "02/27/2017 03:00:00 AM", "duration": 40, "Progress": "40", }
              ]
          }

];
var weekData = [
     {
         "TaskID": 1,
         "TaskName": "Parent Task 1",
         "StartDate": "02/27/2017",
         "EndDate": "03/03/2017",
         "Progress": "40",
         "Children": [
              { "TaskID": 2, "TaskName": "Child Task 1", "StartDate": "02/27/2017", "EndDate": "03/03/2017", "Progress": "40" },
              { "TaskID": 3, "TaskName": "Child Task 2", "StartDate": "02/27/2017", "EndDate": "03/03/2017", "Progress": "40", },
              { "TaskID": 4, "TaskName": "Child Task 3", "StartDate": "02/27/2017", "EndDate": "03/03/2017", "Progress": "40", }
         ]
     },
     {
         "TaskID": 5,
         "TaskName": "Parent Task 2",
         "StartDate": "03/06/2017",
         "EndDate": "03/10/2017",
         "Progress": "40",
         "Children": [
              { "TaskID": 6, "TaskName": "Child Task 1", "StartDate": "03/06/2017", "EndDate": "03/10/2017", "Progress": "40" },
              { "TaskID": 7, "TaskName": "Child Task 2", "StartDate": "03/06/2017", "EndDate": "03/10/2017", "Progress": "40", },
              { "TaskID": 8, "TaskName": "Child Task 3", "StartDate": "03/06/2017", "EndDate": "03/10/2017", "Progress": "40", },
              { "TaskID": 9, "TaskName": "Child Task 4", "StartDate": "03/06/2017", "EndDate": "03/10/2017", "Progress": "40" }
         ]
     },
     {
         "TaskID": 10,
         "TaskName": "Parent Task 3",
         "StartDate": "03/13/2017",
         "EndDate": "03/17/2017",
         "Progress": "40",
         "Children": [
              { "TaskID": 11, "TaskName": "Child Task 1", "StartDate": "03/13/2017", "EndDate": "03/17/2017", "Progress": "40" },
              { "TaskID": 12, "TaskName": "Child Task 2", "StartDate": "03/13/2017", "EndDate": "03/17/2017", "Progress": "40", },
              { "TaskID": 13, "TaskName": "Child Task 3", "StartDate": "03/13/2017", "EndDate": "03/17/2017", "Progress": "40", },
              { "TaskID": 14, "TaskName": "Child Task 4", "StartDate": "03/13/2017", "EndDate": "03/17/2017", "Progress": "40", },
              { "TaskID": 15, "TaskName": "Child Task 5", "StartDate": "03/13/2017", "EndDate": "03/17/2017", "Progress": "40", }
         ]
     }

];
var monthData = [
     {
         "TaskID": 1,
         "TaskName": "Parent Task 1",
         "StartDate": "02/27/2017",
         "EndDate": "04/28/2017",
         "Progress": "40",
         "Children": [
              { "TaskID": 2, "TaskName": "Child Task 1", "StartDate": "02/27/2017", "EndDate": "03/28/2017", "Progress": "40" },
              { "TaskID": 3, "TaskName": "Child Task 2", "StartDate": "02/27/2017", "EndDate": "03/28/2017", "Progress": "40", },
              { "TaskID": 4, "TaskName": "Child Task 3", "StartDate": "02/27/2017", "EndDate": "03/28/2017", "Progress": "40", }
         ]
     },
     {
         "TaskID": 5,
         "TaskName": "Parent Task 2",
         "StartDate": "05/03/2017",
         "EndDate": "07/07/2017",
         "Progress": "40",
         "Children": [
              { "TaskID": 6, "TaskName": "Child Task 1", "StartDate": "04/13/2017", "EndDate": "05/20/2017", "Progress": "40" },
              { "TaskID": 7, "TaskName": "Child Task 2", "StartDate": "04/13/2017", "EndDate": "05/20/2017", "Progress": "40", },
              { "TaskID": 8, "TaskName": "Child Task 3", "StartDate": "04/13/2017", "EndDate": "05/20/2017", "Progress": "40", },
              { "TaskID": 9, "TaskName": "Child Task 4", "StartDate": "04/13/2017", "EndDate": "05/20/2017", "Progress": "40" }
         ]
     },
     {
         "TaskID": 10,
         "TaskName": "Parent Task 3",
         "StartDate": "08/10/2017",
         "EndDate": "10/14/2017",
         "Progress": "40",
         "Children": [
              { "TaskID": 11, "TaskName": "Child Task 1", "StartDate": "06/10/2017", "EndDate": "07/14/2017", "Progress": "40" },
              { "TaskID": 12, "TaskName": "Child Task 2", "StartDate": "06/10/2017", "EndDate": "07/14/2017", "Progress": "40", },
              { "TaskID": 13, "TaskName": "Child Task 3", "StartDate": "06/10/2017", "EndDate": "07/14/2017", "Progress": "40", },
              { "TaskID": 14, "TaskName": "Child Task 4", "StartDate": "06/10/2017", "EndDate": "07/14/2017", "Progress": "40", },
              { "TaskID": 15, "TaskName": "Child Task 5", "StartDate": "06/10/2017", "EndDate": "07/14/2017", "Progress": "40", }
         ]
     }

];
var quarterYearData = [
     {
         "TaskID": 1,
         "TaskName": "Parent Task 1",
         "StartDate": new Date("02/27/2017"),
         "EndDate": new Date("07/28/2017"),
         "Progress": "40",
         "Children": [
              { "TaskID": 2, "TaskName": "Child Task 1", "StartDate": new Date("02/27/2017"), "EndDate": new Date("07/28/2017"), "Progress": "40" },
              { "TaskID": 3, "TaskName": "Child Task 2", "StartDate": new Date("02/27/2017"), "EndDate": new Date("07/28/2017"), "Progress": "40", },
              { "TaskID": 4, "TaskName": "Child Task 3", "StartDate": new Date("02/27/2017"), "EndDate": new Date("07/28/2017"), "Progress": "40", }
         ]
     },
     {
         "TaskID": 5,
         "TaskName": "Parent Task 2",
         "StartDate": new Date("09/13/2017"),
         "EndDate": new Date("02/20/2018"),
         "Progress": "40",
         "Children": [
              { "TaskID": 6, "TaskName": "Child Task 1", "StartDate": new Date("09/13/2017"), "EndDate": new Date("02/20/2018"), "Progress": "40" },
              { "TaskID": 7, "TaskName": "Child Task 2", "StartDate": new Date("09/13/2017"), "EndDate": new Date("02/20/2018"), "Progress": "40", },
              { "TaskID": 8, "TaskName": "Child Task 3", "StartDate": new Date("09/13/2017"), "EndDate": new Date("02/20/2018"), "Progress": "40", },
              { "TaskID": 9, "TaskName": "Child Task 4", "StartDate": new Date("09/13/2017"), "EndDate": new Date("02/20/2018"), "Progress": "40" }
         ]
     },
     {
         "TaskID": 10,
         "TaskName": "Parent Task 3",
         "StartDate": new Date("05/10/2018"),
         "EndDate": new Date("10/14/2018"),
         "Progress": "40",
         "Children": [
              { "TaskID": 11, "TaskName": "Child Task 1", "StartDate": new Date("05/10/2018"), "EndDate": new Date("10/14/2018"), "Progress": "40" },
              { "TaskID": 12, "TaskName": "Child Task 2", "StartDate": new Date("05/10/2018"), "EndDate": new Date("10/14/2018"), "Progress": "40", },
              { "TaskID": 13, "TaskName": "Child Task 3", "StartDate": new Date("05/10/2018"), "EndDate": new Date("10/14/2018"), "Progress": "40", },
              { "TaskID": 14, "TaskName": "Child Task 4", "StartDate": new Date("05/10/2018"), "EndDate": new Date("10/14/2018"), "Progress": "40", },
              { "TaskID": 15, "TaskName": "Child Task 5", "StartDate": new Date("05/10/2018"), "EndDate": new Date("10/14/2018"), "Progress": "40", }
         ]
     }

];
var halfYearData = [
     {
         "TaskID": 1,
         "TaskName": "Parent Task 1",
         "StartDate": new Date("06/27/2017"),
         "EndDate": new Date("04/28/2018"),
         "Progress": "40",
         "Children": [
              { "TaskID": 2, "TaskName": "Child Task 1", "StartDate": new Date("06/10/2017"), "EndDate": new Date("04/28/2018"), "Progress": "40" },
              { "TaskID": 3, "TaskName": "Child Task 2", "StartDate": new Date("06/10/2017"), "EndDate": new Date("04/28/2018"), "Progress": "40", },
              { "TaskID": 4, "TaskName": "Child Task 3", "StartDate": new Date("06/10/2017"), "EndDate": new Date("04/28/2018"), "Progress": "40", }
         ]
     },
     {
         "TaskID": 5,
         "TaskName": "Parent Task 2",
         "StartDate": new Date("08/23/2018"),
         "EndDate": new Date("06/20/2018"),
         "Progress": "40",
         "Children": [
              { "TaskID": 6, "TaskName": "Child Task 1", "StartDate": new Date("08/23/2018"), "EndDate": new Date("06/20/2019"), "Progress": "40" },
              { "TaskID": 7, "TaskName": "Child Task 2", "StartDate": new Date("08/23/2018"), "EndDate": new Date("06/20/2019"), "Progress": "40", },
              { "TaskID": 8, "TaskName": "Child Task 3", "StartDate": new Date("08/23/2018"), "EndDate": new Date("06/20/2019"), "Progress": "40", },
              { "TaskID": 9, "TaskName": "Child Task 4", "StartDate": new Date("08/23/2018"), "EndDate": new Date("06/20/2019"), "Progress": "40" }
         ]
     },
     {
         "TaskID": 10,
         "TaskName": "Parent Task 3",
         "StartDate": new Date("09/20/2019"),
         "EndDate": new Date("08/14/2020"),
         "Progress": "40",
         "Children": [
              { "TaskID": 11, "TaskName": "Child Task 1", "StartDate": new Date("09/20/2019"), "EndDate": new Date("08/14/2020"), "Progress": "40" },
              { "TaskID": 12, "TaskName": "Child Task 2", "StartDate": new Date("09/20/2019"), "EndDate": new Date("08/14/2020"), "Progress": "40", },
              { "TaskID": 13, "TaskName": "Child Task 3", "StartDate": new Date("09/20/2019"), "EndDate": new Date("08/14/2020"), "Progress": "40", },
              { "TaskID": 14, "TaskName": "Child Task 4", "StartDate": new Date("09/20/2019"), "EndDate": new Date("08/14/2020"), "Progress": "40", },
              { "TaskID": 15, "TaskName": "Child Task 5", "StartDate": new Date("09/20/2019"), "EndDate": new Date("08/14/2020"), "Progress": "40", }
         ]
     }

];