<%@ Page Title="KanbanBoard-ExternalForm-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to use an external form to edit data and insert, update, and delete cards in the Syncfusion ASP.NET Web Forms Kanban component." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="ExternalFormEditing.aspx.cs" Inherits="WebSampleBrowser.Kanban.ExternalFormEditing" %>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="HeadSection">
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">KanbanBoard / ExternalFormEditing</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <ej:Kanban ID="KanbanBoard" runat="server" AllowScrolling="true" AllowTitle="true" KeyField="Status">
        <Columns>
            <ej:KanbanColumn HeaderText="Backlog" Key="Open" ShowAddButton="true" />
            <ej:KanbanColumn HeaderText="In Progress" Key="InProgress" />
            <ej:KanbanColumn HeaderText="Testing" Key="Testing" />
            <ej:KanbanColumn HeaderText="Done" Key="Close" />
        </Columns>
        <ClientSideEvents ActionComplete="complete" />
        <Fields Content="Summary" ImageUrl="ImgUrl" PrimaryKey="Id" />
        <ScrollSettings Width="700" Height="500" />
        <EditSettings AllowAdding="true" AllowEditing="true" EditMode="externalForm" FormPosition="Bottom">
            <EditItems>
                <ej:KanbanEditItem EditType="String" Field="Id">
                    <ValidationRules>
                        <ej:KeyValue Key="required" Value="true" />
                    </ValidationRules>
                </ej:KanbanEditItem>
                <ej:KanbanEditItem EditType="Dropdown" Field="Status"></ej:KanbanEditItem>
                <ej:KanbanEditItem EditType="Dropdown" Field="Assignee"></ej:KanbanEditItem>
                <ej:KanbanEditItem EditType="Numeric" Field="Estimate">
                    <NumericEditOptions DecimalPlaces="2" />
                    <ValidationRules>
                        <ej:KeyValue Key="range" Value="[0, 1000]" />
                    </ValidationRules>
                </ej:KanbanEditItem>
                <ej:KanbanEditItem EditType="TextArea" Field="Summary">
                    <ValidationRules>
                        <ej:KeyValue Key="required" Value="true" />
                    </ValidationRules>
                </ej:KanbanEditItem>
            </EditItems>
        </EditSettings>
    </ej:Kanban>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-kanban">
            <div class="row">
                <div class="col-md-3">
                    Edit Mode
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ID="editMode" runat="server" SelectedItemIndex="0" ClientSideOnChange="selectChange" Width="120px">
                        <Items>
                            <ej:DropDownListItem Text="External Form" Value="0" />
                            <ej:DropDownListItem Text="External Template" Value="1" />
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/template" id="template">
                      <table cellspacing="10">
                        <tr>
                            <td style="text-align:left;">Id
                            </td>
                            <td style="text-align: left">
                                <input id="Id" name="Id" value="{{: Id}}" class="e-field e-ejinputtext valid e-disable" style="text-align: right; width: 175px; height: 28px" disabled="disabled" />
                            </td>
							</tr>
							<tr>
							<td style="text-align: left;">Status
                            </td>
                            <td style="text-align: left">
                                  <select id="Status" name="Status">
                                    <option value="Close">Close</option>
                                    <option value="InProgress">InProgress</option>
                                    <option value="Open">Open</option>
                                    <option value="Testing">Testing</option>
                                    <option value="Validate">Validate</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: left;">Estimate
                            </td>
                            <td style="text-align: left">
                                <input type="text" id="Estimate" name="Estimate" value="{{:Estimate}}" />
                            </td>
							</tr>
							<tr>
							 <td style="text-align: left;">Assignee
                            </td>
                            <td style="text-align: left">
                                <select id="Assignee" name="Assignee">
                                    <option value="Nancy Davloio">Nancy Davloio</option>
                                    <option value="Andrew Fuller">Andrew Fuller</option>
                                    <option value="Janet Leverling">Janet Leverling</option>
                                    <option value="Margaret hamilt">Margaret hamilt</option>
                                    <option value="Steven walker">Steven walker</option>
                                    <option value="Michael Suyama">Michael Suyama</option>
                                    <option value="Robert King">Robert King</option>
                                    <option value="Laura Callahan">Laura Callahan</option>
                                </select>
                            </td>
                        </tr>                      
                        <tr>
                            <td style="text-align: left;">Tags
                            </td>
                            <td style="text-align: left">
                                <input id="Tags" name="Tags" value="{{: Tags}}" class="e-field e-ejinputtext valid" style="width: 175px; height: 28px" />
                            </td>
							</tr>
							<tr>
							<td style="text-align: left;">Priority
                            </td>
                            <td style="text-align: left">
                                <input id="Priority" name="Priority" value="{{: Priority}}" class="e-field e-ejinputtext valid" style="width: 175px; height: 28px" />
                            </td>
                        </tr>
						<tr>
                            <td style="text-align: left;">Summary
                            </td>
                            <td style="text-align: left">
                                <textarea id="Summary" name="Summary" class="e-ejinputtext"  value="{{: Summary}}" style="width: 270px; height: 95px">{{: Summary}}</textarea>
                            </td>
					    </tr>
                    </table>
    </script>
    <script type="text/javascript">
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
        });
        function selectChange(args) {
            var kanbanObj = $('#<%= KanbanBoard.ClientID %>').data("ejKanban");
            if (kanbanObj != undefined) {
                kanbanObj.KanbanSelection.clear();
                if (kanbanObj.model.isEdit)
                    $('#<%= KanbanBoard.ClientID %>').ejKanban("cancelEdit");
                if (args.itemId == 1)
                    $('#<%= KanbanBoard.ClientID %>').ejKanban("option", { "editSettings": { editMode: "externalformtemplate", externalFormTemplate: "#template" } });
                else
                    $('#<%= KanbanBoard.ClientID %>').ejKanban("option", { "editSettings": { editMode: "externalForm" } });
            }
        }
        function complete(args) {
            if (args.requestType == "refresh" || args.requestType == "save") {
                $('#<%= KanbanBoard.ClientID %>').ejWaitingPopup("hide");
            }
            if ((args.requestType == "beginedit" || args.requestType == "add") && args.model.editSettings.editMode == "externalformtemplate") {
                $("#Estimate").ejNumericTextbox({ value: parseFloat($("#Estimate").val()), width: "175px", height: "34px", decimalPlaces: 2 });
                $("#Assignee").ejDropDownList({ width: '175px' });
                $("#Status").ejDropDownList({ width: '175px' });
                if (args.requestType == "beginedit" || args.requestType == "add") {
                    $("#Assignee").ejDropDownList("setSelectedValue", args.data['Assignee']);
                    $("#Status").ejDropDownList("setSelectedValue", args.data['Status']);
                }
                $(".e-field").css({ 'width': '175px', 'text-align': 'left' });
            }
        }
    </script>
</asp:Content>



