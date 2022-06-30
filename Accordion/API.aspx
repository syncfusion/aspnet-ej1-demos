<%@ Page Language="C#" Title="ASP.NET Accordion API configuration example | Syncfusion" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="API.aspx.cs" MetaDescription="This example demonstrates the various methods like enable/disableitem, destroy, show/hide and enable/disableAll in a ASP.NET Web Forms Accordion." Inherits="WebSampleBrowser.Accordion.API" %>


<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
     <div class="controlframe" style="min-height:300px;">
    <ej:Accordion ID="APIAccordion" runat="server">
        <Items>
            <ej:AccordionItem Text="London">
                <ContentSection>
                    London is one of the most popular tourist destinations in the world for a reason. A cultural and historical hub, London has an excellent public transportation system that allows visitors to see all the fantastic sights without spending a ton of money on a rental car.
                </ContentSection>
            </ej:AccordionItem>
        </Items>
        <Items>
            <ej:AccordionItem Text="Paris">
                <ContentSection>
                    Paris, the city of lights and love - this short guide is full of ideas for how to make the most of the romanticism that oozes from every one of its beautiful corners.
                </ContentSection>
            </ej:AccordionItem>
        </Items>
        <Items>
            <ej:AccordionItem Text="Rome">
                <ContentSection>
                     Rome is one of the world's most fascinating cities. The old adage that Rome was not built in a day — and that you won't see it in one or even in three — is true. For the intrepid traveler who can keep pace, here is a list of must-sees. But remember what the Romans say: "Even a lifetime isn't enough to see Rome." 
                </ContentSection>
            </ej:AccordionItem>
        </Items>
    </ej:Accordion>
         </div>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Active Index
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:DropDownList ID="optActiveChange" runat="server" ClientSideOnChange="onActiveChange" WatermarkText="Select" Width="120px" TargetID="optActiveChangelist"></ej:DropDownList>
                    <div id="optActiveChangelist">
                        <ul>
                            <li>London</li>
                            <li>Paris</li>
                            <li>Rome</li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-3 col-xs-4">
                    Disable Item
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:DropDownList ID="optDisableChange" runat="server" ShowCheckbox="true" ClientSideOnChange="onDisableChange" WatermarkText="Select" Width="120px" TargetID="optDisableChangelist"></ej:DropDownList>
                    <div id="optDisableChangelist">
                        <ul>
                            <li>London</li>
                            <li>Paris</li>
                            <li>Rome</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Enable Item
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:DropDownList ID="optEnableChange" runat="server" ShowCheckbox="true" WatermarkText="Select" Width="120px" ClientSideOnChange="onEnableChange" TargetID="optEnableChangelist"></ej:DropDownList>
                    <div id="optEnableChangelist">
                        <ul>
                            <li>London</li>
                            <li>Paris</li>
                            <li>Rome</li>
                        </ul>

                    </div>
                </div>
                <div class="col-md-3 col-xs-4">
                    Enable / Disable All
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:ToggleButton ID="btnEnableDisable" ClientSideOnChange="onEnaleDisableAll" Width="120px" DefaultText="Disable All" ActiveText="Enable All" runat="server"></ej:ToggleButton>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Show / Hide
                </div>
                <div class="col-md-3 col-xs-4">
                    <input type="checkbox" id="chkShowHide" class="e-chkbox" value="ShowHide" checked="checked" />
                </div>
                </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Destroy
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:ToggleButton ID="chkDestroy" ClientSideOnChange="onDestoryRestore" DefaultText="Destory" Width="120px" ActiveText="Restore" runat="server"></ej:ToggleButton>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Height Adjust Mode
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:DropDownList ID="heightAdjustMode" runat="server" Value="content" Width="120px" ClientSideOnChange="onHeightAdjust" TargetID="heightAdjust"></ej:DropDownList>
                    <div id="heightAdjust">
                        <ul>
                            <li>fill</li>
                            <li>content</li>
                            <li>auto</li>
                        </ul>

                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Close button
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:ToggleButton ID="chkCloseBtn" ClientSideOnChange="onShowHideCloseBtn" DefaultText="Show" Width="120px" ActiveText="Hide" runat="server"></ej:ToggleButton>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript" class="jsScript">
        var acrdnObj, activeObj, disableObj;
        $(function () {
            // declaration           
            acrdnObj = $("#<%=APIAccordion.ClientID%>").data("ejAccordion");
            $("#chkShowHide").ejCheckBox({ "change": "onShowHide" });
            $("#sampleProperties").ejPropertiesPanel();
            activeObj = $("#<%=optActiveChange.ClientID%>").data("ejDropDownList");
            disableObj = $("#<%=optDisableChange.ClientID%>").data("ejDropDownList");
        });
    </script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/Accordion/AccordionAPI.js")%>' type="text/javascript"></script>
</asp:Content>









