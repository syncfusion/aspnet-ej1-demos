<%@ Page Title="Schedule-Vertical View-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example shows how grouping resource calendars in default views works in the ASP.NET Web Scheduler." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="multipleresource.aspx.cs" Inherits="WebSampleBrowser.Schedule.multipleresource" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Schedule / Default</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Schedule ClientIDMode="Static" runat="server" ID="Schedule1" DataSourceID="SqlData" Width="100%" Height="525px" CurrentDate="6/5/2017">
            <Group Resources="Owners" />
            <Resources>
                <ej:Resources Field="OwnerId" Name="Owners" Title="Owner" AllowMultiple="true">
                    <ResourceSettings Color="color" Id="id" Text="text"></ResourceSettings>
                </ej:Resources>
            </Resources>
            <AppointmentSettings Id="Id" Subject="Subject" AllDay="AllDay" StartTime="StartTime" EndTime="EndTime" Description="Description" Recurrence="Recurrence" RecurrenceRule="RecurrenceRule" ResourceFields="OwnerId" />
        </ej:Schedule>

    </div>
    <asp:SqlDataSource ID="SqlData" runat="server" ConnectionString="<%$ ConnectionStrings:ScheduleConnectionString %>"
        SelectCommand="SELECT * FROM [MultipleResource]"></asp:SqlDataSource>
    </br>
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                    <label style="font-weight: 700">Add/Remove resources</label>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <ej:CheckBox runat="server" Checked="true" ID="nancy" ClientSideOnChange="onChange"></ej:CheckBox>
                    <span>Nancy</span>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <ej:CheckBox runat="server" Checked="true" ID="steven" ClientSideOnChange="onChange"></ej:CheckBox>
                    <span>Steven</span>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <ej:CheckBox runat="server" Checked="true" ID="michael" ClientSideOnChange="onChange"></ej:CheckBox>
                    <span>Michael</span>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        $(document).ready(function () { $("#sampleProperties").ejPropertiesPanel(); });
        function onChange(args) {
            var obj, resId, index;
            var schObj = $("#Schedule1").data("ejSchedule");
            switch (args.model.id) {
                case "LayoutSection_ControlsSection_nancy":
                    obj = { text: "Nancy", id: 1, groupId: 1, color: "#f8a398" };
                    resId = 1;
                    index = 0;
                    break;
                case "LayoutSection_ControlsSection_steven":
                    obj = { text: "Steven", id: 3, groupId: 2, color: "#56ca85" };
                    resId = 3;
                    index = 1;
                    break;
                case "LayoutSection_ControlsSection_michael":
                    obj = { text: "Michael", id: 5, groupId: 1, color: "#51a0ed" };
                    resId = 5;
                    index = 2;
                    break;
            }
            if (args.isChecked) {
                schObj.addResource(obj, "Owners", index);
            } else {
                schObj.removeResource(resId, "Owners");
            }
        }
    </script>

</asp:Content>
<asp:Content runat="server" ID="Style" ContentPlaceHolderID="StyleSection">
    <style>
        #ejLayoutSection_ControlsSection_nancy div > span.e-chk-act > span.e-icon.e-checkmark {
            background: #f8a398;
            color: white;
        }

        #ejLayoutSection_ControlsSection_steven div > span.e-chk-act > span.e-icon.e-checkmark {
            background: #56ca85;
            color: white;
        }

        #ejLayoutSection_ControlsSection_michael div > span.e-chk-act > span.e-icon.e-checkmark {
            background: #51a0ed;
            color: white;
        }

        .row .cols-prop-area {
            margin-left: 0px;
            width: 100%;
        }
    </style>
</asp:Content>

