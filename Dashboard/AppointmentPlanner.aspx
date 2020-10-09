<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AppointmentPlanner.aspx.cs" Inherits="WebSampleBrowser.Dashboard.AppointmentPlanner" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Essential Studio for ASP.NET : Appointment Planner</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta name="description" content="ASP.NET | An appointment planner is developed using scheduler to manage the patient appointments booked under each specialized doctors.">
    <link rel="shortcut icon" href='<%= Page.ResolveClientUrl("~/Content/images/favicon.ico")%>' />
    <link rel="stylesheet" href='<%= Page.ResolveClientUrl("~/Content/bootstrap.min.css")%>' />
    <link rel="stylesheet" href='<%= Page.ResolveClientUrl("~/Content/ejthemes/ej.widgets.core.min.css")%>' />
    <link rel="stylesheet" href='<%= Page.ResolveClientUrl("~/Content/ejthemes/flat-saffron/ej.theme.min.css")%>' />
    <link rel="stylesheet" href='<%= Page.ResolveClientUrl("~/Content/ejthemes/responsive-css/ej.responsive.css")%>' />
    <link rel="stylesheet" href='<%= Page.ResolveClientUrl("~/Content/DashBoard/AppointmentPlanner/appointmentplanner.css")%>' />

    <script src='<%= Page.ResolveClientUrl("~/Scripts/jquery-1.11.3.min.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/jsrender.min.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/ej.web.all.min.js")%>' type="text/javascript"></script>

