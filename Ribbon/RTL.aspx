<%@ Page Title="Ribbon-RTL-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="RTL.aspx.cs" MetaDescription="This example demonstrates how to enable the rtl property in a ASP.NET Web Forms Ribbon" Inherits="WebSampleBrowser.Ribbon.RTL" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Ribbon / RTL</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    
                <div>
                    <ej:Ribbon ID="defaultRibbon" runat="server" Width="100%" EnableRTL="true">
                        <ExpandPinSettings ToolTip="Collapse the Ribbon"></ExpandPinSettings>
                        <CollapsePinSettings ToolTip="Pin the Ribbon"></CollapsePinSettings>
                        <ApplicationTab MenuItemID="ribbonmenu" Type="Menu">
                            <MenuSettings OpenOnClick="false"></MenuSettings>               
                        </ApplicationTab>
                        <RibbonTabs>
                            <ej:RibbonTab Id="home" Text="HOME">
                                <TabGroupCollection>
                                    <ej:TabGroup Text="New" AlignType="Columns">
                                        <ContentCollection>
                                            <ej:TabContent>
                                                <ContentGroupCollection>
                                                    <ej:ContentGroup Id="new" Text="New" ToolTip="New" Type="Button">
                                                        <ButtonSettings Type="Button" ContentType="ImageOnly" ImagePosition="ImageTop" PrefixIcon="e-icon e-ribbon e-new" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                </ContentGroupCollection>
                                                <ContentDefaults Width="60" Height="70" Type="Button" />
                                            </ej:TabContent>
                                        </ContentCollection>
                                    </ej:TabGroup>
                                    <ej:TabGroup Text="Clipboard" AlignType="Columns">
                                        <ContentCollection>
                                            <ej:TabContent>
                                                <ContentDefaults Width="50" Height="75" Type="SplitButton"/>
                                                <ContentGroupCollection>
                                                    <ej:ContentGroup Id="paste" ToolTip="Paste">
                                                        <SplitButtonSettings ButtonMode="Dropdown" ArrowPosition="Bottom" TargetID="pasteul" ContentType="TextAndImage" PrefixIcon="e-icon e-ribbon e-ribbonpaste" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                </ContentGroupCollection>
                                            </ej:TabContent>
                                            <ej:TabContent>
                                                <ContentDefaults Width="60" Height="25" IsBig="false" Type="Button" />
                                                <ContentGroupCollection>
                                                    <ej:ContentGroup Id="cut" ToolTip="Cut"  Text="Cut">
                                                        <ButtonSettings ContentType="TextAndImage" Type="Button" PrefixIcon="e-icon e-ribbon e-ribboncut" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="copy" ToolTip="Copy" Text="Copy">
                                                        <ButtonSettings ContentType="TextAndImage" Type="Button" PrefixIcon="e-icon e-ribbon e-ribboncopy" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="clear" ToolTip="Clear All " Text="Clear">
                                                        <ButtonSettings ContentType="TextAndImage" Type="Button" PrefixIcon="e-icon e-ribbon clearAll" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                </ContentGroupCollection>
                                            </ej:TabContent>
                                        </ContentCollection>
                                    </ej:TabGroup>
                                    <ej:TabGroup Text="Font" AlignType="Rows">
                                        <ContentCollection>
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
                                            <ej:TabContent>
                                                <ContentGroupCollection>
                                                    <ej:ContentGroup Id="bold" Text="Bold" ToolTip="Bold" Type="ToggleButton">
                                                        <toggleButtonSettings ContentType="ImageOnly" ActiveText="Bold" ActivePrefixIcon="e-icon e-ribbon bold" DefaultPrefixIcon ="e-icon e-ribbon bold" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="italic" Text="Italic" ToolTip="Italic" Type="ToggleButton">
                                                        <toggleButtonSettings ContentType="ImageOnly" ActiveText="Italic" ActivePrefixIcon="e-icon e-ribbon e-ribbonitalic" DefaultPrefixIcon="e-icon e-ribbon e-ribbonitalic" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="underline" Text="Underline" ToolTip="Underline" Type="ToggleButton">
                                                        <toggleButtonSettings ContentType="ImageOnly" ActiveText="Underline" ActivePrefixIcon="e-icon e-ribbon e-ribbonunderline" DefaultPrefixIcon="e-icon e-ribbon e-ribbonunderline" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="strikethrough" Text="strikethrough" ToolTip="Strikethrough" Type="ToggleButton">
                                                        <toggleButtonSettings ContentType="ImageOnly" ActiveText="Strikethrough" ActivePrefixIcon="e-icon e-ribbon strikethrough" DefaultPrefixIcon="e-icon e-ribbon strikethrough" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="superscript" Text="superscript" ToolTip="Superscript">
                                                        <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon e- e-superscripticon" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="subscript" Text="subscript" ToolTip="Subscript" EnableSeparator="true">
                                                        <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon e-subscripticon" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                </ContentGroupCollection>
                                                <ContentDefaults Type="Button" IsBig="false" />
                                            </ej:TabContent>
                                        </ContentCollection>
                                    </ej:TabGroup>
                                    <ej:TabGroup Text="Alignment" Type="rows">
                                        <ContentCollection>
                                            <ej:TabContent>
                                                <ContentDefaults Type="Button" IsBig="false" />
                                                <ContentGroupCollection>
                                                    <ej:ContentGroup Id="bullet" Text="Bullet Format" ToolTip="Bullets">
                                                        <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon e-bullet" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="number" Text="Number Format" ToolTip="Numbering" EnableSeparator="true">
                                                        <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon e-numbericon" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="textindent" Text="Indent" ToolTip="Text Indent">
                                                        <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon e-indent" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="textoudent" Text="Oudent" ToolTip="Text Oudent" EnableSeparator="true">
                                                        <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon e-outdent" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="sortascending" Text="Sort" ToolTip="Sort" EnableSeparator="true">
                                                        <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon e-sort" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="border" Text="Border" ToolTip="Border">
                                                        <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon e-border" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                </ContentGroupCollection>
                                            </ej:TabContent>
                                            <ej:TabContent>
                                                <ContentDefaults IsBig="false" Type="Button" />
                                                <ContentGroupCollection>
                                                    <ej:ContentGroup Id="alignleft" Text="JustifyLeft" ToolTip="Align Left">
                                                        <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon alignleft" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="aligncenter" Text="JustifyCenter" ToolTip="Align Center">
                                                        <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon aligncenter " Click="executeAction" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="alignright" Text="JustifyRight" ToolTip="Align Right">
                                                        <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon alignright" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="justify" Text="JustifyFull" ToolTip="Justify" EnableSeparator="true">
                                                        <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon justify" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="uppercase" Text="uppercase" ToolTip="Upper case">
                                                        <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon e-uppercase" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="lowercase" Text="Lower Case" ToolTip="Lower Case">
                                                        <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon e-lowercase" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                </ContentGroupCollection>
                                            </ej:TabContent>
                                        </ContentCollection>
                                    </ej:TabGroup>
                                    <ej:TabGroup Text="Actions" AlignType="Rows">
                                        <ContentCollection>
                                            <ej:TabContent>
                                                <ContentDefaults Type="Button" Height="70" Width="45" />
                                                <ContentGroupCollection>
                                                    <ej:ContentGroup Id="undo" Text="Undo" ToolTip="Undo" IsBig="false">
                                                        <ButtonSettings ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-icon e-ribbon e-undo" Click="executeAction" Type="Button" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="redo" Text="Redo" ToolTip="Redo">
                                                        <ButtonSettings ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-icon e-ribbon e-redo" Click="executeAction" Type="Button" />
                                                    </ej:ContentGroup>
                                                </ContentGroupCollection>
                                            </ej:TabContent>
                                        </ContentCollection>
                                    </ej:TabGroup>
                                </TabGroupCollection>
                            </ej:RibbonTab>
                            <ej:RibbonTab Id="insert" Text="INSERT">
                                <TabGroupCollection>
                                    <ej:TabGroup Text="Tables" AlignType="Columns">
                                        <ContentCollection>
                                            <ej:TabContent>
                                                <ContentDefaults Height="70" Width="50" Type="Button" />
                                                <ContentGroupCollection>
                                                    <ej:ContentGroup Id="tables" Text="Tables" ToolTip="Tables">
                                                        <ButtonSettings Type="Button" ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-icon e-ribbon e-table" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                </ContentGroupCollection>
                                            </ej:TabContent>
                                        </ContentCollection>
                                    </ej:TabGroup>
                                    <ej:TabGroup Text="Illustrations" AlignType="Rows">
                                        <ContentCollection>
                                            <ej:TabContent>
                                                <ContentDefaults Height="70" Width="56" Type="Button" />
                                                <ContentGroupCollection>
                                                    <ej:ContentGroup Id="pictures" Text="Pictures" ToolTip="Pictures">
                                                        <ButtonSettings Type="Button" ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-icon e-ribbon e-picture" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="videos" Text="Videos" ToolTip="Videos">
                                                        <ButtonSettings Type="Button" ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-icon e-ribbon e-video" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="shapes" Text="Shapes" ToolTip="Shapes">
                                                        <ButtonSettings Type="Button" ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-icon e-ribbon e-shape" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="chart" Text="Chart" ToolTip="Chart">
                                                        <ButtonSettings Type="Button" ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-icon e-ribbon e-chart" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                </ContentGroupCollection>
                                            </ej:TabContent>
                                        </ContentCollection>
                                    </ej:TabGroup>
                                    <ej:TabGroup Text="Comments" AlignType="rows">
                                        <ContentCollection>
                                            <ej:TabContent>
                                                <ContentDefaults Height="70" Width="70" Type="Button" />
                                                <ContentGroupCollection>
                                                    <ej:ContentGroup Id="comments" Text="Comments" ToolTip="Comments">
                                                        <ButtonSettings Type="Button" ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-icon e-ribbon e-comment" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                </ContentGroupCollection>
                                            </ej:TabContent>
                                        </ContentCollection>
                                    </ej:TabGroup>
                                    <ej:TabGroup Text="Text" AlignType="rows">
                                        <ContentCollection>
                                            <ej:TabContent>
                                                <ContentDefaults Height="75" Type="Button" />
                                                <ContentGroupCollection>
                                                    <ej:ContentGroup Id="text" Text="Text" ToolTip="Text">
                                                        <ButtonSettings Type="Button" ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-icon e-ribbon e-text" Width="50" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="datetime" Text="DateTime" ToolTip="Date Time">
                                                        <ButtonSettings Type="Button" ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-icon e-ribbon e-datetimenew" Width="65" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                </ContentGroupCollection>
                                            </ej:TabContent>
                                        </ContentCollection>
                                    </ej:TabGroup>
                                    <ej:TabGroup Text="Hyperlink" AlignType="Rows">
                                        <ContentCollection>
                                            <ej:TabContent>
                                                <ContentDefaults Height="70" Width="65" Type="Button" />
                                                <ContentGroupCollection>
                                                    <ej:ContentGroup Id="hyperlink" Text="Hyperlink" ToolTip="Hyperlink">
                                                        <ButtonSettings Type="Button" ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-icon e-ribbon e-hyperlink" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                </ContentGroupCollection>
                                            </ej:TabContent>
                                        </ContentCollection>
                                    </ej:TabGroup>
                                    <ej:TabGroup Text="Equation" AlignType="Rows">
                                        <ContentCollection>
                                            <ej:TabContent>
                                                <ContentDefaults Height="70" Width="60" Type="Button" />
                                                <ContentGroupCollection>
                                                    <ej:ContentGroup Id="equation" Text="Equation" ToolTip="Equation">
                                                        <ButtonSettings Type="Button" ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-icon e-ribbon e-equation" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                </ContentGroupCollection>
                                            </ej:TabContent>
                                        </ContentCollection>
                                    </ej:TabGroup>
                                    <ej:TabGroup Text="Print Layout" AlignType="Rows">
                                        <ContentCollection>
                                            <ej:TabContent>
                                                <ContentDefaults Height="70" Width="80" Type="Button" />
                                                <ContentGroupCollection>
                                                    <ej:ContentGroup Id="printlayout" Text="Print Layout" ToolTip="Print Layout">
                                                        <ButtonSettings Type="Button" ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-icon e-ribbon e-printlayout" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                </ContentGroupCollection>
                                            </ej:TabContent>
                                        </ContentCollection>
                                    </ej:TabGroup>
                                    <ej:TabGroup Text="Save" AlignType="Rows">
                                        <ContentCollection>
                                            <ej:TabContent>
                                                <ContentDefaults Height="70" Width="50" Type="Button" />
                                                <ContentGroupCollection>
                                                    <ej:ContentGroup Id="print" Text="Print" ToolTip="Print">
                                                        <ButtonSettings Type="Button" ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-icon e-ribbon e-print" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="save" Text="Save" ToolTip="Save">
                                                        <ButtonSettings Type="Button" ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-icon e-ribbon e-save" Click="executeAction" />
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
                <ul id="ribbonmenu">
                    <li><a>FILE</a>
                        <ul>
                            <li><a>New</a></li>
                            <li><a>Open</a></li>
                            <li><a>Save</a></li>
                            <li><a>Save As</a></li>
                            <li><a>Print</a></li>
                        </ul>
                    </li>
                </ul>
                <ul id="pasteul">
                    <li><a>Paste</a></li>
                </ul>
               

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        var action1 = ["New", "Clear"], fontfamily = ["Segoe UI", "Arial", "Times New Roman", "Tahoma", "Helvetica"], fontsize = ["1pt", "2pt", "3pt", "4pt", "5pt"],
            action2 = ["Bold", "Italic", "Underline", "strikethrough", "superscript", "subscript", "JustifyLeft", "JustifyCenter", "JustifyRight", "JustifyFull", "Undo", "Redo"];
        var fontsize = []; 
        for(var i=1;i<=100;i++)
        {
            fontsize.push(i + "pt");
        }
        function executeAction(args) {
            var val, prop = args.text;
            val = (ej.isNullOrUndefined(args.model.text)) ? args.model.activeText : args.model.text;
            if (action1.indexOf(val) != -1)
                $("#contenteditor").empty();
            else if (action2.indexOf(val) != -1)
                document.execCommand(val, false, null);
            else if (fontfamily.indexOf(prop) != -1)
                document.execCommand("FontName", false, prop);
            else if (fontsize.indexOf(prop) != -1)
                document.execCommand("FontSize", false, prop.replace("pt", ""));
            else
                $("#contenteditor").append("<p> Action: " + val + " Triggered </p>");

        }
       
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <link href="<%=ResolveClientUrl("~/Content/ejthemes/ribbon-css/ej.icons.css")%>" rel="stylesheet" />
    <style type="text/cs">
        .e-contenteditor {
            width: 100%;
            height: 220px;
            border: 1px solid #D9DFDE;
            border-top: 0;
            overflow: auto;
        }
        .e-btn .e-btntxt {
            padding:0px!important;
        }
        .e-contenteditor p {
            margin: 20px;
        }
    </style>
</asp:Content>

