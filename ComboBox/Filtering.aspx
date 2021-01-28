<%@ Page Title="ComboBox-Filtering-ASP.NET-SYNCFUSION"   Language="C#" AutoEventWireup="true" CodeBehind="Filtering.aspx.cs" MasterPageFile="~/Samplebrowser.Master" MetaDescription="This example demonstrates how to enable the filtering in a ASP.NET Web Forms ComboBox control." Inherits="WebSampleBrowser.ComboBox.Filtering" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:combobox ID="selectCountry" runat="server" Width="100%" AllowFiltering="true" DataTextField="text" ClientSideOnFiltering="filtering" Query="new ej.Query().select(['text','category']).take(25)" DataValueField="category" Placeholder="Select a country">
                
            </ej:combobox>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        function filtering(e) {
            var query = new ej.Query().select(['text','category']);
            query = (e.text !== '') ? query.where('text', 'startswith', e.text, true) : query;
            e.updateData(e.model.dataSource, query);
        }
    </script>
</asp:Content>

