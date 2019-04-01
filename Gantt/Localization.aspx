<%@ Page Title="Gantt-Localization-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates the localization support available for various cultures in the Syncfusion Gantt chart control." AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Localization.aspx.cs" Inherits="WebSampleBrowser.Gantt.Localization" %>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="HeadSection">
    <script src="../Scripts/cultures/ej.culture.vi-VN.min.js" type="text/javascript"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Gantt / Localization</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div style="overflow: visible">
        <div style="float: right; padding-bottom: 5px; padding-right: 1px;">
            <select name="selectIndex" id="optPositionChange">
                <option value="0">en-US</option>
                <option value="1">fr-FR</option>
                <option value="2">vi-VN</option>
            </select>
        </div>
        <ej:Gantt ClientIDMode="Static" ID="GanttControlLocalization" runat="server" AllowColumnResize="true"
            TaskIdMapping="Id" TaskNameMapping="Name" StartDateMapping="StartDate"
            DurationMapping="Duration" ProgressMapping="PercentDone" ChildMapping="Children"
            AllowGanttChartEditing="false" Locale="fr-FR" TreeColumnIndex="1"
            ScheduleStartDate="10/20/2017" ScheduleEndDate="11/10/2017" DateFormat="MM/dd/yyyy" IsResponsive="true" Load="load">
            <SizeSettings Height="450px" Width="100%" />
        </ej:Gantt>
    </div>
    <script type="text/javascript">
        $("#optPositionChange").ejDropDownList({ "change": "onChange", Value: "fr-FR", Text: "fr-FR", width: "120px", selectedItemIndex: 1 });
    </script>
</asp:Content>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        function load(args) {
            this.getColumns()[0].width = 60;
        }
        function onChange(args) {
            if (args.itemId == 0)
                $("#GanttControlLocalization").ejGantt("model.locale", "en-US");
            else if (args.itemId == 1)
                $("#GanttControlLocalization").ejGantt("model.locale", "fr-FR");
            else
                $("#GanttControlLocalization").ejGantt("model.locale", "vi-VN");
        }

        ej.Gantt.Locale["fr-FR"] = {
            //string to display with dataSource contains 0 objects
            emptyRecord: "Aucun enregistrement à afficher",

            //headerText to be displayed in gridtree
            columnHeaderTexts: {
                taskId: "Tâche Ia",
                taskName: "Tâche Tâche",
                startDate: "Démarrer Date",
                endDate: "Fin Date",
                resourceInfo: "Resources",
                duration: "Durée",
                status: "Progrès",
                predecessor: "Prédécesseur",
                baselineStartDate: "Baseline Démarrer Date",
                baselineEndDate: "Baseline Fin Date"
            },

            //String to display in tooltip duration Unit.
            durationUnitTexts: {
                minutes: "procès-verbal",
                hours: "heures",
                days: "journées",
            },

            //string to display in dialog 
            editDialogTexts: {
                addFormTitle: "Nouveau Tâche",
                editFormTitle: "Modifier Tâche",
                saveButton: "Sauver",
                cancelButton: "Annuler"
            }
        }

        ej.Gantt.Locale["vi-VN"] = {
            //string to display with dataSource contains 0 objects
            emptyRecord: "trống ghi",

            //headerText to be displayed in gridtree
            columnHeaderTexts: {
                taskId: "nhiệm vụ Ia",
                taskName: "Tâche các",
                startDate: "bắt đầu ngày",
                endDate: "cuối ngày",
                resourceInfo: "tài nguyên thông tin",
                duration: "thời gian",
                status: "tình trạng",
                predecessor: "người tiền nhiệm",
                baselineStartDate: "cơ sở bắt đầu ngày",
                baselineEndDate: "cơ sở cuối ngày"
            },

            //String to display in tooltip duration Unit.
            durationUnitTexts: {
                minutes: "từ phút",
                hours: "giờ",
                days: "ngày",
            },

            //string to display in dialog 
            editDialogTexts: {
                addFormTitle: "thêm  hình thức tiêu đề",
                editFormTitle: "chỉnh sửa  hình thức tiêu đề",
                saveButton: "tiết kiệm",
                cancelButton: "hủy bỏ"
            }
        };
        $("#sampleProperties").ejPropertiesPanel();
    </script>
</asp:Content>


