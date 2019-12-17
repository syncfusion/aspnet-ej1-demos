<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AuditShowcase.aspx.cs" Inherits="WebSampleBrowser.Dashboard.AuditShowcase" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../Content/ej/ej.widgets.core.min.css" rel="stylesheet" />
    <link href="../Content/ejthemes/default-theme/ej.web.all.min.css" rel="stylesheet" />
    <link href="../Content/ejthemes/default-theme/default-responsive.css" rel="stylesheet" />
    <link href="../Content/ejthemes/ej.widgets.core.min.css" rel="stylesheet" />
    <link href="../Content/ejthemes/default-theme/ej.theme.min.css" rel="stylesheet" />
    <link href="../Content/AuditStyle.css" rel="stylesheet" />
    <!--[if lt IE 9]>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/jquery-1.11.3.min.js")%>' type="text/javascript"></script>
    <![endif]-->
    <!--[if gte IE 9]><!-->
    <script src='<%= Page.ResolveClientUrl("~/Scripts/jquery-3.4.1.min.js")%>' type="text/javascript"></script>
    <!--<![endif]-->
    <script src="../Scripts/jquery.globalize.min.js"></script>
    <script src="../Scripts/jsrender.min.js"></script>
    <script src="../Scripts/ej.web.all.min.js"></script>
    <script src="../Scripts/ej.webform.min.js"></script>
    <title>Essential Predictive Analytics</title>
    <meta name="description" content="This sample demonstrates how a PMML model is evaluated to compute the audit risk for an individual | ASP.NET"> 
    <link rel="shortcut icon" href="~/Content/images/favicon.ico">
