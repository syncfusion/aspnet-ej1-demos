#region Copyright Syncfusion Inc. 2001-2021
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using System;
using System.Diagnostics;
using Microsoft.Win32;
using System.Globalization;
using System.IO;
using WebSampleBrowser.Helpers;

/// <summary>
/// Summary description for Utils
/// </summary>
/// 
namespace WebSampleBrowser.Utils
{
    #region Class StartDevelopmentWebServer
    public class CassiniWebServer
    {
        const string iisExpressExename = "iisexpress.exe";
        const string webServerExeName = "WebDev.WebServer.EXE";
        const string Netfx20PathRegKeyName = "Software\\Microsoft\\.NETFramework";
        const string Netfx20PathRegValueName = "InstallRoot";
        const string SharedFolderPathRegKeyName = "Software\\Microsoft\\Shared Tools";
        const string SharedFolderPathRegValueName = "SharedFilesDir";

        #region Public Methods
        public static void StartVersion20WebServer(string path, string vDirName, out string port)
        {
            if (!Directory.Exists(path))
                throw new Exception("Unable to locate sample directory.");
            string WebserverPath = string.Format("{0}\\{1}", GetMSBuildPath(), webServerExeName);
            if (File.Exists(WebserverPath))
            {
                StartWebServer(WebserverPath, path, vDirName, out port);
            }
            else
                throw new NullReferenceException("Unable to locate WebDev.WebServer.EXE");
        }
        public static void StartVersion3xWebServer(string path, string vDirName, out string port)
        {
            string WebserverPath = string.Format("{0}\\{1}", GetSharedFolderPath(), webServerExeName);
            if (File.Exists(WebserverPath))
            {
                StartWebServer(WebserverPath, path, vDirName, out port);
            }
            else
                throw new NullReferenceException("Unable to locate WebDev.WebServer.EXE");
        }
        public static void StartVersion45xWebServer(string path, string vDirName, out string port)
        {
            string webServerDir = string.Empty;
            webServerDir = Environment.GetFolderPath(Environment.SpecialFolder.ProgramFiles) + @"\Common Files\Microsoft Shared\DevServer\11.0";
            if(!Directory.Exists(webServerDir))
                webServerDir = Environment.GetFolderPath(Environment.SpecialFolder.ProgramFiles) + @"\Common Files\Microsoft Shared\DevServer\11.0";
            if (!Directory.Exists(webServerDir))
                webServerDir = Environment.GetFolderPath(Environment.SpecialFolder.ProgramFiles) + @"\Common Files\Microsoft Shared\DevServer\10.0";
            if (!Directory.Exists(webServerDir))
                webServerDir = Environment.GetFolderPath(Environment.SpecialFolder.ProgramFiles) + @"\Common Files\Microsoft Shared\DevServer\10.0";
            string WebserverPath = string.Format("{0}\\{1}", webServerDir, "WebDev.WebServer40.EXE");
            if (WebLaunchPageExt.RequestedServer() != ServerMode.IISExpress && File.Exists(WebserverPath))
            {
                StartWebServer(WebserverPath, path, vDirName, out port);
            }
            else
            {
                string iisExpressPath = string.Format("{0}\\{1}", GetIISExpressPath(), iisExpressExename);
                if (File.Exists(iisExpressPath))
                {
                    StartIISExpress(iisExpressPath, path, vDirName, out port);
                }
                else
                {
                    throw new NullReferenceException("Unable to locate WebDev.WebServer.EXE");   
                }
            }
        }
        #endregion

        #region Private methods
        private static void StartWebServer(string WebserverPath, string samplepath, string vDirName, out string port)
        {
            string commandArgs = string.Empty;

            Random r = new Random();
            port = r.Next(1024, 9000).ToString();

            //grab the original path 
            commandArgs += " /path:\"" + samplepath + "\"";
            commandArgs += " /port:";
            commandArgs += port;
            commandArgs += " /vpath:/" + vDirName;

            Process mDOSProcess = new Process();
            mDOSProcess.StartInfo.FileName = WebserverPath;
            mDOSProcess.StartInfo.Arguments = commandArgs;

            //if you dont want to see the dos black screen
            mDOSProcess.StartInfo.CreateNoWindow = true;
            mDOSProcess.StartInfo.UseShellExecute = false;

            //now start the process
            mDOSProcess.Start();
        }

