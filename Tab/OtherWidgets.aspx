<%@ Page Title="Tab-Other Widgets-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="OtherWidgets.aspx.cs" MetaDescription="This example demonstrates intergerating other controls with Syncfusion ASP.NET Web Forms Tab control." Inherits="WebSampleBrowser.Tab.OtherWidgets" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
     <div class="controlframe">
    <ej:Tab ID="otherWidgets" runat="server">
        <Items>
            <ej:TabItem ID="Pizza" Text="Pizza Menu">
                <ContentSection>
                    Pizza cooked to perfection tossed with milk, vegetables, potatoes, poultry, 100% pure mutton, and cheese - and in creating nutritious and tasty meals to maintain good health.
                        <div>
                            <ej:Accordion ID="pizzaMenu" Collapsible="true" runat="server">
                                <Items>
                                    <ej:AccordionItem Text="GARDEN FRESH (Veg)">
                                        <ContentSection>
                                            <div>
                                                Rating : 
                                                <div>
                                                    <ej:Rating ID="gardenPizza" AllowReset="false" ReadOnly="true" Value="4" runat="server"></ej:Rating>
                                                </div>
                                            </div>
                                            Simple and delicious mozzarella cheese and pizza sauce on a classic crust.The goodness of crunchy onions, green capsicums & tomatoes.
                                        </ContentSection>
                                    </ej:AccordionItem>
                                    <ej:AccordionItem Text="CORN & SPINACH (Veg)">
                                        <ContentSection>
                                            <div>
                                                Rating : 
                                                <div>
                                                    <ej:Rating ID="cornPizza" AllowReset="false" ReadOnly="true" Value="4" runat="server"></ej:Rating>
                                                </div>
                                            </div>
                                            Enticing blend of panneer, spinach, sweet corn and mozarella cheese. The garden fresh combination of sweet corn & green capsicums topped with slices of cottage cheese. 
                                        </ContentSection>
                                    </ej:AccordionItem>
                                    <ej:AccordionItem Text="CHICKEN DELITE (Non-veg)">
                                        <ContentSection>
                                            <div>
                                                Rating : 
                                                <div>
                                                    <ej:Rating ID="chickenPizza" AllowReset="false" ReadOnly="true" Value="4" runat="server"></ej:Rating>
                                                </div>
                                            </div>
                                            A sumptuous portion of chicken chunks & onions topped with delicious mozzarella cheese.Great tropical treat of ripe pineapple chunks & slices of chicken loaf. 
                                        </ContentSection>
                                    </ej:AccordionItem>
                                    <ej:AccordionItem Text="KEEMA LA JAWAB (Non-veg)">
                                        <ContentSection>
                                            <div>
                                                Rating : 
                                                <div>
                                                    <ej:Rating ID="keemaPizza" AllowReset="false" ReadOnly="true" Value="4" runat="server"></ej:Rating>
                                                </div>
                                            </div>
                                            Hot & delectable desi pizza with lamb keema, onions, garlic & tandoori seasoning. The flavor of chicken tikka along with green capsicum and tomatoes in rich makhani sauce. 
                                        </ContentSection>
                                    </ej:AccordionItem>
                                </Items>
                            </ej:Accordion>
                        </div>
                </ContentSection>
            </ej:TabItem>
            <ej:TabItem ID="Pasta" Text="Pasta Menu">
                <ContentSection>
                    Pasta cooked to perfection tossed with milk, vegetables, potatoes, poultry, 100% pure mutton, and cheese - and in creating nutritious and tasty meals to maintain good health.
                        <div>
                            <ej:Accordion ID="pastaMenu" Collapsible="true" runat="server">
                                <Items>
                                    <ej:AccordionItem Text="ZESTY MUSHROOMS AND TOMATO  (Veg)">
                                        <ContentSection>
                                            <div>
                                                <div>
                                                    Rating : 
                                                <div>
                                                    <ej:Rating ID="zestyPasta" AllowReset="false" ReadOnly="true" Value="4" runat="server"></ej:Rating>
                                                </div>
                                                </div>
                                                Pasta cooked to perfection tossed with mushrooms & rich flavored tomato concasse oven baked with a cheesy touch. 
                                            </div>
                                        </ContentSection>
                                    </ej:AccordionItem>
                                    <ej:AccordionItem Text="CORN & SPINACH (Veg)">
                                        <ContentSection>
                                            <div>
                                                <div>
                                                    Rating : 
                                                <div>
                                                    <ej:Rating ID="cornPasta" AllowReset="false" ReadOnly="true" Value="4" runat="server"></ej:Rating>
                                                </div>
                                                </div>
                                                A healthy portion of pasta with sautered spinach mix, sweet corn, parsley & mozarella cheese. 
                                            </div>
                                        </ContentSection>
                                    </ej:AccordionItem>
                                    <ej:AccordionItem Text="BAKED CHICKEN AND CHEESE (Non-veg)">
                                        <ContentSection>
                                            <div>
                                                <div>
                                                    Rating : 
                                                <div>
                                                    <ej:Rating ID="bakedPasta" AllowReset="false" ReadOnly="true" Value="4" runat="server"></ej:Rating>
                                                </div>
                                                </div>
                                                An all time favorite cheese 'n' pasta loaded with grilled chicken, corn and olives. 
                                            </div>
                                        </ContentSection>
                                    </ej:AccordionItem>
                                </Items>
                            </ej:Accordion>
                        </div>
                </ContentSection>
            </ej:TabItem>
            <ej:TabItem Text="Sandwich Menu" ID="sandwizza">
                <ContentSection>
                    Sandwizza cooked to perfection tossed with milk, vegetables, potatoes, poultry, 100% pure mutton, and cheese - and in creating nutritious and tasty meals to maintain good health.
                        <div>
                            <ej:Accordion ID="sandMenu" Collapsible="true" runat="server">
                                <Items>
                                    <ej:AccordionItem Text="GARDEN VEGGIE (Veg)">
                                        <ContentSection>
                                            <div>
                                                <div>
                                                    Rating : 
                                                <div>
                                                    <ej:Rating ID="gardenSand" AllowReset="false" ReadOnly="true" Value="4" runat="server"></ej:Rating>
                                                </div>
                                                </div>
                                                A treat that brings to life the flavors of straight-from-the-garden-veggies replete with green chilies. An appetizing combination of panneer tikka, onions & tomatoes.
                                            </div>
                                        </ContentSection>
                                    </ej:AccordionItem>
                                    <ej:AccordionItem Text="PANEER TIKKA (Veg)">
                                        <ContentSection>
                                            <div>
                                                <div>
                                                    Rating : 
                                                <div>
                                                    <ej:Rating ID="paneerSand" AllowReset="false" ReadOnly="true" Value="4" runat="server"></ej:Rating>
                                                </div>
                                                </div>
                                                An appetizing combination of panneer tikka, onions & tomatoes.A treat that brings to life the flavors of straight-from-the-garden-veggies replete with green chilies.
                                            </div>
                                        </ContentSection>
                                    </ej:AccordionItem>
                                    <ej:AccordionItem Text="CHICKEN TIKKA (Non-veg)">
                                        <ContentSection>
                                            <div>
                                                <div>
                                                    Rating : 
                                                <div>
                                                    <ej:Rating ID="chickenSand" AllowReset="false" ReadOnly="true" Value="4" runat="server"></ej:Rating>
                                                </div>
                                                </div>
                                                An appetizing and hot combination of chicken tikka, onions & tomatoes.The ultimate non-veg fiesta of grilled chicken, chicken salami, lamb pepperoni with cheese & onions. 
                                            </div>
                                        </ContentSection>
                                    </ej:AccordionItem>
                                </Items>
                            </ej:Accordion>
                        </div>
                </ContentSection>
            </ej:TabItem>
        </Items>
    </ej:Tab>

         </div>
</asp:Content>


