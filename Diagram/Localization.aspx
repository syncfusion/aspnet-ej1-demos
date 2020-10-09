<%@ Page Title="Diagram-Localization-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates localization feature in the ASP.NET WEB diagram control." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Localization.aspx.cs" Inherits=" WebSampleBrowser.Diagram.Localization" %>

<%@ Register Assembly="Syncfusion.EJ.Web" Namespace="Syncfusion.JavaScript" TagPrefix="ej" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="StyleSection">
    <style type="text/css">
        .svg-rotate-ie:hover {
            cursor: url("../Content/ejthemes/common-images/diagram/Rotate.cur"),default;
        }

        .svg-rotate {
            cursor: url("../Content/ejthemes/common-images/diagram/Rotate.cur"),default;
        }
    </style>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/Diagram/DiagramCommon.js")%>' type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3" style="margin-top: 8px">
                    Selection Culture
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ID="language" runat="server" enableFilterSearch="true" SelectedItemIndex="0" ClientSideOnChange="onChange" Width="120px">
                        <items>
                            <ej:DropDownListItem Text="English" Value="0" />
                            <ej:DropDownListItem Text="Deutsch" Value="1" />
                            <ej:DropDownListItem Text="Español" Value="2" />
                        </items>
                    </ej:DropDownList>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content runat="server" ID="ControlContent" ContentPlaceHolderID="ControlsSection">
    <ej:Diagram ClientIDMode="Static" ID="DiagramWebControl1" runat="server" Height="800px" Width="100%" EnableContextMenu="true">
        <pagesettings scrolllimit="Diagram" />
        <nodes>
            <ej:BasicShape Name="NewIdea" Width="150" Height="60" OffsetX="300" OffsetY="60" FillColor="darkCyan" BorderColor="#1BA0E2" Shape="Path"
                PathData="M 45 220 L 45 220 A 20 30 0 0 1 45 280 L 45 280 A 20 30 0 0 1 45 220 Z" >
                <Labels>
                    <ej:DiagramLabel Name="NewIdea_Label" Text="Start Terminator" FontColor="White"></ej:DiagramLabel>
                </Labels>
               
            </ej:BasicShape>
            <ej:BasicShape Name="Meeting" Width="150" Height="60" OffsetX="300" OffsetY="150" FillColor="darkCyan" BorderColor="#1BA0E2">
                <Labels>
                    <ej:DiagramLabel Name="Meeting_Label" Text="Progress" FontColor="White"></ej:DiagramLabel>
                </Labels>
           
            </ej:BasicShape>
            <ej:BasicShape Name="BoardDecision" Width="150" Height="100" OffsetX="300" OffsetY="290" FillColor="darkCyan" BorderColor="#1BA0E2" Shape="Polygon">
                    <PointCollection>
                        <ej:ShapePoints X="310" Y="50" />
                        <ej:ShapePoints X="340" Y="80" />
                        <ej:ShapePoints X="310" Y="110" />
                        <ej:ShapePoints X="280" Y="80" />
                    </PointCollection>                    
                <Labels>
                    <ej:DiagramLabel Name="BoardDecision_Label" Text="Decision" FontColor="White">
                        <Margin Top="0" Left="20" Right="20" Bottom="0" />
                    </ej:DiagramLabel>
                </Labels>
               
            </ej:BasicShape>
           <ej:BasicShape Name="Data" Width="150" Height="60" OffsetX="300" OffsetY="425" FillColor="darkCyan" BorderColor="#1BA0E2" Shape="Path"
               PathData="M 10 0 L 40 0 L 30 40 L 0 40 Z" >
                <Labels>
                    <ej:DiagramLabel Name="Data_Label" Text="Data" FontColor="White"></ej:DiagramLabel>
                </Labels>
            </ej:BasicShape>
            <ej:BasicShape Name="Document" Width="150" Height="60" OffsetX="300" OffsetY="545" FillColor="darkCyan" BorderColor="#1BA0E2" Shape="Path"
                PathData=" M 87.3593 87.8807 L 87.3593 20.0773 L 0 20.0773 L 0 87.8807 C 0 87.8807 25.1638 100 43.6797 87.8807 C 62.1955 75.7614 77.5794 80.942 87.3593 87.8807 Z">
                <Labels>
                    <ej:DiagramLabel Name="Document_Label" Text="Document" FontColor="White"></ej:DiagramLabel>
                </Labels>
            </ej:BasicShape>
            
            <ej:BasicShape Name="End" Width="120" Height="60" OffsetX="300" OffsetY="645" FillColor="darkCyan" BorderColor="#1BA0E2">
                <Labels>
                    <ej:DiagramLabel Name="End_Label" Text="End" FontColor="White"></ej:DiagramLabel>
                </Labels>
                
            </ej:BasicShape>
             
        </nodes>
        <connectors>
            <ej:DiagramConnector Name="Connector1" SourceNode="NewIdea" TargetNode="Meeting" LineWidth="2" LineColor="#606060">
                <SourceDecorator Shape="None" />
                <TargetDecorator BorderColor="#606060"  Width="10" Height="10"  />
            </ej:DiagramConnector>
            <ej:DiagramConnector Name="Connector2" SourceNode="Meeting" TargetNode="BoardDecision" LineWidth="2" LineColor="#606060">
                <SourceDecorator Shape="None" />
                <TargetDecorator BorderColor="#606060"  Width="10" Height="10"  />
            </ej:DiagramConnector>
            <ej:DiagramConnector Name="Connector3" SourceNode="BoardDecision" TargetNode="Data" LineWidth="2" LineColor="#606060">                
                <SourceDecorator Shape="None" />
                <TargetDecorator BorderColor="#606060"  Width="10" Height="10"  />
                <Labels>
                    <ej:DiagramLabel Name="Connector3_Label" Text="Yes" FillColor="white"></ej:DiagramLabel>
                </Labels>
            </ej:DiagramConnector>
            <ej:DiagramConnector Name="Connector4" SourceNode="Data" TargetNode="Document" LineWidth="2" LineColor="#606060">
                <SourceDecorator Shape="None" />
                <TargetDecorator BorderColor="#606060"  Width="10" Height="10"  />
               
            </ej:DiagramConnector>
            <ej:DiagramConnector Name="Connector5" SourceNode="Document"  TargetNode="End" LineWidth="2" LineColor="#606060">
                <SourceDecorator Shape="None" />
                <TargetDecorator BorderColor="#606060"  Width="10" Height="10"  />
                
            </ej:DiagramConnector>
            <ej:DiagramConnector Name="Connector6" SourceNode="BoardDecision"  TargetNode="Meeting" LineWidth="2" LineColor="#606060">
                <SourceDecorator Shape="None" />
                <TargetDecorator BorderColor="#606060"  Width="10" Height="10"  />            
                <Labels>
                    <ej:DiagramLabel Name="Connector6_Label" Text="No" FillColor="white"></ej:DiagramLabel>
                </Labels>
                <Segments>
                    <ej:DiagramSegment Type="Orthogonal" Length="50" Direction="right"></ej:DiagramSegment>
                    <ej:DiagramSegment Type="Orthogonal"></ej:DiagramSegment>
                </Segments>
            </ej:DiagramConnector>
            
        </connectors>
    </ej:Diagram>

