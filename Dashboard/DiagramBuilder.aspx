<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DiagramBuilder.aspx.cs" Inherits="WebSampleBrowser.Dashboard.DiagramBuilder" %>

<%@ Register Assembly="Syncfusion.EJ.Web" Namespace="Syncfusion.JavaScript" TagPrefix="ej" %>

<!DOCTYPE html >

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Essential JS1 | Showcase Sample | ASP.NET Webform | Diagram Builder</title>
    <meta name="description" content="The ASP.NET diagram builder application is used to making diagrams like flowcharts, BPMN, swimlane and electrical diagrams."> 
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Content/ejthemes/ej.widgets.core.min.css" rel="stylesheet" />
    <link href="../Content/ejthemes/default-theme/ej.theme.min.css" rel="stylesheet" />
    <link href="../Content/sampleBrowserSite.css" rel="stylesheet" />
    <link href="../Content/sampleBrowserSite-responsive.css" rel="stylesheet" />
    <link rel="shortcut icon" href="~/Content/images/favicon.ico" />

    <!--[if lt IE 9]>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/jquery-1.11.3.min.js")%>' type="text/javascript"></script>
    <![endif]-->
    <!--[if gte IE 9]><!-->
    <script src='<%= Page.ResolveClientUrl("~/Scripts/jquery-3.4.1.min.js")%>' type="text/javascript"></script>
    <!--<![endif]-->

    <script src="../Scripts/jsrender.min.js" type="text/javascript"></script>
    <script src="../Scripts/ej.web.all.min.js" type="text/javascript"></script>


    <script src="../Scripts/DiagramBuilder/knockout-min.js" type="text/javascript"></script>
    <script src="../Scripts/DiagramBuilder/IntelligentShapes.js" type="text/javascript"></script>
    <script src="../Scripts/DiagramBuilder/methods.js" type="text/javascript"></script>
    <script src="../Scripts/DiagramBuilder/events.js" type="text/javascript"></script>
    <script src="../Scripts/DiagramBuilder/control.js" type="text/javascript"></script>
    <link href="../Content/DiagramBuilder/DiagramBuilderIcons/style.css" rel="stylesheet" />
    <link href="../Content/DiagramBuilder/css/DiagramBuilder.css" rel="stylesheet" />

    <script id="svgTemplate" type="text/x-jsrender">
        <svg version="1.0" xmlns="http://www.w3.org/2000/svg" width="225px" height="32px" viewBox="0 -2 225 32">
            <g visibility="visible">
                <image width="26px" height="26px" opacity="1" xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="{{:addInfo.source}}"></image>
                <text x="40" y="18" font-size="14">
                    <tspan>{{:name}}</tspan>
                </text>
            </g>
        </svg>
    </script>
