<%@ Page Title="Slider-Default Functionalities-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="DefaultFunctionalities.aspx.cs" MetaDescription="This sample demonstrates initializing a simple ASP.NET Web Forms Slider control." Inherits="WebSampleBrowser.Slider.DefaultFunctionalities" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadSection" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">

    <div class="frame">
        <div id="loanheading">
            Details of Loan
        </div>
        <span class="ColumnLeft"><span class="loan">Loan Amount</span></span> <span class="ColumnRight">
            <span class="value">25000</span><span id="loantext">$ </span></span>
        <ej:Slider ID="loanSlider" runat="server" Value="25000" MinValue="10000" MaxValue="1000000" 
                   IncrementStep="10" ClientSideOnChange="onchange" ClientSideOnSlide="onchange"></ej:Slider>
        <span class="ColumnLeft"><span class="interest">Interest Rate</span></span> <span
            class="ColumnRight"><span id="interesttext">% pa</span><span class="value">4</span>
        </span>
        <ej:Slider ID="interestSlider" runat="server" Value="4" MinValue="1" MaxValue="20" IncrementStep="1" 
                   ClientSideOnChange="onchange" ClientSideOnSlide="onchange"></ej:Slider>
        <span class="ColumnLeft"><span class="tenure">Tenure</span> </span><span class="ColumnRight">
            <span id="tenuretext">Years</span><span class="value">3</span> </span>
        <ej:Slider ID="tenureSlider" runat="server" Value="3" MinValue="1" MaxValue="20" IncrementStep="1" 
                   ClientSideOnChange="onchange" ClientSideOnSlide="onchange"></ej:Slider>
        <div id="result">
            Your Monthly EMI Amount is <span id="EventLog"></span>
        </div>

    </div>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        var loanObj, interestObj, tenureObj, loanValue = 0, interestValue = 0, tenureValue = 0;
        $(function () {

            var loanvalue = 25000, interestvalue = 4, tenurevalue = 3;
            loanObj = $('#<%=loanSlider.ClientID%>').data('ejSlider');
            interestObj = $('#<%=interestSlider.ClientID%>').data('ejSlider');
            tenureObj = $('#<%=tenureSlider.ClientID%>').data('ejSlider');
            calculate();
        });
        function onchange(args) {
            this.wrapper.prev().children('span.value').html("");
            this.wrapper.prev().children('span.value').html(args.value);
            calculate();
        }
        function calculate() {
            var loan = loanObj.getValue(), interest = interestObj.getValue(), tenure = tenureObj.getValue();

            var P = loan;
            var y = interest / 1200;
            var tenureamt = tenure * 12;

            //actual processing
            var top = y * (Math.pow((1 + y), tenureamt));
            var bottom = (Math.pow((1 + y), tenureamt)) - 1;
            var ans = top / bottom;
            var final = P * ans;
            var z = Math.round(final);


            $('#EventLog').html("$ " + z);
        }


    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css" class="cssStyles">
        .e-slider-wrap.e-horizontal .e-handle {
            top: -3px;
        }

        .e-slider-wrap.e-vertical .e-handle {
            left: -3px;
        }

        .frame {
            width: 50%;
        }

        .loan, .interest, .tenure {
            margin-top: 5px;
            font-weight: 400;
        }

        .value, #loantext, #interesttext, #tenuretext {
            float: right;
            position: relative;
            width: auto;
            padding-left: 3px;
        }

        #loantext, #interesttext, #tenuretext {
            width: auto;
        }

        #result {
            margin-top: 25px;
            text-align: center;
            font-weight: 600;
        }

        .frame .e-slider-wrap {
            display: block;
            margin-top: 40px;
        }

        .ColumnLeft {
            width: 35%;
            float: left;
            font-weight: 400;
            margin-top: 10px;
        }

        .ColumnRight {
            width: 65%;
            float: right;
            font-weight: 600;
            margin-top: 14px;
        }

        #loanheading {
            font-size: larger;
            padding-bottom: 15px;
        }
    </style>
</asp:Content>

