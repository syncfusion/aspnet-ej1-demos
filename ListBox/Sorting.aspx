<%@ Page Title="ListBox-Sorting-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to sort items in either ascending or descending order in the Syncfusion ASP.NET Web Forms ListBox component." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Sorting.aspx.cs" Inherits="WebSampleBrowser.ListBox.Sorting" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="control listbox" style="display:none">
        <div class="frame">
             <div class="grouplist">
           <span class="txt">Select a skill</span>
            <ej:ListBox ID="skillSetList" runat="server" DataTextField="skill" SortOrder="None" ClientSideOnCreate="OnCreated"></ej:ListBox>
            </div>
             <div class="grouplist">
                 <span class="txt">Select vegetables</span>
                 <ej:ListBox ID="groupData" runat="server" DataTextField="skill" DataGroupBy="category" SortOrder="None" ></ej:ListBox>
            </div>
       </div>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
    .grouplist {
            display: inline-block;
        }

        .txt {
            display: block;
            font-weight: 600;
            padding-bottom: 12px;
        }

    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">Choose sorting type</div>
                <div class="col-md-3">
                    <ej:DropDownList ID="dropdwn" Width="120" SelectedItemIndex="0" ClientSideOnChange="onValueChange" runat="server">
                        <Items>
                             <ej:DropDownListItem Text="None" Value="None"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Ascending" Value="Ascending"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Descending" Value="Descending"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>

        </div>
    </div>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript" class="jsScript">
        function onValueChange(args) {
            SortingOrder = $('#<%=skillSetList.ClientID%>').data("ejListBox");
            SortingOrderGrp = $('#<%=groupData.ClientID%>').data("ejListBox");
            switch (args.value) {
                case "Descending":
                    $('#<%=skillSetList.ClientID%>').ejListBox({
                        fields: { text: "skill"},
                        sortOrder: ej.SortOrder.Descending
                    });
                    $('#<%=groupData.ClientID%>').ejListBox({
                        fields: { text: "skill", groupBy: "category" },
                        sortOrder: ej.SortOrder.Descending
                       });
                    break;
                case "Ascending":
                    $('#<%=skillSetList.ClientID%>').ejListBox({
                        fields: { text: "skill" },
                        sortOrder: ej.SortOrder.Ascending
                    });
                    $('#<%=groupData.ClientID%>').ejListBox({
                        fields: { text: "skill", groupBy: "category" },
                        sortOrder: ej.SortOrder.Ascending
                    });
                    break;
                   case "None":
                       $('#<%=skillSetList.ClientID%>').ejListBox({
                           fields: { text: "skill"},
                           sortOrder: ej.SortOrder.None
                       });
                       $('#<%=groupData.ClientID%>').ejListBox({
                           fields: { text: "skill", groupBy: "category" },
                           sortOrder: ej.SortOrder.None
                       });
                       break;
            }
        }
        function OnCreated() {
    if (document.body.firstElementChild.className = "htmljssamplebrowser material"){
        setTimeout(function () {
                    var obj1 = $("#<%=skillSetList.ClientID%>").ejListBox("instance");
                    obj1._refreshScroller();
                    var obj2 = $("#<%=groupData.ClientID%>").ejListBox("instance");
                    obj2._refreshScroller();
                }, 800);
            }
            setTimeout(function () {
                $(".listbox").css("display", "block");
            }, 300);
        }
         $(function () {
             $("#sampleProperties").ejPropertiesPanel();
         });
    </script>

</asp:Content>

