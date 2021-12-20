<%@ Page Title="Diagram-HTML Table-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This sample demonstrates generating the diagram from the HTML Table and using ASP.NET WEB diagram’s built-in layout algorithm." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="HTMLDataBinding.aspx.cs" Inherits="WebSampleBrowser.Diagram.HTMLDataBinding" %>

<%@ Register Assembly="Syncfusion.EJ.Web" Namespace="Syncfusion.JavaScript" TagPrefix="ej" %>
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
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script id="Table1" type="text/template" >
         <table style="display:none">
         <thead>
             <tr>
                 <th>
                     Id
                 </th>
                 <th>
                     Role
                 </th>
                 <th>
                     ReportingPerson
                 </th>
                  <th>
                     Color
                 </th>
             </tr>
         </thead>
         <tbody>
              <tr>
                 <td>parent</td>
                 <td>Plant Manager</td>
                 <td>null</td>
                  <td>#0B4268</td>
             </tr>
             <tr>
                 <td>11</td>
                 <td>Production Manager</td>
                 <td>parent</td>
                   <td>#D34A4A</td>
             </tr>
             <tr>
                 <td>1</td>
                 <td>Administrative Officer</td>                
                 <td>parent</td>
                  <td>#D34A4A</td>
             </tr>
             <tr>
                 <td>2</td>
                 <td>Maintanence manager</td>                 
                 <td>parent</td>
                 <td>#D34A4A</td>
             </tr>
              <tr>
                 <td>3</td>
                 <td>Control Room</td>                 
                 <td>11</td>
                 <td>#108D8D</td>
             </tr>
             <tr>
                 <td>4</td>
                 <td>Plant Operator</td>                
                 <td>11</td>
                  <td>#108D8D</td>
             </tr>
             <tr>
                 <td>5</td>
                 <td>Foreman</td>                
                 <td>3</td>
                  <td>#108D8D</td>
             </tr>
             <tr>
                 <td>6</td>
                 <td>Craft Personnel</td>               
                 <td>5</td>
                  <td>#108D8D</td>
             </tr>
             <tr>
                 <td>7</td>
                 <td>Craft Personnel</td>                
                 <td>5</td>
                  <td>#108D8D</td>
             </tr>
             <tr>
                 <td>8</td>
                 <td>Foreman</td>                
                 <td>4</td>
                 <td>#108D8D</td>
             </tr>
              <tr>
                 <td>9</td>
                 <td>Craft Personnel</td>                
                 <td>8</td>
                  <td>#108D8D</td>
             </tr>
              <tr>
                 <td>10</td>
                 <td>Electrical Supervisor</td>                
                 <td>2</td>
                  <td>#108D8D</td>
             </tr>
             <tr>
                 <td>111</td>
                 <td>Mechanical Supervisor</td>                
                 <td>2</td>
                 <td>#108D8D</td>
             </tr>
             <tr>
                 <td>12</td>
                 <td>Craft Personnel</td>                
                 <td>10</td>
                  <td>#108D8D</td>
             </tr>
             <tr>
                 <td>13</td>
                 <td>Craft Personnel</td>                
                 <td>10</td>
                  <td>#108D8D</td>
             </tr>
             <tr>
                 <td>14</td>
                 <td>Craft Personnel</td>                
                 <td>111</td>
                  <td>#108D8D</td>
             </tr>
             <tr>
                 <td>15</td>
                 <td>Craft Personnel</td>                
                 <td>111</td>
                  <td>#108D8D</td>
             </tr>
         </tbody>
     </table>
        </script>
    <script type="text/javascript">

        function nodeTemplate(diagram, node) {
            node.labels[0].text = node.Role;
            node.fillColor = node.Color;

        }
    </script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/Diagram/DiagramCommon.js")%>' type="text/javascript"></script>
</asp:Content>

<asp:Content runat="server" ID="ControlContent" ContentPlaceHolderID="ControlsSection">
    <ej:Diagram ClientIDMode="Static" ID="HTMLBinding" runat="server" Height="490px" Width="100%" EnableContextMenu="false" Tool="ZoomPan">
        <DataManager Table="#Table1"></DataManager>        
        <PageSettings ScrollLimit="Diagram" />
        <Layout Type="HierarchicalTree" MarginY="50" HorizontalSpacing="30" VerticalSpacing="40" />
        <SnapSettings SnapConstraints="None" />
        
    </ej:Diagram>
</asp:Content>

