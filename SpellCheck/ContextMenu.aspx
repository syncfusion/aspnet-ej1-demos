<%@ Page Title="SpellCheck-Context Menu-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="ContextMenu.aspx.cs" MetaDescription="This sample showcases to use context menu to perform spell check operations in a ASP.NET Web Forms SpellCheck" Inherits="WebSampleBrowser.SpellCheck.ContextMenu" %>


<asp:Content ID="Content4" ContentPlaceHolderID="SampleHeading" runat="server">
     <span class="sampleName">SpellChcek / Context Menu</span>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="content-container-fluid">
        <div class="row">
            <div>
                <div id="TextArea" class="sentence" contenteditable="true">
                    It is a concept vehicle with Liuid Silver body colour, 20-inch wheels, fabric foding roof, electrically-controlled hood, 4-cylinder 2.0 TDI engine rated 204 PS (150 kW; 201 hp)
                    and 400  (295.02 lbf ft), diesel particulate filter and Bluetec emission control system, quattro permanent four-wheel drve system,
                    Audi S tronic dual-clutch gearbox, McPherson-strut front axle and a four-link rear axle, Audi drive select system with 3 modes (dynamic, sport, efficiency),
                    MMI control panel with touch pad and dual-view technology, sound system with the proinent extending tweeters.
                </div>
                <div>
                    <ej:Button ID="btn_Context" Type="Button" ClientSideOnClick="showInContextMenu" Text="Spell check" runat="server"></ej:Button>
                </div>
            </div>
        </div>
    </div>    
    <ej:SpellCheck ID="SpellCheck" ClientIDMode="Static" runat="server" ControlsToValidate="#TextArea" EnableValidateOnType="true">
        <DictionarySettings DictionaryUrl="../api/SpellCheck/CheckWords" CustomDictionaryUrl="../api/SpellCheck/AddToDictionary" />
              
         <ContextMenuSettings Enable="true">  
                    <MenuItems>
                        <ej:SpellContextMenuItem ID="IgnoreAll" Text="IgnoreAll" />
                        <ej:SpellContextMenuItem ID="AddToDictionary" Text="Add to Dictionary" />
                    </MenuItems>                  
                </ContextMenuSettings>
    </ej:SpellCheck>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        function showInContextMenu() {
            var spellObj = $("#SpellCheck").data("ejSpellCheck");
            spellObj.validate();
        }
    </script>
    <style>
        #TextArea{
			padding-bottom:15px;
		}
    </style>
</asp:Content>

