<%@ Page Title="DropDownList-API's-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="API.aspx.cs" MetaDescription="This example demonstrates the various methods like clearText, enable and disable in a ASP.NET Web Forms DropDownList control." Inherits="WebSampleBrowser.DropDownList.API" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:DropDownList ID="bookSelect" runat="server" DataTextField="category" WatermarkText="Select a section"></ej:DropDownList>

        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3 col-xs-4">Select an item by index</div>
                <div class="col-md-3 col-xs-4">
                    <ej:DropDownList ID="optIndexChange" WatermarkText="Select" ClientSideOnChange="onActiveIndexChange" runat="server" Width="100%" ToolTip="select..">
                        <Items>
                            <ej:DropDownListItem Text="1 Item" Value="0" />
                            <ej:DropDownListItem Text="2 Item" Value="1" />
                            <ej:DropDownListItem Text="3 Item" Value="2" />
                            <ej:DropDownListItem Text="4 Item" Value="3" />
                            <ej:DropDownListItem Text="5 Item" Value="4" />
                            <ej:DropDownListItem Text="6 Item" Value="5" />
                            <ej:DropDownListItem Text="7 Item" Value="6" />
                            <ej:DropDownListItem Text="8 Item" Value="7" />
                            <ej:DropDownListItem Text="9 Item" Value="8" />
                            <ej:DropDownListItem Text="10 Item" Value="9" />
                            <ej:DropDownListItem Text="11 Item" Value="10" />
                            <ej:DropDownListItem Text="12 Item" Value="11" />
                            <ej:DropDownListItem Text="13 Item" Value="12" />
                            <ej:DropDownListItem Text="14 Item" Value="13" />
                            <ej:DropDownListItem Text="15 Item" Value="14" />
                            <ej:DropDownListItem Text="16 Item" Value="15" />
                            <ej:DropDownListItem Text="17 Item" Value="16" />
                            <ej:DropDownListItem Text="18 Item" Value="17" />
                            <ej:DropDownListItem Text="19 Item" Value="18" />
                            <ej:DropDownListItem Text="20 Item" Value="19" />
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">Select an item by value</div>
                <div class="col-md-3 col-xs-4">
                    <ej:DropDownList ID="optValueChange" WatermarkText="Select" ClientSideOnChange="onActiveValueChange" runat="server" Width="107px" ToolTip="select..">
                        <Items>
                            <ej:DropDownListItem Text="Art" Value="Art" />
                            <ej:DropDownListItem Text="Architecture" Value="Architecture" />
                            <ej:DropDownListItem Text="Biographies" Value="Biographies" />
                            <ej:DropDownListItem Text="Business" Value="Business" />
                            <ej:DropDownListItem Text="ComputerIT" Value="ComputerIT" />
                            <ej:DropDownListItem Text="Comics" Value="Comics" />
                            <ej:DropDownListItem Text="Cookery" Value="Cookery" />
                            <ej:DropDownListItem Text="Environment" Value="Environment" />
                            <ej:DropDownListItem Text="Fiction" Value="Fiction" />
                            <ej:DropDownListItem Text="Health" Value="Health" />
                            <ej:DropDownListItem Text="Humanities" Value="Humanities" />
                            <ej:DropDownListItem Text="Language" Value="Language" />
                            <ej:DropDownListItem Text="Literature" Value="Literature" />
                            <ej:DropDownListItem Text="Memoirs" Value="Memoirs" />
                            <ej:DropDownListItem Text="Management" Value="Management" />
                            <ej:DropDownListItem Text="Professional" Value="Professional" />
                            <ej:DropDownListItem Text="Reference" Value="Reference" />
                            <ej:DropDownListItem Text="Spirituality" Value="Spirituality" />
                            <ej:DropDownListItem Text="Sports" Value="Sports" />
                            <ej:DropDownListItem Text="Sciences" Value="Sciences" />
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">Select an item by text</div>
                <div class="col-md-3 col-xs-4">
                    <ej:DropDownList ID="optTextChange" WatermarkText="Select" ClientSideOnChange="onActiveTextChange" runat="server" Width="107px" ToolTip="select..">
                        <Items>
                            <ej:DropDownListItem Text="Art" Value="Art" />
                            <ej:DropDownListItem Text="Architecture" Value="Architecture" />
                            <ej:DropDownListItem Text="Biographies" Value="Biographies" />
                            <ej:DropDownListItem Text="Business" Value="Business" />
                            <ej:DropDownListItem Text="ComputerIT" Value="ComputerIT" />
                            <ej:DropDownListItem Text="Comics" Value="Comics" />
                            <ej:DropDownListItem Text="Cookery" Value="Cookery" />
                            <ej:DropDownListItem Text="Environment" Value="Environment" />
                            <ej:DropDownListItem Text="Fiction" Value="Fiction" />
                            <ej:DropDownListItem Text="Health" Value="Health" />
                            <ej:DropDownListItem Text="Humanities" Value="Humanities" />
                            <ej:DropDownListItem Text="Language" Value="Language" />
                            <ej:DropDownListItem Text="Literature" Value="Literature" />
                            <ej:DropDownListItem Text="Memoirs" Value="Memoirs" />
                            <ej:DropDownListItem Text="Management" Value="Management" />
                            <ej:DropDownListItem Text="Professional" Value="Professional" />
                            <ej:DropDownListItem Text="Reference" Value="Reference" />
                            <ej:DropDownListItem Text="Spirituality" Value="Spirituality" />
                            <ej:DropDownListItem Text="Sports" Value="Sports" />
                            <ej:DropDownListItem Text="Sciences" Value="Sciences" />
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">TextBox Value</div>
                <div class="col-md-3 col-xs-4">
                    <ej:Button ID="Button8" Type="Button" CssClass="e-btn" Text="Value" runat="server" Width="95px" ClientSideOnClick="valuetext"></ej:Button>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">Disable\Enable</div>
                <div class="col-md-3 col-xs-4">
                    <ej:ToggleButton ID="btnchkunchk" runat="server" DefaultText="Disable" ActiveText="Enable" Width="107px" ClientSideOnChange="onCheckUncheckAll"></ej:ToggleButton>
                </div>
            </div>
             <div class="row">
                <div class="col-md-3 col-xs-4">Filter Search</div>
                <div class="col-md-3 col-xs-4">
                    <ej:ToggleButton ID="incrementalbutton" runat="server" DefaultText="Enable" ActiveText="Disable" Width="107px" ClientSideOnChange="incrementalchange"></ej:ToggleButton>
                </div>
            </div>
             <div class="row">
                <div class="col-md-3 col-xs-4">Case-Sensitive Search</div>
                <div class="col-md-3 col-xs-4">
                    <ej:ToggleButton ID="casesensitivebutton" runat="server" DefaultText="Enable" ActiveText="Disable" Width="107px" ClientSideOnChange="casesensitivechange"></ej:ToggleButton>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        var target;
        $(function () {
            target = $('#<%=bookSelect.ClientID%>').data("ejDropDownList");
            $("#sampleProperties").ejPropertiesPanel();
        });
        function onActiveIndexChange(args) {
            target.option({ selectedIndex: args.itemId });
            $("#<%=optValueChange.ClientID%>").ejDropDownList("clearText");
            $("#<%=optTextChange.ClientID%>").ejDropDownList("clearText");

        }
        function onActiveValueChange(args) {
            target.selectItemByValue(args.selectedValue);
            $("#<%=optIndexChange.ClientID%>").ejDropDownList("clearText");
            $("#<%=optTextChange.ClientID%>").ejDropDownList("clearText");
        }
        function onActiveTextChange(args) {
            target.selectItemByText(args.selectedValue);
            $("#<%=optIndexChange.ClientID%>").ejDropDownList("clearText");
            $("#<%=optValueChange.ClientID%>").ejDropDownList("clearText");
        }
        function onCheckUncheckAll(args) {
            (args.isChecked) ? target.disable() : target.enable()
        }
        function incrementalchange(args) {
            (args.isChecked) ? target.option("enableFilterSearch", true) : target.option("enableFilterSearch", false)
                
            }
        function casesensitivechange(args) {
            (args.isChecked)?target.option("caseSensitiveSearch", true):target.option("caseSensitiveSearch", false)   
        }
        function valuetext(e, ui) {
            alert("Selected Item is " + target.getValue());
        }

    </script>
</asp:Content>


