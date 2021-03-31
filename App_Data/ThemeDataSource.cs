#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using System.Collections.Generic;

namespace WebSampleBrowser
{
    internal class ThemeDataSource
    {
        public ThemeDataSource()
        {

        }

        public class menuFields
        {
            public string id { get; set; }
            public int? parentId { get; set; }
            public string text { get; set; }
            public string sprite { get; set; }

        }
        public List<menuFields> getThemeData()
        {
            List<menuFields> sites = new List<menuFields>();
            sites.Add(new menuFields { id = "1", parentId = null, sprite = "e-icon" });
            //first level child
            sites.Add(new menuFields { id = "flatazure", parentId = 1, text = "Flat-Azure", sprite = "SB-theme SB-flat-azure" });
            sites.Add(new menuFields { id = "flatazuredark", parentId = 1, text = "Flat-Azure-Dark", sprite = "SB-theme SB-flat-azure-dark" });
            sites.Add(new menuFields { id = "flatlime", parentId = 1, text = "Flat-Lime", sprite = "SB-theme SB-flat-lime" });
            sites.Add(new menuFields { id = "flatlimedark", parentId = 1, text = "Flat-Lime-Dark", sprite = "SB-theme SB-flat-lime-dark" });
            sites.Add(new menuFields { id = "flatsaffron", parentId = 1, text = "Flat-Saffron", sprite = "SB-theme SB-flat-saffron" });
            sites.Add(new menuFields { id = "flatsaffrondark", parentId = 1, text = "Flat-Saffron-Dark", sprite = "SB-theme SB-flat-saffron-dark" });
            sites.Add(new menuFields { id = "gradientazure", parentId = 1, text = "Gradient-Azure", sprite = "SB-theme SB-gradient-azure" });
            sites.Add(new menuFields { id = "gradientazuredark", parentId = 1, text = "Gradient-Azure-Dark", sprite = "SB-theme SB-gradient-azure-dark" });
            sites.Add(new menuFields { id = "gradientlime", parentId = 1, text = "Gradient-Lime", sprite = "SB-theme SB-gradient-lime" });
            sites.Add(new menuFields { id = "gradientlimedark", parentId = 1, text = "Gradient-Lime-Dark", sprite = "SB-theme SB-gradient-lime-dark" });
            sites.Add(new menuFields { id = "gradientsaffron", parentId = 1, text = "Gradient-Saffron", sprite = "SB-theme SB-gradient-saffron" });
            sites.Add(new menuFields { id = "gradientsaffrondark", parentId = 1, text = "Gradient-Saffron-Dark", sprite = "SB-theme SB-gradient-saffron-dark" });
            sites.Add(new menuFields { id = "flatbootstrap", parentId = 1, text = "Bootstrap", sprite = "SB-theme SB-bootstrap" });
            sites.Add(new menuFields { id = "highcontrast01", parentId = 1, text = "High-Contrast-01", sprite = "SB-theme SB-high-contrast-01" });
            sites.Add(new menuFields { id = "highcontrast02", parentId = 1, text = "High-Contrast-02", sprite = "SB-theme SB-high-contrast-02" });
            sites.Add(new menuFields { id = "material", parentId = 1, text = "Material", sprite = "SB-theme SB-material" });
            sites.Add(new menuFields { id = "office365", parentId = 1, text = "Office-365", sprite = "SB-theme SB-office-365" });
            return sites;
        }
    }
}