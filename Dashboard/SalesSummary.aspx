<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SalesSummary.aspx.cs" Inherits="WebSampleBrowser.Dashboard.SalesSummary" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <title>Essential Studio for ASP.NET  : Sales Dashboard</title>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <link rel="shortcut icon" href='<%= Page.ResolveClientUrl("~/Content/images/favicon.ico")%>' />
    <link rel="stylesheet" href='<%= Page.ResolveClientUrl("~/Content/bootstrap.min.css")%>' />
    <link rel="stylesheet" href='<%= Page.ResolveClientUrl("~/Content/ejthemes/ej.widgets.core.min.css")%>' />
    <link rel="stylesheet" href='<%= Page.ResolveClientUrl("~/Content/ejthemes/default-theme/ej.theme.min.css")%>' />
    
    <!--[if lt IE 9]>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/jquery-1.11.3.min.js")%>' type="text/javascript"></script>
    <![endif]-->
    <!--[if gte IE 9]><!-->
    <script src='<%= Page.ResolveClientUrl("~/Scripts/jquery-3.4.1.min.js")%>' type="text/javascript"></script>
    <!--<![endif]-->
    <script src='<%= Page.ResolveClientUrl("~/Scripts/jsrender.min.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/jquery.globalize.min.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/ej.web.all.min.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/properties.js")%>' type="text/javascript"></script>
        
     <style type="text/css">
         #ReportViewer1 {
             width: 100%;
             height: 100%;             
         }

         html, body {
             overflow: hidden; padding:0; margin: 0;height:100%;position:static;
         }
     </style>
</head>
<body style="">
    
    <form runat="server" onsubmit="return false" style="overflow: hidden; padding:0; margin: 0;height:100%;width:100%;">    
            <ej:ReportViewer ID="ReportViewer1" runat="server" ReportPath="Sales Dashboard.rdl" ProcessingMode="Remote" Height="100%"/>         
    </form>    
    </body>        
</html>
   