        private static void StartIISExpress(string iisExpressPath, string samplepath, string vDirName, out string port)
        {
            string commandArgs = string.Empty;

            Random r = new Random();
            port = r.Next(1024, 9000).ToString();

            //grab the original path 
            commandArgs += " /path:\"" + samplepath + "\"";
            commandArgs += " /port:";
            commandArgs += port;
            //commandArgs += " /vpath:/" + vDirName;

            Process mDOSProcess = new Process();
            mDOSProcess.StartInfo.FileName = iisExpressPath;
            mDOSProcess.StartInfo.Arguments = commandArgs;

            //////if you dont want to see the dos black screen
            mDOSProcess.StartInfo.CreateNoWindow = true;
            mDOSProcess.StartInfo.UseShellExecute = false;

            //now start the process
            mDOSProcess.Start();
        }

        private static string GetMSBuildPath()
        {
            string regValue = string.Empty;
            if (FrameworkVersionDetection.GetRegistryValue(RegistryHive.LocalMachine, Netfx20PathRegKeyName, Netfx20PathRegValueName, RegistryValueKind.String, out regValue))
            {
                Version curVersion = FrameworkVersionDetection.GetExactVersion(FrameworkVersion.Fx20);
                return string.Format("{0}{1}", regValue, string.Format("v{0}.{1}.{2}", curVersion.Major, curVersion.Minor, curVersion.Build));
            }
            else
                throw new NullReferenceException("Unable to find .NET Framework Root path.");
        }

        private static string GetIISExpressPath()
        {
            string programFilesFolder = Environment.GetEnvironmentVariable("PROGRAMFILES");
            return programFilesFolder + @"\IIS Express";
        }

        private static string GetSharedFolderPath()
        {
            string regValue = string.Empty;
            if (FrameworkVersionDetection.GetRegistryValue(RegistryHive.LocalMachine, SharedFolderPathRegKeyName, SharedFolderPathRegValueName, RegistryValueKind.String, out regValue))
            {
                return string.Format("{0}{1}", regValue, "DevServer\\9.0");
            }
            else
                throw new NullReferenceException("Unable to find Windows Shared folder path.");
        }
        #endregion
    }
    #endregion

    #region enum FrameworkVersion
    /// <summary>
    /// Specifies the .NET Framework versions
    /// </summary>
    public enum FrameworkVersion
    {
        /// <summary>
        /// .NET Framework 1.0
        /// </summary>
        Fx10,

        /// <summary>
        /// .NET Framework 1.1
        /// </summary>
        Fx11,

        /// <summary>
        /// .NET Framework 2.0
        /// </summary>
        Fx20,

        /// <summary>
        /// .NET Framework 3.0
        /// </summary>
        Fx30,

        /// <summary>
        /// .NET Framework 3.5 (Orcas)
        /// </summary>
        Fx35,
        /// <summary>
        /// .NET Framework 3.5 (SP1)
        /// </summary>
        Fx35Sp1,
    }
    #endregion

    #region class FrameworkVersionDetection
    /// <summary>
    /// Provides support for determining if a specific version of the .NET
    /// Framework runtime is installed and the service pack level for the
    /// runtime version.
    /// </summary>
    public static class FrameworkVersionDetection
    {
        #region class-wide fields

        const string Netfx10RegKeyName = "Software\\Microsoft\\.NETFramework\\Policy\\v1.0";
        const string Netfx10RegKeyValue = "3705";
        const string Netfx10SPxMSIRegKeyName = "Software\\Microsoft\\Active Setup\\Installed Components\\{78705f0d-e8db-4b2d-8193-982bdda15ecd}";
        const string Netfx10SPxOCMRegKeyName = "Software\\Microsoft\\Active Setup\\Installed Components\\{FDC11A6F-17D1-48f9-9EA3-9051954BAA24}";
        const string Netfx10SPxRegValueName = "Version";
        const string Netfx11RegKeyName = "Software\\Microsoft\\NET Framework Setup\\NDP\\v1.1.4322";
        const string Netfx20RegKeyName = "Software\\Microsoft\\NET Framework Setup\\NDP\\v2.0.50727";
        const string Netfx30RegKeyName = "Software\\Microsoft\\NET Framework Setup\\NDP\\v3.0\\Setup";
        const string Netfx35RegKeyName = "Software\\Microsoft\\NET Framework Setup\\NDP\\v3.5";
        const string Netfx11PlusRegValueName = "Install";
        const string Netfx30PlusRegValueName = "InstallSuccess";
        const string Netfx11PlusSPxRegValueName = "SP";
        const string Netfx35PlusSPxRegValueName = "SP";
        const string Netfx20PlusBuildRegValueName = "Increment";
        const string Netfx30PlusVersionRegValueName = "Version";
        const string Netfx35PlusBuildRegValueName = "Build";
        const string Netfx30PlusWCFRegKeyName = Netfx30RegKeyName + "\\Windows Communication Foundation";
        const string Netfx30PlusWPFRegKeyName = Netfx30RegKeyName + "\\Windows Presentation Foundation";
        const string Netfx30PlusWFRegKeyName = Netfx30RegKeyName + "\\Windows Workflow Foundation";
        const string Netfx30PlusWFPlusVersionRegValueName = "FileVersion";
        const string CardSpaceServicesRegKeyName = "System\\CurrentControlSet\\Services\\idsvc";
        const string CardSpaceServicesPlusImagePathRegName = "ImagePath";

