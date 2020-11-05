<%@ Page Title="Ribbon-CustomToolTip-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master"  AutoEventWireup="true" CodeBehind="CustomToolTip.aspx.cs" MetaDescription="This example demonstrates to customize the tooltip for the items in a ASP.NET Web Forms Ribbon" Inherits="WebSampleBrowser.Ribbon.CustomToolTip" %>



<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Ribbon / CustomToolTip</span>
</asp:Content>


<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    
    <ej:Ribbon ID="defaultRibbon" runat="server" Width="100%" Create="createControl">
        <ExpandPinSettings>
            <CustomToolTip Title="Collapse the Ribbon" Content="<h6>Click the icon to collapse the Ribbon.</h6>" />
        </ExpandPinSettings>
        <CollapsePinSettings>
            <CustomToolTip Title="Pin the Ribbon" Content="<h6>Keep it open while you work.</h6>"/>
        </CollapsePinSettings>
       
                        <ApplicationTab MenuItemID="ribbonmenu" Type="menu">
                            <MenuSettings OpenOnClick="false"></MenuSettings>               
                        </ApplicationTab>
                        <RibbonTabs>
                            <ej:RibbonTab Id="home" Text="HOME">
                                <TabGroupCollection>
                                    
                                    <ej:TabGroup Text="Clipboard" AlignType="Columns" EnableGroupExpander="true">
                                        <GroupExpanderSettings>
                                            <CustomToolTip Title="Clipboard" Content="<h6>Show a popup for the Clipboard group.</h6>" />
                                        </GroupExpanderSettings>
                                        <ContentCollection>
                                            <ej:TabContent>
                                                <ContentDefaults Width="50" Height="75" Type="SplitButton"/>
                                                <ContentGroupCollection>
                                                    <ej:ContentGroup Id="paste" ContentID="">

                                                        <SplitButtonSettings ButtonMode="Dropdown" ArrowPosition="Bottom" TargetID="pasteul" ContentType="TextAndImage" PrefixIcon="e-icon e-ribbon e-ribbonpaste" />
                                                           <CustomToolTip Content="<h6>Paste the content.<br/><br/>Add content on the Clipboard to your document.</h6>" Title="Paste" PrefixIcon="e-pastetip"/>
                                                    </ej:ContentGroup>
                                                </ContentGroupCollection>
                                            </ej:TabContent>
                                            <ej:TabContent>
                                                <ContentDefaults Width="60" Height="25" IsBig="false" Type="Button" />
                                                <ContentGroupCollection>
                                                    <ej:ContentGroup Id="cut"   Text="Cut">
                                                        <ButtonSettings ContentType="TextAndImage" Type="Button" PrefixIcon="e-icon e-ribbon e-ribboncut"  />
                                                        <CustomToolTip Content="<h6>Cut the content.</h6>" Title="Cut" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="copy" Text="Copy">
                                                        <ButtonSettings ContentType="TextAndImage" Type="Button" PrefixIcon="e-icon e-ribbon e-ribboncopy"  />
                                                            <CustomToolTip Content="<h6>Copy the content.</h6>" Title="Copy" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="clear"  Text="Clear">
                                                        <ButtonSettings ContentType="TextAndImage" Type="Button" PrefixIcon="e-icon e-ribbon clearAll"  />
                                                            <CustomToolTip Content="<h6>Clear the content.</h6>" Title="Clear" />
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
                                                    <ej:ContentGroup Id="fontfamily"  Type="DropDownList">
                                                        <DropdownSettings Text="Segoe UI" Width="150"></DropdownSettings>
                                                            <CustomToolTip Content="<h6>Change font family of the content.</h6>" Title="FontFamily" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="fontsize"  Type="DropDownList">
                                                        <DropdownSettings Text="1pt" Width="65"></DropdownSettings>
                                                            <CustomToolTip Content="<h6>Change font size of the content.</h6>" Title="FontSize" />
                                                    </ej:ContentGroup>
                                                </ContentGroupCollection>
                                            </ej:TabContent>
                                            <ej:TabContent>
                                                <ContentGroupCollection>
                                                    <ej:ContentGroup Id="bold" Text="Bold"  Type="ToggleButton">
                                                        <toggleButtonSettings ContentType="ImageOnly" ActiveText="Bold" ActivePrefixIcon="e-icon e-ribbon bold" DefaultPrefixIcon ="e-icon e-ribbon bold"  />
                                                       <CustomToolTip Content="<h6>Bold the content.</h6>" Title="Bold" />
                                                         </ej:ContentGroup>
                                                    <ej:ContentGroup Id="italic" Text="Italic"  Type="ToggleButton">
                                                        <toggleButtonSettings ContentType="ImageOnly" ActiveText="Italic" ActivePrefixIcon="e-icon e-ribbon e-ribbonitalic" DefaultPrefixIcon="e-icon e-ribbon e-ribbonitalic"  />
                                                            <CustomToolTip Content="<h6>Italic the content.</h6>" Title="Italic" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="underline" Text="Underline"  Type="ToggleButton">
                                                        <toggleButtonSettings ContentType="ImageOnly" ActiveText="Underline" ActivePrefixIcon="e-icon e-ribbon e-ribbonunderline" DefaultPrefixIcon="e-icon e-ribbon e-ribbonunderline"  />
                                                            <CustomToolTip Content="<h6>Underline the content.</h6>" Title="Underline" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="strikethrough" Text="strikethrough"  Type="ToggleButton">
                                                        <toggleButtonSettings ContentType="ImageOnly" ActiveText="Strikethrough" ActivePrefixIcon="e-icon e-ribbon strikethrough" DefaultPrefixIcon="e-icon e-ribbon strikethrough"  />
                                                            <CustomToolTip Content="<h6>Strikethrough the content.</h6>" Title="Strikethrough" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="superscript" Text="superscript" >
                                                        <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon e- e-superscripticon"  />
                                                            <CustomToolTip Content="<h6>Superscript the content.</h6>" Title="Superscript" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="subscript" Text="subscript"  EnableSeparator="true">
                                                        <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon e-subscripticon"  />
                                                            <CustomToolTip Content="<h6>Subscript the content.</h6>" Title="Subscript" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="font" Text="Font Color"  Type="Custom" ContentID="fontcolor">  
                                                            <CustomToolTip Content="<h6>Change the Font Color.</h6>" Title="Font Color" />                                                 
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="fill" Text="Fill Color"  Type="Custom" ContentID="fillcolor">  
                                                            <CustomToolTip Content="<h6>Change the Fill Color.</h6>" Title="Fill Color" />                                                      
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
                                                    <ej:ContentGroup Id="bullet" Text="Bullet Format" >
                                                        <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon e-bullet"  />
                                                            <CustomToolTip Content="<h6>Apply the bullet format.</h6>" Title="Bullet Format" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="number" Text="Number Format"  EnableSeparator="true">
                                                        <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon e-numbericon"  />
                                                            <CustomToolTip Content="<h6>Apply the number format.</h6>" Title="Number Format" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="textindent" Text="Indent" >
                                                        <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon e-indent"  />
                                                            <CustomToolTip Content="<h6>Apply the text indent.</h6>" Title="Text Indent" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="textoudent" Text="Oudent"  EnableSeparator="true">
                                                        <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon e-outdent"  />
                                                            <CustomToolTip Content="<h6>Apply the text outdent.</h6>" Title="Text Oudent" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="sortascending" Text="Sort"  EnableSeparator="true">
                                                        <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon e-sort"  />
                                                            <CustomToolTip Content="<h6>Sort the selected content in ascending order.</h6>" Title="Sort Ascending" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="border" Text="Border" >
                                                        <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon e-border"  />
                                                            <CustomToolTip Content="<h6>Apply the border.</h6>" Title="Border" />
                                                                                                           </ej:ContentGroup>
                                                </ContentGroupCollection>
                                            </ej:TabContent>
                                            <ej:TabContent>
                                                <ContentDefaults IsBig="false" Type="Button" />
                                                <ContentGroupCollection>
                                                    <ej:ContentGroup Id="alignleft" Text="JustifyLeft" >
                                                        <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon alignleft"  />
                                                            <CustomToolTip Content="<h6>Justify Left</h6>" Title="Justify Left" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="aligncenter" Text="JustifyCenter" >
                                                        <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon aligncenter "  />
                                                            <CustomToolTip Content="<h6>Justify Center.</h6>" Title="Justify Center" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="alignright" Text="JustifyRight" >
                                                        <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon alignright"  />
                                                            <CustomToolTip Content="<h6>Justify Right.</h6>" Title="JustifyRight" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="justify" Text="JustifyFull" EnableSeparator="true">
                                                        <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon justify"  />
                                                            <CustomToolTip Content="<h6>Justify Full.</h6>" Title="JustifyFull" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="uppercase" Text="uppercase" >
                                                        <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon e-uppercase"  />
                                                            <CustomToolTip Content="<h6>Upper Case.</h6>" Title="UpperCase" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="lowercase" Text="Lower Case" >
                                                        <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon e-lowercase"  />
                                                            <CustomToolTip Content="<h6>Lower Case.</h6>" Title="LowerCase" />
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
                                                    <ej:ContentGroup Id="undo" Text="Undo"  IsBig="false">
                                                        <ButtonSettings ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-icon e-ribbon e-undo"  Type="Button" />
                                                        <CustomToolTip Content="<h6>Undo.</h6" Title="Undo" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="redo" Text="Redo" >
                                                        <ButtonSettings ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-icon e-ribbon e-redo"  Type="Button" />
                                                        <CustomToolTip Content="<h6>Redo.</h6>" Title="Redo" />
                                                    </ej:ContentGroup>
                                                </ContentGroupCollection>
                                            </ej:TabContent>
                                        </ContentCollection>
                                    </ej:TabGroup>
                                    <ej:TabGroup Text="Views" AlignType="Rows">
                                        <ContentCollection>
                                            <ej:TabContent>
                                                <ContentDefaults Type="Button" IsBig="false" Height="75" Width="71" />
                                                <ContentGroupCollection>
                                                    <ej:ContentGroup Id="zoomin" Text="Zoom In" >
                                                        <ButtonSettings ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-icon e-ribbon e-undoe-ribbon e-zoomin"  Type="Button" />
                                                        <CustomToolTip Content="<h6>Zoom In.</h6>" Title="ZoomIn" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="zoomout" Text="Zoom Out" >
                                                        <ButtonSettings ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-icon e-ribbon e-zoomout"  Type="Button" />
                                                        <CustomToolTip Content="<h6>Zoom Out.</h6>" Title="ZoomOut" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="fullscreen" Text="Full Screen" >
                                                        <ButtonSettings ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-icon e-ribbon e-fullscreen"  Type="Button" />
                                                           <CustomToolTip Content="<h6>Full Screen.</h6>" Title="FullScreen"/>
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
                                                    <ej:ContentGroup Id="tables" Text="Tables">
                                                        <ButtonSettings Type="Button" ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-icon e-ribbon e-table"  />
                                                             <CustomToolTip Content="<h6>Tables.</h6>" Title="Tables" />
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
                                                    <ej:ContentGroup Id="pictures" Text="Pictures" >
                                                        <ButtonSettings Type="Button" ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-icon e-ribbon e-picture"  />
                                                          <CustomToolTip Content="<h6>Pictures.</h6>" Title="Pictures" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="videos" Text="Videos" >
                                                        <ButtonSettings Type="Button" ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-icon e-ribbon e-video"  />
                                                          <CustomToolTip Content="<h6>Videos.</h6>" Title="Videos" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="shapes" Text="Shapes" >
                                                        <ButtonSettings Type="Button" ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-icon e-ribbon e-shape"  />
                                                            <CustomToolTip Content="<h6>Shapes.</h6>" Title="Shapes" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="chart" Text="Chart" >
                                                        <ButtonSettings Type="Button" ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-icon e-ribbon e-chart"  />
                                                            <CustomToolTip Content="<h6>Chart.</h6>" Title="Chart" />
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
                                                    <ej:ContentGroup Id="comments" Text="Comments">
                                                        <ButtonSettings Type="Button" ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-icon e-ribbon e-comment"  />
                                                           <CustomToolTip Content="<h6>Comments.</h6>" Title="Comments" />
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
                                                    <ej:ContentGroup Id="text" Text="Text" >
                                                        <ButtonSettings Type="Button" ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-icon e-ribbon e-text" Width="50"  />
                                                          <CustomToolTip Content="<h6>Text.</h6>" Title="Text" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="datetime" Text="DateTime">
                                                        <ButtonSettings Type="Button" ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-icon e-ribbon e-datetimenew" Width="65"  />
                                                         <CustomToolTip Content="<h6>Date Time.</h6>" Title="DateTime" />
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
                                                    <ej:ContentGroup Id="hyperlink" Text="Hyperlink">
                                                        <ButtonSettings Type="Button" ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-icon e-ribbon e-hyperlink"  />
                                                          <CustomToolTip Content="<h6>Hyperlink.</h6>" Title="Hyperlink" />
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
                                                    <ej:ContentGroup Id="equation" Text="Equation">
                                                        <ButtonSettings Type="Button" ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-icon e-ribbon e-equation"  />
                                                           <CustomToolTip Content="<h6>Equation.</h6>" Title="Equation" />                                                 
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
                                                    <ej:ContentGroup Id="printlayout" Text="Print Layout">
                                                        <ButtonSettings Type="Button" ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-icon e-ribbon e-printlayout"  />
                                                             <CustomToolTip Content="<h6>Print Layout.</h6>" Title="PrintLayout" />
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
                                                    <ej:ContentGroup Id="print" Text="Print">
                                                        <ButtonSettings Type="Button" ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-icon e-ribbon e-print"  />
                                                            <CustomToolTip Content="<h6>Print.</h6>" Title="Print" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="save" Text="Save">
                                                        <ButtonSettings Type="Button" ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-icon e-ribbon e-save"  />
                                                            <CustomToolTip Content="<h6>Save.</h6>" Title="Save" />
                                                    </ej:ContentGroup>
                                                </ContentGroupCollection>
                                            </ej:TabContent>
                                        </ContentCollection>
                                    </ej:TabGroup>
                                </TabGroupCollection>
                            </ej:RibbonTab>
                        </RibbonTabs>
                    </ej:Ribbon>
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
             
                <input id="fontcolor"/>
                <input id="fillcolor"/>
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
  <script type="text/javascript">
      
      function createControl(args) {
          $("#fontcolor").ejColorPicker({ value: "#FFFF00", modelType: "palette", cssClass: "e-ribbon", toolIcon: "e-fontcoloricon", select: colorHandler });
          $("#fillcolor").ejColorPicker({ value: "#FF0000", modelType: "palette", cssClass: "e-ribbon", toolIcon: "e-fillcoloricon", select: colorHandler });
      }
      function colorHandler(args) {
          (this._id.indexOf("fillcolor") != -1) ? $("#contenteditor").css('background-color', args.value) : document.execCommand('forecolor', false, args.value);
      }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <link href="<%=ResolveClientUrl("~/Content/ejthemes/ribbon-css/ej.icons.css")%>" rel="stylesheet" />
    <style type="text/css">
 .e-pastetip{
		   background-image: url("../Content/ejthemes/common-images/ribbon/paste.png");
		   background-repeat:no-repeat;
		   height:64px;
		   width:64px
          }
        </style>
</asp:Content>

