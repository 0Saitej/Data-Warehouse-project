-------------------------------------------------------gold_dim_customer-------------------------------------------------------------------------------
create view gold_dim_customer as
select
ROW_NUMBER() over (order by cst_id) as customer_key,
fi.cst_id as customer_id,
fi.cst_key as customer_number,
fi.cst_firstname as first_name,
fi.cst_lastname as last_name,
th.cust_Country as country,
fi.cst_marital as marital_status,
case
		when fi.cst_gender != 'n/a' then fi.cst_gender
		else coalesce(se.cust_gender,'n/a')
end as gender,
se.cust_birthdate as birthdate,
fi.cst_createdate as create_date
from SILVER_crm_cust_info as fi
left join silver_erp_cust_info as se
on fi.cst_key = se.cust_id 
left join silver_erp_cust_location as th
on fi.cst_key = th.cust_id

-------------------------------------------------------gold_dim_products-------------------------------------------------------------------------------

create view gold_dim_products as
select
ROW_NUMBER() over(order by prd_id,prd_startdate) as prd_key,
fi.prd_id as product_id,
fi.prd_key as product_number,
fi.prd_name as product_name,
fi.erp_prd_category_cust_id as erp_prd_category_key,
se.cust_Category as category,
se.cust_sub_Category as sub_category,
fi.prd_cost as product_cost,
fi.prd_line as product_line,
se.cust_Maintenance as Maintenance,
fi.prd_startdate as startdate,
fi.crm_sales_prd_key
from SILVER_crm_prd_info as fi
left join SILVER_erp_product_category as se
on erp_prd_category_cust_id = cust_id
where prd_enddate is null

-------------------------------------------------------gold_fact_sales-------------------------------------------------------------------------------

create view gold_fact_sales as
select
fi.crm_sales_order_num as order_number,
se.prd_key,
th.customer_key,
fi.crm_sales_order_date as order_date,
fi.crm_sales_ship_date as shiping_date,
fi.crm_sales_due_date as due_date,
fi.crm_sales_sale as sales,
fi.crm_sales_quantity as quantity,
fi.crm_sales_price as price
from SILVER_crm_sales_details as fi
left join gold_dim_products as se
on fi.crm_sales_product_key = se.crm_sales_prd_key 
left join gold_dim_customer as th
on fi.crm_sales_cust_id = th.customer_id
