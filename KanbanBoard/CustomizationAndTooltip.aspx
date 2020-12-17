<%@ Page Title="KanbanBoard-Customization & Tooltip-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to display tooltips and customize the kanban card content in the Syncfusion ASP.NET Web Forms Kanban component." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="CustomizationAndTooltip.aspx.cs" Inherits="WebSampleBrowser.Kanban.CustomizationAndTooltip" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">KanbanBoard / CustomizationAndTooltip</span>
</asp:Content>
<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <ej:Kanban ID="KanbanBoard" runat="server" AllowSelection="false" AllowTitle="true" KeyField="Status">
        <Columns>
            <ej:KanbanColumn HeaderText="Backlog" Key="Open" />
            <ej:KanbanColumn HeaderText="In Progress" Key="InProgress" />
            <ej:KanbanColumn HeaderText="Testing" Key="Testing" />
            <ej:KanbanColumn HeaderText="Done" Key="Close" />
        </Columns>
        <ToolTipSettings Enable="true" />
		<CardSettings>
            <ColorMappings>
                <ej:KeyValue Key="#ee4e75" Value="Bug,Story" />
                <ej:KeyValue Key="#57b94c" Value="Improvement" />
                <ej:KeyValue Key="#edba3c" Value="Epic" />
                <ej:KeyValue Key="#5187c6" Value="Others" />
            </ColorMappings>
        </CardSettings> 
        <Fields Content="Summary" Tag="Tags" Color="Type" ImageUrl="ImgUrl" PrimaryKey="Id" Priority="RankId"/>
    </ej:Kanban>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                    Enable Tooltip
                </div>
                <div class="col-md-3">
                    <ej:CheckBox ID="enableToolTip" Value="enableToolTip" runat="server" Checked="True" ClientSideOnChange="onTooltipChange"></ej:CheckBox>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Enable Template
                </div>
                <div class="col-md-3">
                    <ej:CheckBox ID="enableToolTipTemp" Value="enableToolTipTemp" Checked="false" runat="server" ClientSideOnChange="onTooltipTemp"></ej:CheckBox>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script id="tooltipTemp" type="text/x-jsrender">
        <div class='e-kanbantooltiptemp'>
            <table>
                <tr>
                    <td class="photo">
                        <img src="{{:ImgUrl}}">
                    </td>
                    <td class="details">
                        <table>
                            <colgroup>
                                <col width="30%">
                                <col width="70%">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <td class="CardHeader">Assignee:</td>
                                    <td>{{:Assignee}}</td>
                                </tr>
                                <tr>
                                    <td class="CardHeader">Type:</td>
                                    <td>{{:Type}}</td>
                                </tr>                                
                                <tr>
                                    <td class="CardHeader">Estimate:</td>
                                    <td>{{:Estimate}}</td>
                                </tr>                                
                                <tr>
                                    <td class="CardHeader">Summary:</td>
                                    <td>{{:Summary}}</td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </script>
    <script type="text/javascript">
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();

        });
        function queryCellInfo(args) {
            $($(args.card).find(".e-primarykey")).html("<a href='#'>" + args.data.Id + "</a>");
        }
        function onTooltipChange(args) {
            $('#<%= KanbanBoard.ClientID %>').ejKanban("option", "tooltipSettings.enable", args.isChecked);
        }
        function onTooltipTemp(args) {
            $('#<%= KanbanBoard.ClientID %>').ejKanban("option", "tooltipSettings.template", args.isChecked == true ? "#tooltipTemp" : null);
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .details > table {
            width: 100%;
            margin-left: 2px;
            border-collapse: separate;
            border-spacing: 1px;
        }
        .e-kanbantooltiptemp {
            width: 250px;
            padding: 3px;
        }
        .e-kanbantooltiptemp > table {
            width: 100%;
        }
        .e-kanbantooltiptemp td {
            vertical-align: top;
        }
        td.details {
            padding-left: 10px;
        }
        .CardHeader {
            font-weight: bolder;
        }
    </style>
</asp:Content>


