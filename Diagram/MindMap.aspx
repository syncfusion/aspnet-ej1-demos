<%@ Page Title="Diagram-Mindmap-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This sample demonstrates the concept of creativity mind map using hierarchical tree layout algorithm. User handles are used to extend the mind map interactively." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="MindMap.aspx.cs" Inherits="WebSampleBrowser.Diagram.MindMap" %>

<%@ Register Assembly="Syncfusion.EJ.Web" Namespace="Syncfusion.JavaScript" TagPrefix="ej" %>


<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script id="nativeContent" type="text/x-jsrender">
        <g>
	        <line x1="0" x2="{{:width}}" y1="{{:height}}" y2="{{:height}}" stroke="black" stroke-thickness="1"></line>
	        <rect x="0" y="0" name="{{:name}}" width="{{:width}}"  height="{{:height}}" fill="transparent" stroke="none"></rect>
	    </g>
    </script>
    <script type="text/javascript">
        var diagram;
        $(window).on("load", function () {
            if (!(ej.browserInfo().name === "msie" && Number(ej.browserInfo().version) < 9)) {
                var nativeContent = document.getElementById("nativeContent");
                nativeContent.style.visibility = "hidden";
                var palette = document.getElementById("colorpalette");
                palette.addEventListener("click", click_palette);
                diagram = $("#DiagramWebControl1").data("ejDiagram");
                var width = $(window).width();
                var height = $(window).height();
                var root = diagram.nameTable[diagram.model.layout.fixedNode];
                if (width < 1200)
                    root.offsetX = width / 2;
                else
                    root.offsetX = 500;
                if (height < 540)
                    root.offsetY = height / 2 + 100;
                else root.offsetY = 300;
                var userHandles = [];
                createUserHandles(userHandles);
                diagram.model.selectedItems.userHandles = userHandles;
                diagram._initHandles();
                diagram.model.nodeCollectionChange = nodecollectionchanged;
                diagram.model.selectionChange = selectionChanged;
                diagram.model.textChange = labelChanged;
                for (var i = 0; i < diagram.nodes().length; i++) {
                    var node = diagram.nodes()[i];
                    node.visible = true;
                }
                for (var i = 0; i < diagram.model.connectors.length; i++) {
                    var conn = diagram.model.connectors[i];
                    conn.visible = true;
                }
                updateLabels(diagram);
                updateLeftSideMap(diagram);
                updateRightSideMap(diagram);
                var s1 = document.getElementById("nativeContent");
                s1.style.visibility = "hidden";
                diagram.updateViewPort();
            }
            else {
                alert("Diagram will not be supported in IE Version < 9");
            }
        });



        //Adding  node
        function addNode(type, text, fill) {
            var name = ej.datavisualization.Diagram.Util.randomId();
            var margin = { "left": 5, "top": 5, "right": 5, "bottom": 5 };
            var constraints = ej.datavisualization.Diagram.NodeConstraints.Default & ~(ej.datavisualization.Diagram.NodeConstraints.Drag | ej.datavisualization.Diagram.NodeConstraints.Rotate);
            if (type == "root") {
                constraints = constraints & ~ej.datavisualization.Diagram.NodeConstraints.Delete;
            }
            var node = { name: name, minWidth: 50, minHeight: 30, constraints: constraints, fillColor: fill || "white", borderColor: "transparent" };
            node.labels = [{
                "text": text, "name": name + "_label", "wrapping": "nowrap", "margin": margin, "fontFamily": "Segoe UI", "bold": true
            }];
            node.addInfo = {};
            node.addInfo["type"] = type;
            node.ports = [];
            if (type == "right" || type == "left" || type == "root") {
                node.ports.push(getport(0, 0.5));
                node.ports.push(getport(1, 0.5));
                node.shape = "rectangle";
                node.cornerRadius = 5;
            }
            else {
                node.ports.push(getport(0, 1));
                node.ports.push(getport(1, 1));
                node.type = "native";
                node.scale = "stretch";
                node.templateId = "nativeContent";
            }
            return node;
        }

        //Adding a connection
        function connect(tail, head, name) {
            var conn = {};
            conn.segments = [{ "type": "bezier" }];
            conn.constraints = ej.datavisualization.Diagram.ConnectorConstraints.Default & ~(ej.datavisualization.Diagram.ConnectorConstraints.Select);
            conn.name = ej.datavisualization.Diagram.Util.randomId();
            conn.targetNode = head.name;
            conn.sourceNode = tail.name;
            conn.targetDecorator = { "shape": "none" };
            if (head.addInfo.type == "right" || head.addInfo.type == "subright") {
                conn.sourcePort = tail.ports[1].name;
                conn.targetPort = head.ports[0].name;
            }
            else if (head.addInfo.type == "left" || head.addInfo.type == "subleft") {
                conn.sourcePort = tail.ports[0].name;
                conn.targetPort = head.ports[1].name;
            }
            return conn;
        }

        //creating port
        function getport(offsetx, offsety) {
            var offset = { x: offsetx, y: offsety };
            var port = { "offset": offset, "name": ej.datavisualization.Diagram.Util.randomId() };
            return port;
        }


        function updateLabels() {
            var diagram = $("#DiagramWebControl1").ejDiagram("instance");
            for (var i = 0; i < diagram.nodes().length; i++) {
                var node = diagram.nodes()[i];
                labelChanged({ "element": node, "value": node.labels[0].text }, true);
                applyBackground(node.fillColor, node);
            }
        }

        //layout updates
        function updateRightSideMap(diagram) {
            if (diagram) {
                if (diagram.model.layout) {
                    //left side layout
                    for (var i = 0; i < diagram.nodes().length; i++) {
                        var node = diagram.nodes()[i];
                        if (node.addInfo.type == "right" || node.addInfo.type == "subright" || node.addInfo.type == "root")
                        { node.excludeFromLayout = false; }
                        else
                        { node.excludeFromLayout = true; }
                    }
                    diagram.model.layout.orientation = "lefttoright";
                    diagram.layout();
                }
            }
        }

        function updateLeftSideMap(diagram) {
            if (diagram) {
                if (diagram.model.layout) {
                    //left side layout
                    for (var i = 0; i < diagram.nodes().length; i++) {
                        var node = diagram.nodes()[i];
                        if (node.addInfo.type == "left" || node.addInfo.type == "subleft" || node.addInfo.type == "root")
                        { node.excludeFromLayout = false; }
                        else
                        { node.excludeFromLayout = true; }
                    }
                    diagram.model.layout.orientation = "righttoleft";
                    diagram.layout();
                }
            }
        }


        var deleting = false;
        function nodecollectionchanged(evt) {
            if (evt.state === "changing") {
                var diagram = $("#DiagramWebControl1").data("ejDiagram")
                var type = diagram.getObjectType(evt.element);
                if (type == "node") {
                    if (evt.changeType === "remove" && !deleting) {
                        deleting = true;
                        deleteLayoutChilds(evt.element, diagram, true);
                        for (var j = 0; j < evt.element.inEdges.length; j++) {
                            var conn = diagram.nameTable[evt.element.inEdges[j]];
                            //ej.datavisualization.Diagram.Util.removeItem(conn.sourceNode.outEdges, conn);
                            diagram.remove(conn);
                            //evt.element.inEdges.remove(conn);
                        }
                        deleting = false;
                        if (diagram.nodes().length > 0) {
                            if (diagram.model.layout) {
                                var node = evt.element;
                                if (node.addInfo.type == "right" || node.addInfo.type == "subright")
                                    updateRightSideMap(diagram);
                                if (node.addInfo.type == "left" || node.addInfo.type == "subleft")
                                    updateLeftSideMap(diagram);
                            }
                        }
                    }
                }
            }
        }

        function selectionChanged(evt) {
            if (evt.state === "changing") {
                var diagram = $("#DiagramWebControl1").data("ejDiagram")
                if (evt.newItems.length) {
                    var type = diagram.getObjectType(evt.newItems[0]);
                    if (type == "node") {
                        var node = evt.newItems[0];
                        var lefthandle, righthandle, deleteHandle;
                        for (var i = 0; i < diagram.model.selectedItems.userHandles.length; i++) {
                            var handle = diagram.model.selectedItems.userHandles[i];
                            if (handle.name == "leftExtendHandle") {
                                lefthandle = handle;
                            } else {
                                if (handle.name == "rightExtendHandle") {
                                    righthandle = handle;
                                } else if (handle.name == "deleteHandle") {
                                    deleteHandle = handle;
                                }
                            }

                        }
                        if (node.addInfo.type == "root") {
                            if (deleteHandle)
                                ej.datavisualization.Diagram.Util.removeItem(diagram.model.selectedItems.userHandles, deleteHandle);
                            if (!lefthandle) {
                                var leftExtendTool = createUserHandle("leftExtendHandle", "middleleft");
                                diagram.model.selectedItems.userHandles.push(leftExtendTool);
                            }
                            if (!righthandle) {
                                var rightExtendTool = createUserHandle("rightExtendHandle", "middleright");
                                diagram.model.selectedItems.userHandles.push(rightExtendTool);
                            }
                        } else if (node.addInfo.type == "left" || node.addInfo.type == "subleft") {

                            if (righthandle) {
                                ej.datavisualization.Diagram.Util.removeItem(diagram.model.selectedItems.userHandles, righthandle);
                            }

                            if (!lefthandle) {
                                var leftExtendTool = createUserHandle("leftExtendHandle", "middleleft");
                                diagram.model.selectedItems.userHandles.push(leftExtendTool);
                            }
                            if (!deleteHandle) {
                                var deleteHandle = createUserHandle("deleteHandle", "middleright");
                                diagram.model.selectedItems.userHandles.push(deleteHandle);
                            } else deleteHandle.position = "middleright";

                        } else if (node.addInfo.type == "right" || node.addInfo.type == "subright") {
                            if (!righthandle) {
                                var rightExtendTool = createUserHandle("rightExtendHandle", "middleright");
                                diagram.model.selectedItems.userHandles.push(rightExtendTool);
                            }
                            if (lefthandle) {
                                ej.datavisualization.Diagram.Util.removeItem(diagram.model.selectedItems.userHandles, lefthandle);
                            }
                            if (!deleteHandle) {
                                var deleteHandle = createUserHandle("deleteHandle", "middleleft");
                                diagram.model.selectedItems.userHandles.push(deleteHandle);
                            } else
                                deleteHandle.position = "middleleft";
                        }
                        diagram.updateNode(evt.newItems[0].name, { "borderColor": "#282828" });
                    }
                }
                else {
                    type = diagram.getObjectType(diagram.selectionList[0]);
                    if (diagram.selectionList[0] && type == "node") {
                        diagram.updateNode(diagram.selectionList[0].name, { "borderColor": "none" });
                        document.getElementById("colorpalette").style.display = "none";
                    }
                }
            }
        }

        function labelChanged(evt, updated) {
            var diagram = $("#DiagramWebControl1").data("ejDiagram")
            var type = diagram.getObjectType(evt.element);
            if (type == "node") {
                var node = evt.element;
                if (!updated) {
                    if (node.addInfo.type == "root" || node.addInfo.type == "left" || node.addInfo.type == "subleft") {
                        updateLeftSideMap(diagram);
                    }
                    if (node.addInfo.type == "root" || node.addInfo.type == "right" || node.addInfo.type == "subright") {
                        updateRightSideMap(diagram);
                    }
                }
            }
        }

        function deleteLayoutChilds(node, diagram, deleting) {
            if (node.outEdges && node.outEdges.length > 0) {
                for (var i = node.outEdges.length - 1; i >= 0; i--) {
                    var child = diagram.nameTable[diagram.nameTable[node.outEdges[i]].targetNode];
                    deleteLayoutChilds(child, diagram);
                }
                for (var j = node.outEdges.length - 1; j >= 0; j--) {
                    var conn = diagram.nameTable[node.outEdges[j]];
                    diagram.remove(conn);
                }
            }
            if (!deleting)
                diagram.remove(node);
        }

        function click_palette(evt) {
            var color = evt.target.style.backgroundColor;
            var diagram = $("#DiagramWebControl1").data("ejDiagram")
            applyBackground(color, diagram.selectionList[0]);
        }

        function applyBackground(color, target) {
            var diagram = $("#DiagramWebControl1").data("ejDiagram")
            var type = diagram.getObjectType(target);
            if (type == "node") {
                var fontcolor;
                if (target.type != "native") {

                    var values = color.split(",");
                    values[0] = values[0].replace("rgb(", "");
                    values[2] = values[2].replace(")", "");
                    var sum = 0;
                    for (var i = 0; i < values.length - 1; i++) {
                        sum += parseInt(values[i]);
                    }
                    if ((sum / 3) < 125) {
                        if (target.labels[0])
                            fontColor = "white";
                    }
                    document.getElementById("colorpalette").style.display = "none";
                } else {
                    if (target.labels[0]) {
                        fontColor = color;
                    }
                }
                target.labels[0].fontColor = fontColor;
                diagram.updateLabel(target.name, target.labels[0], { "fontColor": fontColor });
                diagram.updateNode(target.name, {
                    "fillColor": color,
                    "borderColor": "none"
                });
                document.getElementById("colorpalette").style.display = "none";
            }
        }

        //user handle initialization
        function createUserHandles(userHandles) {
            var LeftExtendTool = (function (base) {
                ej.datavisualization.Diagram.extend(LeftExtendTool, base);
                function LeftExtendTool(name) {
                    base.call(this, name);
                    this.singleAction = true;
                    this.clonedNodes = [];
                    this.cursor = "pointer";
                }
                LeftExtendTool.prototype.mousedown = function (evt) {
                    base.prototype.mousedown.call(this, evt);
                    this.inAction = true;
                    this.selectedObject = this.diagram.selectionList[0];
                };
                LeftExtendTool.prototype.mousemove = function (evt) {
                    base.prototype.mousemove.call(this, evt);
                };
                LeftExtendTool.prototype.mouseup = function (evt) {
                    if (this.inAction) {
                        this.inAction = false;
                        var type = diagram.getObjectType(this.selectedObject);
                        if (this.selectedObject && type == "node") {
                            if (this.selectedObject.addInfo.type == "root")
                                var type = "left";
                            else
                                var type = "subleft";
                            var node = addNode(type, "Node", "rgb(30, 30, 113)");
                            var conn = connect(this.selectedObject, node, "conn_" + ej.datavisualization.Diagram.Util.randomId());
                            if (this.selectedObject.addInfo.type == "root") {
                                conn.sourcePort = this.selectedObject.ports[0].name;
                                conn.targetPort = node.ports[1].name;
                            }
                            else if (this.selectedObject.addInfo.type == "left") {
                                conn.sourcePort = this.selectedObject.ports[0].name;
                                conn.targetPort = node.ports[1].name;
                            }
                            else {
                                conn.sourcePort = this.selectedObject.ports[0].name;
                                conn.targetPort = node.ports[1].name;
                            }
                            this.diagram.add(node);
                            this.diagram.add(conn);
                            node = this.diagram.nameTable[node.name];
                            applyBackground(node.fillColor, node);
                            updateLeftSideMap(this.diagram);
                            this.diagram.scrollToNode(this.diagram.nameTable[node.name]);
                            editLabel(this.diagram.nameTable[node.name]);
                        }
                    }
                    base.prototype.mouseup.call(this, evt);

                };

                return LeftExtendTool;
            })(ej.datavisualization.Diagram.ToolBase);

            ej.datavisualization.Diagram.LeftExtendTool = LeftExtendTool;
            var leftExtendTool = createUserHandle("leftExtendHandle", "middleleft");
            userHandles.push(leftExtendTool);

            var RightExtendTool = (function (base) {
                ej.datavisualization.Diagram.extend(RightExtendTool, base);
                function RightExtendTool(name) {
                    base.call(this, name);
                    this.singleAction = true;
                    this.clonedNodes = [];
                    this.cursor = "pointer";
                }
                RightExtendTool.prototype.mousedown = function (evt) {
                    base.prototype.mousedown.call(this, evt);
                    this.inAction = true;
                    this.selectedObject = this.diagram.selectionList[0];
                };
                RightExtendTool.prototype.mousemove = function (evt) {
                    base.prototype.mousemove.call(this, evt);
                };
                RightExtendTool.prototype.mouseup = function (evt) {
                    if (this.inAction) {
                        this.inAction = false;
                        var type = diagram.getObjectType(this.selectedObject);
                        if (this.selectedObject && type == "node") {
                            if (this.selectedObject.addInfo.type == "root")
                                var type = "right";
                            else
                                var type = "subright";
                            var node = addNode(type, "Node", "rgb(30, 30, 113)");
                            var conn = connect(this.selectedObject, node, "conn_" + ej.datavisualization.Diagram.Util.randomId());
                            if (this.selectedObject.addInfo.type == "root") {
                                conn.sourcePort = this.selectedObject.ports[1].name;
                                conn.targetPort = node.ports[0].name;
                            }
                            else if (this.selectedObject.addInfo.type == "right") {
                                conn.sourcePort = this.selectedObject.ports[1].name;
                                conn.targetPort = node.ports[0].name;
                            }
                            else {
                                conn.sourcePort = this.selectedObject.ports[1].name;
                                conn.targetPort = node.ports[0].name;
                            }
                            this.diagram.add(node);
                            this.diagram.add(conn);
                            applyBackground(node.fillColor, this.diagram.nameTable[node.name]);
                            updateRightSideMap(this.diagram);
                            this.diagram.scrollToNode(this.diagram.nameTable[node.name]);
                            editLabel(this.diagram.nameTable[node.name]);
                        }
                    }
                    base.prototype.mouseup.call(this, evt);

                };

                return RightExtendTool;
            })(ej.datavisualization.Diagram.ToolBase);

            ej.datavisualization.Diagram.RightExtendTool = RightExtendTool;
            var rightExtendTool = createUserHandle("rightExtendHandle", "middleright");
            userHandles.push(rightExtendTool);

            var FillTool = (function (base) {
                ej.datavisualization.Diagram.extend(FillTool, base);
                function FillTool(name) {
                    base.call(this, name);
                    this.singleAction = true;
                    this.cursor = "pointer";
                }
                FillTool.prototype.mousedown = function (evt) {
                    base.prototype.mousedown.call(this, evt);
                    this.inAction = true;
                    this.selectedObject = this.diagram.selectionList[0];
                };
                FillTool.prototype.mousemove = function (evt) {
                    base.prototype.mousemove.call(this, evt);
                };
                FillTool.prototype.mouseup = function (evt) {
                    if (this.inAction) {
                        this.inAction = false;
                        this.selectedObject = this.diagram.selectionList[0];
                        var left = evt.originalEvent.layerX + 375;
                        var top = evt.originalEvent.layerY + 85;
                        document.getElementById("colorpalette").style.left = left + "px";
                        document.getElementById("colorpalette").style.top = top + "px";
                        document.getElementById("colorpalette").style.display = "block";
                    }

                    base.prototype.mouseup.call(this, evt);

                };

                return FillTool;
            })(ej.datavisualization.Diagram.ToolBase);

            ej.datavisualization.Diagram.FillTool = FillTool;
            var fillTool = createUserHandle("fillHandle", "topcenter");
            userHandles.push(fillTool);

            var DeleteTool = (function (base) {
                ej.datavisualization.Diagram.extend(DeleteTool, base);
                function DeleteTool(name) {
                    base.call(this, name);
                    this.singleAction = true;
                    this.cursor = "pointer";
                }
                DeleteTool.prototype.mousedown = function (evt) {
                    base.prototype.mousedown.call(this, evt);
                    this.inAction = true;
                    this.selectedObject = this.diagram.selectionList[0];
                };
                DeleteTool.prototype.mousemove = function (evt) {
                    base.prototype.mousemove.call(this, evt);
                };
                DeleteTool.prototype.mouseup = function (evt) {
                    if (this.inAction) {
                        this.inAction = false;
                        if (this.selectedObject)
                            this.diagram._remove(this.selectedObject);
                    }
                    base.prototype.mouseup.call(this, evt);

                };

                return DeleteTool;
            })(ej.datavisualization.Diagram.ToolBase);

            ej.datavisualization.Diagram.DeleteTool = DeleteTool;
            var deleteTool = createUserHandle("deleteHandle", "bottomright");
            userHandles.push(deleteTool);
        }
        function editLabel(node) {
            var diagram = $("#DiagramWebControl1").data("ejDiagram")

            if (typeof node.labels.length == "undefined" || node.labels.length == 0) {
                var label = ej.datavisualization.Diagram.Label();
                label.mode = ej.datavisualization.Diagram.LabelEditMode.Edit;
                node.labels.push(label);
            }
            else if (node.labels.length != "undefined" && node.labels.length > 0) {
                diagram.startLabelEdit(node, node.labels[0]);
            }
        }
        function createUserHandle(name, position) {
            var handle = ej.datavisualization.Diagram.UserHandle();
            handle.name = name;
            handle.position = position;
            handle.enableMultiSelection = false;
            handle.size = 30;
            handle.backgroundColor = "#4D4D4D";
            switch (name) {
                case "leftExtendHandle":
                    handle.tool = new ej.datavisualization.Diagram.LeftExtendTool(name);
                    handle.pathData = "M11.924,6.202 L4.633,6.202 L4.633,9.266 L0,4.633 L4.632,0 L4.632,3.551 L11.923,3.551 L11.923,6.202Z";
                    break;
                case "rightExtendHandle":
                    handle.tool = new ej.datavisualization.Diagram.RightExtendTool(name);
                    handle.pathData = "M0,3.063 L7.292,3.063 L7.292,0 L11.924,4.633 L7.292,9.266 L7.292,5.714 L0.001,5.714 L0.001,3.063Z ";
                    break;
                case "deleteHandle":
                    handle.tool = new ej.datavisualization.Diagram.DeleteTool(name);
                    handle.pathData = "M33.977998,27.684L33.977998,58.102997 " + "41.373998,58.102997 41.373998,27.684z M14.841999,27.684L14.841999,58.102997 22.237998,58.102997 " + "22.237998,27.684z M4.0319996,22.433001L52.183,22.433001 52.183,63.999001 4.0319996,63.999001z " + "M15.974,0L40.195001,0 40.195001,7.7260003 56.167001,7.7260003 56.167001,16.000999 0,16.000999 " + "0,7.7260003 15.974,7.7260003z";
                    break;
                case "fillHandle":
                    handle.tool = new ej.datavisualization.Diagram.FillTool(name);
                    handle.pathData = "M44.02605,20.846C44.02605,20.846 63.682006,24.103257 63.682006,38.870418 63.682006,42.772187 63.682006,49.664208 63.682006,53.565377 63.682006,66.221799 51.658645,58.015256 51.658645,50.555524 51.658645,40.738351 60.340182,37.173087 56.365394,33.199718z M25.529025,0C34.740886,0,39.964213,12.976948,40.281676,22.477042L40.293128,23.153271 40.635634,23.496004C44.15071,27.013427 48.794879,31.660645 50.360019,33.226604 52.995978,35.863305 51.193019,38.789006 50.089023,39.892009 48.98503,40.995406 28.241208,61.738416 28.241208,61.738416 25.936236,64.043717 17.883273,59.726617 10.261396,52.099114 2.63244,44.474008 -1.684536,36.421304 0.6204343,34.116004L22.599233,12.137394C22.599233,12.137394 24.072108,10.731551 26.071624,10.752226 27.118989,10.763056 28.310851,11.165289 29.511216,12.365994L31.998191,14.858796C33.357127,19.144596 32.48714,22.803398 31.852197,24.675799 30.646153,25.4376 29.839215,26.7741 29.839215,28.308002 29.839215,30.683002 31.76516,32.610805 34.144168,32.610805 36.52415,32.610805 38.450095,30.683002 38.450095,28.308002 38.450095,26.808 37.681121,25.490899 36.519145,24.7214 36.644145,23.702499 36.722144,21.654397 36.354106,19.211597 36.354106,19.211597 36.823226,19.681035 37.592975,20.451304L37.670257,20.528639 37.615382,20.036525C36.595061,11.949274 32.102916,2.4615231 25.529025,2.4615231 17.491012,2.4615231 15.683008,10.664832 15.683008,13.53907L13.222004,13.53907C13.222004,8.3047702,16.56301,0,25.529025,0z";
                    break;
            }
            return handle;
        };
    </script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/Diagram/DiagramCommon.js")%>' type="text/javascript"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="StyleSection" runat="server">
    <style>
        .align {
            border: 5px solid white;
            width: 25px;
            height: 25px;
        }

        .userHandle:hover {
            fill: #7F7F7F;
        }

        .svg-rotate-ie:hover {
            cursor: url("../Content/ejthemes/common-images/diagram/Rotate.cur"),default;
        }

        .svg-rotate {
            cursor: url("../Content/ejthemes/common-images/diagram/Rotate.cur"),default;
        }
    </style>
