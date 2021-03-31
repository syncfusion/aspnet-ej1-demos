<%@ Page Title="Splitter-RTL-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to display content from right to left in the Syncfusion ASP.NET Web Forms Splitter component." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="RTL.aspx.cs" Inherits="WebSampleBrowser.Splitter.RTE" %>


<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">


    <ej:Splitter Height="255" Width="625" ID="outersplitter" EnableRTL="true" EnableAutoResize="true" Orientation="Vertical" runat="server">
        <ej:SplitPane PaneSize="60" MinSize="30">
            <div>
                <div style="padding: 5px 15px;">
                    <h3>لغات البرمجة</h3>
                </div>
            </div>

        </ej:SplitPane>

        <ej:SplitPane PaneSize="186" MinSize="30">
            <ej:Splitter ID="innersplitter" Width="623" height="186" EnableAutoResize="true" runat="server">
                <ej:SplitPane paneSize="210" MinSize="30">
                    <div>
                        <div class="content">
                            <h3>سكريبت
                            </h3>
                            جافا سكريبت (JS) هو تفسير لغة برمجة الكمبيوتر. بالفعل تم تنفيذها كجزء من متصفحات
                    الويب بحيث البرامج النصية من جانب العميل يمكن أن تتفاعل مع المستخدم
                        </div>
                    </div>
                </ej:SplitPane>
                <ej:SplitPane paneSize="200" MinSize="30">
                    <div>
                        <div class="content">
                            <h3>C شارب
                            </h3>
                            والمقصود أن تكون بسيطة وحديثة، للأغراض العامة لغة البرمجة وجوه المنحى C #. أحدث
                    إصدار هو C # 5.0، والذي صدر في 15 أغسطس 2012.
                        </div>
                    </div>
                </ej:SplitPane>
                <ej:SplitPane MinSize="30">
                    <div>
                        <div class="content">
                            <h3>البصرية الأساسية
                            </h3>
                            NET Framework لواحد سطر الأوامر مترجم VB.NET. أحدث إصدار هو VB 2012، والذي صدر في
                    15 أغسطس 2012.
                        </div>
                    </div>
                </ej:SplitPane>
            </ej:Splitter>
        </ej:SplitPane>

    </ej:Splitter>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        h3 {
            font-size: 18px;
            margin: 0;
        }
        
        .content {
            padding: 15px;
        }
        .h-forward {
            left: -2px !important;
        }
    </style>
</asp:Content>

