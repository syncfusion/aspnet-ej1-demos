<%@ Page Title="Schedule-Localization-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example shows how to set different cultures in the ASP.NET Web Scheduler." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="localization.aspx.cs" Inherits="WebSampleBrowser.Schedule.localization" %>

<asp:Content ID="HeaderSection" ContentPlaceHolderID="HeadSection" runat="server">
    <script type="text/javascript" src="../Scripts/cultures/ej.culture.en-US.min.js"></script>
    <script type="text/javascript" src="../Scripts/cultures/ej.culture.fr-FR.min.js"></script>
    <script type="text/javascript" src="../Scripts/cultures/ej.culture.vi-VN.min.js"></script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Schedule / Localization</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
<ej:Schedule ClientIDMode="Static" runat="server" ID="Schedule1" DataSourceID="SqlData" Locale="en-US" Width="100%" Height="525px" CurrentDate="6/5/2017">
    <AppointmentSettings Id="Id" Subject="Subject" AllDay="AllDay" StartTime="StartTime" EndTime="EndTime" Description="Description" Recurrence="Recurrence" RecurrenceRule="RecurrenceRule"/>
</ej:Schedule>

    </div>
    <asp:SqlDataSource ID="SqlData" runat="server" ConnectionString="<%$ ConnectionStrings:ScheduleConnectionString %>"
            SelectCommand="SELECT * FROM [DefaultSchedule]"></asp:SqlDataSource>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        $(function () {
            ej.Schedule.Locale["fr-FR"] = {
                ReminderWindowTitle: "Fenêtre de rappel",
                CreateAppointmentTitle: "créer un rendez-",
                RecurrenceEditTitle: "Modifier répétition nomination",
                RecurrenceEditMessage: "Comment voulez-vous changer le cas dans la série?",
                RecurrenceEditOnly: "Seulement cette nomination",
                RecurrenceEditSeries: "La série entière",
                PreviousAppointment: "Nomination précédente",
                NextAppointment: "prochain rendez-vous",
                AppointmentSubject: "sujet",
                StartTime: "Heure de début",
                EndTime: "Heure de fin",
                AllDay: "toute la journée",
                Today: "aujourd'hui",
                Recurrence: "répétition",
                Done: "Terminé",
                Cancel: "annuler",
                Ok: "Ok",
                RepeatBy: "Répétez par",
                RepeatEvery: "répéter chaque",
                RepeatOn: "répéter l'opération sur",
                StartsOn: "démarre sur",
                Ends: "extrémités",
                Summary: "résumé",
                Daily: "quotidien",
                Weekly: "hebdomadaire",
                Monthly: "mensuel",
                Yearly: "annuel",
                Every: "tous",
                EveryWeekDay: "chaque jour de la semaine",
                Never: "jamais",
                After: "après",
                Occurrence: "apparition",
                On: "sur",
                Edit: "Modifier",
                RecurrenceDay: "Jour (s)",
                RecurrenceWeek: "Semaine (s)",
                RecurrenceMonth: "Mois (s)",
                RecurrenceYear: "Année (s)",
                The: "la",
                OfEvery: "de chaque",
                First: "première",
                Second: "deuxième",
                Third: "troisième",
                Fourth: "quatrième",
                Last: "dernier",
                WeekDay: "jour de la semaine",
                WeekEndDay: "Jour de week-end",
                Subject: "sujet",
                Categorize: "Catégories",
                DueIn: "En raison",
                DismissAll: "rejeter tout",
                Dismiss: "rejeter",
                OpenItem: "Ouvrir l'élément",
                Snooze: "répétition",
                Day: "jour",
                Week: "semaine",
                WorkWeek: "Semaine de travail",
                Month: "mois",
                AddEvent: "Ajouter événement",
                CustomView: "Vue personnalisée",
                Agenda: "ordre du jour",
                Detailed: "détaillé",
                EventBeginsin: "Nomination commence dans",
                Editevent: "Modifier nomination",
                Editseries: "Modifier série",
                Times: "fois",
                Until: "jusqu'à",
                Eventwas: "rendez-vous était",
                Hours: "hrs",
                Minutes: "minutes",
                Overdue: "en retard",
                Days: "jour (s)",
                Event: "sujet",
                Select: "sélectionner",
                Previous: "prev",
                Next: "suivant",
                Close: "proche",
                Delete: "effacer",
                Date: "date",
                Showin: "montrer en",
                Gotodate: "Aller à la date",
                Resources: "RESSOURCES",
                RecurrenceDeleteTitle: "Supprimer répétition rendez-",
                Location: "emplacement",
                Priority: "priorité",
                RecurrenceAlert: "alerte",
                WrongPattern: "Le modèle de récurrence est pas valable",
                CreateError: "La durée de la nomination doit être plus courte que la façon dont elle se produit fréquemment. Raccourcir la durée ou changer le modèle de récurrence dans la boîte de dialogue Récurrence de rendez.",
                DragResizeError: "Impossible de replanifier une occurrence du rendez-vous récurrent. si elle saute sur une occurrence ultérieure du même rendez-vous.",
                StartEndError: "L'heure de fin doit être supérieur à l'heure de début",
                MouseOverDeleteTitle: "supprimer un rendez-",
                DeleteConfirmation: "Êtes-vous sûr de vouloir supprimer ce rendez-vous?",
                Time: "Temps",
				StartTimeZone: "Commencez TimeZone",
				EndTimeZone: "TimeZone Fin",
				NoTitle: "Pas de titre",
                OverFlowAppCount : "plus rendez-vous (s)",
				AppointmentIndicator: "Cliquez pour plus de rendez-vous",
				EmptyResultText:"Pas de suggestions",
				BlockIntervalAlertTitle: "Alerte",
				BlockIntervalError: "L'intervalle de temps choisi a été bloqué et est indisponible pour la sélection.",
				RecurrenceDateValidation: "Certains mois ont moins de dates sélectionnées. Pour ces mois, l'occurrence tombera à la dernière date du mois",
				SeriesChangeAlert: "Les modifications apportées aux instances spécifiques de cette série seront annulées et ces rendez-vous seront identiques à la série"
            };

            ej.Schedule.Locale["vi-VN"] = {
                ReminderWindowTitle: "cửa sổ nhắc nhở",
                CreateAppointmentTitle: "tạo bổ nhiệm",
                RecurrenceEditTitle: "Chỉnh sửa bổ nhiệm lại",
                RecurrenceEditMessage: "Làm thế nào bạn muốn thay đổi các sự kiện trong chuỗi?",
                RecurrenceEditOnly: "Chỉ bổ nhiệm này",
                RecurrenceEditSeries: "toàn bộ loạt",
                PreviousAppointment: "Bổ nhiệm trước",
                NextAppointment: "Bổ nhiệm tiếp theo",
                AppointmentSubject: "Tiêu đề",
                StartTime: "Thời gian bắt đầu",
                EndTime: "Thời gian kết thúc",
                AllDay: "mọi ngày",
                Today: "hôm nay",
                Recurrence: "lặp lại",
                Done: "làm xong",
                Cancel: "hủy bỏ",
                Ok: "Được",
                RepeatBy: "lặp lại bởi",
                RepeatEvery: "lặp lại mỗi",
                RepeatOn: "lặp lại",
                StartsOn: "bắt đầu từ ngày",
                Ends: "đầu",
                Summary: "Tóm tắt",
                Daily: "hàng ngày",
                Weekly: "hàng tuần",
                Monthly: "hàng tháng",
                Yearly: "hàng năm",
                Every: "mỗi",
                EveryWeekDay: "mỗi ngày trong tuần",
                Never: "không bao giờ",
                After: "sau khi",
                Occurrence: "sự xuất hiện",
                On: "trên",
                Edit: "chỉnh sửa",
                RecurrenceDay: "Ngày (s)",
                RecurrenceWeek: "Tuần (s)",
                RecurrenceMonth: "Tháng (s)",
                RecurrenceYear: "Năm (s)",
                The: "các",
                OfEvery: "của mỗi",
                First: "đầu tiên",
                Second: "thứ hai",
                Third: "thứ ba",
                Fourth: "thứ tư",
                Last: "cuối cùng",
                WeekDay: "các ngày trong tuần",
                WeekEndDay: "Ngày cuối tuần",
                Subject: "Tiêu đề",
                Categorize: "Thể loại",
                DueIn: "Trong do",
                DismissAll: "Tất cả bỏ",
                Dismiss: "miễn nhiệm",
                OpenItem: "mở hàng",
                Snooze: "giấc ngu ngắn",
                Day: "ngày",
                Week: "tuần",
                WorkWeek: "Tuần làm việc",
                Month: "tháng",
                AddEvent: "Thêm sự kiện",
                CustomView: "tuỳ chỉnh view",
                Agenda: "chương trình nghị sự",
                Detailed: "chi tiết",
                EventBeginsin: "Bắt đầu hẹn trong",
                Editevent: "chỉnh sửa bổ nhiệm",
                Editseries: "chỉnh sửa hàng loạt",
                Times: "lần",
                Until: "đến",
                Eventwas: "được bổ nhiệm",
                Hours: "hrs",
                Minutes: "phút",
                Overdue: "quá hạn",
                Days: "ngày(s)",
                Event: "Chủ đề",
                Select: "chọn",
                Previous: "trước",
                Next: "tiếp theo",
                Close: "gần",
                Delete: "xóa",
                Date: "ngày",
                Showin: "Hiện tại",
                Gotodate: "Chuyển Đến ngày",
                Resources: "TÀI NGUYÊN",
                RecurrenceDeleteTitle: "Xóa cuộc hẹn lặp lại",
                Location: "vị trí",
                Priority: "quyền ưu tiên",
                RecurrenceAlert: "báo động",
                WrongPattern: "Các mô hình lặp lại chưa hợp lệ",
                CreateError: "Thời hạn bổ nhiệm phải ngắn hơn thường xuyên như thế nào nó xảy ra. Rút ngắn thời gian, hoặc thay đổi mô hình tái phát trong Appointment Recurrence hộp thoại.",
                DragResizeError: "Không thể sắp xếp lại một sự xuất hiện của các cuộc hẹn định kỳ. nếu nó bỏ qua một sự xuất hiện muộn của cuộc hẹn cùng.",
                StartEndError: "Kết thúc thời gian nên lớn hơn so với thời gian bắt đầu",
                MouseOverDeleteTitle: "xóa cuộc hẹn",
                DeleteConfirmation: "Bạn có chắc chắn muốn xóa hẹn này ?",
                Time: "thời gian",
				StartTimeZone: "bắt đầu múi giờ",
				EndTimeZone: "múi giờ cuối",
				NoTitle: "Không tiêu đề",
                OverFlowAppCount : "hơn cuộc hẹn",
				AppointmentIndicator: "Nhấn vào cho các cuộc hẹn hơn",
				EmptyResultText:"no hay sugerencias",
				BlockIntervalAlertTitle: "Cảnh báo",
				BlockIntervalError: "Khoảng thời gian đã chọn đã bị chặn và không khả dụng cho lựa chọn",
				RecurrenceDateValidation: "Một số tháng có ít hơn ngày được chọn. Trong những tháng này, sự xuất hiện sẽ rơi vào ngày cuối cùng của tháng",
				SeriesChangeAlert: "Những thay đổi được thực hiện cho các phiên bản cụ thể của loạt bài này sẽ bị hủy bỏ và các cuộc hẹn đó sẽ kết hợp lại loạt bài"
            };
            $("#sampleProperties").ejPropertiesPanel();
        });
        function onChange(args) {
            $("#Schedule1").ejSchedule({ locale: args.value });
        }
        </script>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                   Select Culture
                </div>
                <div class="col-md-3">
                   <ej:DropDownList ClientIDMode="Static" runat="server" ID="ddlLocale" Width="115px" SelectedItemIndex="1" ClientSideOnChange="onChange" ClientSideOnSelect="onChange">
                        <Items>
                            <ej:DropDownListItem  Text="fr-FR" Value="fr-FR"/>
                            <ej:DropDownListItem  Text="en-US" Value="en-US"/>
                            <ej:DropDownListItem  Text="vi-VN" Value="vi-VN"/>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

