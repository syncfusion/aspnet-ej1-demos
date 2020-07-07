
<%@ Page Title="PivotGrid-Localization-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample for Syncfusion Essential JS1 for ASP.NET pivot grid control demonstrates customizing the user interface based on the locale culture." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Localization.aspx.cs" Inherits="WebSampleBrowser.Localization" %>

<%@ Register Assembly="Syncfusion.EJ.Pivot" Namespace="Syncfusion.JavaScript.Web" TagPrefix="ej" %>

<%@ Register Assembly="Syncfusion.EJ.Pivot" Namespace="Syncfusion.JavaScript.Models" TagPrefix="ej" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ControlsSection">
   
    <ej:PivotGrid ID="PivotGrid1" EnableGroupingBar="true" runat="server" PivotTableFieldListID="PivotSchemaDesigner1" ClientIDMode="Static">
        <DataSource>
            <Rows>
                <ej:Field FieldName="Country" FieldCaption="Country"></ej:Field>
                <ej:Field FieldName="State" FieldCaption="State"></ej:Field>
            </Rows>
            <Columns>
                <ej:Field FieldName="Product" FieldCaption="Product"></ej:Field>
            </Columns>
            <Values>
                <ej:Field FieldName="Amount" FieldCaption="Amount"></ej:Field>
                <ej:Field FieldName="Quantity" FieldCaption="Quantity"></ej:Field>
            </Values>
            <Filters>
                <ej:Field FieldName="Date" FieldCaption="Date"></ej:Field>
            </Filters>
        </DataSource>
        <ClientSideEvents Load="onLoad"/>
    </ej:PivotGrid>
        <ej:PivotSchemaDesigner ID="PivotSchemaDesigner1"  runat="server" ClientIDMode="Static">   
        <OlapSettings ShowKPI="true" ShowNamedSets="true" />
    </ej:PivotSchemaDesigner>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="PropertySection">
                <div id="sampleProperties">
                <div class="prop-grid">
                    <div class="row">
                        <div class="col-md-3" style="width:100px"">
                            Data Source
                        </div>
                        <div class="col-md-3">
                            <table>
                                <tr>
                                    <td style="float:left; padding-right:15px">
                                        <input type="radio" name="datasource" id="rdbRelational" checked /><label for="rdbRelational" class="radioBtnLabel">Relational</label>
                                    </td>
                                    <td>
                                        <input type="radio" name="datasource" id="rdbOlap" /><label for="rdbOlap" class="radioBtnLabel">OLAP</label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 5px;">
                       <div class="col-md-3" style="width:100px"">
                            Mode
                        </div>
                        <div class="col-md-3">
                            <table>
                                <tr>
                                    <td style="float:left; padding-right:35px">
                                        <input type="radio" name="dataMode" id="rdbClient" checked /><label for="rdbClient" class="clslab">Client</label>
                                    </td>
                                    <td>
                                        <input type="radio" name="dataMode" id="rdbServer" /><label for="rdbServer" class="clslab">Server</label>
                                    </td>
                                </tr>
                            </table>
                         </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3" style="width:100px">
                            Select Type
                        </div>
                        <div class="col-md-3">
                        <div class="languageDropdown">
                            <select id="languageList">
                                <option value="en-US">en-US</option>
                                <option value="fr-FR">fr-FR</option>
                                <option value="es-ES">es-ES</option>
                            </select>
                        </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                        <button id="ApplyBtn">Apply</button>
                            </div>
                    </div>
                </div>
            </div>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
 <script type="text/javascript">
     var btnTarget, relationalRadioBtnObj, olapRadioBtnObj, rdbClient, rdbServer, languageListDropdown;
     $(function () {
         $("#rdbRelational,#rdbOlap, #rdbClient, #rdbServer").ejRadioButton();
         $("#languageList").ejDropDownList({
             width: "80px"
         });
         languageListDropdown = $('#languageList').data("ejDropDownList");
         languageListDropdown.selectItemByText(languageListDropdown.items[0].innerHTML);
         $("#sampleProperties").ejPropertiesPanel();

         $("#ApplyBtn").ejButton({
             roundedCorner: true,
             size: "small",
             type: ej.ButtonType.Button,
             click: "ApplyChanges"
         });
         relationalRadioBtnObj = $('#rdbRelational').data("ejRadioButton");
         olapRadioBtnObj = $('#rdbOlap').data("ejRadioButton"); rdbClient = $('#rdbClient').data("ejRadioButton"); rdbServer = $('#rdbServer').data("ejRadioButton");
     });

     function onLoad(args) {
         if (args.model.dataSource.data == null)
             args.model.dataSource.data = pivot_dataset;
     }

     function ApplyChanges(args) {
         var pivotGrid = $('.e-pivotgrid').data("ejPivotGrid"), pivotSchemaDesigner = $('.e-pivotschemadesigner').data("ejPivotSchemaDesigner"), languageID;
         languageID = languageListDropdown._currentText == "fr-FR" ? "1036" : languageListDropdown._currentText == "es-ES" ? "1034" : "1033"
         pivotSchemaDesigner._destroy();
         pivotGrid.locale(languageListDropdown._currentText);
         var Date, Country, State, Product, Amount, Quantity = "";
         //Locale for Relation DataSource
         if (languageListDropdown._currentText == "fr-FR") {
             Country = "Pays";
             State = "Etat";
             Product = "Produit";
             Amount = "Montant";
             Quantity = "Quantité";
             Date = "date";
         }
         else if (languageListDropdown._currentText == "es-ES") {
             Country = "País";
             State = "Estado";
             Product = "Producto";
             Amount = "Cantidad";
             Quantity = "Cantidad";
             Date = "Fecha";
         }
         else {
             Country = "Country";
             State = "State";
             Product = "Product";
             Amount = "Amount";
             Quantity = "Quantity";
             Date = "Date";
         }

         var pivotdataSource = {
             data: pivot_dataset, cube: "",
             rows: [{ fieldName: "Country", fieldCaption: Country }, { fieldName: "State", fieldCaption: State }],
             columns: [{ fieldName: "Product", fieldCaption: Product }],
             values: [{ fieldName: "Amount", fieldCaption: Amount }, { fieldName: "Quantity", fieldCaption: Quantity }],
             filters: []
         };
         var olapDataSource = {
             data: "//bi.syncfusion.com/olap/msmdpump.dll;Locale Identifier= " + languageID + ";",
             catalog: "Adventure Works DW 2008 SE",
             cube: "Adventure Works",
             rows: [{ fieldName: "[Date].[Fiscal]" }],
             columns: [{ fieldName: "[Customer].[Customer Geography]" }],
             values: [{ measures: [{ fieldName: "[Measures].[Internet Sales Amount]" }], axis: "columns" }],
             filters: []
         };

         $(".e-pivotgrid").remove();
         $("#PivotSchemaDesigner1").remove();
         var gridPanel = ej.buildTag("div#PivotGrid1", "", { "display": "block" })[0].outerHTML;
         var gridSchemaPanel = ej.buildTag("div#PivotSchemaDesigner1", "", { height: "650px","display": "block" })[0].outerHTML;
         $(gridPanel).appendTo(".cols-sample-area");
         $(gridSchemaPanel).appendTo(".cols-sample-area");

         if (rdbClient.model.checked) {
             $("#PivotGrid1").ejPivotGrid({
                 dataSource: relationalRadioBtnObj.model.checked ? pivotdataSource : olapRadioBtnObj.model.checked ? olapDataSource : pivotdataSource, pivotTableFieldListID: "PivotSchemaDesigner1",
                 enableGroupingBar: true, locale: languageListDropdown._currentText
             });
         }
         else {
             pivotGrid.model.dataSource = { data: null, cube: "" };
             pivotGrid.model.operationalMode = "servermode";
             $("#PivotGrid1").ejPivotGrid({
                 url: relationalRadioBtnObj.model.checked ? "../api/RelationalGrid" : "../api/OlapGrid", pivotTableFieldListID: "PivotSchemaDesigner1",
                 enableGroupingBar: true, customObject: { Language: languageListDropdown._currentText }, locale: languageListDropdown._currentText
             });
         }
         if (olapRadioBtnObj.model.checked && rdbClient.model.checked)
             $("#PivotSchemaDesigner1").ejPivotSchemaDesigner({ olap: { showKPI: false, showNamedSets: true }, locale: languageListDropdown._currentText });
         else
             $("#PivotSchemaDesigner1").ejPivotSchemaDesigner({ locale: languageListDropdown._currentText });
     }

     //Locale for PivotGrid
     ej.PivotGrid.Locale['fr-FR'] = {
         ToolTipRow: 'Rangée',
         ToolTipColumn: 'Colonne',
         ToolTipValue: 'Valeur',
         DragFieldHere: "champ de glisser ici",
         ColumnArea: "Déposez la colonne ici",
         RowArea: "Déposez ligne ici",
         ValueArea: "Les valeurs Drop ici",
         Measures: "Les mesures",
         NoValue: "Aucune valeur",
         Expand: "Développer",
         Collapse: "Effondrement",
         AddToFilter: "Ajouter au filtre",
         AddToRow: "Ajouter à la rangée",
         AddToColumn: "Ajouter à la colonne",
         AddToValues: "Ajouter à la valeur",
         CalculatedField: "Champ Calculé",
         NoRecordsToDisplay: "Aucun enregistrement à afficher.",
         MultipleItems: "Plusieurs éléments",
         All: "Tous les",
         Search: "Recherchez",
         GroupingBarAlertMsg: "Le champ que vous déplacez ne peut être placé dans cette zone du rapport"
     };
     ej.PivotGrid.Locale['es-ES'] = {
         ToolTipRow: 'Herramienta Sugerencia Fila',
         ToolTipColumn: 'Columna sobre herramientas',
         ToolTipValue: 'Herramienta Sugerencia Valor',
         DragFieldHere: "campo de arrastre aquí",
         ColumnArea: "Caída de la columna aquí",
         RowArea: "Caída de fila aquí",
         ValueArea: "valores de caída de aquí",
         Measures: "medidas",
         NoValue: "Aucune valeur",
         Expand: "Développer",
         Collapse: "Effondrement",
         AddToFilter: "Agregar al filtro",
         AddToRow: "Añadir a la fila",
         AddToColumn: "Añadir a la columna",
         AddToValues: "Añadir a los valores",
         CalculatedField: "Campo Calculado",
         NoRecordsToDisplay: "No hay registros que mostrar.",
         MultipleItems: "Varios elementos",
         All: "Todos",
         Search: "Buscar",
         GroupingBarAlertMsg: "Le champ que vous ne peut être déplacez placé dans cette zona du relación"
     };

     //Locale for PivotSchemadesigner
     ej.PivotSchemaDesigner.Locale["fr-FR"] = {
                    DoesNotBeginsWith: "N'a pas commence par",
                    DoesNotEndsWith: "Ne se termine par",
                    DoesNotContains: "Ne contient",
                    DoesNotEquals: "N'est pas égaux",
                    IsGreaterThan: "Est supérieure à",
                    IsGreaterThanOrEqualTo: "Est supérieure ou égale à",
                    IsLessThan: "Est inférieure à",
                    IsLessThanOrEqualTo: "Est inférieure ou égale à",
                    ClearSorting: "Tri clair",
                    ClearFilterFrom: "Effacer le filtre de",
                    SortAtoZ: "Trier de A à Z",
                    SortZtoA: "De Z à A Tri",
                    and: "<U> a </ u> e",

                    PivotTableFieldList: "Liste de champs de tableau croisé dynamique",
                    ChooseFieldsToAddToReport: "Choisissez les champs à ajouter à signaler:",
                    DragFieldBetweenAreasBelow: "champs de glisser entre les zones ci-dessous:",
                    ReportFilter: "filtre de rapport",
                    ColumnLabel: "colonne Étiquette",
                    RowLabel: "Label Row",
                    Values: "Valeurs",
                    DeferLayoutUpdate: "Différer la mise en page de mise à jour",
                    Update: "Mettre à jour",
                    ClearFilter: "Effacer le filtre",
                    SelectField: "sélectionnez Champ",
                    Measures: "Mesures",
                    Warning: "Avertissement",
                    AlertMsg: "Le champ que vous déplacez ne peut pas être placé dans cette zone du rapport",
                    Goal: "Goal",
                    Status: "Status",
                    Trend: "Trend",
                    AddToFilter: "Ajouter à filtrer",
                    AddToRow: "Ajouter à la rangée",
                    AddToColumn: "Ajouter à la colonne",
                    AddToValues: "Ajouter à la valeur",
                    OK: "OK",
                    Cancel: "Annuler",
                    Close: "Fermer",
                    Sort: "Trier",
                    LabelFilterLabel: "Afficher les éléments pour lesquels l'étiquette",
                    ValueFilterLabel: "Afficher les éléments pour lesquels",
                    LabelFilters: "Les filtres de l'étiquette",
                    BeginsWith: "Commence par",
                    NotBeginsWith: "Commence pas avec",
                    EndsWith: "Se termine par",
                    NotEndsWith: "Pas une fin avec",
                    Contains: "Contient",
                    NotContains: "Contient pas",
                    ValueFilters: "Les filtres de valeur",
                    ClearFilter: "Clear Filter",
                    Equals: "Est égal à",
                    NotEquals: "Pas égaux",
                    GreaterThan: "Plus de ",
                    GreaterThanOrEqualTo: "Supérieure ou égale à ",
                    LessThan: "Moins de ",
                    LessThanOrEqualTo: "Inférieure ou égale à ",
                    Between: "Entre",
                    NotBetween: "Pas entre",
                    Search: "Recherchez",
                    AddCurrentSelectionToFilter: "Ajouter la sélection actuelle au filtre",
                    NotAllItemsShowing: "Pas tous les noeuds enfants sont affichés",
                    EditorLinkPanelAlert: "Les membres a plus de 1 000 points à l'un ou plusieurs de ses parents. Seuls les 1 000 premiers éléments sont affichés sous chaque parent.",
                    NamedSetAlert: "Un ensemble nommé ne peut pas être ajouté au rapport PivotTable en même temps qu'un autre ensemble nommé basé sur le même domaine. Cliquez sur OK pour supprimer ' <Set 1> ' ensemble nommé et ajouter ' <Set 2> ' ensemble nommé."
     };

     ej.PivotSchemaDesigner.Locale["es-ES"] = {
                    DoesNotBeginsWith: "No comienza con",
                    DoesNotEndsWith: "No termina con",
                    DoesNotContains: "No contiene",
                    DoesNotEquals: "No es igual a",
                    IsGreaterThan: "Es mayor que",
                    IsGreaterThanOrEqualTo: "Es mayor que o igual a",
                    IsLessThan: "Es inferior a",
                    IsLessThanOrEqualTo: "Es menor o igual a",
                    ClearSorting: "Eliminar orden",
                    ClearFilterFrom: "Borrar filtro de",
                    SortAtoZ: "Ordenar de la A a la Z",
                    SortZtoA: "Ordenar de la Z a la A",
                    and: "y",
                    PivotTableFieldList: "Lista de campos de tabla dinámica",
                    ChooseFieldsToAddToReport: "Elija los campos para añadir a reportar:",
                    DragFieldBetweenAreasBelow: "Arrastre los campos entre las áreas a continuación:",
                    ReportFilter: "Filtro de informe",
                    ColumnLabel: "columna Etiqueta",
                    RowLabel: "fila Label",
                    Values: "Valores",
                    DeferLayoutUpdate: "Defer Disposición de actualización",
                    Update: "Actualizar",
                    Sort: "Ordenar",
                    SelectField: "Seleccione el campo",
                    LabelFilterLabel: "Mostrar los elementos para los que la etiqueta",
                    ValueFilterLabel: "Mostrar los elementos para los cuales",
                    LabelFilters: "Los filtros de etiqueta ",
                    BeginsWith: "Comienza con",
                    NotBeginsWith: "No comienza con",
                    EndsWith: "Termina con",
                    NotEndsWith: "No termina con",
                    Contains: "Contiene",
                    NotContains: "No contiene",
                    ValueFilters: "Filtros de valor",
                    ClearFilter: "Borrar filtro",
                    Equals: "Es igual a",
                    NotEquals: "No es igual a",
                    GreaterThan: "Mayor que",
                    GreaterThanOrEqualTo: "Mayor que o igual a ",
                    LessThan: "Menos de",
                    LessThanOrEqualTo: "Menor o igual a ",
                    Between: "Entre",
                    NotBetween: "No entre",
                    ClearFilter: "Borrar filtro",
                    SelectField: "Seleccione el campo",
                    Measures: "Medidas",
                    Warning: "Advertencia",
                    AlertMsg: "El campo que está moviendo no se puede colocar en esa área del informe",
                    Goal: "Objetivo",
                    Status: "El estado",
                    Trend: "Tendencia",
                    Value: "Valor",
                    AddToFilter: "Añadir al filtro",
                    AddToRow: "Agregar fila",
                    AddToColumn: "Agregar columna",
                    AddToValues: "Añadir al valor",
                    OK: "OK",
                    Cancel: "Cancelar",
                    Close: "Cerrar",
                    Search: "Buscar",
                    AddCurrentSelectionToFilter: "Añadir la selección actual al filtro",
                    NotAllItemsShowing: "No todos los nodos secundarios se muestran",
                    EditorLinkPanelAlert: "Los miembros tiene más de 1.000 elementos en virtud de uno o más padres. Sólo los primeros 1.000 elementos se muestran debajo de cada progenitor.",
                    NamedSetAlert: "Un conjunto con nombre no se puede agregar a un informe de tabla dinámica al mismo tiempo que otro conjunto con nombre se basa en el mismo campo. Haga clic en Aceptar para eliminar ' <Set 1> ' conjunto con nombre y agregar ' <Set 2> ' conjunto con nombre."
     };
     window.loadPivotGridFrameTheme = function () {
         window.setTimeout(function () {
             var pivotGridElement = $("#PivotGrid1").data("ejPivotGrid");
             if (pivotGridElement && pivotGridElement.model.enableGroupingBar && pivotGridElement.getJSONRecords() != null)
                 pivotGridElement.renderControlFromJSON();
         }, 2500);
     }
</script>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="StyleSection">
    <style type="text/css">
        .row .cols-sample-area  {
             overflow: auto !important;
             width: 100%
        }
        #PivotGrid1 {
            height: 350px; 
            width: 50%; 
            overflow: auto;
            float:left;
            margin:20px 0 0 20px;
        }
       .e-pivotschemadesigner {
            width: 40% !important;
            float:right;
        }
        .gridlayout {
            float: left;
            margin-left: -6px;
        }
         #drpdwn_input_wrapper
        {
            width: 60px;
        }
        .row .cols-prop-area
        {
            min-height: 150px;
            width: 40%;
            float:left;
        }
        .radioBtnLabel{
            margin-left:5px;
        }
		@media (min-width: 1920px) {.row .cols-prop-area { width: 24% !important; } }
    </style>
</asp:Content>

