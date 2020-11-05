<%@ Page Title="ComboBox-Template-ASP.NET-SYNCFUSION"   Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Template.aspx.cs" MetaDescription="This demo shows dropdown items with templates in Syncfusion ASP.NET Web ComboBox control." Inherits="WebSampleBrowser.ComboBox.Template" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:ComboBox ID="selectCountry" runat="server" Width="100%" DataTextField="text"  HeaderTemplate ="<div class='head'>  Photo  <span style='padding-left:42px'> Contact Info </span></div>"
                    ItemTemplate="<div><img class='eimg' src='../Content/images/combobox/${eimg}.png' alt='employee'/><div class='ename'> ${text} </div><div class='temp'> ${country} </div></div>"
                    FooterTemplate ="<div class='Foot'> Total Items Count: 5 </div>"
                    Placeholder="Select a country" ></ej:ComboBox>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="StyleSection" runat="server">
    <link href="<%=ResolveClientUrl("~/Content/AutoComplete/Template.css")%>" rel="stylesheet" />
    <style type="text/css">
        .frame {
            width: 30%;
            padding: 50px;
        }
        .head {
            background-color: #a9a9a9;
            height: 30px;
            font-weight: bold;
            padding: 14px 0 0 20px;
        }
        
        .Foot {
            background-color: #dadada;
            vertical-align: middle;
            padding: 16px;
            font-weight: bold;
        }
        
        .ename {
            font-weight: bold;
            display: block !important;
            opacity: .87;
        }
        
        .tempName {
            padding: 5px 42px;
            opacity: .87;
        }
        
        .temp {
            margin-top: -15px;
            opacity: .54;
        }
        
        .eimg {
            border-radius: 50%;
            padding: 10px 16px;
            width: 40px;
            height: 40px;
            float: left;
        }
        
        .tempImg {
            padding-bottom: 3px;
            border-radius: 50%;
            float: left;
        }
        
        .e-dropdownbase .e-list-item * {
            display: block;
        }
    </style>
</asp:Content>

