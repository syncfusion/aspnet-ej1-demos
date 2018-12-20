<%@ Page Title="PivotChart-Localization-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo for Syncfusion Essential JS1 for ASP.NET pivot chart control describes how to customize the user interface based on the locale culture"  MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Localization.aspx.cs" Inherits="WebSampleBrowser.Localization" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ControlsSection">
    <ej:PivotChart ID="PivotChart1" runat="server" IsResponsive="true" ClientIDMode="Static" Locale="en-US">
        <DataSource Catalog="Adventure Works DW 2008 SE" Cube="Adventure Works" Data="//bi.syncfusion.com/olap/msmdpump.dll;Locale Identifier=1033;">
                <Rows>
                    <ej:Field FieldName="[Date].[Fiscal]"></ej:Field>
                </Rows>
                <Columns>
                    <ej:Field FieldName="[Customer].[Customer Geography]"></ej:Field>
                </Columns>
                <Values>
                    <ej:Field Axis="Column">
                        <Measures>
                            <ej:MeasuresItems FieldName="[Measures].[Customer Count]" />
                        </Measures>
                    </ej:Field>
                </Values>
            </DataSource>
        <CommonSeriesOptions Type="Column"  EnableAnimation="True" Tooltip-Visible="true"/>
        <ClientSideEvents Load="loadTheme" />
        <Size Width="100%" Height="460px"></Size>
        <PrimaryXAxis>
            <Title Text="Date - Fiscal"></Title>
        </PrimaryXAxis>
        <PrimaryYAxis>
            <Title Text="Customer Count"></Title>
        </PrimaryYAxis>
		<Zooming EnableScrollbar="true" />
        <Legend RowCount="2"></Legend>
    </ej:PivotChart>
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
                                <input type="radio" name="datasource" id="rdbRelational" /><label for="rdbRelational" class="radioBtnLabel">Relational</label>
                            </td>
                            <td>
                                <input type="radio" name="datasource" id="rdbOlap" checked="checked"/><label for="rdbOlap" class="radioBtnLabel">OLAP</label>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3" style="width:80px; padding-top:3px; margin-top:0px">
                   Select Type
                </div>
                <div class="col-md-3" style="margin-top:0px">
                   <select id="drpdwn">
                      <option value="en-US">en-US</option>
                      <option value="fr-FR">fr-FR</option>
                      <option value="es-ES">es-ES</option>
                   </select>
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
        var btnTarget, relationalRadioBtnObj, olapRadioBtnObj, languageListDropdown;
        $(function () {
            $("#rdbRelational,#rdbOlap").ejRadioButton();
            $("#drpdwn").ejDropDownList({
                width: "80px"
            });
            languageListDropdown = $('#drpdwn').data("ejDropDownList");
            languageListDropdown.selectItemByText(languageListDropdown.items[0].innerHTML);
            $("#sampleProperties").ejPropertiesPanel();

            $("#ApplyBtn").ejButton({
                roundedCorner: true,
                size: "small",
                type: ej.ButtonType.Button,
                click: "ApplyChanges"
            });
            relationalRadioBtnObj = $('#rdbRelational').data("ejRadioButton");
            olapRadioBtnObj = $('#rdbOlap').data("ejRadioButton");
        });
        function ApplyChanges(args) {
            var chartTarget = $("#PivotChart1").data("ejPivotChart");

            var languageID = languageListDropdown._currentText == "fr-FR" ? "1036" : languageListDropdown._currentText == "es-ES" ? "1034" : "1033";
            var xAxisTitle, yAxisTitle;
            switch (languageListDropdown._currentText) {
                case "fr-FR":
                    xAxisTitle = relationalRadioBtnObj.model.checked ? "" : "Fecha - Fiscal";
                    yAxisTitle = relationalRadioBtnObj.model.checked ? "Montant" : "Nombre de clients";
                    break;
                case "es-ES":
                    xAxisTitle = relationalRadioBtnObj.model.checked ? "" : "Date - Fiscal";
                    yAxisTitle = relationalRadioBtnObj.model.checked ? "Cantidad" : "El número de clientes";
                    break;
                case "en-US":
                    xAxisTitle = relationalRadioBtnObj.model.checked ? "" : "Date - Fiscal";
                    yAxisTitle = relationalRadioBtnObj.model.checked ? "Amount" : "Customer Count";
                    break;
            }

            var olapDataSource = {
                data: "//bi.syncfusion.com/olap/msmdpump.dll;Locale Identifier= " + languageID + ";",
                catalog: "Adventure Works DW 2008 SE",
                cube: "Adventure Works",
                rows: [{ fieldName: "[Date].[Fiscal]" }],
                columns: [{ fieldName: "[Customer].[Customer Geography]" }],
                values: [{ measures: [{ fieldName: "[Measures].[Customer Count]" }], axis: "columns" }]

            };
            var pivotdataSource = {
                data: pivot_dataset, cube: "",
                rows: [{ fieldName: "Country", fieldCaption: "Country" }, { fieldName: "State", fieldCaption: "State" }, { fieldName: "Date", fieldCaption: "Date" }],
                columns: [{ fieldName: "Product", fieldCaption: "Product" }],
                values: [{ fieldName: "Amount", fieldCaption: "Amount" }],
                filters: []
            };

            $(".e-pivotchart").remove();
            var chartPanel = ej.buildTag("div#PivotChart1", "", { "float": "left" })[0].outerHTML;
            $(chartPanel).appendTo(".cols-sample-area");
            $("#PivotChart1").ejPivotChart({
                dataSource: relationalRadioBtnObj.model.checked ? pivotdataSource : olapDataSource, locale: languageListDropdown._currentText,
                isResponsive: true,zooming : { enableScrollbar : true},
                type: ej.PivotChart.ChartTypes.Column,
                commonSeriesOptions: {
                    enableAnimation: true,
                    type: ej.PivotChart.ChartTypes.Column, tooltip: { visible: true }
                },
                size: { height: "460px", width: "100%" },
                primaryXAxis: { title: { text: xAxisTitle }, labelRotation: 0 },
                primaryYAxis: { title: { text: yAxisTitle } },
                legend: { visible: true },
                load: "loadTheme"
            });
        }
        ej.PivotChart.Locale["fr-FR"] = {
            Measure: "Mesure",
            Row: "Rangée",
            Column: "Colonne",
            Value: "Valeur",
            Expand: "Développer",
            Collapse: "Effondrement",
            Exit: "Quitter"
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
    </script>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="StyleSection">
    <style type="text/css">
        #PivotChart1 {
            width: 100%;
            float: left;
            height: 450px;
        }

        .row .cols-prop-area {
            min-height: 150px;
            width: 40%;
            float: left;
        }

        .radioBtnLabel {
            margin-left: 5px;
        }

        .row .cols-sample-area {
            width: 100%;
        }
    </style>
</asp:Content>

