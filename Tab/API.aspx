<%@ Page Title="Tab-API's-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="API.aspx.cs"  MetaDescription="This example demonstrates the various methods like enable, disable and addItem etc in a ASP.NET Web Forms Tab control." Inherits="WebSampleBrowser.Tab.API" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
     <div class="controlframe">
    <ej:Tab ID="apiTab" runat="server">
        <Items>
            <ej:TabItem ID="javaScript" Text="JavaScript">
                <ContentSection>
               
                    JavaScript (JS) is an interpreted computer programming language. 
                                    It was originally implemented as part of web browsers so that client-side scripts could interact with the user, control the browser, 
                                    communicate asynchronously, and alter the document content that was displayed.[5] More recently, however, 
                                    it has become common in both game development and the creation of desktop applications.
                </ContentSection>
            </ej:TabItem>
            <ej:TabItem ID="cSharp" Text="C Sharp(C#)">
                <ContentSection>
               
                    C# is intended to be a simple, modern, general-purpose, object-oriented programming language.
                                     Its development team is led by Anders Hejlsberg. The most recent version is C# 5.0, which was released on August 15, 2012.
            
                </ContentSection>
            </ej:TabItem>
            <ej:TabItem ID="vb" Text="VB.Net">
                <ContentSection>
                 
                    The command-line compiler, VBC.EXE, is installed as part of the freeware .NET Framework SDK. 
                                    Mono also includes a command-line VB.NET compiler. The most recent version is VB 2012, which was released on August 15, 2012.
           
                </ContentSection>
            </ej:TabItem>
        </Items>
    </ej:Tab>
         </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Disable Item
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:DropDownList ID="optDisable" Width="120px" WatermarkText="Select" TargetID="disableItemlist" ClientSideOnChange="onDisableChange" runat="server"></ej:DropDownList>
                    <div id="disableItemlist">
                        <ul>
                            <li>Item 1</li>
                            <li>Item 2</li>
                            <li>Item 3</li>
                        </ul>
                    </div>

                </div>
                <div class="col-md-3 col-xs-4">
                    Enable Item
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:DropDownList ID="optEnable" Width="120px" WatermarkText="Select" ClientSideOnChange="onEnableChange" TargetID="enableItemlist" runat="server"></ej:DropDownList>
                    <div id="enableItemlist">
                        <ul>
                            <li>Item 1</li>
                            <li>Item 2</li>
                            <li>Item 3</li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Remove Tab
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:DropDownList ID="optRemove" Width="120px" WatermarkText="Select" ClientSideOnSelect="onRemoveChange" TargetID="Removelist" runat="server"></ej:DropDownList>
                    <div id="Removelist">
                        <ul>
                            <li>Item 1</li>
                            <li>Item 2</li>
                            <li>Item 3</li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-3 col-xs-4">
                    Destroy
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:ToggleButton ID="chkDestroy" Type="Button" ActiveText="Restore" DefaultText="Destory" runat="server" ClientSideOnChange="onDestoryRestore"></ej:ToggleButton>
                </div>
                <div class="col-md-3 col-xs-4">
                    Add Item
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:Button ID="btnAdd" Type="Button" Width="120px" Text="Add Item" runat="server" ClientSideOnClick="addNewTabItem" ></ej:Button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        var tabIndex = 1;
        var tabObj;
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
        });

        //API's 
        function addNewTabItem() {
            tabObj = $("#<%=apiTab.ClientID%>").data("ejTab");
            if (tabObj.model) {
                tabObj.addItem("#btnAdd", "New Item");
            }
        }
        function onDisableChange(args) {
            tabObj = $("#<%=apiTab.ClientID%>").data("ejTab");
            if (tabObj.model) {
                tabObj.option({ disabledItemIndex: [parseInt(args.itemId)] });
                $("#<%=optEnable.ClientID%>").ejDropDownList("clearText");
                $("#<%=optRemove.ClientID%>").ejDropDownList("clearText");
            }
        }
        function onEnableChange(args) {
            tabObj = $("#<%=apiTab.ClientID%>").data("ejTab");
            if (tabObj.model) {
                tabObj.option({ enabledItemIndex: [parseInt(args.itemId)] });
                $("#<%=optDisable.ClientID%>").ejDropDownList("clearText");
                $("#<%=optRemove.ClientID%>").ejDropDownList("clearText");
            }
        }
        function onRemoveChange(args) {
            tabObj = $("#<%=apiTab.ClientID%>").data("ejTab");
            if (tabObj.model) {
                tabObj.removeItem(parseInt(args.itemId));
                removObj = $("#<%=optRemove.ClientID%>").ejDropDownList("instance");
                $(removObj.items[removObj.popupListItems.length -= 1]).remove();
                disObj = $("#<%=optDisable.ClientID%>").ejDropDownList("instance");
                $(disObj.items[disObj.popupListItems.length -= 1]).remove();
                enObj = $("#<%=optEnable.ClientID%>").ejDropDownList("instance");
                $(enObj.items[enObj.popupListItems.length -= 1]).remove();
                $("#<%=optDisable.ClientID%>").ejDropDownList("clearText");
                $("#<%=optEnable.ClientID%>").ejDropDownList("clearText");
            }
        }
        function onDestoryRestore(args) {
            tabObj = $("#<%=apiTab.ClientID%>").data("ejTab");
            var drop1 = $("#<%=optDisable.ClientID%>").data("ejDropDownList");
            var drop2 = $("#<%=optEnable.ClientID%>").data("ejDropDownList");
            var drop3 = $("#<%=optRemove.ClientID%>").data("ejDropDownList");
			drop1.clearText();
			drop2.clearText();
			drop3.clearText();
            i = 0;
            if (args.isChecked) {
                tabObj.destroy();
                drop1.disable();
                drop2.disable();
                drop3.disable();

            }
            else {
                $("#<%=apiTab.ClientID%>").ejTab();
                tabObj = $("#<%=apiTab.ClientID%>").data("ejTab");
                drop1.enable();
                drop2.enable();
                drop3.enable();
            }
        }

    </script>
</asp:Content>
<asp:Content ID="COntent7" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .e-togglebutton {
            height: 33px;
            width: 119px;
        }
    </style>
</asp:Content>

