--===============================================--stored procedures for silver layer--==========================================================--

create or alter procedure silver_load_prcdre as 
begin
		----------------------------------------------------------- Silver_crm_sales_details -----------------------------------------------------------------
		truncate table SILVER_crm_sales_details;
		insert into SILVER_crm_sales_details(
			crm_sales_order_num,
			crm_sales_product_key,
			crm_sales_cust_id,
			crm_sales_order_date,
			crm_sales_ship_date,
			crm_sales_due_date,
			crm_sales_sale,
			crm_sales_quantity,
			crm_sales_price 
		)
		select
		crm_sales_order_num,
		crm_sales_product_key,
		crm_sales_cust_id,
		case
			when crm_sales_order_date = 0 or len(crm_sales_order_date) != 8 then null
			else cast(CAST(crm_sales_order_date as nvarchar) as date)
		end as crm_sales_order_date,
		case
			when crm_sales_ship_date = 0 or len(crm_sales_ship_date) != 8 then null
			else cast(CAST(crm_sales_ship_date as nvarchar) as date)
		end as crm_sales_ship_date,
		case
			when crm_sales_due_date = 0 or len(crm_sales_due_date) != 8 then null
			else cast(CAST(crm_sales_due_date as nvarchar) as date)
		end as crm_sales_due_date,
		case
			 when crm_sales_quantity * abs (crm_sales_price)  != crm_sales_sale or crm_sales_sale is null or crm_sales_sale <= 0 
			 then crm_sales_quantity * abs (crm_sales_price)
			 else crm_sales_sale
		end as crm_sales_sale,
		crm_sales_quantity,
		case 
			when crm_sales_price <= 0 or crm_sales_price is null then crm_sales_sale /  nullif (crm_sales_quantity,0)
			else crm_sales_price
		end as crm_sales_price
		from Bronze_crm_sales_details


		-------------------------------------------------------silver_erp_cust_info--------------------------------------------------------------------
		truncate table silver_erp_cust_info;
		insert into silver_erp_cust_info (
		cust_id,
		cust_birthdate,
		cust_gender
		) 
		select
		case
			when cust_id like 'NAS%' then substring(cust_id,4,LEN (cust_id))
			else cust_id 
		end as cust_id,
		case
			when cust_birthdate > getdate() then null
			else cust_birthdate
		end as cust_birthdate,
		case
			when upper(trim(cust_Gender)) in ('M','Male') then 'Male'
			when upper(trim(cust_Gender)) in ('F','Female') then 'Female'
			else 'N/A'
		end as cust_gender
		from Bronze_erp_cust_info;

		--------------------------------------------------------SILVER_erp_cust_location--------------------------------------------------------------------

		truncate table SILVER_erp_cust_location;
		insert into SILVER_erp_cust_location
		(
		cust_id,
		cust_Country
		)

		select
		replace(cust_id , '-','') as cust_id,
		case 
			when trim(cust_country) = 'DE' then 'Germany'
			when trim(cust_country) in ('US','USA') then 'United States'
			when trim(cust_country) = '' or trim(cust_country) = null  then 'N/A'
			else trim(cust_country) 
		end as cust_country
		from Bronze_erp_cust_location

		-----------------------------------------------------------SILVER_erp_product_category-----------------------------------------------------------
		truncate table SILVER_erp_product_category;
		insert into SILVER_erp_product_category
		(
			cust_id,
			cust_Category,
			cust_Sub_category,
			cust_Maintenance
		)

		select 
		cust_id,
		cust_Category,
		cust_Sub_category,
		cust_Maintenance
		from Bronze_erp_product_category
end
