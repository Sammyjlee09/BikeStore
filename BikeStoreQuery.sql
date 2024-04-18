SELECT 
     ord.order_id
      ,CONCAT(cus.first_name,',', cus.last_name) AS 'Customers'
	  ,cus.city
	  ,cus.state
	  ,ord.order_date
	  ,SUM(quantity) AS 'total_units'
	  ,SUM(quantity * ite.List_price) AS 'Revenue'
	   ,pro.product_name
	   ,cat.category_name
	   ,sto.Store_name
	   ,CONCAT(sta.first_name,',', sta.last_name) AS 'Sales_Rep'
FROM 
    sales.orders ord
JOIN sales.customers cus
ON  ord.customer_id =cus.customer_id
JOIN sales.order_items ite
ON ord.order_id=ite.order_id
JOIN production.products pro
ON ite.product_id=pro.product_id
JOIN production.categories cat
ON pro.category_id=cat.category_id
JOIN sales.stores sto
ON ord.store_id= sto.store_id
JOIN sales.staffs sta
ON  ord.staff_id=sta.staff_id
GROUP BY
Ord.order_id
 ,CONCAT(cus.first_name,',',cus.last_name),
Cus.city
,Cus.state
,Ord.order_date
,pro.product_name
,cat.category_name
,sto.Store_name
,CONCAT(sta.first_name,',', sta.last_name) 