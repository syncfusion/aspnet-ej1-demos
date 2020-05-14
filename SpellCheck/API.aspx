<%@ Page Title="SpellCheck-API's-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="API.aspx.cs" MetaDescription="This example demonstrates the properties and its functionalities in a ASP.NET Web Forms SpellCheck" Inherits="WebSampleBrowser.SpellCheck.API" %>


<asp:Content ID="Content4" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">SpellChcek / API's</span>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="content-container-fluid">
        <div class="row">
            <div class="cols-sample-area">
                <div id="TextArea" contenteditable="true">
                    Amazon.com, Inc., often refered to as simply Amazon, is an American electronic commerce and cloud computing company with headquarters in Seattle, Washington. It is the largest web-based retailer in the United States. Amazon.com started as bookstore on the web, later diversifying to sell DVDs, Blu-rays, CDs, video downloads/streaming, MP3 downloads/streaming, audiobook downloads/streaming, software, video games, electronics, apparel, furniture, food, toys and jewelry. The company also produces consumer electronics—notably, Amazon Kindle e-book readers, Fire tablets, Fire TV and Fire Phone—and is the world's largest provider of cloud infrastructure services (IaaS). Amazon also sells certain low-end products like USB cables under its in-house brand AmazonBasics. Amazon has separate retail websites for United States, United Kingdom and Ireland, France, Canada, Germany, Italy, Spain, Netherlands, Australia, Brazil, Japan, China, India and Mexico. Amazon also offers international shipping to cetain other countries for some of its products.
                </div>
                <div>
                    <ej:Button ID="btn_Context" Type="Button" ClientSideOnClick="showInContextMenu" Text="Spell check" runat="server"></ej:Button>
                </div>                
            </div>
            <ej:SpellCheck ID="SpellCheck" ClientIDMode="Static" runat="server" ControlsToValidate="#TextArea">
                <DictionarySettings DictionaryUrl="../api/SpellCheck/CheckWords" CustomDictionaryUrl="../api/SpellCheck/AddToDictionary" />
            </ej:SpellCheck>
            <div id="sampleProperties">
                <div class="prop-grid">
                    <div class="row">
                        <div class="col-md-3 aligntop">MisspellWordCss</div>
                        <div class="col-md-3">
                            <select name="selectIndex" class="e-ddl" id="misspellWordCss">
                                <option value="errorword">Highlight1</option>
                                <option value="highlighter">Highlight2</option>
                                <option value="e-errorword">Highlight3</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">Ignore AlphaNumeric Words</div>
                        <div class="col-md-3">
                            <input type="checkbox" class="nodetext" id="ignoreAlphaNumericWords" />
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-3">Ignore UpperCase</div>
                        <div class="col-md-3">
                            <input type="checkbox" class="nodetext" id="ignoreUpperCase" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">Ignore MixedCase Words</div>
                        <div class="col-md-3">
                            <input type="checkbox" class="nodetext" id="ignoreMixedCaseWords" />
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-3">Ignore Url</div>
                        <div class="col-md-3">
                            <input type="checkbox" class="nodetext" id="ignoreUrl" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">Ignore FileNames</div>
                        <div class="col-md-3">
                            <input type="checkbox" class="nodetext" id="ignoreFileNames" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">Ignore Email Address</div>
                        <div class="col-md-3">
                            <input type="checkbox" class="nodetext" id="ignoreEmailAddress" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">Maximum Suggestion Count</div>
                        <div class="col-md-3">
                            <input type="text" id="maxSuggestionCount" value="maxSuggestionCount" />
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-3">Ignore Words</div>
                        <div class="col-md-2" style="width: 25%">
                            <input type="text" id="ignoreWordsDropDown" class="e-togglebtn" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        var target;
        var ignoreWordsData = [
                { word: "audiobook" }, { word: "Blu" }, { word: "DVDs" }
        ];

        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
            $("#misspellWordCss").ejDropDownList({ selectedItemIndex: 2, select: "changeErrorHighlight", width: "110px" });
            $("#ignoreAlphaNumericWords").ejCheckBox({ change: "ignoreAlphaNumericWords", checked: true });
            $("#ignoreUpperCase").ejCheckBox({ change: "ignoreUpperCase", checked: true });
            $("#ignoreUrl").ejCheckBox({ change: "ignoreUrl", checked: true });
            $("#ignoreMixedCaseWords").ejCheckBox({ change: "ignoreMixedCaseWords", checked: true });
            $("#ignoreFileNames").ejCheckBox({ change: "ignoreFileNames", checked: true });
            $("#ignoreEmailAddress").ejCheckBox({ change: "ignoreEmailAddress", checked: true });
            $("#maxSuggestionCount").ejNumericTextbox({ name: "maxSuggestionCount", minValue: 0, value: 6, width: 110, change: "maxSuggestionChange" });
            $("#ignoreWordsDropDown").ejDropDownList({
                dataSource: ignoreWordsData,
                fields: { text: "word" },
                watermarkText: "Select your ignore words",
                showCheckbox: true,
                width: "100%",
                change: "addIgnoreWords"
            });

            var spellObj = $("#SpellCheck").data("ejSpellCheck");
            spellObj.validate();
            if (ej.browserInfo().name === "msie")
                document.execCommand("AutoUrlDetect", false, false);
        });
        function changeErrorHighlight(args) {
            $("#SpellCheck").ejSpellCheck({ misspellWordCss: args.value });
        }
        function ignoreAlphaNumericWords(args) {
            $("#SpellCheck").ejSpellCheck({ ignoreSettings: { ignoreAlphaNumericWords: args.isChecked } });
        }
        function ignoreUrl(args) {
            $("#SpellCheck").ejSpellCheck({ ignoreSettings: { ignoreUrl: args.isChecked } });
        }
        function ignoreUpperCase(args) {
            $("#SpellCheck").ejSpellCheck({ ignoreSettings: { ignoreUpperCase: args.isChecked } });
        }
        function ignoreMixedCaseWords(args) {
            $("#SpellCheck").ejSpellCheck({ ignoreSettings: { ignoreMixedCaseWords: args.isChecked } });
        }
        function ignoreFileNames(args) {
            $("#SpellCheck").ejSpellCheck({ ignoreSettings: { ignoreFileNames: args.isChecked } });
        }
        function ignoreEmailAddress(args) {
            $("#SpellCheck").ejSpellCheck({ ignoreSettings: { ignoreEmailAddress: args.isChecked } });
        }
        function addIgnoreWords(args) {
            $("#SpellCheck").ejSpellCheck({ ignoreWords: !ej.isNullOrUndefined(args.model.value) ? args.model.value.split(",") : [] });
        }
        function maxSuggestionChange(args) {
            $("#SpellCheck").ejSpellCheck({ maxSuggestionCount: args.value });
        }
        function showInContextMenu() {
            var spellObj = $("#SpellCheck").data("ejSpellCheck");
            spellObj.validate();
        }
    </script>
    <style>
        .errorword {
            color: red;
        }

        .highlighter {
            color: blue;
        }

        #TextArea {
            padding-bottom: 15px;
        }
    </style>
</asp:Content>

