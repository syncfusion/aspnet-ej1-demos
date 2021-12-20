#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using Syncfusion.JavaScript.DataVisualization.DiagramEnums;
using Syncfusion.JavaScript.DataVisualization.Models;
using Syncfusion.JavaScript.DataVisualization.Models.Collections;
using Syncfusion.JavaScript.DataVisualization.Models.Diagram;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace WebSampleBrowser.Diagram
{
    public partial class Overview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CreateNode(24, 23, 20, "../Content/images/overviewcontrol/cards_05.png");
            CreateNode(555, 48, 41, "../Content/images/overviewcontrol/cards_03.png");
            CreateNode(461, 174, -64, "../Content/images/overviewcontrol/cards_07.png");
            CreateNode(455, 634, 0, "../Content/images/overviewcontrol/cards_09.png");
            CreateNode(81, 583, 0, "../Content/images/overviewcontrol/cards_11.png");
            CreateNode(861, 449, -24, "../Content/images/overviewcontrol/cards_14.png");
            CreateNode(34, 417, 20, "../Content/images/overviewcontrol/cards_16.png");
            CreateNode(674, 418, 37, "../Content/images/overviewcontrol/cards_18.png");
            CreateNode(1181, 921, -75, "../Content/images/overviewcontrol/cards_23.png");
            CreateNode(159, 125, -9, "../Content/images/overviewcontrol/cards_25.png");
            CreateNode(776, 249, 0, "../Content/images/overviewcontrol/cards_100.png");
            CreateNode(776, 27, 0, "../Content/images/overviewcontrol/cards_101.png");
            CreateNode(634, 149, -79, "../Content/images/overviewcontrol/cards_102.png");
            CreateNode(287, 159, 0, "../Content/images/overviewcontrol/cards_103.png");
            CreateNode(223, 584, -20, "../Content/images/overviewcontrol/cards_104.png");
            CreateNode(294, 8, -52, "../Content/images/overviewcontrol/cards_105.png");
            CreateNode(388, 296, 59, "../Content/images/overviewcontrol/cards_106.png");
            CreateNode(102, 267, 0, "../Content/images/overviewcontrol/cards_107.png");
            CreateNode(380, 452, 0, "../Content/images/overviewcontrol/cards_108.png");
            CreateNode(683, 550, 31, "../Content/images/overviewcontrol/cards_109.png");
            CreateNode(1038, 567, 20, "../Content/images/overviewcontrol/cards_05.png");
            CreateNode(849, 115, 41, "../Content/images/overviewcontrol/cards_03.png"); ;
            CreateNode(1165, 144, -64, "../Content/images/overviewcontrol/cards_07.png"); ;
            CreateNode(497, 815, 0, "../Content/images/overviewcontrol/cards_09.png"); ;
            CreateNode(993, 480, 0, "../Content/images/overviewcontrol/cards_100.png");
            CreateNode(1240, 582, -38, "../Content/images/overviewcontrol/cards_101.png");
            CreateNode(941, 249, 0, "../Content/images/overviewcontrol/cards_102.png");
            CreateNode(674, 921, -41, "../Content/images/overviewcontrol/cards_104.png");
            CreateNode(296, 816, -20, "../Content/images/overviewcontrol/cards_104.png");
            CreateNode(1025, 45, -52, "../Content/images/overviewcontrol/cards_105.png");
            CreateNode(962, 943, 59, "../Content/images/overviewcontrol/cards_106.png");
            CreateNode(1093, 409, -42, "../Content/images/overviewcontrol/cards_107.png");
            CreateNode(445, 939, 33, "../Content/images/overviewcontrol/cards_108.png");
            CreateNode(756, 783, 31, "../Content/images/overviewcontrol/cards_109.png");
            CreateNode(15, 1047, 0, "../Content/images/overviewcontrol/cards_05.png");
            CreateNode(1072, 102, 41, "../Content/images/overviewcontrol/cards_03.png");
            CreateNode(417, 1198, -64, "../Content/images/overviewcontrol/cards_07.png");
            CreateNode(1148, 815, 0, "../Content/images/overviewcontrol/cards_09.png");
            CreateNode(1322, 310, -34, "../Content/images/overviewcontrol/cards_11.png");
            CreateNode(833, 1442, -36, "../Content/images/overviewcontrol/cards_14.png");
            CreateNode(25, 1441, 31, "../Content/images/overviewcontrol/cards_16.png");
            CreateNode(630, 1442, 0, "../Content/images/overviewcontrol/cards_18.png");
            CreateNode(1454, 102, 37, "../Content/images/overviewcontrol/cards_20.png");
            CreateNode(1253, 1306, -75, "../Content/images/overviewcontrol/cards_23.png");
            CreateNode(115, 1148, -9, "../Content/images/overviewcontrol/cards_25.png");
            CreateNode(993, 480, 0, "../Content/images/overviewcontrol/cards_11.png");
            CreateNode(115, 815, -24, "../Content/images/overviewcontrol/cards_14.png");
            CreateNode(913, 676, 31, "../Content/images/overviewcontrol/cards_16.png");
            CreateNode(1216, 310, 0, "../Content/images/overviewcontrol/cards_18.png");
            CreateNode(590, 614, -16, "../Content/images/overviewcontrol/cards_20.png");
            CreateNode(285, 685, -75, "../Content/images/overviewcontrol/cards_23.png");
            CreateNode(232, 357, -9, "../Content/images/overviewcontrol/cards_25.png");
            CreateNode(733, 1273, 0, "../Content/images/overviewcontrol/cards_100.png");
            CreateNode(733, 1051, 0, "../Content/images/overviewcontrol/cards_101.png");
            CreateNode(590, 1273, -79, "../Content/images/overviewcontrol/cards_102.png");
            CreateNode(244, 1212, 0, "../Content/images/overviewcontrol/cards_103.png");
            CreateNode(1547, 9, -20, "../Content/images/overviewcontrol/cards_104.png");
            CreateNode(251, 1031, -52, "../Content/images/overviewcontrol/cards_105.png");
            CreateNode(344, 1320, 59, "../Content/images/overviewcontrol/cards_106.png");
            CreateNode(58, 1291, 0, "../Content/images/overviewcontrol/cards_107.png");
            CreateNode(287, 1442, 0, "../Content/images/overviewcontrol/cards_108.png");
            CreateNode(1499, 733, 31, "../Content/images/overviewcontrol/cards_109.png");
            CreateNode(1566, 726, 20, "../Content/images/overviewcontrol/cards_05.png");
            CreateNode(805, 1138, 41, "../Content/images/overviewcontrol/cards_03.png");
            CreateNode(1122, 1168, -64, "../Content/images/overviewcontrol/cards_07.png");
            CreateNode(1216, 0, 0, "../Content/images/overviewcontrol/cards_09.png");
            CreateNode(1326, 534, 0, "../Content/images/overviewcontrol/cards_11.png");
            CreateNode(1514, 930, -24, "../Content/images/overviewcontrol/cards_14.png");
            CreateNode(1622, 473, 31, "../Content/images/overviewcontrol/cards_16.png");
            CreateNode(1498, 1124, 0, "../Content/images/overviewcontrol/cards_18.png");
            CreateNode(1668, 228, 0, "../Content/images/overviewcontrol/cards_20.png");
            DiagramWebControl1.Model.Width = "700px";
            DiagramWebControl1.Model.Height = "400px";
            DiagramWebControl1.Model.SnapSettings.SnapConstraints = SnapConstraints.None;
            DiagramWebControl1.Model.EnableContextMenu = false;
        }
        private void CreateNode(double offsetx, double offsety, double angle, string src)
        {
            ImageNode node = new ImageNode();
            node.Name = "node" + DiagramWebControl1.Model.Nodes.Count.ToString();
            node.Width = 102;
            node.Height = 142;
            node.OffsetX = offsetx + 51;
            node.OffsetY = offsety + 71;
            node.BorderColor = "none";
            node.RotateAngle = angle;
            node.Source = src;
            DiagramWebControl1.Model.Nodes.Add(node);
        }
    }
}