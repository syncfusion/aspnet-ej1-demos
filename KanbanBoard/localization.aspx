<%@ Page Title="KanbanBoard-Localization-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to change the localization text dynamically in the Syncfusion ASP.NET Web Forms Kanban component." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="localization.aspx.cs" Inherits="WebSampleBrowser.Kanban.localization" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="HeadSection">
    <script src="../Scripts/cultures/ej.culture.de-DE.min.js" type="text/javascript"></script>
    <script src="../Scripts/cultures/ej.culture.es-ES.min.js" type="text/javascript"></script>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">KanbanBoard / localization</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <ej:Kanban ID="KanbanBoard" runat="server" AllowSelection="false" Locale="de-DE" AllowTitle="true" KeyField="Status" EnableTotalCount="true">
        <Columns>
            <ej:KanbanColumn HeaderText="Backlog" Key="Open" />
            <ej:KanbanColumn HeaderText="In Progress" Key="InProgress">
                <Constraints Max="2" />
            </ej:KanbanColumn>
            <ej:KanbanColumn HeaderText="Done" Key="Close" />
        </Columns>
        <Fields Content="Summary" ImageUrl="ImgUrl" PrimaryKey="Id" SwimlaneKey="Assignee" />
    </ej:Kanban>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                    Selection Type
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ID="language" runat="server" SelectedItemIndex="1" ClientSideOnChange="onChange" Width="120px">
                        <Items>
                            <ej:DropDownListItem Text="English" Value="0" />
                            <ej:DropDownListItem Text="Deutsch" Value="1" />
                            <ej:DropDownListItem Text="Español" Value="2" />
                        </Items>
                    </ej:DropDownList>
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
        function onChange(args) {
            if (args.itemId == 0)
                $('#<%= KanbanBoard.ClientID %>').ejKanban("model.locale", "en-US");
            else if (args.itemId == 1)
                $('#<%= KanbanBoard.ClientID %>').ejKanban("model.locale", "de-DE");
            else
                $('#<%= KanbanBoard.ClientID %>').ejKanban("model.locale", "es-ES");
    }
    ej.Kanban.Locale["es-ES"] = {
        EmptyCard: "No hay tarjetas para mostrar",
        SaveButton: "guardar",
        CancelButton: "cancelar",
        EditFormTitle: "Detalles de ",
        AddFormTitle: "Añadir nueva tarjeta",
        SwimlaneCaptionFormat: "- {{:count}}{{if count == 1 }} artículo {{else}} artículos {{/if}}",
        QuickFilters: "Filtros rápidos:",
        FilterOfText: "De",
        Max: "Máx.",
        Min: "Min",
        ItemsCount: "Artículos Contar :"
    };
    ej.Kanban.Locale["de-DE"] = {
        EmptyCard: "Keine Karten angezeigt werden",
        SaveButton: "Speichern",
        CancelButton: "stornieren",
        EditFormTitle: "Details von ",
        AddFormTitle: "Neue Karte hinzufügen",
        SwimlaneCaptionFormat: "- {{:count}}{{if count == 1 }} Artikel {{else}} Artikel {{/if}}",
        FilterSettings: "Filter:",
        FilterOfText: "Von",
        Max: "Max.",
        Min: "Min.",
        ItemsCount: "Artikel Graf :"
    };
    </script>
</asp:Content>

