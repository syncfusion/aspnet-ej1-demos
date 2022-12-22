<%@ Page Title="Grid-Column Formatting-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo explains how to display the content of datagrid columns based on the specified format in Syncfusion ASP.NET Web Forms DataGrid control." AutoEventWireup="true" CodeBehind="ColumnFormatting.aspx.cs" MasterPageFile="~/Samplebrowser.Master" Inherits="WebSampleBrowser.Grid.ColumnFormatting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Columns / Column Formatting</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <style>
        table {
            width: 100%;
        }
    </style>
    <div>
        <table>
            <tr>
                <td style="width: 33.3%">
                    <ej:DropDownList ID="Number" runat="server" SelectedItemIndex="0" ClientSideOnChange="onChange"
                        ClientSideOnCreate="onComplete">
                        <Items>
                            <ej:DropDownListItem Text="Rounding - n2" Value="0" />
                            <ej:DropDownListItem Text="Rounding - n3" Value="1" />
                            <ej:DropDownListItem Text="Rounding - n5" Value="2" />
                        </Items>
                    </ej:DropDownList>
                </td>
                <td style="width: 33.3%">
                    <ej:DropDownList ID="Currency" runat="server" SelectedItemIndex="0" ClientSideOnChange="onChange"
                        ClientSideOnCreate="onComplete">
                        <Items>
                            <ej:DropDownListItem Text="Rounding - c2" Value="0" />
                            <ej:DropDownListItem Text="Rounding - c3" Value="1" />
                            <ej:DropDownListItem Text="Rounding - c5" Value="2" />
                        </Items>
                    </ej:DropDownList>
                </td>
                <td style="width: 33.3%">
                    <ej:DropDownList ID="Date" runat="server" SelectedItemIndex="0" ClientSideOnChange="onChange"
                        ClientSideOnCreate="onComplete">
                        <Items>
                            <ej:DropDownListItem Text="MM/dd/yyyy" Value="0" />
                            <ej:DropDownListItem Text="dd/MM/yyyy" Value="1" />
                            <ej:DropDownListItem Text="dd/MM/yy" Value="2" />
                        </Items>
                    </ej:DropDownList>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <ej:Grid ID="FormatGrid" runat="server">
                        <Columns>
                            <ej:Column Field="Number" HeaderText="Number" Format="{0:n2}" TextAlign="Right" Width="110" />
                            <ej:Column Field="Currency" HeaderText="Currency" Format="{0:c2}" TextAlign="Right" Width="110" />
                            <ej:Column Field="Date" HeaderText="Date" Format="{0:MM/dd/yyyy}" TextAlign="Right" Width="110" />
                        </Columns>
                    </ej:Grid>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        function onChange(args) {
            var grid = $('#<%= FormatGrid.ClientID %>').data("ejGrid");
            var dropObj = $("#" + args.model.targetID.split("_list")[0]).data("ejDropDownList");
            if (grid != undefined) {
                var column = grid.getColumnByField(this._id.split('_')[2]);
                column.format = "{0:" + dropObj.selectedTextValue.replace("Rounding - ", "") + "}";
                grid.refreshContent(true);
            }
        }
        function onComplete(args) {
            setTimeout(function () {
                $('#<%= Number.ClientID %>').ejDropDownList("option", { width: ($('#<%= Number.ClientID %>').parents("td").width() + "px") });
                $('#<%= Currency.ClientID %>').ejDropDownList("option", { width: ($('#<%= Number.ClientID %>').parents("td").width() + "px") });
                $('#<%= Date.ClientID %>').ejDropDownList("option", { width: ($('#<%= Number.ClientID %>').parents("td").width() + "px") });
            }, 100);
        }
    </script>
</asp:Content>

