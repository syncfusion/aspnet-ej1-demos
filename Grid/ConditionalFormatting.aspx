<%@ Page Title="Grid-Conditional Formatting-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This demo explains how to apply styles to specific cells based on certain conditions in Syncfusion ASP.NET Web Forms DataGrid control." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="ConditionalFormatting.aspx.cs" Inherits="WebSampleBrowser.Grid.ConditionalFormatting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Conditional Formatting</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="OrdersGrid" runat="server" AllowSelection="False" AllowSorting="True" EnableRowHover="False">
            <ClientSideEvents QueryCellInfo="formatingCell" />
            <Columns>
                <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="true" TextAlign="Right" Width="75" />
                <ej:Column Field="Open" HeaderText="Open" Width="80" TextAlign="Right" />
                <ej:Column Field="High" HeaderText="High" TextAlign="Right" Width="75" />
                <ej:Column Field="Low" HeaderText="Low" TextAlign="Right" Width="75" />
                <ej:Column Field="Close" HeaderText="Change" Width="80" TextAlign="Right" />
                <ej:Column Field="WeekHigh" HeaderText="52W H" Width="110" TextAlign="Right" />
                <ej:Column Field="WeekLow" HeaderText="52W L" Width="110" TextAlign="Right" />
                <ej:Column Field="YearChange" HeaderText="365 Days % Chg" Width="120" TextAlign="Right" />
                <ej:Column Field="MonthChange" HeaderText="30 Days % Chg" Width="110" TextAlign="Right" />
            </Columns>
        </ej:Grid>
    </div>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        function formatingCell(args) {
            var a = 3;
            var value = args.text.replace(",", "");
            var $element = $(args.cell);
            switch (args.column.headerText) {
                case "52W H":
                    if (parseFloat(value) > 500 && parseFloat(value) < 1000)
                        $element.css("background-color", "#336c12").css("color", "white");
                    else if (parseFloat(value) > 1000 && parseFloat(value) < 2000)
                        $element.css("background-color", "#7b2b1d").css("color", "white");
                    else if (parseFloat(value) > 2000 && parseFloat(value) < 3000)
                        $element.css("background-color", "#205239").css("color", "white");
                    break;
                case "52W L":
                    if (parseFloat(value) > 500 && parseFloat(value) < 1000)
                        $element.css("background-color", "#745a17").css("color", "white");
                    else if (parseFloat(value) > 1000 && parseFloat(value) < 2000)
                        $element.css("background-color", "#09576b").css("color", "white");
                    else if (parseFloat(value) > 2000 && parseFloat(value) < 3000)
                        $element.css("background-color", "#397218").css("color", "white");
                    break;
                case "Change":
                    $element.css("color", "#E84649");
                    break;
                case "365 Days % Chg":
                case "30 Days % Chg":
                    if (parseFloat(value) < 0)
                        $element.css("color", "red").prepend("<img src='../Content/images/down.png' height='15px' width='13px' style='padding-left:10px; float:right;' ></img> ");
                    else
                        $element.css("color", "green").prepend("<img src='../Content/images/up.png' height='15px' width='13px' style='padding-left:10px; float:right;' ></img>");
                    break;
            }
        }
    </script>
</asp:Content>

