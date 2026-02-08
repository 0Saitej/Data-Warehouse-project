USE [datawarehouse]
GO

/****** Object:  StoredProcedure [bronze].[load_bronze]    Script Date: 08-02-2026 18:48:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create   procedure [bronze].[load_bronze] as
	begin
	declare @start_time datetime , @end_time datetime;
	 begin try
	 print '================='
	 print 'broze crm part'
	 print '================='
		set @start_time = GETDATE();
			 set @start_time = GETDATE();
				truncate table Bronze_crm_cust_info
				bulk insert Bronze_crm_cust_info
				from 'D:\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
				with(
				firstrow = 2,
				fieldterminator = ',',
				tablock
				);
			 set @end_time = GETDATE();
			 print 'load duration:'+ cast(datediff(second,@start_time,@end_time) as nvarchar) + 'seconds:';

			 set @start_time = GETDATE();
				truncate table Bronze_crm_prd_info
				bulk insert Bronze_crm_prd_info
				from 'D:\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
				with 
				(
				firstrow = 2,
				fieldterminator = ',',
				tablock
				);
			 set @end_time = GETDATE();
			 print 'load duration:'+ cast(datediff(second,@start_time,@end_time) as nvarchar) + 'seconds:';

			 set @start_time = GETDATE();
				truncate table Bronze_crm_sales_details
				bulk insert Bronze_crm_sales_details
				from 'D:\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
				with 
				(
				firstrow = 2,
				fieldterminator = ',',
				tablock
				);
			 set @end_time = GETDATE();
			 print 'load duration:'+ cast(datediff(second,@start_time,@end_time) as nvarchar) + 'seconds:';


				print '================='
				print 'bronze erp part'
				print '================='
			 set @start_time = GETDATE();
				truncate table Bronze_erp_cust_info
				bulk insert Bronze_erp_cust_info
				from 'D:\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
				with 
				(
				firstrow = 2,
				fieldterminator =',',
				tablock
				);
			 set @end_time = GETDATE();
			 print 'load duration:'+ cast(datediff(second,@start_time,@end_time) as nvarchar) + 'seconds:';

			 set @start_time = GETDATE();
				truncate table Bronze_erp_cust_location
				bulk insert Bronze_erp_cust_location
				from 'D:\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
				with 
				(
				firstrow = 2,
				fieldterminator =',',
				tablock
				);
			 set @end_time = GETDATE();
			 print 'load duration:'+ cast(datediff(second,@start_time,@end_time) as nvarchar) + 'seconds:';

			 set @start_time = GETDATE();
				truncate table Bronze_erp_product_category
				bulk insert Bronze_erp_product_category
				from 'D:\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
				with 
				(
				firstrow = 2,
				fieldterminator =',',
				tablock
				);
			 set @end_time = GETDATE();
			 print 'load duration:'+ cast(datediff(second,@start_time,@end_time) as nvarchar) + 'seconds:';
         set @end_time = GETDATE();
		 print 'load duration entire code:'+ cast(datediff(second,@start_time,@end_time) as nvarchar) + 'seconds:';
	 end try
	 begin catch
	 end catch
	end

	--exec bronze.load_bronze
GO


