<%@ Page Title="SpellCheck-Multiple Target-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="MultipleTarget.aspx.cs" MetaDescription="This sampple showcases the multiple target spell checking support in a ASP.NET Web Forms SpellCheck" Inherits="WebSampleBrowser.SpellCheck.MultipleTarget" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">SpellChcek / Multiple Target</span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="content-container-fluid">
        <div class="row">
            <div id="TextArea">
                <div id="control1">
                    London, one of the most popular touist destinations in the world for a reason. A cultural and hisorical hub, London has an excellent public transportation system that allows visitors to see all the fantatic sights without spending a ton of money on a rental car.
                    London contains four World Heritage Sites.
                </div>
                <br />
                <textarea id="control2" style="width: 99.3%; height: 80px">
                    Paris, the city of lihts and love - this short guide is full of ideas for how to make the most of the romnticism that oozes from every one of its beautiful corners.You couldn't possibly visit Paris without seeing the Eiffel Tower.
                    Even if you do not want to visit this world famous structure, you will see its top from all over Paris.
                </textarea><br />
                <span id="control3">Rome, one of the world's most facinating cities. The old adage that Rome was not built in a day - and that you won't see it in one or even in three - is true. For the intrepid traveler who can keep pace, here is a list of must-sees.
                    But reember what the Romans say: Even a lifetime isn't enough to see Rome.
                </span>
                <br />
                <ej:SpellCheck ID="SpellCheck" ClientIDMode="Static" runat="server" ControlsToValidate="#control1,#control2,#control3" EnableValidateOnType="true"
                    TargetUpdating="onTargetUpdating" DialogClose="onDialogClose">
                    <DictionarySettings DictionaryUrl="../api/SpellCheck/CheckWords" CustomDictionaryUrl="../api/SpellCheck/AddToDictionary" />
                </ej:SpellCheck>
                <br />
                <div>
                    <ej:Button ID="btn_Multiple" Type="Button" ClientSideOnClick="showDialog" Text="Spell check using dialog" runat="server"></ej:Button>
                </div>
            </div>

        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        function showDialog() {
            var spellObj = $("#SpellCheck").data("ejSpellCheck");
            spellObj.showInDialog();
        }
        function onTargetUpdating(args) {
            onUpdate(args.previousElement);
            $(args.currentElement)[0].style.border = "thin solid blue";
        }
        function onDialogClose(args) {
            onUpdate(args.targetElement);
        }
        function onUpdate(element) {
            if (!ej.isNullOrUndefined(element)) {
                if ($(element)[0].attributes["id"].value === "control2")
                    $(element)[0].style.borderColor = "rgb(169, 169, 169)";
                else
                    $(element)[0].style.border = "none";
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="StyleSection" runat="server">
</asp:Content>

