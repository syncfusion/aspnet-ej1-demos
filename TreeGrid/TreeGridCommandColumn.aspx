<%@ Page Title="TreeGrid-Command Column-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates customizable command buttons to perform actions over records in the Syncfusion tree grid control." AutoEventWireup="true" CodeBehind="TreeGridCommandColumn.aspx.cs" MasterPageFile="~/Samplebrowser.Master" Inherits="WebSampleBrowser.TreeGrid.TreeGridCommandColumn" %>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">

    <div>
        <ej:TreeGrid runat="server" ID="TreeGridControlCommand" ChildMapping="SubTasks" TreeColumnIndex="1" IsResponsive="true">
            <Columns>
                <ej:TreeGridColumn HeaderText="Task Id" Field="TaskID" Width="45" EditType="Numeric" />
                <ej:TreeGridColumn HeaderText="Task Name" Field="TaskName" EditType="String" />
                <ej:TreeGridColumn HeaderText="Start Date" Field="StartDate" EditType="Datepicker" />
                <ej:TreeGridColumn HeaderText="Duration" Field="Duration" EditType="Numeric" />
                <ej:TreeGridColumn HeaderText="Manage Records">
                    <Command>
                        <ej:TreeGridCommands Type="edit">
                            <ButtonOptions Text="Edit" Width="58" />
                        </ej:TreeGridCommands>
                        <ej:TreeGridCommands Type="delete">
                            <ButtonOptions Text="Delete" Width="58" />
                        </ej:TreeGridCommands>
                        <ej:TreeGridCommands Type="save">
                            <ButtonOptions Text="save" Width="58" />
                        </ej:TreeGridCommands>
                        <ej:TreeGridCommands Type="cancel">
                            <ButtonOptions Text="cancel" Width="58" />
                        </ej:TreeGridCommands>
                    </Command>
                </ej:TreeGridColumn>
            </Columns>
            <EditSettings AllowEditing="true" AllowDeleting="true" EditMode="RowEditing" />
            <SizeSettings Width="100%" Height="450px" />
        </ej:TreeGrid>
    </div>
</asp:Content>

