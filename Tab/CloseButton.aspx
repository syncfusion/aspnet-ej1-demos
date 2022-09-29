<%@ Page Title="Tab-Close Button-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="CloseButton.aspx.cs" MetaDescription="This sample demonstrates how to display the close icon for each tab item in a ASP.NET Web Forms Tab control." Inherits="WebSampleBrowser.Tab.CloseButton" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
      <div class="controlframe">
    <ej:Tab ID="ClosetabButton" runat="server" ShowCloseButton="true">
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

