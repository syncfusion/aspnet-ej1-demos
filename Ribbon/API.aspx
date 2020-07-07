<%@ Page Title="Ribbon-API's-ASP.NET-SYNCFUSION"   Language="C#"  MasterPageFile="~/Samplebrowser.Master"  AutoEventWireup="true" CodeBehind="API.aspx.cs" MetaDescription="This example demonstrates the various methods like hideTab and showTab in a ASP.NET Web Forms Ribbon" Inherits="WebSampleBrowser.Ribbon.API_s" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Ribbon / API's</span>
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
                                Active Item
                            </div>
                            <div class="col-md-3">
                                <ej:DropDownList ID="activeItem" runat="server" Width="123px" WatermarkText="Select" ClientSideOnChange="setActiveItem">
                        <Items>
                            <ej:DropDownListItem Text="HOME" Value="1" />
                            <ej:DropDownListItem Text="CALCULATOR" Value="2" />
                            <ej:DropDownListItem Text="DESIGN" Value="3" />
                    
                        </Items>
                    </ej:DropDownList>
                              
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                Hide Tab
                            </div>
                            <div class="col-md-3">
                                <ej:DropDownList ID="hidetab" runat="server"  Width="123px" WatermarkText="Select" ClientSideOnChange="onhide">
                        <Items>
                            <ej:DropDownListItem Text="HOME" Value="HOME" />
                            <ej:DropDownListItem Text="CALCULATOR" Value="CALCULATOR" />
                            <ej:DropDownListItem Text="DESIGN" Value="DESIGN" />
                           
                        </Items>
                    </ej:DropDownList>
                               
                            </div>
                            <div class="col-md-3">
                                Show Tab
                            </div>
                            <div class="col-md-3">
                                <ej:DropDownList ID="showtab" runat="server" Width="123px" WatermarkText="Select"  ClientSideOnChange="onshow"> 
                        <Items>
                            <ej:DropDownListItem Text="HOME" Value="HOME" />
                            <ej:DropDownListItem Text="CALCULATOR" Value="CALCULATOR" />
                            <ej:DropDownListItem Text="DESIGN" Value="DESIGN" />
                           
                        </Items>
                    </ej:DropDownList>
                                
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                Disable Item
                            </div>
                            <div class="col-md-3">
                                <ej:DropDownList ID="Disable" runat="server" Width="123px" WatermarkText="Select" ClientSideOnChange="onDisable">
                        <Items>
                            <ej:DropDownListItem Text="HOME" Value="1" />
                            <ej:DropDownListItem Text="CALCULATOR" Value="2" />
                            <ej:DropDownListItem Text="DESIGN" Value="3" />                           
                        </Items>
                    </ej:DropDownList>
                                
                            </div>
                            <div class="col-md-3">
                                Enable Item
                            </div>
                            <div class="col-md-3">
                                <ej:DropDownList ID="Enable" runat="server"  Width="123px" WatermarkText="Select" ClientSideOnChange="onEnable">
                        <Items>
                            <ej:DropDownListItem Text="HOME" Value="1" />
                            <ej:DropDownListItem Text="CALCULATOR" Value="2" />
                            <ej:DropDownListItem Text="DESIGN" Value="3" />
                           
                        </Items>
                    </ej:DropDownList>
                                
                            </div>
                        </div>                        
                    </div>
                     </div>
         </div>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    
    <ej:Ribbon ID="defaultRibbon" runat="server" Width="100%">
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
                                        <ButtonSettings Type="Button" ContentType="ImageOnly" ImagePosition="ImageTop" PrefixIcon="e-icon e-ribbon e-new" />

                                    </ej:ContentGroup>

                                </ContentGroupCollection>
                                <ContentDefaults Width="60" Height="70" Type="Button" />

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

                    <ej:TabGroup Text="Style">
                        <ContentCollection>
                            <ej:TabContent>
                                <ContentGroupCollection>
                                    <ej:ContentGroup Text="Gallery" Type="Gallery" Id="Gallery1" Columns="3"   ItemWidth="68" ItemHeight="54" ExpandedColumns="3">
                                        <GalleryItemCollection>
                                            <ej:GalleryItem Text="Normal" ToolTip="Normal">
                                                <ButtonSettings ContentType="ImageOnly" CssClass="e-gbtnposition" PrefixIcon="e-icon e-gallerycontent1 e-gbtnimg"/>

                                            </ej:GalleryItem>
                                              <ej:GalleryItem Text="No spacing" ToolTip="No spacing">
                                                <ButtonSettings ContentType="ImageOnly" CssClass="e-gbtnposition" PrefixIcon="e-icon e-gallerycontent2 e-gbtnimg"/>

                                            </ej:GalleryItem>
                                              <ej:GalleryItem Text="Strong" ToolTip="Strong">
                                                <ButtonSettings ContentType="ImageOnly" CssClass="e-gbtnposition" PrefixIcon="e-icon e-gallerycontent3 e-gbtnimg"/>

                                            </ej:GalleryItem>
                                              <ej:GalleryItem Text="Emphasis" ToolTip="Emphasis">
                                                <ButtonSettings ContentType="ImageOnly" CssClass="e-gbtnposition" PrefixIcon="e-icon e-gallerycontent4 e-gbtnimg"/>

                                            </ej:GalleryItem>
                                             
                                               
                                            
                                             </GalleryItemCollection>
                                        <CustomGalleryItemCollection>
                                            
                                             <ej:CustomGalleryItem Text="Clear Formatting" ToolTip="Clear Formatting" CustomItemType="Button">
                                                <ButtonSettings CssClass="e-extrabtnstyle"/>
                                            </ej:CustomGalleryItem>
                                             
                                        </CustomGalleryItemCollection>
                                    </ej:ContentGroup>
                                </ContentGroupCollection>
                            </ej:TabContent>
                        </ContentCollection>
                    </ej:TabGroup>

                </TabGroupCollection>
            </ej:RibbonTab>
            <ej:RibbonTab Id="Calculator" Text="CALCULATOR">
                <TabGroupCollection>
                    <ej:TabGroup Text="Numbers" AlignType="Rows">

                        <ContentCollection>

                            <ej:TabContent>
                                <ContentDefaults IsBig="false" Type="Button" />
                                <ContentGroupCollection>
                                    <ej:ContentGroup Id="Zero" Text="0" ToolTip="Zero">
                                        <ButtonSettings Type="Button" />
                                    </ej:ContentGroup>
                                    <ej:ContentGroup Id="One" Text="1" ToolTip="One">
                                        <ButtonSettings Type="Button" />
                                    </ej:ContentGroup>
                                    <ej:ContentGroup Id="Two" Text="2" ToolTip="Two">
                                        <ButtonSettings Type="Button" />
                                    </ej:ContentGroup>
                                    <ej:ContentGroup Id="Three" Text="3" ToolTip="Three">
                                        <ButtonSettings Type="Button" />
                                    </ej:ContentGroup>
                                    <ej:ContentGroup Id="Four" Text="4" ToolTip="Four">
                                        <ButtonSettings Type="Button" />
                                    </ej:ContentGroup>
                                </ContentGroupCollection>
                            </ej:TabContent>
                            <ej:TabContent>
                                <ContentDefaults IsBig="false" Type="Button" />
                                <ContentGroupCollection>
                                    <ej:ContentGroup Id="Five" Text="5" ToolTip="Five">
                                        <ButtonSettings Type="Button" />
                                    </ej:ContentGroup>
                                    <ej:ContentGroup Id="Six" Text="6" ToolTip="Six">
                                        <ButtonSettings Type="Button" />
                                    </ej:ContentGroup>
                                    <ej:ContentGroup Id="Seven" Text="7" ToolTip="Seven">
                                        <ButtonSettings Type="Button" />
                                    </ej:ContentGroup>
                                    <ej:ContentGroup Id="Eight" Text="8" ToolTip="Eight">
                                        <ButtonSettings Type="Button" />
                                    </ej:ContentGroup>
                                    <ej:ContentGroup Id="Nine" Text="9" ToolTip="Nine">
                                        <ButtonSettings Type="Button" />
                                    </ej:ContentGroup>
                                </ContentGroupCollection>
                            </ej:TabContent>

                        </ContentCollection>
                    </ej:TabGroup>

                    <ej:TabGroup Text="Point" AlignType="rows">

                        <ContentCollection>

                            <ej:TabContent>
                                <ContentDefaults Type="Button" IsBig="false" />
                                <ContentGroupCollection>
                                    <ej:ContentGroup Id="dot" Text="dot" ToolTip="Dot">
                                        <ButtonSettings Type="Button" ContentType="ImageOnly" ImagePosition="ImageBottom" PrefixIcon="e-icon e-ribbon e-dot" />

                                    </ej:ContentGroup>
                                </ContentGroupCollection>
                            </ej:TabContent>
                        </ContentCollection>
                    </ej:TabGroup>
                    <ej:TabGroup Text="Operators" AlignType="Rows">

                        <ContentCollection>

                            <ej:TabContent>
                                <ContentDefaults IsBig="false" Type="Button" />
                                <ContentGroupCollection>
                                    <ej:ContentGroup Id="plus" Text="+" ToolTip="Plus">
                                        <ButtonSettings Type="Button" />
                                    </ej:ContentGroup>
                                    <ej:ContentGroup Id="minus" Text="-" ToolTip="Minus">
                                        <ButtonSettings Type="Button" />
                                    </ej:ContentGroup>
                                    <ej:ContentGroup Id="multiply" Text="*" ToolTip="Multiply">
                                        <ButtonSettings Type="Button" />
                                    </ej:ContentGroup>
                                </ContentGroupCollection>
                            </ej:TabContent>
                            <ej:TabContent>
                                <ContentDefaults IsBig="false" Type="Button" />
                                <ContentGroupCollection>
                                    <ej:ContentGroup Id="divide" Text="/" ToolTip="Divide">
                                        <ButtonSettings Type="Button" />
                                    </ej:ContentGroup>
                                    <ej:ContentGroup Id="modulo" Text="%" ToolTip="Modulo">
                                        <ButtonSettings Type="Button" />
                                    </ej:ContentGroup>

                                </ContentGroupCollection>
                            </ej:TabContent>

                        </ContentCollection>
                    </ej:TabGroup>



                </TabGroupCollection>

            </ej:RibbonTab>


        </RibbonTabs>



        <ContextualTabs>
            <ej:ContextualTab BackgroundColor="#FCFBEB" BorderColor="#F2CC1C">
                <RibbonTabCollection>
                    <ej:RibbonTab Id="Tabs1" Text="DESIGN">
                        <TabGroupCollection>
                            <ej:TabGroup Type="custom" Text="Table Style Options" ContentID="design">
                            </ej:TabGroup>
                        </TabGroupCollection>

                        <TabGroupCollection>
                          <ej:TabGroup Text="Table Style">
                        <ContentCollection>
                            <ej:TabContent>
                                <ContentGroupCollection>
                                    <ej:ContentGroup Text="Gallery" Type="Gallery" Id="Galleryribbon1" Columns="4"   ItemWidth="68" ItemHeight="54" ExpandedColumns="4">
                                        <GalleryItemCollection>
                                            <ej:GalleryItem Text="GalleryContent1" ToolTip="GalleryContent1">
                                                <ButtonSettings ContentType="ImageOnly" CssClass="e-gbtnposition" PrefixIcon="e-icon e-gallerycontent11 e-gbtnimgg"/>

                                            </ej:GalleryItem>
                                              <ej:GalleryItem Text="GalleryContent2" ToolTip="GalleryContent2">
                                                <ButtonSettings ContentType="ImageOnly" CssClass="e-gbtnposition" PrefixIcon="e-icon e-gallerycontent12 e-gbtnimgg"/>

                                            </ej:GalleryItem>
                                              <ej:GalleryItem Text="GalleryContent3" ToolTip="GalleryContent3">
                                                <ButtonSettings ContentType="ImageOnly" CssClass="e-gbtnposition" PrefixIcon="e-icon e-gallerycontent13 e-gbtnimgg"/>

                                            </ej:GalleryItem>
                                              <ej:GalleryItem Text="GalleryContent4" ToolTip="GalleryContent4">
                                                <ButtonSettings ContentType="ImageOnly" CssClass="e-gbtnposition" PrefixIcon="e-icon e-gallerycontent14 e-gbtnimgg"/>

                                            </ej:GalleryItem>
                                              <ej:GalleryItem Text="GalleryContent5" ToolTip="GalleryContent5">
                                                <ButtonSettings ContentType="ImageOnly" CssClass="e-gbtnposition" PrefixIcon="e-icon e-gallerycontent15 e-gbtnimgg"/>

                                            </ej:GalleryItem>
                                              <ej:GalleryItem Text="GalleryContent6" ToolTip="GalleryContent6">
                                                <ButtonSettings ContentType="ImageOnly" CssClass="e-gbtnposition" PrefixIcon="e-icon e-gallerycontent16 e-gbtnimgg"/>

                                            </ej:GalleryItem>
                                              <ej:GalleryItem Text="GalleryContent7" ToolTip="GalleryContent7">
                                                <ButtonSettings ContentType="ImageOnly" CssClass="e-gbtnposition" PrefixIcon="e-icon e-gallerycontent17 e-gbtnimgg"/>

                                            </ej:GalleryItem>
                                             
                                            
                                               
                                            
                                             </GalleryItemCollection>
                                        <CustomGalleryItemCollection>
                                            <ej:CustomGalleryItem Text="New Table Styles" ToolTip="New Table Styles" CustomItemType="Button">
                                                <ButtonSettings CssClass="e-extrabtnstyle"/>
                                            </ej:CustomGalleryItem>
                                            
                                        </CustomGalleryItemCollection>
                                    </ej:ContentGroup>
                                </ContentGroupCollection>
                            </ej:TabContent>
                        </ContentCollection>
                    </ej:TabGroup>
                            </TabGroupCollection>
                    </ej:RibbonTab>
                </RibbonTabCollection>
            </ej:ContextualTab>

        </ContextualTabs>
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
                  
               
                <table id="design" class="e-designtablestyle">
                    <tr>
                        <td style="width:87px">
                            <input type="checkbox" id="check1" /><label for="check1">Header Row</label></td>
                        <td>
                            <input type="checkbox" id="Check2" checked="checked" /><label for="Check2">First Column</label></td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" id="check4" checked="checked" /><label for="check4">Total Row</label></td>
                        <td>
                            <input type="checkbox" id="Check5" /><label for="Check5">Last Column</label></td>
                    </tr>
                </table>
            
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        var ribbonObj;
        $(function () {
           ribbonObj = $('#<%= defaultRibbon.ClientID %>').data("ejRibbon");
        });
        $(document).ready(function () {
            $("#headings div").on("click", function (e) {
               var parent = $("#headings"), target = e.target.tagName != "DIV" && $(e.target).parent();
                parent.find(".e-activestyle").length && parent.children().removeClass("e-activestyle");
                $(target).addClass("e-activestyle");
            });
            $("#tables div").on("click", function (e) {
               
                var parent = $("#tables"), target = e.target.tagName != "DIV" && $(e.target).parents("div").first();
                parent.find(".e-activestyle").length && parent.children().removeClass("e-activestyle");
                $(target).addClass("e-activestyle");
            });
        });
        function onDisable(args) {
           
          if (ribbonObj.model) {

                ribbonObj.option({ disabledItemIndex: [parseInt(args.value)] });
                $('#<%=Enable.ClientID%>').ejDropDownList("clearText");
            }
        }

        function onEnable(args) {
            if (ribbonObj.model) {
                ribbonObj.option({ enabledItemIndex: [parseInt(args.value)] });
                $('#<%=Disable.ClientID%>').ejDropDownList("clearText");
            }
        }
        function setActiveItem(args) {
            if (ribbonObj.model) {
                ribbonObj.option({ selectedItemIndex: parseInt(args.value) });
            }
        }
        function onhide(e) {
            if (ribbonObj.model) {
                var tabs = $("#" + ribbonObj._id).find(".e-header .e-item");
                if (((ribbonObj.model.tabs.length + ribbonObj.model.contextualTabs[0].tabs.length) - tabs.not(":visible").length) > 1)
                    ribbonObj.hideTab(e.value);
                else
                    alert("Atleast one tab must be displayed in ribbon");
                $('#<%=showtab.ClientID%>').ejDropDownList("clearText");
            }
        }
        function onshow(e) {
            if (ribbonObj.model) {
                ribbonObj.showTab(e.value);
                $('#<%=hidetab.ClientID%>').ejDropDownList("clearText");
            }
        }
               </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <link href="<%=ResolveClientUrl("~/Content/ejthemes/ribbon-css/ej.icons.css")%>" rel="stylesheet" />
    <style type="text/css">
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
         .e-gallerycontent1 {
        background-position: -18px -20px;
        padding-top: 6px;
        padding-bottom: 3px;
    }

    .e-gallerycontent2 {
        background-position: -89px -20px;
    }

    .e-gallerycontent3 {
        background-position: -665px -20px;
    }

    .e-gallerycontent4 {
        background-position: -519px -20px;
    }

    .e-gbtnimg {
        background-image: url("../Content/ejthemes/common-images/ribbon/style.gallery.png");
        background-repeat: no-repeat;
        height: 64px;
        width: 64px;
    }

    .e-extracontent .e-extrabtnstyle {
        padding-left: 28px;
        text-align: left;
    }

    .e-ribbon .e-groupdiv .e-gallerybtn {
        margin-top: 5px;
    }

    .e-ribbon .e-js .e-btn .e-select:hover {
        display: none;
    }
  .e-gallerycontent11{
		   background-position: -12px -12px;
           }
		   .e-gallerycontent12{
		     background-position: -86px -12px;
           }
		  .e-gallerycontent13{
		     background-position: -160px -12px;
            }
		  .e-gallerycontent14{
		     background-position: -235px -12px;
            }
		  .e-gallerycontent15{
		     background-position: -309px -12px;
            }
		  .e-gallerycontent16{
		     background-position: -383px -12px;
            }
		  .e-gallerycontent17{
		     background-position: -456px -12px;
            }
		  
		  .e-gbtnposition{
		     margin-top:5px;
           }
		  .e-gbtnimgg{
		   background-image: url("../Content/ejthemes/common-images/ribbon/gallery.png");
		   background-repeat:no-repeat;
		   height:64px;
		   width:64px;
		   }
		  .e-extracontent .e-extrabtnstyle{
		   padding-left: 28px;
           text-align: left;
	      }

        .e-pastetip {
            background-image: url("../Content/ejthemes/common-images/ribbon/paste.png");
            background-repeat: no-repeat;
            height: 64px;
            width: 64px;
        }
    </style>
</asp:Content>

