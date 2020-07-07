<%@ Page Title="Ribbon-Events-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Events.aspx.cs" MetaDescription="This example shows the events that trigger on specific actions in the ASP.NET Web Ribbon." Inherits="WebSampleBrowser.Ribbon.Events" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Ribbon / Events</span>
</asp:Content>
<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Ribbon ID="defaultRibbon" runat="server" Width="100%" TabClick="tabClick"
            TabSelect="tabSelect" ToggleButtonClick="toggleButtonClick"
            GroupExpand="groupExpand" GroupClick="groupClick">
            <ExpandPinSettings ToolTip="Collapse the Ribbon"></ExpandPinSettings>
            <CollapsePinSettings ToolTip="Pin the Ribbon"></CollapsePinSettings>
            <ApplicationTab MenuItemID="ribbonmenu" Type="Menu">
                <MenuSettings OpenOnClick="false" create="create" mouseover="mouseover" mouseout="mouseout" click="click" keydown="keydown"></MenuSettings>
            </ApplicationTab>
            <RibbonTabs>
                <ej:RibbonTab Id="home" Text="HOME">
                    <TabGroupCollection>
                        <ej:TabGroup Text="Clipboard" AlignType="Columns" EnableGroupExpander="true">
                             <GroupExpanderSettings ToolTip="Clipboard"></GroupExpanderSettings>
                            <ContentCollection>
                                <ej:TabContent>
                                    <ContentDefaults Width="50" Height="75" Type="Button" />
                                    <ContentGroupCollection>
                                        <ej:ContentGroup Id="paste" ToolTip="Paste" Type="Button">
                                            <ButtonSettings Type="Button" ContentType="ImageOnly" PrefixIcon="e-icon e-ribbon e-ribbonpaste" />
                                        </ej:ContentGroup>
                                    </ContentGroupCollection>
                                </ej:TabContent>
                                <ej:TabContent>
                                    <ContentDefaults Width="60" Height="25" IsBig="false" />
                                    <ContentGroupCollection>
                                        <ej:ContentGroup Id="cut" ToolTip="Cut" Type="Button" Text="Cut">
                                            <ButtonSettings ContentType="TextAndImage" Type="Button" PrefixIcon="e-icon e-ribbon e-ribboncut" />
                                        </ej:ContentGroup>
                                        <ej:ContentGroup Id="copy" ToolTip="Copy" Type="Button" Text="Copy">
                                            <ButtonSettings ContentType="TextAndImage" Type="Button" PrefixIcon="e-icon e-ribbon e-ribboncopy" />
                                        </ej:ContentGroup>
                                        <ej:ContentGroup Id="clear" ToolTip="Clear All " Type="Button" Text="Clear">
                                            <ButtonSettings ContentType="TextAndImage" Type="Button" PrefixIcon="e-icon e-ribbon clearAll" />
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
                                        <ej:ContentGroup Id="bold" Text="Bold" ToolTip="Bold">
                                            <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon bold" />
                                        </ej:ContentGroup>
                                        <ej:ContentGroup Id="italic" Text="Italic" ToolTip="Italic">
                                            <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon e-ribbonitalic" />
                                        </ej:ContentGroup>
                                        <ej:ContentGroup Id="underline" Text="Underline" ToolTip="Underline">
                                            <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon e-ribbonunderline" />
                                        </ej:ContentGroup>
                                        <ej:ContentGroup Id="strikethrough" Text="strikethrough" ToolTip="Strikethrough">
                                            <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon strikethrough" />
                                        </ej:ContentGroup>
                                        <ej:ContentGroup Id="superscript" Text="superscript" ToolTip="Superscript">
                                            <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon e- e-superscripticon" />
                                        </ej:ContentGroup>
                                        <ej:ContentGroup Id="subscript" Text="subscript" ToolTip="Subscript" EnableSeparator="true">
                                            <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon e-subscripticon" />
                                        </ej:ContentGroup>
                                        <ej:ContentGroup Id="uppercase" Text="uppercase" ToolTip="Upper case">
                                            <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon e-uppercase" />
                                        </ej:ContentGroup>
                                        <ej:ContentGroup Id="lowercase" Text="Lower Case" ToolTip="Lower Case">
                                            <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon e-lowercase" />
                                        </ej:ContentGroup>
                                    </ContentGroupCollection>
                                    <ContentDefaults Type="Button" IsBig="false" />
                                </ej:TabContent>
                            </ContentCollection>
                        </ej:TabGroup>
                        <ej:TabGroup Text="New" AlignType="Columns">
                            <ContentCollection>
                                <ej:TabContent>
                                    <ContentGroupCollection>
                                        <ej:ContentGroup Id="new" Text="New" ToolTip="New" Type="Button">
                                            <ButtonSettings Type="Button" ContentType="ImageOnly" ImagePosition="ImageTop" PrefixIcon="e-icon e-ribbon e-new" />
                                        </ej:ContentGroup>
                                    </ContentGroupCollection>
                                    <ContentDefaults Width="60" Height="70" Type="Button" />
                                </ej:TabContent>
                            </ContentCollection>
                        </ej:TabGroup>
                        <ej:TabGroup Text="Actions" AlignType="Rows">
                            <ContentCollection>
                                <ej:TabContent>
                                    <ContentDefaults Type="Button" Height="70" Width="45" />
                                    <ContentGroupCollection>
                                        <ej:ContentGroup Id="undo" Text="Undo" ToolTip="Undo" IsBig="false">
                                            <ButtonSettings ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-icon e-ribbon e-undo" Type="Button" />
                                        </ej:ContentGroup>
                                        <ej:ContentGroup Id="redo" Text="Redo" ToolTip="Redo">
                                            <ButtonSettings ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-icon e-ribbon e-redo" Type="Button" />
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
                                    <ContentDefaults Type="Button" IsBig="false" />
                                    <ContentGroupCollection>
                                        <ej:ContentGroup Id="bullet" Text="Bullet Format" ToolTip="Bullets">
                                            <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon e-bullet" />
                                        </ej:ContentGroup>
                                        <ej:ContentGroup Id="number" Text="Number Format" ToolTip="Numbering" EnableSeparator="true">
                                            <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon e-numbericon" />
                                        </ej:ContentGroup>
                                        <ej:ContentGroup Id="textindent" Text="Indent" ToolTip="Text Indent">
                                            <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon e-indent" />
                                        </ej:ContentGroup>
                                        <ej:ContentGroup Id="textoudent" Text="Oudent" ToolTip="Text Oudent" EnableSeparator="true">
                                            <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon e-outdent" />
                                        </ej:ContentGroup>
                                        <ej:ContentGroup Id="sortascending" Text="Sort" ToolTip="Sort" EnableSeparator="true">
                                            <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon e-sort" />
                                        </ej:ContentGroup>
                                        <ej:ContentGroup Id="border" Text="Border" ToolTip="Border">
                                            <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon e-border" />
                                        </ej:ContentGroup>
                                    </ContentGroupCollection>
                                </ej:TabContent>
                                <ej:TabContent>
                                    <ContentDefaults IsBig="false" Type="Button" />
                                    <ContentGroupCollection>
                                        <ej:ContentGroup Id="alignleft" Text="JustifyLeft" ToolTip="Align Left">
                                            <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon alignleft" />
                                        </ej:ContentGroup>
                                        <ej:ContentGroup Id="aligncenter" Text="JustifyCenter" ToolTip="Align Center">
                                            <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon aligncenter " />
                                        </ej:ContentGroup>
                                        <ej:ContentGroup Id="alignright" Text="JustifyRight" ToolTip="Align Right">
                                            <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon alignright" />
                                        </ej:ContentGroup>
                                        <ej:ContentGroup Id="justify" Text="JustifyFull" ToolTip="Justify" EnableSeparator="true">
                                            <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon justify" />
                                        </ej:ContentGroup>
                                        <ej:ContentGroup Id="fontcolor" Text="Font Color" ToolTip="Font Color">
                                            <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon e-fontcolor" />
                                        </ej:ContentGroup>
                                        <ej:ContentGroup Id="fillcolor" Text="Fill Color" ToolTip="Fill Color">
                                            <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon e-fillcolor" />
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
                                        <ej:ContentGroup Id="ContentGroups1" Text="Print Layout" ToolTip="Print Layout">
                                            <ButtonSettings Type="Button" ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-icon e-ribbon e-printlayout" />
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
                                            <ButtonSettings Type="Button" ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-icon e-ribbon e-table" />
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
                                            <ButtonSettings Type="Button" ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-icon e-ribbon e-picture" />
                                        </ej:ContentGroup>
                                        <ej:ContentGroup Id="videos" Text="Videos" ToolTip="Videos">
                                            <ButtonSettings Type="Button" ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-icon e-ribbon e-video" />
                                        </ej:ContentGroup>
                                        <ej:ContentGroup Id="shapes" Text="Shapes" ToolTip="Shapes">
                                            <ButtonSettings Type="Button" ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-icon e-ribbon e-shape" />
                                        </ej:ContentGroup>
                                        <ej:ContentGroup Id="chart" Text="Chart" ToolTip="Chart">
                                            <ButtonSettings Type="Button" ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-icon e-ribbon e-chart" />
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
                                            <ButtonSettings Type="Button" ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-icon e-ribbon e-comment" />
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
                                            <ButtonSettings Type="Button" ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-icon e-ribbon e-hyperlink" />
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
                                            <ButtonSettings Type="Button" ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-icon e-ribbon e-equation" />
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