        #endregion

        #region private and internal properties and methods

        #region methods

        #region GetRegistryValue
        public static bool GetRegistryValue<T>(RegistryHive hive, string key, string value, RegistryValueKind kind, out T data)
        {
            bool success = false;
            data = default(T);

            using (RegistryKey baseKey = RegistryKey.OpenRemoteBaseKey(hive, String.Empty))
            {
                if (baseKey != null)
                {
                    using (RegistryKey registryKey = baseKey.OpenSubKey(key, RegistryKeyPermissionCheck.ReadSubTree))
                    {
                        if (registryKey != null)
                        {
                            // If the key was opened, try to retrieve the value.
                            RegistryValueKind kindFound = registryKey.GetValueKind(value);
                            if (kindFound == kind)
                            {
                                object regValue = registryKey.GetValue(value, null);
                                if (regValue != null)
                                {
                                    data = (T)Convert.ChangeType(regValue, typeof(T), CultureInfo.InvariantCulture);
                                    success = true;
                                }
                            }
                        }
                    }
                }
            }
            return success;
        }
        #endregion

        #region GetNetfxExactVersion functions

        #region GetNetfx20ExactVersion
        private static Version GetNetfx20ExactVersion()
        {
            string regValue = String.Empty;

            // We can only get -1 if the .NET Framework is not
            // installed or there was some kind of error retrieving
            // the data from the registry
            Version fxVersion = new Version();

            if (GetRegistryValue(RegistryHive.LocalMachine, Netfx20RegKeyName, Netfx20PlusBuildRegValueName, RegistryValueKind.String, out regValue))
            {
                if (!String.IsNullOrEmpty(regValue))
                {
                    // In the strict sense, we are cheating here, but the registry key name itself
                    // contains the version number.
                    string[] versionTokens = Netfx20RegKeyName.Split(new string[] { "NDP\\v" }, StringSplitOptions.None);
                    if (versionTokens.Length == 2)
                    {
                        string[] tokens = versionTokens[1].Split('.');
                        if (tokens.Length == 3)
                        {
                            fxVersion = new Version(Convert.ToInt32(tokens[0], NumberFormatInfo.InvariantInfo), Convert.ToInt32(tokens[1], NumberFormatInfo.InvariantInfo), Convert.ToInt32(tokens[2], NumberFormatInfo.InvariantInfo), Convert.ToInt32(regValue, NumberFormatInfo.InvariantInfo));
                        }
                    }
                }
            }

            return fxVersion;
        }
        #endregion

        #region GetNetfx30ExactVersion
        private static Version GetNetfx30ExactVersion()
        {
            string regValue = String.Empty;

            // We can only get the default version if the .NET Framework
            // is not installed or there was some kind of error retrieving
            // the data from the registry
            Version fxVersion = new Version();

            if (GetRegistryValue(RegistryHive.LocalMachine, Netfx30RegKeyName, Netfx30PlusVersionRegValueName, RegistryValueKind.String, out regValue))
            {
                if (!String.IsNullOrEmpty(regValue))
                {
                    fxVersion = new Version(regValue);
                }
            }

            return fxVersion;
        }
        #endregion

        #region GetNetfx35ExactVersion
        private static Version GetNetfx35ExactVersion()
        {
            string regValue = String.Empty;

            // We can only get the default version if the .NET Framework
            // is not installed or there was some kind of error retrieving
            // the data from the registry
            Version fxVersion = new Version();

            if (GetRegistryValue(RegistryHive.LocalMachine, Netfx35RegKeyName, Netfx30PlusVersionRegValueName, RegistryValueKind.String, out regValue))
            {
                if (!String.IsNullOrEmpty(regValue))
                {
                    fxVersion = new Version(regValue);
                }
            }

            return fxVersion;
        }
        #endregion

