<%@ Page Language="C#" Title="Tab / Tab Wizard" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="TabWizard.aspx.cs" Inherits="WebSampleBrowser.Tab.TabWizard" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <%--<div style="margin: 0px auto; width: 83%;">--%>

    <span class="sbtxt">Ticket Pundit</span>
    <ej:Tab ID="wizardTab" runat="server" Width="800px" HeightAdjustMode="Auto">
        <Items>
            <ej:TabItem ID="Search" Text="Search" ImageCssClass="e-icon e-wiz1">
                <ContentSection>
                    <div class="tab-title">
                        <h4>SEARCH TRAIN 
                        </h4>
                    </div>
                    <div class="frame-tab">
                        <table>
                            <tr>
                                <td class="wizAlign">From
                                </td>
                                <td class="wizAlign" style="padding-left: 27px;">To
                                </td>
                            </tr>
                            <tr>
                                <td class="wizAlign">
                                    <ej:Autocomplete ID="startpoint" FilterType="StartsWith" HighlightSearch="true" runat="server" Width="235px" DataTextField="Text" DataUniqueKeyField="ID" />
                                </td>
                                <td class="wizAlign" style="padding-left: 27px;">
                                    <ej:Autocomplete ID="endpoint" runat="server" FilterType="StartsWith" HighlightSearch="true" Width="235px" DataTextField="Text" DataUniqueKeyField="ID" />
                                </td>
                            </tr>
                            <tr>
                                <td class="wizAlign">Journey date
                                </td>
                                <td class="wizAlign" style="padding-left: 27px;">Ticket Type
                                </td>
                            </tr>
                            <tr>
                                <td class="wizAlign">
                                    <ej:DatePicker ID="journeydate" runat="server" Width="235px">
                                    </ej:DatePicker>
                                </td>
                                <td class="wizAlign" style="padding-left: 27px;">
                                    <ej:DropDownList ID="tickettype" runat="server" Width="235px" WatermarkText="Select ticket type">
                                        <Items>
                                            <ej:DropDownListItem Text="First Class" Value="First Class"></ej:DropDownListItem>
                                            <ej:DropDownListItem Text="Second Class" Value="Second Class"></ej:DropDownListItem>
                                            <ej:DropDownListItem Text="Common Class" Value="Common Class"></ej:DropDownListItem>
                                            <ej:DropDownListItem Text="Soft" Value="Soft"></ej:DropDownListItem>
                                        </Items>
                                    </ej:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="wizAlign"><span id="tab1_err"></span>
                                </td>
                                <td class="wizAlign nextTab" style="margin-right: 5px;">
                                    <ej:Button runat="server" ID="searchTrain" Type="Reset" Text="Go" Size="Small" ShowRoundedCorner="true" ClientSideOnClick="TabNavigations">
                                    </ej:Button>
                                </td>
                            </tr>
                        </table>
                    </div>
                </ContentSection>
            </ej:TabItem>
            <ej:TabItem ID="Train" Text="Train" ImageCssClass="e-icon e-wiz2">
                <ContentSection>
                    <div class="tab-title1">
                        <h4>SELECT TRAIN 
                        </h4>
                    </div>
                    <ej:Grid ID="TrainAvailability" runat="server">
                        <columns>
                            <ej:Column Field="TrainNo" HeaderText="Train No" Width="75" />
                            <ej:Column Field="TrainName" HeaderText="Train Name" Width="150" />
                            <ej:Column Field="Depature" HeaderText="Depature" Width="140" />
                            <ej:Column Field="Arrival" HeaderText="Arrival" Width="155" />
                            <ej:Column Field="Availability" HeaderText="Availability" Width="100" />
                        </columns>
                        <clientsideevents recordclick="selectedTrain" />
                    </ej:Grid>
                    <br />
                    <div style="height: 40px">
                        <div style="float: left; padding-left: 500px;">
                            <ej:Button runat="server" ID="gotosearch" Text="Back" Type="Reset" Size="Small" ShowRoundedCorner="true" ClientSideOnClick="TabNavigations">
                            </ej:Button>
                        </div>
                        <div style="float: right; width: 19%">
                            <ej:Button runat="server" ID="booktickets" Text="Continue" Type="Reset" Size="Small" ShowRoundedCorner="true" ClientSideOnClick="TabNavigations">
                            </ej:Button>
                        </div>
                        <span id="tab2_err" style="margin-left: 60px;"></span>
                    </div>
                </ContentSection>
            </ej:TabItem>
            <ej:TabItem ID="Passenger" Text="Passenger" ImageCssClass="e-icon e-wiz3">
                <ContentSection>
                    <div class="tab-title1">
                        <h4>PASSENGER DETAILS 
                        </h4>
                    </div>
                    <div id="PassengersList">
                        <table id="Table1">
                            <colgroup>
                                <col />
                                <col />
                                <col />
                                <col />
                                <col />
                                <col />
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>Name
                                    </th>
                                    <th>Age
                                    </th>
                                    <th>Gender
                                    </th>
                                    <th>Berth Preference
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="pass_name1" runat="server" Width="180px" Height="24px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="pass_age1" runat="server" Width="60px" Height="24px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <ej:DropDownList ID="pass_gender1" runat="server" DataIdField="ID" DataTextField="GText" Width="110px"></ej:DropDownList>
                                    </td>
                                    <td>
                                        <ej:DropDownList ID="pass_berth1" runat="server" DataIdField="ID" DataTextField="BerthPref" Width="125px"></ej:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="pass_name2" runat="server" Width="180px" Height="24px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="pass_age2" runat="server" Width="60px" Height="24px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <ej:DropDownList ID="pass_gender2" runat="server" DataIdField="ID" DataTextField="GText" Width="110px"></ej:DropDownList>
                                    </td>
                                    <td>
                                        <ej:DropDownList ID="pass_berth2" runat="server" DataIdField="ID" DataTextField="BerthPref" Width="125px"></ej:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="pass_name3" runat="server" Width="180px" Height="24px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="pass_age3" runat="server" Width="60px" Height="24px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <ej:DropDownList ID="pass_gender3" runat="server" DataIdField="ID" DataTextField="GText" Width="110px"></ej:DropDownList>
                                    </td>
                                    <td>
                                        <ej:DropDownList ID="pass_berth3" runat="server" DataIdField="ID" DataTextField="BerthPref" Width="125px"></ej:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="pass_name4" runat="server" Width="180px" Height="24px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="pass_age4" runat="server" Width="60px" Height="24px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <ej:DropDownList ID="pass_gender4" runat="server" DataIdField="ID" DataTextField="GText" Width="110px"></ej:DropDownList>
                                    </td>
                                    <td>
                                        <ej:DropDownList ID="pass_berth4" runat="server" DataIdField="ID" DataTextField="BerthPref" Width="125px"></ej:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="pass_name5" runat="server" Width="180px" Height="24px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="pass_age5" runat="server" Width="60px" Height="24px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <ej:DropDownList ID="pass_gender5" runat="server" Width="110px" DataIdField="ID" DataTextField="GText"></ej:DropDownList>
                                    </td>
                                    <td>
                                        <ej:DropDownList ID="pass_berth5" runat="server" Width="125px" DataIdField="ID" DataTextField="BerthPref"></ej:DropDownList>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <br />
                    <div style="height: 40px">
                        <div style="float: left; padding-left: 500px;">
                            <ej:Button runat="server" ID="gobacktobook" Text="Back" Type="Reset" Size="Small" ShowRoundedCorner="true" ClientSideOnClick="TabNavigations">
                            </ej:Button>
                        </div>
                        <div style="float: right; width: 19%">
                            <ej:Button runat="server" ID="confirmtickets" Text="Continue" Type="Reset" Size="Small" ShowRoundedCorner="true" ClientSideOnClick="TabNavigations">
                            </ej:Button>
                        </div>
                        <span id="tab3_err" style="margin-left: 60px;"></span>
                    </div>
                </ContentSection>
            </ej:TabItem>
            <ej:TabItem ID="PaymentDetails" Text="Payment" ImageCssClass="e-icon e-wiz4">
                <ContentSection>
                    <div class="tab-title1">
                        <h4>TICKET DETAILS 
                        </h4>
                    </div>
                    <ej:Grid ID="TicketConfirmation" runat="server">
                        <columns>
                            <ej:Column Field="TrainNo" HeaderText="Train No" Width="75" />
                            <ej:Column Field="PassName" HeaderText="Name" Width="170" />
                            <ej:Column Field="Gender" HeaderText="Gender" Width="160" />
                            <ej:Column Field="CoachNo" HeaderText="Wagon" Width="165" />
                            <ej:Column Field="SeatNo" HeaderText="Seat No" Width="88" />
                        </columns>
                    </ej:Grid>
                    <br />
                    <div style="height: 40px">
                        <div style="float: left; padding-left: 500px;">
                            <ej:Button runat="server" ID="gobacktodetails" Text="Back" Type="Reset" Size="Small" ShowRoundedCorner="true" ClientSideOnClick="TabNavigations">
                            </ej:Button>
                        </div>
                        <div style="float: right; width: 19%">
                            <ej:Button runat="server" ID="payment" Text="Pay" Size="Small" Type="Reset" ShowRoundedCorner="true" ClientSideOnClick="TabNavigations">
                            </ej:Button>
                        </div>
                    </div>
                </ContentSection>
            </ej:TabItem>
        </Items>
    </ej:Tab>
    <%--</div>--%>
</asp:Content>
<asp:Content ContentPlaceHolderID="ScriptSection" ID="section2" runat="server">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/Tab/jsonTabWiz.min.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/Tab/TabWizard.js")%>' type="text/javascript"></script>
</asp:Content>
<asp:Content ID="section3" runat="server" ContentPlaceHolderID="StyleSection">
    <link href="../Content/Tab/TabWizard.css" rel="stylesheet" />
</asp:Content>
