<%@ Page Language="C#" Title="Example to create nested accordion in ASP.NET | Syncfusion" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="NestedAccordion.aspx.cs" MetaDescription="This sample demonstrates how to initialize nested accordion with Syncfusion ASP.NET WebForms Accordion control." Inherits="WebSampleBrowser.Accordion.NestedAccordion" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
     <div class="controlframe">
    <ej:Accordion ID="NestAccordion" runat="server">
        <Items>
            <ej:AccordionItem Text="Pizza Menu">
                <ContentSection>
                    That is the reason why we offer a variety of toppings and crusts and a wide array of choices made from natural ingredients, balancing a nutritional diet with splendid taste.
                            <div>
                                <ej:Accordion ID="PizzaMenu" runat="server">
                                    <Items>
                                        <ej:AccordionItem Text="GARDEN FRESH (Veg)">
                                            <ContentSection>
                                                <div>
                                                    <img src="../Content/images/accordion/garden-veggie.png" alt="garden-fresh" />
                                                    <div class="ingredients">
                                                        Rate    : $50    
                                           <br />
                                                        Ingredients : cheese, onions, green capsicums & tomatoes.
                                                    </div>
                                                </div>
                                            </ContentSection>
                                        </ej:AccordionItem>
                                        <ej:AccordionItem Text="CORN & SPINACH (Veg)">
                                            <ContentSection>
                                                <div>
                                                    <img src="../Content/images/accordion/corn-and-spinach-05.png" alt="garden-fresh" />
                                                    <div class="ingredients">
                                                        Rate    : $70    
                                           <br />
                                                        Ingredients : cheese, sweet corn & green capsicums.
                                                    </div>
                                                </div>
                                            </ContentSection>
                                        </ej:AccordionItem>
                                        <ej:AccordionItem Text="CHICKEN DELITE (Non-veg)">
                                            <ContentSection>
                                                <div>
                                                    <img src="../Content/images/accordion/chicken-delite.png" alt="garden-fresh" />
                                                    <div class="ingredients">
                                                        Rate    : $100    
                                           <br />
                                                        Ingredients : cheese, chicken chunks, onions & pineapple chunks.
                                                    </div>
                                                </div>
                                            </ContentSection>
                                        </ej:AccordionItem>
                                        <ej:AccordionItem Text="KEEMA LA JAWAB (Non-veg)">
                                            <ContentSection>
                                                <div>
                                                    <img src="../Content/images/accordion/chicken-delite.png" alt="garden-fresh" />
                                                    <div class="ingredients">
                                                        Rate    : $95    
                                           <br />
                                                        Ingredients : lamb keema, onions, garlic & tandoori seasoning.
                                                    </div>
                                                </div>
                                            </ContentSection>
                                        </ej:AccordionItem>
                                    </Items>
                                </ej:Accordion>
                            </div>
                </ContentSection>
            </ej:AccordionItem>
            <ej:AccordionItem Text="Pasta Menu">
                <ContentSection>
                    Pasta cooked to perfection tossed with milk, vegetables, potatoes, poultry, 100% pure mutton, and cheese - and in creating nutritious and tasty meals to maintain good health.
                        <div>
                            <ej:Accordion ID="pastaMenu" runat="server">
                                <Items>
                                    <ej:AccordionItem Text="ZESTY MUSHROOMS AND TOMATO  (Veg)">
                                        <ContentSection>
                                            <div>
                                                <img src="../Content/images/accordion/zesty-mushroons-and-tomatoes.png" alt="garden-fresh" />
                                                <div class="ingredients">
                                                    Rate    : $30    
                                           <br />
                                                    Ingredients : cheese, onions, green capsicums & tomatoes.
                                                </div>
                                            </div>
                                        </ContentSection>
                                    </ej:AccordionItem>
                                    <ej:AccordionItem Text="CORN & SPINACH (Veg)">
                                        <ContentSection>
                                            <div>
                                                <img src="../Content/images/accordion/corn-and-spinach-05.png" alt="garden-fresh" />
                                                <div class="ingredients">
                                                    Rate    : $35    
                                           <br />
                                                    Ingredients : sautered spinach mix, sweet corn, parsley & mozarella cheese.
                                                </div>
                                            </div>
                                        </ContentSection>
                                    </ej:AccordionItem>
                                    <ej:AccordionItem Text="BAKED CHICKEN AND CHEESE (Non-veg)">
                                        <ContentSection>
                                            <div>
                                                <img src="../Content/images/accordion/baked-chicken-and-cheese.png" alt="garden-fresh" />
                                                <div class="ingredients">
                                                    Rate    : $55    
                                           <br />
                                                    Ingredients : grilled chicken, corn and olives.
                                                </div>
                                            </div>
                                        </ContentSection>
                                    </ej:AccordionItem>
                                </Items>
                            </ej:Accordion>
                        </div>
                </ContentSection>
            </ej:AccordionItem>
            <ej:AccordionItem Text="Sandwizza Menu">
                <ContentSection>
                    Sandwizza cooked to perfection tossed with bread, milk, vegetables, potatoes, poultry, 100% pure mutton, and cheese - and in creating nutritious and tasty meals to maintain good health.
                        <div>
                            <ej:Accordion ID="sandMenu" runat="server">
                                <Items>
                                    <ej:AccordionItem Text="GARDEN VEGGIE (Veg)">
                                        <ContentSection>
                                            <div>
                                                <img src="../Content/images/accordion/garden-veggie.png" alt="garden-fresh" />
                                                <div class="ingredients">
                                                    Rate    : $30    
                                           <br />
                                                    Ingredients : onions, garden-veggies & tomatoes.
                                                </div>
                                            </div>
                                        </ContentSection>
                                    </ej:AccordionItem>
                                    <ej:AccordionItem Text="PANEER TIKKA (Veg)">
                                        <ContentSection>
                                            <div>
                                                <img src="../Content/images/accordion/paneer-tikka.png" alt="garden-fresh" />
                                                <div class="ingredients">
                                                    Rate    : $34    
                                           <br />
                                                    Ingredients : onions, paneer & tomatoes.
                                                </div>
                                            </div>
                                        </ContentSection>
                                    </ej:AccordionItem>
                                    <ej:AccordionItem Text="CHICKEN TIKKA (Non-veg)">
                                        <ContentSection>
                                            <div>
                                                <img src="../Content/images/accordion/chicken-tikka.png" alt="garden-fresh" />
                                                <div class="ingredients">
                                                    Rate    : $64    
                                           <br />
                                                    Ingredients : onions, grilled chicken, chicken salami & tomatoes.
                                                </div>
                                            </div>
                                        </ContentSection>
                                    </ej:AccordionItem>
                                </Items>
                            </ej:Accordion>
                        </div>
                </ContentSection>
            </ej:AccordionItem>
        </Items>
    </ej:Accordion>
         </div>
</asp:Content>

