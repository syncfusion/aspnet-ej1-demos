<%@ Page Title="Ribbon-Resize-ASP.NET-SYNCFUSION"   Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Resize.aspx.cs" MetaDescription="This example shows how to resize ASP.NET Web Ribbon dynamically." Inherits="WebSampleBrowser.Ribbon.Resize" %>
<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Ribbon / Resize</span>
</asp:Content>
<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    
                <div>
                    <ej:Ribbon ID="defaultRibbon" runat="server" Width="100%" IsResponsive="true" Create="createControl">
                        <ExpandPinSettings ToolTip="Collapse the Ribbon"></ExpandPinSettings>
                        <CollapsePinSettings ToolTip="Pin the Ribbon"></CollapsePinSettings>
                        <ApplicationTab MenuItemID="ribbonmenu" Type="menu">
                            <MenuSettings OpenOnClick="false"></MenuSettings>               
                        </ApplicationTab>
                        <RibbonTabs>
                            <ej:RibbonTab Id="home" Text="HOME">
                                <TabGroupCollection>
                                    
                                    <ej:TabGroup Text="Clipboard" AlignType="Columns">
                                        <ContentCollection>
                                            <ej:TabContent>
                                                <ContentDefaults Width="50" Height="75" Type="Button"/>
                                                <ContentGroupCollection>
                                                    <ej:ContentGroup Id="paste" ToolTip="Paste">
                                                        <ButtonSettings ContentType="TextAndImage" Type="Button" PrefixIcon="e-icon e-ribbon e-ribbonpaste" />
                                                    </ej:ContentGroup>
                                                </ContentGroupCollection>
                                            </ej:TabContent>
                                            <ej:TabContent>
                                                <ContentDefaults Width="60" Height="25" IsBig="false" Type="Button" />
                                                <ContentGroupCollection>
                                                    <ej:ContentGroup Id="cut" ToolTip="Cut"  Text="Cut">
                                                        <ButtonSettings ContentType="TextAndImage" Type="Button" PrefixIcon="e-icon e-ribbon e-ribboncut"  />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="copy" ToolTip="Copy" Text="Copy">
                                                        <ButtonSettings ContentType="TextAndImage" Type="Button" PrefixIcon="e-icon e-ribbon e-ribboncopy"  />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="clear" ToolTip="Clear All " Text="Clear">
                                                        <ButtonSettings ContentType="TextAndImage" Type="Button" PrefixIcon="e-icon e-ribbon clearAll"  />
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
                                                        <DropdownSettings Text="Segoe UI" Width="150" ></DropdownSettings>
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="fontsize" ToolTip="FontSize" Type="DropDownList">
                                                        <DropdownSettings Text="1pt" Width="65" ></DropdownSettings>
                                                    </ej:ContentGroup>
                                                </ContentGroupCollection>
                                            </ej:TabContent>
                                            <ej:TabContent>
                                                <ContentGroupCollection>
                                                    <ej:ContentGroup Id="bold" Text="Bold" ToolTip="Bold" Type="ToggleButton">
                                                        <toggleButtonSettings ContentType="ImageOnly" ActiveText="Bold" ActivePrefixIcon="e-icon e-ribbon bold" DefaultPrefixIcon ="e-icon e-ribbon bold"  />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="italic" Text="Italic" ToolTip="Italic" Type="ToggleButton">
                                                        <toggleButtonSettings ContentType="ImageOnly" ActiveText="Italic" ActivePrefixIcon="e-icon e-ribbon e-ribbonitalic" DefaultPrefixIcon="e-icon e-ribbon e-ribbonitalic"  />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="underline" Text="Underline" ToolTip="Underline" Type="ToggleButton">
                                                        <toggleButtonSettings ContentType="ImageOnly" ActiveText="Underline" ActivePrefixIcon="e-icon e-ribbon e-ribbonunderline" DefaultPrefixIcon="e-icon e-ribbon e-ribbonunderline"  />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="strikethrough" Text="strikethrough" ToolTip="Strikethrough" Type="ToggleButton">
                                                        <toggleButtonSettings ContentType="ImageOnly" ActiveText="Strikethrough" ActivePrefixIcon="e-icon e-ribbon strikethrough" DefaultPrefixIcon="e-icon e-ribbon strikethrough"  />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="superscript" Text="superscript" ToolTip="Superscript">
                                                        <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon e- e-superscripticon"  />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="subscript" Text="subscript" ToolTip="Subscript" EnableSeparator="true">
                                                        <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon e-subscripticon"  />
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
                                                        <ButtonSettings Type="Button" ContentType="ImageOnly" ImagePosition="ImageTop" PrefixIcon="e-icon e-ribbon e-new"  />
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
                                                        <ButtonSettings ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-icon e-ribbon e-undo"  Type="Button" />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="redo" Text="Redo" ToolTip="Redo">
                                                        <ButtonSettings ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-icon e-ribbon e-redo"  Type="Button" />
                                                    </ej:ContentGroup>
                                                </ContentGroupCollection>
                                            </ej:TabContent>
                                        </ContentCollection>
                                    </ej:TabGroup>
                                    
                                </TabGroupCollection>
                            </ej:RibbonTab>
                            <ej:RibbonTab Id="insert" Text="LAYOUT">
                                <TabGroupCollection>
                                    <ej:TabGroup Text="Alignment" Type="rows">
                                        <ContentCollection>
                                            <ej:TabContent>
                                                <ContentDefaults Type="Button" IsBig="false" />
                                                <ContentGroupCollection>
                                                    <ej:ContentGroup Id="bullet" Text="Bullet Format" ToolTip="Bullets">
                                                        <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon e-bullet"  />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="number" Text="Number Format" ToolTip="Numbering" EnableSeparator="true">
                                                        <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon e-numbericon"  />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="textindent" Text="Indent" ToolTip="Text Indent">
                                                        <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon e-indent"  />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="textoudent" Text="Oudent" ToolTip="Text Oudent" EnableSeparator="true">
                                                        <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon e-outdent"  />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="sortascending" Text="Sort" ToolTip="Sort" EnableSeparator="true">
                                                        <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon e-sort"  />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="border" Text="Border" ToolTip="Border">
                                                        <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon e-border"  />
                                                    </ej:ContentGroup>
                                                </ContentGroupCollection>
                                            </ej:TabContent>
                                            <ej:TabContent>
                                                <ContentDefaults IsBig="false" Type="Button" />
                                                <ContentGroupCollection>
                                                    <ej:ContentGroup Id="alignleft" Text="JustifyLeft" ToolTip="Align Left">
                                                        <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon alignleft"  />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="aligncenter" Text="JustifyCenter" ToolTip="Align Center">
                                                        <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon aligncenter "  />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="alignright" Text="JustifyRight" ToolTip="Align Right">
                                                        <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon alignright"  />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="justify" Text="JustifyFull" ToolTip="Justify" EnableSeparator="true">
                                                        <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon justify"  />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="uppercase" Text="uppercase" ToolTip="Upper case">
                                                        <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon e-uppercase"  />
                                                    </ej:ContentGroup>
                                                    <ej:ContentGroup Id="lowercase" Text="Lower Case" ToolTip="Lower Case">
                                                        <ButtonSettings ContentType="ImageOnly" Type="Button" PrefixIcon="e-icon e-ribbon e-lowercase"  />
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
                                                        <ButtonSettings Type="Button" ContentType="TextAndImage" ImagePosition="ImageTop" PrefixIcon="e-icon e-ribbon e-printlayout"  />
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
<asp:Content ID="PropertyContetnt" runat="server" ContentPlaceHolderID="PropertySection">
    <div class="cols-prop-area">
                <div id="sampleProperties">
                    <div class="heading">
                        <span>Properties</span>
                    </div>
                    <div class="prop-grid">
                        <div class="row">
                            <div class="col-md-3">
                                Resize
                            </div>
                            <div class="col-md-3">
                                <ej:DropDownList ID="resize" runat="server" Text="100%" Width="90px"  ClientSideOnChange="onresize">
                        <Items>
                           
                            <ej:DropDownListItem Text="100%" Value="1" />
                            <ej:DropDownListItem Text="70%" Value="2" />
                            <ej:DropDownListItem Text="50%" Value="3" />
                            </Items>
                    </ej:DropDownList>
                              
                            </div>
                        </div>
                        
                        
                    </div>
                     </div>
         </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        var ribbonObj;
        $(function () {

            ribbonObj = $('#<%= defaultRibbon.ClientID %>').data("ejRibbon");
          
        });
        function onresize(args) {
        
            if (ribbonObj.model)
                ribbonObj.option({ width: args.selectedText });
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <link href="<%=ResolveClientUrl("~/Content/ejthemes/ribbon-css/ej.icons.css")%>" rel="stylesheet" />
    <style type="text/css">
         
   .e-ribbon .e-Font:before {
    font-family: 'ej-ribbonfont';
    content: "\e159"; 
	font-size: 28px;
	text-indent: -1.5px;
	line-height:35px;
   }
  .e-ribbon .e-New:before {
   font-family: 'ej-ribbonfont';
   content: "\e166";
   font-size: 28px;
   text-indent: -1.5px;
   line-height:35px;
   }
 .e-ribbon .e-Actions:before {
   font-family: 'ej-ribbonfont';
   content: "\e177";
   font-size: 28px;
   text-indent:7px;
   line-height:35px;
  }
   </style>
  
</asp:Content>


