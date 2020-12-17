#region Copyright Syncfusion Inc. 2001-2020.
// Copyright Syncfusion Inc. 2001-2020. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.18449
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebSampleBrowser.database
{
	using System.Data.Linq;
	using System.Data.Linq.Mapping;
	using System.Data;
	using System.Collections.Generic;
	using System.Reflection;
	using System.Linq;
	using System.Linq.Expressions;
	using System.ComponentModel;
	using System;
	
	
	[global::System.Data.Linq.Mapping.DatabaseAttribute(Name="Linq_To_SQL")]
	public partial class Linq_Common_DataDataContext : System.Data.Linq.DataContext
	{
		
		private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
		
    #region Extensibility Method Definitions
    partial void OnCreated();
    partial void InsertDatabinding(Databinding instance);
    partial void UpdateDatabinding(Databinding instance);
    partial void DeleteDatabinding(Databinding instance);
    partial void InsertToolBarItem(ToolBarItem instance);
    partial void UpdateToolBarItem(ToolBarItem instance);
    partial void DeleteToolBarItem(ToolBarItem instance);
    #endregion
		
		public Linq_Common_DataDataContext() : 
				base(global::System.Configuration.ConfigurationManager.ConnectionStrings["Linq_To_SQLConnectionString"].ConnectionString, mappingSource)
		{
			OnCreated();
		}
		
		public Linq_Common_DataDataContext(string connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public Linq_Common_DataDataContext(System.Data.IDbConnection connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public Linq_Common_DataDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public Linq_Common_DataDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public System.Data.Linq.Table<Databinding> Databindings
		{
			get
			{
				return this.GetTable<Databinding>();
			}
		}
		
		public System.Data.Linq.Table<ToolBarItem> ToolBarItems
		{
			get
			{
				return this.GetTable<ToolBarItem>();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.Databinding")]
	public partial class Databinding : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _Id;
		
		private System.Nullable<int> _ParentId;
		
		private string _Text;
		
		private string _HasChild;
		
		private string _Expanded;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnIdChanging(int value);
    partial void OnIdChanged();
    partial void OnParentIdChanging(System.Nullable<int> value);
    partial void OnParentIdChanged();
    partial void OnTextChanging(string value);
    partial void OnTextChanged();
    partial void OnHasChildChanging(string value);
    partial void OnHasChildChanged();
    partial void OnExpandedChanging(string value);
    partial void OnExpandedChanged();
    #endregion
		
		public Databinding()
		{
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Id", DbType="Int NOT NULL", IsPrimaryKey=true)]
		public int Id
		{
			get
			{
				return this._Id;
			}
			set
			{
				if ((this._Id != value))
				{
					this.OnIdChanging(value);
					this.SendPropertyChanging();
					this._Id = value;
					this.SendPropertyChanged("Id");
					this.OnIdChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ParentId", DbType="Int")]
		public System.Nullable<int> ParentId
		{
			get
			{
				return this._ParentId;
			}
			set
			{
				if ((this._ParentId != value))
				{
					this.OnParentIdChanging(value);
					this.SendPropertyChanging();
					this._ParentId = value;
					this.SendPropertyChanged("ParentId");
					this.OnParentIdChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Text", DbType="VarChar(50)")]
		public string Text
		{
			get
			{
				return this._Text;
			}
			set
			{
				if ((this._Text != value))
				{
					this.OnTextChanging(value);
					this.SendPropertyChanging();
					this._Text = value;
					this.SendPropertyChanged("Text");
					this.OnTextChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_HasChild", DbType="VarChar(50)")]
		public string HasChild
		{
			get
			{
				return this._HasChild;
			}
			set
			{
				if ((this._HasChild != value))
				{
					this.OnHasChildChanging(value);
					this.SendPropertyChanging();
					this._HasChild = value;
					this.SendPropertyChanged("HasChild");
					this.OnHasChildChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Expanded", DbType="VarChar(50)")]
		public string Expanded
		{
			get
			{
				return this._Expanded;
			}
			set
			{
				if ((this._Expanded != value))
				{
					this.OnExpandedChanging(value);
					this.SendPropertyChanging();
					this._Expanded = value;
					this.SendPropertyChanged("Expanded");
					this.OnExpandedChanged();
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.ToolBarItems")]
	public partial class ToolBarItem : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _Id;
		
		private string _iconCss;
		
		private string _ToolTip;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnIdChanging(int value);
    partial void OnIdChanged();
    partial void OniconCssChanging(string value);
    partial void OniconCssChanged();
    partial void OnToolTipChanging(string value);
    partial void OnToolTipChanged();
    #endregion
		
		public ToolBarItem()
		{
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Id", DbType="Int NOT NULL", IsPrimaryKey=true)]
		public int Id
		{
			get
			{
				return this._Id;
			}
			set
			{
				if ((this._Id != value))
				{
					this.OnIdChanging(value);
					this.SendPropertyChanging();
					this._Id = value;
					this.SendPropertyChanged("Id");
					this.OnIdChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_iconCss", DbType="VarChar(50)")]
		public string iconCss
		{
			get
			{
				return this._iconCss;
			}
			set
			{
				if ((this._iconCss != value))
				{
					this.OniconCssChanging(value);
					this.SendPropertyChanging();
					this._iconCss = value;
					this.SendPropertyChanged("iconCss");
					this.OniconCssChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ToolTip", DbType="VarChar(50)")]
		public string ToolTip
		{
			get
			{
				return this._ToolTip;
			}
			set
			{
				if ((this._ToolTip != value))
				{
					this.OnToolTipChanging(value);
					this.SendPropertyChanging();
					this._ToolTip = value;
					this.SendPropertyChanged("ToolTip");
					this.OnToolTipChanged();
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
}
#pragma warning restore 1591