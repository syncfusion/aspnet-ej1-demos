<%@ Page Title="TreeView-Client-Side Events-ASP.NET-SYNCFUSION"   Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" 
CodeBehind="ClientSideEvents.aspx.cs" MetaDescription="This sample demonstrates the various client side events like created, ready, expand and collapse etc in a ASP.NET Web Forms TreeView control." Inherits="WebSampleBrowser.TreeView.ClientSideEvents" %>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div style="width: 250px">
        <ej:TreeView ID="treeView" runat="server" Height="100%" ClientSideOnBeforeEdit="onBeforeEdit" ClientSideOnNodeEdit="onEdit" 
                     ClientSideOnNodeDropped="onDropped" ClientSideOnNodeDragStoped="onDragStop" ClientSideOnNodeDraged="onDrag" 
                     ClientSideOnNodeDragStarted="onDragStart" ClientSideOnNodeUnchecked="onUnChecked" ClientSideOnNodeChecked="onChecked" 
                     ClientSideOnNodeSelected="onSelect" ClientSideOnBeforeCollapsed="onBeforeCollapse" 
                     ClientSideOnBeforeExpanded="onBeforeExpand" ClientSideOnNodeCollapsed="onCollapse" ClientSideOnNodeExpanded="onExpand" 
                     ClientSideOnCreated="onCreate" ClientSideOnReady="onReady" ShowCheckbox="true" AllowDragAndDrop="true" 
                     AllowDropChild="true" AllowDropSibling="true" AllowEditing="true">
            <Nodes>
                <ej:TreeViewNode Text="Cricket" Expanded="true">
                    <Nodes>
                        <ej:TreeViewNode Text="Princeton Club"></ej:TreeViewNode>
                        <ej:TreeViewNode Text="Harverd Club"></ej:TreeViewNode>
                        <ej:TreeViewNode Text="st.Columbia Club"></ej:TreeViewNode>
                        <ej:TreeViewNode Text="Dartmouth Club"></ej:TreeViewNode>
                        <ej:TreeViewNode Text="Middlebury Club"></ej:TreeViewNode>
                    </Nodes>
                </ej:TreeViewNode>
                <ej:TreeViewNode Text="Football">
                    <Nodes>
                        <ej:TreeViewNode Text="A.F.C Blackpool"></ej:TreeViewNode>
                        <ej:TreeViewNode Text="A.F.C Emley"></ej:TreeViewNode>
                        <ej:TreeViewNode Text="Bedford"></ej:TreeViewNode>
                        <ej:TreeViewNode Text="Farsley"></ej:TreeViewNode>
                    </Nodes>
                </ej:TreeViewNode>
                <ej:TreeViewNode Text="Basketball">
                    <Nodes>
                        <ej:TreeViewNode Text="AGE Halkida"></ej:TreeViewNode>
                        <ej:TreeViewNode Text="Iraklio"></ej:TreeViewNode>
                        <ej:TreeViewNode Text="Sporting Athens"></ej:TreeViewNode>
                        <ej:TreeViewNode Text="Pagrati Athens"></ej:TreeViewNode>
                        <ej:TreeViewNode Text="Lodon colney"></ej:TreeViewNode>
                    </Nodes>
                </ej:TreeViewNode>
            </Nodes>
        </ej:TreeView>
    </div>
</asp:Content>


<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="EventSection">
    <div class="cols-prop-area event-tracer">
        <div>
            <div class="heading">
                <span>Event Trace</span>
                <div class="pull-right">
                    <ej:DropDownList ID="selectControls" ClientSideOnPopupShown="adjustpopupposition" 
                                     ClientSideOnCheckChange="evtpropscheckedevent" 
                                     ShowCheckbox="true" CheckAll="true" runat="server">
                        <Items>
                            <ej:DropDownListItem Value="create" Text="create"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="nodeExpand" Text="expand"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="nodeCollapse" Text="collapse"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="beforeExpand" Text="beforeExpand"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="beforeCollapse" Text="beforeCollapse"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="nodeSelect" Text="select"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="nodeCheck" Text="check"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="nodeUncheck" Text="uncheck"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="nodeDragStart" Text="dragStarts"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="nodeDrag" Text="drag"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="nodeDragStop" Text="dragStop"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="nodeDropped" Text="dropped"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="beforeEdit" Text="beforeEdit"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="nodeEdit" Text="nodeEdit"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            <div class="prop-grid content">
                <div class="eventarea">
                    <div class="EventLog" id="EventLog">
                    </div>
                </div>
                <div class="evtbtn">
                    <ej:Button ID="Clear" Type="Button" Text="Clear" ClientSideOnClick="onClear" CssClass="eventclear e-btn" 
                               runat="server"></ej:Button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>



