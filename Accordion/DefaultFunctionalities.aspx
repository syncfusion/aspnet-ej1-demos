<%@ Page Language="C#" Title="Default Functionalities of ASP.NET Accordion control | Syncfusion" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="DefaultFunctionalities.aspx.cs" MetaDescription="This sample demonstrates initializing a simple Syncfusion ASP.NET Web Accordion control." Inherits="WebSampleBrowser.Accordion.DefaultFunctionalities" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
     <div class="controlframe">
    <ej:Accordion ID="DefaultAccordion" runat="server" SelectedItemIndex="0" ShowRoundedCorner="True">
        <Items>
            <ej:AccordionItem Text="Inbox">
                <ContentSection>
                    <div class="emp-list">
                        <img src="../Content/Images/Employees/3.png" alt="employee" />
                        <div class="time-panel">7:30</div>
                        <b class="headername">Catriona</b><br />
                        All WinRT controls are optimized for touch, supporting common gestures: zooming, panning, selecting, double-tapping, rotating, resizing.
                    </div>
                    <div class="emp-list">
                        <img src="../Content/Images/Employees/6.png" alt="employee" />
                        <div class="time-panel">5:33</div>
                        <b class="headername">John Linden</b><br />
                        All the components in the ASP.NET MVC have been built from the ground up with performance in mind and are extremely lightweight.
                    </div>
                    <div class="emp-list">
                        <img src="../Content/Images/Employees/8.png" alt="employee" />
                        <div class="time-panel">2:10</div>
                        <b class="headername">Louis</b><br />
                        Big data is a broad term for data sets so large or complex that traditional data processing applications are inadequate. Challenges include analysis, capture, data curation, search, sharing, storage, transfer, visualization, querying and information privacy.
                    </div>
                </ContentSection>
            </ej:AccordionItem>
            <ej:AccordionItem Text="Sent">
                <ContentSection>
                    <div class="emp-list">
                        <img src="../Content/Images/Employees/8.png" alt="employee" />
                        <div class="time-panel">3:55</div>
                        <b class="headername">Louis</b><br />
                       Big data is a broad term for data sets so large or complex that traditional data processing applications are inadequate. Challenges include analysis, capture, data curation, search, sharing, storage, transfer, visualization, querying and information privacy.
                    </div>
                    <div class="emp-list">
                        <img src="../Content/Images/Employees/6.png" alt="employee" />
                        <div class="time-panel">6:47</div>
                        <b class="headername">John Linden</b><br />
                      Cloud computing, also known as 'on-demand computing', is a kind of Internet-based computing, where shared resources, data and information are provided to computers and other devices on-demand.
                    </div>
                </ContentSection>
            </ej:AccordionItem>
            <ej:AccordionItem Text="Trash">
                <ContentSection>
                    <div class="emp-list">
                        <img src="../Content/Images/Employees/3.png" alt="employee" />
                        <div class="time-panel">8:30</div>
                        <b class="headername">Catriona</b><br />
                        With our sophisticated support system, built from the ground up to support all type of customers, you will have a streamlined experience working with our support team.
                    </div>
                </ContentSection>
            </ej:AccordionItem>
        </Items>
    </ej:Accordion>
         </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        #LayoutSection_ControlsSection_DefaultAccordion img {
            float: left;
            height: 40px;
            padding-right: 6px;
        }

        .emp-list {
            border-bottom: 1px solid #BBBCBB;
            margin-bottom: 9px;
            padding-bottom: 9px;
        }

            .emp-list:last-child {
                border-bottom: none;
                padding-bottom: 0;
            }

        .time-panel {
            float: right;
            color: #2382C3;
        }

        .headername {
            font-size: 16px;
            font-weight: 600;
        }
    </style>
</asp:Content>

