<%@ Page Title="Rating-Default Functionalities-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="DefaultFunctionalities.aspx.cs" MetaDescription="This demo explains how to initialize a Syncfusion ASP.NET Web Forms Rating control." Inherits="WebSampleBrowser.Rating._default" %>



<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
   <div class="frame">
    <ej:Tab ID="moviesTab" runat="server">
        <Items>
            <ej:TabItem ID="steelMan" Text="Man Of Steel">
                <ContentSection>
                    <div class="row">
                        <div class="col-xs-3 col-md-3">
                                <img src="../Content/images/rating/mos.png" alt="mos" />
                            </div>
                            <div class="col-xs-10 col-sm-4 col-md-6">
                                <div>
                                    <span class="movie-header">Man of Steel</span><br />
                                    Rating :
                                    <br />
                                    <ej:Rating ID="Rating1" Value="4" runat="server"></ej:Rating>
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
                                    Rating :
                                <br />
                                    <ej:Rating ID="Rating2" Value="4" runat="server" CssClass="rating"></ej:Rating>
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
            <ej:TabItem ID="unive" Text="Monsters University">
                <ContentSection>
                     <div class="row">
                        <div class="col-xs-3 col-md-3">
                                <img src="../Content/images/rating/mu.png" alt="mos" />
                           </div>
                            <div class="col-xs-10 col-sm-4 col-md-6">
                                <div>
                                    <span class="movie-header">Monsters University</span><br />
                                    Rating :
                                <br />
                                    <ej:Rating ID="Rating3" Value="4" runat="server"></ej:Rating>
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
        .frame {
            width:60%;
        }
        .movie-header {
            font-size: 20px;
            font-weight: 600;
        }
		@media (min-width: 1920px) {
	.row [class*="col-md-3"] {
		width: 25%;
		}
	}

    </style>
</asp:Content>

