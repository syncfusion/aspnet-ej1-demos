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
    public partial class FlowDiagram : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                createSymbolPalette();
                GenerateFlowShapes();                
                GenerateConnectors();
                GenerateDiagram();
            }
        }

        public void createSymbolPalette()
        {
            symbolpalette.Height = "100%";
            symbolpalette.Width = "100%";
            symbolpalette.PaletteItemHeight = 51;
            symbolpalette.PaletteItemWidth = 51;
            symbolpalette.PreviewHeight = 100;
            symbolpalette.PreviewWidth = 100;
            symbolpalette.SelectedPaletteName = "Flow Shapes";
            symbolpalette.ShowPaletteItemText = false;
            symbolpalette.DiagramId = "DiagramContent";
        }
        public void GenerateFlowShapes()
        {
            Palette flowShapes = new Palette("Flow Shapes");
            flowShapes.Expanded = true;
            var random = new Random();
            flowShapes.AppendChild(new FlowShape()
            {
                Name = "Start",
                Width = 60,
                Height = 30,
                OffsetX = 30,
                OffsetY = 15,
                Type = Shapes.Flow,
                Shape = FlowShapes.Terminator,
                Ports = new Collection(){
                   new Port() { Name= "Start"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 0.5f} },
                   new Port() { Name= "Start"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0.5f} },
                   new Port() { Name= "Start"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 0} },
                   new Port() { Name= "Start"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0.5f} },
                   new Port() { Name= "Start"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 1 } }
                       }
            });
            flowShapes.AppendChild(new FlowShape()
            {
                Name = "process",
                Width = 40,
                Height = 20,
                OffsetX = 20,
                OffsetY = 20,
                Type = Shapes.Flow,
                Shape = FlowShapes.Process,
                Ports = new Collection(){ 
                           new Port(){ Name= "process"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0.5f} }, 
                           new Port(){Name= "process"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0.3f} }, 
                           new Port(){Name= "Rectangle" + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0.7f} },
                           new Port() { Name= "process"  + random.Next(100), Offset = new DiagramPoint() { Y= 0, X= 0.5f} }, new Port(){Name= "process"  + random.Next(100), Offset = new DiagramPoint() { Y= 0, X= 0.3f} }, new Port(){Name= "Rectangle"  + random.Next(100), Offset = new DiagramPoint() { Y= 0, X= 0.7f} },
                           new Port() { Name= "process"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0.5f} }, new Port(){Name= "process"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0.3f} }, new Port(){Name= "Rectangle"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0.7f} },
                           new Port() { Name= "process"  + random.Next(100), Offset = new DiagramPoint() { Y= 1, X= 0.5f} }, new Port(){Name= "process"  + random.Next(100), Offset = new DiagramPoint() { Y= 1, X= 0.3f} }, 
                           new Port(){Name= "Rectangle"  + random.Next(100), Offset = new DiagramPoint() { Y= 1, X= 0.7f } }}
            });
            flowShapes.AppendChild(new FlowShape()
            {
                Name = "Decision",
                Width = 40,
                Height = 35,
                OffsetX = 20,
                OffsetY = 20,
                Type = Shapes.Flow,
                Shape = FlowShapes.Decision,
                Ports = new Collection(){ new Port(){ Name= "Decision"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0.5f} },
                           new Port() { Name= "Decision"  + random.Next(100), Offset = new DiagramPoint() { Y= 0, X= 0.5f} },
                           new Port() { Name= "Decision"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0.5f} },
                           new Port() { Name= "Decision"  + random.Next(100), Offset = new DiagramPoint() { Y= 1, X= 0.5f } }}
            });
            flowShapes.AppendChild(new FlowShape()
            {
                Name = "Sort",
                Width = 40,
                Height = 40,
                OffsetX = 20,
                OffsetY = 20,
                Type = Shapes.Flow,
                Shape = FlowShapes.Sort,
                Ports = new Collection(){
                           new Port() { Name= "Sort"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 0} },
                           new Port() { Name= "Sort"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0.5f} },
                           new Port() { Name= "Sort"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 1} },
                           new Port() { Name= "Sort"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0.5f} }
                       }
            });
            flowShapes.AppendChild(new FlowShape()
            {
                Name = "Document",
                Width = 40,
                Height = 30,
                OffsetX = 20,
                OffsetY = 15,
                Type = Shapes.Flow,
                Shape = FlowShapes.Document,
                Ports = new Collection(){ new Port(){ Name= "Document"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0} },
                           new Port() { Name= "Document"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 0} },
                           new Port() { Name= "Document"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0} },
                           new Port() { Name= "Document"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0.5f} },
                           new Port() { Name= "Document"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 1} },
                           new Port() { Name= "Document"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 1} },
                           new Port() { Name= "Document"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 1} },
                           new Port() { Name= "Document"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0.5f } }}
            });
            flowShapes.AppendChild(new FlowShape()
            {
                Name = "MultiDocument",
                Width = 40,
                Height = 30,
                OffsetX = 20,
                OffsetY = 15,
                Type = Shapes.Flow,
                Shape = FlowShapes.MultiDocument,
                Ports = new Collection(){
                          new Port() { Name= "MultiDocument"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0.5f} },
                           new Port() { Name= "MultiDocument"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0} },
                           new Port() { Name= "MultiDocument"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 0} },
                           new Port() { Name= "MultiDocument"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0} },
                           new Port() { Name= "MultiDocument"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0.5f} },
                           new Port() { Name= "MultiDocument"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 1} },
                           new Port() { Name= "MultiDocument"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 1} },
                           new Port() { Name= "MultiDocument"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 1 } }}
            });
            flowShapes.AppendChild(new FlowShape()
            {
                Name = "DirectData",
                Width = 40,
                Height = 30,
                OffsetX = 20,
                OffsetY = 15,
                Type = Shapes.Flow,
                Shape = FlowShapes.DirectData,
                Ports = new Collection(){
                           new Port() { Name= "DirectData"  + random.Next(100), Offset = new DiagramPoint() {X= 0.1f,Y= 0} },
                           new Port() { Name= "DirectData"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 0} },
                           new Port() { Name= "DirectData"  + random.Next(100), Offset = new DiagramPoint() {X= 0.9f,Y= 0} },
                           new Port() { Name= "DirectData"  + random.Next(100), Offset = new DiagramPoint() {X= 0.9f,Y= 1} },
                           new Port() { Name= "DirectData"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 1} },
                           new Port() { Name= "DirectData"  + random.Next(100), Offset = new DiagramPoint() {X= 0.1f,Y= 1} },
                           new Port() { Name= "DirectData"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0.5f} },
                           new Port() { Name= "DirectData"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0.5f} },
                       }
            });
            flowShapes.AppendChild(new FlowShape()
            {
                Name = "SequentialData",
                Width = 40,
                Height = 40,
                OffsetX = 20,
                OffsetY = 20,
                Type = Shapes.Flow,
                Shape = FlowShapes.SequentialData,
                Ports = new Collection(){
                           new Port() { Name= "SequentialData"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 0} },
                           new Port() { Name= "SequentialData"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0.5f} },
                           new Port() { Name= "SequentialData"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 1} },
                           new Port() { Name= "SequentialData"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0.5f} },
                           new Port() { Name= "SequentialData"  + random.Next(100), Offset = new DiagramPoint() {X= 0.152f,Y= 0.15f} },
                           new Port() { Name= "SequentialData"  + random.Next(100), Offset = new DiagramPoint() {X= 0.815f,Y= 0.15f} },
                           new Port() { Name= "SequentialData"  + random.Next(100), Offset = new DiagramPoint() {X= 0.815f,Y= 0.85f} },
                           new Port() { Name= "SequentialData"  + random.Next(100), Offset = new DiagramPoint() {X= 0.152f,Y= 0.85f} },
                           new Port() { Name= "SequentialData"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 1} }
                       }
            });

            flowShapes.AppendChild(new FlowShape()
            {
                Name = "PaperTap",
                Width = 40,
                Height = 30,
                OffsetX = 20,
                OffsetY = 15,
                Type = Shapes.Flow,
                Shape = FlowShapes.PaperTap,
                Ports = new Collection(){
                            new Port() { Name= "PaperTap"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0.5f} },
                       			new Port(){Name  = "PaperTap"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 0.1f} },
                       			new Port(){Name  = "PaperTap"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0.1f} },
                       			new Port(){Name  = "PaperTap"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0.5f} },
                       			new Port(){Name  = "PaperTap"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0.9f} },
                       			new Port(){Name  = "PaperTap"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 0.9f} },
                       			new Port(){Name  = "PaperTap"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0.9f} },
                       			new Port(){Name  = "PaperTap"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0.1f} }
                       }
            });

            flowShapes.AppendChild(new FlowShape()
            {
                Name = "Collate",
                Width = 40,
                Height = 40,
                OffsetX = 20,
                OffsetY = 20,
                Type = Shapes.Flow,
                Shape = FlowShapes.Collate,
                Ports = new Collection(){
                           new Port() { Name= "Collate"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0} },
                           new Port() { Name= "Collate"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 0} },
                           new Port() { Name= "Collate"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0} },
                           new Port() { Name= "Collate"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 1} },
                           new Port() { Name= "Collate"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 1} },
                           new Port() { Name= "Collate"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 1 } }}
            });
            flowShapes.AppendChild(new FlowShape()
            {
                Name = "Summing_Junction",
                Width = 40,
                Height = 40,
                OffsetX = 20,
                OffsetY = 20,
                Type = Shapes.Flow,
                Shape = FlowShapes.SummingJunction,
                Ports = new Collection(){
                       new Port() { Name= "Summing Junction"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 0} },
                       new Port() { Name= "Summing Junction"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0.5f} },
                       new Port() { Name= "Summing Junction"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 1} },
                       new Port() { Name= "Summing Junction"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0.5f} },
                       new Port() { Name= "Summing Junction"  + random.Next(100), Offset = new DiagramPoint() {X= 0.152f,Y= 0.15f} },
                       new Port() { Name= "Summing Junction"  + random.Next(100), Offset = new DiagramPoint() {X= 0.852f,Y= 0.15f} },
                       new Port() { Name= "Summing Junction"  + random.Next(100), Offset = new DiagramPoint() {X= 0.852f,Y= 0.85f} },
                       new Port() { Name= "Summing Junction"  + random.Next(100), Offset = new DiagramPoint() {X= 0.152f,Y= 0.85f } }

                       }
            });
            flowShapes.AppendChild(new FlowShape()
            {
                Name = "Or",
                Width = 40,
                Height = 40,
                OffsetX = 20,
                OffsetY = 20,
                Type = Shapes.Flow,
                Shape = FlowShapes.Or,
                Ports = new Collection(){
                           new Port() { Name= "Or"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 0} },
                           new Port() { Name= "Or"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0.5f} },
                           new Port() { Name= "Or"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 1} },
                           new Port() { Name= "Or"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0.5f} },
                           new Port() { Name= "Or"  + random.Next(100), Offset = new DiagramPoint() {X= 0.152f,Y= 0.15f} },
                           new Port() { Name= "Or"  + random.Next(100), Offset = new DiagramPoint() {X= 0.852f,Y= 0.15f} },
                           new Port() { Name= "Or"  + random.Next(100), Offset = new DiagramPoint() {X= 0.852f,Y= 0.85f} },
                           new Port() { Name= "Or"  + random.Next(100), Offset = new DiagramPoint() {X= 0.152f,Y= 0.85f } }
                       }
            });
            flowShapes.AppendChild(new FlowShape()
            {
                Name = "InternalStorage",
                Width = 40,
                Height = 40,
                OffsetX = 20,
                OffsetY = 20,     
                Type = Shapes.Flow,
                Shape = FlowShapes.InternalStorage,
                Ports = new Collection(){
                       			new Port() { Name= "InternalStorage"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0} },
                            new Port() { Name= "InternalStorage"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 0} },
                            new Port() { Name= "InternalStorage"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0} },
                            new Port() { Name= "InternalStorage"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0.5f} },
                            new Port() { Name= "InternalStorage"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 1} },
                            new Port() { Name= "InternalStorage"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 1} },
                            new Port() { Name= "InternalStorage"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 1} },
                            new Port() { Name= "InternalStorage"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0.5f} }
                       }
            });
            flowShapes.AppendChild(new FlowShape()
            {
                Name = "PredefinedProcess",
                Width = 40,
                Height = 40,
                OffsetX = 20,
                OffsetY = 20,
                Type = Shapes.Flow,
                Shape = FlowShapes.PreDefinedProcess,
                Ports = new Collection(){
                       			new Port(){ Name= "PredefinedProcess"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0} },
                            new Port() { Name= "PredefinedProcess"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 0} },
                            new Port() { Name= "PredefinedProcess"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0} },
                            new Port() { Name= "PredefinedProcess"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0.5f} },
                            new Port() { Name= "PredefinedProcess"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 1} },
                            new Port() { Name= "PredefinedProcess"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 1} },
                            new Port() { Name= "PredefinedProcess"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 1} },
                            new Port() { Name= "PredefinedProcess"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0.5f } }
                       }
            });
            flowShapes.AppendChild(new FlowShape()
            {
                Name = "Extract",
                Width = 40,
                Height = 40,
                OffsetX = 20,
                OffsetY = 20,
                Type = Shapes.Flow,
                Shape = FlowShapes.Extract,
                Ports = new Collection(){
                           new Port() { Name= "Extract"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 0} },
                           new Port() { Name= "Extract"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 1} },
                           new Port() { Name= "Extract"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 1} },
                           new Port() { Name= "Extract"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 1 } }
                       }
            });
            flowShapes.AppendChild(new FlowShape()
            {
                Name = "Merge",
                Width = 40,
                Height = 40,
                OffsetX = 20,
                OffsetY = 20,
                Type = Shapes.Flow,
                Shape = FlowShapes.Merge,
                Ports = new Collection(){
                            new Port() { Name= "Merge"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0} },
                            new Port() { Name= "Merge"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 1} },
                            new Port() { Name= "Merge"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 0} },
                            new Port() { Name= "Merge"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0 } }
                       }
            });
            flowShapes.AppendChild(new FlowShape()
            {
                Name = "Off_Page_Reference",
                Width = 40,
                Height = 40,
                OffsetX = 20,
                OffsetY = 20,   
                Type = Shapes.Flow,
                Shape = FlowShapes.OffPageReference,
                Ports = new Collection(){
                            new Port() { Name= "Off Page Reference"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0} },
                            new Port() { Name= "Off Page Reference"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 1} },
                            new Port() { Name= "Off Page Reference"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0.5f} },
                            new Port() { Name= "Off Page Reference"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 0} },
                            new Port() { Name= "Off Page Reference"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0} },
                            new Port() { Name= "Off Page Reference"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0.5f } }
                       }
            });
            flowShapes.AppendChild(new FlowShape()
            {
                Name = "Sequential_Access_Storage",
                Width = 40,
                Height = 40,
                OffsetX = 20,
                OffsetY = 20,
                Type = Shapes.Flow,
                Shape = FlowShapes.SequentialAccessStorage,
                Ports = new Collection(){
                   new Port() { Name= "Sequential Access Storage"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 0} },
                   new Port() { Name= "Sequential Access Storage"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 1} },
                   new Port() { Name= "Sequential Access Storage"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0.5f} },
                   new Port() { Name= "Sequential Access Storage"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0.5f} },
                   new Port() { Name= "Sequential Access Storage"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 1 } }
                       }
            });
            flowShapes.AppendChild(new FlowShape()
            {
                Name = "ManualOperation",
                Width = 40,
                Height = 40,
                OffsetX = 20,
                OffsetY = 20,
                Type = Shapes.Flow,
                Shape = FlowShapes.ManualOperation,
                Ports = new Collection(){
                           new Port() { Name= "ManualOperation"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0} },
                           new Port() { Name= "ManualOperation"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 1} },
                           new Port() { Name= "ManualOperation"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 0} },
                           new Port() { Name= "ManualOperation"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0 } }
                       }
            });
            flowShapes.AppendChild(new FlowShape()
            {
                Name = "Annotation1",
                Width = 40,
                Height = 40,
                OffsetX = 20,
                OffsetY = 20,
                Type = Shapes.Flow,
                Shape = FlowShapes.Annotation1,
                Ports = new Collection(){ new Port(){ Name= "Annotation1"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0.5f} },
                           new Port() { Name= "Annotation1"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0} },
                           new Port() { Name= "Annotation1"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 0} },
                           new Port() { Name= "Annotation1"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0} },
                           new Port() { Name= "Annotation1"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0.5f} },
                           new Port() { Name= "Annotation1"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 1} },
                           new Port() { Name= "Annotation1"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 1} },
                           new Port() { Name= "Annotation1"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 1 } } }
            });
            flowShapes.AppendChild(new FlowShape()
            {
                Name = "Annotation2",
                Width = 40,
                Height = 40,
                OffsetX = 20,
                OffsetY = 20,
                Type = Shapes.Flow,
                Shape = FlowShapes.Annotation2,
                Ports = new Collection(){
                           new Port() { Name= "Annotation2"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0.5f} },
                           new Port() { Name= "Annotation2"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 0} },
                           new Port() { Name= "Annotation2"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0} },
                           new Port() { Name= "Annotation2"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0.5f} },
                           new Port() { Name= "Annotation2"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 1} },
                           new Port() { Name= "Annotation2"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 1 } } }
            });
            flowShapes.AppendChild(new FlowShape()
            {
                Name = "Data",
                Width = 40,
                Height = 40,
                OffsetX = 20,
                OffsetY = 20,                                
                Type = Shapes.Flow,
                Shape = FlowShapes.Data,
                Ports = new Collection(){
                   new Port() { Name= "Data"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0.5f} },
                   new Port() { Name= "Data"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 0} },
                   new Port() { Name= "Data"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0.5f} },
                   new Port() { Name= "Data"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 1 } }
                }
            });
            flowShapes.AppendChild(new FlowShape()
            {
                Name = "Card",
                Width = 40,
                Height = 40,
                OffsetX = 20,
                OffsetY = 20,                                
                Type = Shapes.Flow,
                Shape = FlowShapes.Card,
                Ports = new Collection(){
                   new Port() { Name= "Card"  + random.Next(100), Offset = new DiagramPoint() {X= 0,Y= 0.5f} },
                   new Port() { Name= "Card"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 0} },
                   new Port() { Name= "Card"  + random.Next(100), Offset = new DiagramPoint() {X= 1,Y= 0.5f} },
                   new Port() { Name= "Card"  + random.Next(100), Offset = new DiagramPoint() {X= 0.5f,Y= 1 } }
                }
            });
            symbolpalette.Palettes.Add(flowShapes);
        }
          
        public void GenerateConnectors()
        {
            Palette connectors = new Palette("Connectors");
            connectors.Expanded = true;

            Collection segments = new Collection();
            Segment seg = new Syncfusion.JavaScript.DataVisualization.Models.Diagram.Segment(Segments.Orthogonal);
            segments.Add(seg);

            connectors.Items.Add(new Connector { Name = "link1", Segments = segments, SourcePoint = new DiagramPoint(0, 0), TargetPoint = new DiagramPoint(40, 40), LineWidth = 1 });
            segments = new Collection();
            seg = new Syncfusion.JavaScript.DataVisualization.Models.Diagram.Segment(Segments.Straight);
            segments.Add(seg);
            connectors.Items.Add(new Connector { Name = "link2", Segments = segments, SourcePoint = new DiagramPoint(0, 0), TargetPoint = new DiagramPoint(40, 40), LineWidth = 1 });
            symbolpalette.Palettes.Add(connectors);
        }

        public void GenerateDiagram()
        {
            DiagramContent.Height = "100%";
            DiagramContent.Width = "100%";
            DiagramContent.Model.DefaultSettings.Node = new FlowShape() { 
                BorderColor = "#1BA0E2", 
                FillColor = "#1BA0E2",
                Ports = new Collection(){
                   new Port() { Name= "port1", Offset = new DiagramPoint() {X= 0,Y= 0.5f} },
                   new Port() { Name= "port2",Offset = new DiagramPoint() {X= 0.5f,Y= 0} },
                   new Port() { Name= "port3" ,Offset = new DiagramPoint() {X= 1,Y= 0.5f} },
                   new Port() { Name= "port4", Offset = new DiagramPoint() {X= 0.5f,Y= 1 } }
                }
            };

            CreateNode("NewIdea", 150, 60, 300, 60, "New idea identified", FlowShapes.Terminator);
            CreateNode("Meeting", 150, 60, 300, 155, "Meeting with board", FlowShapes.Process);
            CreateNode("BoardDecision", 150, 110, 300, 280, "Board decides \nwhether \nto proceed", FlowShapes.Decision);
            CreateNode("Project", 150, 100, 300, 430, "Find Project \nmanager", FlowShapes.Decision);
            CreateNode("End", 150, 60, 300, 555, "Implement and Deliver", FlowShapes.Process);
            CreateNode("Decision", 250, 60, 550, 60, "Decision Process for new software ideas", FlowShapes.Card);
            CreateNode("Reject", 150, 60, 550, 285, "Reject and write report", FlowShapes.Process);
            CreateNode("Resources", 150, 60, 550, 430, "Hire new resources", FlowShapes.Process);

            createConnector("connector1", "NewIdea", "Meeting", null);
            createConnector("connector2", "Meeting", "BoardDecision", null);
            createConnector("connector3", "BoardDecision", "Project", "Yes");
            createConnector("connector4", "Project", "End", "Yes");
            createConnector("connector5", "BoardDecision", "Reject", "No");
            createConnector("connector6", "Project", "Resources", "No");
        }

        private void CreateNode(string name, double width, double height,double offsetX,double offsetY,string text,FlowShapes shape)
        {
            FlowShape node = new FlowShape();
            node.Name = name;
            node.Width = width;
            node.Height = height;
            node.OffsetX = offsetX;
            node.OffsetY = offsetY;
            if (node.Name == "Decision")
            {
                node.FillColor = "#858585";
                node.BorderColor = "#858585";
            }
            else
            {
                node.FillColor = "#1BA0E2";
                node.BorderColor = "#1BA0E2";
            }
            node.Type = Shapes.Flow;
            node.Shape = shape;
            node.Labels.Add(new Syncfusion.JavaScript.DataVisualization.Models.Diagram.Label { Text = text,FontColor="white" });
            DiagramContent.Model.Nodes.Add(node);
        }

        private void createConnector(string name, string sourceNode, string targetNode, string text)
        {
            Connector connector = new Connector();
            connector.Name = name;
            connector.SourceNode = sourceNode;
            connector.TargetNode = targetNode;
            connector.LineColor = "#606060";
            connector.Labels.Add(new Syncfusion.JavaScript.DataVisualization.Models.Diagram.Label { Text = text,FillColor="white"});
            DiagramContent.Model.Connectors.Add(connector);
        }
    } 
}