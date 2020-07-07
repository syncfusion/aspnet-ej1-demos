<%@ Page Title="Tab-Default Functionalities-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DefaultFunctionalities.aspx.cs" MetaDescription="This demo explains how to initialize the Syncfusion ASP.NET Web Forms Tab control." Inherits="WebSampleBrowser.Tab.DefaultFunctionalities" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
 <div class="controlframe">
    <ej:Tab ID="DefaulttabContent" runat="server">
        <Items>
            <ej:TabItem ID="steelman" Text="Man Of Steel">
                <ContentSection>
                    <div class="row">
                        <div class="col-xs-3 col-md-3">
                                <img src="../Content/images/rating/mos.png" alt="mos" />
                            </div>
                            <div class="col-xs-10 col-sm-4 col-md-6">
                                <div>
                                    <span class="movie-header">Man of Steel</span><br />
                                    <span>Movie Info:</span>
                                    <p>
                                        A young boy learns that he has extraordinary powers and is not of this Earth.
                                    </p>
                                </div>
                            </div>
                        </div>
                </ContentSection>
            </ej:TabItem>
            <ej:TabItem ID="woldwar" Text="World War Z">
                <ContentSection>
                    <div class="row">
                        <div class="col-xs-3 col-md-3">
                                <img src="../Content/images/rating/wwz.png" alt="mos" />
                          </div>
                            <div class="col-xs-10 col-sm-4 col-md-6">
                                <div>
                                    <span class="movie-header">World War Z</span><br />
                                    <br />
                                    <span>Movie Info:</span>
                                    <p>
                                        The story revolves around United Nations employee Gerry Lane (Pitt).
                                    </p>
                               </div>
                            </div>
                        </div>
                </ContentSection>
            </ej:TabItem>
            <ej:TabItem ID="university" Text="Monsters University">
                <ContentSection>
                     <div class="row">
                        <div class="col-xs-3 col-md-3">
                                <img src="../Content/images/rating/mu.png" alt="mos" />
                           </div>
                            <div class="col-xs-10 col-sm-4 col-md-6">
                                <div>
                                    <span class="movie-header">Monsters University</span><br />
                                    <br />
                                    <span>Movie Info:</span>
                                    <p>
                                        Mike Wazowski and James P. Sullivan are an inseparable pair, but that wasn't always
                                    the case.
                                    </p>
                              </div>
                            </div>
                        </div>
                </ContentSection>
            </ej:TabItem>
        </Items>
    </ej:Tab>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .movies-img {
            width: 125px;
             height: auto;
        }
        .movie-header {
            font-size: 20px;
            font-weight: 600;
        }

        .content-container-fluid .col-md-3 {
            float: left;
            padding-left: 0px !important;
            padding-right: 0px !important;
        }

        .col-xs-10 {
            width: 68.333333%;
        }
		@media (min-width: 1920px) {
	.row [class*="col-md-3"] {
		width: 25%;
		}
	}

    </style>
</asp:Content>

