<%@ Page Title="PivotClient-Localization-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo for Syncfusion Essential JS1 for ASP.NET pivot client control demonstrates how to customize the user interface based on the locale culture."  MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Localization.aspx.cs" Inherits="WebSampleBrowser.Localization" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ControlsSection">
    <ej:PivotClient ID="PivotClient1" runat="server" OnServerExporting="PivotClient1_ServerExporting" ClientIDMode="Static"  Locale="en-US" Title="OLAP Browser">
        <DataSource Catalog="Adventure Works DW 2008 SE" Cube="Adventure Works" Data="//bi.syncfusion.com/olap/msmdpump.dll">
                <Rows>
                    <ej:Field FieldName="[Customer].[Customer Geography]"></ej:Field>
                </Rows>
                <Columns>
                    <ej:Field FieldName="[Date].[Fiscal]"></ej:Field>
                </Columns>
                <Values>
                    <ej:Field Axis="Column">
                        <Measures>
                            <ej:MeasuresItems FieldName="[Measures].[Internet Sales Amount]" />
                        </Measures>
                    </ej:Field>
                </Values>                
            </DataSource>        
        <ClientSideEvents ChartLoad="setChartProperties" BeforeServiceInvoke="onBeforeServiceInvoke" BeforeExport="Export" SaveReport="reportSettings" LoadReport="reportSettings" FetchReport="reportSettings" /> 
    </ej:PivotClient>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="PropertySection">
    <div class="cols-prop-area">
                <div>
                    <div class="heading">
                        <span>Properties</span>
                    </div>
                    <div class="prop-grid content" style="padding-top:8px">
                   <div class="row" style="margin-top:20px">
                            <div style="line-height:3;float:left;margin-left:10px;margin-right:10px">
                                Select Type
                            </div>
                            <div class="col-md-3 aligntop">
                                <select id="language">
                                    <option value="en-US">en-US</option>
                                    <option value="fr-FR">fr-FR</option>
                                    <option value="es-ES">es-ES</option>
                                </select>
                            </div>                    
                        </div>
                        <br /><br />
                       </div>   
                </div>
            </div>
