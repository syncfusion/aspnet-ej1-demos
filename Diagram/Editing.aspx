<%@ Page Title="Diagram-Editing-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This sample demonstrates the CRUD behavior of the ASP.NET WEB diagram control." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="Editing.aspx.cs" Inherits="WebSampleBrowser.Diagram.Editing" %>

<%@ Register Assembly="Syncfusion.EJ.Web" Namespace="Syncfusion.JavaScript" TagPrefix="ej" %>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/Diagram/DiagramCommon.js")%>' type="text/javascript"></script>
    <script type="text/javascript">
        var sourceNode, targetNode, connectorsChanged;
        function nodeTemplate(diagram, node) {
            node.labels[0].text = node.Description;
            node.fillColor = node.Color;
        }

        function onItemClick(args) {
            var diagram = $("#Diagram1").ejDiagram("instance");
            var selectedItem = diagram.model.selectedItems.children[0];
            if (selectedItem && (selectedItem.type !== "connector" || args.currentTarget.id === "deleteData")) {
                switch (args.currentTarget.id) {
                    case "insertData":
                        openDialog("Add", "", "");
                        break;
                    case "updateData":
                        openDialog("Update", selectedItem.Description, selectedItem.Color);
                        break;
                    case "deleteData":
                        diagram.remove(selectedItem);
                        diagram.layout();
                        diagram.removeData();
                        break;
                }
            }
            else if (connectorsChanged) {
                if (args.currentTarget.id === "updateData") {
                    diagram.updateData();
                    connectorsChanged = false;
                    $("#ToolbarItem").ejToolbar("disableItemByID", "updateData");
                }
            }
        }

        function openDialog(title, description, color) {
            document.getElementById("btnUpdate").value = title;
            document.getElementById("Description").value = description;
            document.getElementById("Color").value = color;
            $("#editDialog").ejDialog({ "title": title });
            $("#editDialog").ejDialog("open");
        }

        function addOrUpdate(evt) {
            var diagram = $("#Diagram1").ejDiagram("instance");
            var description = document.getElementById("Description").value;
            var color = document.getElementById("Color").value;
            var selectedItem = diagram.model.selectedItems.children[0];
            if (evt.value === "Add") {
                var node = {
                    name: "node" + ej.datavisualization.Diagram.Util.randomId(), fillColor: color,
                    labels: [{ "text": description}], Description: description, Color: color
                };
                var connector = { name: "node" + ej.datavisualization.Diagram.Util.randomId(),
                    sourceNode: selectedItem.name, targetNode: node.name
                };
                diagram.add([node, connector]);
                diagram.layout();
                diagram.insertData();
            }
            else {
                selectedItem.Description = description;
                selectedItem.Color = color;
                diagram.updateNode(selectedItem.name, { fillColor: color });
                diagram.updateLabel(selectedItem.name, selectedItem.labels[0], { text: description });
                diagram.updateData();
            }
            $("#editDialog").ejDialog("close");
        }

        function connectionChange(args) {
            if (args.dragState === "completed") {
                if (!args.element.targetNode || !args.element.sourceNode)
                    args.cancel = true;
                if (!args.cancel) {
                    connectorsChanged = true;
                    $("#ToolbarItem").ejToolbar("enableItemByID", "updateData");
                }
            }
        }

        function selectionChange(args) {
            if(args.state==="changing"){
            $("#ToolbarItem").ejToolbar("disable");
            if (args.changeType === "insert") {
                if (args.element.type !== "connector")
                    $("#ToolbarItem").ejToolbar("enable");
                else {
                    $("#ToolbarItem").ejToolbar("enableItemByID", "deleteData");
                }
            }
            else if (connectorsChanged) {
                $("#ToolbarItem").ejToolbar("enableItemByID", "updateData");
            }
          }
        }
    </script>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="StyleSection">
    <link href='<%= Page.ResolveClientUrl("~/Content/diagram/editing/editing.css")%>' rel="stylesheet" type="text/css" />
    <style type="text/css">
        .svg-rotate-ie:hover
        {
            cursor: url("../Content/ejthemes/common-images/diagram/Rotate.cur"),default;
        }
        
        .svg-rotate
        {
            cursor: url("../Content/ejthemes/common-images/diagram/Rotate.cur"),default;
        }
        .e-toolbar > .e-horizontal.e-ul > li { 
        width: 36px;
        height: 25px;
    } 
    .toolBarIconStyle {
        font-size: 17px;
        color: #6B6B6B;
        margin-top: 4px;
        margin-left: 4px;
    } 
    </style>

</asp:Content>
<asp:Content runat="server" ID="ControlContent" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Toolbar ID="ToolbarItem" ClientIDMode="Static" Enabled="false" runat="server" ClientSideOnClick="onItemClick" Width="700px"
            CssClass="toolblock3rightBorderVisible toolcolors">
            <Items>
                <ej:ToolbarItem Id="insertData" TooltipText="Insert" SpriteCssClass="sficon-add toolBarIconStyle toolmargin">
                </ej:ToolbarItem>
                <ej:ToolbarItem Id="updateData" TooltipText="Update" SpriteCssClass="sficon-edit toolBarIconStyle toolmargin">
                </ej:ToolbarItem>
                <ej:ToolbarItem Id="deleteData" TooltipText="Delete" SpriteCssClass="sficon-delete toolBarIconStyle toolmargin">
                </ej:ToolbarItem>
            </Items>
        </ej:Toolbar>
    </div>
    <div>
        <ej:Diagram ClientIDMode="Static" ID="Diagram1" runat="server">
        </ej:Diagram>
    </div>
      <ej:Dialog ID="editDialog" ClientIDMode="Static" runat="server" ShowOnInit="false" EnableModal="true" EnableResize="false" ClientSideOnClose="onDialogClose" Width="400" Title="Export">
            <DialogContent>
                <table style="margin-left: 12px;">
                    <tr style="height: 40px">
                        <td style="vertical-align: central">
                            <div style="width: 100%; font-size: 16px; margin-right: 60px">
                                Description
                            </div>
                        </td>
                        <td style="vertical-align: central">
                            <div style="border: 1px solid #D3D1D1;">
                                <input type="text" id="Description" value="" style="width: 200px;" />
                            </div>
                        </td>
                    </tr>
                    <tr style="height: 40px">
                        <td style="vertical-align: central">
                            <div style="width: 100%; font-size: 16px; margin-right: 60px">
                                Color
                            </div>
                        </td>
                        <td style="vertical-align: central">
                            <div style="border: 1px solid #D3D1D1;">
                                <input type="text" id="Color" value="" style="width: 200px;" />
                            </div>
                        </td>
                    </tr>
                    <tr style="height: 40px">
                        <td></td>
                        <td style="vertical-align: central">
                            <div style="height: 30px; width: 100%; margin-right: 60px">
                                <input type="button" id="btnUpdate" onclick="addOrUpdate(this)" value="Export" style="background-color: #28B1BF; border: medium none; color: #FFFFFF; font-family: Segoe UI; font-size: 16px; height: 29px; width: 90px;" />
                            </div>
                        </td>
                    </tr>
                </table>
            </DialogContent>
        </ej:Dialog>
</asp:Content>
 

