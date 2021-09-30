<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdaptiveRibbon.aspx.cs" MetaDescription="This example shows how the ASP.NET Web Forms Ribbon adapts to mobile devices." Inherits="WebSampleBrowser.Ribbon.AdaptiveRibbon" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Content/ejthemes/ej.widgets.core.min.css" rel="stylesheet" />
    <link href="../Content/ejthemes/flat-lime/ej.theme.min.css" rel="stylesheet" />
    <link href="../Content/sampleBrowserSite.css" rel="stylesheet" />
    <link href="../Content/ejthemes/responsive-css/ej.responsive.css" rel="stylesheet" />
    <link href="../Content/sampleBrowserSite-responsive.css" rel="stylesheet" />
    <link href="../Content/SourceTabFormatter.css" rel="stylesheet" />
    <!--[if lt IE 9]>
    <script src="../scripts/jquery-1.11.3.min.js"></script>
    <![endif]-->
    <!--[if gte IE 9]><!-->
    <script src="../scripts/jquery-3.4.1.min.js"></script>
    <!--<![endif]-->
    <script src="../Scripts/jquery.easing-1.3.min.js"></script>
    <script src="../Scripts/jquery.globalize.min.js"></script>
    <script src="../Scripts/jquery.validate.min.js"></script>
    <script src="../Scripts/jsrender.min.js"></script>
    <script src="../Scripts/ej.web.all.min.js"></script>
    <link href="../Content/ejthemes/ribbon-css/ej.icons.css" rel="stylesheet" />
    <style type="text/css">
       
	    .e-ribbon .e-icon.e-Print:before {
            font-family: 'ej-ribbonfont';
            content: "\e93b";
            font-size: 32px !important;
            text-indent: -5px;
            top: 4px !important;
        }

        .e-ribbon .e-icon.e-Equation:before {
            font-family: 'ej-ribbonfont';
            content: "\e90a";
            font-size: 32px;
            text-indent: -6px;
        }
  .e-ribbon .e-icon.e-Table:before {
            font-family: 'ej-ribbonfont';
			font-size: 24px !important;
            content: "\e913";
            text-indent: 1px;
			top :9px !important;
        }
        .e-ribbon .e-icon.e-Hyperlink:before {
            font-family: 'ej-ribbonfont';
            content: "\e909";
            font-size: 32px;
            text-indent: -6px;
        }

        .e-ribbon .e-icon.e-Comments:before {
            font-family: 'ej-ribbonfont';
            content: "\e908";
            font-size: 32px;
            text-indent: -6px;
        }

        .e-ribbon .e-icon.e-Illustrations:before {
            font-family: 'ej-ribbonfont';
            content: "\e93f";
            font-size: 32px;
            text-indent: -6px;
        }

        .e-ribbon.e-responsive .e-Clipboard:before {
            font-family: 'ej-ribbonfont';
            content: "\e90c";
            font-size: 32px !important;
            text-indent: -6px;
            top: 5px !important;
        }

        .e-ribbon.e-responsive .e-Alignment:before {
            font-family: 'ej-ribbonfont';
            content: "\e910";
            font-size: 32px;
            text-indent: -1px;
            top:10px !important;
        }
    .e-ribbon .e-Font:before {
         font-family: 'ej-ribbonfont';
         content: "\e90e";
		top:7px !important;
		 text-indent: -2px;
		}
		  .e-ribbon .e-Actions:before {
            font-family: 'ej-ribbonfont';
            content: "\e949";
            font-size: 28px;
            line-height: 32px;
            text-indent: -1.5px;
        }

        .e-ribbon .e-New:before {
            font-family: 'ej-ribbonfont';
            content: "\e90b";
            font-size: 32px !important;
            line-height: 32px;
            text-indent: -5.5px !important;
        }

        .e-blank {
            background-image: url("../content/ejthemes/common-images/ribbon/blank.png");
        }

        .e-project {
            background-image: url("../content/ejthemes/common-images/ribbon/Project.png");
        }

        .e-gantt {
            background-image: url("../content/ejthemes/common-images/ribbon/Gantt.png");
        }

        .e-diet {
            background-image: url("../content/ejthemes/common-images/ribbon/Diet.png");
        }

        .e-sales {
            background-image: url("../content/ejthemes/common-images/ribbon/Sales.png");
        }

        .e-infopageicon {
            background-repeat: no-repeat;
            height: 150px;
            width: 198px;
        }

        .e-accuser {
            background-image: url("../content/ejthemes/common-images/ribbon/User.jpg");
        }

        .e-protect {
            background-image: url("../content/ejthemes/common-images/ribbon/Protect.png");
        }

        .e-browser {
            background-image: url("../content/ejthemes/common-images/ribbon/Browser.png");
        }

        .e-check {
            background-image: url("../content/ejthemes/common-images/ribbon/Check.png");
        }

        .e-version {
            background-image: url("../content/ejthemes/common-images/ribbon/Version.png");
        }

        .e-newpageicon {
            background-repeat: no-repeat;
            height: 42px;
            width: 42px;
        }

        .e-ribbon .e-ribbonbackstagepage .e-bsinfobtnstyle {
            font-family: segoe ui;
            border: 1px solid #c9c9c9;
            background: #fdfdfd;
            color: #212121;
        }

        .e-ribbon .e-ribbonbackstagepage .e-bsnewbtnstyle {
            font-family: segoe ui;
            color: #212121;
            background: #fdfdfd;
            margin-top: 20px;
        }

            .e-ribbon .e-ribbonbackstagepage .e-bsinfobtnstyle:hover,
            .e-ribbon .e-ribbonbackstagepage .e-bsnewbtnstyle:hover {
                color: black;
            }

        .e-bssplbtn1 .e-split-btn-div {
            text-indent: 40px;
            top: 64px;
        }

        .e-bssplbtn2 .e-split-btn-div {
            text-indent: 26px;
            top: 64px;
        }

        .e-bssplbtn3 .e-split-btn-div {
            text-indent: 34px;
            top: 64px;
        }

        .e-bsinfobtnstyle .e-btntxt {
            font-size: 14px;
        }

        .e-bssplbtn1 .e-btntxt, .e-bssplbtn2 .e-btntxt {
            position: relative;
            left: -6px;
        }

        .e-bssplbtn3 .e-btntxt {
            position: relative;
            left: -8px;
        }

        .e-suggestsearch a {
            padding-left: 7px;
        }

        .e-author {
            color: #939393;
        }

        .e-ribbonbackstagepage, .e-inspectcon {
            color: #565656;
        }

        .e-bsptitle {
            color: #000000;
        }

        .e-infoprop {
            color: #0072c6;
        }

        .e-inspectli {
            color: #aaaaaa;
        }

        .e-bssplbtn2 .e-newpageicon, .e-bssplbtn3 .e-newpageicon {
            position: relative;
            left: -5px;
        }

        .darktheme .e-ribbon .e-bsinfobtnstyle {
            font-family: segoe ui;
            border: 1px solid #303030;
            background: #1f1f1f;
            color: #c1c1c1;
        }

        .darktheme .e-ribbon .e-bsnewbtnstyle {
            font-family: segoe ui;
            background: #1f1f1f;
            color: #c1c1c1;
        }

        .e-openCon table tr {
            height: 50px;
            border-bottom: 1px solid #c8c8c8;
        }

        #accountCon {
            padding: 0 10px;
        }

        .e-contenteditor {
            width: 100%;
            height: 180px;
            border: 0px solid #D9DFDE;
            border-top: 0;
            overflow: auto;
        }

            .e-contenteditor p {
                margin: 20px;
            }
    </style>