</head>
<body style="background-color: #EBEBEB;">
    <div id="header">
        <span class="image">
            <img src="../Content/images/synclogo.png" alt="Syncfusion Logo" /></span>
        <span class="image text">Audit Prediction</span>
    </div>
    <form id="form1" runat="server">

        <div class="panelstyle">
            <div class="tablemargin">
                <table>
                    <tr class="titleDesc">
                        <td>This dataset consists of fictional clients who have been audited. For each case an outcome is recorded (whether the taxpayer's claims had to be
                        adjusted or not).
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Panel ID="LeftFieldPanel" CssClass="leftFields" runat="server">
                                <asp:Table ID="Table1" runat="server" CellPadding="7" HorizontalAlign="Left">
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <div class="spantext">Age</div>
                                            <ej:numerictextbox id="Age" runat="server" cssclass="textboxheight" value="24" width="200" minvalue="0" maxvalue="130"></ej:numerictextbox>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <div class="spantext">Gender</div>
                                            <ej:dropdownlist id="GenderCollection" runat="server" width="200" value="Male" cssclass="textboxheight">
                                            <Items>
                                                <ej:DropDownListItem Text="Male" Value="Male"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Female" Value="Female"></ej:DropDownListItem>
                                            </Items>
                                        </ej:dropdownlist>
                                        </asp:TableCell><asp:TableCell Width="20"></asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>

                                            <div class="spantext">Marital</div>
                                            <ej:dropdownlist id="MaritalCollection" runat="server" width="200" value="Absent" cssclass="textboxheight">
                                            <Items>
                                                <ej:DropDownListItem Text="Absent" Value="Absent"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Divorced" Value="Divorced"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Married" Value="Married"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Married-spouse-absent" Value="Married-spouse-absent"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Unmarried" Value="Unmarried"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Widowed" Value="Widowed"></ej:DropDownListItem>
                                            </Items>
                                        </ej:dropdownlist>
                                        </asp:TableCell>

                                    </asp:TableRow>

                                    <asp:TableRow>
                                        <asp:TableCell>

                                            <div class="spantext">Education</div>
                                            <ej:dropdownlist id="EducationCollection" runat="server" width="200" value="Associate" cssclass="textboxheight">
                                            <Items>
                                                <ej:DropDownListItem Text="Associate" Value="Associate"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Bachelor" Value="Bachelor"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="College" Value="College"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Doctorate" Value="Doctorate"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="HSgrad" Value="HSgrad"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Master" Value="Master"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Preschool" Value="Preschool"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Professional" Value="Professional"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Vocational" Value="Vocational"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Yr9" Value="Yr9"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Yr10" Value="Yr10"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Yr11" Value="Yr11"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Yr12" Value="Yr12"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Yr1t4" Value="Yr1t4"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Yr5t6" Value="Yr5t6"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Yr7t8" Value="Yr7t8"></ej:DropDownListItem>
                                            </Items>
                                        </ej:dropdownlist>
                                        </asp:TableCell>

                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>

                                            <div class="spantext">Employment</div>
                                            <ej:dropdownlist id="EmploymentCollection" runat="server" width="200" value="Consultant" cssclass="textboxheight">
                                            <Items>
                                                <ej:DropDownListItem Text="Consultant" Value="Consultant"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Private" Value="Private"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="PSFederal" Value="PSFederal"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="PSLocal" Value="PSLocal"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="PSState" Value="PSState"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="SelfEmp" Value="SelfEmp"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Volunteer" Value="Volunteer"></ej:DropDownListItem>
                                            </Items>
                                        </ej:dropdownlist>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </asp:Panel>

                            <asp:Panel ID="RightSidePanel" CssClass="rightFields" runat="server">
                                <asp:Table ID="Table3" runat="server" CellPadding="7" HorizontalAlign="Left">
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <div class="spantext">Occupation</div>

                                            <ej:dropdownlist datasourcecachingmode="ViewState" id="OccupationCollection" runat="server" width="200" value="Cleaner" cssclass="textboxheight">
                                            <Items>
                                                <ej:DropDownListItem Text="Cleaner" Value="Cleaner"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Clerical" Value="Clerical"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Executive" Value="Executive"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Farming" Value="Farming"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Home" Value="Home"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Machinist" Value="Machinist"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Military" Value="Military"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Professional" Value="Professional"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Protective" Value="Protective"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Repair" Value="Repair"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Sales" Value="Sales"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Service" Value="Service"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Support" Value="Support"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Transport" Value="Transport"></ej:DropDownListItem>
                                            </Items>
                                        </ej:dropdownlist>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>

                                            <div class="spantext">Hours</div>
                                            <ej:numerictextbox id="Hours" runat="server" cssclass="textboxheight" width="200" minvalue="0" value="12" enablestrictmode="true"></ej:numerictextbox>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>

                                            <div class="spantext">Income</div>
                                            <ej:numerictextbox id="Income" runat="server" value="10000" cssclass="textboxheight" width="200" minvalue="0" enablestrictmode="true"></ej:numerictextbox>
                                        </asp:TableCell><asp:TableCell Width="20" />
                                    </asp:TableRow>

                                    <asp:TableRow>
                                        <asp:TableCell>

                                            <div class="spantext">Deduction</div>
                                            <ej:numerictextbox id="Deduction" runat="server" value="1000" cssclass="textboxheight" width="200" minvalue="17" enablestrictmode="true"></ej:numerictextbox>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>

                                            <div class="spantext">Accounts</div>
                                            <ej:dropdownlist id="AccountsCollection" runat="server" width="200" value="Canada" cssclass="textboxheight">
                                            <Items>
                                                <ej:DropDownListItem Text="Canada" Value="Canada"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="China" Value="China"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Columbia" Value="Columbia"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Cuba" Value="Cuba"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Ecuador" Value="Ecuador"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="England" Value="England"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Fiji" Value="Fiji"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Germany" Value="Germany"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Greece" Value="Greece"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Guatemala" Value="Guatemala"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Service" Value="Service"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Hong" Value="Hong"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Hungary" Value="Hungary"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="India" Value="India"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Indonesia" Value="Indonesia"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Iran" Value="Iran"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Ireland" Value="Ireland"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Italy" Value="Italy"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Jamaica" Value="Jamaica"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Japan" Value="Japan"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Malaysia" Value="Malaysia"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Mexico" Value="Mexico"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="NewZealand" Value="NewZealand"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Nicaragua" Value="Nicaragua"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Philippines" Value="Philippines"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Poland" Value="Poland"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Portugal" Value="Portugal"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Scotland" Value="Scotland"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Singapore" Value="Singapore"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Taiwan" Value="Taiwan"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="UnitedStates" Value="UnitedStates"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Vietnam" Value="Vietnam"></ej:DropDownListItem>
                                                <ej:DropDownListItem Text="Yugoslavia" Value="Yugoslavia"></ej:DropDownListItem>
                                            </Items>
                                        </ej:dropdownlist>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div style="padding-left: 10px; padding-top: 15px; padding-right: 10%; box-sizing: border-box">
                                <asp:Button CssClass="fsSubmitButton" ID="Button1" Text="Predict, if Tax Adjustable?" runat="server" OnClick="Predict_Click" />
                            </div>
                        </td>
                    </tr>
                </table>
            </div>

            <asp:Panel ID="resultPanel" BackColor="White" runat="server">

                <div class="predictresultstyle">
                    <asp:Label Text="Predicted Result" ID="Predicted_Result" BorderColor="#bbbcbb" runat="server" />
                </div>
                <div class="hr_line">
                    <div id="hr"></div>
                </div>
                <div class="imageposition">
                    <asp:Image ID="imagePath" runat="server" BorderStyle="None" />
                </div>
                <div class="optionposition">
                    <asp:Label ID="option" runat="server" BorderStyle="None"></asp:Label>
                </div>
                <div class="textposition">
                    <asp:Label ID="text" runat="server" BorderStyle="None"></asp:Label>
                </div>
            </asp:Panel>
        </div>
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
        <div>
        </div>
    </form>
    <script type="text/javascript">
    </script>
</body>
</html>
