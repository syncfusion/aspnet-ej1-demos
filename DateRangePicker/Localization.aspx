<%@ Page Title="daterangepicker-Localization-ASP.NET-SYNCFUSION" Language="C#"  MasterPageFile="~/Samplebrowser.Master"  AutoEventWireup="true"
    CodeBehind="Localization.aspx.cs"  MetaDescription="This example demonstrates how to localize the daterangepicker in a ASP.NET Web Forms" Inherits="WebSampleBrowser.DateRangePicker.Localization" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:DateRangePicker ID="dateRangelocalization" Width="100%" Locale="vi-VN" runat="server"></ej:DateRangePicker>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                    <span>Select Culture</span>
                </div>
                <div class="col-md-3">
                    <ej:DropDownList runat="server" ID="culture" TargetID="culturelist"  ClientSideOnChange="onCultureChange" Width="100px" SelectedItemIndex="0"></ej:DropDownList>
                    <div id="culturelist">
                        <ul>
                            <li>vi-VN</li>
                            <li>en-US</li>
                            <li>zh-CN</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/cultures/ej.culture.vi-VN.min.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/cultures/ej.culture.en-US.min.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/cultures/ej.culture.zh-CN.min.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("../Scripts/cultures/ej.localetexts.vi-VN.min.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("../Scripts/cultures/ej.localetexts.en-US.min.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("../Scripts/cultures/ej.localetexts.zh-CN.min.js")%>' type="text/javascript"></script>
     <script type="text/javascript">
         $(function () {
            dateRangeObject = $("#<%=dateRangelocalization.ClientID%>").data("ejDateRangePicker");
            var ddobject = $("#<%=culture.ClientID%>").data("ejDropDownList");
            $("#sampleProperties").ejPropertiesPanel();
        });
        function onCultureChange(args) {
            var texts = {};
            var placeholder;
          
           if (args.text == "vi-VN") {
                texts = {
                    apply: "Ứng dụng", cancel: "hủy bỏ", reset: "Thiết lập lại"
                };
                placeholder = "Chọn Phạm vi";
            }
          else if (args.text == "en-US") {
                texts = { apply: "Apply", cancel: "Cancel", reset: "Reset" };
                placeholder = "Select dateRange";
            }
            else if (args.text == "zh-CN") {
                texts = {
                    apply: "应用",
                    cancel: "取消",
                    reset: "重启"
                };
                placeholder = "选择范围";
            }

            dateRangeObject.setModel({ "locale": args.text, buttonText: texts, watermarkText: placeholder });
        }

    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .control {
            width: 100%;
        }

        .frame{
            width: 50%;
        }

        .control .e-daterangewidget {
            width: 225px;
            margin: auto;
        }
          @media (max-width: 979px) and (min-width: 439px) {
            .e-daterangewidget .e-padding {
                padding: 0 24px 0 0;
                margin-right: 30px;
            }
        }
    </style>
</asp:Content>

