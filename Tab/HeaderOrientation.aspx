<%@ Page Title="Tab-Header Orientation-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="HeaderOrientation.aspx.cs" MetaDescription="This example demonstrates both vertical and horizontal orientation of the toolbar header in the Syncfusion ASP.NET Web Forms Tab component." Inherits="WebSampleBrowser.Tab.HeaderOrientation" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
     <div class="controlframe">
    <ej:Tab ID="tabDirection" runat="server" HeaderPosition="Top">
        <Items>
             <ej:TabItem ID="rome" Text="Rome">
                <ContentSection>
                    Rome is one of the world's most fascinating cities. The old adage that Rome was not built in a day — and that you won't see it in one or even in three — is true. For the intrepid traveler who can keep pace, here is a list of must-sees. But remember what the Romans say: "Even a lifetime isn't enough to see Rome." 
                </ContentSection>
            </ej:TabItem>
            <ej:TabItem ID="paris" Text="Paris">
                <ContentSection>
                    Paris, the city of lights and love - this short guide is full of ideas for how to make the most of the romanticism that oozes from every one of its beautiful corners.You couldn't possibly visit Paris without seeing the Eiffel Tower. Even if you do not want to visit this world famous structure, you will see its top from all over Paris. The tower rises 300 meters tall (984 ft); when it was completed at the end of the nineteenth century
                </ContentSection>
            </ej:TabItem>
           
            <ej:TabItem ID="london" Text="London">
                <ContentSection>
                    London is one of the most popular tourist destinations in the world for a reason. A cultural and historical hub, London has an excellent public transportation system that allows visitors to see all the fantastic sights without spending a ton of money on a rental car.London contains four World Heritage Sites: the Tower of London; Kew Gardens; the site comprising the Palace of Westminster, Westminster Abbey, and St Margaret's Church
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
                <div class="col-md-3">
                    Header Orientation
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ID="selectDirection" SelectedItemIndex="0" TargetID="optDirectionList" Width="120px" ClientSideOnChange="onSelectChange" runat="server"></ej:DropDownList>
                    <div id="optDirectionList">
                        <ul>
                            <li value="top">Header Top</li>
                            <li value="bottom">Header Bottom</li>
                            <li value="left">Header Left</li>
                            <li value="right">Header Right</li>
                        </ul>
                    </div>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
        });
        function onSelectChange(args) {
            $("#<%=tabDirection.ClientID %>").ejTab("setModel", { headerPosition: args.value })
        }
    </script>
</asp:Content>

