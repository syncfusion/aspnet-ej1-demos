<%@ Page Language="C#" Title="Example of loading Ajax content in ASP.NET Accordion | Syncfusion" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="AjaxContent.aspx.cs" MetaDescription="This example demonstrates loading the Syncfusion ASP.NET Web Forms Accordion content using Ajax requests." Inherits="WebSampleBrowser.Accordion.AjaxContents" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="controlframe">
    <div id="ajaxAccordion">
        <h3>
            <a href="../Content/samplecontent/mvccontent.html">Model–view–controller (MVC)</a></h3>
        <div>
        </div>
        <h3>
            <a href="../Content/samplecontent/wpfcontent.html"></a>WPF</h3>
        <div>
        </div>
        <h3>
            <a href="#">WCF</a></h3>
        <div>
            <p>
                WCF is a tool often used to implement and deploy a service-oriented architecture (SOA). 
                It is designed using service-oriented architecture principles to support distributed computing where services have remote consumers. 
                Clients can consume multiple services; services can be consumed by multiple clients. Services are loosely coupled to each other. 
                Services typically have a WSDL interface (Web Services Description Language) that any WCF client can use to consume the service, regardless of which platform the service is hosted on. 
                WCF implements many advanced Web services (WS) standards such as WS-Addressing, WS-ReliableMessaging and WS-Security. 
                With the release of .NET Framework 4.0, WCF also provides RSS Syndication Services, WS-Discovery, routing and better support for REST services.
            </p>
        </div>
    </div>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript" class="jsScript">
        $(function () {
            // declaration
            $("#ajaxAccordion").ejAccordion();
        });
    </script>
</asp:Content>

