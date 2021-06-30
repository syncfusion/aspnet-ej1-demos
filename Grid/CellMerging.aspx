<%@ Page Title="Grid-Cell Merging-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This demo explains how to merge two or more cells of datagrid columns based on the required condition in Syncfusion ASP.NET Web Forms DataGrid control." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="CellMerging.aspx.cs" Inherits="WebSampleBrowser.Grid.CellMerging" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / CellMerging</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="EmployeeGrid" runat="server" AllowScrolling="true" AllowCellMerging="true" AllowTextWrap="true" EnableRowHover="false" AllowSelection ="false">
			<ClientSideEvents MergeCellInfo ="cellmerge" />
            <Columns>
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" IsPrimaryKey="True" TextAlign="Right" Width="80" />
				<ej:Column Field="EmployeeName" HeaderText="Employee Name" Width="90" />
                <ej:Column Field="Time900" HeaderText="9.00 AM" Width="60" />
                <ej:Column Field="Time930" HeaderText="9.30 AM" Width="60" />
                <ej:Column Field="Time1000" HeaderText="10.00 AM" Width="60" />
                <ej:Column Field="Time1030" HeaderText="10.30 AM" Width="60" />
                <ej:Column Field="Time1100" HeaderText="11.00 AM" Width="60" />
                <ej:Column Field="Time1130" HeaderText="11.30 AM" Width="60" />
                <ej:Column Field="Time1200" HeaderText="12.00 PM" Width="60" />
                <ej:Column Field="Time1230" HeaderText="12.30 PM" Width="60" />
                <ej:Column Field="Time100" HeaderText="1.00 PM" TextAlign="Center" Width="60" />
				<ej:Column Field="Time130" HeaderText="1.30 PM" Width="60" />
                <ej:Column Field="Time200" HeaderText="2.00 PM" Width="60" />
                <ej:Column Field="Time230" HeaderText="2.30 PM" Width="60" />
                <ej:Column Field="Time300" HeaderText="3.00 PM" Width="60" />
                <ej:Column Field="Time330" HeaderText="3.30 PM" Width="40" />
                <ej:Column Field="Time400" HeaderText="4.00 PM" Width="60" />
                <ej:Column Field="Time430" HeaderText="4.30 PM" Width="60" />
                <ej:Column Field="Time500" HeaderText="5.00 PM" Width="60" />
            </Columns>
            <ScrollSettings Height="300" Width="980" ></ScrollSettings>
        </ej:Grid>
    </div>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        $(function () {
            var gridObj = $("#<%= EmployeeGrid.ClientID %>").ejGrid("instance");
            scrolWidth = gridObj.model.scrollSettings.width / $(".cols-sample-area").width();
            if (gridObj.element.width() > $(".cols-sample-area").width()) {
                var scrollerwidth = Math.floor($(".cols-sample-area").width())
                gridObj.option("model.scrollSettings", { width: scrollerwidth })
                scrolWidth = 1;
            }

        });
        function cellmerge(args) {
			if (args.data.EmployeeID == 10001) {
				        if (args.column.field == "Time900")
				            args.colMerge(2);
				        else if (args.column.field == "Time1100")
				            args.colMerge(3);
				        else if(args.column.field == "Time100")
				            args.merge(3, 10);
				        else if (args.column.field == "Time230")
				            args.colMerge(2);
				        else if (args.column.field == "Time430")
				            args.merge(2,2);
				    }
				    else if (args.data.EmployeeID == 10002) {
				        if (args.column.field == "Time930")
				            args.colMerge(3);
				        else if (args.column.field == "Time1100")
				            args.colMerge(4);
				        else if (args.column.field == "Time230")
				            args.merge(2,5);
				        else if (args.column.field == "Time330")
				            args.colMerge(2);
				    }
				    else if (args.data.EmployeeID == 10003) {
				        if (args.column.field == "Time900")
				            args.merge(3,2);
				        else if (args.column.field == "Time1030")
				            args.colMerge(2);
				        else if (args.column.field == "Time1130")
				            args.colMerge(3);
				        else if (args.column.field == "Time330")
				            args.colMerge(2);
				        else if (args.column.field == "Time430")
				            args.colMerge(2);
				    }
				    else if (args.data.EmployeeID == 10004) {
				        if (args.column.field == "Time1100")
				            args.colMerge(4);
				        else if (args.column.field == "Time400")
				            args.colMerge(2);
				    }
				    else if (args.data.EmployeeID == 10005) {
				        if (args.column.field == "Time900")
				            args.colMerge(4);
				        else if (args.column.field == "Time1130")
				            args.colMerge(3);
				        else if (args.column.field == "Time330")
				            args.merge(2,2);
				        else if (args.column.field == "Time430")
				            args.colMerge(2);
				    }
				    else if (args.data.EmployeeID == 10006) {
				        if (args.column.field == "Time900")
				            args.colMerge(2);
				        else if (args.column.field == "Time1000")
				            args.colMerge(3);
				        else if (args.column.field == "Time1130")
				            args.colMerge(3);
				        else if (args.column.field == "Time430")
				            args.colMerge(2);
				    }
				    else if (args.data.EmployeeID == 10007) {
				        if (args.column.field == "Time900")
				            args.colMerge(2);
				        else if (args.column.field == "Time1030")
				            args.colMerge(2);
				        else if (args.column.field == "Time1130")
				            args.colMerge(3);
				        else if (args.column.field == "Time300")
				            args.colMerge(2);
				        else if (args.column.field == "Time400")
				            args.colMerge(3);
				    }
				    else if (args.data.EmployeeID == 10008) {
				        if (args.column.field == "Time900")
				            args.colMerge(3);
				        else if (args.column.field == "Time1030")
				            args.colMerge(3);
				        else if (args.column.field == "Time230")
				            args.merge(3,2);
				        else if (args.column.field == "Time400")
				            args.colMerge(2);
				    }
				    else if (args.data.EmployeeID == 10009) {
				        if (args.column.field == "Time900")
				            args.colMerge(3);
				        else if (args.column.field == "Time1130")
				            args.merge(3,2);
				        else if (args.column.field == "Time430")
				            args.colMerge(2);
				    }
				    else if (args.data.EmployeeID == 10010) {
				        if (args.column.field == "Time900")
				            args.colMerge(3);
				        else if (args.column.field == "Time1030")
				            args.colMerge(2);
				        else if (args.column.field == "Time230")
				            args.colMerge(3);
				        else if (args.column.field == "Time400")
				            args.colMerge(3);
				    }
		}
    </script>
</asp:Content>

