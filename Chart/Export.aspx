<%@ Page Title="Chart-Export and Print-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to export chart elements using Syncfusion ASP.NET Web Forms Chart control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Export.aspx.cs" Inherits="WebSampleBrowser.Chart.Export" %>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="SampleHeading">
    <span class="sampleName">Chart/ Export</span>
</asp:Content>
<asp:Content ID="ControlContent"  runat="server" ContentPlaceHolderID="ControlsSection">
	<div style="height:100%">
    <script type="text/javascript" src="../Scripts/ChartData.js"></script>
    <ej:Chart ClientIDMode="Static" OnServerExporting="ExportChart" ID="Chart1" runat="server" Height="600" IsResponsive="true" EnableCanvasRendering="True" 
         OnClientLoad="onChartLoad" OnClientAxesLabelRendering="label" OnClientPreRender="preRender">
        <PrimaryXAxis Visible="true" MajorGridLines-Visible="true" Title-Text="Manager" />
        <PrimaryYAxis AxisLine-Visible="false" Title-Text="Sales" />
        <Series>
            <ej:Series Tooltip-Visible="True" Name="Person" EnableAnimation="True" XName="Xvalue" YName="YValue1"></ej:Series>
        </Series>
        <Title Text="Sales Comparison"></Title>
        <Legend  Visible="false"></Legend>
    </ej:Chart>
	</div>
    <canvas id="canvas2" style="display:none"></canvas> 
<script>
    function preRender(sender){
        sender.model.border.opacity = 1;
        sender.model.chartArea.border.opacity = 1;
        if (sender.model.theme.indexOf("light") > -1 || sender.model.theme == "bootstrap" || sender.model.theme == "material" > -1) {
            sender.model.background = "white";
            sender.model.chartArea.background = "white";
        }
        else {
            sender.model.background = "black";
            sender.model.chartArea.background = "black"
        }
    }
    function label(sender) {
        if (sender.data.axis.orientation == "Vertical") {
            var label = sender.data.label.Text / 1000;
            sender.data.label.Text = "$" + label + "K";
        }
    }