</head>



<body>

    <div>

        <form id="form1" runat="server">
            <asp:ScriptManager runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <ej:Ribbon ID="defaultRibbon" runat="server" Width="100%" Create="createControl" groupClick="groupClickControl" IsResponsive="true" ShowQAT="true">
                        <ApplicationTab Type="Backstage">
                            <BackstageSettings HeaderWidth="120" Text="FILE" Height="350" Width="1000">
                                <PageCollection>
                                    <ej:BackstagePage Id="Open" Text="Open" ItemType="Tab" ContentID="openCon" />
                                    <ej:BackstagePage Id="newtab" Text="New" ContentID="newCon" />
                                    <ej:BackstagePage Id="close" Text="Close" EnableSeparator="true" ItemType="Button" />
                                    <ej:BackstagePage Id="account" Text="Office Account" ContentID="accountCon" />
                                </PageCollection>
                            </BackstageSettings>
                        </ApplicationTab>
                        <RibbonTabs>
                            <ej:RibbonTab Id="home" Text="HOME">
                                <TabGroupCollection>
                                    <ej:TabGroup Text="Clipboard" AlignType="Rows">
                                        <ContentCollection>
                                            <ej:TabContent>
                                                <ContentGroupCollection>
                                                    <ej:ContentGroup Id="paste" Text="Paste">
                                                        <ButtonSettings Width="48" Height="72" ImagePosition="ImageTop" ContentType="TextAndImage" Type="Button" PrefixIcon="e-icon e-ribbon e-respaste" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="cut" Text="Cut">
                                                        <ButtonSettings Width="60" Height="72" ImagePosition="ImageTop" ContentType="TextAndImage" Type="Button" PrefixIcon="e-icon e-ribbon e-rescut" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="copy" Text="Copy">
                                                        <ButtonSettings Width="60" Height="72" ImagePosition="ImageTop" ContentType="TextAndImage" Type="Button" PrefixIcon="e-icon e-ribbon e-rescopy" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="clear" Text="Clear">
                                                        <ButtonSettings Width="60" Height="72" ImagePosition="ImageTop" ContentType="TextAndImage" Type="Button" PrefixIcon="e-icon e-ribbon e-resclearAll" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                </ContentGroupCollection>
                                            </ej:TabContent>
                                        </ContentCollection>
                                    </ej:TabGroup>
                                    <ej:TabGroup Text="Font" AlignType="Rows" EnableGroupExpander="true">
                                        <ContentCollection>
                                            <ej:TabContent>
                                                <ContentDefaults IsBig="false" />
                                                <ContentGroupCollection>
                                                    <ej:ContentGroup Id="bold" Text="Bold" Type="ToggleButton" IsMobileOnly="true">
                                                        <ToggleButtonSettings Width="48" Height="48" ContentType="ImageOnly" ActiveText="Bold" ActivePrefixIcon="e-ribbon e-icon e-resbold" DefaultPrefixIcon="e-ribbon e-icon e-resbold" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="italic" Text="Italic" Type="ToggleButton" IsMobileOnly="true">
                                                        <ToggleButtonSettings Width="48" Height="48" ContentType="ImageOnly" ActiveText="Italic" ActivePrefixIcon="e-ribbon e-icon e-resitalic" DefaultPrefixIcon="e-ribbon e-icon e-resitalic" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="underline" Text="Underline" Type="ToggleButton" IsMobileOnly="true">
                                                        <ToggleButtonSettings Width="48" Height="48" ContentType="ImageOnly" ActiveText="Underline" ActivePrefixIcon="e-ribbon e-icon e-resunderline" DefaultPrefixIcon="e-ribbon e-icon e-resunderline" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="strikethrough" Text="strikethrough" ToolTip="Strikethrough" IsMobileOnly="true" Type="ToggleButton">
                                                        <ToggleButtonSettings Width="48" Height="48" ContentType="ImageOnly" ActiveText="Strikethrough" ActivePrefixIcon="e-icon e-ribbon strikethrough" DefaultPrefixIcon="e-icon e-ribbon strikethrough" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="superscript" Text="superscript" IsMobileOnly="true" ToolTip="Superscript">
                                                        <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon e-superscripticon" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                </ContentGroupCollection>

                                            </ej:TabContent>
                                            <ej:TabContent>
                                                <ContentDefaults Height="28" Type="DropDownList" />
                                                <ContentGroupCollection>
                                                    <ej:ContentGroup Id="fontfamily" ToolTip="Font" Type="DropDownList">
                                                        <DropdownSettings Text="Segoe UI" Width="150" Select="executeAction"></DropdownSettings>
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="fontsize" ToolTip="FontSize" Type="DropDownList">
                                                        <DropdownSettings Text="1pt" Width="65" Select="executeAction"></DropdownSettings>
                                                    </ej:ContentGroup>
                                                </ContentGroupCollection>
                                            </ej:TabContent>
                                        </ContentCollection>
                                    </ej:TabGroup>
                                    <ej:TabGroup Text="Actions" AlignType="Rows">
                                        <ContentCollection>
                                            <ej:TabContent>
                                                <ContentDefaults Type="Button" Width="74" />
                                                <ContentGroupCollection>
                                                    <ej:ContentGroup Id="redo" Text="Redo" QuickAccessMode="ToolBar">
                                                        <ButtonSettings Height="72" ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-ribbon e-icon e-resredo" Type="Button" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="undo" Text="Undo" IsBig="false" QuickAccessMode="ToolBar">
                                                        <ButtonSettings Height="72" ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-ribbon e-icon e-resundo" Type="Button" />
                                                    </ej:ContentGroup>
                                                </ContentGroupCollection>
                                            </ej:TabContent>
                                        </ContentCollection>
                                    </ej:TabGroup>
                                </TabGroupCollection>
                            </ej:RibbonTab>
                            <ej:RibbonTab Id="layout" Text="LAYOUT">
                                <TabGroupCollection>
                                    <ej:TabGroup Text="Alignment" Type="rows">
                                        <ContentCollection>
                                            <ej:TabContent>
                                                <ContentDefaults Type="Button" IsBig="false" Height="48" Width="48" />
                                                <ContentGroupCollection>
                                                    <ej:ContentGroup Id="bullet" Text="Bullet Format" EnableSeparator="true" IsMobileOnly="true">
                                                        <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-ribbon e-icon e-resbullet" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="textindent" Text="Indent" IsMobileOnly="true">
                                                        <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-ribbon e-icon e-resindent" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="textoudent" Text="Oudent" EnableSeparator="true" IsMobileOnly="true">
                                                        <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-ribbon e-icon e-resoutdent" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="alignleft" Text="JustifyLeft" ToolTip="Align Left" IsMobileOnly="true">
                                                        <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon e-resalignleft" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="aligncenter" Text="JustifyCenter" ToolTip="Align Center" IsMobileOnly="true">
                                                        <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon e-resaligncenter " Click="executeAction" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="sortascending" Text="Sort" ToolTip="Sort" EnableSeparator="true">
                                                        <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon e-sort" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="border" Text="Border" ToolTip="Border">
                                                        <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-ribbon e-icon e-border" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                </ContentGroupCollection>
                                            </ej:TabContent>
                                        </ContentCollection>
                                    </ej:TabGroup>
                                    <ej:TabGroup Text="Print Layout" AlignType="Rows">
                                        <ContentCollection>
                                            <ej:TabContent>
                                                <ContentDefaults Width="115" Type="Button" />
                                                <ContentGroupCollection>
                                                    <ej:ContentGroup Id="ContentGroups1" Text="Print Layout">
                                                        <ButtonSettings Type="Button" ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-ribbon e-icon e-resprintlayout" />
                                                    </ej:ContentGroup>
                                                </ContentGroupCollection>
                                            </ej:TabContent>
                                        </ContentCollection>
                                    </ej:TabGroup>
                                    <ej:TabGroup Type="custom" Text="Table Style Options" ContentID="design">
                            </ej:TabGroup>
                                </TabGroupCollection>
                            </ej:RibbonTab>
                            <ej:RibbonTab Id="insert" Text="INSERT">
                                <TabGroupCollection>
                                    <ej:TabGroup Text="Illustrations" AlignType="Rows">
                                        <ContentCollection>
                                            <ej:TabContent>
                                                <ContentDefaults Width="90" Height="72" Type="Button" />
                                                <ContentGroupCollection>
                                                    <ej:ContentGroup Id="pictures" Text="Pictures" IsMobileOnly="true">
                                                        <ButtonSettings Type="Button" ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-ribbon e-icon e-respicture" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="videos" Text="Videos" IsMobileOnly="true">
                                                        <ButtonSettings Type="Button" ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-ribbon e-icon e-resvideo" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="shapes" Text="Shapes" IsMobileOnly="true">
                                                        <ButtonSettings Type="Button" ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-ribbon e-icon e-resshape" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="chart" Text="Chart" IsMobileOnly="true">
                                                        <ButtonSettings Type="Button" ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-ribbon e-icon e-reschart" />
                                                    </ej:ContentGroup>
                                                </ContentGroupCollection>
                                            </ej:TabContent>
                                        </ContentCollection>
                                    </ej:TabGroup>
                                    <ej:TabGroup Text="Comments" AlignType="rows">
                                        <ContentCollection>
                                            <ej:TabContent>
                                                <ContentDefaults Width="100" Height="72" Type="Button" />
                                                <ContentGroupCollection>
                                                    <ej:ContentGroup Id="comments" Text="Comments">
                                                        <ButtonSettings Type="Button" ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-ribbon e-icon e-comment" />
                                                    </ej:ContentGroup>
                                                </ContentGroupCollection>
                                            </ej:TabContent>
                                        </ContentCollection>
                                    </ej:TabGroup>
                                    <ej:TabGroup Text="Hyperlink" AlignType="Rows">
                                        <ContentCollection>
                                            <ej:TabContent>
                                                <ContentDefaults Width="95" Height="72" Type="Button" />
                                                <ContentGroupCollection>
                                                    <ej:ContentGroup Id="hyperlink" Text="Hyperlink">
                                                        <ButtonSettings Type="Button" ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-ribbon e-icon e-reshyperlink" />
                                                    </ej:ContentGroup>
                                                </ContentGroupCollection>
                                            </ej:TabContent>
                                        </ContentCollection>
                                    </ej:TabGroup>
                                    <ej:TabGroup Text="Equation" AlignType="Rows">
                                        <ContentCollection>
                                            <ej:TabContent>
                                                <ContentDefaults Width="90" Height="72" Type="Button" />
                                                <ContentGroupCollection>
                                                    <ej:ContentGroup Id="equation" Text="Equation">
                                                        <ButtonSettings Type="Button" ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-ribbon e-icon e-resequation" />
                                                    </ej:ContentGroup>
                                                </ContentGroupCollection>
                                            </ej:TabContent>
                                        </ContentCollection>
                                    </ej:TabGroup>
                                </TabGroupCollection>
                            </ej:RibbonTab>
                        </RibbonTabs>
                    </ej:Ribbon>
                    </div>
                     <table id="design" class="e-designtablestyle">
            <tr>
                <td style="width:87px">
                    <input type="checkbox" id="check1" /><label for="check1">Header Row</label>
                </td>
                <td>
                    <input type="checkbox" id="Check2" checked="checked" /><label for="Check2">First Column</label>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" id="check4" checked="checked" /><label for="check4">Total Row</label>
                </td>
                <td>
                    <input type="checkbox" id="Check5" /><label for="Check5">Last Column</label>
                </td>
            </tr>
        </table>
  <div id="openCon" class="e-openCon">
      <div>
          <table style="width: 100%">
              <tr>
                  <td style="vertical-align: middle; padding: 10px">
                      <div style="font-size: 16px;">
                          Workbook 01
                                <span style="display: table-cell; font-size: 10px;">15/04/2016 2:30 pm</span>
                      </div>
                  </td>
              </tr>
              <tr>
                  <td style="vertical-align: middle; padding: 10px; padding-top: 10px">
                      <div style="font-size: 16px;">
                          Workbook 02
                                <span style="display: table-cell; font-size: 10px;">15/04/2016 2:30 pm</span>
                      </div>
                  </td>
              </tr>
              <tr>
                  <td style="vertical-align: middle; padding: 10px; padding-top: 10px">
                      <div style="font-size: 16px;">
                          Workbook 03
                                <span style="display: table-cell; font-size: 10px;">15/04/2016 2:30 pm</span>
                      </div>
                  </td>
              </tr>
              <tr>
                  <td style="vertical-align: middle; padding: 10px; padding-top: 10px">
                      <div style="font-size: 16px;">
                          Workbook 04
                                <span style="display: table-cell; font-size: 10px;">15/04/2016 2:30 pm</span>
                      </div>
                  </td>
              </tr>
          </table>
      </div>
  </div>
                    <div id="newCon">
                        <table style="width: 100%">
                            <tr>
                                <td>
                                    <button id="btn1" class="e-bsnewbtnstyle">Blank WorkBook</button></td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                        </table>
                    </div>

                    <div id="accountCon">
                        <div style="padding-top: 20px">
                            <span style="font-size: 17px">User Information</span>
                            <div>
                                <div class="e-accuser e-newpageicon" style="display: table-cell"></div>
                                <div style="display: table-cell; vertical-align: middle">
                                    <div>user</div>
                                    <div>xyz@syncfusion.com</div>
                                </div>
                            </div>
                        </div>
                        <div style="padding-top: 20px; padding-bottom: 10px">Background:</div>
                        <input type="text" id="background" />
                        <div id="backgroundList">
                            <ul>
                                <li>No Background</li>
                                <li>Calligraphy</li>
                                <li>Doodle Circles</li>
                                <li>Geometry</li>
                                <li>Stars</li>
                            </ul>
                        </div>
                        <div style="padding-top: 20px; padding-bottom: 10px">Theme:</div>
                        <input type="text" id="theme" />
                        <div id="themeList">
                            <ul>
                                <li>White</li>
                                <li>Light Gray</li>
                                <li>Dark Gray</li>
                            </ul>
                        </div>
                    </div>

                    <script type="text/javascript">
                        $(function () {
                        if (window.addEventListener) {
                            window.addEventListener('message', function (e) {
                                if (typeof e.data != "boolean") {
                                    var links = $(document.head || document.getElementsByTagName('head')[0]).find("link");
                                    for (var i = 0; i < links.length; i++) {
                                        if (links[i].href.indexOf("ej.theme.min.css") != -1) {
                                            var cssref = links[i].href,
                                                serverconfig = cssref.substr(0, cssref.indexOf("Content") - 1),
                                                fileref = $('<link rel="stylesheet" type="text/css" href="' + serverconfig + window.parent.themes[e.data.split('_')[1]] + '" />');
                                            $(fileref).insertAfter(links[i]);
                                            $(links[i]).remove();
                                            break;
                                        }
                                    }

                                }
                            });
                        }
                        });

                        function groupClickControl(args) {
                            if ($(args.target).hasClass("e-ribGroupContent") && args.targetElement == "resizedGroup")
                                this.goToMainContent();
                        }

                        function createControl(args) {
                            var languages = [
                                    "ActionScript", "AppleScript", "ASP", "BASIC",
                                    "C", "C++", "Clojure", "COBOL", "ColdFusion",
                                    "Erlang", "Fortran", "Groovy", "Haskell",
                                    "Java", "JavaScript", "Lisp", "Perl", "PHP",
                                    "Python", "Ruby", "Scala", "Scheme"
                            ];
                            $("#spltbutton1").ejSplitButton({
                                size: "large",
                                showRoundedCorner: false,
                                targetID: "Ul51",
                                buttonMode: "dropdown",
                                contentType: "textandimage",
                                imagePosition: "imagetop",
                                prefixIcon: "e-protect e-newpageicon",
                                arrowPosition: "bottom",
                                height: 90,
                                width: 100
                            });
                            $('#autocomplete').ejAutocomplete({
                                showPopupButton: true,
                                width: 450,
                                watermarkText: "Search for online templates",
                                dataSource: languages
                            });
                            $("#spltbutton2").ejSplitButton({
                                size: "large",
                                showRoundedCorner: false,
                                targetID: "Ul52",
                                contentType: "textandimage",
                                imagePosition: "imagetop",
                                prefixIcon: "e-check e-newpageicon",
                                buttonMode: "dropdown",
                                arrowPosition: "bottom",
                                height: 90,
                                width: 100
                            });
                            $("#spltbutton3").ejSplitButton({
                                size: "large",
                                showRoundedCorner: false,
                                targetID: "Ul53",
                                contentType: "textandimage",
                                imagePosition: "imagetop",
                                prefixIcon: "e-version e-newpageicon",
                                buttonMode: "dropdown",
                                arrowPosition: "bottom",
                                height: 90,
                                width: 100
                            });
                            $("#btnlast").ejButton({
                                size: "large",
                                showRoundedCorner: false,
                                contentType: "textandimage",
                                imagePosition: "imagetop",
                                prefixIcon: "e-browser e-newpageicon",
                                arrowPosition: "bottom",
                                height: 100,
                                width: 100
                            });
                            $("#btn1").ejButton({
                                size: "large",
                                height: 200,
                                width: 225,
                                contentType: "textandimage",
                                imagePosition: "imagetop",
                                prefixIcon: "e-blank e-infopageicon"
                            });
                            $("#btn2").ejButton({
                                size: "large",
                                height: 200,
                                width: 225,
                                contentType: "textandimage",
                                imagePosition: "imagetop",
                                prefixIcon: "e-project e-infopageicon"
                            });
                            $("#btn3").ejButton({
                                size: "lerge",
                                height: 200,
                                width: 225,
                                contentType: "textandimage",
                                imagePosition: "imagetop",
                                prefixIcon: "e-gantt e-infopageicon"
                            });
                            $("#btn4").ejButton({
                                size: "large",
                                height: 200,
                                width: 225,
                                contentType: "textandimage",
                                imagePosition: "imagetop",
                                prefixIcon: "e-diet e-infopageicon"
                            });
                            $("#btn5").ejButton({
                                size: "lerge",
                                height: 200,
                                width: 225,
                                contentType: "textandimage",
                                imagePosition: "imagetop",
                                prefixIcon: "e-sales e-infopageicon"
                            });

                            $('#background').ejDropDownList({
                                targetID: "backgroundList",
                                width: "200px",
                                text: "No Background"
                            });
                            $('#theme').ejDropDownList({
                                targetID: "themeList",
                                width: "200px",
                                text: "White"
                            })
                        }
                    </script>
                </ContentTemplate>
            </asp:UpdatePanel>
        </form>
</body>
