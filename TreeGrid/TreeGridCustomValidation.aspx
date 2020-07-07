<%@ Page Title="TreeGrid-Column Validation-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates how to define editing validations for the column fields in the tree grid control." AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="TreeGridCustomValidation.aspx.cs" Inherits="WebSampleBrowser.TreeGrid.TreeGridCustomValidation" %>


<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">TreeGrid / Custom Validation</span>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="HeadSection">
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:TreeGrid runat="server" ID="TreeGridColumnValidation" ChildMapping="SubTasks" TreeColumnIndex="1" IsResponsive="true">
            <Columns>
                <ej:TreeGridColumn HeaderText="Task Id" Field="TaskID" Width="45" EditType="Numeric">
                    <ValidationRule>
                        <ej:KeyValue Key="required" Value=true />
                        <ej:KeyValue Key="CheckNegative" Value=true />
                    </ValidationRule>
                </ej:TreeGridColumn>
                <ej:TreeGridColumn HeaderText="Task Name" Field="TaskName" EditType="String">
                    <ValidationRule>
                        <ej:KeyValue Key="minlength" Value="5" />
                        <ej:KeyValue Key="required" Value=true />
                    </ValidationRule>
                </ej:TreeGridColumn>
                <ej:TreeGridColumn HeaderText="Start Date" Field="StartDate" EditType="Datepicker" >
                    <ValidationRule>
                        <ej:KeyValue Key="validateStartDate" Value="true" />
                        <ej:KeyValue Key="required" Value=true />
                    </ValidationRule>
                </ej:TreeGridColumn>
                <ej:TreeGridColumn HeaderText="End Date" Field="EndDate" EditType="Datepicker">
                      <ValidationRule>
                        <ej:KeyValue Key="validateEndDate" Value="true" />
                        <ej:KeyValue Key="required" Value=true />
                    </ValidationRule>
                </ej:TreeGridColumn>
                <ej:TreeGridColumn HeaderText="Progress" Field="Progress" EditType="Numeric">
                    <ValidationRule>
                        <ej:KeyValue Key="customCompare" Value="[-1,101]" />
                        <ej:KeyValue Key="required" Value=true />
                    </ValidationRule>
                </ej:TreeGridColumn>
            </Columns>
           <EditSettings AllowEditing="true" EditMode="CellEditing" />
            <ToolbarSettings ShowToolbar="true" ToolbarItems="add,edit,delete,update,cancel,expandAll,collapseAll">
            </ToolbarSettings>
            <SizeSettings Width="100%" Height="450px" />
        </ej:TreeGrid>
    </div>
    <script type="text/javascript">
	   var startdatevalue, enddatevalue;
        $.validator.addMethod("CheckNegative", function (value, element, params) {
            return value >= 0
        }, "Please enter valid number");

        $.validator.addMethod("customCompare", function (value, element, params) {
            return element.value > params[0] && element.value < params[1]
        }, "Progress value must be between 0 and 100");

        $.validator.addMethod("validateEndDate", function (value, element, params) {
            var obj = $("#<% = TreeGridColumnValidation.ClientID%>").ejTreeGrid("instance");
            enddatevalue = value;
            var startDate = obj.model.selectedItem.StartDate == "" ? startdatevalue : obj.model.selectedItem.StartDate;
            if (!ej.isNullOrUndefined(startDate) && new Date(value) >= new Date(startDate))
                return true;
            return false;
        }, "End date must be greater than start date");

        $.validator.addMethod("validateStartDate", function (value, element, params) {
            var obj = $("#<% = TreeGridColumnValidation.ClientID%>").ejTreeGrid("instance");
            startdatevalue = value;
            var endDate = obj.model.selectedItem.EndDate == "" ? enddatevalue : obj.model.selectedItem.EndDate;
            if (!ej.isNullOrUndefined(endDate) && new Date(value) <= new Date(endDate))
                return true;
            return false;
        }, "Start date must be lesser than end date");
</script>
</asp:Content>


