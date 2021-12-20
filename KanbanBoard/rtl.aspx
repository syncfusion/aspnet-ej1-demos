<%@ Page Title="KanbanBoard-RTL-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to display header and card contents from right to left in the Syncfusion ASP.NET Web Forms Kanban component." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="rtl.aspx.cs" Inherits="WebSampleBrowser.Kanban.rtl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">KanbanBoard / RTL</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <ej:Kanban ID="KanbanBoard" runat="server" Locale="ar-AE" EnableRTL="true" AllowTitle="true" KeyField="Status">
        <Columns>
            <ej:KanbanColumn HeaderText="تراكم الأعمال غير المنجزة" Key="Open" />
            <ej:KanbanColumn HeaderText="في تَقَدم" Key="InProgress">
                <Constraints Max="2" />
            </ej:KanbanColumn>
            <ej:KanbanColumn HeaderText="فعله" Key="Close" />
        </Columns>
        <Fields Content="Summary" ImageUrl="ImgUrl" PrimaryKey="Id" SwimlaneKey="Assignee" />
    </ej:Kanban>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        ej.Kanban.Locale["ar-AE"] = {
            EmptyCard: "لا بطاقات لعرض",
            SaveButton: "حفظ",
            CancelButton: "إلغاء",
            EditFormTitle: "تفاصيل ",
            AddFormTitle: "إضافة بطاقة جديدة",
            SwimlaneCaptionFormat: "- {{:count}}{{if count == 1 }} بند {{else}} العناصر {{/if}}",
            FilterSettings: "مرشحات:",
            FilterOfText: "من",
            Max: "ماكس",
            Min: "دقيقة"
        };
    </script>
</asp:Content>

