------1st crm table-----
USE [datawarehouse]
GO

/****** Object:  Table [dbo].Bronze_crm_cust_info ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Bronze_crm_cust_info](
	[cst_id] [int] NULL,
	[cst_key] [varchar](50) NULL,
	[cst_firstname] [varchar](50) NULL,
	[cst_lastname] [varchar](50) NULL,
	[cst_marital] [varchar](50) NULL,
	[cst_gender] [varchar](50) NULL,
	[cst_createdate] [date] NULL
) ON [PRIMARY]
GO

 ---2 crm table----

USE [datawarehouse]
GO

/****** Object:  Table [dbo].Bronze_crm_prd_info ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Bronze_crm_prd_info](
	[prd_id] [int] NULL,
	[prd_key] [varchar](50) NULL,
	[prd_name] [varchar](50) NULL,
	[prd_cost] [int] NULL,
	[prd_line] [varchar](50) NULL,
	[prd_startdate] [date] NULL,
	[prd_enddate] [date] NULL
) ON [PRIMARY]
GO

---3 crm table----

USE [datawarehouse]
GO

/****** Object:  Table [dbo].Bronze_crm_sales_details  ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Bronze_crm_sales_details](
	[crm_sales_order_num] [nvarchar](50) NULL,
	[crm_sales_product_key] [nvarchar](50) NULL,
	[crm_sales_cust_id] [int] NULL,
	[crm_sales_order_date] [int] NULL,
	[crm_sales_ship_date] [int] NULL,
	[crm_sales_due_date] [int] NULL,
	[crm_sales_sale] [int] NULL,
	[crm_sales_quantity] [int] NULL,
	[crm_sales_price] [int] NULL
) ON [PRIMARY]
GO

------1st erp table-----
USE [datawarehouse]
GO

/****** Object:  Table [dbo].Bronze_erp_cust_info ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Bronze_erp_cust_info](
	[cust_id] [varchar](50) NULL,
	[cust_birthdate] [date] NULL,
	[cust_Gender] [varchar](50) NULL
) ON [PRIMARY]
GO

 ---2 erp table----

USE [datawarehouse]
GO

/****** Object:  Table [dbo].Bronze_erp_cust_location  ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Bronze_erp_cust_location](
	[cust_id] [varchar](50) NULL,
	[cust_Country] [varchar](50) NULL
) ON [PRIMARY]
GO


---3 erp table----
USE [datawarehouse]
GO

/****** Object:  Table [dbo].Bronze_erp_product_category ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Bronze_erp_product_category](
	[cust_id] [varchar](50) NULL,
	[cust_Category] [varchar](50) NULL,
	[cust_Sub_category] [varchar](50) NULL,
	[cust_Maintenance] [varchar](50) NULL
) ON [PRIMARY]
GO






