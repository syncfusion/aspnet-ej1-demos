var treeGridDataSource = [
           {
               "Name": "Windows",
               "DateModified": "06/26/2014",
               "Type": "File Folder",
               "DateCreated": "06/16/2014",
               "Children": [
                   {
                       "Name": "Users",
                       "DateModified": "06/26/2014",
                       "Type": "File Folder",
                       "DateCreated": "06/16/2014",
                       "Children": [
                           {
                               "Name": "Public",
                               "DateModified": "06/26/2014",
                               "Type": "File Folder",
                               "DateCreated": "06/16/2014",
                               "Children": [
                                   {
                                       "Name": "Documents ",
                                       "DateModified": "06/26/2014",
                                       "Type": "File Folder",
                                       "DateCreated": "06/16/2014",
                                       "Children": [
                                           { "Name": "Document 1", "DateModified": "06/26/2014", "Type": "HTML document", "DateCreated": "06/16/2014", },
                                           { "Name": "Document 2", "DateModified": "06/26/2014", "Type": "HTML document", "DateCreated": "06/16/2014", },
                                           { "Name": "Document 3", "DateModified": "06/26/2014", "Type": "HTML document", "DateCreated": "06/16/2014", }
                                       ]
                                   }
                               ]
                           }
                       ]
                   }
               ]
           }
];

var projectData = [
     {
         taskID: 1,
         taskName: "Planning",
         startDate: "02/03/2014",
         endDate: "02/07/2014",
         progress: 100,
         duration:5,
         subtasks: [
             { taskID: 2, taskName: "Plan timeline", startDate: "02/03/2014", endDate: "02/07/2014", duration: 5, progress: 100 },
             { taskID: 3, taskName: "Plan budget", startDate: "02/03/2014", endDate: "02/07/2014", duration: 5, progress: 100 },
             { taskID: 4, taskName: "Allocate resources", startDate: "02/03/2014", endDate: "02/07/2014", duration: 5, progress: 100 },
             { taskID: 5, taskName: "Planning complete", startDate: "02/07/2014", endDate: "02/07/2014", duration: 0, progress: 0 }
         ]
     },
     {
         taskID: 6,
         taskName: "Design",
         startDate: "02/10/2014",
         endDate: "02/14/2014",
         duration: 3,
         progress: 86,
         subtasks: [
             { taskID: 7, taskName: "Software Specification", startDate: "02/10/2014", endDate: "02/12/2014", duration: 3, progress: 60 },
             { taskID: 8, taskName: "Develop prototype", startDate: "02/10/2014", endDate: "02/12/2014", duration: 3, progress: 100 },
             { taskID: 9, taskName: "Get approval from customer", startDate: "02/13/2014", endDate: "02/14/2014", duration: 2, progress: 100 },
             { taskID: 10, taskName: "Design complete", startDate: "02/14/2014", endDate: "02/14/2014", duration: 0, progress: 0 }
         ]
     },
	 {
                taskID: 12,
                taskName: "Implementation Phase",
                startDate: "02/17/2014",
                endDate: "02/27/2014",
                subtasks: [
                    {
                        taskID: 13,
                        taskName: "Phase 1",
                        startDate: "02/17/2014",
                        endDate: "02/27/2014",
                        subtasks: [{
                            taskID: 14,
                            taskName: "Implementation Module 1",
                            startDate: "02/17/2014",
                            endDate: "02/27/2014",
                            subtasks: [
                                { taskID: 15, taskName: "Development Task 1", startDate: "02/17/2014", endDate: "02/19/2014", duration: 3, progress: "50" },
                                { taskID: 16, taskName: "Development Task 2", startDate: "02/17/2014", endDate: "02/19/2014", duration: 3, progress: "50" },
                                { taskID: 17, taskName: "Testing", startDate: "02/20/2014", endDate: "02/21/2014", duration: 2, progress: "0" },
                                { taskID: 18, taskName: "Bug fix", startDate: "02/24/2014", endDate: "02/25/2014", duration: 2, progress: "0" },
                                { taskID: 19, taskName: "Customer review meeting", startDate: "02/26/2014", endDate: "02/27/2014", duration: 2, progress: "0" },
                                { taskID: 20, taskName: "Phase 1 complete", startDate: "02/27/2014", endDate: "02/27/2014", duration: 0}
                                
                            ]
                        }]
                    },
                    
                    {
                        taskID: 21,
                        taskName: "Phase 2",
                        startDate: "02/17/2014",
                        endDate: "02/28/2014",
                        subtasks: [{
                            taskID: 22,
                            taskName: "Implementation Module 2",
                            startDate: "02/17/2014",
                            endDate: "02/28/2014",
                            subtasks: [
                                { taskID: 23, taskName: "Development Task 1", startDate: "02/17/2014", endDate: "02/20/2014", duration: 4, progress: "50",  },
                                { taskID: 24, taskName: "Development Task 2", startDate: "02/17/2014", endDate: "02/20/2014", duration: 4, progress: "50", },
                                { taskID: 25, taskName: "Testing", startDate: "02/21/2014", endDate: "02/24/2014", duration: 2, progress: "0", },
                                { taskID: 26, taskName: "Bug fix", startDate: "02/25/2014", endDate: "02/26/2014", duration: 2, progress: "0",  },
                                { taskID: 27, taskName: "Customer review meeting", startDate: "02/27/2014", endDate: "02/28/2014", duration: 2, progress: "0" },
                                { taskID: 28, taskName: "Phase 2 complete", startDate: "02/28/2014", endDate: "02/28/2014", duration: 0 }

                            ]
                        }]
                    },
                    
                    {
                        taskID: 29,
                        taskName: "Phase 3",
                        startDate: "02/17/2014",
                        endDate: "02/27/2014",
                        subtasks: [{
                            taskID: 30,
                            taskName: "Implementation Module 3",
                            startDate: "02/17/2014",
                            endDate: "02/27/2014",
                            subtasks: [
                                { taskID: 31, taskName: "Development Task 1", startDate: "02/17/2014", endDate: "02/19/2014", duration: 3, progress: "50" },
                                { taskID: 32, taskName: "Development Task 2", startDate: "02/17/2014", endDate: "02/19/2014", duration: 3, progress: "50" },
                                { taskID: 33, taskName: "Testing", startDate: "02/20/2014", endDate: "02/21/2014", duration: 2, progress: "0"},
                                { taskID: 34, taskName: "Bug fix", startDate: "02/24/2014", endDate: "02/25/2014", duration: 2, progress: "0"},
                                { taskID: 35, taskName: "Customer review meeting", startDate: "02/26/2014", endDate: "02/27/2014", duration: 2, progress: "0"},
                                { taskID: 36, taskName: "Phase 3 complete", startDate: "02/27/2014", endDate: "02/27/2014", duration: 0},

                            ]
                        }]
                    }
                ]
            }
];

