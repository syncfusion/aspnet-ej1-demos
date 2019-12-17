<%@ Page Title="Grid-Pager Templates-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This demo explains how to customize a pager to show custom HTML elements to perform custom paging actions in Syncfusion ASP.NET Web Forms DataGrid control." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="PagerImprovements.aspx.cs" Inherits="WebSampleBrowser.Grid.PagerImprovements" %>
<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid /Paging/ Pager Templates</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="FlatGrid" runat="server"  AllowColumnChooser="true" ShowStackedHeader="true" AllowSorting="True" AllowPaging="True">
          <ClientSideEvents ActionComplete="complete" />
            <PageSettings ShowDefaults="false" PageSize="9" EnableTemplates="true" Template="#pagerTemplate" />
            <Columns>
                <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="True" TextAlign="Right" Width="75" />
                <ej:Column Field="CustomerID" HeaderText="Customer ID" Width="80" />
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" TextAlign="Right" Width="75" />
                <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Width="75" Format="{0:C}" />
                <ej:Column Field="OrderDate" HeaderText="Order Date" TextAlign="Right" Width="80" Format="{0:MM/dd/yyyy}" />
                <ej:Column Field="ShipCity" HeaderText="Ship City" Width="110" />
            </Columns>
        </ej:Grid>
    </div>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/x-jsrender" id="pagerTemplate">
        <div class="e-pagercontainer">
            <div class="e-first e-icon e-mediaback e-firstpagedisabled e-disable" title="Go to first page"></div><div class="e-prev e-icon e-arrowheadleft-2x e-prevpagedisabled e-disable" style="border-right:none" title="Go to previous page"></div>
        </div>
        <div class="e-pagercontainer" style="border-radius:0px" >
            <input id="currentPage" class="e-pagercontainer" type="text" style="text-align:center; margin:0px;border:none;width:32px;height:23px" />
        </div>
        <div id="totalPages" class="e-pagercontainer" style="margin-left:2px;margin-bottom:5px;border:none">
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
        function complete(args) {
            $("#totalPages").find('span').text('of ' + this.model.pageSettings.totalPages);
            if (this.initialRender)
                $("#currentPage").val(1);
            $(".e-pagercontainer:first").css('border-style', 'none');
            if (args.requestType == 'paging') {
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
		$(function(){
		    $('#currentPage').bind('keydown focusout', function (e) {
		        var gridObj = $('#<%= FlatGrid.ClientID %>').data("ejGrid");
		        var val = parseInt($("#currentPage").val());
		        var keyCode = e.keyCode;
		        if (keyCode == 13 || e.which == 0) {
		            if (val > gridObj.model.pageSettings.totalPages)
		                val = gridObj.model.pageSettings.totalPages;
		            if (val <= 0) {
		                val = 1;
		                $("#currentPage").val(1);
		            }
		            gridObj.gotoPage(val);
		            return false;
		        }
		    });
		});
        
    </script>

	</asp:Content>

