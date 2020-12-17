<%@ Page Title="Ribbon-Localization-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Localization.aspx.cs" MetaDescription="This example demonstrates how to localize the Ribbon in a ASP.NET Web Forms" Inherits="WebSampleBrowser.Ribbon.Localization" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="HeadSection">
    <script src="../Scripts/cultures/ej.culture.de-DE.min.js" type="text/javascript"></script>
    <script src="../Scripts/cultures/ej.culture.es-ES.min.js" type="text/javascript"></script>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Ribbon / Localization</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    
                <div>
                    <ej:Ribbon ID="defaultRibbon" runat="server" Width="100%" Locale="de-DE" ShowQAT="true" QatMenuItemClick="qatMenuItemClick" >
                        <ExpandPinSettings ToolTip="Collapse the Ribbon"></ExpandPinSettings>
                        <CollapsePinSettings ToolTip="Pin the Ribbon"></CollapsePinSettings>
                        <ApplicationTab MenuItemID="ribbonmenu" Type="Menu">
                            <MenuSettings OpenOnClick="false"></MenuSettings>               
                        </ApplicationTab>
                        <RibbonTabs>
                            <ej:RibbonTab Id="home" Text="HOME">
                                <TabGroupCollection>
                                    <ej:TabGroup Text="Clipboard" AlignType="Columns">
                                        <ContentCollection>
                                            <ej:TabContent>
                                                <ContentDefaults Width="50" Height="75" Type="SplitButton"/>
                                                <ContentGroupCollection>
                                                    <ej:ContentGroup Id="paste" Text="Paste" ToolTip="Paste" QuickAccessMode="ToolBar">
                                                        <SplitButtonSettings ButtonMode="Dropdown" ArrowPosition="Bottom" TargetID="pasteul" ContentType="ImageOnly" PrefixIcon="e-icon e-ribbon e-ribbonpaste" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                </ContentGroupCollection>
                                            </ej:TabContent>
                                        </ContentCollection>
                                    </ej:TabGroup>
                                    <ej:TabGroup Text="Font" AlignType="Rows">
                                        <ContentCollection>
                                            <ej:TabContent>
                                                <ContentGroupCollection>
                                                    <ej:ContentGroup Id="bold" Text="Bold" ToolTip="Bold" Type="ToggleButton" QuickAccessMode="ToolBar" >
                                                        <toggleButtonSettings ContentType="ImageOnly" ActiveText="Bold" ActivePrefixIcon="e-icon e-ribbon bold" DefaultPrefixIcon ="e-icon e-ribbon bold" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="italic" Text="Italic" ToolTip="Italic" Type="ToggleButton" QuickAccessMode="ToolBar">
                                                        <toggleButtonSettings ContentType="ImageOnly" ActiveText="Italic" ActivePrefixIcon="e-icon e-ribbon e-ribbonitalic" DefaultPrefixIcon="e-icon e-ribbon e-ribbonitalic" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="underline" Text="Underline" ToolTip="Underline" Type="ToggleButton" QuickAccessMode="ToolBar">
                                                        <toggleButtonSettings ContentType="ImageOnly" ActiveText="Underline" ActivePrefixIcon="e-icon e-ribbon e-ribbonunderline" DefaultPrefixIcon="e-icon e-ribbon e-ribbonunderline" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                </ContentGroupCollection>
                                                <ContentDefaults Type="Button" IsBig="false" />
                                            </ej:TabContent>
                                            <ej:TabContent>
                                                <ContentGroupCollection>
                                                     <ej:ContentGroup Id="strikethrough" Text="strikethrough" ToolTip="Strikethrough" Type="ToggleButton">
                                                        <toggleButtonSettings ContentType="ImageOnly" ActiveText="Strikethrough" ActivePrefixIcon="e-icon e-ribbon strikethrough" DefaultPrefixIcon="e-icon e-ribbon strikethrough" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="superscript" Text="superscript" ToolTip="Superscript">
                                                        <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon e- e-superscripticon" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="subscript" Text="subscript" ToolTip="Subscript">
                                                        <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon e-subscripticon" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                </ContentGroupCollection>
                                                <ContentDefaults Type="Button" IsBig="false" />
                                            </ej:TabContent>
                                        </ContentCollection>
                                    </ej:TabGroup>
                                    <ej:TabGroup Text="Alignment" AlignType="rows">
                                        <ContentCollection>
                                            <ej:TabContent>
                                                <ContentDefaults Type="Button" IsBig="false" />
                                                <ContentGroupCollection>
                                                    <ej:ContentGroup Id="bullet" Text="Bullet Format" ToolTip="Bullets" QuickAccessMode="ToolBar">
                                                        <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon e-bullet" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="number" Text="Number Format" ToolTip="Numbering" QuickAccessMode="ToolBar">
                                                        <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon e-numbericon" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="sortascending" Text="Sort" ToolTip="Sort" QuickAccessMode="ToolBar">
                                                        <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon e-sort" Click="executeAction" />
                                                    </ej:ContentGroup>
                                                </ContentGroupCollection>
                                            </ej:TabContent>
                                             <ej:TabContent>
                                                <ContentDefaults Type="Button" IsBig="false" />
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

<asp:Content ID="Content4" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-ribbon">
            <div class="row">
                <div class="col-md-3">
                    Selection Type
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ID="language" runat="server" SelectedItemIndex="1" ClientSideOnChange="onChange" Width="120px">
                        <Items>
                            <ej:DropDownListItem Text="English" Value="0" />
                            <ej:DropDownListItem Text="Deutsch" Value="1" />
                            <ej:DropDownListItem Text="Español" Value="2" />
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
        });
        function onChange(args) {
            if (args.itemId == 0)
                $('#<%= defaultRibbon.ClientID %>').ejRibbon("model.locale", "en-US");
            else if (args.itemId == 1)
                $('#<%= defaultRibbon.ClientID %>').ejRibbon("model.locale", "de-DE");
            else
                $('#<%= defaultRibbon.ClientID %>').ejRibbon("model.locale", "es-ES");
        }
       ej.Ribbon.Locale["es-ES"] = {
           CustomizeQuickAccess:"Agordu Rapida Aliro",
		   RemoveFromQuickAccessToolbar:"Forigu de Rapida Aliro Ilobreto",
		   AddToQuickAccessToolbar:"Aldoni al Rapida Aliro Ilobreto",
		   ShowAboveTheRibbon:"Montru Super la Ribbona",
		   ShowBelowTheRibbon:"Montru Sube la Ribbon",
		   MoreCommands:"pli Komando"
        };

        ej.Ribbon.Locale["de-DE"] = {
           CustomizeQuickAccess:"Aanpassen Quick Access", 
		   RemoveFromQuickAccessToolbar:"Verwijderen uit werkbalk Snelle toegang",
		   AddToQuickAccessToolbar:"Toevoegen aan werkbalk Snelle toegang",
           ShowAboveTheRibbon:"Toon Boven het lint",
		   ShowBelowTheRibbon:"Onder het lint weergeven",
		   MoreCommands:"meer Command"
         		   
        };
    </script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
   <link href="<%=ResolveClientUrl("~/Content/ejthemes/ribbon-css/ej.icons.css")%>" rel="stylesheet" />
    <style type="text/css">
        .e-ribbon.e-js .e-rbnquickaccessbar .e-ribbon.e-ribbonpaste:before {

		      font-size: 27px;
              left: -5px;
              top: -6px;
		}
		.row .cols-sample-area {
           min-height: 490px !important;
        }
    </style>
</asp:Content>

