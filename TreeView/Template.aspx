<%@ Page Title="TreeView-Template-ASP.NET-SYNCFUSION"   Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" 
CodeBehind="Template.aspx.cs" MetaDescription="This demo shows templates using Syncfusion ASP.NET Web TreeView control." Inherits="WebSampleBrowser.TreeView.Template" %>

<asp:Content runat="server" ID="content1" ContentPlaceHolderID="ScriptSection">
    <script id="treeTemplate" type="text/x-jsrender">
        {{if hasChild}}
              <div class={{>cls}}>{{>name}}</div>
        {{else}}
             <div class="cont-list">
                 <img class="con-img" src="../Content/images/treeview/template-image-{{>imgId}}.png" />
                 <div class="cont-del"></div>
                 <div class="cont-details">
                     <b>{{>name}}</b><br />
                     <span>{{>city}}</span>
                     <br />
                     <span>{{>phone}}</span>
                 </div>
                 <div class="treeFooter"></div>
             </div>
        {{/if}}

    </script>

    <script type="text/javascript">
        $(function () {
            var treeObj = $("#<%=treeview.ClientID%>").data("ejTreeView");
            $("#<%=treeview.ClientID%>").find(".cont-del").bind("click", function (e) {
                treeObj.removeNode($(e.target).parents("li").first());
            });
        });
    </script>
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
    <div style="width:320px">
    <ej:TreeView ID="treeview" runat="server" Template="#treeTemplate" DataTextField="name" 
                 DataIdField="id" DataParentIdField="pid" DataHasChildField="hasChild" DataExpandedField="expanded" />
    </div>


</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="StyleSection" runat="server">
    <link href="<%=ResolveClientUrl("~/Content/TreeView/Template.css")%>" rel="stylesheet" />
</asp:Content>

