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

public class SpellModel
{
    public Boolean IgnoreAlphaNumericWords { get; set; }
    public Boolean IgnoreEmailAddress { get; set; }
    public Boolean IgnoreMixedCaseWords { get; set; }
    public Boolean IgnoreUpperCase { get; set; }
    public Boolean IgnoreUrl { get; set; }
    public Boolean IgnoreFileNames { get; set; }
}
public class Actions
{
    public string Text { get; set; }
    public string CustomWord { get; set; }
    public SpellModel Model { get; set; }
    public string RequestType { get; set; }
    public string ErrorWord { get; set; }
}

public class Status
{
    public string ErrorWord { get; set; }
}
