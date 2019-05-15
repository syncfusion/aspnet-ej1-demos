<%@ Page Title="Grid-RTL-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo explains how to render a datagrid in the right-to-left direction using Syncfusion ASP.NET Web Forms DataGrid control." AutoEventWireup="true" CodeBehind="RTL.aspx.cs" MasterPageFile="~/Samplebrowser.Master" Inherits="WebSampleBrowser.Grid.RTL" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadSection">
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
	<script src="../Scripts/messages_ar.js" type="text/javascript"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / RTL</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="OrdersGrid" runat="server" AllowGrouping="True" AllowFiltering="True" AllowSorting="True" AllowPaging="True"
            EnableRTL="True" Locale="ar-AE">
            <EditSettings AllowAdding="True" AllowDeleting="True" AllowEditing="True"></EditSettings>
            <ToolbarSettings ShowToolbar="True" ToolbarItems="add,edit,delete,update,cancel"></ToolbarSettings>
            <Columns>
                <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="True" TextAlign="Right" Width="75">
                    <ValidationRule>
                        <ej:KeyValue Key="required" Value="true" />
                    </ValidationRule>
                </ej:Column>
                <ej:Column Field="CustomerID" HeaderText="Customer ID" Width="80">
                    <ValidationRule>
                        <ej:KeyValue Key="required" Value="true" />
                        <ej:KeyValue Key="minlength" Value="3" />
                    </ValidationRule>
                </ej:Column>
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" TextAlign="Right" Width="75" />
                <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Width="75" Format="{0:C}" />
                <ej:Column Field="ShipCity" HeaderText="Ship City" Width="110" />
            </Columns>
        </ej:Grid>
    </div>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        ej.Grid.Locale["ar-AE"] = {
            EmptyRecord: "لا توجد سجلات للعرض",
            GroupDropArea: "اسحب رأس العمود هنا إلى مجموعة أعمدة لها",
            DeleteOperationAlert: "لا توجد سجلات اختيارها لعملية الحذف",
            EditOperationAlert: "لا توجد سجلات اختيارها لعملية تحرير",
            SaveButton: "حفظ",
            CancelButton: "إلغاء",
            EditFormTitle: "تفاصيل",
	    FilterbarTitle: "الصورة خلية شريط تصفية",
            GroupCaptionFormat: "سلع",
            Add: "إضافة",
            Edit: "تحرير",
            Update: "التحديث",
            Cancel: "إلغاء",
            Delete: "حذف",
            UnGroup: "انقر هنا لفك تجميع"
        };
        ej.Pager.Locale["ar-AE"] = {
            pagerInfo: "{0} من {1} صفحة ({2} سلعة)",
            firstPageTooltip: "انتقل إلى الصفحة الأولى",
            lastPageTooltip: "انتقل إلى الصفحة الأخيرة",
            nextPageTooltip: "انتقل إلى الصفحة التالية",
            previousPageTooltip: "انتقل إلى الصفحة السابقة",
            nextPagerTooltip: "الذهاب إلى بيجر المقبل",
            previousPagerTooltip: "الذهاب إلى بيجر السابقة"
        };
    </script>
</asp:Content>

