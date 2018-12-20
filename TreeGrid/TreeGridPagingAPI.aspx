<%@ Page Title="TreeGrid-Paging API-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates the paging features available in the tree grid control for viewing records with pagination." AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="TreeGridPagingAPI.aspx.cs" Inherits="WebSampleBrowser.TreeGrid.TreeGridPagingAPI" %>


<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">TreeGrid / PagingAPI</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:TreeGrid runat="server" ClientIDMode="Static" ID="TreeGridControlPagingAPI" ChildMapping="SubTasks" ActionComplete="Complete" AllowPaging="true" TreeColumnIndex="1" IsResponsive="true">
            <Columns>
                <ej:TreeGridColumn HeaderText="Task Id" Field="TaskID" Width="55" />
                <ej:TreeGridColumn HeaderText="Task Name" Field="TaskName" />
                <ej:TreeGridColumn HeaderText="Start Date" Field="StartDate" />
                <ej:TreeGridColumn HeaderText="End Date" Field="EndDate" />
                <ej:TreeGridColumn HeaderText="Duration" Field="Duration" />                
            </Columns>    
            <PageSettings PageCount="5" />                               
            <SizeSettings Width="100%" />
            <EditSettings AllowDeleting="false" />          
        </ej:TreeGrid>
    </div>
    
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
    <div class="prop-grid">
        <div class="row">
            <div class="col-md-3 colwidth">
                Allow Paging
            </div>
            <div class="col-md-3">
               <ej:CheckBox ID="allowPaging" runat="server" ClientSideOnChange="AllowPaging" Checked="True"></ej:CheckBox>
            </div>
            <div class="col-md-3 colwidth">
                Page Size Mode
            </div>
            <div class="col-md-3 colwidth">
                <div id="pageList">
                    <ul>
                        <li>All</li>
                        <li>Root</li>
                    </ul>
                </div>
                <ej:DropDownList ID="pageSizeMode" ClientIDMode="Static" runat="server" TargetID="pageList"
                    WatermarkText="All" Width="100" ClientSideOnChange="PageSizeMode" />
            </div>
            <div class="col-md-3 colwidth">
                Page Size
            </div>
            <div class="col-md-3 colwidth">
                <ej:NumericTextBox ID="pageSize" ClientIDMode="Static" runat="server" Value="12" MinValue="1" MaxValue="20"
                    ClientSideOnChange="PageSize" Width="100px" DecimalPlaces="0" />
            </div>
            <div class="row">
                <div class="col-md-3 colwidth">
                    Page Count
                </div>
                <div class="col-md-3 colwidth">
                    <ej:NumericTextBox ID="pageCount" ClientIDMode="Static" runat="server" Value="5" MinValue="1" MaxValue="8"
                        ClientSideOnChange="PageCount" Width="100px" DecimalPlaces="0" />
                </div>
                <div class="col-md-3 colwidth">
                    Current Page
                </div>
                <div class="col-md-3 colwidth">
                    <ej:NumericTextBox ID="currentPage" ClientIDMode="Static" runat="server" Value="1" MinValue="1" MaxValue="27"
                        ClientSideOnChange="CurrentPage" Width="100px" DecimalPlaces="0" />
                </div>
            </div>
        </div>
    </div>
</div>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        function Complete(args) {
            var page = this.model.pageSettings;
            $("#currentPage").ejNumericTextbox({ value: page.currentPage, maxValue: page.totalPages, });

        }
        function AllowPaging(args) {
            var obj = $("#TreeGridControlPagingAPI").data("ejTreeGrid");
            if (args.isChecked) {

                obj.option("allowPaging", true);
                $("#currentPage, #pageCount, #pageSize").ejNumericTextbox("enable");
                $("#pageSizeMode").ejDropDownList("enable");
            }
            else {
                obj.option("allowPaging", false);
                $("#currentPage, #pageCount, #pageSize").ejNumericTextbox("disable");
                $("#pageSizeMode").ejDropDownList("disable");
            }

        }
        function PageCount(args) {
            var obj = $("#TreeGridControlPagingAPI").data("ejTreeGrid"),
              pagesettings = { pageCount: args.value, };
            obj.option("pageSettings", pagesettings);
        }
        function CurrentPage(args) {
            var obj = $("#TreeGridControlPagingAPI").data("ejTreeGrid"),
              pagesettings = { currentPage: args.value };
            obj.option("pageSettings", pagesettings);
        }
        function PageSize(args) {
            var obj = $("#TreeGridControlPagingAPI").data("ejTreeGrid"),
              pagesettings = { pageSize: args.value };
            obj.option("pageSettings", pagesettings);
        }
        function PageSizeMode(args) {
            var obj = $("#TreeGridControlPagingAPI").data("ejTreeGrid"),
            mode = args.value == "Root" ? "root" : "all";
            var pagesettings = { pageSizeMode: mode };
            obj.option("pageSettings", pagesettings);
        }
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
        });
        
    </script>
</asp:Content>

