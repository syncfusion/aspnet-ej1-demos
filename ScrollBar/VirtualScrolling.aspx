<%@ Page Title="ScrollBar-Virtual Scrolling-ASP.NET-SYNCFUSION"   Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" MetaDescription="This example demonstrates how to achieve the virtual scrolling(loads content dynamically) in ASP.NET Web Forms Scroller" CodeBehind="VirtualScrolling.aspx.cs" Inherits="WebSampleBrowser.ScrollBar.VirtualScrolling" %>

<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="control">
        <ej:Scroller ID="scrollcontent" runat="server" Height="300" Width="100%" ClientSideOnScroll="onScroll">
            <ScrollerContent>
                <div>
                    <div class="sampleContent" unselectable="on">
                        <p><b>Scroll to see various contents loading virtually</b></p>
                        <div>
                            <p>
                                Orubase is the only mobile application development framework built especially for developing complex line-of-business mobile applications targeting iOS,Android, and Windows Phone platforms in the shortest possible timeframe.
                            </p>
                            <br />
                            <p>
                                Orubase is aimed at .NET developers and so it relies heavily on Visual Studio and ASP.NET MVC for the server-side components. When you create a project you need to list the views that application will need.
                            </p>
                            <br />
                            <p>
                                The project wizard will then create the MVC stubs for each view.Next Orubase will create the platform-specific projects.These don’t use Mono or PhoneGap/Apache Cordova. Instead Syncfusion uses a combination of native code and their own callback framework.
                            </p>
                            <p>
                                A key selling point for Orubase is that it looks and feels like native code. In many cases this is because it is native code.Features such as menus are actually created using native code to ensure they are placed correctly on each platform.
                            </p>
                            <p>
                                For most of your application the look is just clever use of HTML and CSS. The server-side MVC controls automatically change their appearance depending on what OS the client is running on.
                            </p>
                        </div>
                    </div>
                </div>
            </ScrollerContent>
        </ej:Scroller>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        var scrollerObj, contentLoaded = false; var list = 0; var newItem, newItemHeading;
        var content = ["mvccontent","aspcontent", "wpfcontent", "javascript", "lightswitch", "cloud", "bigdata"];
        $(function () {
            scrollerObj = $("#<%=scrollcontent.ClientID%>").data("ejScroller");
            $(window).on('resize', function () {
                scrollerObj.refresh();
            });
        });
       $(window).on('load',function() {
            var scrollObj = $("#<%=scrollcontent.ClientID%>").ejScroller("instance");
            scrollObj.refresh();
        });

            function onScroll(e) {
                if (scrollerObj) {
                    scrollerPositon = e.scrollTop;
                    if (!contentLoaded && document.querySelectorAll(".sampleContent")[0].scrollHeight - (e.scrollTop) <= scrollerObj.option("height")) {
                        $.ajax({
                            url: "../Content/samplecontent/" + content[list] + ".html",
                            success: function (result) {
                                newItem = $("<div unselectable='on'></div>").addClass("e-newItem").attr({ "id": "e-newItem" + list });
                                newItem.appendTo(".sampleContent");
                                newItem.html(result);
                                //refresh the scroller to adjust the scroller position automatically based on new content
                                scrollerObj.refresh();
                                scrollerObj.option("scrollTop", scrollerPositon);
                                list++;
                                if (list == content.length)
                                    contentLoaded = true;
                            }
                        });
                    }
                }
            }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css" class="cssStyles">
        .control {
            border: 1px solid #bbbcbb;
            color: gray;
            width: 65%;
            height: 100%;
        }

        .sampleContent {
            width: 650px;
            padding: 15px;
            text-align: justify;
            -webkit-touch-callout: none;
            -webkit-user-select: none;
            -khtml-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        #e-newItem0 {
            height: 400px;
        }

        #e-newItem1 {
            height: 250px;
        }

        #e-newItem3, #e-newItem2 {
            height: 340px;
        }
    </style>
</asp:Content>

