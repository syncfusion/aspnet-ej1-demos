#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.Barcode
{
    public partial class DefaultFunctionalities : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
		   protected void Update_Click(object sender, EventArgs e)
        {
			string inputText = txtBox.Text;
            CreateBarcode();
            Barcode1.Text = txtBox.Text = inputText;
        }

        protected void symbolListBx_SelectionChanged(object sender, EventArgs e)
           {
               CreateBarcode();
           }
            private void CreateBarcode()
            {
            Barcode1.SymbologyType = (Syncfusion.JavaScript.DataVisualization.BarcodeSymbolType)Enum.Parse(typeof(Syncfusion.JavaScript.DataVisualization.BarcodeSymbolType), symbolListBx.SelectedItem.ToString(), true);
            switch (Barcode1.SymbologyType)
            {
                case Syncfusion.JavaScript.DataVisualization.BarcodeSymbolType.Codabar:
                    Barcode1.BarHeight = 120;
                    Barcode1.Text = txtBox.Text = "01234567";
                    Barcode1.DisplayText = true;
                    break;
                case Syncfusion.JavaScript.DataVisualization.BarcodeSymbolType.Code11:
                 
                    Barcode1.BarHeight = 120;
                   
                    Barcode1.Text = txtBox.Text = "01234567";
                    Barcode1.DisplayText = true;
                    break;
                case Syncfusion.JavaScript.DataVisualization.BarcodeSymbolType.Code32:
                   
                    Barcode1.BarHeight = 120;
                    
                    Barcode1.Text = txtBox.Text = "01234567";
                    Barcode1.DisplayText = true;
                    break;
                case Syncfusion.JavaScript.DataVisualization.BarcodeSymbolType.Code128C:
                   
                    Barcode1.BarHeight = 120;
                   
                    Barcode1.Text= txtBox.Text = "01234567";
                    Barcode1.DisplayText = true;
                    break;

                case Syncfusion.JavaScript.DataVisualization.BarcodeSymbolType.QRBarcode:
                    {
                       
                        Barcode1.Text = txtBox.Text = @"//www.syncfusion.com ";
                        Barcode1.DisplayText = false;
                    }
                    break;
                case Syncfusion.JavaScript.DataVisualization.BarcodeSymbolType.DataMatrix:
                    {    
                    
                        Barcode1.XDimension = 8;
                        Barcode1.Text = txtBox.Text = "SYNCFUSION";
                        Barcode1.DisplayText = false;
                    }
                    break;
                case Syncfusion.JavaScript.DataVisualization.BarcodeSymbolType.Code128B:
                    Barcode1.BarHeight = 120;
                    Barcode1.Text = txtBox.Text = "SYNCFUSION";
                    Barcode1.DisplayText = true;
                    break;
                case Syncfusion.JavaScript.DataVisualization.BarcodeSymbolType.Code128A:
                    Barcode1.BarHeight = 120;
                    Barcode1.Text = txtBox.Text = "SYNCFUSION";
                    Barcode1.DisplayText = true;
                    break;
                case Syncfusion.JavaScript.DataVisualization.BarcodeSymbolType.Code39:
                    Barcode1.BarHeight = 120;
                    Barcode1.Text = txtBox.Text = "SYNCFUSION";
                    Barcode1.DisplayText = true;
                    break;
                case Syncfusion.JavaScript.DataVisualization.BarcodeSymbolType.Code39Extended:

                    Barcode1.BarHeight = 120;

                    Barcode1.Text = txtBox.Text = "SYNCFUSION";
                    Barcode1.DisplayText = true;
                    break;
                case Syncfusion.JavaScript.DataVisualization.BarcodeSymbolType.Code93:
                 
                    Barcode1.BarHeight = 120;
                  
                    Barcode1.Text = txtBox.Text = "SYNCFUSION";
                    Barcode1.DisplayText = true;
                    break;
                case Syncfusion.JavaScript.DataVisualization.BarcodeSymbolType.Code93Extended:
                    Barcode1.BarHeight = 120;
                    Barcode1.Text = txtBox.Text = "SYNCFUSION";
                    Barcode1.DisplayText = true;
                    break;
		 case Syncfusion.JavaScript.DataVisualization.BarcodeSymbolType.UpcBarcode:
                    Barcode1.BarHeight = 120;
                    Barcode1.Text = txtBox.Text = "01234567890";
                    Barcode1.DisplayText = true;
                    break;
                default:
                    Barcode1.Text = txtBox.Text = "";
                    break;
            }
        }
    }
}