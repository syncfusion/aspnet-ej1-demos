<%@ Page Title="Diagram-DrillDown-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This sample illustrates how to perform the drill down functionality with ASP.NET WEB diagram control." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DrillDown.aspx.cs" Inherits="WebSampleBrowser.Diagram.DrillDown" %>

 <%@ Register Assembly="Syncfusion.EJ.Web" Namespace="Syncfusion.JavaScript" TagPrefix="ej" %>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
<!--Define tooltip template-->
<script type="text/x-jsrender" id="mouseovertooltip">
    <div style="background-color: white; color: black; white-space: nowrap; height: 20px">
        <span style="padding: 5px;font-family:Segoe UI;font-size:14px"> {{:addInfo.toolvalue}} </span>
    </div>
</script>

<script type="text/javascript">

        function nodeTemplate1(diagram, node) {
            node.source = node.Source;
        }
     
        var state = true;
        function click(args) {            
            if (args && args.element.name === "Image1" && state) {
                $.ajax({
                    contentType: 'application/json',
                    type: 'POST',
                    url: 'DrillDown.aspx/getData',
                    dataType: "json",
                    success: function (data) {
                        $("#DiagramWebControl1").ejDiagram({
                            layout: {
                                type: "hierarchicaltree"
                            },
                            dataSourceSettings: {
                                //Defines the unique field
                                id: "Name",

                                //Defines the relationship
                                parent: "Function",

                                //Specifies the dataSource
                                dataSource: data.d
                            },
                            nodeTemplate: nodeTemplate1,
                        });
                        state = false;
                    },
                });
            }
        }

        function doubleclick(args) {            
            var diagram = $("#DiagramWebControl1").ejDiagram("instance");
            if (args && args.element) {
                if (args.element.isExpanded)
                    diagram.updateNode(args.element.name, { isExpanded: !args.element.isExpanded })
                else
                    diagram.updateNode(args.element.name, { isExpanded: true })

            }
        }
</script>
</asp:Content>

<asp:Content runat="server" ID="ControlContent" ContentPlaceHolderID="ControlsSection">
    <ej:Diagram ClientIDMode="Static" ID="DiagramWebControl1" runat="server" Height="600px" Width="600px">       
        <PageSettings PageWidth="600" PageHeight="600" PageBorderColor="#f5f5f5" PageBorderWidth="2" ScrollLimit="Diagram" />
        <SnapSettings SnapConstraints="None" />
         <Tooltip TemplateId="mouseovertooltip">
                <Alignment Horizontal="Center" Vertical="Bottom"></Alignment>
            </Tooltip>
    </ej:Diagram>
</asp:Content>

