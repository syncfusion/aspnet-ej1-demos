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

    public class MovieData
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
        public static List<MovieData> GetMovieDetails
        {
            get
            {
                List<MovieData> formats = new List<MovieData>();

                formats.Add(new MovieData() { format1 = "No", format2 = "YEAR", format3 = "TITLE", format4 = "REVIEW", format5 = "STARRING ACTORS", format6 = "DIRECTOR", format7 = "GENRE", format8 = "RATING", format9 = "FORMAT", format10 = "COMMENTS" });
                formats.Add(new MovieData() { format1 = "1", format2 = "1994", format3 = "Forrest Gump", format4 = "5 Stars", format5 = "Tom Hanks, Robin Wright, Gary Sinise", format6 = "Robert Zemeckis", format7 = "Drama", format8 = "PG-13", format9 = "DVD", format10 = "Based on the 1986 novel of the same name by Winston Groom" });
                formats.Add(new MovieData() { format1 = "2", format2 = "1946", format3 = "It’s a Wonderful Life", format4 = "2 Stars", format5 = "James Stewart, Donna Reed, Lionel Barrymore ", format6 = "Frank Capra", format7 = "Drama", format8 = "G", format9 = "VHS", format10 = "Colorized version" });
                formats.Add(new MovieData() { format1 = "3", format2 = "1988", format3 = "Big", format4 = "4 Stars", format5 = "Tom Hanks, Elizabeth Perkins, Robert Loggia ", format6 = "Penny Marshall", format7 = "Comedy", format8 = "PG", format9 = "DVD", format10 = "" });
                formats.Add(new MovieData() { format1 = "4", format2 = "1954", format3 = "Rear Window", format4 = "3 Stars", format5 = "James Stewart, Grace Kelly, Wendell Corey ", format6 = "Alfred Hitchcock", format7 = "Suspense", format8 = "PG", format9 = "Blu-ray", format10 = "" });

                return formats;
            }
        }
    }
}