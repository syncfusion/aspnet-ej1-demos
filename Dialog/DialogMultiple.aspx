<%@ Page Title="Dialog-Multiple Dialog-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates multiple Syncfusion ASP.NET Web Forms Dialog widgets in the same web page with different contents and different functionalities." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DialogMultiple.aspx.cs" Inherits="WebSampleBrowser.Dialog.DialogMultiple" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="control">
        <ej:Dialog ID="Dialog1" Containment=".control" Title="London" runat="server">
            <DialogContent>
                <p>
                    London is one of the most popular tourist destinations in the world for a reason. A cultural and historical hub, London has an excellent public transportation system that allows visitors to see all the fantastic sights without spending a ton of money on a rental car.London contains four World Heritage Sites.
                </p>
            </DialogContent>
             <Position XValue="-245px" YValue="-80px" />
        </ej:Dialog>
        <ej:Dialog ID="Dialog2" Containment=".control" Title="Paris" runat="server">
            <DialogContent>
                <p>
                   Paris, the city of lights and love - this short guide is full of ideas for how to make the most of the romanticism that oozes from every one of its beautiful corners.You couldn't possibly visit Paris without seeing the Eiffel Tower. Even if you do not want to visit this world famous structure, you will see its top from all over Paris.
                </p>
            </DialogContent>
            <Position XValue="225px" YValue="-80px" />
        </ej:Dialog>
        <ej:Dialog ID="Dialog3" Containment=".control" Title="Rome" runat="server">
            <DialogContent>
                <p>
                    Rome is one of the world's most fascinating cities. The old adage that Rome was not built in a day — and that you won't see it in one or even in three — is true. For the intrepid traveler who can keep pace, here is a list of must-sees. But remember what the Romans say: "Even a lifetime isn't enough to see Rome." 
                </p>
            </DialogContent>
         <Position XValue="0px" YValue="140px" />
        </ej:Dialog>
    </div>
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        #LayoutSection_maincontrolarea {
            padding: 0;
        }

        .control {
            height: 500px;
            position: relative;
        }

        .htmljssamplebrowser.material .control {
            height: 600px;
        }

        p {
            margin: 0px;
            text-align: justify;
        }

         .htmljssamplebrowser:not(.material):not(.office-365) #LayoutSection_ControlsSection_Dialog1,  .htmljssamplebrowser:not(.material):not(.office-365) #LayoutSection_ControlsSection_Dialog2,  .htmljssamplebrowser:not(.material):not(.office-365) #LayoutSection_ControlsSection_Dialog3 {
            padding: 10px;
        }
    </style>
</asp:Content>

