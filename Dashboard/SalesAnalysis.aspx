<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SalesAnalysis.aspx.cs" Inherits="WebSampleBrowser.Dashboard.SalesAnalysis" %>
<%@ Register Assembly="Syncfusion.EJ.Web" Namespace="Syncfusion.JavaScript" tagPrefix="ej" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Essential Studio for ASP.NET : Sales Analysis</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta name="description" content="Analyze the sales made by countries or by products, using map and range navigator controls | ASP.NET">
    <link rel="shortcut icon" href='<%= Page.ResolveClientUrl("~/Content/images/favicon.ico")%>' type="image/x-icon"  />
     <link rel="stylesheet" href='<%= Page.ResolveClientUrl("~/Content/bootstrap.min.css")%>' />
    <link rel="stylesheet" href='<%= Page.ResolveClientUrl("~/Content/ejthemes/ej.widgets.core.min.css")%>' />
    <link rel="stylesheet" href='<%= Page.ResolveClientUrl("~/Content/ejthemes/flat-azure-dark/ej.theme.min.css")%>' />
    <link href="../Content/Dashboard/salesanalysis/Site.css" rel="stylesheet" />
    
    <!--[if lt IE 9]>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/jquery-1.11.3.min.js")%>' type="text/javascript"></script>
    <![endif]-->
    <!--[if gte IE 9]><!-->
   <script src='<%= Page.ResolveClientUrl("~/Scripts/jquery-3.4.1.min.js")%>' type="text/javascript"></script>
    <!--<![endif]-->
    <script src='<%= Page.ResolveClientUrl("~/Scripts/jsrender.min.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/jquery.globalize.min.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/cultures/globalize.culture.en-US.min.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/excanvas.min.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/ej.web.all.min.js")%>' type="text/javascript"></script>
    <script src="<%= Page.ResolveClientUrl("~/Content/Dashboard/salesanalysis/SalesDashboard.js") %>" type="text/javascript"></script>
	<script src="<%= Page.ResolveClientUrl("~/Content/Dashboard/salesanalysis/WorldMap.js") %>" type="text/javascript"></script>
	 <script src="<%= Page.ResolveClientUrl("~/Content/Dashboard/salesanalysis/salesCountry.js") %>" type="text/javascript"></script>
	<script src="<%= Page.ResolveClientUrl("~/Content/Dashboard/salesanalysis/WorldSalesData.js") %>" type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/angular.min.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/ej.unobtrusive.min.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/ej.widget.angular.min.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/knockout-min.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/ej.widget.ko.min.js")%>' type="text/javascript"></script>
    
