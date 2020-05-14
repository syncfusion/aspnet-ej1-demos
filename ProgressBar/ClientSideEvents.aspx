<%@ Page Language="C#" Title="ProgressBar-Client-Side Events-ASP.NET-SYNCFUSION" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="ClientSideEvents.aspx.cs" MetaDescription="This sample demonstrates the various client side events like create, start, change and complete in a ASP.NET Web Forms ProgressBar." Inherits="WebSampleBrowser.ProgressBar.ClientSideEvents" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <div id="progressBar"></div>
            <div>
                <ej:ProgressBar ID="ProgressBar1" ClientSideOnChange="onchange" ClientSideOnStart="onstart" ClientSideOnComplete="completed" ClientSideOnCreate="oncreate" runat="server" Height="2px" Value="10"></ej:ProgressBar>
            </div>
        </div>
        <div class="startButton">
            <ej:ToggleButton ID="startButton" Type="Button" Size="Small" DefaultText="Start" ActiveText="Pause" ClientSideOnClick="startProcess" runat="server">
            </ej:ToggleButton>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="EventSection" runat="server">
    <div class="cols-prop-area event-tracer">
        <div>
            <div class="heading">
                <span>Event Trace</span>
                <div class="pull-right">
                    <ej:DropDownList ID="selectControls" ClientSideOnPopupShown="adjustpopupposition" ClientSideOnCheckChange="evtpropscheckedevent" ShowCheckbox="true" CheckAll="true" runat="server">
                        <Items>
                            <ej:DropDownListItem Value="start" Text="start"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="complete" Text="complete"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="create" Text="create"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="change" Text="change"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            <div class="prop-grid content">
                <div class="eventarea">
                    <div class="EventLog" id="EventLog">
                    </div>
                </div>
                <div class="evtbtn">
                    <ej:Button ID="Clear" Type="Button" Text="Clear" ClientSideOnClick="onClear" CssClass="eventclear e-btn" runat="server"></ej:Button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        var progresObj, buttonObj, k = 10, timer = window.clearInterval(timer), showComplete = true;

        $(function () {
            progresObj = $("#<%=ProgressBar1.ClientID%>").data("ejProgressBar");
              progresObj.setModel({ text: progresObj.getPercentage() + " %" });
              $(progresObj.element).find("div.e-progress-txt").css("left", progresObj.getPercentage() - 1 + "%");
          });

          function evtpropscheckedevent(args) {
              if (args.isChecked) {
                  switch (args.model.itemValue) {
                      case "start": progresObj.option(args.data.itemValue, "onstart"); break;
                      case "change": progresObj.option(args.data.itemValue, "onchange"); break;
                      case "complete": showComplete = true; break;
                  }
              }
              else if (args.data.itemValue == "complete") {
                  showComplete = false;
              }
              else
                  progresObj.option(args.data.itemValue, null)
          }

          function startProcess(args) {
              buttonObj = $("#<%=startButton.ClientID%>").data("ejToggleButton");
              progresObj = $("#<%=ProgressBar1.ClientID%>").data("ejProgressBar");
              if (args.isChecked)
                  timer = window.setInterval(draw, 100);
              else {
                  buttonObj.setModel({ "defaultText": "Start" });
                  timer = window.clearInterval(timer);
              }
          }
          function draw() {
              progresObj = $("#<%=ProgressBar1.ClientID%>").data("ejProgressBar");
              progresObj.option("text", ++k + " %");
              progresObj.option("percentage", k);
              if (progresObj.getPercentage() != 100)
                  $(progresObj.element).find("div.e-progress-txt").css("left", progresObj.getPercentage() - 1 + "%");
          }
          function completed(args) {
              progresObj.option("text", "100%");
              $(progresObj.element).find("div.e-progress").css("width", "101%");
              $(this.element.find("div.e-progress-txt")).css("left", "45%");
              timer = window.clearInterval(timer);
              k = 0;
              if (showComplete)
                  jQuery.addEventLog("The process has been <span class='eventTitle'>completed</span> successfully.</br>");
              buttonObj.setModel({ "toggleState": false, "defaultText": "Restart" });
          }
          function oncreate(args) {
              jQuery.addEventLog("Progressbar has been <span class='eventTitle'>created</span>.");
          }
          function onstart(args) {
              jQuery.addEventLog("Progressbar has been <span class='eventTitle'>started</span>.</br>");
          }
          function onchange(args) {
              jQuery.addEventLog("Progressbar value has been <span class='eventTitle'>changed</span> to " + args.percentage + "%.</br>");
          }
          function onClear() {
              jQuery.clearEventLog();
          }
    </script>

</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
         .frame {
            width: 50%;
        }
        .e-progressbar{
            height:2px !important;
        }
       .e-progressbar .e-progress-txt{          
            background-color: white;
            height: 6px;
            line-height:6px;            
            width: 35px;  
            position:absolute;          
        }
	.darktheme .e-progressbar .e-progress-txt {
            background-color: black;
         }
        .e-progressbar .e-progress{            
            height: 3px;
            margin: -1px;
            position:absolute;
        }
        .startButton {
            text-align:center;
            padding:10px;
            margin-top:9px;
        }
    </style>
</asp:Content>