</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        $(window).on("load", function () {
            if ((ej.browserInfo().name === "msie" && Number(ej.browserInfo().version) < 9)) {
                alert("Diagram will not be supported in IE Version < 9");
            }
        });
        $(window).on("load", function () {
            $("#sampleProperties").ejPropertiesPanel();
        });
        ej.datavisualization.Diagram.Locale["es-ES"] = {
            cut: "Corte",
            copy: "Copia",
            paste: "Pasta",
            undo: "Deshacer",
            redo: "Rehacer",
            selectAll: "Seleccionar todo",
            grouping: "Agrupación",
            group: "Grupo",
            ungroup: "Desagrupar",
            order: "Fin",
            bringToFront: "Traer a delante",
            moveForward: "Movimiento adelante",
            sendToBack: "Enviar a espalda",
            sendBackward: "Enviar hacia atrás"

        };
        ej.datavisualization.Diagram.Locale["de-DE"] = {
            cut: "Schnitt",
            copy: "Kopie",
            paste: "Klebstoff",
            undo: "Rückgängig ",
            redo: "Rehacer",
            selectAll: "Wählen alle",
            grouping: "Gruppierung",
            group: "Gruppe",
            ungroup: "Aufheben",
            order: "Bestellen",
            bringToFront: "Bringen zu Front",
            moveForward: "Umzug vorwärts",
            sendToBack: "Senden zu zurück",
            sendBackward: "Senden rückwärts"

        };
        var Labels = [];
        this.Labels["en-US"] = [
            { nodeName: "NewIdea", label: "Start Terminator" },
            { nodeName: "Meeting", label: "Progress" },
            { nodeName: "BoardDecision", label: "Decision" },
            { nodeName: "Data", label: "Data" },
            { nodeName: "End", label: "End Terminator" },
            { nodeName: "Document", label: "Document" },
            { nodeName: "Connector3", label: "Yes" },
            { nodeName: "Connector6", label: "No" }
        ]
        this.Labels["de-DE"] = [
            { nodeName: "NewIdea", label: "Start Terminator" },
            { nodeName: "Meeting", label: "Fortschritt" },
            { nodeName: "BoardDecision", label: "Entscheidung" },
            { nodeName: "Data", label: "Daten" },
            { nodeName: "End", label: "Ende Terminator" },
            { nodeName: "Document", label: "Dokument" },
            { nodeName: "Connector3", label: "Ja" },
            { nodeName: "Connector6", label: "Keine" }
        ]
        this.Labels["es-ES"] = [
            { nodeName: "NewIdea", label: "Comienzo Terminator" },
            { nodeName: "Meeting", label: "Progreso" },
            { nodeName: "BoardDecision", label: "Decisión" },
            { nodeName: "Data", label: "Datos" },
            { nodeName: "End", label: "Fin  Terminator" },
            { nodeName: "Document", label: "Documento" },
            { nodeName: "Connector3", label: "Sí" },
            { nodeName: "Connector6", label: "No" }
        ]
        function onChange(args) {
            if (!(ej.browserInfo().name === "msie" && Number(ej.browserInfo().version) < 9)) {
                var locale = "en-US";
                if (args.itemId == 1)
                    locale = "de-DE";
                else if (args.itemId == 2)
                    locale = "es-ES";
                $("#DiagramWebControl1").ejDiagram("model.locale", locale);
                var diagram = $("#DiagramWebControl1").ejDiagram("instance");
                var currentCulture = Labels[locale];
                for (var i = 0; i < currentCulture.length; i++) {
                    var node = diagram.nameTable[currentCulture[i].nodeName];
                    if (node)
                        diagram.updateLabel(node.name, node.labels[0], { text: currentCulture[i].label });
                }
            }
        }



    </script>
</asp:Content>

