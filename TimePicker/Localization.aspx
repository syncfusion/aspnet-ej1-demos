<%@ Page Title="TimePicker-Localization-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="Localization.aspx.cs" MetaDescription="This example demonstrates how to localize the timepicker in a ASP.NET Web Forms" Inherits="WebSampleBrowser.TimePicker.localization" %>

<asp:Content ID="Content1" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .control {
            width: 210px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:TimePicker ID="time" runat="server" Width="100%" Locale="zh-CN" TimeFormat="h:mm tt"></ej:TimePicker>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                    Select Culture
                </div>
                <div class="col-md-3">
                    <select id="culture">
                        <option value="en-US">en-US</option>
                        <option value="vi-VN">vi-VN</option>
                        <option value="zh-CN">zh-CN</option>
                    </select>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/cultures/ej.culture.en-US.min.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/cultures/ej.culture.vi-VN.min.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/cultures/ej.culture.zh-CN.min.js")%>' type="text/javascript"></script>
    <script type="text/javascript">
        var timeobject;
        $(function () {
            timeobject = $("#<%=time.ClientID%>").data("ejTimePicker");
            //timeobject.option("timeFormat", "h:mm tt");
            $("#culture").ejDropDownList({ "change": "onCultureChange", width: "100px" });
            var ddObj = $("#culture").ejDropDownList("instance");
            ddObj.option({ selectedItemIndex: 0 });
            $("#sampleProperties").ejPropertiesPanel();
        });

        function onCultureChange(args) {
            timeobject.option("locale", args.value); timeobject.option({ "timeFormat": "h:mm tt" });
        }
    </script>
</asp:Content>

