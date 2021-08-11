#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using Newtonsoft.Json;
using Syncfusion.SpellChecker.Base;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Http;
using System.Web.Script.Serialization;
using System.Web.Script.Services;

namespace WebSampleBrowser.WebAPI
{
    public class SpellCheckController : ApiController
    {
        internal SpellCheckerBase baseDictionary, customDictionary;

        private readonly string _customFilePath = HttpContext.Current.Server.MapPath("~/App_Data/SpellCheck/Custom.dic"); // Here we need to specify the corresponding file name
        private readonly List<Status> errorWords = new List<Status>();

        SpellCheckController()
        {
            if (baseDictionary == null)
            {
                string filePath = HttpContext.Current.Server.MapPath("~/App_Data/SpellCheck/Default.dic");
                // Here we need to specify the corresponding file name
                Stream stream = new FileStream(filePath, FileMode.Open, FileAccess.Read);
                baseDictionary = new SpellCheckerBase(stream);
            }
            this.CustomFileRead();
        }



        // Triggers while requesting the json type
        [AcceptVerbs("Get", "Post")]
        public object AddToDictionary(string data)
        {
            var serializer = new JavaScriptSerializer();
            var args = (Actions)serializer.Deserialize(data, typeof(Actions));
            if (args.CustomWord != null)
            {
                AddToCustomDictionary(args.CustomWord);
            }
            return JsonConvert.SerializeObject(args.CustomWord);
        }

        // Triggers while requesting the jsonp type
        [AcceptVerbs("Get", "Post")]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public object AddToDictionary(string callback, string data)
        {
            var serializer = new JavaScriptSerializer();
            Actions args = (Actions)serializer.Deserialize(data, typeof(Actions));
            if (args.CustomWord != null)
            {
                this.AddToCustomDictionary(args.CustomWord);
            }
            HttpContext.Current.Response.Write(string.Format("{0}({1});", callback, serializer.Serialize(args.CustomWord)));
            return string.Empty;
        }

        // Triggers while requesting the json type
        [AcceptVerbs("Get", "Post")]
        public object CheckWords(string data)
        {
            var serializer = new JavaScriptSerializer();
            Actions args = (Actions)serializer.Deserialize(data, typeof(Actions));
            if (args.RequestType == "checkWords")
            {
                baseDictionary.IgnoreAlphaNumericWords = args.Model.IgnoreAlphaNumericWords;
                baseDictionary.IgnoreEmailAddress = args.Model.IgnoreEmailAddress;
                baseDictionary.IgnoreMixedCaseWords = args.Model.IgnoreMixedCaseWords;
                baseDictionary.IgnoreUpperCaseWords = args.Model.IgnoreUpperCase;
                baseDictionary.IgnoreUrl = args.Model.IgnoreUrl;
                baseDictionary.IgnoreFileNames = args.Model.IgnoreFileNames;
                var errorWordsCollection = this.SplitWords(args.Text);
                return JsonConvert.SerializeObject(errorWordsCollection);
            }
            else if (args.RequestType == "getSuggestions")
            {
                var arr = baseDictionary.GetSuggestions(args.ErrorWord);
                return JsonConvert.SerializeObject(arr);
            }
            return "";
        }
        // Triggers while requesting the jsonp type
        [AcceptVerbs("Get", "Post")]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public object CheckWords(string callback, string data)
        {
            var serializer = new JavaScriptSerializer();
            Actions args = (Actions)serializer.Deserialize(data, typeof(Actions));
            if (args.RequestType == "checkWords")
            {
                baseDictionary.IgnoreAlphaNumericWords = args.Model.IgnoreAlphaNumericWords;
                baseDictionary.IgnoreEmailAddress = args.Model.IgnoreEmailAddress;
                baseDictionary.IgnoreMixedCaseWords = args.Model.IgnoreMixedCaseWords;
                baseDictionary.IgnoreUpperCaseWords = args.Model.IgnoreUpperCase;
                baseDictionary.IgnoreUrl = args.Model.IgnoreUrl;
                baseDictionary.IgnoreFileNames = args.Model.IgnoreFileNames;
                var errorWords = this.SplitWords(args.Text);
                HttpContext.Current.Response.Write(string.Format("{0}({1});", callback, serializer.Serialize(errorWords)));
            }
            else if (args.RequestType == "getSuggestions")
            {
                var suggestions = baseDictionary.GetSuggestions(args.ErrorWord);
                HttpContext.Current.Response.Write(string.Format("{0}({1});", callback, serializer.Serialize(suggestions)));
            }
            return string.Empty;
        }


