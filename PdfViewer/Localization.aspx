<%@ Page Title="PdfViewer-Localization-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates the localization of the Syncfusion ASP.NET Web Forms PDF viewer control based on any language and culture" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Localization.aspx.cs" Inherits="WebSampleBrowser.PdfViewer.Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div style="width: 100% !important;">
        <div style="float: right; padding-bottom: 5px; display: inline-flex;">
            <span style="font-family: 'Segoe UI'; font-size: 18px; font-weight: 400; width: 100%; float: left; vertical-align: middle">Select a culture:</span>

            <ej:dropdownlist id="selectCulture" clientsideonchange="onChange" runat="server" selectedindex="0" watermarktext="Select a culture" width="100%"> 
              <Items>
                    <ej:DropDownListItem Text="fr-FR" Value="fr-FR"></ej:DropDownListItem>
                    <ej:DropDownListItem Text="en-US" Value="en-US"></ej:DropDownListItem>
                    <ej:DropDownListItem Text="de-DE" Value="de-DE"></ej:DropDownListItem>
                </Items>
            </ej:dropdownlist>
        </div>
        <div style="width: 100%; height: 100%; padding-left: 10px; min-height: 680px; float: right">
            <ej:pdfviewer id="PdfViewer2" runat="server" documentloaded="documentOnload" pdfservice="Local" serviceurl="../api/PdfViewer">
        </ej:pdfviewer>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        ej.PdfViewer.Locale["fr-FR"] = {
            toolbar: {
                print: {
                    headerText: 'Imprimer',
                    contentText: 'imprimer le document PDF.'
                },
                first: {
                    headerText: 'Premier',
                    contentText: 'Aller à la première page du document PDF.'
                },
                previous: {
                    headerText: 'précédent',
                    contentText: 'Accédez à la page précédente du document PDF.'
                },
                next: {
                    headerText: 'prochain',
                    contentText: 'Accédez à la page suivante du document PDF.'
                },
                last: {
                    headerText: 'Dernier',
                    contentText: 'Aller à la dernière page du document PDF.'
                },
                zoomIn: {
                    headerText: 'Agrandir',
                    contentText: 'Zoomez pour le document PDF.'
                },
                zoomOut: {
                    headerText: 'Dézoomer',
                    contentText: 'Zoom sur le document PDF.'
                },
                pageIndex: {
                    headerText: 'Numéro de page',
                    contentText: 'Numéro de page actuelle pour voir.'
                },
                zoom: {
                    headerText: 'Zoom',
                    contentText: 'Zoom avant ou arrière sur le document PDF.'
                },
                fitToWidth: {
                    headerText: 'Ajuster à la largeur',
                    contentText: 'Monter la page PDF à la largeur du conteneur.'
                },
                fitToPage: {
                    headerText: 'Ajuster à la page',
                    contentText: 'Monter la page PDF pour le conteneur.'
                },
                download: {
                    headerText: 'Télécharger',
                    contentText: 'Télécharger le document PDF.'
                },
                search: {
                    headerText: 'Recherche texte',
                    contentText: 'Recherche texte dans les pages PDF.',
                },
                highlight: {
                    headerText: 'surligné Texte',
                    contentText: 'Sélectionnez le texte dans les pages PDF.',
                },
                strikeout: {
                    headerText: 'StrikeOut Text',
                    contentText: 'StrikeOut Texte dans les pages PDF.',
                },
                underline: {
                    headerText: 'Souligner le texte',
                    contentText: 'Souligner le texte dans les pages PDF.',
                },
                signature: {
                    headerText: 'Signature',
                    contentText: 'Ajoutez ou créez la signature manuscrite.',
                },
                select: {
                    headerText: 'Sélection',
                    contentText: 'Outil de sélection pour le texte.',
                },
                scroll: {
                    headerText: 'Panning',
                    contentText: 'Cliquez pour faire pivoter le document',
                },
            },
            contextMenu: {
                copy: {
                    contentText: 'Copie',
                },
                googleSearch: {
                    contentText: 'Recherche google',
                },
                Find: {
                    contentText: 'Trouver:',
                },
                matchCase: {
                    contentText: 'cas de correspondance',
                },
                auto: {
                    contentText: 'Auto',
                },
                openPopup: {
                    contentText: 'OpenPopup',
                },
                Delete: {
                    contentText: 'effacer',
                },
                properties: {
                    contentText: 'Propriétés....',
                },
            },
            propertyWindow: {
                underlineProperties: {
                    contentText: "OnderstreepProperties"
                },
                strikeOutProperties: {
                    contentText: "StrikeOutProperties"
                },
                highlightProperties: {
                    contentText: "HighlightProperties"
                },
                signatureProperties: {
                    contentText: "SignatureProperties"
                },
                appearance: {
                    contentText: "apparence"
                },
                general: {
                    contentText: "général"
                },
                color: {
                    contentText: "Couleur:"
                },
                opacity: {
                    contentText: "opacité:"
                },
                author: {
                    contentText: "auteur:"
                },
                subject: {
                    contentText: "assujettir:"
                },
                modified: {
                    contentText: "modifié:"
                },
                ok: {
                    contentText: "D'accord"
                },
                cancel: {
                    contentText: "Annuler"
                },
                locked: {
                    contentText: "fermé à clef"
                }
            },
            signatureWindow: {
                Signature: {
                    contentText: "Ajouter une signature"
                },
                Add: {
                    contentText: "Ajouter"
                },
                clear: {
                    contentText: "Clair"
                },
            },
            waitingPopup: {
                print: {
                    contentText: "Préparation du document pour l'impression ..."
                }
            }
        };

        ej.PdfViewer.Locale["de-DE"] = {
            toolbar: {
                print: {
                    headerText: 'Drucken',
                    contentText: 'Drucken Sie das PDF-Dokument.'
                },
                first: {
                    headerText: 'Erste',
                    contentText: 'Gehen Sie auf die erste Seite des PDF-Dokument.'
                },
                previous: {
                    headerText: 'Zurück',
                    contentText: 'Gehen Sie auf die vorherige Seite des PDF-Dokuments.'
                },
                next: {
                    headerText: 'Nächster',
                    contentText: 'Gehen Sie auf die nächste Seite des PDF-Dokuments.'
                },
                last: {
                    headerText: 'Letzte',
                    contentText: 'Gehen Sie auf die letzte Seite des PDF-Dokuments.'
                },
                zoomIn: {
                    headerText: 'Hineinzoomen',
                    contentText: 'Vergrößern Sie das PDF-Dokument.'
                },
                zoomOut: {
                    headerText: 'Rauszoomen',
                    contentText: 'Zoom aus dem PDF-Dokument.'
                },
                pageIndex: {
                    headerText: 'Seitennummer',
                    contentText: 'Aktuelle Seitenzahl, um zu sehen.'
                },
                zoom: {
                    headerText: 'Zoom',
                    contentText: 'Vergrößern oder Verkleinern auf dem PDF-Dokument.'
                },
                fitToWidth: {
                    headerText: 'An Breite anpassen',
                    contentText: 'Montieren Sie die PDF-Seite an die Breite des Behälters.'
                },
                fitToPage: {
                    headerText: 'An Seite anpassen',
                    contentText: 'Montieren Sie die PDF-Seite in den Behälter.'
                },
                download: {
                    headerText: ' Herunterladen',
                    contentText: ' Laden Sie das PDF-Dokument'
                },
                search: {
                    headerText: 'Suche Text',
                    contentText: 'Suchen Sie Text in den PDF-Seiten.',
                },
                highlight: {
                    headerText: 'hervorheben Text',
                    contentText: 'Markieren Sie Text in den PDF-Seiten.',
                },
                strikeout: {
                    headerText: 'StrikeOut Text',
                    contentText: 'Strike Out Text in den PDF-Seiten.',
                },
                underline: {
                    headerText: 'unterstreichen Text',
                    contentText: 'Unterstreichen Sie den Text in den PDF-Seiten.',
                },
                signature: {
                    headerText: 'Unterschrift',
                    contentText: 'Hinzufügen oder Erstellen der handschriftlichen Unterschrift.',
                },
                select: {
                    headerText: 'Auswahl',
                    contentText: 'Auswahlwerkzeug für Text.',
                },
                scroll: {
                    headerText: 'Schwenken',
                    contentText: 'Klicken Sie, um das Dokument zu verschieben',
                },
            },
            contextMenu: {
                copy: {
                    contentText: 'Kopieren',
                },
                googleSearch: {
                    contentText: 'Google suchen',
                },
                Find: {
                    contentText: 'Finden:',
                },
                matchCase: {
                    contentText: 'MatchCase',
                },
                auto: {
                    contentText: 'Auto',
                },
                openPopup: {
                    contentText: 'Open Pop-Up Note',
                },
                Delete: {
                    contentText: 'Löschen',
                },
                properties: {
                    contentText: 'Eigenschaften....',
                },
            },
            propertyWindow: {
                underlineProperties: {
                    contentText: "Unterstreichen"
                },
                strikeOutProperties: {
                    contentText: "StrikeOutProperties"
                },
                highlightProperties: {
                    contentText: "Markieren Sie die Eigenschaften"
                },
                signatureProperties: {
                    contentText: "Unterschrift Eigenschaften"
                },
                appearance: {
                    contentText: "das Auftreten"
                },
                general: {
                    contentText: "General"
                },
                color: {
                    contentText: "Farbe:"
                },
                opacity: {
                    contentText: "Opazität:"
                },
                author: {
                    contentText: "Autor:"
                },
                subject: {
                    contentText: "Fach:"
                },
                modified: {
                    contentText: "geändert:"
                },
                ok: {
                    contentText: "OK"
                },
                cancel: {
                    contentText: "stornieren"
                },
                locked: {
                    contentText: "eingesperrt"
                }
            },
            signatureWindow: {
                Signature: {
                    contentText: "Signatur hinzufügen"
                },
                Add: {
                    contentText: "Hinzufügen"
                },
                clear: {
                    contentText: "Klar"
                },
            },
            waitingPopup: {
                print: {
                    contentText: "Forbereder dokument til udskrivning ..."
                }
            }
        };

        function documentOnload() {
            $("#LayoutSection_ControlsSection_PdfViewer2").ejPdfViewer("model.locale", "fr-FR");
        }
        function onChange(args) {
            if (args.itemId == 0)
                $("#LayoutSection_ControlsSection_PdfViewer2").ejPdfViewer("model.locale", "fr-FR");
            else if (args.itemId == 1)
                $("#LayoutSection_ControlsSection_PdfViewer2").ejPdfViewer("model.locale", "en-US");
            else
                $("#LayoutSection_ControlsSection_PdfViewer2").ejPdfViewer("model.locale", "de-DE");
        }
    </script>
</asp:Content>