</asp:Content>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        var clientTarget;
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
            $("#language").ejDropDownList({
                width:"100%"
            });
            ddlTarget = $('#language').data("ejDropDownList");
            ddlTarget.selectItemByText(ddlTarget.items[0].innerHTML);
            $("#language").ejDropDownList("option", "change", "Language");
            clientTarget = $("#PivotClient1").data("ejPivotClient");
        });
        function Language(args) {
            $(clientTarget.element).html("");
            clientTarget.model.locale = args.value;
            clientTarget.model.dataSource.data = "//bi.syncfusion.com/olap/msmdpump.dll; Locale Identifier=" + (args.value == "fr-FR" ? "1036" : args.value == "es-ES" ? "1034" : "1033");
            clientTarget.model.beforeExport = "Exporting";
            clientTarget._clientReportCollection = [];
            clientTarget._load();
        }
        function Export(args) {
            args.url = "pivotClientExport";
        }
        function Exporting(args) {
            args.url = "../api/OlapClient/ExportPivotClient";
        }
        function reportSettings(args) {
            if (args.fetchReportSetting)
                return args.fetchReportSetting.url = "../wcf/OlapClientService.svc";
            else if (args.loadReportSetting)
                return args.loadReportSetting.url = "../wcf/OlapClientService.svc";
            else
                return args.saveReportSetting.url = "../wcf/OlapClientService.svc";
        }
		window.loadPivotClientFrameTheme = function () {
            window.setTimeout(function () {
                var pivotClientElement = $("#PivotClient1").data("ejPivotClient");
                pivotClientElement._load();
            }, 500);
        }
        ej.PivotClient.Locale["fr-FR"] = {
					ClearSorting: "Tri clair",
                    ClearFilterFrom: "Effacer le filtre de",
                    SortAtoZ: "Trier de A à Z",
                    SortZtoA: "De Z à A Tri",
                    DoesNotBeginsWith: "N'a pas commence par",
                    DoesNotEndsWith: "Ne se termine par",
                    DoesNotContains: "Ne contient",
                    DoesNotEquals: "N'est pas égaux",
                    IsGreaterThan: "Est supérieure à",
                    IsGreaterThanOrEqualTo: "Est supérieure ou égale à",
                    IsLessThan: "Est inférieure à",
                    IsLessThanOrEqualTo: "Est inférieure ou égale à",
                    NoReports: "Pas de rapports trouvés dans DB",
                    Sort: "Tri",
                    SelectField: "sélectionnez Champ",
                    LabelFilterLabel: "Afficher les éléments pour lesquels l'étiquette",
                    ValueFilterLabel: "Afficher les éléments pour lesquels",
                    LabelFilters: "Filtres d'étiquetage",
                    BeginsWith: "Commence par",
                    NotBeginsWith: "Non Commence pa",
                    EndsWith: "se termine par",
                    NotEndsWith: "Non termine avec",
                    Contains: "Contient",
                    NotContains: "Ne contient pas",
                    ValueFilters: "Filtres de valeur",
                    ClearFilter: "Clear Filter",
                    Equals: "Equals",
                    NotEquals: "Not Equals",
                    GreaterThan: "Supérieur",
                    GreaterThanOrEqualTo: "supérieur ou égal à",
                    LessThan: "Less Than",
                    LessThanOrEqualTo: "Moins ou égal à",
                    Between: "Entre",
                    NotBetween: "Non Entre",
                    Top10: "Haut de page Count",
                    DeferUpdate: "Différer Update",
                    AddToColumn: "Ajouter à la colonne",
                    AddToRow: "Ajouter à la rangée",
                    AddToSlicer: "Ajouter à Slicer",
                    ReportList: "Liste des rapports",
                    Close: "Fermer",
                    DeferUpdate: "Reporter la mise à jour",
                    MDXQuery: "requêtes MDX",
                    Row: "Rangée",
                    Slicer: "Slicer",
                    CubeSelector: "Sélecteur cube",
                    ReportName: "Nom du rapport",
                    NewReport: "Nouveau rapport",
                    CubeDimensionBrowser: "Navigateur Cube Dimension",
                    AddReport: "Ajouter un rapport",
                    RemoveReport: "Retirer Rapport",
                    CannotRemoveSingleReport: "Impossible de supprimer le rapport unique",
                    AreYouSureToDeleteTheReport: "Êtes-vous sûr de vouloir supprimer le rapport",
                    RenameReport: "renommez Rapport",
                    ChartTypes: "Types de graphiques",
                    ToggleAxis: "Basculer Axis",
                    ExportToExcel: "Exporter vers Excel",
                    ExportToWord: "Exporter vers Word",
                    ExportToPdf: "Exporter au format PDF",
                    FullScreen: "Plein écran",
                    Grid: "la grille",
                    Chart: "Graphique",
                    OK: "D'accord",
                    Cancel: "Annuler",
                    MeasureEditor: "mesurer Editor",
                    MemberEditor: "Sous la direction de membres",
                    Measures: "Les mesures",
                    SortOrFilterColumn: "Trier / Filtre (colonne)",
                    SortOrFilterRow: "Trier / Filtre (Row)",
                    SortingAndFiltering: "Tri et le filtrage",
                    Sorting: "Tri",
                    Measure: "<U> M </ u> mesure",
                    Order: "Commande",
                    Filtering: "Filtration",
                    Condition: "C <u> o </ u> ndition",
                    PreserveHierarchy: "P <u> r </ u> ÉSERVE Hiérarchie",
                    Ascending: "<U> A </ u> croissant",
                    Descending: "D <u> e </ u> croissant",
                    Enable: "E <u> n </ u> mesure",
                    Disable: "D <u> i </ u> sable",
                    and: "<U> a </ u> e",
                    Line: "Ligne",
                    Spline: "spline",
                    Column: "Colonne",
                    Area: "Région",
                    SplineArea: "spline Area",
                    StepLine: "étape ligne",
                    StepArea: "étape Area",
                    Pie: "Tarte",
                    Bar: "Bar",
                    StackingArea: "Stacking Area",
                    StackingColumn: "Colonne d'empilage",
                    StackingBar: "Stacking Bar",
                    Pyramid: "Pyramide",
                    Funnel: "Entonnoir",
                    Doughnut: "Donut",
                    Scatter: "dispersion",
                    Bubble: "Bubble",
                    TreeMap: "Carte d'arbres",
                    Alert: "Alert",
                    MDXAlertMsg: "Veuillez ajouter une mesure, dimension ou de hiérarchie dans un axe approprié pour afficher la requête MDX.",
                    FilterSortRowAlertMsg: "On ne trouve pas dans la dimension de l'axe de rang. Veuillez ajouter la dimension élément de la ligne de tri axe/filtrage.",
                    FilterSortColumnAlertMsg: "On ne trouve pas dans la dimension de l'axe de la colonne. Veuillez ajouter la dimension de l'axe de l'élément dans la colonne de tri et de filtrage.",
                    FilterSortcolMeasureAlertMsg: "Veuillez ajouter à la mesure de l'axe de la colonne",
                    FilterSortrowMeasureAlertMsg: "Veuillez ajouter à la mesure de l'axe de rang",
                    FilterSortElementAlertMsg: "Élément non trouvé dans l'axe de la colonne. Veuillez ajouter un élément dans l'axe de la colonne pour trier/filtrage.",
                    FilterMeasureSelectionAlertMsg: "Veuillez sélectionner une mesure valide.",
                    FilterConditionAlertMsg: "Veuillez définir une condition valide.",
                    FilterStartValueAlertMsg: "Veuillez définir une valeur de départ.",
                    FilterEndValueAlertMsg: "Veuillez définir une valeur de fin.",
                    FilterInvalidAlertMsg: "Opération non valide !",
                    SelectRecordAlertMsg: "Veuillez sélectionner un enregistrement valide.",
                    RecordName: "Nom d'enregistrement",
                    RemoveRecord: "Effacer l'enregistrement",
                    RenameRecord: "L'enregistrement de nom",
                    Load: "Charger",
                    Remove: "Déposer",
                    Save: "Sauvegarder",
                    SaveAs: "Enregistrer sous",
                    SelectRecord: "Sélectionnez Enreg.",
                    SelectReport: "Sélectionnez Rapport",
                    DBReport: "La manipulation en DB Rapport",
                    Rename: "Renommer",
                    Remove: "Déposer",
                    SetRecordNameAlertMsg: "Veuillez définir nom d'enregistrement.",
                    SetReportNameAlertMsg: "Veuillez définir le nom du rapport.",
                    Search: "Recherchez",
                    MultipleItems: "Plusieurs éléments",
                    All: "Tous les",
                    CalculatedMember: "Membre calculé",
                    Caption: "Légende :",
                    Expression: "L'expression :",
                    MemberType: "Type de membre :",
                    FormatString: "Chaîne de format :",
                    MultipleMeasure: "Plus d'une mesure ne peut pas être tranché.",
                    DuplicateCalcMeasure: "Membre calculé avec le même nom existe déjà.",
                    EmptyField: "Nom de membres calculés ou expression ne peut pas être vide.",
                    EmptyFormat: "Chaîne de format pour membre calculé est vide.",
                    Warning: "Attention",
                    Confirm: "Membre calculé avec le même nom existe déjà. En raison de vouloir le remplacer ?",
                    KPIs: "KPI",
                    Collection: "Collection",
                    Report: "rapport",
                    AddCurrentSelectionToFilter: "Ajouter la sélection actuelle au filtre",
                    SaveMsg: "Rapport enregistré avec succès ! ! !",
                    RenameMsg: "Rapport renommé avec succès ! ! !",
                    RemoveMsg: "Rapport retiré avec succès ! ! !",
                    Success: "Succès",
                    KpiAlertMsg: "Le domaine vous êtes déménagement ne peut pas être placé dans ce domaine du rapport",
                    NotAllItemsShowing: "Pas tous les noeuds enfants sont affichés",
                    EditorLinkPanelAlert: "Les membres a plus de 1 000 points à l'un ou plusieurs de ses parents. Seuls les 1 000 premiers éléments sont affichés sous chaque parent.",
                    NamedSetAlert: "Un ensemble nommé ne peut pas être ajouté au rapport PivotTable en même temps qu'un autre ensemble nommé basé sur le même domaine. Cliquez sur OK pour supprimer ' <Set 1> ' ensemble nommé et ajouter ' <Set 2> ' ensemble nommé."
        }       
        ej.PivotGrid.Locale["fr-FR"] = {
            ToolTipRow: "Rangée",
            ToolTipColumn: "Colonne",
            ToolTipValue: "Valeur",
            NoValue: "Aucune valeur",
            Expand: "Développer",
            Collapse: "Effondrement",
        }
        ej.PivotChart.Locale["fr-FR"] = {
            Row: "Rangée",
            Column: "Colonne",
            Value: "Valeur",
            Expand: "Développer",
            Collapse: "Effondrement",
            Exit: "Quitter"
        }
        ej.PivotGrid.Locale["es-ES"] = {
            ToolTipRow: "Herramienta Sugerencia Fila",
            ToolTipColumn: "Columna sobre herramientas",
            ToolTipValue: "Herramienta Sugerencia Valor",
            NoValue: "Ningún valor",
            Expand: "expandir",
            Collapse: "colapso",
        };
		ej.PivotClient.Locale["es-ES"] = {
                    ClearSorting: "Eliminar orden",
                    ClearFilterFrom: "Borrar filtro de",
                    SortAtoZ: "Ordenar de la A a la Z",
                    SortZtoA: "Ordenar de la Z a la A",
                    DoesNotBeginsWith: "No comienza con",
                    DoesNotEndsWith: "No termina con",
                    DoesNotContains: "No contiene",
                    DoesNotEquals: "No es igual a",
                    IsGreaterThan: "Es mayor que",
                    IsGreaterThanOrEqualTo: "Es mayor que o igual a",
                    IsLessThan: "Es inferior a",
                    IsLessThanOrEqualTo: "Es menor o igual a",
                    NoReports: "No se encontraron informes en DB",
                    Sort: "Ordenar",
                    SelectField: "Seleccione el campo",
                    LabelFilterLabel: "Mostrar los elementos para los que la etiqueta",
                    ValueFilterLabel: "Mostrar los elementos para los cuales",
                    LabelFilters: "Los filtros de etiqueta  ",
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
                    GreaterThanOrEqualTo: "Mayor que o igual a",
                    LessThan: "Menos de ",
                    LessThanOrEqualTo: "Menor o igual a",
                    Between: "Entre",
                    NotBetween: "No entre",
                    Top10: "Recuento superior",
                    Close: "Cerrar",
                    AddToColumn: "Agregar columna",
                    AddToRow: "Agregar fila",
                    AddToSlicer: "Agregar a Slicer",
                    Value: "Valor",
                    EqualTo: "Igual a",
                    NotEquals: "No es igual a",
                    GreaterThan: "Mayor que",
                    GreaterThanOrEqualTo: "Mayor que o igual a",
                    LessThan: "Menorque",
                    LessThanOrEqualTo: "Menor o igual a",
                    Between: "Entre",
                    NotBetween: "No entre",
                    ReportList: "Lista de informes",
                    Alert: "Alerta",
                    MDXAlertMsg: "Por favor, agregue una medida, dimensión o jerarquía en un eje apropiado para ver la consulta MDX.",
                    FilterSortRowAlertMsg: "No se ha encontrado la dimensión en el eje de filas. Por favor agregar elemento de dimensión en el eje de filas para la ordenación y el filtrado.",
                    FilterSortColumnAlertMsg: "No se ha encontrado la dimensión en el eje de columnas. Por favor agregar elemento de dimensión en el eje de columna para ordenar y filtrar.",
                    FilterSortcolMeasureAlertMsg: "Agregue la medida en el eje de columna",
                    FilterSortrowMeasureAlertMsg: "Agregue medir al eje de filas",
                    FilterSortElementAlertMsg: "Elemento no encontrado en el eje de columna. Agregue un elemento en la columna para ordenar/filtrado de eje.",
                    FilterMeasureSelectionAlertMsg: "Por favor seleccione una medida válida.",
                    FilterConditionAlertMsg: "Por favor, establezca una condición válida.",
                    FilterStartValueAlertMsg: "Por favor, establezca un valor inicial.",
                    FilterEndValueAlertMsg: "Por favor, establezca un valor final.",
                    FilterInvalidAlertMsg: "Operación inválida !",
                    DeferUpdate: "Aplazar actualización",
                    MDXQuery: "MDX",
                    Row: "Fila",
                    Slicer: "máquina de cortar",
                    CubeSelector: "Selector de cubo",
                    ReportName: "Reportar nombre",
                    NewReport: "Nuevo reporte",
                    CubeDimensionBrowser: "Navegador dimensión de cubo",
                    AddReport: "Agregar informe",
                    RemoveReport: "Retire Informe",
                    CannotRemoveSingleReport: "No se puede eliminar solo informe",
                    AreYouSureToDeleteTheReport: "¿Está seguro que desea borrar el Informe",
                    RenameReport: "Cambiar el nombre de Informe",
                    ChartTypes: "Tipos de gráficos",
                    ToggleAxis: "Alternar Eje",
                    ExportToExcel: "Exportar a Excel",
                    ExportToWord: "Exportar a Word",
                    ExportToPdf: "Exportar a PDF",
                    FullScreen: "Pantalla completa",
                    Grid: "Cuadrícula",
                    Chart: "Gráfico",
                    OK: "DE ACUERDO",
                    Cancel: "Cancelar",
                    MeasureEditor: "medir Editor",
                    MemberEditor: "miembro Editor",
                    Measures: "medidas",
                    SortOrFilterColumn: "Ordenar / Filtro (Columna)",
                    SortOrFilterRow: "Ordenar / Filtro (fila)",
                    SortingAndFiltering: "Clasificación y filtrado",
                    Sorting: "Clasificación",
                    Measure: "<U> M </ u> medida",
                    Order: "Orden",
                    Filtering: "Filtración",
                    Condition: "C <u> o </ u> ndition",
                    PreserveHierarchy: "P <u> r </ u> eserva Jerarquía",
                    Ascending: "<U> A </ u> ascendente",
                    Descending: "D <u> e </ u> ascendente",
                    Enable: "E <u> n </ u> poder",
                    Disable: "D <u> i </ u> sable",
                    and: "y",
                    Line: "Línea",
                    Spline: "Ranura",
                    Column: "Columna",
                    Area: "Zona",
                    SplineArea: "Área spline",
                    StepLine: "Línea paso",
                    StepArea: "Zona de paso",
                    Pie: "Tarta",
                    Bar: "Bar",
                    StackingArea: "zona de apilamiento",
                    StackingColumn: "columna de apilado",
                    StackingBar: "Barra de apilamiento",
                    Pyramid: "Pirámide",
                    Funnel: "Embudo",
                    Doughnut: "rosquilla",
                    Scatter: "dispersión",
                    Bubble: "Bubble",
                    TreeMap: "TreeMap",
                    SelectRecordAlertMsg: "Seleccione un registro válido.",
                    RecordName: "Nombre de registro",
                    RemoveRecord: "Quitar registro",
                    RenameRecord: "Cambiar nombre de registro",
                    Load: "Cargar",
                    Remove: "Retirar",
                    Save: "Guardar",
                    SaveAs: "Guardarcomo",
                    SelectRecord: "Seleccionar registro",
                    SelectReport: "Seleccione Informe",
                    DBReport: "La manipulación del informe en DB",
                    Rename: "Renombrar",
                    Remove: "Retirar",
                    SetRecordNameAlertMsg: "Por favor, establezca el nombre del registro.",
                    SetReportNameAlertMsg: "Por favor, establezca el nombre del informe.",
                    Search: "Buscar",
                    MultipleItems: "Varios elementos",
                    All: "Todos",
                    CalculatedMember: "Miembro calculado",
                    Caption: "Título:",
                    Expression: "Expresión:",
                    MemberType: "Tipo de socio:",
                    FormatString: "Cadena de formato:",
                    MultipleMeasure: "Más que una medida no puede ser en rodajas.",
                    DuplicateCalcMeasure: "Miembro calculado con el mismo nombre ya existe.",
                    EmptyField: "Nombre del miembro calculado o expresión no puede estar vacío.",
                    EmptyFormat: "Cadena de formato para miembro calculado está vacía.",
                    Warning: "Advertencia",
                    Confirm: "Miembro calculado con el mismo nombre ya existe. Debido a que desea reemplazar ?",
                    KPIs: "KPI",
					Collection: "Colección",
					Report: "informe",
                    AddCurrentSelectionToFilter: "Añadir la selección actual al filtro",
                    SaveMsg: "Informe guardado correctamente!!!",
                    RenameMsg: "Se ha cambiado el nombre de informe!!!",
                    RemoveMsg: "Informe eliminado correctamente!!!",
                    Success: "Éxito",
                    KpiAlertMsg: "El campo que está moviendo no se puede colocar en esa área del informe",
                    NotAllItemsShowing: "No todos los nodos secundarios se muestran",
                    EditorLinkPanelAlert: "Los miembros tiene más de 1.000 elementos en virtud de uno o más padres. Sólo los primeros 1.000 elementos se muestran debajo de cada progenitor.",
                    NamedSetAlert: "Un conjunto con nombre no se puede agregar a un informe de tabla dinámica al mismo tiempo que otro conjunto con nombre se basa en el mismo campo. Haga clic en Aceptar para eliminar ' <Set 1> ' conjunto con nombre y agregar ' <Set 2> ' conjunto con nombre."
        };
        ej.PivotChart.Locale["es-ES"] = {
            Measure: "medida",
            Row: "hilera",
            Column: "columna",
            Value: "Valor",
            Expand: "expandir",
            Collapse: "colapso",
            Exit: "Salida"
        };
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
        function setChartProperties(args) {
            this.model.load = "loadTheme";
        }
        function onBeforeServiceInvoke(args) {
            this.model.customObject = { Language: "en-US" }
        }
    </script>
    <!--Tooltip labels can be localized here-->
    <script id="tooltipTemplate" type="application/jsrender"> 
        <div style="background:White; color:black; font-size:12px; font-weight:normal; border: 1px solid #4D4D4D; white-space: nowrap;border-radius: 2px; margin-right: 25px; min-width: 110px;padding-right: 5px; padding-left: 5px; padding-bottom: 2px ;width: auto; height: auto;">
            <div>Measure(s) : {{:~Measures(#data)}}</div><div>Row : {{:~Row(#data)}}</div><div>Column : {{:~Column(#data)}}</div><div>Value : {{:~Value(#data)}}</div>
        </div>
    </script>  
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="StyleSection">
 <style>
       .row .cols-prop-area {
            min-height: 120px;
            width: 270px;
            height:140px;
       }
        prop-grid content
        {
            overflow-y: hidden;
        }#language_input_wrapper {
                width: 100px;
                margin-left:10px;
            }
        .cols-sample-area
        {
            width:100% !important;
            padding: 8px !important;
            overflow:auto;
        }
        #PivotClient1 {
            min-height: 275px; 
            min-width: 525px;
            display:block;
        }
    </style>
</asp:Content>

