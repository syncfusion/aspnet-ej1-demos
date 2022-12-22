<%@ Page Title="Textboxes-Keyboard Interactions-ASP.NET-SYNCFUSION"   Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" 
CodeBehind="KeyboardInteractions.aspx.cs" Inherits="WebSampleBrowser.Textboxes.KeyboardInteractions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
       <div class="row">
            <div class="col-xs-6 col-sm-5">
                <span>Numeric Textbox</span>
            </div>
            <div class="col-xs-6 col-sm-4">
                <ej:NumericTextBox ID="numeric" Name="numeric" Value="5" runat="server" Width="100%"/>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-6 col-sm-5">
                <span>Percentage Textbox</span>
            </div>
            <div class="col-xs-6 col-sm-4">
                <ej:PercentageTextBox ID="percent" Name="percentage" Value="55" runat="server" Width="100%"/>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-6 col-sm-5">
                <span>Currency Textbox</span>
            </div>
            <div class="col-xs-6 col-sm-4">
                <ej:CurrencyTextBox ID="currency" Name="currency" Value="555" runat="server" Width="100%"/>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        $(function () {
            //Control focus key
            $(document).on("keydown", function (e) {
                if (e.altKey && e.keyCode === 74) {
                    // j- key code.
                    $("#<%=numeric.ClientID%>").siblings(".e-input").focus();
                }
            });
            $("#sampleProperties").ejPropertiesPanel();
        });

    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .editors span {
            display: block;
            width: 100%;
        }
         table{
			width:100%;
		}

        .frame {
            width: 40%;
        }

        .control {
            color: gray;
            font-size: medium;
        }

        .col-xs-6.col-sm-5 {
            margin-top: 10px;
        }

       .col-xs-6.col-sm-4{
            padding-top: 7px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid keyboard">
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Alt + j 
                </div>
                <div class="col-md-3 col-xs-4">
                    Focuses the control.
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Up
                </div>
                <div class="col-md-3 col-xs-4">
                    Increments the value
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Down
                </div>
                <div class="col-md-3 col-xs-4">
                    Decrements the value
                </div>
            </div>
             <div class="row">
                <div class="col-md-3 col-xs-4">
                    Tab
                </div>
                <div class="col-md-3 col-xs-4">
                    Focus the next element
                </div>
            </div>
        </div>
    </div>
</asp:Content>

