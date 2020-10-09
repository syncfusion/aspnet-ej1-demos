<%@ Page Title="NavigationDrawer-Default Functionalities-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to display a sliding panel and list of navigation options using the Syncfusion ASP.NET Web Forms Navigation Drawer component." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DefaultFunctionalities.aspx.cs" Inherits="WebSampleBrowser.NavigationDrawer.DefaultFunctionalities" %>

<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        #<%=navpane.ClientID%>{
            z-index: 99998 !important;
        }

        #<%=navpane.ClientID%>_Overlay {
            z-index: 99997 !important;
        }

        #<%=navpane.ClientID%>_listbox img.e-list-img {
            padding-right: 10px;
        }

        body {
            margin: 0;
            padding: 0;
        }

        .e-header {
            padding-top: 8px;
        }

        #container p {
            padding: 10px;
            text-align: justify;
        }

        #container {
            -moz-user-select: none;
            -webkit-user-select: none;
            -ms-user-select: none;
            user-select: none;
            position: relative;
            overflow: hidden;
            min-height: 451px;
        }

        .peopleimage {
            background: none no-repeat scroll center center / 100% 100% rgba(0, 0, 0, 0);
            height: 100px;
            margin: auto;
            width: 100px;
            border: 1px solid #737373;
			background-size: contain;
  		    background-repeat: no-repeat;
        }

        .profileimage {
            background: none no-repeat scroll center center / 100% 100% rgba(0, 0, 0, 0);
            height: 95px;
            border: 1px solid #b3b3b3;
            margin-right: 12px;
            width: 95px;
			background-size: contain;
  		    background-repeat: no-repeat;
        }

        .photoimage {
            background: none no-repeat scroll center center / 140px 120px rgba(0, 0, 0, 0);
            height: 125px;
            margin: auto;
            width: 125px;
			background-size: contain;
  		    background-repeat: no-repeat;
        }

        .locationimage {
            background: url("img/location.png") no-repeat scroll center center / 300px 200px rgba(0, 0, 0, 0);
            height: 230px;
            margin: auto;
            padding: 10px;
            width: 320px;
			background-size: contain;
  		    background-repeat: no-repeat;
        }

        .drawericon {
            background-position: center center;
            background-repeat: no-repeat;
            height: 32px;
            width: 32px;
            background-size: 100% 100%;
            padding-right: 10px;
        }

        #people td {
            border: 1px solid #9f9f9f;
            text-align: center;
            padding: 8px;
        }

        #photos td div {
            background-position: center center;
            background-size: 100% 100%;
            border: 1px solid #b3b3b3;
            margin-left: 7.6px;
        }

        .subpage {
            padding: 10px;
            text-align: justify;
            overflow-x: auto;
            overflow-y: auto;
        }

        #<%=navpane.ClientID%> .subpage {
            padding: 0px;
        }
         .drawericon:before{
			content: "\e76b";
            font-size: 28px;
            height:26px;
		}
        .htmljssamplebrowser.office-365 .e-nb .e-nb-listview.e-lv .e-list .e-list-img {
            padding-top: 12px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        $(function () {
            $(".e-lv").addClass("e-navigation");
        });
        function headChange(e) {
            $("#butdrawer").parent().children("h2").text(e.text);
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="row">
        <div class="cols-sample-area" style="padding: 0px; position: relative; margin: 0px; min-height: 451px; width: 100%;">
            <div>
                <div>
                    <div id="container">
                        <div class="e-lv">
                            <div class="e-header">
                                <div id="butdrawer" class="drawericon e-icon"></div>
                                <h2>Home</h2>
                            </div>
                        </div>
                        <div id="content_container"></div>
                        <div id="home" class="subpage">
                            <p>
                                The United Kingdom of Great Britain and Northern Ireland, commonly known as the United Kingdom (UK) and Britain, is a sovereign state located off the north-western coast of continental Europe. The country includes the island of Great Britain, the north-eastern part of the island of Ireland and many smaller islands. Northern Ireland is the only part of the UK that shares a land border with another state—the Republic of Ireland. Apart from this land border, the UK is surrounded by the Atlantic Ocean in the west and north, the North Sea in the east, the English Channel in the south and the Irish Sea in the west.
                            </p>
                        </div>
                        <div id="people" class="subpage">
                            <table cellpadding="5px">
                                <tbody>
                                    <tr>
                                        <td>
                                            <!--[if lt IE 9]>
										<div class="peopleimage" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader( src='../Content/images/Employees/1.png', sizingMethod='scale');"></div>
                                       <![endif]-->
                                            <!--[if IE 9]><!-->
                                            <div style="background-image: url('../Content/images/Employees/1.png')" class="peopleimage"></div>
                                            <!--<![endif]-->
                                            <span>Agatha Jessie</span>
                                        </td>
                                        <td>
                                            <!--[if lt IE 9]>
										<div class="peopleimage" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader( src='../Content/images/Employees/2.png', sizingMethod='scale');"></div>
                                       <![endif]-->
                                            <!--[if IE 9]><!-->
                                            <div style="background-image: url('../Content/images/Employees/2.png')" class="peopleimage"></div>
                                            <!--<![endif]-->
                                            <span>Andrew Philip</span>
                                        </td>
                                        <td>
                                            <!--[if lt IE 9]>
										<div class="peopleimage" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader( src='../Content/images/Employees/3.png', sizingMethod='scale');"></div>
                                       <![endif]-->
                                            <!--[if IE 9]><!-->
                                            <div style="background-image: url('../Content/images/Employees/3.png')" class="peopleimage"></div>
                                            <!--<![endif]-->
                                            <span>Lilly Thomas</span>
                                        </td>
                                        <td>
                                            <!--[if lt IE 9]>
										<div class="peopleimage" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader( src='../Content/images/Employees/4.png', sizingMethod='scale');"></div>
                                       <![endif]-->
                                            <!--[if IE 9]><!-->
                                            <div style="background-image: url('../Content/images/Employees/4.png')" class="peopleimage"></div>
                                            <!--<![endif]-->
                                            <span>Jaden Storm</span>
                                        </td>
                                        <td>
                                            <!--[if lt IE 9]>
										<div class="peopleimage" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader( src='../Content/images/Employees/5.png', sizingMethod='scale');"></div>
                                       <![endif]-->
                                            <!--[if IE 9]><!-->
                                            <div style="background-image: url('../Content/images/Employees/5.png')" class="peopleimage"></div>
                                            <!--<![endif]-->
                                            <span>Angel Christie</span>
                                        </td>
                                        <td>
                                            <!--[if lt IE 9]>
										<div class="peopleimage" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader( src='../Content/images/Employees/6.png', sizingMethod='scale');"></div>
                                       <![endif]-->
                                            <!--[if IE 9]><!-->
                                            <div style="background-image: url('../Content/images/Employees/6.png')" class="peopleimage"></div>
                                            <!--<![endif]-->
                                            <span>Joe Michael</span>
                                        </td>
                                        <td>
                                            <!--[if lt IE 9]>
										<div class="peopleimage" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader( src='../Content/images/Employees/7.png', sizingMethod='scale');"></div>
                                       <![endif]-->
                                            <!--[if IE 9]><!-->
                                            <div style="background-image: url('../Content/images/Employees/7.png')" class="peopleimage"></div>
                                            <!--<![endif]-->
                                            <span>Marie Luke</span>
                                        </td>
                                        <td>
                                            <!--[if lt IE 9]>
										<div class="peopleimage" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader( src='../Content/images/Employees/8.png', sizingMethod='scale');"></div>
                                       <![endif]-->
                                            <!--[if IE 9]><!-->
                                            <div style="background-image: url('../Content/images/Employees/8.png')" class="peopleimage"></div>
                                            <!--<![endif]-->
                                            <span>Magen Mia</span>
                                        </td>

                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div id="profile" class="subpage">
                            <table>
                                <tbody>
                                    <tr>
                                        <td>
                                            <!--[if lt IE 9]>
										<div class="peopleimage" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader( src='../Content/images/Employees/2.png', sizingMethod='scale');"></div>
                                       <![endif]-->
                                            <!--[if IE 9]><!-->
                                            <div style="background-image: url('../Content/images/Employees/2.png')" class="peopleimage"></div>
                                            <!--<![endif]-->
                                        </td>
                                        <td>
                                            <h2>Andrew Philip</h2>
                                            <span>Managing Director</span>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <br />
                            <span style="font-weight: bold">Profile</span><br>
                            <p>
                                Born on December 25, 1954, in Spokane, Washington. Philip graduated from Texas University in 1978. He started his career as a teacher.
							   Later he started business with his friend Paul. They both spent more time together working on business. They earned enough money and spent that for poor and social welfares. Later they together started an organization for children welfare.
                            </p>
                        </div>
                        <div id="photos" class="subpage">
                            <table>
                                <tbody>
                                    <tr>
                                        <td>
                                            <div style="background-image: url('../Content/images/navigationdrawer/photo/01.png')" class="photoimage"></div>
                                        </td>
                                        <td>
                                            <div style="background-image: url('../Content/images/navigationdrawer/photo/02.png')" class="photoimage"></div>
                                        </td>
                                        <td>
                                            <div style="background-image: url('../Content/images/navigationdrawer/photo/03.png')" class="photoimage"></div>
                                        </td>
                                        <td>
                                            <div style="background-image: url('../Content/images/navigationdrawer/photo/04.png')" class="photoimage"></div>
                                        </td>
                                        <td>
                                            <div style="background-image: url('../Content/images/navigationdrawer/photo/05.png')" class="photoimage"></div>
                                        </td>
                                        <td>
                                            <div style="background-image: url('../Content/images/navigationdrawer/photo/06.png')" class="photoimage"></div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div id="communities" class="subpage">
                            <h2>Product Breadth</h2>
                            <p>UI, reporting and business intelligence on any .NET platform, all from one vendor.</p>
                            <h2>No-Hassle Licensing</h2>
                            <p>No royalties, run-time, or server-deployment fees means no surprises.</p>
                            <h2>Uncompromising Quality</h2>
                            <p>An almost brutal QA process makes our products truly enterprise-quality.</p>
                            <h2>Outstanding Support</h2>
                            <p>Our team is in-house, accessible, and fast. The online forum, knowledge base, and Direct-Trac support system provide 24/7 access.</p>
                        </div>
                        <div id="location" class="subpage">
                            <div style="background-image: url('../Content/images/navigationdrawer/location.png')" class="locationimage"></div>
                        </div>
                    </div>
                    <ej:NavigationDrawer runat="server" ID="navpane" Direction="Left" Type="Overlay" EnableListView="true" TargetId="butdrawer" ContentId="content_container">
                        <ListViewSettings Width="300" SelectedItemIndex="0" PersistSelection="true" MouseUp="headChange" />
                        <Items>
                            <ej:NavigationDrawerItems ImageURL="../Content/images/navigationdrawer/home.png" Text="Home" Href="#home" ID="navhome" />
                            <ej:NavigationDrawerItems ImageURL="../Content/images/navigationdrawer/people.png" Text="People" Href="#people" ID="navpeople" />
                            <ej:NavigationDrawerItems ImageURL="../Content/images/navigationdrawer/profile.png" Text="Profile" Href="#profile" ID="navprofile" />
                            <ej:NavigationDrawerItems ImageURL="../Content/images/navigationdrawer/photo.png" Text="Photos" Href="#photos" ID="navphotos" />
                            <ej:NavigationDrawerItems ImageURL="../Content/images/navigationdrawer/communities.png" Text="Communities" Href="#communities" ID="navcommunities" />
                            <ej:NavigationDrawerItems ImageURL="../Content/images/navigationdrawer/locations.png" Text="Location" Href="#location" ID="navlocation" />
                        </Items>
                    </ej:NavigationDrawer>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

