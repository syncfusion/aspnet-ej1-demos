<%@ Page Title="Pager-API's-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" MetaDescription="This example demonstrates the pager various properties like pagesize, pagecount,totalpages and totalrecordscount in a ASP.NET Web Forms" AutoEventWireup="true" CodeBehind="APIs.aspx.cs" Inherits="WebSampleBrowser.Pager.APIs" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:Pager runat="server" ID="pager" PageCount="5" PageSize="1" TotalRecordsCount="20" CurrentPage="1" ClientSideOnChange="pagerChange" IsResponsive="true"></ej:Pager>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    PageCount
                </div>
                <div class="col-md-3 col-xs-4">
                   <ej:NumericTextBox runat="server" ID="pageCount" ClientSideOnChange="pageChange" MinValue="1" Value="5"></ej:NumericTextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    CurrentPage
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:NumericTextBox runat="server" ID="currentPage" ClientSideOnChange="currentPageChange" MinValue="1" Value="1"></ej:NumericTextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    PageSize
                </div>
                <div class="col-md-3 col-xs-4">
                   <ej:NumericTextBox runat="server" ID="pageSize" ClientSideOnChange="pageSizeChange" MinValue="1" MaxValue="5" Value="1"></ej:NumericTextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    RecordsCount
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:NumericTextBox runat="server" ID="recordsCount" ClientSideOnChange="recordsCountChange" MinValue="1" Value="20"></ej:NumericTextBox>
                </div>
            </div>
        </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        $(function () {
            pagerObj = $("#<%=pager.ClientID%>").data("ejPager");
            currentpageObj = $("#<%=currentPage.ClientID%>").data("ejNumericTextbox");
            pageCountObj = $("#<%=pageCount.ClientID%>").data("ejNumericTextbox");
            $("#sampleProperties").ejPropertiesPanel();
        });
        function pagerChange(args) {
            currentpageObj.option("value", pagerObj.model.currentPage);
        }
        function pageChange(args) {
            if (args.value < 8) {
                pagerObj.option("pageCount", args.value);
            }
            else {
                pagerObj.option("pageCount", 8);
                pageCountObj.option("maxValue", 8);
            }

        }
        function currentPageChange(args) {
            pagerObj.option("currentPage", args.value);
            currentpageObj.option("maxValue", pagerObj.model.totalPages);

        }

        function pageSizeChange(args) {
            pagerObj.option("pageSize", args.value);
            currentpageObj.option("maxValue", pagerObj.model.totalPages);
            pageCountObj.option("maxValue", pagerObj.model.totalPages);

        }

        function recordsCountChange(args) {
            pagerObj.option("totalRecordsCount", args.value);
            currentpageObj.option("maxValue", pagerObj.model.totalPages);
            pageCountObj.option("maxValue", pagerObj.model.totalPages);
        }

    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
     <style type="text/css">

        .frame {
             width:600px;
        }

    </style>
</asp:Content>

