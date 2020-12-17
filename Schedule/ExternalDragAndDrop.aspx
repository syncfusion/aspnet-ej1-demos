<%@ Page Title="Schedule-External Drag and Drop-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example shows how to drag and drop appointments in the ASP.NET Web Scheduler from external sources." AutoEventWireup="true" CodeBehind="ExternalDragAndDrop.aspx.cs" MasterPageFile="~/Samplebrowser.Master" Inherits="WebSampleBrowser.Schedule.ExternalDragAndDrop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Schedule / External Drag and Drop</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div class="row">
        <div class="col-xs-4 col-sm-2" style="float: left">
            <span class=""><b>Tutorials </b></span>
            <ej:treeview id="treeview" runat="server" height="100%" allowdraganddrop="true" allowdropchild="false" allowdropsibling="false" allowdraganddropacrosscontrol="true" clientsideonnodedropped="onNodeDropped" clientsideonnodedragstarted="onNodeDrag">
                <Nodes>
                    <ej:TreeViewNode Expanded="True" Text="HTML" Id="HTML">
                        <Nodes>
                             <ej:TreeViewNode Text="Introduction"></ej:TreeViewNode>
                             <ej:TreeViewNode Text="Editors"></ej:TreeViewNode>
                             <ej:TreeViewNode Text="Styles"></ej:TreeViewNode>
                             <ej:TreeViewNode Text="Formatting"></ej:TreeViewNode>
                             <ej:TreeViewNode Text="Tables"></ej:TreeViewNode>
                        </Nodes>
                    </ej:TreeViewNode>

                    <ej:TreeViewNode Text="CSS" Id="CSS">
                        <Nodes>
                            <ej:TreeViewNode Text="Introduction"></ej:TreeViewNode>
                            <ej:TreeViewNode Text="Syntax"></ej:TreeViewNode>
                            <ej:TreeViewNode Text="Tables"></ej:TreeViewNode>
                            <ej:TreeViewNode Text=" Box Model"></ej:TreeViewNode>
                            <ej:TreeViewNode Text="Position"></ej:TreeViewNode>
                        </Nodes>
                    </ej:TreeViewNode>

                    <ej:TreeViewNode Text="JAVA SCRIPT" Id="Javascript">
                        <Nodes>
                            <ej:TreeViewNode Text="Introduction"></ej:TreeViewNode>
                            <ej:TreeViewNode Text="Statements"></ej:TreeViewNode>
                            <ej:TreeViewNode Text="Variables"></ej:TreeViewNode>
                            <ej:TreeViewNode Text="Data Types"></ej:TreeViewNode>
                            <ej:TreeViewNode Text="Functions"></ej:TreeViewNode>
                            <ej:TreeViewNode Text="Objects"></ej:TreeViewNode>
                        </Nodes>
                    </ej:TreeViewNode>

                     <ej:TreeViewNode Text="SQL"  Id="SQL">
                        <Nodes>
                            <ej:TreeViewNode Text="Introduction"></ej:TreeViewNode>
                            <ej:TreeViewNode Text="Distinct"></ej:TreeViewNode>
                            <ej:TreeViewNode Text="Oreder By"></ej:TreeViewNode>
                            <ej:TreeViewNode Text="Injection"></ej:TreeViewNode>
                            <ej:TreeViewNode Text="Primarykey"></ej:TreeViewNode>
                        </Nodes>
                    </ej:TreeViewNode>

                       <ej:TreeViewNode Text="PHP"  Id="PHP">
                        <Nodes>
                            <ej:TreeViewNode Text="Introduction"></ej:TreeViewNode>
                            <ej:TreeViewNode Text="Constants"></ej:TreeViewNode>
                            <ej:TreeViewNode Text="Operators"></ej:TreeViewNode>
                            <ej:TreeViewNode Text="Arrays"></ej:TreeViewNode>
                            <ej:TreeViewNode Text="Operators"></ej:TreeViewNode>
                        </Nodes>
                    </ej:TreeViewNode>
                </Nodes>
            </ej:treeview>
        </div>

        <div style="float: left" class="col-xs-18 col-sm-9">
            <span class=""><b>Training Scheduler Panel</b><br></span>
            <i>Note</i>: To Schedule classes, drag the topics from <b>Tutorials</b> and drop it over <b>Training Scheduler Panel</b>
            <ej:schedule clientidmode="Static" runat="server" id="Schedule1" datasourceid="SqlData" width="100%" height="525px" cellwidth="40px" currentdate="6/5/2017" orientation="Horizontal" views="Day,Week,WorkWeek,Month" showcurrenttimeindicator="false" showoverflowbutton="true">
                <Group Resources="Owners" />
                <Resources>
                    <ej:Resources Field="OwnerId" Name="Owners" Title="Owner" AllowMultiple="true">
                        <ResourceSettings Color="color" Id="id" Text="text"></ResourceSettings>
                    </ej:Resources>
                </Resources>
                <AppointmentSettings Id="Id" Subject="Subject" AllDay="AllDay" StartTime="StartTime" EndTime="EndTime" Description="Description" Recurrence="Recurrence" RecurrenceRule="RecurrenceRule" ResourceFields="OwnerId"/>
            </ej:schedule>
        </div>
    </div>

    <div id="customWindow" style="display: none">
        <div id="custom">
            <table width="100%" cellpadding="5">
                <tbody>
                    <tr>
                        <td>Subject:</td>
                        <td colspan="2">
                            <input id="subject" type="text" value="" name="Subject" style="width: 100%" readonly />
                        </td>
                    </tr>
                    <tr>
                        <td>Description:</td>
                        <td colspan="2">
                            <textarea id="customdescription" name="Description" rows="3" cols="50" style="width: 100%; resize: vertical"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>StartTime:</td>
                        <td>
                            <input id="StartTime" type="text" value="" name="StartTime" />
                        </td>
                    </tr>
                    <tr>
                        <td>EndTime:</td>
                        <td>
                            <input id="EndTime" type="text" value="" name="EndTime" />
                        </td>
                    </tr>
                    <tr>
                        <td>Resource:</td>
                        <td colspan="2">
                            <input id="resource" type="text" value="" name="Resource" style="width: 100%" readonly />
                        </td>
                    </tr>
                    <tr style="display: none">
                        <td>ownerId:</td>
                        <td colspan="2">
                            <input id="ownerId" type="text" name="ownerId" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div>
            <button type="submit" onclick="cancel()" id="btncancel" style="float: right; margin-right: 20px; margin-bottom: 10px;">Cancel</button>
            <button type="submit" onclick="save()" id="btnsubmit" style="float: right; margin-right: 20px; margin-bottom: 10px;">Save</button>
        </div>
    </div>

    <asp:sqldatasource id="SqlData" runat="server" connectionstring="<%$ ConnectionStrings:ScheduleConnectionString %>"
        selectcommand="SELECT * FROM [MultipleResource]"></asp:sqldatasource>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        $(function () {
            $("#customWindow").ejDialog({
                width: 600,
                height: "auto",
                showOnInit: false,
                enableModal: true,
                title: "Create Appointment",
                enableResize: false,
                allowKeyboardNavigation: false,
                close: "clearFields",
            });
            $("#btnsubmit,#btncancel").ejButton({ width: '85px' });
			$("#StartTime,#EndTime").ejDateTimePicker({ width: "150px" });
        });
        function onNodeDrag(e) {
            if (e.targetElementData.parentId == "") return false;
        }
        function onNodeDropped(e) {
            if ($(e.target).parents(".e-schedule").length != 0) {
                var scheduleObj = $("#Schedule1").data("ejSchedule");
                var result = scheduleObj.getSlotByElement($(e.target));
                // set value to custom appointmnt window fields
                $("#subject").val(e.droppedElementData.text);
                $("#customdescription").val(e.droppedElementData.text);
                $("#StartTime").ejDateTimePicker({ value: new Date(result.startTime) });
                $("#EndTime").ejDateTimePicker({ value: new Date(result.endTime) });
                $("#resource").val(result.resources.text);
                $("#ownerId").val(result.resources.id);
                $("#customWindow").ejDialog("open");
            }
        }
        function save() {
            var obj = {};
            obj["Subject"] = $("#subject")[0].value;
            obj["Description"] = $("#customdescription")[0].value;
            obj["StartTime"] = new Date($("#StartTime")[0].value);
            obj["EndTime"] = new Date($("#EndTime")[0].value);
            obj["OwnerId"] = $("#ownerId")[0].value;
            $("#customWindow").ejDialog("close");
            var object = $("#Schedule1").data("ejSchedule");
            object.saveAppointment(obj);
        }

        function cancel() {
            $("#customWindow").ejDialog("close");
        }
    </script>
</asp:Content>

<asp:Content runat="server" ID="Style" ContentPlaceHolderID="StyleSection">
    <style type="text/css">
        #custom table td {
            padding: 5px;
        }

        .e-icon.e-minus:before {
            content: "\e676";
        }
    </style>
</asp:Content>

