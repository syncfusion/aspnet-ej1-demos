#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
namespace WebSampleBrowser.SpreadsheetASP.Model
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using System.ComponentModel;

    public class FIFAData
    {
        public string format1 { get; set; }
        public string format2 { get; set; }
        public string format3 { get; set; }
        public string format4 { get; set; }
        public string format5 { get; set; }
        public string format6 { get; set; }
        public string format7 { get; set; }
        public string format8 { get; set; }
        public string format9 { get; set; }
        public string format10 { get; set; }
        public string format11 { get; set; }
    }

    public class FIFAMomData
    {
        public string name { get; set; }
        public string style1 { get; set; }
        public string style2 { get; set; }
        public string style3 { get; set; }
        public string style4 { get; set; }
    }

    public class FIFAScheduleData
    {
        public string name { get; set; }
        public string style1 { get; set; }
        public string style2 { get; set; }
        public string style3 { get; set; }
        public string style4 { get; set; }
        public string style5 { get; set; }
    }
    public class FIFATopScoreData
    {
        public string name { get; set; }
        public string style1 { get; set; }
        public string style2 { get; set; }
        public string style3 { get; set; }
        public string style4 { get; set; }
        public string style5 { get; set; }
    }

    public class FIFADataContext
    {
        private List<FIFAData> GetFIFTeamPlaces
        {
            get
            {
                List<FIFAData> formats = new List<FIFAData>();

                formats.Add(new FIFAData() { format1 = "Position", format2 = "Team", format3 = "Played", format4 = "Won", format5 = "Drawn", format6 = "Lost", format7 = "Points" });
                formats.Add(new FIFAData() { format1 = "1", format2 = "Germany", format3 = "7", format4 = "6", format5 = "1", format6 = "0", format7 = "19" });
                formats.Add(new FIFAData() { format1 = "2", format2 = "Argentina", format3 = "7", format4 = "5", format5 = "1", format6 = "1", format7 = "16" });
                formats.Add(new FIFAData() { format1 = "3", format2 = "Netherlands", format3 = "7", format4 = "5", format5 = "2", format6 = "0", format7 = "17" });
                formats.Add(new FIFAData() { format1 = "4", format2 = "Brazil", format3 = "7", format4 = "3", format5 = "2", format6 = "2", format7 = "11" });
                formats.Add(new FIFAData() { format1 = "5", format2 = "Colombia", format3 = "5", format4 = "4", format5 = "0", format6 = "1", format7 = "12" });
                formats.Add(new FIFAData() { format1 = "6", format2 = "Belgium", format3 = "5", format4 = "4", format5 = "0", format6 = "1", format7 = "12" });
                formats.Add(new FIFAData() { format1 = "7", format2 = "France", format3 = "5", format4 = "3", format5 = "1", format6 = "1", format7 = "10" });
                formats.Add(new FIFAData() { format1 = "8", format2 = "Costa Rica", format3 = "5", format4 = "2", format5 = "3", format6 = "0", format7 = "9" });
                formats.Add(new FIFAData() { format1 = "9", format2 = "Chile", format3 = "4", format4 = "2", format5 = "1", format6 = "1", format7 = "7" });
                formats.Add(new FIFAData() { format1 = "10", format2 = "Mexico", format3 = "4", format4 = "2", format5 = "1", format6 = "1", format7 = "7" });
                formats.Add(new FIFAData() { format1 = "11", format2 = "Switzerland", format3 = "4", format4 = "2", format5 = "0", format6 = "2", format7 = "6" });
                formats.Add(new FIFAData() { format1 = "12", format2 = "Uruguay", format3 = "4", format4 = "2", format5 = "0", format6 = "2", format7 = "6" });
                formats.Add(new FIFAData() { format1 = "13", format2 = "Greece", format3 = "4", format4 = "1", format5 = "2", format6 = "1", format7 = "5" });
                formats.Add(new FIFAData() { format1 = "14", format2 = "Algeria", format3 = "4", format4 = "1", format5 = "1", format6 = "2", format7 = "4" });
                formats.Add(new FIFAData() { format1 = "15", format2 = "United States", format3 = "4", format4 = "1", format5 = "1", format6 = "2", format7 = "4" });
                formats.Add(new FIFAData() { format1 = "16", format2 = "Nigeria", format3 = "4", format4 = "1", format5 = "1", format6 = "2", format7 = "4" });
                formats.Add(new FIFAData() { format1 = "17", format2 = "Ecuador", format3 = "3", format4 = "1", format5 = "1", format6 = "1", format7 = "4" });
                formats.Add(new FIFAData() { format1 = "18", format2 = "Portugal", format3 = "3", format4 = "1", format5 = "1", format6 = "1", format7 = "4" });
                formats.Add(new FIFAData() { format1 = "19", format2 = "Croatia", format3 = "3", format4 = "1", format5 = "0", format6 = "2", format7 = "3" });
                formats.Add(new FIFAData() { format1 = "20", format2 = "Bosnia", format3 = "3", format4 = "1", format5 = "0", format6 = "2", format7 = "3" });
                formats.Add(new FIFAData() { format1 = "21", format2 = "Ivory Coast", format3 = "3", format4 = "1", format5 = "0", format6 = "2", format7 = "3" });
                formats.Add(new FIFAData() { format1 = "22", format2 = "Italy", format3 = "3", format4 = "1", format5 = "0", format6 = "2", format7 = "3" });
                formats.Add(new FIFAData() { format1 = "23", format2 = "Spain", format3 = "3", format4 = "1", format5 = "0", format6 = "2", format7 = "3" });
                formats.Add(new FIFAData() { format1 = "24", format2 = "Russia", format3 = "3", format4 = "0", format5 = "2", format6 = "1", format7 = "2" });
                formats.Add(new FIFAData() { format1 = "25", format2 = "Ghana", format3 = "3", format4 = "0", format5 = "1", format6 = "2", format7 = "1" });
                formats.Add(new FIFAData() { format1 = "26", format2 = "England", format3 = "3", format4 = "0", format5 = "1", format6 = "2", format7 = "1" });
                formats.Add(new FIFAData() { format1 = "27", format2 = "South Korea", format3 = "3", format4 = "0", format5 = "1", format6 = "2", format7 = "1" });
                formats.Add(new FIFAData() { format1 = "28", format2 = "Iran", format3 = "3", format4 = "0", format5 = "1", format6 = "2", format7 = "1" });
                formats.Add(new FIFAData() { format1 = "29", format2 = "Japan", format3 = "3", format4 = "0", format5 = "1", format6 = "2", format7 = "1" });
                formats.Add(new FIFAData() { format1 = "30", format2 = "Australia", format3 = "3", format4 = "0", format5 = "0", format6 = "3", format7 = "0" });
                formats.Add(new FIFAData() { format1 = "31", format2 = "Honduras", format3 = "3", format4 = "0", format5 = "0", format6 = "3", format7 = "0" });
                formats.Add(new FIFAData() { format1 = "32", format2 = "Cameroon", format3 = "3", format4 = "0", format5 = "0", format6 = "3", format7 = "0" });

                return formats;
            }
        }
        private List<FIFAMomData> GetFIFMom
        {
            get
            {
                List<FIFAMomData> formats = new List<FIFAMomData>();

                formats.Add(new FIFAMomData() { name = "Rank", style1 = "Name", style2 = "Team", style3 = "Opponent", style4 = "Awards" });
                formats.Add(new FIFAMomData() { name = "1", style1 = "Lionel Messi", style2 = " Argentina", style3 = "Bosnia and Herzegovina (GM), Iran (GM), Nigeria (GM), Switzerland (R16)", style4 = "4" });
                formats.Add(new FIFAMomData() { name = "2", style1 = "Keylor Navas", style2 = " Costa Rica", style3 = "England (GM), Greece (R16), Netherlands (QF)", style4 = "3" });
                formats.Add(new FIFAMomData() { name = "2", style1 = "Arjen Robben", style2 = " Netherlands", style3 = "Australia (GM), Chile (GM), Brazil (TP)", style4 = "3" });
                formats.Add(new FIFAMomData() { name = "2", style1 = "James Rodríguez", style2 = " Colombia", style3 = "Greece (GM), Ivory Coast (GM), Uruguay (R16)", style4 = "3" });
                formats.Add(new FIFAMomData() { name = "5", style1 = "Karim Benzema", style2 = " France", style3 = "Honduras (GM), Switzerland (GM)", style4 = "2" });
                formats.Add(new FIFAMomData() { name = "5", style1 = "Mario Götze", style2 = " Germany", style3 = "Ghana (GM), Argentina (FI)", style4 = "2" });
                formats.Add(new FIFAMomData() { name = "5", style1 = "Tim Howard", style2 = " United States", style3 = "Portugal (GM), Belgium (R16)", style4 = "2" });
                formats.Add(new FIFAMomData() { name = "5", style1 = "Thomas Müller", style2 = " Germany", style3 = "Portugal (GM), United States (GM)", style4 = "2" });
                formats.Add(new FIFAMomData() { name = "5", style1 = "Neymar", style2 = " Brazil", style3 = "Croatia (GM), Cameroon (GM)", style4 = "2" });
                formats.Add(new FIFAMomData() { name = "5", style1 = "Guillermo Ochoa", style2 = " Mexico", style3 = "Brazil (GM), Netherlands (R16)", style4 = "2" });
                formats.Add(new FIFAMomData() { name = "5", style1 = "Xherdan Shaqiri", style2 = "  Switzerland", style3 = "Ecuador (GM), Honduras (GM)", style4 = "2" });
                formats.Add(new FIFAMomData() { name = "5", style1 = "Islam Slimani", style2 = " Algeria", style3 = "South Korea (GM), Russia (GM)", style4 = "2" });
                formats.Add(new FIFAMomData() { name = "13", style1 = "Mario Balotelli", style2 = " Italy", style3 = "England (GM)", style4 = "1" });
                formats.Add(new FIFAMomData() { name = "13", style1 = "Gianluigi Buffon", style2 = " Italy", style3 = "Uruguay (GM)", style4 = "1" });
                formats.Add(new FIFAMomData() { name = "13", style1 = "Joel Campbell", style2 = " Costa Rica", style3 = "Uruguay (GM)", style4 = "1" });
                formats.Add(new FIFAMomData() { name = "13", style1 = "Júlio César", style2 = " Brazil", style3 = "Chile (R16)", style4 = "1" });
                formats.Add(new FIFAMomData() { name = "13", style1 = "Kevin De Bruyne", style2 = " Belgium", style3 = "Algeria (GM)", style4 = "1" });
                formats.Add(new FIFAMomData() { name = "13", style1 = "Clint Dempsey", style2 = " United States", style3 = "Ghana (GM)", style4 = "1" });
                formats.Add(new FIFAMomData() { name = "13", style1 = "Cristiano Ronaldo", style2 = " Portugal", style3 = "Ghana (GM)", style4 = "1" });
                formats.Add(new FIFAMomData() { name = "13", style1 = "Alexander Domínguez", style2 = " Ecuador", style3 = "France (GM)", style4 = "1" });
                formats.Add(new FIFAMomData() { name = "13", style1 = "Edin Džeko", style2 = " Bosnia and Herzegovina", style3 = "Iran (GM)", style4 = "1" });
                formats.Add(new FIFAMomData() { name = "13", style1 = "Eden Hazard", style2 = " Belgium", style3 = "Russia (GM)", style4 = "1" });
                formats.Add(new FIFAMomData() { name = "13", style1 = "Gonzalo Higuaín", style2 = " Argentina", style3 = "Belgium (QF)", style4 = "1" });
                formats.Add(new FIFAMomData() { name = "13", style1 = "Keisuke Honda", style2 = " Japan", style3 = "Greece (GM)", style4 = "1" });
                formats.Add(new FIFAMomData() { name = "13", style1 = "Mats Hummels", style2 = " Germany", style3 = "France (QF)", style4 = "1" });
                formats.Add(new FIFAMomData() { name = "13", style1 = "Toni Kroos", style2 = " Germany", style3 = "Brazil (SF)", style4 = "1" });
                formats.Add(new FIFAMomData() { name = "13", style1 = "David Luiz", style2 = " Brazil", style3 = "Colombia (QF)", style4 = "1" });
                formats.Add(new FIFAMomData() { name = "13", style1 = "Raïs M'Bolhi", style2 = " Algeria", style3 = "Germany (R16)", style4 = "1" });
                formats.Add(new FIFAMomData() { name = "13", style1 = "Mario Mandžukić", style2 = " Croatia", style3 = "Cameroon (GM)", style4 = "1" });
                formats.Add(new FIFAMomData() { name = "13", style1 = "Rafael Márquez", style2 = " Mexico", style3 = "Croatia (GM)", style4 = "1" });
                formats.Add(new FIFAMomData() { name = "13", style1 = "Jackson Martínez", style2 = " Colombia", style3 = "Japan (GM)", style4 = "1" });
                formats.Add(new FIFAMomData() { name = "13", style1 = "John Obi Mikel", style2 = " Nigeria", style3 = "Iran (GM)", style4 = "1" });
                formats.Add(new FIFAMomData() { name = "13", style1 = "Peter Odemwingie", style2 = " Nigeria", style3 = "Bosnia and Herzegovina (GM)", style4 = "1" });
                formats.Add(new FIFAMomData() { name = "13", style1 = "Robin van Persie", style2 = " Netherlands", style3 = "Spain (GM)", style4 = "1" });
                formats.Add(new FIFAMomData() { name = "13", style1 = "Paul Pogba", style2 = " France", style3 = "Nigeria (R16)", style4 = "1" });
                formats.Add(new FIFAMomData() { name = "13", style1 = "Sergio Romero", style2 = " Argentina", style3 = "Netherlands (SF)", style4 = "1" });
                formats.Add(new FIFAMomData() { name = "13", style1 = "Bryan Ruiz", style2 = " Costa Rica", style3 = "Italy (GM)", style4 = "1" });
                formats.Add(new FIFAMomData() { name = "13", style1 = "Georgios Samaras", style2 = " Greece", style3 = "Ivory Coast (GM)", style4 = "1" });

                return formats;
            }
        }
        private List<FIFAScheduleData> GetFIFSchedule
        {
            get
            {
                List<FIFAScheduleData> formats = new List<FIFAScheduleData>();

                formats.Add(new FIFAScheduleData() { name = "Day", style1 = "Time", style2 = "Group", style3 = "Team", style4 = "Venue", style5 = "Result" });
                formats.Add(new FIFAScheduleData() { name = "THURSDAY, JUNE 12, 2014", style1 = "20=00 GMT", style2 = "Group A", style3 = "Brazil vs  Croatia", style4 = "Arena Corinthians", style5 = "3 - 1" });
                formats.Add(new FIFAScheduleData() { name = "FRIDAY, JUNE 13, 2014", style1 = "16=00 GMT", style2 = "Group A", style3 = "Mexico vs  Cameroon", style4 = "Estadio das Dunas", style5 = "1 - 0" });
                formats.Add(new FIFAScheduleData() { name = "FRIDAY, JUNE 13, 2014", style1 = "19=00 GMT", style2 = "Group B", style3 = "Spain vs  Netherlands", style4 = "Arena Fonte Nova", style5 = "1 -5" });
                formats.Add(new FIFAScheduleData() { name = "FRIDAY, JUNE 13, 2014", style1 = "22=00 GMT", style2 = "Group B", style3 = "Chile vs Australia", style4 = "Arena Pantanal", style5 = "3 - 1" });
                formats.Add(new FIFAScheduleData() { name = "SATURDAY, JUNE 14, 2014", style1 = "16=00 GMT", style2 = "Group C", style3 = "Colombia vs Greece", style4 = "Estadio Mineirao", style5 = "3 - 0" });
                formats.Add(new FIFAScheduleData() { name = "SATURDAY, JUNE 14, 2014", style1 = "19=00 GMT", style2 = "Group D", style3 = "Uruguay vs Costa Rica", style4 = "Estadio Castelao", style5 = "1 - 3" });
                formats.Add(new FIFAScheduleData() { name = "SATURDAY, JUNE 14, 2014", style1 = "22=00 GMT", style2 = "Group D", style3 = "England vs Italy", style4 = "Arena Amazonia", style5 = "1 - 2" });
                formats.Add(new FIFAScheduleData() { name = "SATURDAY, JUNE 14, 2014", style1 = "01=00 GMT", style2 = "Group C", style3 = "Ivory Coast vs Japan", style4 = "Arena Pernambuco", style5 = "2 -1" });
                formats.Add(new FIFAScheduleData() { name = "SUNDAY, JUNE 15, 2014", style1 = "16=00 GMT", style2 = "Group E", style3 = "Switzerland vs Ecuador", style4 = "Nacional", style5 = "2 - 1" });
                formats.Add(new FIFAScheduleData() { name = "SUNDAY, JUNE 15, 2014", style1 = "19=00 GMT", style2 = "Group E", style3 = "France vs Honduras", style4 = "Estadio Beira-Rio", style5 = "3 - 0" });
                formats.Add(new FIFAScheduleData() { name = "SUNDAY, JUNE 15, 2014", style1 = "22=00 GMT", style2 = "Group F", style3 = "Argentina vs Bosnia ", style4 = "Estadio do Maracana", style5 = "2 - 1" });
                formats.Add(new FIFAScheduleData() { name = "MONDAY, JUNE 16, 2014", style1 = "16=00 GMT", style2 = "Group G", style3 = "Germany vs Portugal", style4 = "Arena Fonte Nova", style5 = "0 - 0" });
                formats.Add(new FIFAScheduleData() { name = "MONDAY, JUNE 16, 2014", style1 = "19=00 GMT", style2 = "Group F", style3 = "Iran vs Nigeria", style4 = "Arena da Baixada", style5 = "4 - 0" });
                formats.Add(new FIFAScheduleData() { name = "MONDAY, JUNE 16, 2014", style1 = "22=00 GMT", style2 = "Group G", style3 = "Ghana vs United States", style4 = "Estadio das Dunas", style5 = "1 - 2" });
                formats.Add(new FIFAScheduleData() { name = "TUESDAY, JUNE 17, 2014", style1 = "16=00 GMT", style2 = "Group H", style3 = "Belgium vs Algeria", style4 = "Estadio Mineirao", style5 = "0 - 0" });
                formats.Add(new FIFAScheduleData() { name = "TUESDAY, JUNE 17, 2014", style1 = "19=00 GMT", style2 = "Group A", style3 = "Brazil vs Mexico", style4 = "Estadio Castelao", style5 = "2 - 1" });
                formats.Add(new FIFAScheduleData() { name = "TUESDAY, JUNE 17, 2014", style1 = "22=00 GMT", style2 = "Group H", style3 = "Russia vs South Korea", style4 = "Arena Pantanal", style5 = "1 - 1" });
                formats.Add(new FIFAScheduleData() { name = "WEDNESDAY, JUNE 18, 2014", style1 = "16=00 GMT", style2 = "Group B", style3 = "Australia vs Netherlands", style4 = "Estadio Beira-Rio", style5 = "0 - 4" });
                formats.Add(new FIFAScheduleData() { name = "WEDNESDAY, JUNE 18, 2014", style1 = "19=00 GMT", style2 = "Group B", style3 = "Spain vs Chile", style4 = "Estadio do Maracana", style5 = "2 - 3" });
                formats.Add(new FIFAScheduleData() { name = "WEDNESDAY, JUNE 18, 2014", style1 = "22=00 GMT", style2 = "Group A", style3 = "Cameroon vs Croatia", style4 = "Arena Amazonia", style5 = "0 - 2" });
                formats.Add(new FIFAScheduleData() { name = "THURSDAY, JUNE 19, 2014", style1 = "16=00 GMT", style2 = "Group C", style3 = "Colombia vs Ivory Coast", style4 = "Nacional", style5 = "2 - 1" });
                formats.Add(new FIFAScheduleData() { name = "THURSDAY, JUNE 19, 2014", style1 = "19=00 GMT", style2 = "Group D", style3 = "Uruguay vs England", style4 = "Arena Corinthi", style5 = "0 - 0" });
                formats.Add(new FIFAScheduleData() { name = "THURSDAY, JUNE 19, 2014", style1 = "22=00 GMT", style2 = "Group C", style3 = "Japan vs Greece", style4 = "Estadio das Dunas", style5 = "2 - 1" });
                formats.Add(new FIFAScheduleData() { name = "FRIDAY, JUNE 20, 2014", style1 = "16=00 GMT", style2 = "Group D", style3 = "Italy vs Costa Rica", style4 = "Arena Pernambuco", style5 = "0 - 1" });
                formats.Add(new FIFAScheduleData() { name = "FRIDAY, JUNE 20, 2014", style1 = "19=00 GMT", style2 = "Group E", style3 = "Switzerland vs France", style4 = "Arena Fonte Nova", style5 = "2 - 5" });
                formats.Add(new FIFAScheduleData() { name = "FRIDAY, JUNE 20, 2014", style1 = "22=00 GMT", style2 = "Group E", style3 = "Honduras vs Ecuador", style4 = "Arena da Baixada", style5 = "1 - 2" });
                formats.Add(new FIFAScheduleData() { name = "SATURDAY, JUNE 21, 2014", style1 = "16=00 GMT", style2 = "Group F", style3 = "Argentina vs Iran", style4 = "Estadio Mineirao", style5 = "1 - 0" });
                formats.Add(new FIFAScheduleData() { name = "SATURDAY, JUNE 21, 2014", style1 = "19=00 GMT", style2 = "Group G", style3 = "Germany vs Ghana", style4 = "Estadio Castelao", style5 = "1 - 0" });
                formats.Add(new FIFAScheduleData() { name = "SATURDAY, JUNE 21, 2014", style1 = "22=00 GMT", style2 = "Group F", style3 = "Nigeria vs Bosnia", style4 = "Arena Pantanal", style5 = "2 - 2" });
                formats.Add(new FIFAScheduleData() { name = "SUNDAY, JUNE 22, 2014", style1 = "16=00 GMT", style2 = "Group H", style3 = "Belgium vs Russia", style4 = "Estadio Maracana", style5 = "2 - 2" });
                formats.Add(new FIFAScheduleData() { name = "SUNDAY, JUNE 22, 2014", style1 = "19=00 GMT", style2 = "Group H", style3 = "South Korea vs Algeria", style4 = "Estadio Beira-Rio", style5 = "1 - 0" });
                formats.Add(new FIFAScheduleData() { name = "SUNDAY, JUNE 22, 2014", style1 = "20=00 GMT", style2 = "Group G", style3 = "United States vs Portugal", style4 = "Arena Amazonia", style5 = "2 - 4" });
                formats.Add(new FIFAScheduleData() { name = "MONDAY, JUNE 23, 2014", style1 = "16=00 GMT", style2 = "Group B", style3 = "Australia vs Spain", style4 = "Arena da Baixada", style5 = "1 - 4" });
                formats.Add(new FIFAScheduleData() { name = "MONDAY, JUNE 23, 2014", style1 = "16=00 GMT", style2 = "Group B", style3 = "Netherlands vs Chile", style4 = "Arena Corinthians", style5 = "1 - 3" });
                formats.Add(new FIFAScheduleData() { name = "MONDAY, JUNE 23, 2014", style1 = "20=00 GMT", style2 = "Group A", style3 = "Croatia vs Mexico", style4 = "Arena Pernambuco", style5 = "0 - 3" });
                formats.Add(new FIFAScheduleData() { name = "MONDAY, JUNE 23, 2014", style1 = "20=00 GMT", style2 = "Group A", style3 = "Cameroon vs Brazil", style4 = "Estadio Nacional de Brasilia", style5 = "2 - 0" });
                formats.Add(new FIFAScheduleData() { name = "TUESDAY, JUNE 24, 2014", style1 = "16=00 GMT", style2 = "Group D", style3 = "Italy vs Uruguay", style4 = "Estadio das Dunas", style5 = "2 - 1" });
                formats.Add(new FIFAScheduleData() { name = "TUESDAY, JUNE 24, 2014", style1 = "16=00 GMT", style2 = "Group D", style3 = "Costa Rica vs England", style4 = "Estadio Mineirao", style5 = "1 - 4" });
                formats.Add(new FIFAScheduleData() { name = "TUESDAY, JUNE 24, 2014", style1 = "20=00 GMT", style2 = "Group C", style3 = "Japan vs Colombia", style4 = "Arena Pantanal", style5 = "0 - 0" });
                formats.Add(new FIFAScheduleData() { name = "TUESDAY, JUNE 24, 2014", style1 = "20=00 GMT", style2 = "Group C", style3 = "Greece vs Ivory Coast", style4 = "Estadio Castelao", style5 = "0 - 1" });
                formats.Add(new FIFAScheduleData() { name = "WEDNESDAY, JUNE 25, 2014", style1 = "16=00 GMT", style2 = "Group F", style3 = "Nigeria vs Argentina", style4 = "Estadio Beira-Rio", style5 = "0 - 0" });
                formats.Add(new FIFAScheduleData() { name = "WEDNESDAY, JUNE 25, 2014", style1 = "16=00 GMT", style2 = "Group F", style3 = "Bosnia vs Iran", style4 = "Arena Fonte", style5 = "0 - 3" });
                formats.Add(new FIFAScheduleData() { name = "WEDNESDAY, JUNE 25, 2014", style1 = "20=00 GMT", style2 = "Group E", style3 = "Honduras vs Switzerland", style4 = "Arena Amazonia", style5 = "3 - 1" });
                formats.Add(new FIFAScheduleData() { name = "WEDNESDAY, JUNE 25, 2014", style1 = "20=00 GMT", style2 = "Group E", style3 = "Ecuador vs France", style4 = "Estadio Maracana", style5 = "2 - 3" });
                formats.Add(new FIFAScheduleData() { name = "THURSDAY, JUNE 26, 2014", style1 = "16=00 GMT", style2 = "Group G", style3 = "United States vs Germany", style4 = "Arena Pernambuc", style5 = "2 - 1" });
                formats.Add(new FIFAScheduleData() { name = "THURSDAY, JUNE 26, 2014", style1 = "16=00 GMT", style2 = "Group G", style3 = "Portugal vs Ghana", style4 = "Estadio Nacional de Brasilia", style5 = "0 - 1" });
                formats.Add(new FIFAScheduleData() { name = "THURSDAY, JUNE 26, 2014", style1 = "20=00 GMT", style2 = "Group H", style3 = "South Korea vs Belgium", style4 = "Arena Corinthians", style5 = "1 - 1" });
                formats.Add(new FIFAScheduleData() { name = "THURSDAY, JUNE 26, 2014", style1 = "20=00 GMT", style2 = "Group H", style3 = "Algeria vs Russia", style4 = "Arena da Baixada", style5 = "0 - 1" });
                formats.Add(new FIFAScheduleData() { name = "SATURDAY, JUNE 28, 2014", style1 = "16=00 GMT", style2 = "", style3 = "Brazil vs Chile", style4 = "Estadio Mineirao", style5 = "1(3) - 1(2)" });
                formats.Add(new FIFAScheduleData() { name = "SATURDAY, JUNE 28, 2014", style1 = "20=00 GMT", style2 = "", style3 = "Colombia vs Uruguay", style4 = "Estadio do Maracana", style5 = "2 - 0" });
                formats.Add(new FIFAScheduleData() { name = "SUNDAY, JUNE 29, 2014", style1 = "16=00 GMT", style2 = "", style3 = "Netherlands vs Mexico", style4 = "Estadio Castelao", style5 = "2 - 1" });
                formats.Add(new FIFAScheduleData() { name = "SUNDAY, JUNE 29, 2014", style1 = "20=00 GMT", style2 = "", style3 = "Costa Rica vs Greece", style4 = "Arena Pernambuco", style5 = "1(5) - 1(3)" });
                formats.Add(new FIFAScheduleData() { name = "MONDAY, JUNE 30, 2014", style1 = "16=00 GMT", style2 = "", style3 = "France vs Nigeria", style4 = "Nacional", style5 = "2 - 0" });
                formats.Add(new FIFAScheduleData() { name = "MONDAY, JUNE 30, 2014", style1 = "20=00 GMT", style2 = "", style3 = "Germany vs Algeria", style4 = "Estadio Beira-Rio", style5 = "2 - 1" });
                formats.Add(new FIFAScheduleData() { name = "TUESDAY, JULY 1, 2014", style1 = "16=00 GMT", style2 = "", style3 = "Argentina vs Switzerland", style4 = "Arena Corinthians", style5 = "1 - 0" });
                formats.Add(new FIFAScheduleData() { name = "TUESDAY, JULY 1, 2014", style1 = "20=00 GMT", style2 = "", style3 = "Belgium vs United States", style4 = "Arena Fonte Nova", style5 = "2 - 1" });
                formats.Add(new FIFAScheduleData() { name = "FRIDAY, JULY 4, 2014", style1 = "16=00 GMT", style2 = "", style3 = "France vs Germany", style4 = "Estadio dos Maracana", style5 = "0 - 1" });
                formats.Add(new FIFAScheduleData() { name = "FRIDAY, JULY 4, 2014", style1 = "20=00 GMT", style2 = "", style3 = "Brazil vs Colombia", style4 = "Estadio Castelao", style5 = "2 - 1" });
                formats.Add(new FIFAScheduleData() { name = "SATURDAY, JULY 5, 2014", style1 = "16=00 GMT", style2 = "", style3 = "Argentina vs Belgium", style4 = "Nacional", style5 = "1 - 0" });
                formats.Add(new FIFAScheduleData() { name = "SATURDAY, JULY 5, 2014", style1 = "20=00 GMT", style2 = "", style3 = "Netherlands vs Costa Rica", style4 = "Arena Fonte Nova", style5 = "0(4) - 0(3)" });
                formats.Add(new FIFAScheduleData() { name = "TUESDAY, JULY 8, 2014", style1 = "20=00 GMT", style2 = "", style3 = "Brazil vs Germany", style4 = "Estadio Mineirao", style5 = "1 - 7" });
                formats.Add(new FIFAScheduleData() { name = "WEDNESDAY, JULY 9, 2014", style1 = "20=00 GMT", style2 = "", style3 = "Netherlands vs Argentina", style4 = "Arena Corinthians", style5 = "0(2) - 0(4)" });
                formats.Add(new FIFAScheduleData() { name = "SATURDAY, JULY 12, 2014", style1 = "20=00 GMT", style2 = "", style3 = "Brazil vs Netherlands", style4 = "Nacional", style5 = "0 - 3" });
                formats.Add(new FIFAScheduleData() { name = "SUNDAY, JULY 13, 2014", style1 = "19=00 GMT", style2 = "", style3 = "Germany vs Argentina", style4 = "Estadio do Maracana", style5 = "1 - 0" });

                return formats;
            }
        }
        private List<FIFATopScoreData> GetFIFTopScorers
        {
            get
            {
                List<FIFATopScoreData> formats = new List<FIFATopScoreData>();

                formats.Add(new FIFATopScoreData() { name = "Rank", style1 = "Player", style2 = "Goals", style3 = "Team", style4 = "Assists", style5 = "Minutes" });
                formats.Add(new FIFATopScoreData() { name = "1", style1 = "James Rodriguez", style2 = "6", style3 = "Colambia", style4 = "2", style5 = "67" });
                formats.Add(new FIFATopScoreData() { name = "2", style1 = "Thomas Muller", style2 = "5", style3 = "Germany", style4 = "3", style5 = "136" });
                formats.Add(new FIFATopScoreData() { name = "3", style1 = "Neymar", style2 = "4", style3 = "Brazil", style4 = "1", style5 = "114" });
                formats.Add(new FIFATopScoreData() { name = "4", style1 = "Lionel Messi", style2 = "4", style3 = "Argentina", style4 = "1", style5 = "173" });
                formats.Add(new FIFATopScoreData() { name = "5", style1 = "Robin van Persie", style2 = "4", style3 = "Netherlands", style4 = "0", style5 = "137" });
                formats.Add(new FIFATopScoreData() { name = "6", style1 = "Karim Benzema", style2 = "3", style3 = "France", style4 = "2", style5 = "150" });
                formats.Add(new FIFATopScoreData() { name = "7", style1 = "Andre Schurrle", style2 = "3", style3 = "Germany", style4 = "1", style5 = "81" });
                formats.Add(new FIFATopScoreData() { name = "8", style1 = "Arjen Robben", style2 = "3", style3 = "Netherlands", style4 = "1", style5 = "230" });
                formats.Add(new FIFATopScoreData() { name = "9", style1 = "Enner Valencia", style2 = "3", style3 = "Ecuador", style4 = "0", style5 = "90" });
                formats.Add(new FIFATopScoreData() { name = "10", style1 = "Xherdan Shaqiri", style2 = "3", style3 = "Switzerland", style4 = "0", style5 = "129" });
                formats.Add(new FIFATopScoreData() { name = "11", style1 = "Toni Kroos", style2 = "2", style3 = "Germany", style4 = "3", style5 = "345" });
                formats.Add(new FIFATopScoreData() { name = "12", style1 = "Oscar", style2 = "2", style3 = "Brazil", style4 = "2", style5 = "320" });
                formats.Add(new FIFATopScoreData() { name = "13", style1 = "Abdelmoumene", style2 = "2", style3 = "Algeria", style4 = "1", style5 = "85" });
                formats.Add(new FIFATopScoreData() { name = "14", style1 = "Memphis Depay", style2 = "2", style3 = "Netherlands", style4 = "1", style5 = "88" });
                formats.Add(new FIFATopScoreData() { name = "15", style1 = "Ivan Perisic", style2 = "2", style3 = "Croatia", style4 = "1", style5 = "129" });

                return formats;
            }
        }
        public List<object> GetFIFADetails
        {
            get
            {
                return new List<object>() { this.GetFIFSchedule, this.GetFIFTopScorers, this.GetFIFMom, this.GetFIFTeamPlaces };
            }
        }
    }
}