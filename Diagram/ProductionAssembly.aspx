<%@ Page Title="Diagram-Production Assembly-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample visualizes the static production assembly line diagram and its designed with diagram’s native nodes and connectors features." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="ProductionAssembly.aspx.cs" Inherits="WebSampleBrowser.Diagram.ProductionAssembly" %>


<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div class="control_section">
        <div class="diagram_section" style="border: 1px solid #D9DEDD">
            <ej:Diagram ClientIDMode="Static" ID="DiagramWebControl1" runat="server" Height="650px" Width="100%">
                <PageSettings ScrollLimit="Infinity" />
                <SnapSettings SnapConstraints="None" />
            </ej:Diagram>
        </div>
    </div>
    <div id="basicDialog" title="Inventory" style="margin-top: 12px;">
    <table style="margin-left: 12px">

        <tr style="height: 40px">
            <td style="vertical-align: central">
                <div style="height: 30px; width: 100%; font-size: 16px; margin-right: 60px">
                    Status
                </div>
            </td>
            <td style="vertical-align: central">
                <div style="height: 30px; width: 200px;">
                    <input type="text" id="ddlExportMode" style="width: 100px; text-indent: 8px;" />
                    <div id="modeDiv" style="text-align: right">
                        <ul style="background-color: lightgray">
                            <li>Active</li>
                            <li>Down</li>
                        </ul>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <div style="height: 30px; margin-bottom: 6px; margin-top: 6px; width: 100%;">
                    <input type="button" id="btnExportDiagram" onclick="resetNode()" value="Reset" style="background-color: #28B1BF; border: medium none; color: #FFFFFF; font-family: Segoe UI; font-size: 16px; height: 29px; width: 90px;" />
                </div>
            </td>
        </tr>
    </table>
</div>
    <script type="text/javascript">
        $(function () {
            $("#basicDialog").ejDialog({
                width: 400,
                minWidth: 400,
                minHeight: 180,
                close: "onDialogClose",
                enableModal: true,
                showOnInit: false,
            });

            $('#ddlExportMode').ejDropDownList({
                targetID: "modeDiv",
                width: "200px",
                height: "30px",
                popupHeight: "59px",
                selectedItems: [0],
                cssClass: "ddl-standard"
            });

        });

        function onDialogClose() {
            $("#basicDialog").ejDialog("close");
            publicNode = null;
        }
        var publicNode;
        function resetNode() {
            var diargam = $("#DiagramWebControl1").ejDiagram("instance");
            var value = $('#ddlExportMode').ejDropDownList("instance")._selectedValue;
            diargam.updateNode(publicNode.name, { templateId: value === "Active" ? "Production_Active" : "Production_Down" })
            $("#basicDialog").ejDialog("close");
        }

        function created(args) {
            var diagram = $("#DiagramWebControl1").ejDiagram("instance");
            function createNativeNode(name, width, height, offsetX, offsetY, id, text, position, angle, border) {
                var node = { name: name, width: width, height: height, offsetX: offsetX, offsetY: offsetY, rotateAngle: (angle ? angle : 0), type: "native", templateId: id, scale: "stretch", borderColor: (border ? border : "gray") }
                return node;
            }
            diagram.add(createNativeNode("car1", 80, 40, 200, 280, "Production_Car"));
            diagram.add(createNativeNode("car3", 80, 40, 500, 280, "Production_Car"));
            diagram.add(createNativeNode("car4", 80, 40, 800, 280, "Production_Car"));
            diagram.add(createNativeNode("car5", 80, 40, 1100, 280, "Production_Car"));
            diagram.add(createNativeNode("car6", 80, 40, 1230, 440, "Production_Car", null, null, 90));
            diagram.add(createNativeNode("car7", 80, 40, 950, 570, "Production_Car", null, null, 180));
            diagram.add(createNativeNode("car9", 80, 40, 560, 570, "Production_Car", null, null, 180));
            diagram.add(createNativeNode("car10", 80, 40, 380, 730, "Production_Car", null, null, 90));
            diagram.add(createNativeNode("car11", 80, 40, 540, 850, "Production_Car"));
            diagram.clearSelection();
            diagram.fitToPage("height", "content");
            diagram.model.constraints = ej.datavisualization.Diagram.DiagramConstraints.None;

        }
        function click(args) {
            if (args.actualObject) {
                var state = (args.actualObject.name).indexOf("tick");
                if (state != -1) {
                    var value = (args.actualObject.templateId === "Production_Active") ? "Active" : "Down";
                    $('#ddlExportMode').ejDropDownList({
                        value: value
                    });
                    $("#basicDialog").ejDialog("open");
                    publicNode = args.actualObject;
                }
            }
        }
    </script>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script src="../Scripts/Diagram/productionassemblytemplates.js" type="text/javascript"></script>
    <script  type="text/javascript">
        getTemplates();
    </script>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="StyleSection">
   <link href="../Content/diagram/ProductionAssembly/ProductionAssembly.css" rel="stylesheet" />
</asp:Content>