</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="scriptManager1" runat="server"></asp:ScriptManager>
        <div id="wcontent">
            <img src="../../Content/ejthemes/default-theme/images/waitingpopup.gif" alt="waiting_logo" style="margin-top: 14px; margin-left: 14px;" />
        </div>
        <div class="showcasecontainer">
            <script>
                $(".showcasecontainer").ejWaitingPopup({
                    showOnInit: true,
                    template: $("#wcontent")
                });
            </script>
            <div class="headercontainer">
                <div class="headercontainertext">DOCTOR'S APPOINTMENT SCHEDULER</div>
            </div>
            <div class="contentcontainer">
                <div class="leftcol">
                    <div class="category">
                        <div class="categoryheader">
                            <div class="headertext">CATEGORY</div>
                        </div>
                        <div class="categorycontent">
                            <div class="listbox">
                                <ul id="categorylist"></ul>
                            </div>
                        </div>
                    </div>
                    <div class="doctor">
                        <div class="doctorheader">
                            <div class="headertext">DOCTORS</div>
                        </div>
                        <div class="doctorcontent">
                            <div class="doctorlist">
                                <input type="text" id="doctorlist" />
                            </div>
                        </div>
                        <div class="doctorsdept">
                            <div class="doctorslist">
                                <ul id="doctorsdeptlist"></ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="middlecol">
                    <div id='lefticon'><span class='icon-right'></span></div>
                    <div id='righticon'><span class='icon-left'></span></div>
                    <div class="menubar">
                        <div class="display" role="navigation">
                            <div id="doctor" class="displayleft">
                                <div class="menuheadertext">DOCTORS AVAILABILITY / APPOINTMENTS</div>
                            </div>
                        </div>
                        <div class="displayright" role="search">
                            <ej:ToggleButton ClientIDMode="Static" ID="searchbtn" runat="server" Size="Normal" Width="30px" Height="30px" ShowRoundedCorner="false" ContentType="ImageOnly" DefaultPrefixIcon="icon-search" ActivePrefixIcon="icon-close datesearch" ClientSideOnClick="onSearchClick"></ej:ToggleButton>
                            <div id="searchdata">
                                <div id="searchpanel" style="padding: 0px 5px 0px 5px;">
                                    <div id="searchtype" class="esearch" style="padding-right: 5px;">
                                        <ej:DropDownList ClientIDMode="Static" ID="searchlist" runat="server" SelectedIndex="0" Width="100px" ClientSideOnPopupHide="onSearchtypeHide">
                                            <Items>
                                                <ej:DropDownListItem Text="ID" Value="ID"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Name" Value="Name"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Description" Value="Description"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Category" Value="Category"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Date" Value="Date"></ej:DropDownListItem>
                                            </Items>
                                        </ej:DropDownList>
                                    </div>
                                    <div id="search" class="esearch">
                                        <input type="text" id="txtSearch" class="searchbox" onkeyup="searchKeyUp()" />
                                    </div>
                                </div>
                                <div id="datesearchpanel">
                                    <div class="searchdatepicker esearch">
                                        <ej:DatePicker ClientIDMode="Static" ID="startdatepicker" runat="server" Width="120px" WatermarkText="From Date" ClientSideOnSelect="onSearchDateChange" Value="4/1/2016"></ej:DatePicker>
                                    </div>
                                    <div class="searchdatepicker esearch">
                                        <ej:DatePicker ClientIDMode="Static" ID="enddatepicker" runat="server" Width="120px" WatermarkText="To Date" ClientSideOnSelect="onSearchDateChange" Value="4/1/2016"></ej:DatePicker>
                                    </div>
                                    <div class="searchdatepicker esearch">
                                        <ej:ToggleButton ClientIDMode="Static" ID="datesearch" runat="server" Type="Button" Size="Normal" Width="30px" Height="30px" ContentType="ImageOnly" DefaultPrefixIcon="icon-search" ActivePrefixIcon="icon-close datesearch" ClientSideOnClick="onDateSearch"></ej:ToggleButton>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="appointmentarea">
                        <div class="hospitalschedule">
                            <ej:Schedule ID="DoctorSchedule" runat="server" Width="100%" Height="100%" CellWidth="50px" Orientation="Horizontal" Views="day,week,month" CurrentView="Day" CurrentDate="4/1/2016" ShowCurrentTimeIndicator="false" ShowQuickWindow="false" StartHour="7" EndHour="23" TimeZone="UTC -08:00" ResourceHeaderTemplateId="#resTemplate" AppointmentTemplateId="#doctortemplate" AppointmentWindowOpen="onAppointmentWindowOpen" Navigation="OnNavigation" QueryCellInfo="onQueryCellInfo" ActionComplete="onCustomization">
                                <TooltipSettings Enable="true" TemplateId="#tooltipTemp" />
                                <Group Resources="Rooms,Owners" />
                                <Resources>
                                    <ej:Resources Field="RoomId" Name="Rooms" Title="Room" AllowMultiple="false">
                                        <ResourceSettings Color="Color" Id="Id" GroupId="GroupId" Text="Text">
                                        </ResourceSettings>
                                    </ej:Resources>
                                    <ej:Resources Field="OwnerId" Name="Owners" Title="Owner" AllowMultiple="true">
                                        <ResourceSettings Color="Color" Id="Id" GroupId="GroupId" Text="Text">
                                        </ResourceSettings>
                                    </ej:Resources>
                                </Resources>
                                <AppointmentSettings Id="Id" Subject="Subject" StartTime="StartTime" EndTime="EndTime" Description="Description" AllDay="AllDay" Recurrence="Recurrence" RecurrenceRule="RecurrenceRule" ResourceFields="RoomId,OwnerId" />
                            </ej:Schedule>
                        </div>
                    </div>
                </div>
                <div class="rightcol">
                    <div class="calendar">
                        <div class="calendarheader">
                            <div class="headertext" style="padding-top: 2px;">CALENDAR</div>
                        </div>
                        <div class="calendarcontent">
                            <ej:DatePicker ClientIDMode="Static" ID="datepicker" runat="server" TagName="div" Width="100%" Height="100%" ClientSideOnSelect="onSelected" ShowFooter="false" DisplayInline="true" Value="4/1/2016"></ej:DatePicker>
                        </div>
                    </div>
                    <div class="waitinglist">
                        <div class="waitinglistheader">
                            <div class="headertext">WAITING LIST</div>
                            <span class="headtitle">Drag and drop the below items</span>
                        </div>
                        <div class="waitinglistcontent">
                            <div class="waitingapplist">
                                <ul id="upcomming"></ul>
                            </div>
                        </div>
                        <div class="appointmentbtn">
                            <div class="groupbtn">
                                <div class="btnsht">
                                    <ej:Button ID="new" CssClass="add" ClientIDMode="Static" runat="server" Type="Button" Size="Normal" Text="New" ClientSideOnClick="onButtonClick" ShowRoundedCorner="true" Width="100%" />
                                </div>
                                <div class="btnsht">
                                    <ej:Button ID="delete" CssClass="delete" ClientIDMode="Static" runat="server" Type="Button" Size="Normal" Text="Delete" ClientSideOnClick="onButtonClick" ShowRoundedCorner="true" Width="100%" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="footer">
                <div class="bottom-links">
                    <div class="left">
                        <div class="sync-text">
                            Copyright © 2001-2019 Syncfusion Inc.
                        </div>
                    </div>
                    <div class="right">
                        <a href="https://www.syncfusion.com">
                            <div class="syncfusion-image"></div>
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <!--Appointment Window Dialog-->
        <div id="customWindow" style="display: none">
            <div id="appWindow" class="e-windowmargin">
                <div id="custom">
                    <div class="container-fluid">
                        <div class="row epadding" style="display: none;">
                            <div class="col-md-3">Id</div>
                            <div class="col-md-9">
                                <input id="customId" type="text" name="Id" />
                            </div>
                        </div>
                        <div class="row epadding">
                            <div class="col-md-2">Patient Name *</div>
                            <div class="col-md-7">
                                <input id="subject" type="text" value="" name="Subject" onfocus="temp()" style="width: 100%" />
                            </div>
                            <div class="col-md-2">
                                <ej:Button ClientIDMode="Static" ID="patientadd" runat="server" Type="Button" Text="New Patient" ClientSideOnClick="onPatientNew" Size="Normal" Width="100px"></ej:Button>
                            </div>
                        </div>
                        <div class="row epadding">
                            <div class="col-md-2">Reason</div>
                            <div class="col-md-10">
                                <textarea id="customdescription" name="Description" rows="3" cols="50" style="width: 100%; resize: vertical"></textarea>
                            </div>
                        </div>
                        <div class="row epadding">
                            <div class="col-md-2">From</div>
                            <div class="col-md-3">
                                <ej:DateTimePicker ClientIDMode="Static" ID="StartTime" runat="server" Width="150px">
                                    <DateTimePickerDrillDown Enabled="true" Interval="30" ShowMeridian="false" />
                                </ej:DateTimePicker>
                            </div>
                            <div class="col-md-2 col-md-offset-1">To</div>
                            <div class="col-md-3">
                                <ej:DateTimePicker ClientIDMode="Static" ID="EndTime" runat="server" Width="150px">
                                    <DateTimePickerDrillDown Enabled="true" Interval="30" ShowMeridian="false" />
                                </ej:DateTimePicker>
                            </div>
                        </div>
                        <div class="row epadding">
                            <div class="col-md-2">Department</div>
                            <div class="col-md-3">
                                <input type="text" id="Department" />
                            </div>
                            <div class="col-md-2 col-md-offset-1">Consultant</div>
                            <div class="col-md-3">
                                <input type="text" id="deptdoctors" />
                            </div>
                        </div>
                        <div class="row epadding">
                            <div class="col-md-2">Service</div>
                            <div class="col-md-3">
                                <ej:DropDownList ClientIDMode="Static" ID="Category" runat="server" Width="150px" SelectedIndex="0" DataTextField="Text">
                                </ej:DropDownList>
                            </div>
                            <div class="col-md-2 col-md-offset-1">Repeat</div>
                            <div class="col-md-2">
                                <ej:CheckBox ClientIDMode="Static" ID="recurrence" runat="server" Checked="false" Enabled="true" ClientSideOnChange="recurCheck"></ej:CheckBox>
                            </div>
                            <div class="col-md-1 e-recuredit" id="editApp" style="display: none;"><a class="recuredit" href="#" style="float: left; padding-left: 10px;">Edit</a></div>
                        </div>
                    </div>
                </div>
                <br />
                <div>
                    <button type="submit" id="appcancel">Cancel</button>
                    <button type="submit" id="appsubmit">Submit</button>
                </div>
            </div>
            <div id="recWindow" style="display: none">
                <div id="recurrenceEditor"></div>
                <br />
                <div>
                    <button type="submit" id="reccancel">Cancel</button>
                    <button type="submit" id="recsubmit">Submit</button>
                </div>
            </div>
        </div>
        <!--Patient Details Dialog-->
        <div id="patientWindow" style="display: none">
            <div id="patient">
                <table width="100%" cellpadding="5">
                    <tbody>
                        <tr>
                            <td style="text-align: right">ID</td>
                            <td colspan="2">
                                <input id="patientid" class="e-inputtext patientdetails" type="text" name="Id" readonly /></td>
                        </tr>
                        <tr>
                            <td style="text-align: right">Name</td>
                            <td colspan="2">
                                <input id="patientname" class="e-inputtext patientdetails" type="text" name="Name" onfocus="temp()" /></td>
                        </tr>
                        <tr>
                            <td style="text-align: right">Date of Birth</td>
                            <td colspan="2">
                                <ej:DatePicker ClientIDMode="Static" ID="patientdob" runat="server" CssClass="e-inputtext patientdetails" Width="170px" ClientSideOnFocusIn="temp"></ej:DatePicker></td>
                        </tr>
                        <tr>
                            <td style="text-align: right">Mobile</td>
                            <td colspan="2">
                                <input id="patientmobile" class="e-inputtext patientdetails" type="number" name="Mobile" onfocus="temp()" /></td>
                        </tr>
                        <tr>
                            <td style="text-align: right">Blood Group</td>
                            <td colspan="2">
                                <input id="patientbloodgroup" class="e-inputtext patientdetails" type="text" name="BloodGroup" /></td>
                        </tr>
                        <tr>
                            <td style="text-align: right">Address</td>
                            <td colspan="2">
                                <textarea id="patientaddress" class="e-inputtext patientdetails" type="text" width="100%" name="Address" onfocus="temp()"></textarea></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div style="padding-top: 10px;">
                <button type="submit" id="patientcancel" class="pcancel">Cancel</button>
                <button type="submit" id="patientsave" class="padd">Submit</button>
            </div>
        </div>
        <!--Delete Appointment Dialog-->
        <div id="deleteWindow" style="display: none">
            <table width="100%" cellpadding="5">
                <tbody>
                    <tr style="padding: 10px;">
                        <td style="padding: 10px;">Appointment Id:</td>
                        <td colspan="2">
                            <input id="deleteId" type="text" name="Id" /></td>
                    </tr>
                </tbody>
            </table>
            <div style="height: 35px;">
                <button type="submit" onclick="cancel()" id="btncancel">Cancel</button>
                <button type="submit" onclick="done()" id="btnsubmit">Submit</button>
            </div>
        </div>
        <!--Delete Alert Dialog-->
        <div id="alertWindow" style="display: none">
            <span>Are you sure want to delete this appointment?</span>
            <div style="height: 35px; padding-top: 12px;">
                <button type="submit" class="alertcancel" id="alertcancel">Cancel</button>
                <button type="submit" class="alertdone" id="alertok">Ok</button>
            </div>
        </div>
        <!--Appointment Token Dialog-->
        <div id="tokenWindow" style="display: none">
            <div id="token">
                <table width="100%" cellpadding="5">
                    <tbody>
                        <tr>
                            <td id="apptoken" class="textlabel">Your Appointment Id:
                                <label id="lbltext"></label>
                            </td>
                            <td id="appstatus" class="textlabel" style="display: none;">Appointment Booked</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div style="padding-top: 10px;">
                <button type="submit" onclick="cancel()" id="btnok">Ok</button>
            </div>
        </div>
        <!-- Waitinglist Tooltip -->
        <div id='waitinglisttooltip' style="display: none;">
            <div style='padding: 2px;'><span class='temphead'>Doctor Name: </span><span id="docname" class='temp'></span></div>
            <div style='padding: 2px;'><span class='temphead'>StartTime: </span><span id="docstarttime" class='temp'></span></div>
            <div style='padding: 2px;'><span class='temphead'>EndTime: </span><span id="docendtime" class='temp'></span></div>
        </div>

        <!-- Resource Header Template -->
        <script id="resTemplate" type="text/x-jsrender">
        <div style="height:100%">
            {{if classname == 'e-childnode' && Text != "GENERAL" && Text != "DENTAL"}}
            {{:~resimages(Id)}}<div style="overflow:hidden;text-overflow:ellipsis;">{{:Name}}</div>
            {{else}}
            <div style="overflow:hidden;text-overflow:ellipsis;">{{:Name}}</div>
            {{/if}}
        </div>
        </script>
        <!-- Appointment Template -->
        <script id="appointtemplate" type="text/x-jsrender">
        <div style="height:100%;background:{{:~appbgm(Category)}}">
            <div style="width:20px;height:100%;float:left;text-align:center;font-weight:bolder;background-color:{{:~appcolor(Category)}};line-height:{{:~lineheight(StartTime, EndTime)}}">{{:AppTaskId}}</div>
            <div style='float:left; width:50px;'>{{:~appoint(OwnerId)}}</div>
            <div style="float:left; margin-left:5px;">
                <div id="appsubject">Patient Name: {{:Subject}}</div>
                <div id="apptime">{{:~apptime(StartTime, EndTime)}}</div>
            </div>
        </div>
        </script>
        <script id="doctortemplate" type="text/x-jsrender">
        <div style="width:100%;height:100%;background:{{:~appbgm(Category)}}">
            <div style="width:30px;height:100%;float:left;text-align:center;font-weight:bolder;background-color:{{:~appcolor(Category)}};line-height:30px">{{:AppTaskId}}</div>
            <div style="margin-left:5px;float:left;width:65%;height:100%;">
                <div id="appsubject">{{:Subject}} - {{:~doctor(Category)}}</div>
                <div id="apptime">{{:~apptime(StartTime, EndTime)}}</div>
            </div>
			<div class='icon-{{:Category}}' style='float:right;width:15%;height:100%;padding-top:7px;'></div>
        </div>
        </script>
        <!-- Appointment Tooltip -->
        <script id="tooltipTemp" type="text/x-jsrender">
		<div id="tooltip" style="width:250px;">
           <div style='float:left;width:80%;height:100%;padding-left:10px;padding-bottom:5px;'>
				<div style="padding:2px;"><span class="temphead">Reason: </span><span class="temp">{{:Description}}</span></div>
				<div style="padding:2px;"><span class="temphead">From: </span><span class="temp">{{:StartTime.toLocaleString()}}</span></div>
				<div style="padding:2px;"><span class="temphead">To: </span><span class="temp">{{:EndTime.toLocaleString()}}</span></div>
		   </div>
		   <div style='float:left;width:20%;height:100%;padding-top:5px;'>{{:~format(OwnerId,"image")}}</div>
		</div>
        </script>
        <script type="text/javascript">
            window.categorylist = ej.parseJSON(categorylist);
            window.doctorName = ej.parseJSON(doctors);
            window.departmentName = ej.parseJSON(departments);
            window.waitinglist = ej.parseJSON(waitinglist);
            window.patientlist = ej.parseJSON(patientlist);
            window.list = window.addlist = window.appedit = window.mediaQuery = window.drop = window.waitinglistedit = false;
            ej.Schedule.Locale["en-US"] = { Resources: "DOCTORS" };
        </script>
        <script src="../Scripts/Dashboard/appointmentplanner.js"></script>
    </form>
</body>
</html>