</asp:Content>

<asp:Content runat="server" ID="ControlContent" ContentPlaceHolderID="ControlsSection">
    <ej:Diagram ClientIDMode="Static" ID="DiagramWebControl1" runat="server" Height="600px" Width="100%">
        <pagesettings scrolllimit="Diagram" />
    </ej:Diagram>

    <div id="palette">
        <table style="width: 125px; height: 125px; display: none; position: absolute; left: 100px; top: 100px; background-color: aliceblue" id="colorpalette">
            <tr>
                <td class="align" id="fill_pink" style="background-color: rgb(176, 82, 151)"></td>
                <td class="align" id="fill_brown" style="background-color: rgb(187, 51, 58)"></td>
                <td class="align" id="fill_skyblue" style="background-color: rgb(60, 37, 206)"></td>
                <td class="align" id="Td1" style="background-color: rgb(0, 139, 139)"></td>
            </tr>
            <tr>
                <td class="align" id="fill_black" style="background-color: rgb(235, 15, 15)"></td>
                <td class="align" id="fill_green" style="background-color: rgb(36, 161, 92)"></td>
                <td class="align" id="fill_blue" style="background-color: rgb(30, 30, 113)"></td>
                <td class="align" id="Td2" style="background-color: rgb(128, 0, 128)"></td>
            </tr>
            <tr>
                <td class="align" id="fill_gray" style="background-color: rgb(34, 113, 113)"></td>
                <td class="align" id="fill_yellow" style="background-color: rgb(151, 139, 46)"></td>
                <td class="align" id="fill_violet" style="background-color: rgb(94, 45, 108)"></td>
                <td class="align" id="Td3" style="background-color: rgb(0, 100, 0)"></td>

            </tr>
            <tr>
                <td class="align" id="Td4" style="background-color: rgb(113, 50, 50)"></td>
                <td class="align" id="Td5" style="background-color: rgb(139, 146, 16)"></td>
                <td class="align" id="Td6" style="background-color: rgb(32, 145, 125)"></td>
                <td class="align" id="Td7" style="background-color: rgb(100, 0, 0)"></td>

            </tr>
        </table>
    </div>
</asp:Content>