</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="EventSection">
    <div class="cols-prop-area event-tracer">
        <div>
            <div class="heading">
                <span>Event Trace</span>
                <div class="pull-right">
                    <ej:DropDownList name="selectevtprops" ID="selectControls" runat="server" Width="150px"
                        ShowCheckbox="True" CheckAll="True" ClientSideOnChange="evtpropscheckedevent">
                        <Items>
                            <ej:DropDownListItem Text="groupClick" Value="groupClick" />
                            <ej:DropDownListItem Text="menuCreate" Value="create" />
                            <ej:DropDownListItem Text="MouseOver" Value="mouseover" />
                            <ej:DropDownListItem Text="MouseOut" Value="mouseout" />
                            <ej:DropDownListItem Text="Click" Value="click" />
                            <ej:DropDownListItem Text="TabSelect" Value="tabSelect" />
                            <ej:DropDownListItem Text="TabClick" Value="tabClick" />
                            <ej:DropDownListItem Text="ToggleButtonClick" Value="toggleButtonClick" />
                            <ej:DropDownListItem Text="groupExpand" Value="groupExpand" />

                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            <div class="prop-grid content">
                <div class="eventarea">
                    <div class="EventLog" id="EventLog">
                    </div>
                </div>
                <div class="evtbtn">
                    <ej:Button ID="Button1" runat="server" Type="Button" Text="Clear" ClientSideOnClick="onClear"></ej:Button>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        function evtpropscheckedevent(args) {
            var ribbonObj = $('#<%= defaultRibbon.ClientID %>').data("ejRibbon");
            var menuObj = $("#ribbonmenu").data("ejMenu");
            if (args.isChecked) {
                switch (args.value) {
                    case "create": menuObj.option(args.value, "create"); break;
                    case "click": menuObj.option(args.value, "click"); break;
                    case "mouseover": menuObj.option(args.value, "mouseover"); break;
                    case "mouseout": menuObj.option(args.value, "mouseout"); break;
                    case "keydown": menuObj.option(args.value, "keydown"); break;
                    case "toggleButtonClick": ribbonObj.option(args.value, "toggleButtonClick"); break;
                    case "tabSelect": ribbonObj.option(args.value, "tabSelect"); break;
                    case "tabClick": ribbonObj.option(args.value, "tabClick"); break;
                    case "groupExpand": ribbonObj.option(args.value, "groupExpand"); break;
                    case "groupClick": ribbonObj.option(args.value, "groupClick"); break;
                }
            }
            else {
                ribbonObj.option(args.value, null);
                menuObj.option(args.value, null);
            }
        }
        function onCreate(args) {
            jQuery.addEventLog("File Menu has been <span class= 'eventTitle'> created</span>.");
        }
        function create(sender) {
            jQuery.addEventLog("Event<span class='eventTitle'> menuCreate </span>triggered</br>");
        }
        function mouseover(sender) {
            jQuery.addEventLog("Event<span class='eventTitle'> menuMouseOver </span>triggered</br>");
        }
        function mouseout(sender) {
            jQuery.addEventLog("Event<span class='eventTitle'> menuMouseOut </span>triggered</br>");
        }
        function click(sender) {
            jQuery.addEventLog("Event<span class='eventTitle'> menuClick </span>triggered</br>");
        }
        function tabSelect(sender) {
            jQuery.addEventLog("Event<span class='eventTitle'> onTabSelect </span>triggered</br>");
        }
        function onClear() {
            jQuery.clearEventLog();
        }
        function toggleButtonClick(sender) {
            jQuery.addEventLog("Event<span class='eventTitle'> onToggleButtonClick </span>triggered</br>");
        }
        function tabClick(sender) {
            jQuery.addEventLog("Event<span class='eventTitle'> onTabClick </span>triggered</br>");
        }
        function groupExpand(sender) {
            jQuery.addEventLog("Event<span class='eventTitle'> groupExpand </span>triggered</br>");
        }
        function groupClick(sender) {
            jQuery.addEventLog("Event<span class='eventTitle'> groupClick </span>triggered</br>");
        }
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="StyleSection" runat="server">
   <link href="<%=ResolveClientUrl("~/Content/ejthemes/ribbon-css/ej.icons.css")%>" rel="stylesheet" />
</asp:Content>

