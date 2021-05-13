<%@ Page Title="Sparkline-Real Time Usage-ASP.NET-SYNCFUSION"   Language="C#" AutoEventWireup="true" MetaDescription="This sample illustrates the countries based on taxes in the Syncfusion ASP.NET Web Forms Sparkline control" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Sparklinegrid.aspx.cs" Inherits="WebSampleBrowser.Sparkline.Sparklinegrid" %>
<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Sparkline / SparklineGrid</span>
</asp:Content>   
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ControlsSection">
        <ej:Grid ID="EmployeesGrid" runat="server" AllowPaging="False" AllowSelection="false" AllowScrolling="true"  EnableRowHover="false">
           <ScrollSettings Height="400" Width="800" />
             <Columns>
                <ej:Column Field="EmployeeID" HeaderText="ID" IsPrimaryKey="True" TextAlign="Right" Width="50" />
                <ej:Column Field="CustomerID" HeaderText="Customer ID" Width="90" />
                <ej:Column Field="OrderDate" HeaderText="Order Date" Width="90" />
                <ej:Column Field="ShipCountry" HeaderText="Ship Country" TextAlign="Right" Width="90" Format="{0:MM/dd/yyyy}" />
                <ej:Column HeaderText="Tax per annum" Template="True" TemplateID="#columnTemplate1" TextAlign="Left" Width="130" />
                <ej:Column HeaderText="One Day Index" Template="True" TemplateID="#columnTemplate3" TextAlign="Left" Width="130" />
                 <ej:Column HeaderText="Year GR" Template="True" TemplateID="#columnTemplate4" TextAlign="Left" Width="130" />
            </Columns>
            <ClientSideEvents Create="render" ActionComplete="render" Load="gridDataSource" />
        </ej:Grid>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
     <script type="text/x-jsrender" id="columnTemplate1">
                   <span id="spkline{{:EmployeeID}}"/>
                </script>				
				<script type="text/x-jsrender" id="columnTemplate3">
                   <span id="spkarea{{:EmployeeID}}"/>
                </script>
				<script type="text/x-jsrender" id="columnTemplate4">
                   <span id="spkwl{{:EmployeeID}}"/>
                </script>
				
<script type="text/javascript">
    $(window).on('load', function() {
        if (!!window.SVGSVGElement) {
            $("#LayoutSection_maincontrolarea").css('visibility', 'visible');
        }
        else
            $("#LayoutSection_maincontrolarea").css('visibility', 'hidden');
    })
    if (!!window.SVGSVGElement) {
        $("#LayoutSection_maincontrolarea").css('visibility', 'visible');
        function gridDataSource(args) {
            var employdata = window.gridData;
        args.model.dataSource = employdata;
    }
    function render(args) {
        for (var i = 0; i < 51; i++) {
            $("#spkline" + i).ejSparkline({ size: { height: 50, width: 150 } });
            $("#spkarea" + i).ejSparkline({ type: "column", size: { height: 50, width: 150 } });
            $("#spkwl" + i).ejSparkline({ dataSource: winloss(), type: "winloss", size: { height: 50, width: 150 } });
        }
        if (args.type == "create")
            this.getScrollObject().refresh();
    }
    function winloss() {
        var windata = [], r;
        for (var i = 1; i <= 12; i++) {
            r = Math.random();
            if (r <= 0.2)
                windata.push(-Math.random() * 10);
            else
                windata.push(Math.random() * 10);
        }
        return windata;
    }
    } else {
        $("#LayoutSection_maincontrolarea").css("visibility", "hidden");
        alert("Sparkline will not be supported in IE Version < 9");
    }
    </script>
</asp:Content>

