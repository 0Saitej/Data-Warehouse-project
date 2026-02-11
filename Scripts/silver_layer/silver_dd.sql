===============================================--DDL for silver layer--===========================================================================


------------------------------------------------SILVER_crm_cust_info-----------------------------------------------------------------------
USE [datawarehouse]
GO

/****** Object:  Table [dbo].[SILVER_crm_cust_info]    Script Date: 11-02-2026 16:20:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SILVER_crm_cust_info](
	[cst_id] [int] NULL,
	[cst_key] [varchar](50) NULL,
	[cst_firstname] [varchar](50) NULL,
	[cst_lastname] [varchar](50) NULL,
	[cst_marital] [varchar](50) NULL,
	[cst_gender] [varchar](50) NULL,
	[cst_createdate] [date] NULL,
	[DWH_create_date] [datetime2](7) NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SILVER_crm_cust_info] ADD  DEFAULT (getdate()) FOR [DWH_create_date]
GO
 
 ----------------------------------------------------Silver_crm_prd_info---------------------------------------------------------------------------
USE [datawarehouse]
GO

/****** Object:  Table [dbo].[Silver_crm_prd_info]    Script Date: 11-02-2026 16:22:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Silver_crm_prd_info](
	[prd_id] [int] NULL,
	[prd_key] [nvarchar](50) NULL,
	[erp_prd_category_cust_id] [nvarchar](50) NULL,
	[crm_sales_prd_key] [nvarchar](50) NULL,
	[prd_name] [nvarchar](50) NULL,
	[prd_cost] [int] NULL,
	[prd_line] [nvarchar](50) NULL,
	[prd_startdate] [date] NULL,
	[prd_enddate] [date] NULL,
	[dwh_createdate] [datetime2](7) NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Silver_crm_prd_info] ADD  DEFAULT (getdate()) FOR [dwh_createdate]
GO



 ----------------------------------------------------SILVER_crm_sales_details---------------------------------------------------------------------------
USE [datawarehouse]
GO

/****** Object:  Table [dbo].[SILVER_crm_sales_details]    Script Date: 11-02-2026 16:45:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SILVER_crm_sales_details](
	[crm_sales_order_num] [nvarchar](50) NULL,
	[crm_sales_product_key] [nvarchar](50) NULL,
	[crm_sales_cust_id] [int] NULL,
	[crm_sales_order_date] [date] NULL,
	[crm_sales_ship_date] [date] NULL,
	[crm_sales_due_date] [date] NULL,
	[crm_sales_sale] [int] NULL,
	[crm_sales_quantity] [int] NULL,
	[crm_sales_price] [int] NULL,
	[DWH_create_date] [datetime2](7) NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SILVER_crm_sales_details] ADD  DEFAULT (getdate()) FOR [DWH_create_date]
GO


----------------------------------------------SILVER_erp_cust_info-----------------------------------------------------------------------

USE [datawarehouse]
GO

/****** Object:  Table [dbo].[SILVER_erp_cust_info]    Script Date: 11-02-2026 16:25:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SILVER_erp_cust_info](
	[cust_id] [varchar](50) NULL,
	[cust_birthdate] [date] NULL,
	[cust_Gender] [varchar](50) NULL,
	[DWH_create_date] [datetime2](7) NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SILVER_erp_cust_info] ADD  DEFAULT (getdate()) FOR [DWH_create_date]
GO

 ----------------------------------------------------Silver_erp_prd_info---------------------------------------------------------------------------
USE [datawarehouse]
GO

/****** Object:  Table [dbo].[SILVER_erp_cust_location]    Script Date: 11-02-2026 16:31:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SILVER_erp_cust_location](
	[cust_id] [varchar](50) NULL,
	[cust_Country] [varchar](50) NULL,
	[DWH_create_date] [datetime2](7) NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SILVER_erp_cust_location] ADD  DEFAULT (getdate()) FOR [DWH_create_date]
GO


 ----------------------------------------------------SILVER_crm_sales_details---------------------------------------------------------------------------
USE [datawarehouse]
GO

/****** Object:  Table [dbo].[SILVER_erp_product_category]    Script Date: 11-02-2026 16:31:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SILVER_erp_product_category](
	[cust_id] [varchar](50) NULL,
	[cust_Category] [varchar](50) NULL,
	[cust_Sub_category] [varchar](50) NULL,
	[cust_Maintenance] [varchar](50) NULL,
	[DWH_create_date] [datetime2](7) NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SILVER_erp_product_category] ADD  DEFAULT (getdate()) FOR [DWH_create_date]
GO





