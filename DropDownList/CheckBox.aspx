<%@ Page Title="DropDownList-Checkbox-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="CheckBox.aspx.cs" MetaDescription="This example demonstrates multiple items selection using checkbox in ASP.NET Web Forms DropDownList control." Inherits="WebSampleBrowser.DropDownList.CheckBox" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">

    <div class="frame">
        <div class="control">
            <ej:DropDownList ID="skillsets" runat="server" ShowCheckbox="true" WatermarkText="Select your skill" Width="100%">
                <Items>
                    <ej:DropDownListItem Text="ActionScript" Value="ActionScript"></ej:DropDownListItem>
                    <ej:DropDownListItem Text="Basic" Value="Basic"></ej:DropDownListItem>
                    <ej:DropDownListItem Text="C++" Value="C++"></ej:DropDownListItem>
                    <ej:DropDownListItem Text="C#" Value="C#"></ej:DropDownListItem>
                    <ej:DropDownListItem Text="dBase" Value="dBase"></ej:DropDownListItem>
                </Items>
            </ej:DropDownList>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-12">
                    <ej:ToggleButton runat="server" ID="btnchkunchk" DefaultText="Check All" ActiveText="Uncheck All" ClientSideOnChange="onCheckUncheckAll"></ej:ToggleButton>
                </div>
            </div>

        </div>
    </div>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        var target;
        $(function () {

            target = $('#<%=skillsets.ClientID%>').data("ejDropDownList");
            $("#sampleProperties").ejPropertiesPanel();
        });
        function onCheckUncheckAll(args) {
            if (args.isChecked) {
                if (target) target.checkAll();
            }
            else
                if (target) target.unCheckAll();
        }

    </script>
</asp:Content>