        #endregion

        #region IsNetfxInstalled functions

        #region IsNetfx20Installed
        private static bool IsNetfx20Installed()
        {
            bool found = false;
            int regValue = 0;

            if (GetRegistryValue(RegistryHive.LocalMachine, Netfx20RegKeyName, Netfx11PlusRegValueName, RegistryValueKind.DWord, out regValue))
            {
                if (regValue == 1)
                {
                    found = true;
                }
            }

            return found;
        }
        public static bool IsNetfx35SP1Installed()
        {
            bool found = false;
            int regValue = 0;

            if (GetRegistryValue(RegistryHive.LocalMachine, Netfx35RegKeyName, Netfx35PlusSPxRegValueName, RegistryValueKind.DWord, out regValue))
            {
                if (regValue == 1)
                {
                    found = true;
                }
            }

            return found;
        }
        #endregion

        #region IsNetfx30Installed
        private static bool IsNetfx30Installed()
        {
            bool found = false;
            int regValue = 0;

            if (GetRegistryValue(RegistryHive.LocalMachine, Netfx30RegKeyName, Netfx30PlusRegValueName, RegistryValueKind.DWord, out regValue))
            {
                if (regValue == 1)
                {
                    found = true;
                }
            }

            return found;
        }
        #endregion

        #region IsNetfx35Installed
        private static bool IsNetfx35Installed()
        {
            bool found = false;
            int regValue = 0;

            if (GetRegistryValue(RegistryHive.LocalMachine, Netfx35RegKeyName, Netfx11PlusRegValueName, RegistryValueKind.DWord, out regValue))
            {
                if (regValue == 1)
                {
                    found = true;
                }
            }

            return found;
        }
        #endregion

        #endregion

        #endregion

        #endregion

        #region public properties and methods

        #region methods

        #region IsInstalled

        #region IsInstalled(FrameworkVersion frameworkVersion)
        /// <summary>
        /// Determines if the specified .NET Framework version is installed
        /// on the local computer.
        /// </summary>
        /// <param name="frameworkVersion">One of the
        /// <see cref="FrameworkVersion"/> values.</param>
        /// <returns><see langword="true"/> if the specified .NET Framework
        /// version is installed; otherwise <see langword="false"/>.</returns>
        public static bool IsInstalled(FrameworkVersion frameworkVersion)
        {
            bool ret = false;

            switch (frameworkVersion)
            {

                case FrameworkVersion.Fx20:
                    ret = IsNetfx20Installed();
                    break;

                case FrameworkVersion.Fx30:
                    ret = IsNetfx30Installed();
                    break;

                case FrameworkVersion.Fx35:
                    ret = IsNetfx35Installed();
                    break;
                case FrameworkVersion.Fx35Sp1:
                    ret = IsNetfx35SP1Installed();
                    break;
                default:
                    break;
            }

            return ret;
        }

        #endregion

        #endregion

        #region GetExactVersion

        #region GetExactVersion(FrameworkVersion frameworkVersion)
        /// <summary>
        /// Retrieves the exact version number for the specified .NET Framework
        /// version.
        /// </summary>
        /// <param name="frameworkVersion">One of the
        /// <see cref="FrameworkVersion"/> values.</param>
        /// <returns>A <see cref="Version">version</see> representing
        /// the exact version number for the specified .NET Framework version.
        /// If the specified .NET Frameowrk version is not found, a 
        /// <see cref="Version"/> is returned that represents a 0.0.0.0 version
        /// number.
        /// </returns>
        public static Version GetExactVersion(FrameworkVersion frameworkVersion)
        {
            Version fxVersion = new Version();

            switch (frameworkVersion)
            {

                case FrameworkVersion.Fx20:
                    fxVersion = GetNetfx20ExactVersion();
                    break;

                case FrameworkVersion.Fx30:
                    fxVersion = GetNetfx30ExactVersion();
                    break;

                case FrameworkVersion.Fx35:
                    fxVersion = GetNetfx35ExactVersion();
                    break;

                default:
                    break;
            }

            return fxVersion;
        }
        #endregion

        #endregion

        #endregion

        #endregion
    }
    #endregion

    public enum SampleVersion
    {
        v35
    }
    public class Utility
    {
        public static string GetSampleVersionFolderName(SampleVersion version)
        {
            string ver = string.Empty;
            switch (version)
            {
                case SampleVersion.v35:
                    ver = "3.5";
                    break;
                default:
                    ver = "3.5";
                    break;
            }
            return ver;
        }
    }

  
}

