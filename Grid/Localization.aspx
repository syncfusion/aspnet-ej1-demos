<%@ Page Title="Grid-Localization-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This demo explains how to apply different cultures’ localization text to Syncfusion ASP.NET Web Forms DataGrid." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Localization.aspx.cs" Inherits="WebSampleBrowser.Grid.Localization" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="HeadSection">
    <script src="../Scripts/cultures/ej.culture.de-DE.min.js" type="text/javascript"></script>
    <script src="../Scripts/cultures/ej.culture.es-ES.min.js" type="text/javascript"></script>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Localization</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="OrdersGrid" runat="server" AllowGrouping="True" AllowPaging="True" Locale="de-DE">
            <GroupSettings EnableDropAreaAutoSizing="False"></GroupSettings>
            <Columns>
                <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="True" TextAlign="Right" Width="75" />
                <ej:Column Field="CustomerID" HeaderText="Customer ID" Width="90" />
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" TextAlign="Right" Width="80" />
                <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Width="75" Format="{0:C}" />
                <ej:Column Field="ShipCity" HeaderText="Ship City" Width="90" />
            </Columns>
        </ej:Grid>
    </div>
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
                $('#<%= OrdersGrid.ClientID %>').ejGrid("model.locale", "en-US");
            else if (args.itemId == 1)
                $('#<%= OrdersGrid.ClientID %>').ejGrid("model.locale", "de-DE");
            else
                $('#<%= OrdersGrid.ClientID %>').ejGrid("model.locale", "es-ES");
        }
        ej.Grid.Locale["es-ES"] = {
            EmptyRecord: "No hay registros que mostrar",
            GroupDropArea: "Arrastre un encabezado de columna aquí",
            DeleteOperationAlert: "No hay registros seleccionados para la operación de eliminación",
            EditOperationAlert: "No hay registros seleccionados para la operación de edición",
            SaveButton: "guardar",
            CancelButton: "cancelar",
            EditFormTitle: "Editar detalles de",
            GroupCaptionFormat: "{{:headerText}}: {{:key}} - {{:count}} artículos",
            UnGroup: "Haga clic aquí para desagrupar"
        };
        ej.Pager.Locale["es-ES"] = {
            pagerInfo: "{0} de {1} páginas ({2} artículos)",
            firstPageTooltip: "Ir a la primera página",
            lastPageTooltip: "Ir a la última página",
            nextPageTooltip: "Ir a la página siguiente",
            previousPageTooltip: "Ir a la página anterior",
            nextPagerTooltip: "Ir al siguiente Pager",
            previousPagerTooltip: "Ir a Pager anterior"
        };
        ej.Grid.Locale["de-DE"] = {
            EmptyRecord: "Keine Aufzeichnungen angezeigt",
            GroupDropArea: "Ziehen Sie eine Spaltenüberschrift hier",
            DeleteOperationAlert: "Keine Einträge für Löschvorgang ausgewählt",
            EditOperationAlert: "Keine Einträge für Bearbeiten Betrieb ausgewählt",
            SaveButton: "Speichern",
            CancelButton: "stornieren",
            EditFormTitle: "Korrektur von",
            GroupCaptionFormat: "{{:headerText}}: {{:key}} - {{:count}} Beiträge",
            UnGroup: "Klicken Sie hier, um die Gruppierung aufheben"
        };
        ej.Pager.Locale["de-DE"] = {
            pagerInfo: "{0} von {1} Seiten ({2} Beiträge)",
            firstPageTooltip: "Zur ersten Seite",
            lastPageTooltip: "Zur letzten Seite",
            nextPageTooltip: "Zur nächsten Seite",
            previousPageTooltip: "Zurück zur letzten Seite",
            nextPagerTooltip: "Zum nächsten Pager",
            previousPagerTooltip: "Zum vorherigen Pager"
        };
    </script>
</asp:Content>

