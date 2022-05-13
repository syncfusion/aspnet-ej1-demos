<%@ Page Language="C#" Title="DropDownList-Integration with Widgets-ASP.NET-SYNCFUSION" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="IntegrationwithWidgets.aspx.cs" MetaDescription="This sample demonstrates how to integerate other component wihtin ASP.NET Web Forms DropDownList control popup."  Inherits="WebSampleBrowser.DropDownList.IntegrationwithWidgets" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">

    <div class="frame">
        <div class="control">
            <ej:DropDownList ID="selectFolder" runat="server" WatermarkText="Select any value" Width="100%" ClientSideOnCreate="dropdownOnCreate">
                <Items>
                    <ej:DropDownListItem>
                        <ContentTemplate>
                            <ej:TreeView ID="Treeview" runat="server" DataTextField="Text" DataIdField="ID" DataParentIdField="ParentID"
                                DataHasChildField="HasChild" ClientSideOnCreated="treeViewOnCreate" ClientSideOnNodeExpanded="checkScroll" ClientSideOnNodeChecked="onNodeCheck" ClientSideOnNodeUnchecked="onNodeUnCheck" ShowCheckbox="true" ClientSideOnNodeCollapsed="checkScroll">
                            </ej:TreeView>
                        </ContentTemplate>
                    </ej:DropDownListItem>
                </Items>
            </ej:DropDownList>
        </div>
    </div>

</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .desig {
            font-weight: normal;
            padding-left: 5px;
        }

        .cont {
            font-size: 10px;
            font-weight: normal;
            padding-left: 5px;
        }

        .eimg {
            margin: 0;
            padding: 2px;
            float: left;
            border: 0 none;
            width: 50px;
            height: 50px;
        }

        .ename {
            padding-left: 5px;
            font-weight: bold;
        }
        .e-treeview > ul {
            margin-left: 0 !important;
        }

        .e-ddl-popup div > ul li .e-chkbox-wrap {
            padding-right: 2px;
        }

        .e-ddl-popup div > ul .e-ghead {
            display: none !important;
        }

        .frame {
            width: 30%;
        }
    </style>
</asp:Content>
<asp:Content ID="ScriptContent" ContentPlaceHolderID="ScriptSection" runat="server">
      <script type="text/javascript">

          ej.DropDownList.prototype._OnMouseClick = function (e) { }
          ej.DropDownList.prototype._OnMouseEnter = function (e) { }
          ej.DropDownList.prototype._OnMouseLeave = function (e) { }
          ej.DropDownList.prototype._OnKeyUp = function (e) { }
          ej.DropDownList.prototype._OnKeyDown = function (e) { }

    </script>
     <script src='<%= Page.ResolveClientUrl("~/Scripts/DropDownList/IntegrationwithWidgets.js")%>' type="text/javascript"></script>
</asp:Content>