        #region helpers
        private void CustomFileRead()
        {
            Stream stream1 = new FileStream(_customFilePath, FileMode.Open, FileAccess.ReadWrite);
            customDictionary = new SpellCheckerBase(stream1);
        }
        private bool CheckWord(string word)
        {
            var flag = false;
            if (baseDictionary.HasError(word))
            {
                flag = true;
                using (StreamReader sr = new StreamReader(_customFilePath))
                {
                    var contents = sr.ReadToEnd();
                    if (contents != "")
                    {
                        flag = customDictionary.HasError(word) ? true : false;
                    }
                }
            }
            return flag;
        }

        private void AddToCustomDictionary(string word)
        {
            using (System.IO.StreamWriter file = new System.IO.StreamWriter(_customFilePath, true))
            {
                file.Write(word + Environment.NewLine);
            }
            this.CustomFileRead();
        }

        private List<Status> SplitWords(string text)
        {
            var words = text.Split(null);
            foreach (var word in words)
            {
                string textWord;
                Uri uriResult;
                bool checkUrl = Uri.TryCreate(word, UriKind.Absolute, out uriResult)
                              && (uriResult.Scheme == Uri.UriSchemeHttp || uriResult.Scheme == Uri.UriSchemeHttps);
                if (checkUrl)
                {
                    textWord = word;
                    if (this.CheckWord(textWord))
                    {
                        this.GetStatus(textWord);
                    }
                }
                else if (Regex.IsMatch(word,
                    @"^(?("")("".+?(?<!\\)""@)|(([0-9a-z]((\.(?!\.))|[-!#\$%&'\*\+/=\?\^`\{\}\|~\w])*)(?<=[0-9a-z])@))" +
                    @"(?(\[)(\[(\d{1,3}\.){3}\d{1,3}\])|(([0-9a-z][-\w]*[0-9a-z]*\.)+[a-z0-9][\-a-z0-9]{0,22}[a-z0-9]))$",
                    RegexOptions.IgnoreCase))
                {
                    textWord = word;
                    if (this.CheckWord(textWord))
                    {
                        this.GetStatus(textWord);
                    }
                }
                else if (Regex.IsMatch(word, @"[a-zA-Z0-9_$\-\.\\]*\\[a-zA-Z0-9_$\-\.\\]+"))
                {
                    textWord = word;
                    if (this.CheckWord(textWord))
                    {
                        this.GetStatus(textWord);
                    }
                }
                else
                {
                    if (word.EndsWith(".") || word.EndsWith(","))
                    {
                        textWord = word.Remove(word.Length - 1);
                    }
                    else if (word.Contains('\t') || word.Contains('\n') || word.Contains('\r'))
                    {
                        textWord = Regex.Replace(word, @"\t|\n|\r", "");
                    }
                    else
                    {
                        textWord = word;
                    }
                    this.GetStatus(textWord);
                }
            }
            return errorWords;
        }

        private List<Status> GetStatus(string textWord)
        {
            var splitWords = Regex.Replace(textWord, @"[^0-9a-zA-Z\'_]", " ").Split(null);
            foreach (var inputWord in splitWords)
            {
                if (this.CheckWord(inputWord))
                {
                    errorWords.Add(new Status
                    {
                        ErrorWord = inputWord
                    });
                }
            }
            return errorWords;
        }
        #endregion
    }
}