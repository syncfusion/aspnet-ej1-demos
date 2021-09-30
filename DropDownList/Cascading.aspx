<%@ Page Title="DropDownList-Cascading-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Cascading.aspx.cs" MetaDescription="This example demonstrates how to populate a dropdownlist items based on the selection on another dropdownlist in ASP.NET Web Forms DropDownList control." Inherits="WebSampleBrowser.DropDownList.Cascading" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="row">
                    <div class="col-xs-8 col-sm-4">
            <span class="txt">Select Group</span>
            <ej:DropDownList ID="groupsList" runat="server" DataTextField="text" DataValueField="parentId" CascadeTo="LayoutSection_ControlsSection_countryList" ClientSideOnChange="onChange"></ej:DropDownList>
        </div>
                    <div class="col-xs-8 col-sm-4">
            <span class="txt">Select Country</span>
            <ej:DropDownList ID="countryList" runat="server" Enabled="false"></ej:DropDownList>
        </div>
    </div>
        </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        function onChange() {
            var ctry = $('#<%=countryList.ClientID%>').data("ejDropDownList");
            ctry.element.val("");
        }
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .frame {
            height: 100px;
            width: 50%;
        }

        .txt {
            display: block;
            margin-bottom: 12px;
        }
    </style>
</asp:Content>

