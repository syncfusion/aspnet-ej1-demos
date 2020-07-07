<%@ Page Title="ReportViewer-Localization-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Localization.aspx.cs" Inherits="WebSampleBrowser.ReportViewer.Localization" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">ReportViewer / Localization</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
     <div style="float:right; padding-bottom:5px; display:inline-flex;">
           <span style="font-family: 'Segoe UI'; font-size: 18px;font-weight:400;float: left;vertical-align:middle;margin-top:-12px;">Culture  </span>

                            <select name="selectIndex"  id="optPositionChange">
                                                    <option value="0">en-US</option>
                                                    <option value="1">fr-FR</option>
                                                    <option value="2">ja-JP</option>
                            </select>
        </div>     
    <div style="width:100%;height:100%;">                  
        <ej:ReportViewer ClientIDMode="Static" ID="ReportViewer1" runat="server" ReportPath="~/App_Data/Reports/ConditionalRowFormatting.rdl" ProcessingMode="Remote">
        </ej:ReportViewer>
    </div>   
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ScriptSection">
    <style type="text/css">
    #ReportViewer1 {
        width: 992px;
        height:665px;
		display: inline-block;
    }
        #optPositionChange_wrapper {
            margin-top:-11px;
        }
</style>
    <script type="text/javascript">

        $(function () {
          $("#optPositionChange").ejDropDownList({ "change": "onChange", width: "120px", selectedItemIndex: 0 });
        });

        ej.ReportViewer.Locale["ja-JP"] = {
            toolbar: {
                print: {
                    headerText: '印刷',
                    contentText: '印刷'
                },
                exportformat: {
                    headerText: '輸出',
                    contentText: 'エクスポートされたファイル形式を選択します。',
                    Pdf: 'PDF',
                    Excel: 'エクセル',
                    Word: '単語',
                    Html: 'Html',
                    CSV: 'CSV',
                    PPT: 'PPT'
                },
                first: {
                    headerText: '最初の',
                    contentText: 'レポートの最初のページに移動します。'
                },
                previous: {
                    headerText: '前の',
                    contentText: 'レポートの前のページに移動します。'
                },
                next: {
                    headerText: '次の',
                    contentText: 'レポートの次のページに移動します。'
                },
                last: {
                    headerText: '最後の',
                    contentText: 'レポートの最後のページに移動します。'
                },
                documentMap: {
                    headerText: 'ドキュメントマップ',
                    contentText: '表示または見出しマップを非表示にする。'
                },
                parameter: {
                    headerText: 'パラメーター',
                    contentText: '表示またはパラメータペインを非表示にします。'
                },
                zoomIn: {
                    headerText: 'ズーム•イン',
                    contentText: 'レポートに拡大します。'
                },
                zoomOut: {
                    headerText: 'ズームアウト',
                    contentText: 'レポートのズームアウト。'
                },
                refresh: {
                    headerText: 'リフレッシュ',
                    contentText: 'レポートを更新します。'
                },
                printLayout: {
                    headerText: 'プレビュー',
                    contentText: '印刷レイアウトモードと通常モードとの間で変更します。'
                },
                pageIndex: {
                    headerText: 'ページ番号',
                    contentText: '現在のページ番号が表示されます。'
                },
                zoom: {
                    headerText: 'ズーム',
                    contentText: 'レポート上のズームインまたはズームアウト。'
                },
                back: {
                    headerText: 'バック',
                    contentText: 'バック親レポートに戻ります。'
                },
                fittopage: {
                    headerText: 'ページに合わせる',
                    contentText: 'コンテナにレポートページを取り付けます。',
                    pageWidth: 'ページ幅',
                    pageHeight: 'ページ全体'
                },
                pagesetup: {
                    headerText: 'ページ設定',
                    contentText: '用紙サイズ、向きや余白を変更するには、ページ設定オプションを選択します。'
                }
            },
            pagesetupDialog: {
                close: '閉じる',
                paperSize: '用紙サイズ',
                height: '高さ',
                width: '幅',
                margins: '余白',
                top: '上',
                bottom: 'ボトム',
                right: '右',
                left: '左',
                unit: 'に',
                orientation: 'オリエンテーション',
                portrait: '肖像画',
                landscape: '風景',
                doneButton: '終わりました',
                cancelButton: 'キャンセル'
            },
            credential: {
                userName: 'ユーザー名',
                password: 'パスワード'
            },
            waterMark: {
                selectOption: '選択肢を選択',
                selectValue: '値を選択'
            },
            errorMessage: {
                startMessage: 'レポートビューアでこのレポートを読み込む際に問題が発生しました。お願いします',
                middleMessage: ' ここをクリック',
                endMessage: 'エラーの詳細を表示する',
                closeMessage: 'このメッセージを閉じる'
            },
            alertMessage: {
                close: '閉じる',
                title: 'ReportViewer',
                done: 'Ok',
                showDetails: '詳細を表示',
                hideDetails: '詳細を隠す',
                reportLoad: '読み込まれたレポート:',
                RVERR0001: 'ReportViewerがレポートの読み込みに失敗しました',
                RVERR0002: 'ReportViewerがレポートのレンダリングに失敗しました',
                RVERR0003: 'ajaxポストバックでエラーが発生しました',
                RVERR0004: 'パラメータの値を選択してください',
                RVERR0005: '{parametername}パラメータに値がありません',
                RVERR0006: '浮動小数点型のデータ型を入力してください',
                RVERR0007: '整数型のデータ型を入力してください',
                RVERR0008: 'ReportViewerでデータソースの資格情報を検証できませんでした',
                RVERR0009: 'マージンは重複しているか、用紙から外れています。別の余白サイズを入力してください.',
                RVERR0010: 'パラメータの値を入力してください',
                RVERR0011: 'パラメータは空白にすることはできません',
                RVERR0012: 'レポートパラメータ{parameterprompt}に指定された値がその型に対して無効です.'
            },
            selectAll: 'すべて選択',
            viewButton: 'レポートの表示。'
        };

        ej.ReportViewer.Locale["fr-FR"] = {
            toolbar: {
                print: {
                    headerText: 'Imprimer',
                    contentText: 'Imprimer.'
                },
                exportformat: {
                    headerText: 'exportation',
                    contentText: 'Sélectionnez le format de fichier exporté.',
                    Pdf: 'PDF',
                    Excel: 'exceller',
                    Word: 'mot',
                    Html: 'Html',
                    CSV: 'CSV',
                    PPT: 'PPT'
                },
                first: {
                    headerText: 'première',
                    contentText: 'Aller à la première page du rapport.'
                },
                previous: {
                    headerText: 'précédent',
                    contentText: 'Aller à la page précédente du rapport.'
                },
                next: {
                    headerText: 'suivant',
                    contentText: 'Aller à la page suivante du rapport.'
                },
                last: {
                    headerText: 'dernier',
                    contentText: 'Aller à la dernière page du rapport.'
                },
                documentMap: {
                    headerText: 'document de Plan',
                    contentText: 'Afficher ou masquer la carte du document.'
                },
                parameter: {
                    headerText: 'paramètre',
                    contentText: 'Afficher ou masquer le volet des paramètres.'
                },
                zoomIn: {
                    headerText: 'Agrandir',
                    contentText: 'Zoom dans le rapport.'
                },
                zoomOut: {
                    headerText: 'Dézoomer',
                    contentText: 'Zoom sur le rapport.'
                },
                refresh: {
                    headerText: 'rafraîchir',
                    contentText: 'Actualiser le rapport.'
                },
                printLayout: {
                    headerText: 'avant-première',
                    contentText: 'Changer entre mise en page et les modes normaux.'
                },
                pageIndex: {
                    headerText: 'Nombre de page',
                    contentText: 'Numéro de page pour voir.'
                },
                zoom: {
                    headerText: 'zoom',
                    contentText: 'Zoom avant ou arrière sur le rapport.'
                },
                back: {
                    headerText: 'arrière',
                    contentText: 'Retour à létat parent.'
                },
                fittopage: {
                    headerText: 'adapter à la page',
                    contentText: 'Monter la page du rapport au conteneur.',
                    pageWidth: 'Largeur de page',
                    pageHeight: 'page entière'
                },
                pagesetup: {
                    headerText: 'Mise en page',
                    contentText: "Choisir la page option de configuration pour modifier le format du papier, l'orientation et les marges."
                }
            },
            pagesetupDialog: {
                close: 'Fermer',
                paperSize: 'Format papier',
                height: 'la taille',
                width: 'Largeur',
                margins: 'marges',
                top: 'Haut',
                bottom: 'Bas',
                right: 'Droite',
                left: 'À gauche',
                unit: 'dans',
                orientation: 'orientation',
                portrait: 'Portrait',
                landscape: 'paysage',
                doneButton: 'Terminé',
                cancelButton: 'Annuler'
            },
            credential: {
                userName: "Nom d'utilisateur",
                password: "Password"
            },
            waterMark: {
                selectOption: "S閘ectionnez l'option",
                selectValue: "S閘ectionnez une valeur"
            },
            errorMessage: {
                startMessage: "Report Viewer a rencontr?des probl鑝es lors du chargement de ce rapport. S'il vous plait",
                middleMessage: " Cliquez ici",
                endMessage: "pour voir les d閠ails de l'erreur",
                closeMessage: "Fermez ce message"
            },
            alertMessage: {
                close: 'Fermer',
                title: 'Rapport spectateur',
                done: 'D\'accord',
                showDetails: 'Afficher les d閠ails',
                hideDetails: 'Cacher les d閠ails',
                reportLoad: 'Rapport charg?',
                RVERR0001: 'La visionneuse de rapports n\'a pas pu charger le rapport',
                RVERR0002: 'La visionneuse de rapports n\'a pas r閡ssi ?afficher le rapport',
                RVERR0003: 'Une erreur s\'est produite dans la publication ajax',
                RVERR0004: 'Veuillez s閘ectionner une valeur pour le param鑤re',
                RVERR0005: 'le {le nom du param鑤re} param鑤re est manquant une valeur',
                RVERR0006: 'Veuillez donner l\'entr閑 de type de donn閑s floatt',
                RVERR0007: 'Veuillez indiquer l\'entr閑 du type de donn閑s entier',
                RVERR0008: 'La visionneuse de rapports n\'a pas r閡ssi ?valider les informations d\'identification de la source de donn閑s',
                RVERR0009: 'Les marges se chevauchent ou se trouvent sur le papier. Entrez une taille de marge diff閞ente.',
                RVERR0010: 'Veuillez entrer une valeur pour le param鑤re',
                RVERR0011: 'Le param鑤re ne peut pas 阾re vide',
                RVERR0012: 'La valeur fournie pour le param鑤re de rapport {invite de param鑤re} n\'est pas valide pour son type.'
            },
            selectAll: "Tout s閘ectionner",
            viewButton: 'Voir Rapport'
        };


        function onChange(args) {
            if (args.itemId == 0)
                $("#ReportViewer1").ejReportViewer("model.locale", "en-US");
            else if (args.itemId == 1)
                $("#ReportViewer1").ejReportViewer("model.locale", "fr-FR");
            else
                $("#ReportViewer1").ejReportViewer("model.locale", "ja-JP");
        }    </script>
</asp:Content>

