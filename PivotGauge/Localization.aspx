<%@ Page Title="PivotGauge-Localization-ASP.NET-SYNCFUSION"   Language="C#"  MetaDescription="This demo for Syncfusion Essential JS1 for ASP.NET pivot gauge control describes how to customize the user interface based on the locale culture setting." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Localization.aspx.cs" Inherits="WebSampleBrowser.Localization" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ControlsSection">
     <script src='<%= Page.ResolveClientUrl("~/Scripts/excanvas.min.js")%>' type="text/javascript"></script>
    <div class="gaugeControl">
        <ej:PivotGauge ID="PivotGauge1" runat="server" IsResponsive="true" EnableTooltip="true" BackgroundColor="transparent" Locale="en-US" ClientIDMode="Static">
            <DataSource Catalog="Adventure Works DW 2008 SE" Cube="Adventure Works" Data="//bi.syncfusion.com/olap/msmdpump.dll;Locale Identifier=1033;">
                <Rows>
                    <ej:Field  FieldName="[Date].[Fiscal]">
                    </ej:Field>
                </Rows>
                <Columns>
                    <ej:Field FieldName="[Customer].[Customer Geography]"></ej:Field>
                </Columns>
                <Values>
                    <ej:Field Axis="Column">
                        <Measures>
                            <ej:MeasuresItems FieldName="[Measures].[Internet Sales Amount]" />
                            <ej:MeasuresItems FieldName ="[Measures].[Internet Revenue Status]" />
                            <ej:MeasuresItems FieldName ="[Measures].[Internet Revenue Trend]" />
                            <ej:MeasuresItems FieldName ="[Measures].[Internet Revenue Goal]" />
                        </Measures>
                    </ej:Field>
                </Values>
        </DataSource>
            <ClientSideEvents DrawLabels="onLabelDraw" RenderSuccess="loadPivotGaugeTheme" BeforeServiceInvoke="onBeforeServiceCall" AfterServiceInvoke="onAfterServiceCall"  />
            <Scales>
                <ej:CircularScales ShowRanges="true" Radius="150" ShowScaleBar="true" Size="1" ShowIndicators="true" ShowLabels="true">
                    <Border Width="0.5" />
                    <PointerCollection>
                        <ej:Pointers ShowBackNeedle="true" BackNeedleLength="20" Length="125" Width="7">
                           
                        </ej:Pointers>
                        <ej:Pointers Type="Marker" MarkerType="Diamond" DistanceFromScale="5" Placement="Center" BackgroundColor="#29A4D9" Length="25" Width="15"></ej:Pointers>
                    </PointerCollection>
                    <TickCollection>
                        <ej:CircularTicks Type="Major" DistanceFromScale="2" Height="16" Width="1" Color="#8c8c8c" />
                        <ej:CircularTicks Type="Minor" Height="6" Width="1" DistanceFromScale="2" Color="#8c8c8c" />
                    </TickCollection>
                    <LabelCollection>
                        <ej:CircularLabels Color="#8c8c8c"></ej:CircularLabels>
                    </LabelCollection>
                    <RangeCollection>
                        <ej:CircularRanges DistanceFromScale="-5" BackgroundColor="#fc0606" >
                            <Border Color="#fc0606" />
                        </ej:CircularRanges>
                        <ej:CircularRanges DistanceFromScale="-5"></ej:CircularRanges>
                    </RangeCollection>
                    <CustomLabelCollection>
                        <ej:CircularCustomLabel Color="#666666">
                            <Position X="180" Y="290" />
                            <Font Size="10px" FontFamily="Segoe UI" FontStyle="Normal"></Font>
                        </ej:CircularCustomLabel>
                        <ej:CircularCustomLabel Color="#666666">
                            <Position X="180" Y="320" />
                            <Font Size="10px" FontFamily="Segoe UI" FontStyle="Normal"></Font>
                        </ej:CircularCustomLabel>
                        <ej:CircularCustomLabel Color="#666666">
                            <Position X="180" Y="150" />
                            <Font Size="12px" FontFamily="Segoe UI" FontStyle="Normal"></Font>
                        </ej:CircularCustomLabel>
                    </CustomLabelCollection>   
                </ej:CircularScales>
            </Scales>
            <LabelFormatSettings DecimalPlaces="2" />
        </ej:PivotGauge>
    </div>
