#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace WebSampleBrowser.PredictiveAnalytics
{
    public class Sample
    {
        #region private properties

        private string pmml;
        private string rscript;
        private Syncfusion.PMML.Table pageInputs = null;

        #endregion

        #region Public properties

        public int skip { get; set; }
        public int take { get; set; }
        public string name { get; set; }
        public string samplePath { get; set; }
        public string modelName { get; set; }        
        public string RScript
        {
            get
            {
                return rscript;
            }
            set
            {
                rscript = value;
            }
        }
        
        public string PMML
        {
            get
            {
                return pmml;
            }
            set
            {
                pmml = value;
            }
        }
        public System.Data.DataTable table;
        public Syncfusion.PMML.Table inputTable = null;
        public Syncfusion.PMML.Table outputTable = null;
        public Syncfusion.PMML.Table selectedPageInputTable = null;

        #endregion

        /// <summary>
        /// Gets the parent directory path
        /// </summary>
        /// <param name="path">server path</param>
        /// <returns>Parent directory path</returns>
        public string GetParentDirectoryPath(string path)
        {
            DirectoryInfo info = new DirectoryInfo(path);
            for (int i = 0; i < 4; i++)
            {
                DirectoryInfo test = new DirectoryInfo(info.FullName + "/App_Data/PredictiveAnalytics");
                if (test.Exists)
                    break;
                info = info.Parent;
            }

            return info.FullName + "/App_Data/PredictiveAnalytics";
        }

        /// <summary>
        /// Gets the inputs of selected page
        /// </summary>
        /// <param name="inputTable">Input table</param>
        /// <returns>selected page inputs</returns>
        public Syncfusion.PMML.Table PagingMethod(Syncfusion.PMML.Table inputTable)
        {
            take = take + skip > inputTable.RowCount ? inputTable.RowCount - skip : take;
            pageInputs = new Syncfusion.PMML.Table(take, inputTable.ColumnCount);

            for (int k = 0; k < inputTable.ColumnCount; k++)
            {
                pageInputs.ColumnNames[k] = inputTable.ColumnNames[k].ToString();
            }

            int testCount = 0;

            for (int i = 0; i < inputTable.RowCount; i++)
            {
                if (i >= skip && i < skip + take)
                {
                    for (int j = 0; j < pageInputs.ColumnCount; j++)
                    {
                        pageInputs[testCount, j] = inputTable[i, j];
                    }
                    testCount++;
                }
            }

            return pageInputs;
        }

        /// <summary>
        /// Merges the input and ouput values
        /// </summary>
        /// <param name="inputTable">Input table</param>
        /// <param name="outputTable">Output table</param>
        /// <returns>Merged result</returns>
        public List<Dictionary<string, object>> MergeTable(Syncfusion.PMML.Table inputTable, Syncfusion.PMML.Table outputTable)
        {
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();

            int outputCount = 0;

            for (int i = 0; i < inputTable.RowCount; i++)
            {
                Dictionary<string, object> row = new Dictionary<string, object>();

                for (int j = 0; j < inputTable.ColumnCount; j++)
                {
                    row[inputTable.ColumnNames[j]] = inputTable[i, j];
                }

                if (i >= skip && i < skip + take)
                {
                    for (int j = 0; j < outputTable.ColumnCount; j++)
                    {
                        row[outputTable.ColumnNames[j]] = outputTable[outputCount, j];
                    }
                    outputCount++;
                }

                rows.Add(row);
            }

            return rows;
        }
    }
    public class DataResult
    {
        public IEnumerable result { get; set; }
        public int count { get; set; }
    }
}