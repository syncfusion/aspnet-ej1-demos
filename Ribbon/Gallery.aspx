<%@ Page Title="Ribbon-Gallery-ASP.NET-SYNCFUSION"   Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master"  CodeBehind="Gallery.aspx.cs" MetaDescription="This example shows how gallery type can be used to customize the items to display images or text in the ASP.NET Web Forms Ribbon." Inherits="WebSampleBrowser.Ribbon.Gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Ribbon / Gallery</span>
</asp:Content>
<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    
    <ej:Ribbon ID="defaultRibbon" runat="server" Width="100%">
        <ExpandPinSettings ToolTip="Collapse the Ribbon"></ExpandPinSettings>
        <CollapsePinSettings ToolTip="Pin the Ribbon"></CollapsePinSettings>
        <ApplicationTab MenuItemID="ribbonmenu" Type="menu">
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
                    <ej:TabGroup Text="Gallery">
                        <ContentCollection>
                            <ej:TabContent>
                                <ContentGroupCollection>
                                    <ej:ContentGroup Text="Gallery" Type="Gallery" Id="Gallery1" Columns="3"   ItemWidth="68" ItemHeight="54" ExpandedColumns="4">
                                        <GalleryItemCollection>
                                            <ej:GalleryItem Text="GalleryContent1" ToolTip="GalleryContent1">
                                                <ButtonSettings ContentType="ImageOnly" CssClass="e-gbtnposition" PrefixIcon="e-icon e-gallerycontent1 e-gbtnimg"/>

                                            </ej:GalleryItem>
                                              <ej:GalleryItem Text="GalleryContent2" ToolTip="GalleryContent2">
                                                <ButtonSettings ContentType="ImageOnly" CssClass="e-gbtnposition" PrefixIcon="e-icon e-gallerycontent2 e-gbtnimg"/>

                                            </ej:GalleryItem>
                                              <ej:GalleryItem Text="GalleryContent3" ToolTip="GalleryContent3">
                                                <ButtonSettings ContentType="ImageOnly" CssClass="e-gbtnposition" PrefixIcon="e-icon e-gallerycontent3 e-gbtnimg"/>

                                            </ej:GalleryItem>
                                              <ej:GalleryItem Text="GalleryContent4" ToolTip="GalleryContent4">
                                                <ButtonSettings ContentType="ImageOnly" CssClass="e-gbtnposition" PrefixIcon="e-icon e-gallerycontent4 e-gbtnimg"/>

                                            </ej:GalleryItem>
                                              <ej:GalleryItem Text="GalleryContent5" ToolTip="GalleryContent5">
                                                <ButtonSettings ContentType="ImageOnly" CssClass="e-gbtnposition" PrefixIcon="e-icon e-gallerycontent5 e-gbtnimg"/>

                                            </ej:GalleryItem>
                                              <ej:GalleryItem Text="GalleryContent6" ToolTip="GalleryContent6">
                                                <ButtonSettings ContentType="ImageOnly" CssClass="e-gbtnposition" PrefixIcon="e-icon e-gallerycontent6 e-gbtnimg"/>

                                            </ej:GalleryItem>
                                              <ej:GalleryItem Text="GalleryContent7" ToolTip="GalleryContent7">
                                                <ButtonSettings ContentType="ImageOnly" CssClass="e-gbtnposition" PrefixIcon="e-icon e-gallerycontent7 e-gbtnimg"/>

                                            </ej:GalleryItem>
                                              <ej:GalleryItem Text="GalleryContent8" ToolTip="GalleryContent8">
                                                <ButtonSettings ContentType="ImageOnly" CssClass="e-gbtnposition" PrefixIcon="e-icon e-gallerycontent8 e-gbtnimg"/>

                                            </ej:GalleryItem>
                                              <ej:GalleryItem Text="GalleryContent9" ToolTip="GalleryContent9">
                                                <ButtonSettings ContentType="ImageOnly" CssClass="e-gbtnposition" PrefixIcon="e-icon e-gallerycontent9 e-gbtnimg"/>

                                            </ej:GalleryItem>
                                               
                                            
                                             </GalleryItemCollection>
                                        <CustomGalleryItemCollection>
                                            <ej:CustomGalleryItem Text="Save Selection as new quick style" ToolTip="Save Selection as new quick style" CustomItemType="Button">
                                                <ButtonSettings CssClass="e-extrabtnstyle"/>
                                            </ej:CustomGalleryItem>
                                            <ej:CustomGalleryItem CustomItemType="Menu" MenuId="extramenu" >
                                                <MenuSettings OpenOnClick="false"  />
                                            </ej:CustomGalleryItem>
                                             <ej:CustomGalleryItem Text="Clear Formatting" ToolTip="Clear Formatting" CustomItemType="Button">
                                                <ButtonSettings CssClass="e-extrabtnstyle"/>
                                            </ej:CustomGalleryItem>
                                             <ej:CustomGalleryItem Text="Apply Styles" ToolTip="Apply Styles" CustomItemType="Button">
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
                  
                  <ul id="extramenu">
				<li><a>New Quick Step</a>
                    <ul>
                    <li><a>Move to new folder</a></li>
                    <li><a>Categorize & Move</a></li>
                    <li><a>Flag & Move</a></li>
			    	</ul>
			    </li>
                </ul>
 
    
    

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <link href="<%=ResolveClientUrl("~/Content/ejthemes/ribbon-css/ej.icons.css")%>" rel="stylesheet" />
    <style type="text/css">
        .e-gallerycontent1{
		   background-position: 0 -105px;
           }
		   .e-gallerycontent2{
		     background-position: -69px -105px;
           }
		  .e-gallerycontent3{
		     background-position: -136px -105px;
            }
		  .e-gallerycontent4{
		     background-position: 0 -53px;
            }
		  .e-gallerycontent5{
		     background-position: -69px -53px;
            }
		  .e-gallerycontent6{
		     background-position: -136px -53px;
            }
		  .e-gallerycontent7{
		     background-position: 0 0px;
            }
		  .e-gallerycontent8{
		     background-position: -69px 0px;
            }
		  .e-gallerycontent9{
		     background-position: -136px 0px;
            }
		  .e-gbtnposition{
		     margin-top:5px;
           }
		  .e-gbtnimg{
		   background-image: url("../Content/ejthemes/common-images/ribbon/homegallery.png");
		   background-repeat:no-repeat;
		   height:64px;
		   width:64px;
		   }
		  .e-ribbon.e-js .e-extracontent .e-btn.e-extrabtnstyle {
		   padding-left: 28px;
           text-align: left;
	      }

        .e-pastetip {
            background-image: url("../Content/ejthemes/common-images/ribbon/paste.png");
            background-repeat: no-repeat;
            height: 64px;
            width: 64px;
        }
		.row .cols-sample-area {
           min-height: 490px !important;
        }
    </style>
</asp:Content>

