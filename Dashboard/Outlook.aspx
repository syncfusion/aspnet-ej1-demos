<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Outlook.aspx.cs" Inherits="WebSampleBrowser.Dashboard.Outlook" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Essential Studio for ASP.NET : Outlook</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<meta name="description" content="Outlook-like user interface with Office 365 theme. It can replicate the UI for Microsoft Outlook for your web mail application.">
    <link rel="shortcut icon" href='<%= Page.ResolveClientUrl("~/Content/images/favicon.ico")%>' />
    <link rel="stylesheet" href='<%= Page.ResolveClientUrl("~/Content/bootstrap.min.css")%>' />
    <link rel="stylesheet" href='<%= Page.ResolveClientUrl("~/Content/ejthemes/ej.widgets.core.min.css")%>' />
    <link rel="stylesheet" href='<%= Page.ResolveClientUrl("~/Content/ejthemes/default-theme/ej.theme.min.css")%>' />
    <link rel="stylesheet" href='<%= Page.ResolveClientUrl("~/Content/ejthemes/responsive-css/ej.responsive.css")%>' />
    <link rel="stylesheet" href='<%= Page.ResolveClientUrl("~/Content/ejthemes/responsive-css/ejgrid.responsive.css")%>' />
    <link rel="stylesheet" href='<%= Page.ResolveClientUrl("~/Content/Dashboard/OutlookAnalysis/outlook.css")%>' />
    <link rel="stylesheet" href='<%= Page.ResolveClientUrl("~/Content/images/NewOutlook-Icon/Outlook Icon/style.css") %>' />
    <!--[if lt IE 9]>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/jquery-1.11.3.min.js")%>' type="text/javascript"></script>
    <![endif]-->
    <!--[if gte IE 9]><!-->
    <script src='<%= Page.ResolveClientUrl("~/Scripts/jquery-3.4.1.min.js")%>' type="text/javascript"></script>
    <!--<![endif]-->
    <script src='<%= Page.ResolveClientUrl("~/Scripts/jsviews.min.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/jquery.validate.min.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/respond.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/ej.web.all.min.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/jsrender.min.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/outlook.js")%>' type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div id="page" class="page">
            <div class="main-header clear">
                <div class="home-btn">
                    <span class="ej-icon-view-small-icons-01" style="margin-top: 6px; font-size: 22px"></span>
                </div>
                <div style="float: left; margin: 6px 26px;">
                        <h1 class="text" style="font-size: 21px;font-size: 21px;font-weight: normal;margin-bottom: 0px;display: inline-block;max-width: 100%;margin-top: 3px;">Outlook Demo</h1>
                </div>
            </div>
            <div class="content-container-fluid">
                <div class="row">
                    <div class="sidebar">
                        <div class="search">
                            <div class="control">
                                <ej:Autocomplete ID="searchAuto" runat="server" Width="100%" WatermarkText="Search Mail and People" PopupHeight="200px" FilterType="Contains"></ej:Autocomplete>
                                <span class="select"><span class="e-icon e-search"></span></span>
                            </div>
                            <div class="scrollContainer">
                                <div class="treewrap">
                                    <div class="treeControl">
                                        <ej:TreeView ID="treeView" runat="server" Template="#treeTemplate" ClientSideOnNodeClicked="nodeClick" DataParentIdField="pid" DataExpandedField="expanded" DataIdField="id" DataTextField="name" DataHasChildField="haschild">
                                        </ej:TreeView>
                                    </div>
                                </div>
                                <ej:Menu ID="treeviewMenu" runat="server" OpenOnClick="false" MenuType="ContextMenu" ContextMenuTarget="#treeView">
                                    <Items>
                                        <ej:MenuItem Url="#" Text="Move down in list"></ej:MenuItem>
                                        <ej:MenuItem Url="#" Text="Remove from favorites all as read"></ej:MenuItem>
                                        <ej:MenuItem Url="#" Text="Empty folder"></ej:MenuItem>
                                        <ej:MenuItem Url="#" Text="Mark all as read"></ej:MenuItem>
                                    </Items>
                                </ej:Menu>
                            </div>
                        </div>
                    </div>
                    <div style="position: absolute; top: 0px; right: auto; bottom: 0px; left: 214px; height: auto; width: 4px;">
                        <div style="position: absolute; top: 0px; right: 0px; bottom: 0px; left: 0px; height: auto; width: auto; border-left: 1px solid #e5e3e3; z-index: 3;">
                        </div>
                    </div>
                    <div class="menuwrap">
                        <div class="tool">
                            <div style="background-color: #F4F9FD;">
                                <div class="innerTool">
                                    <ej:Menu ID="menujson" runat="server" EnableSeparator="false" Width="100%" ClientSideOnClick="menuClick" DataIdField="id" DataParentIdField="parentId" DataTextField="text" DataSpriteCssField="sprite"></ej:Menu>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="restItem">
                        <div style="position: absolute; top: 0px; right: 0px; bottom: 0px; left: 0px; height: auto; width: 360px;">
                            <div class="newItem">
                                <div style="position: absolute; left: 29px; overflow: hidden; white-space: nowrap;">
                                    <span id="ItemTitle" class="ItemTitle" style="font-size: 28px; font-weight: normal;">Inbox</span>
                                </div>
                            </div>
                            <div class="listwrap">
                                <div class="listscroller">
                                    <div style="position: relative; height: auto;">
                                        <div style="position: absolute; width: 100%; bottom: auto; top: 0px;">
                                            <ej:ListView ID="templatelist" runat="server" ShowHeader="true" HeaderTitle="Today" RenderTemplate="true" Height="254" Width="355" TemplateId="listTempData" ClientSideOnMouseDown="onMouseDown"></ej:ListView>
                                            <ej:ListView ID="templatelist1" runat="server" ShowHeader="true" HeaderTitle="Yesterday" RenderTemplate="true" Height="554" Width="355" TemplateId="listTempData" ClientSideOnMouseDown="onMouseDown"></ej:ListView>
                                            <ej:Menu ID="listviewMenu" runat="server" MenuType="ContextMenu" ContextMenuTarget="#templatelist,#templatelist1" OpenOnClick="false">
                                                <Items>
                                                    <ej:MenuItem Url="#" Text="Reply"></ej:MenuItem>
                                                    <ej:MenuItem Url="#" Text="Reply All"></ej:MenuItem>
                                                    <ej:MenuItem Url="#" Text="Forward"></ej:MenuItem>
                                                    <ej:MenuItem Url="#" Text="Delete"></ej:MenuItem>
                                                    <ej:MenuItem Url="#" Text="Archive"></ej:MenuItem>
                                                    <ej:MenuItem Url="#" Text="Mark as unread"></ej:MenuItem>
                                                    <ej:MenuItem Url="#" Text="Pin"></ej:MenuItem>
                                                    <ej:MenuItem Url="#" Text="Flag"></ej:MenuItem>
                                                </Items>
                                            </ej:Menu>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div style="position: absolute; top: 0px; right: auto; bottom: 0px; left: 360px; height: auto; width: 4px;">
                                <div style="position: absolute; top: 1px; right: 0px; bottom: 0px; left: 0px; height: auto; width: auto; border-left: 1px solid #e5e3e3; z-index: 3;">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div style="position: absolute; top: 42px; right: 0px; bottom: 0px; left: 578px; height: auto; width: 788px;">
                        <div style="position: absolute; top: 0px; right: 0px; bottom: 0px; left: 0px; height: auto; width: auto; overflow-x: hidden; overflow-y: auto;">
                            <div class="paneltxt">
                                <span class="contentPanel" style="width: 500px; height: 200px; font-size: 13px">Select an item to view.</span>
                            </div>
                            <div id="iconAccordion">
                                <div style="height: 14px;">
                                    <div class="logos"></div>
                                    <div class="messageHeader">
                                        <div id="sub"></div>
                                        <br />
                                        <div id="headDate">05/05/2016</div>
                                        <div id="date"></div>
                                        <br />
                                        <div id="to"></div>
                                    </div>
                                </div>
                                <div id="accContent">
                                    <div style="margin: 24px 12px;">
                                        <div style="float: left;">Hi</div>
                                        <div id="accTo" style="margin-left: 20px;"></div>
                                        <br />
                                        <div id="accCont"></div>
                                        <br />
                                        <div id="accGreet">Thanks,</div>
                                        <div id="accFrom"></div>
                                        <div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <ej:Accordion ID="iconAccordion" runat="server" EnableMultipleOpen="true" Events="click" ClientSideOnBeforeActivate="onbeforeInActivate" ClientSideOnInActivate="onInActivate" ClientSideOnBeforeInActivate="beforeActivate" ClientSideOnActivate="InActivate">
                                <CustomIcon Header="ej-icon-expander-down---01" SelectedHeader="ej-icon-up-arrow---01" />
                            </ej:Accordion>
                            <div id="messageData">
                                <div id="mailarea" style="margin: 16px 45px 0px 28px;" class="hidden">
                                    <ej:Button ID="toButton" runat="server" Width="55px" Text="To"></ej:Button>
                                    <br />
                                    <br />
                                    <ej:Autocomplete ID="autoTo" runat="server" FilterType="Contains" Width="593px" PopupHeight="250px" PopupWidth="230px"></ej:Autocomplete>
                                    <hr class="compose" />
                                    <br />
                                    <ej:Button ID="ccButton" runat="server" Width="55px" Text="cc"></ej:Button>
                                    <ej:Autocomplete ID="autoCc" runat="server" FilterType="Contains" Width="593px" PopupWidth="230px" PopupHeight="250px"></ej:Autocomplete>
                                    <hr class="compose" />
                                    <ej:MaskEdit ID="mailsubject" runat="server" WatermarkText="Enter subject here" Width="695"></ej:MaskEdit>
                                    <hr class="compose">
                                    <br />
                                    <ej:RTE ID="rteSample" runat="server" Width="710px" Height="350px">
                                        <Tools Font="fontName,fontSize,fontColor,backgroundColor"
                                            Styles="bold,italic,underline,strikethrough"
                                            Alignment="justifyLeft,justifyCenter,justifyRight,justifyFull"
                                            Lists="unorderedList,orderedList"
                                            Clipboard="cut,copy,paste"
                                            DoAction="undo,redo"
                                            Clear="clearFormat,clearAll"
                                            Effects="superscript,subscript"
                                            Casing="upperCase,lowerCase"
                                            FormatStyle="format"
                                            Indenting="outdent,indent"
                                            Print="print">
                                        </Tools>
                                    </ej:RTE>
                                    <ej:Button ID="sendButton" runat="server" Width="65px" Type="Submit" ClientSideOnClick="Click" Text="Send"></ej:Button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <script id="treeTemplate" type="text/x-jsrender">
                        {{if hasChild}}
                        <div>{{>name}}</div>
                        {{else}}
                        <div class="treeitem" style="float: left; margin-right: 8px;">{{>name}}</div>
                        <div id="count" class="count" style="height: 20px; width: 100%;">{{>count}}</div>
                        {{/if}}
                    </script>
                    <script id="listTempData" type="text/x-jsrender">
                        <div class="{{>Class}}"></div>
                        <div class="listrightdiv">
                            <span class="templatetext">{{>ContactName}}</span> <span class="designationstyle">{{>Time}}</span>
                            <div class="subjectstyle">
                                {{>ContactTitle}}
                            </div>
                            <div class="descriptionstyle">
                                {{>Message}}
                            </div>
                            <div class="receiver" style="display: none">
                                {{>To}}
                            </div>
                        </div>
                    </script>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
