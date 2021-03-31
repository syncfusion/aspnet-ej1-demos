<%@ Page Title="TreeGrid-Details Template-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates the details view for tree grid rows. " AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="TreeGridRowDetails.aspx.cs" Inherits="WebSampleBrowser.TreeGrid.TreeGridRowDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">TreeGrid / Details Template</span>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ScriptSection">

    <script id="descriptionTemplate" type="text/x-jsrender">

        <div style="position: relative; display: inline-block; float: left; font-weight: bold; width: 10%">
            <img src="Images/{{:FullName}}.png" style="margin-left: 10px;margin-top:15px;" />
        </div>
        <div style="padding-left: 10px; display: inline-block; width: 88%; text-wrap: normal;font-size:12px;font-family:'Segoe UI';margin-top:2px;">
            <div class="e-description" style="word-wrap: break-word;">
                <b>{{:Name}}</b> was born on {{:~_treeGridDateFormatter("DOB")}}. Now lives at {{:Address}},{{:Country}}. {{:Name}} holds a position of <b>{{:Designation}}</b> in our WA department, (Seattle USA). Joined our company on {{:~_treeGridDateFormatter("DOJ")}}.
            </div>

            <div class="e-description" style="word-wrap: break-word;margin-top:5px;">
                <b style="margin-right:10px;">Contact:</b>{{:Contact}}
            </div>

        </div>
    </script>

    <script type="text/javascript">
        function _dateFormating(data) {
            var dateObj = ej.parseDate(this.data[data], "MM/dd/yyyy");
            return dateObj ? ej.format(dateObj, "dddd , dd MMMM yyyy") : "";
        }
        var helpers = {};
        helpers["_treeGridDateFormatter"] = _dateFormating;
        $.views.helpers(helpers);
    </script>
   <script type="text/javascript">
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
        });

        function showDetailsRowUpdate(args) {
            $('#<%= TreeGridControlRowDetails.ClientID %>').ejTreeGrid("model.showDetailsRow", args.isChecked);
            $('#<%= TreeGridControlRowDetails.ClientID %>').ejTreeGrid("model.showDetailsRowInfoColumn", false);
            if (!args.isChecked)
                $('#<%= showDetailsRowInfoColumn.ClientID %>').ejCheckBox({ checked: false, enabled: false });
            else
                $('#<%= showDetailsRowInfoColumn.ClientID %>').ejCheckBox({ enabled: true });
        }

        function showDetailsRowInfoColumnUpdate(args) {
            $('#<%= TreeGridControlRowDetails.ClientID %>').ejTreeGrid("model.showDetailsRowInfoColumn", args.isChecked);
        }
    </script>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:TreeGrid runat="server" ID="TreeGridControlRowDetails" ChildMapping="Children" ShowDetailsRow="true" ShowDetailsRowInfoColumn="true" 
             DetailsTemplate="descriptionTemplate" DetailsRowHeight="100" TreeColumnIndex="0"> 
            <Columns>
                <ej:TreeGridColumn HeaderText="Employee Name" Field="Name" EditType="String" />
                <ej:TreeGridColumn HeaderText="DOB" Field="DOB" EditType="Datepicker"/>
                <ej:TreeGridColumn HeaderText="Designation" Field="Designation" EditType="String" />
                <ej:TreeGridColumn HeaderText="Country" Field="Country"  EditType="String"/>
            </Columns>
            <EditSettings AllowAdding="true" AllowDeleting="true" AllowEditing="true" EditMode="CellEditing" RowPosition="BelowSelectedRow" />
            <ContextMenuSettings ContextMenuItems="add,edit,delete" ShowContextMenu="true" />
            <SizeSettings Width="100%" Height="350px" />
        </ej:TreeGrid>
    </div>
</asp:Content>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="PropertySection">
    <script type="text/javascript">
        $("#controlarea").scroll(function () {
                var treeGridObj = $('#<%= TreeGridControlRowDetails.ClientID %>').ejTreeGrid("instance");
                    if ($("#" + treeGridObj._id + "detailscellwrapper").length > 0)
                        treeGridObj.showHideDetailsRow(treeGridObj.model.selectedRowIndex);
             });
    </script>

    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                    Show details view
                </div>
                <div class="col-md-3">
                    <ej:CheckBox ID="showDetailsRow" runat="server" Checked="true" ClientSideOnChange="showDetailsRowUpdate"></ej:CheckBox>                    
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Show details view as a popup
                </div>
                <div class="col-md-3">
                    <ej:CheckBox ID="showDetailsRowInfoColumn" runat="server" Checked="true" ClientSideOnChange="showDetailsRowInfoColumnUpdate"></ej:CheckBox>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

