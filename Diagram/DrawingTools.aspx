<%@ Page Title="Diagram-DrawingTools-ASP.NET-SYNCFUSION"   Language="C#" AutoEventWireup="true" MetaDescription="This sample visualizes how to build a diagram interactively using ASP.NET WEB diagram’s drawing tools feature." MasterPageFile="~/Samplebrowser.Master" CodeBehind="DrawingTools.aspx.cs" Inherits="WebSampleBrowser.Diagram.DrawingTools" %>

<%@ Register Assembly="Syncfusion.EJ.Web" Namespace="Syncfusion.JavaScript" TagPrefix="ej" %>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Toolbar ID="ToolbarItem" runat="server" ClientSideOnClick="onItemclick" Width="700px" CssClass="toolblock3rightBorderVisible toolcolors">
            <Items>
                <ej:ToolbarItem Id="Rectangle_Tool" TooltipText="Rectangle" SpriteCssClass="icon-Rectangle toolBarIconStyle toolmargin">
                </ej:ToolbarItem>
                <ej:ToolbarItem Id="RoundedRectangle_Tool" TooltipText="Rounded Rectangle" SpriteCssClass="icon-RoundedRectangle toolBarIconStyle toolmargin">
                </ej:ToolbarItem>
                <ej:ToolbarItem Id="Ellipse_Tool" TooltipText="Ellipse" SpriteCssClass="icon-Ellipse toolBarIconStyle toolmargin">
                </ej:ToolbarItem>
                <ej:ToolbarItem Id="Polygon_Tool" TooltipText="Polygon" SpriteCssClass="icon-Polygon toolBarIconStyle toolmargin">
                </ej:ToolbarItem>
                <ej:ToolbarItem Id="Textbox_Tool" TooltipText="Text" SpriteCssClass="icon-Textbox toolBarIconStyle toolmargin">
                </ej:ToolbarItem>
                <ej:ToolbarItem Id="Path_Tool" TooltipText="Path" SpriteCssClass="icon-Path toolBarIconStyle toolmargin">
                </ej:ToolbarItem>
                <ej:ToolbarItem Id="Image_Tool" TooltipText="Image" SpriteCssClass="icon-Image toolBarIconStyle toolmargin">
                </ej:ToolbarItem>
                <ej:ToolbarItem Id="Html_Tool" TooltipText="Html" SpriteCssClass="icon-HTML toolBarIconStyle toolmargin">
                </ej:ToolbarItem>
                <ej:ToolbarItem Id="Native_Tool" TooltipText="Native" SpriteCssClass="icon-Native toolBarIconStyle toolmargin">
                </ej:ToolbarItem>
                <ej:ToolbarItem Id="check" SpriteCssClass="checking">
                    <Template>
                        <table>
                            <tr>
                                <td class="chkrad">
                                    <ej:CheckBox Id="Checkbox1" ClientIDMode="Static" runat="server" Text="Continuous draw" CssClass="checking" ClientSideOnChange="checkBoxChange"></ej:CheckBox>
                                </td>
                            </tr>
                        </table>
                    </Template>
                </ej:ToolbarItem>
            </Items>
        </ej:Toolbar>
    </div>
    <div>
       
        <ej:Diagram ClientIDMode="Static" ID="Diagram1" runat="server" Height="700px" Width="700px">
            <Nodes>
                <ej:BasicShape Name="Rectangle" Width="100" Height="100" OffsetX="150" OffsetY="150" FillColor="#fcbc7c" BorderColor="#f89b4c"
                    Shape="Rectangle">
                    <labels>
                    <ej:DiagramLabel Name="Rectangle_Label" Text="Rectangle" FontColor="White"></ej:DiagramLabel>
                </labels>
                </ej:BasicShape>
                <ej:BasicShape Name="RoundedRectangle" Width="100" Height="100" OffsetX="350" OffsetY="150" FillColor="#f58f7a" BorderColor="#f15e50"
                    Shape="Rectangle" CornerRadius="5">
                    <labels>
                    <ej:DiagramLabel Name="RoundedRectangle_Label" Text="Round Rect" FontColor="White"></ej:DiagramLabel>
                </labels>
                </ej:BasicShape>
                <ej:BasicShape Name="Ellipse" Width="100" Height="100" OffsetX="550" OffsetY="150" FillColor="#85cec1" BorderColor="#4bbca7" Shape="Ellipse">
                    <labels>
                    <ej:DiagramLabel Name="Ellipse_Label" Text="Ellipse" FontColor="White"></ej:DiagramLabel>
                </labels>
                </ej:BasicShape>
                <ej:BasicShape Name="Polygon" Width="100" Height="100" OffsetX="150" OffsetY="350" FillColor="#c19ab8" BorderColor="#ad6fa1"
                    Shape="Polygon">
                    <PointCollection>
                        <ej:ShapePoints X="13.560" Y="67.524" />
                        <ej:ShapePoints X="21.941" Y="41.731" />
                        <ej:ShapePoints X="0.05" Y="25.790" />
                        <ej:ShapePoints X="27.120" Y="25.790" />
                        <ej:ShapePoints X="35.501" Y="0.05" />
                        <ej:ShapePoints X="43.882" Y="25.790" />
                        <ej:ShapePoints X="71.000" Y="25.790" />
                        <ej:ShapePoints X="49.061" Y="41.731" />
                        <ej:ShapePoints X="57.441" Y="67.524" />
                        <ej:ShapePoints X="35.501" Y="51.583" />
                        <ej:ShapePoints X="13.560" Y="67.524" />
                    </PointCollection> 
                <labels>
                    <ej:DiagramLabel Name="Polygon_Label" Text="Polygon" FontColor="White"></ej:DiagramLabel>
                </labels>              
            </ej:BasicShape>
                <ej:BasicShape Name="Path" Width="100" Height="100" OffsetX="350" OffsetY="350" FillColor="#fbe172" BorderColor="#f4cd2a"
                    Shape="Path" PathData="M78.631,3.425c-0.699-1.229-2.177-2.653-5.222-2.394c-8.975,0.759-26.612,16.34-30.804,22.411c-0.167-0.79-0.551-2.049-1.377-2.741c1.176-2.069,3.035-5.709,3.813-9.156c0.18-0.044,0.338-0.161,0.385-0.41c0.083-0.423,0.146-0.848,0.23-1.268c0.135-0.706-0.962-0.944-1.086-0.245c-0.078,0.431-0.158,0.852-0.234,1.286c-0.04,0.26,0.076,0.464,0.26,0.569c-0.756,3.361-2.575,6.93-3.737,8.975c-0.2-0.105-0.415-0.189-0.661-0.224c-0.07-0.009-0.132,0.005-0.199,0.003c-0.067,0.002-0.129-0.012-0.199-0.003c-0.246,0.035-0.461,0.119-0.661,0.224c-1.162-2.045-2.981-5.613-3.737-8.975c0.185-0.104,0.301-0.309,0.26-0.569c-0.076-0.434-0.156-0.855-0.234-1.286c-0.124-0.699-1.221-0.46-1.086,0.245c0.085,0.42,0.147,0.845,0.23,1.268c0.047,0.249,0.205,0.367,0.385,0.41c0.777,3.446,2.637,7.087,3.813,9.156c-0.826,0.692-1.21,1.951-1.377,2.741C33.203,17.371,15.566,1.789,6.591,1.031C3.546,0.772,2.068,2.196,1.369,3.425c-0.818,1.407-0.185,4.303,0.993,9.321c0.53,2.228,1.075,4.521,1.465,6.779c0.208,1.239,0.404,2.471,0.59,3.65c0.819,5.33,1.503,9.766,3.714,11.187c0.606,0.39,1.313,0.55,2.179,0.442c2.107-0.46,4.627-0.845,7.293-1.12c-2.613,1.77-5.88,4.65-6.953,8.474c-0.827,2.989-0.175,6.031,1.932,9.083c2.482,3.569,5.027,5.915,7.406,7.444c4.756,3.057,8.874,2.843,10.613,2.75c0.179-0.002,0.318-0.014,0.453-0.018c1.324-0.017,2.23-1.868,4.161-6.064c0.948-2.044,2.358-5.088,3.546-6.638c0.249,0.57,0.96,0.972,1.331,1.085c-0.03,0.014-0.067,0.039-0.094,0.049c0.034-0.007,0.074-0.03,0.111-0.042c0.022,0.006,0.055,0.023,0.074,0.027c-0.017-0.006-0.046-0.022-0.066-0.03c0.391-0.131,0.876-0.532,1.119-1.088c1.188,1.549,2.598,4.594,3.546,6.638c1.931,4.196,2.838,6.047,4.161,6.064c0.135,0.004,0.274,0.016,0.453,0.018c1.739,0.093,5.857,0.307,10.613-2.75c2.379-1.529,4.924-3.875,7.406-7.444c2.106-3.052,2.759-6.094,1.932-9.083c-1.073-3.823-4.34-6.704-6.953-8.474c2.667,0.274,5.186,0.659,7.293,1.12c0.866,0.108,1.573-0.053,2.179-0.442c2.211-1.421,2.895-5.857,3.714-11.187c0.185-1.18,0.382-2.411,0.59-3.65c0.39-2.258,0.935-4.551,1.465-6.779C78.816,7.728,79.448,4.832,78.631,3.425z M41.184,48.732c-0.343,0.551-0.781,0.918-1.082,1.065c-0.324-0.135-0.933-0.497-1.286-1.065c0,0-1.506-19.959-1.349-24.911c0,0,0.509-3.147,2.533-3.169c2.024,0.022,2.533,3.169,2.533,3.169C42.69,28.773,41.184,48.732,41.184,48.732z">
                    <labels>
                    <ej:DiagramLabel Name="Path_Label" Text="Path" FontColor="White"></ej:DiagramLabel>
                </labels>
                </ej:BasicShape>
                <ej:ImageNode Name="Image" Width="100" Height="100" OffsetX="550" OffsetY="350" BorderColor="#000000" Scale="Stretch"
                    Type="Image" Source="../content/images/Employees/3.png">
                </ej:ImageNode>
                <ej:HtmlNode Name="Html" Width="100" Height="100" OffsetX="150" OffsetY="550" FillColor="#68a3d6" BorderColor="#3382c4" Type="Html" TemplateId="htmlTemplate">
                </ej:HtmlNode>
                <ej:NativeNode Name="Native" Width="100" Height="100" OffsetX="350" OffsetY="550" FillColor="#de6ca9" BorderColor="#de6ca9" Scale="Stretch"
                    Type="Native" TemplateId="svgTemplate">
                </ej:NativeNode>
                <ej:TextNode Name="Text" Type="Text" Width="100" Height="100" OffsetX="550" OffsetY="550" FillColor="transparent" BorderColor="transparent">
                    <TextBlock Text="TextNode" FontColor="Black" />
                </ej:TextNode>
            </Nodes>
        </ej:Diagram>
    </div>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script id="htmlTemplate" type="text/x-jsrender">
        <div>
            <input type="button" value="button" style="color: #ffffff; background-color: #fbb139; border-color: #f89b1c" />
        </div>
    </script>
    <script id="svgTemplate" type="text/x-jsrender">
        <svg version="1.0" xmlns="http://www.w3.org/2000/svg" width="350.000000pt" height="229.000000pt" viewBox="0 0 350.000000 229.000000" preserveAspectRatio="xMidYMid meet">
            <metadata>
            Created by potrace 1.11, written by Peter Selinger 2001-2013
        </metadata>
            <g transform="translate(0.000000,229.000000) scale(0.100000,-0.100000)" fill="#de6ca9" stroke="none">
                <path d="M0 1145 l0 -1145 1750 0 1750 0 0 1145 0 1145 -1750 0 -1750 0 0 -1145z m1434 186 c19 -8 26 -18 26 -37 0 -24 -3 -26 -27 -19 -16 3 -58 9 -94 12 -63 5 -67 4 -88 -23 -23 -29 -21 -60 6 -81 8 -6 47 -19 86 -29 55 -13 80 -25 106 -51 31 -31 33 -37 29 -88 -8 -94 -69 -133 -193 -122 -90 7 -115 20 -115 58 0 26 3 30 18 24 91 -38 168 -41 204 -8 23 21 23 75 1 96 -10 8 -49 23 -88 33 -88 22 -135 63 -135 118 0 92 67 140 181 131 31 -2 68 -9 83 -14z m854 -6 c38 -15 42 -21 42 -51 l0 -33 -47 25 c-41 22 -58 25 -115 22 -58 -3 -72 -8 -97 -32 -79 -75 -59 -259 32 -297 35 -15 106 -18 150 -6 26 7 27 10 27 67 l0 60 -50 0 c-47 0 -50 2 -50 25 0 25 1 25 80 25 l81 0 -3 -97 -3 -98 -40 -20 c-22 -10 -65 -21 -95 -23 -153 -11 -242 74 -243 230 0 145 93 235 233 224 30 -2 74 -12 98 -21z m-638 -169 l67 -178 40 103 c22 57 53 139 69 182 28 75 29 77 62 77 19 0 32 -4 30 -9 -1 -5 -39 -104 -83 -220 l-80 -211 -37 0 c-35 0 -37 2 -56 53 -11 28 -48 124 -81 211 -34 87 -61 163 -61 168 0 5 14 8 32 6 31 -3 32 -5 98 -182z" />
            </g>
        </svg>
    </script>
    <script type="text/javascript">
        function onItemclick(args) {
            var diagram = $("#Diagram1").ejDiagram("instance");
            var option = args.currentTarget.id;
            switch (option) {
                case "Rectangle_Tool":
                    diagram.model.drawType = { type: "basic", shape: "rectangle" };
                    break;
                case "RoundedRectangle_Tool":
                    diagram.model.drawType = { type: "basic", shape: "rectangle", "cornerRadius": 5 };
                    break;
                case "Ellipse_Tool":
                    diagram.model.drawType = { type: "basic", shape: "ellipse" };
                    break;
                case "Polygon_Tool":
                    diagram.model.drawType = { type: "basic", shape: "polygon", points: [{ x: 13.560, y: 67.524 }, { x: 21.941, y: 41.731 }, { x: 0.000, y: 25.790 }, { x: 27.120, y: 25.790 }, { x: 35.501, y: 0.000 }, { x: 43.882, y: 25.790 }, { x: 71.000, y: 25.790 }, { x: 49.061, y: 41.731 }, { x: 57.441, y: 67.524 }, { x: 35.501, y: 51.583 }, { x: 13.560, y: 67.524 }] };
                    break;
                case "Path_Tool":
                    diagram.model.drawType = { type: "basic", shape: "path", pathData: "M78.631,3.425c-0.699-1.229-2.177-2.653-5.222-2.394c-8.975,0.759-26.612,16.34-30.804,22.411c-0.167-0.79-0.551-2.049-1.377-2.741c1.176-2.069,3.035-5.709,3.813-9.156c0.18-0.044,0.338-0.161,0.385-0.41c0.083-0.423,0.146-0.848,0.23-1.268c0.135-0.706-0.962-0.944-1.086-0.245c-0.078,0.431-0.158,0.852-0.234,1.286c-0.04,0.26,0.076,0.464,0.26,0.569c-0.756,3.361-2.575,6.93-3.737,8.975c-0.2-0.105-0.415-0.189-0.661-0.224c-0.07-0.009-0.132,0.005-0.199,0.003c-0.067,0.002-0.129-0.012-0.199-0.003c-0.246,0.035-0.461,0.119-0.661,0.224c-1.162-2.045-2.981-5.613-3.737-8.975c0.185-0.104,0.301-0.309,0.26-0.569c-0.076-0.434-0.156-0.855-0.234-1.286c-0.124-0.699-1.221-0.46-1.086,0.245c0.085,0.42,0.147,0.845,0.23,1.268c0.047,0.249,0.205,0.367,0.385,0.41c0.777,3.446,2.637,7.087,3.813,9.156c-0.826,0.692-1.21,1.951-1.377,2.741C33.203,17.371,15.566,1.789,6.591,1.031C3.546,0.772,2.068,2.196,1.369,3.425c-0.818,1.407-0.185,4.303,0.993,9.321c0.53,2.228,1.075,4.521,1.465,6.779c0.208,1.239,0.404,2.471,0.59,3.65c0.819,5.33,1.503,9.766,3.714,11.187c0.606,0.39,1.313,0.55,2.179,0.442c2.107-0.46,4.627-0.845,7.293-1.12c-2.613,1.77-5.88,4.65-6.953,8.474c-0.827,2.989-0.175,6.031,1.932,9.083c2.482,3.569,5.027,5.915,7.406,7.444c4.756,3.057,8.874,2.843,10.613,2.75c0.179-0.002,0.318-0.014,0.453-0.018c1.324-0.017,2.23-1.868,4.161-6.064c0.948-2.044,2.358-5.088,3.546-6.638c0.249,0.57,0.96,0.972,1.331,1.085c-0.03,0.014-0.067,0.039-0.094,0.049c0.034-0.007,0.074-0.03,0.111-0.042c0.022,0.006,0.055,0.023,0.074,0.027c-0.017-0.006-0.046-0.022-0.066-0.03c0.391-0.131,0.876-0.532,1.119-1.088c1.188,1.549,2.598,4.594,3.546,6.638c1.931,4.196,2.838,6.047,4.161,6.064c0.135,0.004,0.274,0.016,0.453,0.018c1.739,0.093,5.857,0.307,10.613-2.75c2.379-1.529,4.924-3.875,7.406-7.444c2.106-3.052,2.759-6.094,1.932-9.083c-1.073-3.823-4.34-6.704-6.953-8.474c2.667,0.274,5.186,0.659,7.293,1.12c0.866,0.108,1.573-0.053,2.179-0.442c2.211-1.421,2.895-5.857,3.714-11.187c0.185-1.18,0.382-2.411,0.59-3.65c0.39-2.258,0.935-4.551,1.465-6.779C78.816,7.728,79.448,4.832,78.631,3.425z M41.184,48.732c-0.343,0.551-0.781,0.918-1.082,1.065c-0.324-0.135-0.933-0.497-1.286-1.065c0,0-1.506-19.959-1.349-24.911c0,0,0.509-3.147,2.533-3.169c2.024,0.022,2.533,3.169,2.533,3.169C42.69,28.773,41.184,48.732,41.184,48.732z" };
                    break;
                case "Textbox_Tool":
                    diagram.model.drawType = { type: "text", textBlock: { "text": "TextNode", textAlign: ej.datavisualization.Diagram.TextAlign.Center }, fillColor: "transparent", borderColor: "transparent" };
                    break;
                case "Image_Tool":
                    diagram.model.drawType = { type: "image", source: "../content/images/Employees/3.png" };
                    break;
                case "Html_Tool":
                    diagram.model.drawType = { type: "html", templateId: "htmlTemplate" };
                    break;
                case "Native_Tool":
                    diagram.model.drawType = { type: "native", templateId: "svgTemplate" };
                    break;
            }
            if (option != "") ToolbarCommandEnabled(option);
            checkbox();
        }

        function nodeCollectionChange(args) {
            if(args.state==="changing"){
            var diagram = $("#Diagram1").ejDiagram("instance");
            if (!$("#Checkbox1").is(':checked') && diagram.model.drawType.type) {
                ToolbarCommandEnabled();
                diagram.model.drawType = {};
            }
          }
        }
        function checkBoxChange(args) {
            checkbox();
        }
        function checkbox() {
            var diagram = $("#Diagram1").ejDiagram("instance");
            var tool = diagram.tool();
            if ($("#Checkbox1").is(':checked')) {
                diagram.update({ tool: tool | ej.datavisualization.Diagram.Tool.ContinuesDraw })
            }
            else {
                tool = tool & ~ej.datavisualization.Diagram.Tool.ContinuesDraw;
                diagram.update({ tool: tool | ej.datavisualization.Diagram.Tool.DrawOnce })
            }
        }
        function ToolbarCommandEnabled(id) {
            $('#Rectangle_Tool').css('background-color', '#ebeced');
            $("#Rectangle_Tool").find("div").removeClass("icon-colors");
            $('#RoundedRectangle_Tool').css('background-color', '#ebeced');
            $("#RoundedRectangle_Tool").find("div").removeClass("icon-colors");
            $('#Textbox_Tool').css('background-color', '#ebeced');
            $("#Textbox_Tool").find("div").removeClass("icon-colors");
            $('#Native_Tool').css('background-color', '#ebeced');
            $("#Native_Tool").find("div").removeClass("icon-colors");
            $('#Html_Tool').css('background-color', '#ebeced');
            $("#Html_Tool").find("div").removeClass("icon-colors");
            $('#Image_Tool').css('background-color', '#ebeced');
            $("#Image_Tool").find("div").removeClass("icon-colors");
            $('#Path_Tool').css('background-color', '#ebeced');
            $("#Path_Tool").find("div").removeClass("icon-colors");
            $('#Polygon_Tool').css('background-color', '#ebeced');
            $("#Polygon_Tool").find("div").removeClass("icon-colors");
            $('#Ellipse_Tool').css('background-color', '#ebeced');
            $("#Ellipse_Tool").find("div").removeClass("icon-colors");
            if (id) {
                $('#' + id).css('background-color', '#2282c3');
                $("#" + id).find("div").addClass("icon-colors");
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="StyleSection">
    <style type="text/css">
        .e-toolbar > .e-horizontal.e-ul > li {
            margin: 5px;
            height: 25px;
            width:34px;
        }
        .e-toolbar > .e-horizontal.e-ul > li[aria-label] {
            margin: 5px;
            height: 25px;
            width: 120px;
        }

        .toolBarIconStyle {
            font-size: 17px;
            color: #6B6B6B;
            margin-top: 4px;
            margin-left: 4px;
        }

        .chkrad {
            font-size: 12px;
        }

        .icon-colors {
            color: #ffffff;
        }

        .toolcolors {
            border-bottom-color: #bbbbbb;
            background-color: #ebeced;
            border-top-style: none;
            border-left-style: none;
            border-right-style: none;
            border-width: 1px;
        }

        .toolmargin {
            margin-left: 8px;
        }

        .e-toolbar > .e-horizontal.e-ul > li[aria-label]:hover {
            background-color: #ebeced;
            color: #6B6B6B;
            border-color: #ebeced;
        }

        .svg-rotate-ie:hover
        {
            cursor: url("../Content/ejthemes/common-images/diagram/Rotate.cur"),default;
        }

        .svg-rotate
        {
            cursor: url("../Content/ejthemes/common-images/diagram/Rotate.cur"),default;
        }
    </style>
</asp:Content>


