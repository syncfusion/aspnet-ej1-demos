<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AirlineReservation.aspx.cs" Inherits="WebSampleBrowser.Dashboard.AirlineReservation" %>

<%@ Register Assembly="Syncfusion.EJ.Web" Namespace="Syncfusion.JavaScript" TagPrefix="ej" %>
<%@ Register Assembly="Syncfusion.EJ.Web" Namespace="Syncfusion.JavaScript.Web" TagPrefix="ej" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ASP.NET Webforms | Showcase Sample | Airline Reservation</title>
    <meta name="description" content="An airline reservation application is used to book an air ticket from one place to another. This application was designed by using Essential JS1 ASP.NET controls."> 
    <link href="../Content/ejthemes/default-theme/ej.web.all.min.css" rel="stylesheet" />
    <link href="../Content/ejthemes/default-theme/default-responsive.css" rel="stylesheet" />

    <link href="../Content/AirlineReservation/sample.css" rel="Stylesheet" />
    <link rel="shortcut icon" href="~/Content/images/favicon.ico" />

    <!--[if lt IE 9]>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/jquery-1.11.3.min.js")%>' type="text/javascript"></script>
    <![endif]-->
    <!--[if gte IE 9]><!-->
    <script src='<%= Page.ResolveClientUrl("~/Scripts/jquery-3.4.1.min.js")%>' type="text/javascript"></script>
    <!--<![endif]-->
    <script src="../Scripts/jquery.globalize.min.js"></script>
    <script src="../Scripts/jsrender.min.js"></script>
    <script src="../Scripts/ej.web.all.min.js"></script>

    <script src="../Scripts/AirlineReservation/sample.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="scriptManager1" runat="server"></asp:ScriptManager>
        <div class="header">
            <h1>AIRLINE RESERVATION</h1>
        </div>

        <div class="sampleContainer">
            <table class="sampleOuterTable" cellspacing="15" style="width: 100%">
                <tr>
                    <td></td>
                    <td style="text-align: right; height: 40px;">
                        <input type="button" id="btnOpenPopup" class="bookNow" style="float: right;" value="Book Now" />
                        <%--<ej:Button ID ="btnOpenPopup" runat="server" Text="Book now" ClientSideOnClick="OpenPopup()"></ej:Button>--%>
                        <div style="height: 10px; width: 100%;"></div>
                    </td>
                </tr>
                <tr>
                    <td id="Property_space" style="width: 325px;">
                        <div style="padding-bottom: 85px;">
                            <div class="userInteractionDiv">
                                <table class="userInteractionTable">
                                    <tr>
                                        <td>
                                            <label>Travel Type</label><br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <div class="travelTypeDiv">
                                                <table>
                                                    <tr>
                                                        <td style="width: 80%;">
                                                            <label id="travelType"></label>
                                                        </td>
                                                        <td>
                                                            <ej:ToggleButton ID="btnOneWay" runat="server" ClientSideOnChange="btnOneWayChange" Size="Normal" ContentType="ImageOnly" DefaultPrefixIcon="e-icon"></ej:ToggleButton>
                                                            <ej:ToggleButton ID="btnRoundTrip" runat="server" ClientSideOnChange="btnRoundTripChange" Size="Normal" ContentType="ImageOnly" DefaultPrefixIcon="e-icon"></ej:ToggleButton>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>Adult</label></td>
                                        <td>
                                            <label>Child</label></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 100px">
                                            <div>
                                                <input type="button" id="adultDecrement" value="-" class="iconButton" />
                                                <input type="text" value="3" id="adultCount" onkeypress="return isNumber(event)" class="countBox" />
                                                <input type="button" id="adultIncrement" value="+" class="iconButton" />
                                            </div>
                                        </td>
                                        <td style="width: 100px">
                                            <div>
                                                <input type="button" id="childDecrement" value="-" class="iconButton" />
                                                <input type="text" value="2" id="childCount" onkeypress="return isNumber(event)" class="countBox" />
                                                <input type="button" id="childIncrement" value="+" class="iconButton" />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Leaving From</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <ej:Autocomplete ID="fromCityName" runat="server" EnableAutoFill="true" Width="100%" Value="Chennai"></ej:Autocomplete>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Going To</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <ej:Autocomplete ID="toCityName" runat="server" EnableAutoFill="true" Width="100%"></ej:Autocomplete>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>Departure</label></td>
                                        <td>
                                            <label>Return</label></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <ej:DatePicker runat="server" ID="depatureDatePicker"></ej:DatePicker>
                                        </td>
                                        <td>
                                            <ej:DatePicker runat="server" ID="returnDatePicker"></ej:DatePicker>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="height: 10px;"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <ej:Button ID="btnSearchFlight" runat="server" Text="SEARCH FOR FLIGHT" Type="Button" ShowRoundedCorner="true" ClientSideOnClick="btnSearchClick"></ej:Button>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="sliderDiv">
                                <table class="slideTable">
                                    <tr>
                                        <td>
                                            <label>Price Range</label></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <ej:Slider ID="priceRangeSlider" runat="server" Height="8px" SliderType="Range" Values="0,100" ClientSideOnCreate="onPriceRangecreate"
                                                ClientSideOnSlide="onPriceRangeSlide" ClientSideOnStart="onPriceRangeStart" ClientSideOnChange="onPriceRangechange">
                                            </ej:Slider>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div>
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <span id="minPrice"></span>
                                                        </td>
                                                        <td>
                                                            <span class="maxPriceSpan" style="margin-left: 201px;" id="maxPrice"></span>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>Departure Time</label><br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <ej:Slider ID="timeRangeSlider" runat="server" Height="8px" SliderType="Range" Values="0,100" ClientSideOnCreate="onTimeRangecreate"
                                                ClientSideOnSlide="onTimeRangeSlide" ClientSideOnStart="onTimeRangeStart" ClientSideOnChange="onTimeRangechange">
                                            </ej:Slider>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div>
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <span id="minTime"></span>
                                                        </td>
                                                        <td>
                                                            <span style="margin-left: 212px;" id="maxTime"></span>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </td>
                    <td id="gid_space" colspan="2" style="vertical-align: top;">
                        <ej:Grid ID="FlightTicketBooking" runat="server" AllowPaging="true" AllowSorting="true">
                            <ClientSideEvents ActionComplete="actionComplete" ActionBegin="actionBegin" Load="gridLoad" RecordClick="recordClick" />
                            <Columns>
                                <ej:Column Field="Airline" HeaderText="Airline" Width="30" />
                                <ej:Column Field="From" HeaderText="From" Width="30" />
                                <ej:Column Field="To" HeaderText="To" Width="30" />
                                <ej:Column Field="Depart" HeaderText="Depart" Width="30" />
                                <ej:Column Field="Arrive" HeaderText="Arrive" Width="30" />
                                <ej:Column Field="Price" HeaderText="Price" Width="30" Format="{0:C}" />
                                <ej:Column Field="Rating" HeaderText="Rating" Width="40" />
                            </Columns>
                        </ej:Grid>
                    </td>
                </tr>
            </table>
            <div id="footer">
                <div class="bottom-links">
                    <div class="left">
                        <div class="sync-text">
                            Copyright © 2001-2019 Syncfusion Inc.
                        </div>
                    </div>
                    <div class="right">
                        <a href="https://www.syncfusion.com">
                            <div class="syncfusion-image"></div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <ej:Dialog ID="diagramView" CssClass="zoom-anim-dialog mfp-hide" runat="server" ShowOnInit="false" EnableModal="true" Width="1000" Height="530">
            <DialogContent>
                <div id="backIcon" onclick="backButtonClick()" style=""></div>
                <div id="popupContent">
                    <table class="countIconTable">
                        <tr>
                            <td colspan="2" style="height: 15%;"></td>
                        </tr>
                        <tr>
                            <td id="ResItemBox" class="countIconColumn">
                                <div style="font-size: 12px;">
                                    Select your seat by dragging the passenger icon to any available seat.
                                </div>
                                <br />
                                <div>
                                    <span id="adultCountDisplay"></span>
                                    <div class="iconDiv">
                                        <div id="adultIconDisplay">
                                        </div>
                                    </div>
                                </div>
                                <br />
                                <div>
                                    <span id="childCountDisplay"></span>
                                    <div class="iconDiv">
                                        <div id="childIconDisplay">
                                        </div>
                                    </div>
                                </div>

                            </td>
                            <td id="DiagramArea">
                                <ej:Diagram ClientIDMode="Static" ID="diagramContent" runat="server" Height="100%" Width="100%">
                                    <PageSettings ScrollLimit="Diagram" />
                                </ej:Diagram>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 18px;"></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <input type="button" id="btnBookNow" value="Book Now" class="bookNow" style="margin-left: 525px;" />
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="bg_mask" style="margin-top: -163px; margin-left: 0px;">
                    <div id="frontlayer">
                        <span style="font-size: 17px">Your booking has been confirmed. </span>
                        <br />
                        <br />
                        <span style="font-size: 17px">Thanks for choosing our service</span><br />
                        <br />
                        <span style="color: #22BAF1; font-size: 22px;">Have a Great journey !</span><br />
                        <br />

                        <div>
                            <table>
                                <tr>
                                    <td>Rate this App</td>
                                    <td>
                                        <input type="text" id="airlineRating" class="rating" /></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </DialogContent>
        </ej:Dialog>
    </form>
</body>
</html>
