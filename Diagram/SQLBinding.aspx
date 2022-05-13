<%@ Page Title="Diagram-SQL Binding-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This sample demonstrates generating a hierarchical tree by fetching data from the server and diagram’s built-in layout algorithm." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="SQLBinding.aspx.cs" Inherits="WebSampleBrowser.Diagram.SQLBinding" %>

<%@ Register Assembly="Syncfusion.EJ.Web" Namespace="Syncfusion.JavaScript" TagPrefix="ej" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadSection" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        var layoutDetails = {
            type: "hierarchicaltree",
            marginX: 0,
            marginY: 50,
            horizontalSpacing: 60,
            verticalSpacing: 50
        };

        function nodeTemplate(diagram, node) {
            node.labels[0].text = node.FirstName;
            node.labels[1].text = node.Title;
        }

        function generateElement(tag, attr, content) {
            var element = document.createElementNS("http://www.w3.org/2000/svg", tag);
            ej.datavisualization.Diagram.Util.attr(element, attr);
            if (tag == "text") {
                element.appendChild(document.createTextNode(content));
            }
            else if (content) element.setAttributeNS("http://www.w3.org/1999/xlink", "xlink:href", content);
            return element;
        }

        document.addEventListener("mousedown", mousedown);

        $(document).ready(function () {
            if (!(ej.browserInfo().name === "msie" && Number(ej.browserInfo().version) < 9)) {
                var diagram = $("#DiagramWebControl1").data("ejDiagram");
                var dataSource = diagram.model.dataSourceSchema;
                $("#DiagramWebControl1").ejDiagram({ nodeTemplate: nodeTemplate });
                diagram.activateTool("panTool");
            }
            else {
                alert("Diagram will not be supported in IE Version < 9");
            }
        });

        function mousedown(evt) {
            if (!(ej.browserInfo().name === "msie" && Number(ej.browserInfo().version) < 9)) {
                var diagram = $("#DiagramWebControl1").data("ejDiagram");
                diagram.activateTool("panTool");
            }
        }


    </script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/Diagram/DiagramCommon.js")%>' type="text/javascript"></script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <style>
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

<asp:Content ID="Content4" ContentPlaceHolderID="SampleHeading" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">
    <svg xmlns="http://www.w3.org/2000/svg" width="0px" height="0px">
        <g id="nativeContent">
        </g>
    </svg>
    <ej:Diagram ClientIDMode="Static" ID="DiagramWebControl1" runat="server" Height="500px" Width="100%" DataSourceID="SqlDataSource1">
        <DataSourceSettings Id="EmployeeID" Parent="ReportsTo" />
        <PageSettings ScrollLimit="Diagram" />
    </ej:Diagram>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SQLConnectionString %>"
        SelectCommand="SELECT EmployeeID,ReportsTo,FirstName,Title FROM [Employees] "></asp:SqlDataSource>
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="PropertySection" runat="server">
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="EventSection" runat="server">
</asp:Content>

