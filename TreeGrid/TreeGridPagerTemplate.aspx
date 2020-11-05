<%@ Page Title="TreeGrid-Pager Template-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates defining pager templates used for switching the pages in the Syncfusion tree grid control." AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="TreeGridPagerTemplate.aspx.cs" Inherits="WebSampleBrowser.TreeGrid.TreeGridPagerTemplate" %>


<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">TreeGrid / PagerTemplate</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:TreeGrid runat="server" ClientIDMode="Static" ID="TreeGridControlPagerTemplate" ChildMapping="SubTasks" AllowPaging="true" 
            ActionComplete="complete" TreeColumnIndex="1" Create="create" IsResponsive="true">            
            <PageSettings Template="#Template" />
            <Columns>
                <ej:TreeGridColumn HeaderText="Task Id" Field="TaskID" Width="45" />
                <ej:TreeGridColumn HeaderText="Task Name" Field="TaskName" />
                <ej:TreeGridColumn HeaderText="Start Date" Field="StartDate" />
                <ej:TreeGridColumn HeaderText="End Date" Field="EndDate" />
                <ej:TreeGridColumn HeaderText="Duration" Field="Duration" />
                <ej:TreeGridColumn HeaderText="Progress" Field="Progress" />
            </Columns>                                   
            <SizeSettings Width="100%" />
            <EditSettings AllowDeleting="false" />          
        </ej:TreeGrid>
    </div>
    
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/x-jsrender" id="Template">
    <div class="e-pagercontainer">
        <div class="e-first e-icon e-mediaback e-firstpagedisabled e-disable" title="Go to first page"></div><div class="e-prev e-icon e-arrowheadleft-2x e-prevpagedisabled e-disable" style="border-right:none" title="Go to previous page"></div>
    </div>
    <div class="e-pagercontainer e-currentPageContainer" style="border-radius:0px">
        <input id="currentPage" type="text" style="text-align:center; margin:0px;border:none;width:32px;height:23px" />
    </div>
    <div id="totalPages" class="e-pagercontainer" style="margin-left:2px; margin-bottom:5px;border:none">
        <span></span>
    </div>
    <div class="e-pagercontainer">
        <div class="e-nextpage e-icon e-arrowheadright-2x e-default" title="Go to next page"></div><div class="e-lastpage e-icon e-mediaforward e-default" title="Go to last page"></div>
    </div>
</script>
    <style>
	    #currentPage{
		     background-color:white;
		}
        .office-365 .e-currentPageContainer,
        .material .e-currentPageContainer{       
            border-bottom:1px solid #e0e0e0!important;
        }
		.darktheme #currentPage{
		     background-color:black;
		}
        .e-pager .e-pagercontainer {
        margin:0px;
        margin-left: 6px;
       } 
 	   .e-pagercontainer .e-icon {
            display: inline-block;
            height: 8px;
        }
	</style>

    <script type="text/javascript">
        function create(arg) {
            $("#currentPage").keydown(function (e) {
                var obj = $("#TreeGridControlPagerTemplate").data("ejTreeGrid");
                var val = parseInt($("#currentPage").val());
                if (e.keyCode == 13 && !isNaN(val)) {
                    if (val > obj.model.pageSettings.totalPages)
                        val = obj.model.pageSettings.totalPages;
                    if (val <= 0)
                        val = 1;
                    obj.gotoPage(val);
                    return false;
                }
            });
        }
        function complete(args) {
            $("#totalPages").find('span').text('of ' + this.model.pageSettings.totalPages);

            $(".e-pagercontainer:first").css('border-style', 'none');
            if (args.requestType == 'paging' || args.requestType == 'refresh') {
                if (this.model.pageSettings.currentPage == this.model.pageSettings.totalPages) {
                    this.element.find('.e-nextpage').addClass('e-nextpagedisabled').removeClass('e-nextpage');
                    this.element.find('.e-lastpage').addClass('e-lastpagedisabled').removeClass('e-lastpage');
                }
                else {
                    this.element.find('.e-nextpagedisabled').addClass('e-nextpage').removeClass('e-nextpagedisabled');
                    this.element.find('.e-lastpagedisabled').addClass('e-lastpage').removeClass('e-lastpagedisabled');
                }
                if (this.model.pageSettings.currentPage == 1) {
                    this.element.find('.e-prevpage').addClass('e-prevpagedisabled e-disable').removeClass('e-prevpage');
                    this.element.find('.e-firstpage').addClass('e-firstpagedisabled e-disable').removeClass('e-firstpage');
                }
                else {
                    this.element.find('.e-prevpagedisabled').addClass('e-prevpage').removeClass('e-prevpagedisabled e-disable');
                    this.element.find('.e-firstpagedisabled').addClass('e-firstpage').removeClass('e-firstpagedisabled e-disable');
                }
                $("#currentPage").val(this.model.pageSettings.currentPage);
            }            
        }
    </script>

	</asp:Content>

