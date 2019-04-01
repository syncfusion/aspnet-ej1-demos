<%@ Page Title="KanbanBoard-Show or Hide Column-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to show or hide the column behavior in the Syncfusion ASP.NET Web Forms Kanban component." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="ShoworHideColumn.aspx.cs" Inherits="WebSampleBrowser.Kanban.ShoworHideColumn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">KanbanBoard / ShoworHideColumn</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <ej:Kanban ID="KanbanBoard" runat="server" AllowSelection="false" AllowTitle="true" KeyField="Status">
        <Columns>
            <ej:KanbanColumn HeaderText="Backlog" Key="Open" />
            <ej:KanbanColumn HeaderText="In Progress" Key="InProgress" />
            <ej:KanbanColumn HeaderText="Testing" Key="Testing" />
            <ej:KanbanColumn HeaderText="Done" Key="Close" />
        </Columns>
        <Fields Content="Summary" ImageUrl="ImgUrl" PrimaryKey="Id" />
    </ej:Kanban>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-kanban">
            <div class="row">
                <div class="col-md-3">
                    Column
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ID="columnName" runat="server" SelectedItemIndex="0" Width="110px">
                        <Items>
                            <ej:DropDownListItem Text="Backlog" Value="0" />
                            <ej:DropDownListItem Text="In Progress" Value="1" />
                            <ej:DropDownListItem Text="Testing" Value="2" />
                            <ej:DropDownListItem Text="Done" Value="3" />
                        </Items>
                    </ej:DropDownList>
                </div>
                <div class="col-md-3">
                    <ej:Button ID="btnHide" runat="server" Type="Button" Size="Small" Text="Hide" ClientSideOnClick="showhide">
                    </ej:Button>
                </div>
                <div class="col-md-3">
                    <ej:Button ID="btnShow" runat="server" Type="Button" Size="Small" Text="Show" ClientSideOnClick="showhide">
                    </ej:Button>
                </div>
            </div>
            <div class="row" style="margin-top: 5px">
                <div class="col-md-3">
                    Hidden Columns
                </div>
                <div class="col-md-3">
                    <textarea id="hideColumns" class="ejinputtext" style="width: 104px; height: 40px" readonly="readonly"></textarea>
                </div>
                <div class="col-md-3">
                </div>
                <div class="col-md-3">
                </div>
                <div class="col-md-3">
                </div>
                <div class="col-md-3">
                </div>
                <div class="col-md-3">
                </div>
                <div class="col-md-3">
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
        });
        function showhide(args) {
            var kanbanObj = $('#<%= KanbanBoard.ClientID %>').data("ejKanban");
            var dropDownObj = $('#<%= columnName.ClientID %>').data("ejDropDownList");
            var selectedItem = dropDownObj.getValue();
            if (this.element[0].id.indexOf("btnHide") != -1) {
                if (kanbanObj.getVisibleColumnNames().length > 1) {
                    kanbanObj.hideColumns(selectedItem);
                    $("#hideColumns").val().indexOf(selectedItem) == -1 && $("#hideColumns").val($("#hideColumns").val() + (selectedItem + "\n"));
                }
                else {
                    alert("Atleast one column must be displayed in kanban");
                }
            }
            else {
                $("#hideColumns").val($("#hideColumns").val().replace(selectedItem + "\n", ""));
                kanbanObj.showColumns(selectedItem);
            }
        }
    </script>
</asp:Content>

