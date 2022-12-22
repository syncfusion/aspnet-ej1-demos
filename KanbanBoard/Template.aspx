<%@ Page Title="KanbanBoard-Template-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to customize the card layout of the Syncfusion ASP.NET Web Forms Kanban component." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Template.aspx.cs" Inherits="WebSampleBrowser.Kanban.Template" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">KanbanBoard / Template</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <ej:Kanban ID="KanbanBoard" runat="server" AllowSelection="false" AllowTitle="true" KeyField="Status">
        <Columns>
            <ej:KanbanColumn HeaderText="Backlog" Key="Open" />
            <ej:KanbanColumn HeaderText="In Progress" Key="InProgress" />
            <ej:KanbanColumn HeaderText="Done" Key="Close" />
        </Columns>
        <Fields PrimaryKey="Id" Color="Type" />
        <ScrollSettings Width="900" Height="700" AllowFreezeSwimlane="true" />
        <CardSettings Template="#cardtemplate">
            <ColorMappings>
                <ej:KeyValue Key="#cb2027" Value="Issue,Story" />
                <ej:KeyValue Key="#67ab47" Value="Improvement" />
                <ej:KeyValue Key="#fbae19" Value="Epic" />
                <ej:KeyValue Key="#6a5da8" Value="UG" />
            </ColorMappings>
        </CardSettings>
    </ej:Kanban>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script id="cardtemplate" type="text/x-jsrender">             
        <table class="e-templatetable">
           <colgroup>
               <col width="10%">
               <col width="90%">
          </colgroup>
          <tbody>
           <tr>
            <td class="photo">
                <img src="../content/images/kanban/{{:Priority}}.png">
            </td>            
            <td class="details">
                <table>
                    <colgroup>
                        <col width="10%">
                        <col width="90%">
                    </colgroup>
                    <tbody>
                        <tr>
                            <td class="CardHeader">   Assignee: </td>
                            <td>{{:Assignee}}</td>
                        </tr>                      
                        <tr>
                            <td class="CardHeader">   Summary: </td>
                            <td>{{:Summary}}</td>
                        </tr>
                        <tr>
                            <td class="CardHeader">   Type: </td>
                            <td>{{:Type}}</td>
                        </tr>                        
                    </tbody>
                </table>
            </td>
           </tr>
        </tbody>
    </table>     
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .e-templatetable {
            width: 100%;
        }

        .details > table {
            margin-left: 2px;
            border-collapse: separate;
            border-spacing: 2px;
            width: 100%;
        }

        .details td {
            vertical-align: top;
        }

        .details {
            padding: 8px 8px 10px 0;
        }

        .photo {
            padding: 8px 6px 10px 6px;
            text-align: center;
        }

        .CardHeader {
            font-weight: bolder;
            padding-right: 10px;
        }
    </style>
</asp:Content>

