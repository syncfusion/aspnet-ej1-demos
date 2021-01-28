<%@ Page Title="Rating-Orientation-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Orientation.aspx.cs"  MetaDescription="This example demonstrates how to initialize the Syncfusion ASP.NET Web Forms Rating control in vertical or horizontal orientation." Inherits="WebSampleBrowser.Rating.Orientation" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
        });

        function onChanged(args) {
            var ratingObj = $("#<%=Rating1.ClientID%>").data("ejRating");
            ratingObj.option('orientation', args.selectedText)
        }

    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">

    <div class="frame">
        <ej:Rating ID="Rating1" runat="server"></ej:Rating>
    </div>

</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                    Orientation :
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ID="optSetValue" TargetID="optSetValuelist" ClientSideOnChange="onChanged" Width="120px" SelectedItemIndex="0" runat="server"></ej:DropDownList>
                    <div id="optSetValuelist">
                        <ul>
                            <li>Horizontal</li>
                            <li>Vertical</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

