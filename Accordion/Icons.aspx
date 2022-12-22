<%@ Page Language="C#" Title="Example of loading images/icons in ASP.NET Accordion | Syncfusion" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Icons.aspx.cs" MetaDescription="This example demonstrates customozing the items with icons in ASP.NET Web Forms Accordion." Inherits="WebSampleBrowser.Accordion.Icons" %>


<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
     <div class="controlframe">
    <ej:Accordion ID="IconAccordion" runat="server">
        <CustomIcon Header="header-close" SelectedHeader="header-expand" />
        <Items>
            <ej:AccordionItem ImageCssClass="logos volkswagan" Text="Volkswagen">
                <ContentSection>
                    <div>
                        Volkswagen is a German automobile manufacturer headquartered in Wolfsburg, Lower Saxony, Germany. 
                        Volkswagen is the original and top-selling marquee of the Volkswagen Group, the biggest German automaker and the third largest automaker in the world.
                    </div>
                </ContentSection>
            </ej:AccordionItem>
            <ej:AccordionItem ImageCssClass="logos mitsubishi" Text="Mitsubishi">
                <ContentSection>
                    <div>
                        The Mitsubishi Group is a group of autonomous Japanese multinational companies covering a range of businesses which share the Mitsubishi brand, 
                        trademark, and legacy.The Mitsubishi group of companies form a loose entity, the Mitsubishi Keiretsu, which is often referenced in Japanese and US media and official reports.
                    </div>
                </ContentSection>
            </ej:AccordionItem>
            <ej:AccordionItem ImageCssClass="logos benz" Text="Mercedes-Benz">
                <ContentSection>
                    <div>
                        Mercedes-Benz is a multinational division of the German manufacturer Daimler AG, and the brand is used for luxury automobiles, buses, coaches, and trucks.
                        Mercedes-Benz is headquartered in Stuttgart, Baden-Württemberg, Germany.The name first appeared in 1926 under Daimler-Benz but traces its origins 
                        to Daimler-Motormen-Gesell shaft's 1901 Mercedes and to Karl Benz's 1886 Benz Patent Motorwagen, which is widely regarded as the first automobile.
                    </div>
                </ContentSection>
            </ej:AccordionItem>
        </Items>
    </ej:Accordion>
</div>
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="StyleSection" runat="server">
    <link href="<%=ResolveClientUrl("~/Content/Accordion/icons.css")%>" rel="stylesheet" />
</asp:Content>

