<%@ Page Title="Rotator-Image With Content-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to create images with content in rotator slides using the Syncfusion ASP.NET Web Forms Rotator component." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="ImagewithContent.aspx.cs" Inherits="WebSampleBrowser.Rotator.imagewithcontent" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">

            <ej:Rotator ID="sliderContent" runat="server"
                SlideWidth="100%"
                FrameSpace="0px"
                DisplayItemCount="1"
                SlideHeight="300px"
                NavigateSteps="1"
                EnableResize="false"
                ShowPager="true"
                Enabled="true"
                AllowKeyboardNavigation="true"
                ShowPlayButton="true"
                IsResponsive="true"
                AnimationType="slide">
                <Items>

                    <ej:RotatorItem>
                        <ContentSection>
                            <div class="leftPanel">
                                <img src="../Content/images/rotator/tablet.jpg" />
                            </div>
                            <div class="rightPanel blck">
                                <div class="contentPanel">Tablet </div>
                                <ul>
                                    <li>A tablet computer, or simply tablet, is a mobile computer with display, circuitry and battery in a single unit.</li>
                                    <li>
                                    Tablets are equipped with sensors, including cameras, microphone, accelerometer and touchscreen,
                                </ul>
                            </div>
                        </ContentSection>
                    </ej:RotatorItem>

                    <ej:RotatorItem>
                        <ContentSection>
                            <div class="leftPanel">
                                <img src="../Content/images/rotator/nature.jpg" />
                            </div>
                            <div class="rightPanel">
                                <div class="contentPanel">Nature </div>
                                <ul>
                                    <li>The health of the natural environment is critical to the long-term future of the planet</li>
                                    <li>Nature, in the broadest sense, is equivalent to the natural, physical, or material world or universe.</li>
                                </ul>
                            </div>
                        </ContentSection>
                    </ej:RotatorItem>

                    <ej:RotatorItem>
                        <ContentSection>
                            <div class="leftPanel">
                                <img src="../Content/images/rotator/card.jpg" />
                            </div>
                            <div class="rightPanel credit">
                                <div class="contentPanel">Credit card </div>
                                <ul>
                                    <li>A credit card is a payment card issued to users as a system of payment</li>
                                    <li>It allows the cardholder to pay for goods and services based on the holder's promise to pay for them</li>

                                </ul>
                            </div>
                        </ContentSection>
                    </ej:RotatorItem>
                    <ej:RotatorItem>
                        <ContentSection>
                            <div class="leftPanel">
                                <img src="../Content/images/rotator/rose.jpg" />
                            </div>
                            <div class="rightPanel">
                                <div class="contentPanel">Rose </div>
                                <ul>
                                    <li>A rose is a woody perennial of the genus Rosa, within the family Rosaceae</li>
                                    <li>Flowers vary in size and shape and are usually large and showy,
                    There are over 100 species
                                    </li>
                                </ul>
                            </div>
                        </ContentSection>
                    </ej:RotatorItem>

                </Items>
            </ej:Rotator>
        </div>
    </div>

</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <link href="<%=ResolveClientUrl("~/Content/Rotator/ImagewithContent.css")%>" rel="stylesheet" />
</asp:Content>

