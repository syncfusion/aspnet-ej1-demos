<%@ Page Title="Ribbon-On Demand-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="OnDemand.aspx.cs" MetaDescription="This example shows how the ASP.NET Web Ribbon loads items on demand." Inherits="WebSampleBrowser.Ribbon.OnDemand" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Ribbon / On Demand</span>
</asp:Content>
<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Ribbon ID="defaultRibbon" runat="server" Width="100%" Create="createControl" EnableOnDemand="true">
            <ExpandPinSettings ToolTip="Collapse the Ribbon"></ExpandPinSettings>
            <CollapsePinSettings ToolTip="Pin the Ribbon"></CollapsePinSettings>
            <ApplicationTab Type="Backstage">
                <BackstageSettings HeaderWidth="120" Text="FILE" Height="350" Width="1000">
                <PageCollection>
                    <ej:BackstagePage Id="info" Text="Info" ItemType="Tab" ContentID="infoCon"/>
                    <ej:BackstagePage Id="newtab" Text="New" EnableSeparator="true" ContentID="newCon"/>
                    <ej:BackstagePage Id="close" Text="Close"  ItemType="Button"/>
                </PageCollection>
              </BackstageSettings>
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
            </RibbonTabs>
        </ej:Ribbon>
    </div>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="EventSection">
      	  	  <div id="infoCon" Style="display:none">
	<div style="display:table-cell;padding-top:10px">
	<table> 
	<tr>
	<td> 
	<button id="spltbutton1" type="button" class="e-bsinfobtnstyle e-bssplbtn1">Protect Workbook</button>
     <ul id="Ul51">
         <li><span>Mark as Final</span></li>
         <li><span>Encrypt Password</span></li>
     </ul>    
	 </td>
	 <td style="vertical-align: top;padding-left:10px">
	<span class="e-bsptitle" style="font-size:18px">Protect Workbook</span>
	<span style="display:block">Control what types of changes people can make to this workbook.</span>
	</td>
	</tr>
	<tr>
	<td style="padding-top:10px"> 
	<button id="spltbutton2" type="button" class="e-bsinfobtnstyle e-bssplbtn2">Check for Issues</button>
     <ul id="Ul52">
         <li><span>Inspect Document</span></li>
     </ul>   
	 </td>
	  <td style="vertical-align: top;padding-left:10px;padding-top:10px">
	 <span class="e-bsptitle" style="font-size:18px">Inspect Workbook</span>
	<span style="display:block">Before publishing this file,be aware that it contains:</span>
	<ul><li style="list-style-type: square" class="e-inspectli"><span class="e-inspectcon">Author's name and absolute path</span></li></ul>
	</td>
	</tr>
	<tr>
	<td style="padding-top:10px"> 
	<button id="spltbutton3" type="button" class="e-bsinfobtnstyle e-bssplbtn3" style="font-size:18px">Manage Versions</button>
     <ul id="Ul53">
         <li><span>Recover Workbooks</span></li>
     </ul>       
	 </td>
	  <td style="vertical-align: top;padding-left:10px;padding-top:10px">
	<span class="e-bsptitle" style="font-size:18px">Versions</span>
	<span style="display:block">There are no previous versions of this file.</span>
	</td>
	</tr>
	<tr>
	<td style="padding-top:10px"> 
	<button id="btnlast" class="e-bsinfobtnstyle">Browser view Options</button>           
	 </td>
	 <td style="vertical-align: top;padding-left:10px;padding-top:10px">
	<span class="e-bsptitle" style="font-size:18px">Browser View Options</span>
	<span style="display:block">Pick what users can see when this workbook is viewed on the Web.</span>
	</td>
	</tr>
	</table>	
	</div>
	<div style="display:table-cell;padding-left:50px;vertical-align: top">
	<table>
	<tr><span class="e-bsptitle" style="font-size:17px">Properties</span></tr>
	<tr>
	<td style="width:125px">Size</td>
	<td>Not saved yet</td>
	</tr>
	<tr>
	<td style="width:125px">Tags</td>
	<td>Add a title</td>
	</tr>
	<tr>
	<td style="width:125px">Title</td>
	<td>Add a tag</td>
	</tr>
	<tr>
	<td style="width:125px">Categories</td>
	<td>Add a category</td>
	</tr>
	</table>
	
	<div style="padding-top: 15px">
    <div class="e-bsptitle" style="font-size:17px">Related Dates</div>
	<div>Last Modified</div>
	<div>Created</div>
	<div>Last Printed</div>
	</div>
    
	<div style="padding-top: 15px">
	<span class="e-bsptitle" style="font-size:17px">Related People</span>
	<table>
	<tr>
	<td style="width:125px">Author</td>
	<td class="e-accuser e-newpageicon"></td>
	<td>user</td>
	</tr>
	<tr>
	<td colspan="3" style="text-align:right"><span class="e-author">Add an author</span></td>
	</tr>
	<tr>
	<td style="width:126px">Last Modified by</td>
	<td colspan="2">Not saved yet</td>
	</tr>
	<tr><td><a href="#" class="e-infoprop">Show All Properties</a><td></tr>
	</table>
	</div>
	</div>
	</div>
	<div id="newCon" Style="display:none">
	<table>
	<tr><td><input type="text" id="autocomplete" /></tr></td>
	<tr><td class="e-suggestsearch" style="padding-top:5px">Suggested searches:
	<a href="#">Business</a>
	<a href="#">Personal</a>
	<a href="#">Industrty</a>
	<a href="#">Small Business</a>
	<a href="#">Calculator</a>
	<a href="#">Finance-Accounting</a>
	<a href="#">Lists</a>
	</td></tr>
	<tr>
	<td><button id="btn1" class="e-bsnewbtnstyle">Blank WorkBook</button><button id="btn2" class="e-bsnewbtnstyle">Project cost tracker</button><button id="btn3" class=" e-bsnewbtnstyle">Gantt project planner</button></td>
	</tr>
	<tr>
	<td></td>
	</tr>
	</table>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
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
         
        }
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="StyleSection" runat="server">
  <link href="<%=ResolveClientUrl("~/Content/ejthemes/ribbon-css/ej.icons.css")%>" rel="stylesheet" />
  <style type="text/css">
	 .e-blank{
	  background-image: url("../Content/ejthemes/common-images/ribbon/blank.png");
	 }
	 .e-project{
	  background-image: url("../Content/ejthemes/common-images/ribbon/Project.png");
	 }
	 .e-gantt{
	  background-image: url("../Content/ejthemes/common-images/ribbon/Gantt.png");
	 }
	
	 .e-infopageicon{
	  background-repeat:no-repeat;
	  height:150px;
      width: 198px;
	 }
	 .e-accuser{
	  background-image: url("../Content/ejthemes/common-images/ribbon/User.jpg");
	 }
	 .e-protect{
	  background-image: url("../Content/ejthemes/common-images/ribbon/Protect.png");
	 }
	 .e-browser{
	  background-image: url("../Content/ejthemes/common-images/ribbon/Browser.png");
	 }
	 .e-check{
	  background-image: url("../Content/ejthemes/common-images/ribbon/Check.png");
	 }
	 .e-version{
	  background-image: url("../Content/ejthemes/common-images/ribbon/Version.png");
	 }
	 .e-newpageicon{
	  background-repeat:no-repeat;
	  height: 42px;
      width: 42px;
	 }
	 .e-ribbon .e-ribbonbackstagepage .e-bsinfobtnstyle{
	  font-family: segoe ui; 
	  border:1px solid #c9c9c9;
	  background:#fdfdfd;
	  color:#212121;
	  }
	 .e-ribbon .e-ribbonbackstagepage .e-bsnewbtnstyle{
	  font-family: segoe ui; 
	  color:#212121;
	  background:#fdfdfd;
	  margin-top:20px;
	  }
	 .e-ribbon .e-ribbonbackstagepage .e-bsinfobtnstyle:hover,
	 .e-ribbon .e-ribbonbackstagepage .e-bsnewbtnstyle:hover{
	  color:black;
	 }
	 .e-bssplbtn1 .e-split-btn-div{
      text-indent: 40px;
      top: 64px;
	 }
	 .e-bssplbtn2 .e-split-btn-div{
      text-indent: 26px;
      top: 64px;
	 }
	 .e-bssplbtn3 .e-split-btn-div{
      text-indent: 34px;
      top: 64px;
	 }
	 .e-bsinfobtnstyle .e-btntxt{
      font-size:14px;
	 }
	 .e-bssplbtn1 .e-btntxt,.e-bssplbtn2 .e-btntxt{
      position: relative;
	  left: -6px;
	 }
	 .e-bssplbtn3 .e-btntxt{
      position: relative;
	  left: -8px;
	 }
	 .e-suggestsearch a{
	  padding-left:7px;
	 }
	 .e-author{
	  color:#939393;
	 }
	 .e-ribbonbackstagepage,.e-inspectcon{
	  color:#565656;
	 }
	 .e-bsptitle{
	  color:#000000;
	 }
	 .e-infoprop{
	  color:#0072c6;
	 }
	 .e-inspectli{
	  color:#aaaaaa;
	 }
	 .e-bssplbtn2 .e-newpageicon,.e-bssplbtn3 .e-newpageicon{
      position: relative;
      left: -5px;
     }
	.darktheme .e-ribbon .e-bsinfobtnstyle{
	 font-family: segoe ui; 
	 border:1px solid #303030;
	 background:#1f1f1f;
	 color:#c1c1c1;
	}
    .darktheme .e-ribbon .e-bsnewbtnstyle{
	 font-family: segoe ui;
	 background:#1f1f1f;
	 color:#c1c1c1;
    }
    .cols-sample-area {
     width: 100% !important;
    }
	.row.cols-sample-area {
           min-height: 490px !important;
        }
    </style>
</asp:Content>