</head>
<body>
    <form id="DiagramFrom" runat="server">
        <div class="sample-header" id="sample-header" style="display: none">
            <div class="sample-header-menubar" style="margin: 1px 11px;">
                <!--
                    The menu control is initialized which is used to execute the diagram client side API methods 
                    such as undo, redo, save, load, cut, copy, paste etc.
                 -->
                <ej:Menu ID="DiagramMenuControl" runat="server" Width="100%" OpenOnClick="false" ClientSideOnClick="menuBarClick">
                    <Items>
                        <ej:MenuItem Id="menufile" Text="File">
                            <Items>
                                <ej:MenuItem Text="New"></ej:MenuItem>
                                <ej:MenuItem Text="Open"></ej:MenuItem>
                                <ej:MenuItem Text="Save"></ej:MenuItem>
                                <ej:MenuItem Text="Save As"></ej:MenuItem>
                                <ej:MenuItem Text="Export"></ej:MenuItem>
                                <ej:MenuItem Text="Print"></ej:MenuItem>
                            </Items>
                        </ej:MenuItem>
                        <ej:MenuItem Id="menuedit" Text="Edit">
                            <Items>
                                <ej:MenuItem Text="Undo"></ej:MenuItem>
                                <ej:MenuItem Text="Redo"></ej:MenuItem>
                                <ej:MenuItem HtmlAttributes="border-bottom:1px solid #c8c8c8;margin:0.1px;background-color:#AFAFAF"></ej:MenuItem>
                                <ej:MenuItem Text="Select All"></ej:MenuItem>
                                <ej:MenuItem Text="Cut"></ej:MenuItem>
                                <ej:MenuItem Text="Copy"></ej:MenuItem>
                                <ej:MenuItem Text="Paste"></ej:MenuItem>
                                <ej:MenuItem Text="Delete"></ej:MenuItem>
                            </Items>
                        </ej:MenuItem>
                        <ej:MenuItem Id="menuview" Text="View">
                            <Items>
                                <ej:MenuItem Id="SmartGuid" Text="Smart Guide" SpriteCssClass="icon-checkmark2"></ej:MenuItem>
                                <ej:MenuItem Id="GridLines" Text="Grid Lines" SpriteCssClass="icon-checkmark2"></ej:MenuItem>
                                <ej:MenuItem Id="SnapToGrid" Text="Snap To Grid" SpriteCssClass="icon-checkmark2"></ej:MenuItem>
                                <ej:MenuItem Id="EnableOverView" Text="Overview" SpriteCssClass="icon-checkmark2"></ej:MenuItem>
                                <ej:MenuItem Id="ShowRulers" Text="Show Rulers" SpriteCssClass="icon-checkmark2"></ej:MenuItem>
                            </Items>
                        </ej:MenuItem>
                        <ej:MenuItem Id="menuaction" Text="Actions">
                            <Items>
                                <ej:MenuItem Text="Align">
                                    <Items>
                                        <ej:MenuItem Text="Left"></ej:MenuItem>
                                        <ej:MenuItem Text="Right"></ej:MenuItem>
                                        <ej:MenuItem Text="Center"></ej:MenuItem>
                                        <ej:MenuItem Text="Top"></ej:MenuItem>
                                        <ej:MenuItem Text="Bottom"></ej:MenuItem>
                                        <ej:MenuItem Text="Middle"></ej:MenuItem>
                                        <ej:MenuItem Text="Space Down"></ej:MenuItem>
                                        <ej:MenuItem Text="Space Across"></ej:MenuItem>
                                    </Items>
                                </ej:MenuItem>
                                <ej:MenuItem Text="Grouping">
                                    <Items>
                                        <ej:MenuItem Text="Group"></ej:MenuItem>
                                        <ej:MenuItem Text="Ungroup"></ej:MenuItem>
                                    </Items>
                                </ej:MenuItem>
                                <ej:MenuItem Text="Order">
                                    <Items>
                                        <ej:MenuItem Text="Bring To Front"></ej:MenuItem>
                                        <ej:MenuItem Text="Bring Forward"></ej:MenuItem>
                                        <ej:MenuItem Text="Send To Back"></ej:MenuItem>
                                        <ej:MenuItem Text="Send Backward"></ej:MenuItem>
                                    </Items>
                                </ej:MenuItem>
                                <ej:MenuItem Text="Resize">
                                    <Items>
                                        <ej:MenuItem Text="Same Size"></ej:MenuItem>
                                        <ej:MenuItem Text="Same Height"></ej:MenuItem>
                                        <ej:MenuItem Text="Same Width"></ej:MenuItem>
                                    </Items>
                                </ej:MenuItem>
                            </Items>
                        </ej:MenuItem>
                    </Items>
                </ej:Menu>
            </div>
            <div class="sample-header-toolbar">
                <div class="Diagram-Toolbar">
                    <table>
                        <tr>
                            <td>
                                <!-- 
                               The toolbar control is initialized which is used to displays a list of tools in a web page

                                Here we have used a two css class.
                                1. tb-item-default-style - It provides a separator between each toolbar section.
                                2. tb-item-child - customize the appearance of the toolbar item. 
                                   
                                You can refer the diagrambuilder.css file for its definition
                            -->
                                <div id="toolbarEvents" style="max-height: 33px;">
                                    <ul class="tb-item-default-style">
                                        <li id="Redo_Tool" class="tb-item-child" title="Redo">
                                            <div class="icon-TBi__Redo tb-icon" />
                                        </li>
                                        <li id="Undo_Tool" class="tb-item-child" title="Undo">
                                            <div class="icon-TBi__Undo tb-icon" />
                                        </li>
                                    </ul>
                                    <ul class="tb-item-default-style">
                                        <!-- We have define the margin as inline style since we have placed a dropdown here. 
                                        Hence the commona alignment wont be suitable here. 
                                    -->
                                        <li id="ZoomPercentage_Tool" title="Zoom Percentage" style="margin-left: 5px; margin-right: 5px">
                                            <ej:DropDownList ID="zoompercentage" ClientSideOnChange="zoomPercentageChange" CssClass="ddl-standard" runat="server" SelectedIndex="3" PopupHeight="203px" Width="75px" Height="25px">
                                                <Items>
                                                    <ej:DropDownListItem Text="400%" Value="400%"></ej:DropDownListItem>
                                                    <ej:DropDownListItem Text="200%" Value="200%"></ej:DropDownListItem>
                                                    <ej:DropDownListItem Text="150%" Value="150%"></ej:DropDownListItem>
                                                    <ej:DropDownListItem Text="100%" Value="100%"></ej:DropDownListItem>
                                                    <ej:DropDownListItem Text="75%" Value="75%"></ej:DropDownListItem>
                                                    <ej:DropDownListItem Text="50%" Value="50%"></ej:DropDownListItem>
                                                    <ej:DropDownListItem Text="25%" Value="25%"></ej:DropDownListItem>
                                                </Items>
                                            </ej:DropDownList>
                                        </li>
                                        <li id="ZoomIn_Tool" class="tb-item-child" title="Zoom In">
                                            <div class="icon-TBi__Zoomin tb-icon" />
                                        </li>
                                        <li id="ZoomOut_Tool" class="tb-item-child" title="Zoom Out">
                                            <div class="icon-TBi__Zoomout tb-icon" />
                                        </li>
                                        <li id="FitToPage_Tool" class="tb-item-child" title="Fit To Page">
                                            <div class="icon-TBi__FitToPage tb-icon" />
                                        </li>
                                    </ul>
                                    <ul id="drawingToolsItem" class="tb-item-default-style">
                                        <li id="Pan_Tool" title="Pan" class="tb-item-child">
                                            <div class="icon-TBi__pan tb-icon" />
                                        </li>
                                        <li id="MoveTool_Tool" title="Pointer" class="tb-item-child">
                                            <div class="icon-TBi__MoveTool tb-icon" />
                                        </li>
                                        <li id="Text_Tool" title="Text" class="tb-item-child">
                                            <div class="icon-TBi__Text tb-icon" />
                                        </li>
                                        <li id="ConnectorDraw_Tool" class="tb-item-child" title="Orthogonal Connection">
                                            <div class="icon-Con__Orthogonal tb-icon" />
                                        </li>
                                        <li id="ConnectorDraw_Tool_Straight" class="tb-item-child" title="Straight Connection">
                                            <div class="icon-Con__Stright tb-icon" />
                                        </li>
                                    </ul>
                                    <ul id="deleteToolbarItem" style="display: none" class="tb-item-default-style">
                                        <li id="Delete_Tool" title="Delete" class="tb-item-child">
                                            <div class="icon-TBi__Delete tb-icon" />
                                        </li>
                                        <li id="Lock_Tool" title="Lock" class="tb-item-child">
                                            <div class="icon-TBi__Lock tb-icon" />
                                        </li>
                                    </ul>
                                    <ul id="groupToolbarItem" style="display: none" class="tb-item-default-style">
                                        <li id="Group_Tool" title="Group" class="tb-item-child">
                                            <div class="icon-TBi__Group tb-icon" />
                                        </li>
                                    </ul>
                                    <ul id="ungroupToolbarItem" style="display: none" class="tb-item-default-style">
                                        <li id="UnGroup_Tool" title="Ungroup" class="tb-item-child">
                                            <div class="icon-TBi__Ungroup tb-icon" />
                                        </li>

                                    </ul>
                                    <ul id="orderToolbarItem" style="display: none">
                                        <li id="SendBackward_Tool" title="Send Backward" class="tb-item-child">
                                            <div class="icon-TBi__SendBack tb-icon" />
                                        </li>
                                        <li id="MoveForward_Tool" title="Bring Forward" class="tb-item-child">
                                            <div class="icon-TBi__MoveForward tb-icon" />
                                        </li>
                                        <li id="SendToBack_Tool" title="Send To Back" class="tb-item-child">
                                            <div class="icon-TBi__BringtoBack tb-icon" />
                                        </li>
                                        <li id="BringToFront_Tool" title="Bring To Front" class="tb-item-child">
                                            <div class="icon-TBi__BringtoFront tb-icon" />
                                        </li>
                                    </ul>

                                    <ul id="alignmentToolbarItem" style="display: none; border: none;">
                                        <li id="AlignLeft_Tool" title="Align Left" class="tb-item-child">
                                            <div class="icon-TBi__HarizontalAlignLeft tb-icon" />
                                        </li>
                                        <li id="AlignCenter_Tool" title="Align Center" class="tb-item-child">
                                            <div class="icon-TBi__HarizontalAlignCenter tb-icon" />
                                        </li>
                                        <li id="AlignRight_Tool" title="Align Right" class="tb-item-child">
                                            <div class="icon-TBi__HarizontalAlignRight tb-icon" />
                                        </li>
                                        <li id="AlignBottom_Tool" title="Align Bottom" class="tb-item-child">
                                            <div class="icon-TBi__VerticalAlignBottom tb-icon" />
                                        </li>
                                        <li id="AlignTop_Tool" title="Align Top" class="tb-item-child">
                                            <div class="icon-TBi__VerticalAlignTop tb-icon" />
                                        </li>
                                        <li id="AlignMiddle_Tool" title="Align Middle" class="tb-item-child" style="margin-right: 10px;">
                                            <div class="icon-TBi__VerticalAlignCenter tb-icon">
                                            </div>
                                        </li>
                                    </ul>
                                    <!-- The dropdown control is created to change the width,height of the diagram. A cssClass "tb-artboard-label" is used to customize the label appearance. refer this in diagrambuilder.css file -->
                                    <ul id="artboardToolbarItem" style="display: block;">
                                        <li style="margin-left: 10px; width: 420px">
                                            <label style="margin-left: 0px;" class="tb-artboard-label">Artboard</label>
                                            <label style="width: 25px;" class="tb-artboard-label">W :</label>
                                            <ej:NumericTextBox ID="artBoardWidth" Value="1100" Width="75px" ClientSideOnFocusOut="setDimension" runat="server"></ej:NumericTextBox>
                                            <label style="width: 22px;" class="tb-artboard-label">H :</label>
                                            <ej:NumericTextBox ID="artBoardHeight" Value="1200" Width="75px" ClientSideOnFocusOut="setDimension" runat="server"></ej:NumericTextBox>
                                            <label style="width: 86px;" class="tb-artboard-label">Background :</label>
                                            <div>
                                                <!-- 
                                                The below elements created to represent the diagram pageBackground Color with visual representation and change the diagram pageBackground Color at runtime.
                                                1. Here "backgroundIcon" element is used to represent the diagram pageBackground Color with visual representation.
                                                2. The "pageBackgroundColor" element is an dropdown control and its used to change the diagram background color at runtime.

                                                Since the dropdown control will show the selectedItem as a text, we have used the span element to represent its visually.
                                                The dropdown control appreance customization done in diagrambuilder.css class to hide the dropdown selected item as a text.

                                                1. You can refer style.css file for svg font-icon style related definition such as class name start with icon-*.
                                                2. Apart from this, you can refer the diagrambuilder.css file for remaining cssClass definition.
                                            -->
                                                <div style="width: 23px; height: 23px; border: 1px solid; border-color: #bbbcbb; overflow: hidden;">
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <div style="margin-top: 1px;">
                                                                    <!-- 
                                                                    1. The below span element will be represented as image and the image will be svg font icon. we have customized this font-icon appearnce in inline style.
                                                                    2. The cssClass "icon-Pi__Fill" is used to set the svg font-icon as background image.
                                                                 -->
                                                                    <span id="backgroundIcon" class="icon-Pi__Fill" style="color: white; font-size: 13px; margin-left: 3px; border: 1px solid #bbbcbb;"></span>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <div style="margin-top: -25px; margin-left: -3px;">
                                                                    <!-- 
                                                                     The dropdown control is created to change the pagebackground color of an diagram.
                                                                 -->
                                                                    <ej:DropDownList ID="pageBackgroundColor" runat="server" Width="340px" PopupHeight="200px" CssClass="ddl-color-palette ddl-custom" />
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <ej:Toolbar ID="toolbarEvents" runat="server" Orientation="Horizontal" ClientSideOnClick="toolbarClick"></ej:Toolbar>
                            </td>
                        </tr>
                    </table>

                    <div style="margin-top: -32px; float: right; margin-right: 20px;">
                        <!-- 
                      The button control is created to save the diagram onto the local storage.
                    -->
                        <ej:Button ID="save_icon" runat="server" Size="Mini" ShowRoundedCorner="true" Text="Save" ClientSideOnClick="saveDiagram" Type="Button"></ej:Button>
                    </div>
                </div>
            </div>
            <div id="footer">
                <div class="bottom-links">
                    <div class="left">
                        <div class="sync-text">
                            Copyright © 2001-2019 Syncfusion Inc.
                        </div>
                    </div>
                    <div class="right">
                        <a href="https://www.syncfusion.com">
                            <div class="syncfusion-image"></div>
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <div class="sample-main" id="sample-main" style="display: none">
            <div id="main-left">
                <asp:ScriptManager ID="scriptManager1" runat="server"></asp:ScriptManager>
                <div id="symbolPalette_Parent_Maxi" style="width: 270px; float: left; min-height: 30px">
                    <div class="searchParent_Maxi" style="background: white">
                        <!-- The below element is created to filter the shapes from symbol palette. -->
                        <input type="text" id="txtSearch_Maxi" style="border: medium none; float: left; height: 30px; margin-left: 6px; outline: medium none; width: calc(270px - 60px);"
                            onclick="arrowIndicator('maximize')" onkeyup="onSearchBoxTextChange(this)" />
                        <!-- The below element is visually represent the search option with an image -->
                        <div id="searchClear_Maxi" class="searchClear_Maxi" onclick="clearText()" style="float: left"></div>
                        <!-- The below element is created to minimize or maximize the symbol palette. -->
                        <div id="minmax_symbolPalette" onclick="minmaxClick()"></div>
                    </div>
                    <!--
                        The SymbolPalette control is initialized which displays a collection of palettes. The palettes shows a set of nodes and connectors. it allows you to drag and the nodes and connectors into the diagram.
                    -->
                    <ej:SymbolPalette ID="symbolpalette" runat="server">
                    </ej:SymbolPalette>
                </div>
                <div id="minimizedPalette"></div>
            </div>
            <div id="main-right">
                <!--
                   The Diagram control can be created which has a feature includes snapping,Guidelines,Gridlines,serialization and zooming.
                 -->
                <ej:Diagram ID="DiagramContent" runat="server" Height="100%" Width="100%">
                </ej:Diagram>
            </div>
            <div id="propertyEditor" style="float: right; display: none">
                <!--
                  The tab control is initialized and its an interface where list of items are expanded from a single item. Each Tab panel defines its header text or header template, as well as a content template.
                -->
                <div id="tabContent" class="PropertyPanel">
                    <!-- 
                        Here we are creating the tab headers and set the background image for tab headers. 
                        The background images are set as svg font icon. You can refer the style.css file in which we have defined the svg font icon for each tab.

                        cssClass:
                        1. tab-icon - It is used to customize the size of the font-icon which is set as background image for tab header.
                        2. icon-* - It is used to set the font-icon as background image for tab header.
                    -->
                    <div>
                        <ul>
                            <li class="tab-header" style="border-left: none">
                                <a href="#pinnedTab">
                                    <span id="pinspan" class="icon-PH__TabBin tab-icon" data-bind="style: { color: tabPinIcon }"></span>
                                </a>
                            </li>
                            <li class="tab-header">
                                <a href="#nodeprop">
                                    <span class="icon-PH__NodeProperty tab-icon" data-bind="style: { color: tabnodeicon }"></span>
                                </a>
                            </li>
                            <li class="tab-header">
                                <a href="#textprop">
                                    <span class="icon-PH__TextProperty tab-icon" data-bind="style: { color: tabTextIcon }"></span>
                                </a>
                            </li>
                            <li class="tab-header">
                                <a href="#lineprop">
                                    <span class="icon-Pi__Connector tab-icon" data-bind="style: { color: tabConnectorIcon }"></span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <!-- 
                        Here we have defined the tab content for node tab. In which we have exposed a features to customize the label appearance at runtime.
                    -->
                    <div id="nodeprop" style="width: 100%;">
                        <div style="margin-left: -11px">
                            <div>
                                <div>
                                    <label class="tab-label">Properties</label>
                                </div>
                            </div>
                            <table style="margin-top: 17px;">
                                <tr>
                                    <td>
                                        <!-- 
                                            The below elements created to represent the node's fillColor with visual representation and change the node fillColor at runtime.
                                            1. Here "fillIcon" element is used to represent the node fillColor with visual representation.
                                            2. The "fillColor" element is an dropdown control and its used to change the node fill color at runtime.

                                            like pageBackgroundColor, dropdown control will show the selectedItem as a text, we have used the span element to represent its visually.
                                            The dropdown control appreance customization done in diagrambuilder.css class to hide the dropdown selected item as a text.
                                        -->
                                        <div data-bind="style: { backgroundColor: fillBackgroundColor }" style="margin-left: 5px;" class="ddl-custom-icon-parent"
                                            onmouseover="MouseEnterOnDiv(this,'fillColor','icon-Pi__Fill')" onmouseout="MouseLeaveFromDiv(this,'fillColor','icon-Pi__Fill')">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <div style="margin-top: 8px; margin-left: -1px;">
                                                            <!-- 
                                                                1. The below span element will be represented as image and the image will be svg font icon.. we have customized this font-icon appearnce in inline style.
                                                                2. The cssClass "icon-Pi__Fill" is used to set the svg font-icon as background image.
                                                            -->
                                                            <span id="fillIcon" class="icon-Pi__Fill" style="font-size: 25px; margin-left: 8px; border: 1px solid #bbbcbb;" data-bind="style: { color: fillColor }"></span>
                                                        </div>
                                                        <div style="margin-top: -33px">
                                                            <!-- The below element is used to represent the dropdown expand option and its appearance customized via KO binding. -->
                                                            <span class="icon-Pi__Button-Corner" data-bind="style: { color: fillBorderColor }"></span>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="ddl-custom-text">
                                                            <!-- Create the dropdown control for fillColor option. -->
                                                            <ej:DropDownList ID="fillColor" runat="server" PopupHeight="420px" ClientSideOnPopupShown="popupShown" ClientSideOnPopupHide="popupHide"
                                                                CssClass="ddl-color-palette ddl-custom" />
                                                        </div>
                                                        <div style="margin-left: 1px">
                                                            <!-- Create the element to descripe the above control functionalilty via text. -->
                                                            <label style="font-size: 11px; font-weight: normal">Fill Color</label>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                    <td>
                                        <!-- 
                                            The below elements created to represent the node's borderColor with visual representation and change the node borderColor at runtime.
                                            1. Here we have used two elements "borderColorIcon" && "borderColorIcon1" to represent the node's borderColor with visual representation.
                                            2. The "borderColor" element is an dropdown control and its used to change the node border color at runtime.

                                            cssClass:
                                            1. ddl-custom-icon - It is used to customize the size of the font-icon. We will use this class for all svg font icons available in the property panel. 
                                               For some items alone, we will set as inline style.
                                        -->
                                        <div data-bind="style: { backgroundColor: storkeBackgroundColor }" style="margin-left: 22px" class="ddl-custom-icon-parent"
                                            onmouseover="MouseEnterOnDiv(this,'borderColor','icon-Pi__Stroke-Fill')" onmouseout="MouseLeaveFromDiv(this,'borderColor','icon-Pi__Stroke-Fill')">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <div style="margin-top: 7px; margin-left: 3px">
                                                            <!-- 
                                                                1. The below span element will be represented as image and the image will be svg font icon..
                                                                2. The cssClass "icon-Strokefillpen" && "icon-Strokefillcolor" is used to set the svg font-icon as background image.
                                                            -->
                                                            <div>
                                                                <span id="borderColorIcon" class="icon-Strokefillpen ddl-custom-icon" style="font-size: 21px" data-bind="style: { color: strokePenColor }"></span>
                                                            </div>
                                                            <div style="margin-top: -17px">
                                                                <span id="borderColorIcon1" class="icon-Strokefillcolor ddl-custom-icon" data-bind="style: { color: stroke }"></span>
                                                            </div>
                                                        </div>
                                                        <div style="margin-top: -37px; margin-left: 1px;">
                                                            <!-- 
                                                                The below element is used to represent the dropdown expand option and its appearance customized via KO binding.
                                                            -->
                                                            <span class="icon-Pi__Button-Corner" data-bind="style: { color: storkeBorderColor }" />
                                                        </div>

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="ddl-custom-text">
                                                            <!-- Create the dropdown control for borderColor option. -->
                                                            <ej:DropDownList ID="borderColor" runat="server" PopupHeight="420px" ClientSideOnPopupShown="popupShown" ClientSideOnPopupHide="popupHide"
                                                                CssClass="ddl-color-palette ddl-custom" />
                                                        </div>
                                                        <div style="margin-left: 5px;">
                                                            <!-- Create the element to descripe the above control functionalilty via text. -->
                                                            <label style="font-size: 11px; font-weight: normal">Stroke</label>
                                                        </div>
                                                    </td>

                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                    <td>
                                        <!-- 
                                            The below elements created to represent the node's borderWidth with visual representation.
                                            1. Here "borderWidthIcon" element is used to represent the node fillColor with visual representation.
                                            2. The "borderWidth" element is an dropdown control and its used to change the node fill color at runtime.
                                        -->
                                        <div data-bind="style: { backgroundColor: borderThicknessBackColor }" style="margin-left: 22px" class="ddl-custom-icon-parent"
                                            onmouseover="MouseEnterOnDiv(this,'borderThickness','icon-Pi__Line-Width')" onmouseout="MouseLeaveFromDiv(this,'borderThickness','icon-Pi__Line-Width')">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <!-- 
                                                            1. The below span element will be represented as image and the image will be svg font icon..
                                                            2. The cssClass "icon-Pi__LineWidth" is used to set the svg font-icon as background image.
                                                        -->
                                                        <div style="margin-top: 9px; margin-left: 1px">
                                                            <span id="borderWidthIcon" class="icon-Pi__LineWidth ddl-custom-icon" data-bind="style: { color: borderThicknessFontColor }"></span>
                                                        </div>
                                                        <div style="margin-top: -31px; margin-left: 1px;">
                                                            <!-- The below element is used to represent the dropdown expand option. -->
                                                            <span class="icon-Pi__Button-Corner" data-bind="style: { color: borderThicknessBorderColor }" />
                                                        </div>

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="ddl-custom-text">
                                                            <ej:DropDownList ID="borderWidth" runat="server" PopupHeight="320px" ClientSideOnPopupShown="popupShown" ClientSideOnPopupHide="popupHide"
                                                                CssClass="borderWidthDiv ddl-custom" ClientSideOnSelect="propertyPannelChange" />
                                                        </div>
                                                        <div>
                                                            <!-- Create the element to descripe the above control functionalilty via text. -->
                                                            <label style="font-size: 11px; margin-left: -1px; font-weight: normal">Thickness</label>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>

                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <!-- 
                                             The below elements created to represent the node's gradient with visual representation. 
                                             1. We have set the background image for this element in diagrambuilder.css file with the help of its id (gradientDiv).
                                        -->
                                        <div id="gradientDivParent" data-bind="style: { backgroundColor: gradientBackgroundColor }" style="margin-left: 5px; margin-top: 40px" class="ddl-custom-icon-parent"
                                            onmousedown="PropertyChangesFromPanel(this,'gradient')" onmouseover="MouseEnterOnDiv(this,'gradient','icon-Pi__Credient')" onmouseout="MouseLeaveFromDiv(this,'gradient','icon-Pi__Credient')">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <div style="margin-top: 8px; margin-left: 8px;">
                                                            <!-- Create the element to represent the gradient representaion visually. -->
                                                            <div id="gradientDiv" style="width: 27px; height: 27px"></div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div style="margin-top: 8px; margin-left: -1px">
                                                            <!-- Create the element to descripe the above functionalilty via text. -->
                                                            <label style="font-size: 11px; font-weight: normal">Gradient</label>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                    <td>
                                        <!-- 
                                            The below elements created to represent the node's state (enable/disable) with visual representation.
                                            1. Here "lockIcon" element is used to represent the node's state with visual representation.
                                        -->
                                        <div id="lockDivParent" data-bind="style: { backgroundColor: lockBackgroundColor }" style="margin-left: 22px; margin-top: 40px;" class="ddl-custom-icon-parent"
                                            onmousedown="PropertyChangesFromPanel(this,'lock')" onmouseover="MouseEnterOnDiv(this,'lock','icon-Pi__lock')" onmouseout="MouseLeaveFromDiv(this,'lock','icon-Pi__lock')">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <div style="margin-top: 9px; margin-left: 3px">
                                                            <!-- 
                                                                1. The below span element will be represented as image and the image will be svg font icon..
                                                                2. The cssClass "icon-Pi__lock" is used to set the svg font-icon as background image.
                                                            -->
                                                            <span id="lockIcon" class="icon-Pi__lock ddl-custom-icon" data-bind="style: { color: lockFontColor }"></span>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div style="margin-top: 8px; margin-left: 9px;">
                                                            <!-- Create the element to descripe the above functionalilty via text. -->
                                                            <label style="font-size: 11px; font-weight: normal">Lock</label>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                </tr>

                            </table>
                            <div style="height: 30px; width: 100%; margin-top: 40px; vertical-align: middle;">
                                <table>
                                    <tr>
                                        <td>
                                            <label style="font-size: 11px; margin-left: 5px; font-weight: normal">Opacity</label></td>
                                        <td>
                                            <!--
                                            The below element is created as slider control and its used to customize the node's opacity at run time.

                                            The Slider control is created which provides support to select a value from a particular range as well as selects a range value. The Slider has a sliding base on which the handles are moved. 

                                            -->
                                            <ej:Slider ID="opacity" runat="server" CssClass="opacityDiv" SliderType="MinRange" MinValue="0" MaxValue="100" IncrementStep="1" ClientSideOnSlide="propertyPannelChange" ClientSideOnChange="propertyPannelChange"></ej:Slider>

                                        </td>
                                    </tr>
                                </table>
                            </div>

                            <div style="margin-left: 12px">
                                <label class="tab-label">Dimensions</label>
                            </div>

                            <table>
                                <!-- 
                                    The below element is created as numeric text box and its used to update the node's position and size at run time. 
                                -->
                                <tr>
                                    <td>
                                        <div style="margin-top: 10px; margin-left: 8px">
                                            <label style="width: 20px; font-weight: bold; float: left">W</label>
                                            <ej:NumericTextBox ID="nodeWidth" runat="server" Width="64px" CssClass="widthDiv" Value="35" ClientSideOnChange="propertyPannelChange"></ej:NumericTextBox>
                                            <label style="width: 20px; margin-left: 12px; font-weight: bold; float: left">H</label>
                                            <ej:NumericTextBox ID="nodeHeight" runat="server" Width="64px" CssClass="heightDiv" Value="35" ClientSideOnChange="propertyPannelChange"></ej:NumericTextBox>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div style="margin-top: 25px; margin-left: 8px">
                                            <label style="width: 20px; font-weight: bold; float: left; text-indent: 3px;">X</label>
                                            <ej:NumericTextBox ID="nodeOffsetX" runat="server" Width="64px" CssClass="offsetXDiv" Value="35" ClientSideOnChange="propertyPannelChange"></ej:NumericTextBox>
                                            <label style="width: 20px; margin-left: 12px; font-weight: bold; float: left">Y</label>
                                            <ej:NumericTextBox ID="nodeOffsetY" runat="server" Width="64px" CssClass="offsetYDiv" Value="35" ClientSideOnChange="propertyPannelChange"></ej:NumericTextBox>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div style="margin-top: 20px; margin-left: 8px">
                                            <!-- 
                                                The below element is created as check box and its used to update the enable/disable the node's aspect ratio support. 
                                                The cssClass "icon-Pi__lock" is used to set the svg font-icon as background image.
                                            -->
                                            <ej:CheckBox ID="chkAspectRatio" runat="server" CssClass="aspectRatioDiv" ClientSideOnChange="propertyPannelChange" Size="Small" />
                                            <label for="chkAspectRatio" class="icon-Pi__lock" style="margin-left: 4px"></label>
                                            <span style="font-size: 11px">Aspect Ratio</span>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <!-- 
                        Here we have defined the tab content for label tab. In which we have exposed a features to customize the label appearance at runtime.
                    -->
                    <div id="textprop">
                        <div style="margin-left: -11px">
                            <div>
                                <div>
                                    <label class="tab-label">Text</label>
                                </div>
                            </div>
                            <table style="margin-top: 20px;">
                                <tr>
                                    <td>
                                        <!-- 
                                            The below elements created to represent the label's fontColor with visual representation and change the label's fontColor at runtime.
                                            1. Here "labelFontIcon" element is used to represent the label's fontColor with visual representation.
                                            2. The "fontColor" element is an dropdown control and its used to change the node fill color at runtime.
                                        -->
                                        <div data-bind="style: { backgroundColor: labelFontBackgroundColor }" style="margin-left: 5px" class="ddl-custom-icon-parent"
                                            onmouseover="MouseEnterOnDiv(this,'fontColor','icon-Pi__Fill')" onmouseout="MouseLeaveFromDiv(this,'fontColor','icon-Pi__Fill')">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <div style="margin-top: 8px; margin-left: -1px;">
                                                            <!-- The cssClass "icon-Pi__Fill" is used to set the svg font-icon as background image. -->
                                                            <span id="labelFontIcon" class="icon-Pi__Fill" style="font-size: 25px; margin-left: 8px; border: 1px solid #bbbcbb;" data-bind="style: { color: labelFontColor }"></span>
                                                        </div>
                                                        <div style="margin-top: -33px">
                                                            <!-- The below element is used to represent the dropdown expand option and its appearance customized via KO binding. -->
                                                            <span class="icon-Pi__Button-Corner" data-bind="style: { color: labelFontBorderColor }" />
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="ddl-custom-text">
                                                            <!-- Create the dropdown control for fillColor option. -->
                                                            <ej:DropDownList ID="fontColor" runat="server" PopupHeight="420px" ClientSideOnPopupShown="popupShown" ClientSideOnPopupHide="popupHide"
                                                                CssClass="ddl-color-palette ddl-custom" />
                                                        </div>
                                                        <div style="margin-left: 8px">
                                                            <!-- Create the element to descripe the above control functionalilty via text. -->
                                                            <label style="font-size: 11px; font-weight: normal">Text</label>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                    <td>
                                        <!-- 
                                            The below elements created to represent the label's bold state with visual representation.
                                            1. Here "boldIcon" element is used to represent the node's state with visual representation.
                                        -->
                                        <div data-bind="style: { backgroundColor: boldBackgroundColor }" style="margin-left: 22px;" class="ddl-custom-icon-parent"
                                            onmousedown="PropertyChangesFromPanel(this, 'bold')" onmouseover="MouseEnterOnDiv(this,'bold','icon-Pi__Bold')" onmouseout="MouseLeaveFromDiv(this,'bold','icon-Pi__Bold')">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <div style="margin-top: 10px; margin-left: 3px;">
                                                            <span id="boldIcon" class="icon-Pi__Bold ddl-custom-icon" data-bind="style: { color: boldFontColor }"></span>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div style="margin-top: 8px; margin-left: 8px">
                                                            <label style="font-size: 11px; font-weight: normal">Bold</label>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                    <td>
                                        <!-- 
                                            The below elements created to represent the label's italic state with visual representation.
                                            1. Here "italicIcon" element is used to represent the label's italic state with visual representation.
                                        -->
                                        <div data-bind="style: { backgroundColor: italicBackgroundColor }" style="margin-left: 22px;" class="ddl-custom-icon-parent"
                                            onmousedown="PropertyChangesFromPanel(this, 'italic')" onmouseover="MouseEnterOnDiv(this,'italic','icon-Pi__Italic')" onmouseout="MouseLeaveFromDiv(this,'italic','icon-Pi__Italic')">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <div style="margin-top: 10px; margin-left: 3px;">
                                                            <span id="italicIcon" class="icon-Pi__Italic ddl-custom-icon" data-bind="style: { color: italicFontColor }"></span>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div style="margin-top: 6px; margin-left: 8px">
                                                            <label style="font-size: 11px; font-weight: normal">Italic</label>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            <table style="margin-top: 20px">
                                <tr>
                                    <td>
                                        <div style="margin-top: 30px; margin-left: 10px">
                                            <label style="font-weight: normal">Font</label>
                                        </div>
                                    </td>
                                    <td>
                                        <div style="margin-top: 25px; margin-left: 10px">
                                            <!-- The below element is created as dropdown control and its used to update the label's fontStyle at run time. -->
                                            <ej:DropDownList ID="fontStyle" ClientSideOnChange="propertyPannelChange" CssClass="fontStyleDiv ddl-standard" runat="server" PopupHeight="300px">
                                            </ej:DropDownList>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            <table>
                                <tr>
                                    <td>
                                        <div style="margin-top: 30px; margin-left: 10px">
                                            <label style="font-weight: normal">Size</label>
                                        </div>
                                    </td>
                                    <td>
                                        <div style="margin-top: 25px; margin-left: 15px">
                                            <!-- The below element is created as dropdown control and its used to update the label's fontSize at run time. -->
                                            <ej:DropDownList ID="fontSize" ClientSideOnChange="propertyPannelChange" CssClass="fontSizeDiv ddl-standard" runat="server" Width="55px" PopupHeight="280px">
                                            </ej:DropDownList>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            <div>
                                <div style="margin-top: 20px">
                                    <label class="tab-label">Align</label>
                                </div>
                            </div>
                            <table style="margin-top: 15px">
                                <!-- 
                                    The below elements (leftAlignIcon, rightAlignIcon, centerAlignIcon) is created to represent the label's text alignement value with visual representation.
                                -->
                                <tr>
                                    <td>
                                        <div data-bind="style: { backgroundColor: textLeftAlignBackgroundColor }" style="margin-left: 5px" class="ddl-custom-icon-parent"
                                            onmousedown="PropertyChangesFromPanel(this, 'left')" onmouseover="MouseEnterOnDiv(this,'left','icon-Pi__Text-LeftAlgin')" onmouseout="MouseLeaveFromDiv(this,'left','icon-Pi__Text-LeftAlgin')">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <div style="margin-top: 10px; margin-left: 3px;">
                                                            <span id="leftAlignIcon" class="icon-Pi__TextLeftAlgin ddl-custom-icon" data-bind="style: { color: textLeftAlignFontColor }"></span>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                    <td>
                                        <div data-bind="style: { backgroundColor: textCenterAlignBackgroundColor }" style="margin-left: 22px;" class="ddl-custom-icon-parent"
                                            onmousedown="PropertyChangesFromPanel(this, 'center')" onmouseover="MouseEnterOnDiv(this,'center','icon-Pi__Text-CenterAlgin')" onmouseout="MouseLeaveFromDiv(this,'center','icon-Pi__Text-CenterAlgin')">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <div style="margin-top: 10px; margin-left: 3px;">
                                                            <span id="centerAlignIcon" class="icon-Pi__TextCenterAlgin ddl-custom-icon" data-bind="style: { color: textCenterAlignFontColor }"></span>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                    <td>
                                        <div data-bind="style: { backgroundColor: textRightAlignBackgroundColor }" style="margin-left: 22px;" class="ddl-custom-icon-parent"
                                            onmousedown="PropertyChangesFromPanel(this, 'right')" onmouseover="MouseEnterOnDiv(this,'right','icon-Pi__TextRightAlgin')" onmouseout="MouseLeaveFromDiv(this,'right','icon-Pi__TextRightAlgin')">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <div style="margin-top: 10px; margin-left: 3px;">
                                                            <span id="rightAlignIcon" class="icon-Pi__TextRightAlgin ddl-custom-icon" data-bind="style: { color: textRightAlignFontColor }"></span>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <!-- 
                        Here we have defined the tab content for connector tab. In which we have exposed a features to customize the label appearance at runtime.
                    -->
                    <div id="lineprop" class="">
                        <div style="margin-left: -11px">
                            <div>
                                <div>
                                    <label class="tab-label">Connector</label>
                                </div>
                            </div>
                            <table style="margin-top: 20px;">
                                <tr>
                                    <td>
                                        <!-- 
                                            The below elements created to represent the connector's lineColor with visual representation and change the connector's lineColor at runtime.
                                            1. Here "lineFillIcon" element is used to represent the connector's lineColor with visual representation.
                                            2. The "lineColor" element is an dropdown control and its used to change the node fill color at runtime.
                                        -->
                                        <div data-bind="style: { backgroundColor: lineBackgroundColor }" style="margin-left: 5px;" class="ddl-custom-icon-parent"
                                            onmouseover="MouseEnterOnDiv(this,'lineColor','icon-Pi__Fill')" onmouseout="MouseLeaveFromDiv(this,'lineColor','icon-Pi__Fill')">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <div style="margin-top: 8px; margin-left: -1px;">
                                                            <!-- The cssClass "icon-Pi__Fill" is used to set the svg font-icon as background image. -->
                                                            <span id="lineFillIcon" class="icon-Pi__Fill" style="font-size: 25px; margin-left: 8px; border: 1px solid #bbbcbb;" data-bind="style: { color: lineColor }"></span>
                                                        </div>
                                                        <div style="margin-top: -33px">
                                                            <!-- The below element is used to represent the dropdown expand option. -->
                                                            <span class="icon-Pi__Button-Corner" data-bind="style: { color: lineBorderColor }" />
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="ddl-custom-text">
                                                            <!-- Create the dropdown control for lineColor option. -->
                                                            <ej:DropDownList ID="lineColor" runat="server" PopupHeight="420px" ClientSideOnPopupShown="popupShown" ClientSideOnPopupHide="popupHide"
                                                                CssClass="ddl-color-palette ddl-custom" ClientSideOnCreate="ddlColorCreate" />
                                                        </div>
                                                        <div style="margin-left: -6px">
                                                            <!-- Create the element to descripe the above control functionalilty via text. -->
                                                            <label style="font-size: 11px; font-weight: normal">Line Color</label>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                    <td>
                                        <!-- 
                                            The below elements created to represent the connector's lineType with visual representation and change the connector's lineType at runtime.
                                            1. Here "lineTypeIcon" element is used to represent the connector's lineType with visual representation.
                                            2. The "lineType" element is an dropdown control and its used to change the node fill color at runtime.
                                        -->
                                        <div data-bind="style: { backgroundColor: lineTypeBackgroundColor }" style="margin-left: 22px;" class="ddl-custom-icon-parent"
                                            onmouseover="MouseEnterOnDiv(this,'line','icon-Pi__Connector1')" onmouseout="MouseLeaveFromDiv(this,'line','icon-Pi__Connector1')">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <div style="margin-top: 9px; margin-left: 3px;">
                                                            <!-- 
                                                                1. The below span element will be represented as image and the image will be svg font icon..
                                                                2. The cssClass "icon-Pi__LineWidth" is used to set the svg font-icon as background image.
                                                            -->
                                                            <span id="lineTypeIcon" class="icon-Pi__Connector1 ddl-custom-icon" data-bind="style: { color: lineTypeFontColor }"></span>
                                                        </div>
                                                        <div style="margin-top: -31px; margin-left: 1px;">
                                                            <!-- The below element is used to represent the dropdown expand option.-->
                                                            <span class="icon-Pi__Button-Corner" data-bind="style: { color: lineTypeBorderColor }" />
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="ddl-custom-text">
                                                            <!-- Create the dropdown control for borderWidth option. -->
                                                            <ej:DropDownList ID="lineType" runat="server" TargetID="lineTypeDiv" Width="125px" ClientSideOnSelect="propertyPannelChange" ClientSideOnPopupHide="popupHide"
                                                                ClientSideOnPopupShown="popupShown" CssClass="ddl-custom">
                                                            </ej:DropDownList>
                                                            <!-- 
                                                                The below element will be set as targetID for drop down list control. Please refer the "lineType" initialization in control.js file 
                                                                We can able to achieve this option using template feature available in drop down control. We have already used the template option for color palette 
                                                                related dropdown controls.
                                                                But its not used in multiple places, we have defined the element here and set this as a target for dropdown list control.
                                                            -->
                                                            <div id="lineTypeDiv" style="background-color: red">
                                                                <ul>
                                                                    <!-- 
                                                                        The cssClass icon-* is used to set the svg font icon as a background image for each element.
                                                                     -->
                                                                    <li>
                                                                        <div style="margin-top: 5px; float: none">
                                                                            <span class="icon-Con__Stright" />
                                                                            <label>Straight</label>
                                                                        </div>
                                                                    </li>
                                                                    <li>
                                                                        <div style="margin-top: 5px; float: none">
                                                                            <span class="icon-Con__Bezier" />
                                                                            <label>Bezier</label>
                                                                        </div>
                                                                    </li>
                                                                    <li>
                                                                        <div style="margin-top: 5px; float: none">
                                                                            <span class="icon-Con__Orthogonal" />
                                                                            <label>Orthogonal</label>
                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div style="margin-top: 1px; margin-left: 10px;">
                                                            <!-- Create the element to descripe the above functionalilty via text. -->
                                                            <label style="font-size: 11px; font-weight: normal">Type</label>
                                                        </div>
                                                    </td>

                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                    <td>
                                        <!-- 
                                            The below elements created to represent the connector's lineWidth with visual representation.
                                            1. Here "lineWidthIcon" element is used to represent the connector's lineWidth with visual representation.
                                            2. The "lineWidth" element is an dropdown control and its used to change the connector's lineWidth at runtime.
                                        -->
                                        <div data-bind="style: { backgroundColor: lineWidthBackgroundColor }" style="margin-left: 22px;" class="ddl-custom-icon-parent"
                                            onmouseover="MouseEnterOnDiv(this,'lineWidth','icon-Pi__Line-Width')" onmouseout="MouseLeaveFromDiv(this,'lineWidth','icon-Pi__Line-Width')">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <div style="margin-top: 9px; margin-left: 3px;">
                                                            <!-- 
                                                                1. The below span element will be represented as image and the image will be svg font icon..
                                                                2. The cssClass "icon-Pi__LineWidth" is used to set the svg font-icon as background image.
                                                              -->
                                                            <span id="lineWidthIcon" class="icon-Pi__LineWidth ddl-custom-icon" data-bind="style: { color: lineWidthFontColor }"></span>
                                                        </div>
                                                        <div style="margin-top: -31px; margin-left: 1px;">
                                                            <!-- The below element is used to represent the dropdown expand option. -->
                                                            <span class="icon-Pi__Button-Corner" data-bind="style: { color: lineWidthBorderColor }" />
                                                        </div>

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="ddl-custom-text">
                                                            <!-- Create the dropdown control for lineWidth option. -->
                                                            <ej:DropDownList ID="lineWidth" runat="server" PopupHeight="320px" ClientSideOnPopupShown="popupShown" ClientSideOnPopupHide="popupHide"
                                                                CssClass="lineWidthDiv ddl-custom" ClientSideOnSelect="propertyPannelChange" />
                                                        </div>
                                                        <div style="margin-left: -2px">
                                                            <!-- Create the element to descripe the above control functionalilty via text. -->
                                                            <label style="font-size: 11px; font-weight: normal">Thickness</label>
                                                        </div>
                                                    </td>

                                                </tr>
                                            </table>
                                        </div>

                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <!-- 
                                            The below elements created to represent the connector's HeadDecorator with visual representation and change the connector's HeadDecorator at runtime.
                                            1. Here "headDecoratorIcon" element is used to represent the connector's HeadDecorator with visual representation.
                                            2. The "headDecorator" element is an dropdown control and its used to change the connector's HeadDecorator at runtime.
                                        -->
                                        <div data-bind="style: { backgroundColor: decoratorBackgroundColor }" style="margin-left: 5px; margin-top: 40px" class="ddl-custom-icon-parent"
                                            onmouseover="MouseEnterOnDiv(this,'headDecorator','icon-Pi__Head')" onmouseout="MouseLeaveFromDiv(this,'headDecorator','icon-Pi__Head')">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <div style="margin-top: 9px; margin-left: 3px;">
                                                            <!-- 
                                                                1. The below span element will be represented as image and the image will be svg font icon..
                                                                2. The cssClass "icon-Pi__Head" is used to set the svg font-icon as background image.
                                                              -->
                                                            <span id="headDecoratorIcon" class="icon-Pi__Head ddl-custom-icon" data-bind="style: { color: decoratorFontColor }"></span>
                                                        </div>
                                                        <div style="margin-top: -31px; margin-left: 1px;">
                                                            <!-- The below element is used to represent the dropdown expand option.-->
                                                            <span class="icon-Pi__Button-Corner" data-bind="style: { color: decoratorBorderColor }" />
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="ddl-custom-text">
                                                            <!-- Create the dropdown control for connector's headDecorator customization. -->
                                                            <ej:DropDownList ID="headDecorator" runat="server" TargetID="headDecoratorDiv" Width="60px" PopupHeight="350px"
                                                                ClientSideOnSelect="propertyPannelChange" ClientSideOnPopupShown="popupShown" ClientSideOnPopupHide="popupHide" CssClass="ddl-custom" />
                                                            <!-- 
                                                                The below element will be set as targetID for drop down list control. Please refer the "headDecorator" initialization in control.js file 
                                                                Here, the list of span element will represent the different type of decorator option as image (svg-font-icon) and its defined in style.css file.
                                                            -->
                                                            <div id="headDecoratorDiv">
                                                                <ul>
                                                                    <li>
                                                                        <span class="icon-Con__Line decorator-icon" />
                                                                    </li>
                                                                    <li>
                                                                        <span class="icon-Con__HeadArrow-fill decorator-icon" />
                                                                    </li>
                                                                    <li>
                                                                        <span class="icon-Con__Headsguer-fill-10 decorator-icon" />
                                                                    </li>
                                                                    <li>
                                                                        <span class="icon-Con__Headsguer-fill-11 decorator-icon" />
                                                                    </li>

                                                                    <li>
                                                                        <span class="icon-Con__HeadArrow2-fill decorator-icon" />
                                                                    </li>
                                                                    <li>
                                                                        <span class="icon-Con__HeadArrow-line decorator-icon" />
                                                                    </li>
                                                                    <li>
                                                                        <span class="icon-Con__Headsguer-line decorator-icon" />
                                                                    </li>
                                                                    <li>
                                                                        <span class="icon-Con__Headround-line decorator-icon" />
                                                                    </li>
                                                                    <li>
                                                                        <span class="icon-Con__HeadArrow2-line decorator-icon" />
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div style="margin-left: 8px">
                                                            <label style="font-size: 11px; font-weight: normal;">Head</label>
                                                        </div>
                                                    </td>

                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                    <td>
                                        <!-- 
                                            The below elements created to represent the connector's borderDashArray with visual representation and change the connector's borderDashArray at runtime.
                                            1. Here "lineStyleIcon" element is used to represent the connector's HeadDecorator with visual representation.
                                            2. The "lineStyle" element is an dropdown control and its used to change the connector's HeadDecorator at runtime.
                                        -->
                                        <div data-bind="style: { backgroundColor: lineStyleBackgroundColor }" style="margin-left: 22px; margin-top: 40px" class="ddl-custom-icon-parent"
                                            onmouseover="MouseEnterOnDiv(this,'lineStyle','icon-Pi__Line-Style')" onmouseout="MouseLeaveFromDiv(this,'lineStyle','icon-Pi__Line-Style')">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <div style="margin-top: 10px; margin-left: 3px;">
                                                            <!-- 
                                                                1. The below span element will be represented as image and the image will be svg font icon..
                                                                2. The cssClass "icon-Pi__LineStyle" is used to set the svg font-icon as background image.
                                                             -->
                                                            <span id="lineStyleIcon" class="icon-Pi__LineStyle ddl-custom-icon" data-bind="style: { color: lineStyleFontColor }"></span>
                                                        </div>
                                                        <div style="margin-top: -32px; margin-left: 1px;">
                                                            <!-- The below element is used to represent the dropdown expand option.-->
                                                            <span class="icon-Pi__Button-Corner" data-bind="style: { color: lineStyleBorderColor }" />
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="ddl-custom-text">
                                                            <!-- Create the dropdown control for connector's borderDashArray customization. -->
                                                            <ej:DropDownList ID="lineStyle" runat="server" TargetID="lineStyleDiv" Width="125px"
                                                                ClientSideOnSelect="propertyPannelChange" ClientSideOnPopupShown="popupShown" ClientSideOnPopupHide="popupHide" CssClass="ddl-custom" />
                                                            <!-- 
                                                                The below element will be set as targetID for drop down list control. Please refer the "lineStyle" initialization in control.js file 
                                                                Here, the list of span element will represent the different type of border dash array as image (svg-font-icon) and its defined in style.css file.
                                                            -->

                                                            <div id="lineStyleDiv" style="background-color: red">
                                                                <ul>
                                                                    <li>
                                                                        <span class="icon-Line_Basic" />
                                                                    </li>
                                                                    <li>
                                                                        <span class="icon-Line_Dash" />
                                                                    </li>
                                                                    <li>
                                                                        <span class="icon-Line_Dot" />
                                                                    </li>
                                                                    <li>
                                                                        <span class="icon-Line_Stylish" />
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div style="margin-left: -4px">
                                                            <label style="font-size: 11px; font-weight: normal">Line Style</label>
                                                        </div>
                                                    </td>

                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                    <td>
                                        <!-- Like HeadDecorator, here we creating the element to cusomize the connector's TailDecorator -->
                                        <div data-bind="style: { backgroundColor: decoratorBackgroundColor }" style="margin-left: 22px; margin-top: 40px" class="ddl-custom-icon-parent"
                                            onmouseover="MouseEnterOnDiv(this,'tailDecorator','icon-Pi__Tail')" onmouseout="MouseLeaveFromDiv(this,'tailDecorator','icon-Pi__Tail')">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <div style="margin-top: 10px; margin-left: 3px;">
                                                            <span class="icon-Pi__Tail ddl-custom-icon" data-bind="style: { color: decoratorFontColor }"></span>
                                                        </div>
                                                        <div style="margin-top: -32px; margin-left: 1px;">
                                                            <span class="icon-Pi__Button-Corner" data-bind="style: { color: decoratorBorderColor }" />
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="ddl-custom-text">
                                                            <ej:DropDownList ID="tailDecorator" runat="server" TargetID="tailDecoratorDiv" Width="60px" PopupHeight="350px"
                                                                ClientSideOnSelect="propertyPannelChange" ClientSideOnPopupShown="popupShown" ClientSideOnPopupHide="popupHide" CssClass="ddl-custom" />
                                                            <div id="tailDecoratorDiv">
                                                                <ul>
                                                                    <li>
                                                                        <span class="icon-Con__Line decorator-icon" />
                                                                    </li>
                                                                    <li>
                                                                        <span class="icon-Con__TailArrow-fill decorator-icon" />
                                                                    </li>
                                                                    <li>
                                                                        <span class="icon-Con__Tailsguer-fill-10 decorator-icon" />
                                                                    </li>
                                                                    <li>
                                                                        <span class="icon-Con__Tailsguer-fill-11 decorator-icon" />
                                                                    </li>
                                                                    <li>
                                                                        <span class="icon-Con__TailArrow2-fill decorator-icon" />
                                                                    </li>
                                                                    <li>
                                                                        <span class="icon-Con__TailArrow-line decorator-icon" />
                                                                    </li>
                                                                    <li>
                                                                        <span class="icon-Con__Tailsguer-line decorator-icon" />
                                                                    </li>
                                                                    <li>
                                                                        <span class="icon-Con__Tailround-line decorator-icon" />
                                                                    </li>
                                                                    <li>
                                                                        <span class="icon-Con__TailArrow2-line decorator-icon" />
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div style="margin-left: 13px">
                                                            <label style="font-size: 11px; font-weight: normal">Tail</label>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                             <table style ="margin-top: 12px">
                                <tr>
                                    <td>
                                        <div style="margin-top: 30px; margin-left: 10px">
                                            <label style="font-weight: normal; font-size: 12px;">Corner Radius</label>
                                        </div>
                                    </td>
                                    <td>
                                        <div style="margin-top: 25px; margin-left: 10px">
                                            <!-- The below element is created as numeric text box and its used to update the connector corner radius at run time. -->
                                            <ej:NumericTextBox ID="cornerradius" Value="8" CssClass="cornerRadiusDiv" Width="75px" MaxValue="100" MinValue="0" ClientSideOnChange="propertyPannelChange" runat="server"></ej:NumericTextBox>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>

                </div>

            </div>

        </div>
        <div class="diagram-dialog" style="display: none">
            <ej:Dialog ID="openFileDialog" runat="server" Title="Open" ShowOnInit="false" EnableModal="true" ClientSideOnClose="onDialogClose" Width="350" Height="400">
                <DialogContent>
                    <div id="parent_tree">
                        <!-- The below element is created to represent the saved diagram like file tree. -->
                        <ul id="savedDiagramList"></ul>
                    </div>
                    <div style="height: 30px; margin-left: -16px; margin-top: 13px; width: 100%;">
                        <input type="button" id="btnFileOpen" onclick="loadDiagram()" value="Open" style="background-color: #28B1BF; border: medium none; color: #FFFFFF; font-family: Segoe UI; font-size: 16px; height: 29px; margin-left: 130px; width: 90px;" />
                    </div>
                </DialogContent>
            </ej:Dialog>
            <ej:Dialog ID="confirmDialog" Title="Save" runat="server" ShowOnInit="false" EnableModal="true" ClientSideOnClose="onDialogClose" Width="451">
                <DialogContent>
                    <div style="margin-left: 12px; margin-top: 12px; text-align: center">
                        <div style="height: 30px; width: 100%; font-size: 16px;">
                            Do you want to save the changes?
                        </div>
                        <div style="height: 40px; margin-bottom: 6px; margin-top: 11px; width: 100%;">
                            <input type="button" id="btnYes" onclick="saveDiagram('', true)" value="Yes" style="background-color: #28B1BF; border: medium none; color: #FFFFFF; font-family: Segoe UI; font-size: 16px; height: 29px; margin-left: 50px; width: 90px;" />
                            <input type="button" id="btnNo" onclick="clearDiagram()" value="No" style="background-color: #28B1BF; border: medium none; color: #FFFFFF; font-family: Segoe UI; font-size: 16px; height: 29px; margin-right: 50px; margin-left: 10px; margin-top: auto; width: 90px;" />
                        </div>
                    </div>
                </DialogContent>
            </ej:Dialog>

            <ej:Dialog ID="saveDialog" runat="server" Title="Save" ShowOnInit="false" EnableModal="true" ClientSideOnClose="onDialogClose" Width="451">
                <DialogContent>
                    <div style="height: 30px; width: 100%; font-size: 16px;">
                        File Name
                    </div>
                    <div style="border: 1px solid #D3D1D1; height: 30px; width: 100%;">
                        <input type="text" id="txtFileName" value="" style="margin-top: 2px; margin-left: 6px; width: 390px; height: 23px; border: none; outline: none;" />
                    </div>
                    <div style="height: 30px; margin-bottom: 6px; margin-top: 11px; width: 100%;">
                        <input type="button" id="btnSave" onclick="saveFileAsString()" value="Save" style="background-color: #28B1BF; border: medium none; color: #FFFFFF; font-family: Segoe UI; font-size: 16px; height: 29px; margin-left: 152px; width: 90px;" />
                    </div>
                </DialogContent>
            </ej:Dialog>


            <ej:Dialog ID="exportDialog" runat="server" ShowOnInit="false" EnableModal="true" ClientSideOnClose="onDialogClose" Width="400" Title="Export">
                <DialogContent>
                    <table style="margin-left: 12px;">
                        <tr style="height: 40px">
                            <td style="vertical-align: central">
                                <div style="width: 100%; font-size: 16px; margin-right: 60px">
                                    File Name
                                </div>
                            </td>
                            <td style="vertical-align: central">
                                <div style="border: 1px solid #D3D1D1;">
                                    <input type="text" id="txtExportFileName" value="Diagram" style="width: 200px;" />
                                </div>
                            </td>
                        </tr>
                        <tr style="height: 40px">
                            <td style="vertical-align: central">
                                <div style="height: 30px; width: 100%; font-size: 16px; margin-right: 60px">
                                    Format
                                </div>
                            </td>
                            <td style="vertical-align: central">
                                <div style="height: 30px; width: 200px">
                                    <ej:DropDownList ID="ddlExportFormat" ClientIDMode="Static" runat="server" SelectedItemIndex="0" PopupHeight="120px" Width="200px" Height="30px" CssClass="ddl-standard">
                                        <Items>
                                            <ej:DropDownListItem Text="JPG" Value="JPG"></ej:DropDownListItem>
                                            <ej:DropDownListItem Text="PNG" Value="PNG"></ej:DropDownListItem>
                                            <ej:DropDownListItem Text="BMP" Value="BMP"></ej:DropDownListItem>
                                            <ej:DropDownListItem Text="SVG" Value="SVG"></ej:DropDownListItem>
                                        </Items>
                                    </ej:DropDownList>
                                </div>
                            </td>

                        </tr>
                        <tr style="height: 40px">
                            <td style="vertical-align: central">
                                <div style="height: 30px; width: 100%; font-size: 16px; margin-right: 60px">
                                    Mode
                                </div>
                            </td>
                            <td style="vertical-align: central">
                                <div style="height: 30px; width: 200px">
                                    <ej:DropDownList ID="ddlExportMode" ClientIDMode="Static" Width="200px" Height="30px" runat="server" SelectedItemIndex="0" PopupHeight="60px" CssClass="ddl-standard">
                                        <Items>
                                            <ej:DropDownListItem Text="Content" Value="Content"></ej:DropDownListItem>
                                            <ej:DropDownListItem Text="PageSettings" Value="PageSettings"></ej:DropDownListItem>
                                        </Items>
                                    </ej:DropDownList>
                                </div>
                            </td>
                        </tr>
                        <tr style="height: 40px">
                            <td></td>
                            <td style="vertical-align: central">
                                <div style="height: 30px; width: 100%; margin-right: 60px">
                                    <input type="button" id="btnExportDiagram" onclick="exportDiagram()" value="Export" style="background-color: #28B1BF; border: medium none; color: #FFFFFF; font-family: Segoe UI; font-size: 16px; height: 29px; width: 90px;" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </DialogContent>
            </ej:Dialog>


            <div id="symbolPalette_Parent_Mini" style="display: none">
                <!-- The below element is created to show if no objects were found during filtering time. -->
                <div id="no_match_found" style="height: 30px; width: 100%; display: block; text-align: center;">
                    <div style="height: 6px; width: 100%;"></div>
                    <span style="font-size: 13px; font-style: italic; height: 30px;">No matches found..</span>
                </div>
                <!-- 
                    The below element is created to display the filtered shapes. Its an another symbol palette created for this filtered option.
                    you can refer this initialization at control.js file.
                -->
                <ej:SymbolPalette ID="searchPalette" runat="server"></ej:SymbolPalette>

            </div>
            <div id="Overview-div" class="Overview-div" style="width: 253px; float: left; display: none">
                <ej:Overview ID="Overview" runat="server" Height="158px" Width="254px" SourceID="DiagramContent"></ej:Overview>
                <table>
                    <tr>
                        <td><span class="sliderValue" style="margin-right: 7px">100%</span></td>
                        <td>
                            <ej:Slider ID="overviewSlider" runat="server" Height="8px" Width="205px" MinValue="100" MaxValue="3000" Value="100" ClientSideOnChange="OnChange" ClientSideOnSlide="OnChange" ClientSideOnCreate="OnCreate"></ej:Slider>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </form>


    <style type="text/css">
        .svg-rotate-ie:hover {
            cursor: url("../Content/ejthemes/common-images/diagram/Rotate.cur"),default;
        }

        .svg-rotate {
            cursor: url("../Content/ejthemes/common-images/diagram/Rotate.cur"),default;
        }
    </style>
</body>
</html>
