<%@ Page Title="TreeGrid-WebMethod Adaptor-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates web method adaptor based data binding to the Syncfusion tree grid control." AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="WebMethodAdaptor.aspx.cs" Inherits="WebSampleBrowser.TreeGrid.WebMethodAdaptor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">TreeGrid / Data Binding / WebMethod Adaptor</span>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="HeadSection">
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:TreeGrid runat="server" ID="TreeGridWebMethod" ClientIDMode="Static" TreeColumnIndex="1" IsResponsive="true" IdMapping="taskID" ParentIdMapping="parentID"
            EnableVirtualization="true">
            <DataManager URL="WebMethodAdaptor.aspx/DataSource" UpdateURL="WebMethodAdaptor.aspx/Update" InsertURL="WebMethodAdaptor.aspx/Insert" RemoveURL="WebMethodAdaptor.aspx/Delete" Adaptor="WebMethodAdaptor" />
            <Columns>
                <ej:TreeGridColumn HeaderText="Task Id" Field="taskID" EditType="Numeric" Width="45">
                    <ValidationRule>
                        <ej:KeyValue Key="required" Value="true" />
                    </ValidationRule>
                </ej:TreeGridColumn>
                <ej:TreeGridColumn HeaderText="Task Name" Field="taskName">
                    <ValidationRule>
                        <ej:KeyValue Key="required" Value="true" />
                    </ValidationRule>
                </ej:TreeGridColumn>
                <ej:TreeGridColumn HeaderText="Start Date" Field="startDate" EditType="Datepicker">
                    <ValidationRule>
                        <ej:KeyValue Key="required" Value="true" />
                    </ValidationRule>
                </ej:TreeGridColumn>
                <ej:TreeGridColumn HeaderText="End Date" Field="endDate" EditType="Datepicker">
                    <ValidationRule>
                        <ej:KeyValue Key="required" Value="true" />
                    </ValidationRule>
                </ej:TreeGridColumn>
                <ej:TreeGridColumn HeaderText="Duration" Field="duration" EditType="Numeric">
                    <ValidationRule>
                        <ej:KeyValue Key="required" Value="true" />
                    </ValidationRule>
                </ej:TreeGridColumn>
                <ej:TreeGridColumn HeaderText="Progress" Field="progress" EditType="Numeric">
                    <ValidationRule>
                        <ej:KeyValue Key="required" Value="true" />
                    </ValidationRule>
                </ej:TreeGridColumn>
            </Columns>
            <EditSettings AllowEditing="true" AllowAdding="true" AllowDeleting="true" EditMode="cellEditing" RowPosition="Top" ShowDeleteConfirmDialog="true" />
            <ToolbarSettings ShowToolbar="true" ToolbarItems="add,edit,delete,update,cancel,expandAll,collapseAll" />
            <SizeSettings Width="100%" Height="450px" />
        </ej:TreeGrid>
    </div>
</asp:Content>

