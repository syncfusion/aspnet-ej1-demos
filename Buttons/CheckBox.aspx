<%@ Page Title="Buttons-CheckBox-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="CheckBox.aspx.cs" Inherits="WebSampleBrowser.Buttons.checkboxes"  MetaDescription="This example demonstrates a simple, mobile-friendly and responsive ASP.NET Web Forms checkbox control to shows the checked, unchecked, and indeterminate states of checkbox." %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">     
        <div class="row">
            <br />
            Hobbies
            <br />
            <br />
            <div class="col-xs-6 col-sm-3">
                <ej:CheckBox ID="CheckBoxMusic" runat="server" Checked="true" CssClass="NodeText" Text="Music"></ej:CheckBox>
            </div>
            <div class="col-xs-6 col-sm-3">
                <ej:CheckBox ID="CheckBoxSports" runat="server" CssClass="NodeText" Text="Sports"></ej:CheckBox>
            </div>
            <div class="col-xs-6 col-sm-3">
                <ej:CheckBox ID="CheckBoxBikeRiding" runat="server" CssClass="NodeText" Text="Bike Riding"></ej:CheckBox>
            </div>
        </div>
         <div class="row">
                <br />
                <br />
                Favorite Search Engines<br />
                <br />
               <div class="col-xs-6 col-sm-3">
                    <ej:CheckBox ID="CheckBox3" Checked="true" runat="server" Size="Medium" Text="Playing Games"></ej:CheckBox>
                </div>
                <div class="col-xs-6 col-sm-3">
                    <ej:CheckBox ID="CheckBox4" runat="server" Size="Medium" Text="Hearing Songs"></ej:CheckBox>
                </div>
                 <div class="col-xs-6 col-sm-3">
                    <ej:CheckBox ID="CheckBox5" runat="server" Size="Medium" Text="Watching Tv"></ej:CheckBox>
                </div>
             </div>
         <div class="row">
            <br />
            <br />
            Favorite Social networks<br />
            <br />
            <div class="col-xs-8 col-sm-3">
                <ej:CheckBox ID="CheckBoxFacebook" Checked="true" runat="server" CssClass="NodeText" Text="Facebook" Size="Medium" EnableTriState="true"></ej:CheckBox>
            </div>
            <div class="col-xs-8 col-sm-3">
                <ej:CheckBox ID="CheckBoxGPlus" runat="server" CssClass="NodeText" Text="GPlus" Size="Medium" EnableTriState="true"></ej:CheckBox>
            </div>
            <div class="col-xs-8 col-sm-3">
                <ej:CheckBox ID="CheckBoxTwitter" runat="server" CssClass="NodeText" Text="Twitter" Size="Medium" EnableTriState="true"></ej:CheckBox>
            </div>
             </div>
                <br />
        </div>
 </asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .frame {
            width: 50%;
        }
    </style>
</asp:Content>

