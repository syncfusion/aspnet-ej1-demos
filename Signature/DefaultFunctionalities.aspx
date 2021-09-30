<%@ Page Title="Signature-Default Functionalities-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to capture or draw smooth signatures using the Syncfusion ASP.NET Web Forms Signature component." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DefaultFunctionalities.aspx.cs" Inherits="WebSampleBrowser.Signature.DefaultFunctionalities" %>

<asp:Content ID="Content7" ContentPlaceHolderID="ActionDescriptionSection" runat="server">
    <div>
        <p>
            This sample demonstrates about the Essential ASP.NET The Signature Plugin is used to capture or drawing the smooth signatures. It captures user’s signature as vector outlines of strokes. 
            Using Signature we can customize the background, stroke width and stroke color and also convert captured signature to an image format. 
            It is also provided with Undo, Redo & Clear options.
        </p>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame ">
        <div class="control">
            <h3>Sign here</h3>
                <ej:Signature ID="signature" Height="400px" StrokeWidth="3" IsResponsive="true" runat="server"></ej:Signature>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .frame {
            width: 80%;
        }
    </style>
</asp:Content>






