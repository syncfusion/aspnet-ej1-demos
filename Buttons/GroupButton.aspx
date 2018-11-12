<%@ Page Title="" Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="GroupButton.aspx.cs" Inherits="WebSampleBrowser.Buttons.GroupButton" %>

<asp:content id="Content2" contentplaceholderid="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <label>Appointment View</label>
            <div class="element">
                <ej:GroupButton ID="groupButton" runat="server" GroupButtonMode="RadioButton" ShowRoundedCorner="true">                   
                </ej:GroupButton>
            </div>
        </div>
    </div>
</asp:Content>

<asp:content id="Content6" contentplaceholderid="StyleSection" runat="server">
    <style type="text/css">
        .frame {
            width: 56%;
        }

        .frame .control, label {
            display: table;
            margin: 0 auto;
        }

        .element {
            width: 100%;
        }
       
    </style>
</asp:content>
