<%@ Page Title="Diagram-Overview-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates ASP.NET WEB diagram's overview panel behavior which is used to improve the navigation experience when exploring large diagrams." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Overview.aspx.cs" Inherits=" WebSampleBrowser.Diagram.Overview" %>

<%@ Register assembly="Syncfusion.EJ.Web" namespace="Syncfusion.JavaScript.Web" tagprefix="ej" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="StyleSection">
    <style type="text/css">
        .svg-rotate-ie:hover
        {
            cursor: url("../Content/ejthemes/common-images/diagram/Rotate.cur"),default;
        }

        .svg-rotate
        {
            cursor: url("../Content/ejthemes/common-images/diagram/Rotate.cur"),default;
        }
    </style>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="PropertySection" runat="server">
       <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                    Overview
                </div>           
                <div class="row">
                 <ej:Overview ClientIDMode="Static" ID="OverviewControl" runat="server" Height="300px" Width="233px" SourceId="DiagramWebControl1"></ej:Overview>   
                </div>
            </div>
        </div>
    </div>   
        
</asp:Content>
<asp:Content runat="server" ID="ControlContent" ContentPlaceHolderID="ControlsSection">
    <ej:Diagram ClientIDMode="Static" ID="DiagramWebControl1" runat="server" Height="400px" Width="100%" EnableContextMenu="false">        
    </ej:Diagram>

</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
<script type="text/javascript">
  
    $(window).on("load", function () {
        $("#sampleProperties").ejPropertiesPanel();
        if (!(ej.browserInfo().name === "msie" && Number(ej.browserInfo().version) < 9)) {
            var diagram = $("#DiagramWebControl1").ejDiagram("instance");
            diagram.update({ tool: ej.datavisualization.Diagram.Tool.ZoomPan });
        }
    });
    

</script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/Diagram/DiagramCommon.js")%>' type="text/javascript"></script>
</asp:Content>