</head>
<body style="background: #090909;">
  <script type="text/javascript" lang="javascript">
      $(window).resize(function () {

          var marginResize = getWidth();
          $(".gaugecontainer").css("padding-left", marginResize);

      });
      $(window).ready(function () {

          var marginReady = getWidth();
          // $(".gaugecontainer").find(".row").css("padding-left",marginReady);

      });
      function getWidth() {
          var width = $(".gaugecontainer").width();

          var eleWidth = 204;

          var value;
          var div = width % eleWidth;
          if (width > 0) {

              if (width > 825)
                  return value = 0;
              else if (width % eleWidth < 204) {
                  return value = -(width % (eleWidth * 2)) / 3;
              }
              else if (width % (eleWidth * 2) < 204) {
                  return value = (width % (eleWidth * 2)) / 3;
              }
              else if (width % (eleWidth * 3) < 204)
                  return value = (width % (eleWidth * 2)) / 4;

              else
                  return value = 0;
          }
      }
 </script>
    <div id="template" style="display:none;">
        <label>{{:Sales}}</label>
    </div>
    <div class="page">
        <div class="salesheader" >
	
		<div class="sfheaders">Sales Overview</div>
           
        </div>
        <div id="MainContent" class="main">
            <div style="background-color:black;border:1px solid #252525" class="container">
			
                <div class="andtitle">
                </div>
                <div >
				
                    <div style="height:50px;" class="title">
                        <div class="titlediv margin">
                            Marketing vs Revenue by Product Category
                        </div>
                    </div>
                </div>
				 <div  class="row gaugecontainer">     
                     			 
				           <div class="ptiles col-xs-2">
							<table class="">
							<tr>
							<td>
                            <div style="horiz-align:center;" class="automotive">							
                            </div>
							</td>
							</tr>
							<tr>
							<td>
							<div class="triangleGauge">&#9650;</div>
							</td>
							<td><div id="automotiveText"></div></td>
							</tr>
							</table>
							</div>
							<div class="ptiles col-xs-2">
							<table class="">
							<tr>
							<td>							
                            <div style="horiz-align:center;"  class="books">
                            </div>
							</td>
							</tr>
							<tr>
							<td>
							<div class="triangleGauge">&#9650;</div>
							</td>
							</tr>
							</table>
							</div>
							 <div class="ptiles col-xs-2">
							<table class="">
							<tr>
							<td>	
                            <div class="clothing">
                            </div>
							</td>
							</tr>
							<tr>
							<td>
							<div class="triangleGauge">&#9650;</div>
							</td>
							</tr>
							</table>
							</div>
							 <div class="ptiles col-xs-2">
							<table class="">
							<tr>
							<td>	
                            <div class="electronics">
                            </div>
							</td>
							</tr>
							<tr>
							<td>
							<div class="triangleGauge">&#9650;</div>
							</td>
							</tr>
							</table>
							</div>
                        
                   
                
               </div>
			   <div class="row chartgridborder">
                <div class="chartgridcontainer">
                    
                        <div class="gridchart">
                            <div class="col-md-6">
                            </div>
							 
							
							 <table class="mapwaiting" style="margin:10px;">
							 <tr style="margin-left:20px;">
							 <td style="width:85%">&nbsp;&nbsp;&nbsp;Sales by Country</td>
							 <td >												 
							 <div onclick="gridiconChanged(this)" id="gridbutton" class="gridicon"></div>
							 </td>
							 <td style="width:3%;"></td>
							 <td >
							 <div onclick="mapiconChanged(this)" id="mapbutton" class="mapicon"></div>
							 </td>
							 <td style="width:6%;"></td>
							 </tr>
							 </table>
							  <div >
							 </div>
							 
                            <div class="col-md-6 maptitle">
							   <div id="gridholder" style="width:100%">
                                   </div>
                            </div>
                        </div>
                        <div class="col-md-12 image2">
                        </div>
                    
                </div>
               </div>
			   <div class="row rangeborder">			   
                <div class="rangecontainer">
                    
                            <div class="col-md-12">
                            </div>
                        </div>
                    </div>
					</div>
               
        <div id="footer">
            <div class="bottom-links">
                <div class="left">
                    <div class="sync-text">
                        Copyright © 2001-2019 Syncfusion Inc.
                    </div>
                </div>
                <div class="right">
                    <a href="https://www.syncfusion.com">
                        <div class="syncfusion-image"></div>
                    </a>
                </div>
            </div>
        </div>
			   <div class="page" style="height:40px;"></div>
			   </div>
            
        
        <div id="MainScroll" data-role="sf-m-scrollpanel" data-targetid="MainContent">
		</div>
        </div>
    </div>
	 <div  id="Maptooltiptemplate" style="display: none;">
         <div >
		 <div class="bordermap" style="height:40px;width:78px;background:#4586a0;border-radius:3px;">
		 <div style="margin-top:-20px;margin-left:9px;">
		 <label style="margin-top:2px;font-weight:normal;font-size:12px;color:white;font-family:Segoe UI;">{{:State}}</label>
		 </div>
		 <div style="height:5px;"></div>
		 <div style="margin-top:-10px;margin-left:9px;">
		 <label style="margin-top:0px;font-weight:normal;font-size:14px;color:white;font-family:segoe ui light;">${{:~parseDouble(Sales)}}</label>
		</div>
		 </tr>
		 
		 </div>
		 </div>
      </div>
</body>
</html>
