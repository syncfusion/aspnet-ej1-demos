<%@ Page Title="Schedule-Time Scale-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example shows how to customize the timescale in the ASP.NET Web Scheduler." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="TimeScale.aspx.cs" Inherits="WebSampleBrowser.Schedule.TimeScale" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Schedule / TimeScale</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
<ej:Schedule ClientIDMode="Static" runat="server" ID="Schedule1" DataSourceID="SqlData" Width="100%" Height="525px" CurrentDate="6/5/2017">
    <TimeScale MinorSlotCount="5" MajorSlot="60" />
    <AppointmentSettings Id="Id" Subject="Subject" AllDay="AllDay" StartTime="StartTime" EndTime="EndTime" Description="Description" Recurrence="Recurrence" RecurrenceRule="RecurrenceRule"/>
    
</ej:Schedule>

    </div>
    <asp:SqlDataSource ID="SqlData" runat="server" ConnectionString="<%$ ConnectionStrings:ScheduleConnectionString %>"
            SelectCommand="SELECT * FROM [DefaultSchedule]"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        var obj;
        $(document).ready(function () {
            $("#sampleProperties").ejPropertiesPanel();
            obj = $("#Schedule1").data("ejSchedule");
        });

        function ChangeTime(args) {
            $("#Schedule1").ejSchedule({
                timeScale: {
                    minorSlotCount: parseInt($("#minorSlot").val()),
                    majorSlot: parseInt($("#majorSlot").val())
                }
                });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
            
            <div class="row">
                <div class="col-md-3">
                   minorSlotCount
                </div>
                <div class="col-md-3">
                    <ej:DropDownList  ClientIDMode="Static" runat="server" ID="minorSlot" Width="115px" SelectedItemIndex="4">
                        <Items>
                              <ej:DropDownListItem  Text="1" Value="1"/>
                            <ej:DropDownListItem  Text="2" Value="2"/>
                            <ej:DropDownListItem  Text="3" Value="3"/>
                            <ej:DropDownListItem  Text="4" Value="4"/>
                            <ej:DropDownListItem  Text="5" Value="5"/>
                            <ej:DropDownListItem  Text="6" Value="6"/>
                            <ej:DropDownListItem  Text="7" Value="7"/>
                            <ej:DropDownListItem  Text="8" Value="8"/>
                            <ej:DropDownListItem  Text="9" Value="9"/>
                            <ej:DropDownListItem  Text="10" Value="10"/>
                           
                           
                        </Items>
                    </ej:DropDownList>  
                </div>
            </div>
            <br />
               <div class="row">
                <div class="col-md-3">
                  MajorSlot
                </div>
                <div class="col-md-3">
                     <ej:DropDownList  ClientIDMode="Static" runat="server" ID="majorSlot" Width="115px" SelectedItemIndex="0">
                        <Items>
                           <ej:DropDownListItem  Text="60" Value="60"/>
                            <ej:DropDownListItem  Text="30" Value="30"/>
                            <ej:DropDownListItem  Text="20" Value="20"/>
                            <ej:DropDownListItem  Text="10" Value="10"/>
                            <ej:DropDownListItem  Text="12" Value="12"/>
                            <ej:DropDownListItem  Text="6" Value="6"/>
                            <ej:DropDownListItem  Text="5" Value="5"/>
                            <ej:DropDownListItem  Text="120" Value="120"/>
                            <ej:DropDownListItem  Text="240" Value="240"/>
                            <ej:DropDownListItem  Text="480" Value="480"/>
                           
                        </Items>
                    </ej:DropDownList>  
                </div>
            </div>
          <br />
            <div class="row">
                <div class="col-md-3">
                  <ej:Button ClientIDMode="Static" Type="Button" ID="BtnSubmit" runat="server" Text="Submit" ClientSideOnClick="ChangeTime"></ej:Button>
                 </div>
            </div>
        </div>
    </div>
</asp:Content>

