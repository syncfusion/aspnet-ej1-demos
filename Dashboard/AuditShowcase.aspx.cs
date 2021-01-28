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
using Syncfusion.PMML;

namespace WebSampleBrowser.Dashboard
{
    public partial class AuditShowcase : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.ClientScript.GetPostBackEventReference(this, "arg");
            imagePath.Visible = false;
        }

        protected void Predict_Click(object sender, EventArgs e)
        {
            PMMLEvaluator evaluator = new PMMLEvaluatorFactory().
                GetPMMLEvaluatorInstance(Server.MapPath("~/App_Data/Audit.pmml"));

            string age = Age.Value.ToString();
            string income = Income.Value.ToString();
            string deduction = Deduction.Value.ToString();
            string hours = Hours.Value.ToString();

            age = string.IsNullOrEmpty(age) ? "0" : age;
            income = string.IsNullOrEmpty(income) ? "0" : income;
            deduction = string.IsNullOrEmpty(deduction) ? "0" : deduction;
            hours = string.IsNullOrEmpty(hours) ? "0" : hours;

            var audit = new
            {
                ID = 0,
                Age = Convert.ToInt32(age),
                Employment = EmploymentCollection.Value,
                Education = EducationCollection.Value,
                Marital = MaritalCollection.Value,
                Occupation = OccupationCollection.Value,
                Income = Convert.ToInt32(income),
                Sex = GenderCollection.Value,
                Deductions = Convert.ToInt32(deduction),
                Hours = Convert.ToInt32(hours),
                Accounts = AccountsCollection.Value,
                Adjustment = 0
            };

            PredictedResult predictedResult = evaluator.GetResult(audit, null);

            string auditPredictedValue = (predictedResult.PredictedValue != null) ? predictedResult.PredictedValue.ToString() : "-";

            imagePath.Visible = true;
            if (auditPredictedValue == "0")
            {
                imagePath.ImageUrl = "../Content/images/thumb_yes.png";
                option.Text = "YES!";
                text.Text = "Your audit risk is low.";
            }
            else
            {
                imagePath.ImageUrl = "../Content/images/thumb_no.png";
                option.Text = "NO!";
                text.Text = "Your audit risk is high.";
            }
        }
    }
}