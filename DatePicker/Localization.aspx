<%@ Page Title="DatePicker-Localization-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="Localization.aspx.cs"MetaDescription="This example demonstrates how to localize the datepicker in a ASP.NET Web Forms" Inherits="WebSampleBrowser.DatePicker.localization" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:DatePicker ID="datelocalization" Value="05/28/2018" Locale="en-US" ButtonText="Today" HeaderFormat="MMMM yyyy" Width="100%" runat="server"></ej:DatePicker>
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
                    <ej:DropDownList runat="server" ID="culture" TargetID="culturelist" ClientSideOnChange="onChange" Width="100px" SelectedItemIndex="0"></ej:DropDownList>
                    <div id="culturelist">
                        <ul>
                            <li>en-US</li>
                            <li>vi-VN</li>
                            <li>fr-FR</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/cultures/ej.culture.en-US.min.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/cultures/ej.culture.fr-FR.min.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/cultures/ej.culture.vi-VN.min.js")%>' type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            var ddobject = $("#<%=culture.ClientID%>").data("ejDropDownList");
            $("#sampleProperties").ejPropertiesPanel();
        });
        function onChange(args) {
            var datebject = $("#<%=datelocalization.ClientID%>").data("ejDatePicker");
            // localizable text
            if (args.text == "vi-VN") {
                datebject.option({ buttonText: "Hôm nay" });
            }
            else if (args.text == "fr-FR") {
                datebject.option({ buttonText: "aujourd'hui" });
            }
            else {
                datebject.option({ buttonText: "Today" });
            }
            datebject.setModel({ locale: args.text });
        }

    </script>
</asp:Content>


