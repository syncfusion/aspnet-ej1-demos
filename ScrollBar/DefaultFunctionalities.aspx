<%@ Page Title="ScrollBar-Default Functionalities-ASP.NET-SYNCFUSION"   Language="C#" AutoEventWireup="true" MetaDescription="This example demonstrates how to achieve the targetpane property in ASP.NET Web Forms scroller" MasterPageFile="~/Samplebrowser.Master" CodeBehind="DefaultFunctionalities.aspx.cs" Inherits="WebSampleBrowser.ScrollBar.DefaultFunctionalities" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="control">


        <ej:Scroller ID="scrollcontent" runat="server" Height="300" Width="100%">
            <ScrollerContent>
                <div>
                    <div class="sampleContent">
                        <h3 style="font-size: 20px;">MVC</h3>
                        <div>
                            <p>
                                Model–view–controller (MVC) is a software architecture pattern which separates the
                                    representation of information from the user's interaction with it.
                                    The model consists of application data, business rules, logic, and functions. A view can be any
                                    output representation of data, such as a chart or a diagram. Multiple views of the same data 
                                    are possible, such as a bar chart for management and a tabular view for accountants. 
                                    The controller mediates input, converting it to commands for the model or view.The central 
                                    ideas behind MVC are code reusability and n addition to dividing the application into three 
                                    kinds of components, the MVC design defines the interactions between them.
                            </p>
                            <ul>
                                <li>
                                    <b>A controller </b>can send commands to its associated view to change the view's presentation of the model (e.g., by scrolling through a document). 
                                                 It can also send commands to the model to update the model's state (e.g., editing a document).
                                </li>
                                <li>
                                    <b>A model</b> notifies its associated views and controllers when there has been a change in its state. This notification allows the views to produce updated output, and the controllers to change the available set of commands. 
                                                A passive implementation of MVC omits these notifications, because the application does not require them or the software platform does not support them.
                                </li>
                                <li>
                                    <b>A view</b> requests from the model the information that it needs to generate an output representation to the user.
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </ScrollerContent>
        </ej:Scroller>
    </div>
</asp:Content>
<asp:Content ID="content10" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        $(window).on('resize', function () {
            var scrollObj = $("#<%=scrollcontent.ClientID%>").ejScroller("instance");
            scrollObj.refresh();
        });
        $(window).on('load',function() {
            var scrollObj = $("#<%=scrollcontent.ClientID%>").ejScroller("instance");
           scrollObj.refresh();
       });
    </script>
    </asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css" class="cssStyles">
        .control {
            border: 1px solid #bbbcbb;
            color: gray;
            width: 65%;
            height: 100%;
        }

        .sampleContent {
            width: 700px;
            padding: 15px;
        }
    </style>
</asp:Content>



