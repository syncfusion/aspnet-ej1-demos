<%@ Page Title="DateTimePicker-Localization-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="Localization.aspx.cs" MetaDescription="This example demonstrates how to localize the datetimepicker in a ASP.NET Web Forms" Inherits="WebSampleBrowser.DateTimePicker.localization" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadSection" runat="server">
    <style type="text/css">
           .frame {
            padding: 50px;
            width: 30%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:DateTimePicker ID="dateTime" runat="server" Locale="en-US" Width="100%"></ej:DateTimePicker>
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
                    <ej:DropDownList runat="server" ID="culture" TargetID="culturelist" ClientSideOnChange="onCultureChange" Width="100px" SelectedItemIndex="0"></ej:DropDownList>
                    <div id="culturelist">
                        <ul>
                            <li>en-US</li>
                            <li>vi-VN</li>
                            <li>zh-CN</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/cultures/ej.culture.en-US.min.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/cultures/ej.culture.zh-CN.min.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/cultures/ej.culture.vi-VN.min.js")%>' type="text/javascript"></script>


    <script type="text/javascript">
        var timeobject;
        $(function () {
            dateTimeobject = $("#<%=dateTime.ClientID%>").data("ejDateTimePicker");
            dateTimeobject.setModel({ "value": new Date() });
            var ddObj = $("#<%=culture.ClientID%>").ejDropDownList("instance");
            ddObj.option({ selectedItemByIndex: 0 });

            $("#sampleProperties").ejPropertiesPanel();
        });

        function onCultureChange(args) {
            var texts = {};
            var placeholder;
            if (args.text == "en-US") {
                texts = { today: "Today", timeNow: "Time Now", done: "Done", timeTitle: "Time" };
                placeholder = "Select datetime";
            }
            else if (args.text == "vi-VN") {
                texts = { today: "hôm nay", timeNow: "Bây giờ là", done: "được rồi", timeTitle: "thời gian" };
                placeholder = "Chọn ngày giờ";
            }
            else if (args.text == "zh-CN") {
                texts = { today: "今天", timeNow: "現在時間", done: "做过", timeTitle: "时间" };
                placeholder = "选择日期时间";
            }
            dateTimeobject.setModel({ "locale": args.text, buttonText: texts, watermarkText: placeholder });
        }
    </script>
</asp:Content>

