<%@ Page Title="ComboBox-Cascading-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Cascading.aspx.cs" MetaDescription="This example demonstrates how to populate a items based on the selection on another ComboBox in ASP.NET Web Forms ComboBox control." Inherits="WebSampleBrowser.ComboBox.Cascading" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="row">
                    <div class="col-xs-8 col-sm-4">
            <span class="txt">Select Group</span>
            <ej:ComboBox ID="groupsList" runat="server" DataTextField="text" DataValueField="parentId" ClientSideOnChange="onChange"></ej:ComboBox>
        </div>
                    <div class="col-xs-8 col-sm-4">
            <span class="txt">Select Country</span>
            <ej:ComboBox ID="countryList" runat="server" DataTextField="text" Enabled="false"></ej:ComboBox>
        </div>
    </div>
        </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        function onChange(e) {
            var ctry = $('#<%=countryList.ClientID%>').data("ejComboBox");
            ctry.option({ enabled: true, query: new ej.Query().where('parentId', 'equal', e.model.value), value: null });
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