</script>
</asp:Content>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
     <div class="row">
           <table>
                    <b>Chart properties</b>
                    <tr>
                        <td>Render as Canvas
                        <td />
                        <td><input type="checkbox" checked="checked" id="canvas" /></td>
                    </tr>

                </table>
                <br />
                <table>
                    <b>Exporting options</b>
                    <tr>
                        <td>File name</td>
                        <td><input type="text" id="filename" value="Chart" size="10"/></td>
                    </tr>
                    <tr>
                        <td>Mode</td>
                        <td>
                            <select id="mode">
                                <option label="Server side" value="server">Server side</option>
                                <option label="Client side" value="client">Client side</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Angle</td>
                        <td>
                            <select id="angle">
                                <option label="0" value="0">0</option>
                                <option label="90" value="90">90</option>
                                <option label="-90" value="-90">-90</option>
                                <option label="180" value="180">180</option>
                            </select>
                        </td>
                    <tr />
                    <tr>
                        <td>Orientation</td>
                        <td>
                            <select id="orientation1">
                                <option label="Portrait" value="portrait">Portrait</option>
                                <option label="Landscape" value="landscape">Landscape</option>
                            </select>
                        </td>
                    <tr />
                </table>
                <br />
                <b>Export chart as</b>
                <table>
                    <tr>
                        <td>
                            <a id="downloadpng"><img src="../Content/images/chart/export_active/png.png" class="active" id="png" /></a>
                        </td>
                        <td>
                            <a id="downloadjpg"><img src="../Content/images/chart/export_active/jpg.png" class="active" id="jpg" /></a>
                        </td>
                        <td>
                            <img src="../Content/images/chart/export_active/pdf.png" class="active" id="pdf1" onclick="download(this.id)" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img src="../Content/images/chart/export_active/docx.png" class="active" id="docx" onclick="download(this.id)" />
                        </td>
                        <td>
                            <img src="../Content/images/chart/export_active/xlsx.png" class="active" id="xlsx" onclick="download(this.id)" />
                        </td>
                        <td>
                            <a id="downloadsvg"><img src="../Content/images/chart/export_disabled/svg.png" class="disabled" id="svg"/></a>
                        </td>
                    </tr>
                </table>
				<br />
				<b>Print the chart</b>
				<table>
					<tr>
                        <td>
                            <img src="../Content/images/chart/print.png" class="active" id="printChart" onclick="chartPrint()" />
                        </td>
					</tr>
				</table>


            </div>
        </div>
    <script type="text/javascript">
        var clientPng = document.getElementById('downloadpng');
        if (clientPng.addEventListener)
            clientPng.addEventListener('click', downloadClient, false);
        else
            clientPng.attachEvent('onclick', downloadClient, false);

        clientPng = document.getElementById('downloadsvg');
        if (clientPng.addEventListener)
            clientPng.addEventListener('click', downloadClient, false);
        else
            clientPng.attachEvent('onclick', downloadClient, false);

        clientPng = document.getElementById('downloadjpg');
        if (clientPng.addEventListener)
            clientPng.addEventListener('click', downloadClient, false);
        else
            clientPng.attachEvent('onclick', downloadClient, false);


        $("#png, #svg, #pdf1, #jpg, #xlsx, #docx, #printChart").mouseover(function (e) {
            if ($("#" + e.target.id).hasClass("active"))
                $("#" + e.target.id).css("background-color", "lightgray").css("cursor", "pointer").css("border", "solid 1px black");
            else
                $(".active").css("background-color", "transparent").css("cursor", "default").css("border", "solid 1px transparent");
        }).mouseout(function (e) {
            $(".active").css("background-color", "transparent").css("cursor", "default").css("border", "solid 1px transparent");
        });

        $("#canvas, #mode").change(function () {
            var chart = $(".e-datavisualization-chart").ejChart("instance");
            var mode = $("#mode")[0].value;
            if ($("#canvas").is(":checked")) {
                chart.model.enableCanvasRendering = true;
                if (mode == "server") {
                    $("#svg").attr("src", "../Content/images/chart/export_disabled/svg.png").removeClass("active").addClass("disabled");
                    $("#png").attr("src", "../Content/images/chart/export_active/png.png").removeClass("disabled").addClass("active");
                    $("#pdf1").attr("src", "../Content/images/chart/export_active/pdf.png").removeClass("disabled").addClass("active");
                    $("#jpg").attr("src", "../Content/images/chart/export_active/jpg.png").removeClass("disabled").addClass("active");
                    $("#xlsx").attr("src", "../Content/images/chart/export_active/xlsx.png").removeClass("disabled").addClass("active");
                    $("#docx").attr("src", "../Content/images/chart/export_active/docx.png").removeClass("disabled").addClass("active");
                } else {
                    $("#svg").attr("src", "../Content/images/chart/export_disabled/svg.png").removeClass("active").addClass("disabled");
                    $("#pdf1").attr("src", "../Content/images/chart/export_disabled/pdf.png").removeClass("active").addClass("disabled");
                    $("#xlsx").attr("src", "../Content/images/chart/export_disabled/xlsx.png").removeClass("active").addClass("disabled");
                    $("#docx").attr("src", "../Content/images/chart/export_disabled/docx.png").removeClass("active").addClass("disabled");
                    $("#jpg").attr("src", "../Content/images/chart/export_active/jpg.png").removeClass("disabled").addClass("active");
                    $("#png").attr("src", "../Content/images/chart/export_active/png.png").removeClass("disabled").addClass("active");
                }
            }
            else {
                chart.model.enableCanvasRendering = false;
                if ($("#mode")[0].value == "server") {
                    $("#svg").attr("src", "../Content/images/chart/export_active/svg.png").removeClass("disabled").addClass("active");
                    $("#pdf1").attr("src", "../Content/images/chart/export_disabled/pdf.png").removeClass("active").addClass("disabled");
                    $("#xlsx").attr("src", "../Content/images/chart/export_active/xlsx.png").removeClass("disabled").addClass("active");
                    $("#docx").attr("src", "../Content/images/chart/export_disabled/docx.png").removeClass("active").addClass("disabled");
                    $("#jpg").attr("src", "../Content/images/chart/export_disabled/jpg.png").removeClass("active").addClass("disabled");
                    $("#png").attr("src", "../Content/images/chart/export_disabled/png.png").removeClass("active").addClass("disabled");
                }
                else {
                    $("#svg").attr("src", "../Content/images/chart/export_active/svg.png").removeClass("disabled").addClass("active");
                    $("#pdf1").attr("src", "../Content/images/chart/export_disabled/pdf.png").removeClass("active").addClass("disabled");
                    $("#xlsx").attr("src", "../Content/images/chart/export_disabled/xlsx.png").removeClass("active").addClass("disabled");
                    $("#docx").attr("src", "../Content/images/chart/export_disabled/docx.png").removeClass("active").addClass("disabled");
                    $("#jpg").attr("src", "../Content/images/chart/export_disabled/jpg.png").removeClass("active").addClass("disabled");
                    $("#png").attr("src", "../Content/images/chart/export_disabled/png.png").removeClass("active").addClass("disabled");
                }
            }
            chart.redraw();
        });

        function downloadClient() {         // to download chart in client side
            var type = this.id;
            type = (type).indexOf("download") >= 0 ? type.replace("download", "") : type;
            if ($('#mode')[0].value == "client") {
                var chart = $(".e-datavisualization-chart").ejChart("instance"),
                    exporting = chart.model.exportSettings, data, type;
                exporting.fileName = $("#filename").val();
                exporting.angle = $("#angle")[0].value;
                exporting.type = type;
                exporting.mode = $('#mode')[0].value;
                data = chart.export();
                if (window.navigator.msSaveOrOpenBlob) {     // for IE
                    var blob;
                    if (type == "png")
                        blob = data.msToBlob();
                    else if (type == "jpg")
                        blob = data.msToBlob(null, "image/jpeg");
                    else if (type == "svg") {
                        data = decodeURIComponent(data);
                        blob = new Blob([data], { type: "image/svg-xml" });
                    }
                    window.navigator.msSaveOrOpenBlob(blob, exporting.fileName + "." + type);
                }
                else {
                    this.download = exporting.fileName + "." + type;
                    if (type == "png")
                        this.href = data.toDataURL();
                    else if (type == "jpg")
                        this.href = data.toDataURL("image/jpeg");
                    else
                        this.href = "data:text/plain;charset=utf-8," + data;
                }
            } else
                download(type);
        }
        function download(args) {
            var id = args;
            if ($("#" + id).hasClass("active")) {
                var mode = $('#mode')[0].value,
                chart = $(".e-datavisualization-chart").ejChart("instance"),
                exporting = chart.model.exportSettings, data, type;
                exporting.fileName = $("#filename").val();
                exporting.orientation = $('#orientation1')[0].value;
                exporting.angle = $("#angle")[0].value;
                type = exporting.type = (id== "pdf1" ? "pdf" : id);
                exporting.mode = mode;

                if (mode == "server") 
                    chart.export();      // to call export - public method
            }
            return true;
        }
		function chartPrint()
		{
			var chart = $(".e-datavisualization-chart").ejChart("instance");
			chart.print("Chart1");
		}

        $("#sampleProperties").ejPropertiesPanel();
    </script>
    <style>
    td {
        padding-top: .5em;
        padding-bottom: .5em;
        padding-right: .5em;
    }

    .active, .disabled {
        width: 40px;
        height: 40px;
        border: solid 1px transparent;
    }
</style>
</asp:Content>