</asp:Content>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3" style="width: 105px; padding-top:3px; margin-top:10px">
                    Select Type
                </div>
                <div class="col-md-3" style="margin-top:10px; margin-left:3px">
                    <select id="drpdwn">
                        <option value="en-US">en-US</option>
                        <option value="fr-FR">fr-FR</option>
                        <option value="es-ES">es-ES</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3" style="padding-top: 3px; margin-top: 12px; width: 105px;">
                    Number Format
                </div>
                <div class="col-md-3" style="margin-top: 12px; margin-left: 3px">
                    <input type="text" style="line-height: 20px!important" id="numberFormat" />
                    <div id="nFormat">
                        <ul>
                            <li>Default</li>
                            <li>Currency</li>
                            <li>Percentage</li>
                            <li>Fraction</li>
                            <li>Scientific</li>
                            <li>Text</li>
                            <li>Notation</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
       
        $(function () {
            ej.PivotGauge.Locale["fr-FR"] = {
                RevenueGoal: "Objectif de chiffre d'affaires",
                RevenueValue: "Valeur du chiffre d'affaires"
            }
            ej.PivotGauge.Locale["es-ES"] = {
                        RevenueGoal: "ingresos Meta",
                        RevenueValue: "Valor de Impuestos"
            }
            $("#sampleProperties").ejPropertiesPanel();

            $("#drpdwn").ejDropDownList({
                width: "120px"
            });
            $('#numberFormat').ejDropDownList({
                    width: "120px",
                    targetID: "nFormat",
                    selectedTextValue: "default",
                    change:"Language"
             });
            ddlTarget = $('#drpdwn').data("ejDropDownList");
            ddlNumTarget = $('#numberFormat').data("ejDropDownList");
            ddlTarget.selectItemByText(ddlTarget.items[0].innerHTML);
            ddlNumTarget.selectItemByText(ddlNumTarget.items[0].innerHTML);
            $("#drpdwn").ejDropDownList("option", "change", "Language");
        });
        function Language(args) {
         if (args.model.text) {
            $(".e-pivotgauge").remove();
            var clientpannel = ej.buildTag("div#PivotGauge1", "", { "height": " 350px", "width": "100%", "overflow": "auto"})[0].outerHTML;
            $(clientpannel).appendTo(".gaugeControl");
            var language = $(ddlTarget.getSelectedItem()).text(), nFormat = $(ddlNumTarget.getSelectedItem()).text().toLowerCase();
			var languageID = language == "fr-FR" ? "1036" : language == "es-ES" ? "1034" : "1033";
            $("#PivotGauge1").ejPivotGauge({
                dataSource: {
					data: "//bi.syncfusion.com/olap/msmdpump.dll;Locale Identifier= " + languageID + ";",
					catalog: "Adventure Works DW 2008 SE",
                    cube: "Adventure Works",
                    rows: [
						{
							fieldName: "[Date].[Fiscal]",
							filterItems: { filterType: "include", values: ["[Date].[Fiscal].[Fiscal Year].&amp;[2004]"] }
						},
                    ],
					columns: [
						{
							fieldName: "[Customer].[Customer Geography]"
						}
                    ],
					values: [
						{
							measures: [
								{
									fieldName: "[Measures].[Internet Sales Amount]"
								},
								{
									fieldName: "[Measures].[Internet Revenue Status]"
								},
								{
									fieldName: "[Measures].[Internet Revenue Trend]"
								},
								{
									fieldName: "[Measures].[Internet Revenue Goal]"
								},
                            ],
                            axis: ej.PivotGauge.AxisName.Columns
                        }
                    ]
                }, enableTooltip: true, customObject: { Language: language}, locale: language,
                backgroundColor: "transparent",
                labelFormatSettings: {
                    numberFormat: nFormat,
                    decimalPlaces: 2
                },
                scales: [{
                    showRanges: true,
                    radius: 150, showScaleBar: true, size: 1, border: {
                        width: 0.5
                    },
                    showIndicators: true, showLabels: true,
                    pointers: [{
                        showBackNeedle: true,
                        backNeedleLength: 20,
                        length: 120,
                        width: 7,
                    },
                    {
                        Type: "marker",
                        Type: "diamond",
                        distanceFromScale: 5,
                        placement: "center",
                        backgroundColor: "#29A4D9",
                        length: 25,
                        width: 15
                    }],
                    ticks: [{
                        type: "major",
                        distanceFromScale: 2,
                        height: 16,
                        width: 1, color: "#8c8c8c"
                    }, { type: "minor", height: 6, width: 1, distanceFromScale: 2, color: "#8c8c8c" }],
                    labels: [{
                        labelColor: "#8c8c8c",
                        distanceFromScale:10
                    }],
                    ranges: [{
                        distanceFromScale: -5,
                        backgroundColor: "#fc0606",
                        border: { color: "#fc0606" }
                    }, {
                        distanceFromScale: -5
                    }],
                    customLabels: [{
                        position: { x: 180, y: 290 },
                        font: { size: "10px", fontFamily: "Segoe UI", fontStyle: "Normal" }, color: "#666666"
                    }, {
                        position: { x: 180, y: 320 },
                        font: { size: "10px", fontFamily: "Segoe UI", fontStyle: "Normal" }, color: "#666666"
                    }, {
                        position: { x: 180, y: 150 },
                        font: { size: "12px", fontFamily: "Segoe UI", fontStyle: "Normal" }, color: "#666666"
                    }]
                }]
            });
            }
        }
    </script>
</asp:Content>


<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="StyleSection">
    <style type="text/css">
        #PivotGauge1 {
            height: 300px;
            width: 100%;
            float: left;
            overflow:auto;
        }

         .row .cols-prop-area {
            min-height: 107px;
            width:25%;
        }
        .row .cols-sample-area {
    width: 72%;
}
    </style>
</asp:Content>

