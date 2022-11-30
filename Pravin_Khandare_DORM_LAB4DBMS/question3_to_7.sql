SELECT 
    CUS_GENDER, COUNT(CUS_GENDER) count
FROM
    customers
WHERE
    CUS_ID IN (SELECT 
            CUS_ID
        FROM
            orders
        WHERE
            ORD_AMOUNT >= 3000)
GROUP BY CUS_GENDER;

SELECT 
    product.pro_name, orders.*
FROM
    orders,
    supplier_pricing,
    product
WHERE
    orders.cus_id = 2
        AND orders.pricing_id = supplier_pricing.pricing_id
        AND supplier_pricing.pro_id = product.pro_id;

SELECT 
    supplier.*
FROM
    supplier
WHERE
    supp_id IN (SELECT 
            supp_id
        FROM
            supplier_pricing
        GROUP BY supp_id
        HAVING COUNT(pro_id) > 1);

SELECT 
    *
FROM
    (SELECT 
        category.*, t2.pro_name, t2.min_price
    FROM
        category
    INNER JOIN (SELECT 
        product.*, t1.min_price
    FROM
        product
    INNER JOIN (SELECT 
        pro_id, MIN(SUPP_PRICE) AS min_price
    FROM
        supplier_pricing
    GROUP BY pro_id) AS t1 ON product.PRO_ID = t1.PRO_ID) AS t2 ON category.CAT_ID = t2.cat_id) AS t3
GROUP BY t3.cat_id;

SELECT 
    customer.cus_name, customer.cus_gender
FROM
    customer
WHERE
    customer.cus_name LIKE 'A%'
        OR customer.cus_name LIKE '%A';



