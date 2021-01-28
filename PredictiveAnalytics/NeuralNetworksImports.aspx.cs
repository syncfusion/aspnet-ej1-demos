#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.PredictiveAnalytics
{
    public partial class NeuralNetworksImports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Root directory
            Session["root"] = Server.MapPath("~");

            //Sample intialization
            Sample sample = new Sample();
            sample.name = "Imports";
            sample.modelName = "Neural Networks";
            sample.samplePath = "\\" + sample.modelName + "\\" + sample.name;
            sample.skip = 0;
            sample.take = 1;
            LoadSample(sample, Session["root"].ToString());

            //PMML file
            Session["pmmlFile"] = sample.PMML.Replace("<", "&lt"); ;

            //R-Script 
            JavaScriptSerializer js = new JavaScriptSerializer();
            Session["rscript"] = js.Serialize(sample.RScript).Replace("\"", ";");

            Session["inputColumnCount"] = sample.inputTable.ColumnCount;
            List<Dictionary<string, object>> outputTable = sample.MergeTable(sample.inputTable, sample.outputTable);
            Session["tableColumnCount"] = outputTable[0].Values.Count;

            //Add column values to the OutputGrid
            this.OutputGrid.Columns.Clear();
            string columnNames = string.Empty;
            this.OutputGrid.EnableViewState = false;
            List<string> numericColumns = new List<string>();

            foreach (var item in outputTable[0].Keys)
            {
                this.OutputGrid.Columns.Add(new Syncfusion.JavaScript.Models.Column() { Field = item }); ;
            }

            for (int i = 0; i < outputTable[0].Values.Count; i++)
            {
                double resultNumeric = 0.0;
                var cellvalue = outputTable[0].ElementAt(i).Value.ToString();
                if (double.TryParse(cellvalue, out resultNumeric))
                {
                    numericColumns.Add(outputTable[0].ElementAt(i).Key);
                }
            }

            for (int i = 0; i < numericColumns.Count; i++)
            {
                columnNames += numericColumns[i].ToString() + ',';
            }

            Session["numericColumns"] = columnNames;
            Session["numericColumnsCount"] = numericColumns.Count;
        }

        [System.Web.Services.WebMethod]
        public static object GetData(int skip, int take)
        {
            Sample sample = new Sample();
            sample.name = "Imports";
            sample.modelName = "Neural Networks";
            sample.samplePath = "\\" + sample.modelName + "\\" + sample.name;
            sample.skip = skip;
            sample.take = take;
            string root = HttpContext.Current.Session["root"].ToString();
            LoadSample(sample, root);
            var DataSource = sample.MergeTable(sample.inputTable, sample.outputTable);
            DataResult dr = new DataResult();
            dr.result = DataSource.Skip(skip).Take(take);
            dr.count = DataSource.Count();
            return dr;
        }

        /// <summary>
        /// Method to load Samples
        /// </summary>
        /// <param name="sample">Sample values</param>
        /// <param name="root">root directory</param>
        public static void LoadSample(Sample sample, string root)
        {
            ImportsNeural.Program imports = new ImportsNeural.Program();

            var path = sample.GetParentDirectoryPath(root);
            string samplePath = string.Format("{0}{1}\\{2}", path, sample.samplePath, "Model\\");
            string outputPath = samplePath + "PredictedOutput.html";
            string pmmlPath = string.Format("{0}{1}.pmml", samplePath, sample.name);
            string rScriptPath = string.Format("{0}{1}.R", samplePath, sample.name);

            string inputPath = samplePath + "Imports.csv";
            sample.inputTable = new Syncfusion.PMML.Table(inputPath, true, ',');
            sample.selectedPageInputTable = sample.PagingMethod(sample.inputTable);
            sample.outputTable = imports.PredictResult(sample.selectedPageInputTable, pmmlPath);

            if (File.Exists(rScriptPath))
                sample.RScript = File.ReadAllText(rScriptPath);

            sample.PMML = File.ReadAllText(pmmlPath);
        }
    }
}