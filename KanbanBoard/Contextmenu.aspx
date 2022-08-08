<%@ Page Title="KanbanBoard-Context Menu-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to improve user interaction with the Syncfusion ASP.NET Web Forms Kanban component using a pop-up menu when a card is clicked." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Contextmenu.aspx.cs" Inherits="WebSampleBrowser.Kanban.Contextmenu" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="HeadSection">
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">KanbanBoard / Contextmenu</span>
</asp:Content>
<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <ej:Kanban ID="KanbanBoard" runat="server" AllowSelection="false" AllowScrolling="true" AllowTitle="true" KeyField="Status">
        <ScrollSettings Width="900" Height="500" />
        <Columns>
            <ej:KanbanColumn HeaderText="Backlog" Key="Open" />
            <ej:KanbanColumn HeaderText="In Progress" Key="InProgress" />
            <ej:KanbanColumn HeaderText="Testing" Key="Testing" />
            <ej:KanbanColumn HeaderText="Done" Key="Close" />
        </Columns>
        <Fields Content="Summary" ImageUrl="ImgUrl" PrimaryKey="Id" Priority="RankId" Tag="Tags" Color="Type" SwimlaneKey="Assignee" />    
        <EditSettings AllowAdding="true" AllowEditing="true" EditMode="Dialog">            
            <EditItems>
                <ej:KanbanEditItem EditType="String" Field="Id">
                    <ValidationRules>
                        <ej:KeyValue Key="required" Value="true" />
                    </ValidationRules>
                </ej:KanbanEditItem>
                <ej:KanbanEditItem EditType="Dropdown" Field="Status"></ej:KanbanEditItem>
                <ej:KanbanEditItem EditType="Dropdown" Field="Assignee"></ej:KanbanEditItem>
                <ej:KanbanEditItem EditType="Numeric" Field="Estimate">
                    <NumericEditOptions DecimalPlaces="2" />
                    <ValidationRules>
                        <ej:KeyValue Key="range" Value="[0, 1000]" />
                    </ValidationRules>
                </ej:KanbanEditItem>
                <ej:KanbanEditItem EditType="TextArea" Field="Summary">
                    <ValidationRules>
                        <ej:KeyValue Key="required" Value="true" />
                    </ValidationRules>
                </ej:KanbanEditItem>
            </EditItems>
        </EditSettings>
        <ContextMenuSettings Enable="true" />
        <CardSettings>
            <ColorMappings>
                <ej:KeyValue Key="#cb2027" Value="Bug,Story" />
                <ej:KeyValue Key="#67ab47" Value="Improvement" />
                <ej:KeyValue Key="#fbae19" Value="Epic" />
                <ej:KeyValue Key="#6a5da8" Value="UG" />
            </ColorMappings>
        </CardSettings>
    </ej:Kanban>
</asp:Content>


