<%@ Page Title="Rating-API's-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="APIs.aspx.cs" MetaDescription="This example demonstrates the various methods like setValue, hide, show, enable and disable in a ASP.NET Web Forms Rating control." Inherits="WebSampleBrowser.Rating.methods" %>



<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">

    <div class="frame">
        <ej:Rating ID="Rating1" Value="4" runat="server"></ej:Rating>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Set Value
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:DropDownList ID="ddlRating1" Width="107px" WatermarkText="Select" ClientSideOnChange="setRatingValue" TargetID="ddlRatinglist" runat="server"></ej:DropDownList>
                    <div id="ddlRatinglist">
                        <ul>
                            <li>0</li>
                            <li>1</li>
                            <li>2</li>
                            <li>3</li>
                            <li>4</li>
                            <li>5</li>
                        </ul>
                    </div>
                </div>
                </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Get Current Value
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:Button ID="btnGetValue" Type="Button" CssClass="e-btn" Text="GetValue" runat="server" Width="95px" ClientSideOnClick="onGetValueClck"></ej:Button>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Reset
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:Button ID="btnReset" Type="Button" CssClass="e-btn" Text="Reset" runat="server" Width="95px" ClientSideOnClick="onResetClck"></ej:Button>
                </div>
                </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Reset Button
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:ToggleButton Type="Button" ID="chkResetbtn" ActiveText="Show" DefaultText="Hide" ClientSideOnChange="onShowHideReset" runat="server"></ej:ToggleButton>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Rating
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:ToggleButton Type="Button" ID="chkShowHideRating" ActiveText="Show" DefaultText="Hide" ClientSideOnChange="onShowHideRating" runat="server"></ej:ToggleButton>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Destroy
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:ToggleButton Type="Button" ID="destroyRestore" ActiveText="Restore" DefaultText="Destroy" ClientSideOnChange="onDestoryRestore" runat="server"></ej:ToggleButton>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        var ratingObj, ddlObj, hideButtonObj, resetButtonObj, resetObj, valButtonObj;
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
        });
        function onGetValueClck(args) {
            ratingObj = $("#<%=Rating1.ClientID%>").data("ejRating");
            if (ratingObj.model) {
                var val = ratingObj.getValue();
                alert("Current Value : " + val);
            }
        }
        function setRatingValue(args) {
            ratingObj = $("#<%=Rating1.ClientID%>").data("ejRating");
            if (ratingObj.model)
                ratingObj.setValue(args.text);
        }
        function onResetClck() {
            ratingObj = $("#<%=Rating1.ClientID%>").data("ejRating");
            ddlObj = $("#<%=ddlRating1.ClientID%>").data("ejDropDownList");
            if (ratingObj.model)
                ratingObj.reset();
            ddlObj.option("selectedItemIndex", 0);
        }
        function onShowHideRating(args) {
            ratingObj = $("#<%=Rating1.ClientID%>").data("ejRating");
            if (ratingObj.model) {
                if (args.isChecked)
                    ratingObj.hide();
                else
                    ratingObj.show();
            }
        }
        function onShowHideReset(args) {
            ratingObj = $("#<%=Rating1.ClientID%>").data("ejRating");
            if (ratingObj.model) {
                if (args.isChecked)
                    ratingObj.option({ allowReset: false });
                else
                    ratingObj.option({ allowReset: true });
            }
        }
        function onDestoryRestore(args) {
            ratingObj = $("#<%=Rating1.ClientID%>").data("ejRating");
            ddlObj = $("#<%=ddlRating1.ClientID%>").data("ejDropDownList");
            hideButtonObj = $("#<%=chkShowHideRating.ClientID%>").data("ejToggleButton");
            resetButtonObj = $("#<%=chkResetbtn.ClientID%>").data("ejToggleButton");
            resetObj = $("#<%=btnReset.ClientID%>").data("ejButton");
            valButtonObj = $("#<%=btnGetValue.ClientID%>").data("ejButton");

            if (args.isChecked) {
                ratingObj.destroy();
                ddlObj.disable();
                hideButtonObj.disable();
                resetButtonObj.disable();
                resetObj.disable();
                valButtonObj.disable();
            }
            else {
                $("#<%=Rating1.ClientID%>").ejRating();
                ratingObj = $("#<%=Rating1.ClientID%>").data("ejRating");
                ddlObj.option('value', "");
                ddlObj.enable();
                hideButtonObj.enable();
                resetButtonObj.enable();
                resetObj.enable();
                valButtonObj.enable();
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .e-button, .e-togglebutton {
            width: 94px;
        }
    </style>
</asp:Content>