<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        var treeviewObj, tabIndex = 1;

        // Event wire and unwire
        function evtpropscheckedevent(args) {
            treeviewObj = $("#<%=treeView.ClientID%>").data("ejTreeView");
        if (args.isChecked) {
            switch (args.data.itemValue) {
                case "create": treeviewObj.option(args.data.itemValue, "onCreate"); break;
                case "nodeExpand": treeviewObj.option(args.data.itemValue, "onExpand"); break;
                case "nodeCollapse": treeviewObj.option(args.data.itemValue, "onCollapse"); break;
                case "beforeExpand": treeviewObj.option(args.data.itemValue, "onBeforeExpand"); break;
                case "beforeCollapse": treeviewObj.option(args.data.itemValue, "onBeforeCollapse"); break;
                case "nodeSelect": treeviewObj.option(args.data.itemValue, "onSelect"); break;
                case "nodeCheck": treeviewObj.option(args.data.itemValue, "onChecked"); break;
                case "nodeUncheck": treeviewObj.option(args.data.itemValue, "onUnChecked"); break;
                case "nodeDragStart": treeviewObj.option(args.data.itemValue, "onDragStart"); break;
                case "nodeDrag": treeviewObj.option(args.data.itemValue, "onDrag"); break;
                case "nodeDragStop": treeviewObj.option(args.data.itemValue, "onDragStop"); break;
                case "nodeDropped": treeviewObj.option(args.data.itemValue, "onDropped"); break;
                case "beforeEdit": treeviewObj.option(args.data.itemValue, "onBeforeEdit"); break;
                case "nodeEdit": treeviewObj.option(args.data.itemValue, "onEdit"); break;
            }
        }
        else treeviewObj.option(args.data.itemValue, null);
    }

    function onCreate(args) {
        jQuery.addEventLog("Treeview has been <span class='eventTitle'>created</span>.");
    }
    function onExpand(args) {
        jQuery.addEventLog($.trim(args.value) + " node is <span class='eventTitle'>Expanded</span>.");
    }
    function onCollapse(args) {
        jQuery.addEventLog($.trim(args.value) + " node is <span class='eventTitle'>Collapsed</span>.");
    }
    function onBeforeExpand(args) {
        jQuery.addEventLog("<span class='eventTitle'>BeforeExpand</span> event is fired for " + $.trim(args.text) + " node.");
    }
    function onBeforeCollapse(args) {
        jQuery.addEventLog("<span class='eventTitle'>BeforeCollapse</span> event is fired for " + $.trim(args.text) + " node.")
    }
    function onSelect(args) {
        jQuery.addEventLog($.trim(args.value) + " node is <span class='eventTitle'>selected</span>.");
    }
    function onChecked(args) {
        jQuery.addEventLog($.trim(args.value) + " node is <span class='eventTitle'>checked</span>.");
    }
    function onUnChecked(args) {
        jQuery.addEventLog($.trim(args.value) + " node is <span class='eventTitle'>unchecked</span>.");
    }
    function onDragStart(args) {
        jQuery.addEventLog($.trim(args.targetElementData.text) + " node <span class='eventTitle'>dragging has been started</span>.");
    }
    function onDrag(args) {
        jQuery.addEventLog($.trim(args.draggedElementData.text) + " node is being <span class='eventTitle'>dragged</span>.");
    }
    function onDragStop(args) {
        jQuery.addEventLog($.trim(args.draggedElementData.text) + " node dragging has been <span class='eventTitle'>stopped</span>.");
    }
    function onDropped(args) {
        var targetText = (args.targetElementData.text != "") ? $.trim(args.targetElementData.text) : "Treeview";
        jQuery.addEventLog($.trim(args.droppedElementData.text) + " node has been <span class='eventTitle'>dropped </span> to " + targetText + ".");
    }
    function onBeforeEdit(args) {
        jQuery.addEventLog("<span class='eventTitle'>BeforeEdit</span> event is fired for " + $.trim(args.currentElement.text()) + " node.");
    }
    function onEdit(args) {
        jQuery.addEventLog($.trim(args.oldText) + " node has been <span class='eventTitle'>edited</span> to " + $.trim(args.newText) + ".");
    }
    function onReady(args) {
        jQuery.addEventLog("TreeView nodes are <span class='eventTitle'>loaded</span> successfully.");
    }
    function onClear() {
        jQuery.clearEventLog();
    }</script>
</asp:Content>



