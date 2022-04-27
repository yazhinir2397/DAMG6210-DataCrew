--REPORTS

--1. Customer details who has total amount more than 200 dollars
SELECT
    ca.category_name,
    c.cust_name,
    p.amount,
    count(1)
FROM
    customer  c,
    payment   p,
    orderr    o,
    item      i,
    categoryy ca
WHERE
        c.cust_id = o.cust_id
    AND o.order_id = p.order_id
    AND i.cust_id = c.cust_id
    AND ca.category_id = i.category_id
    AND p.amount > 200
    group by c.cust_name,ca.category_name,p.amount

/

--2.ITEMS SOLD BASED ON CONDITION IN EACH CATEGORY

SELECT
    ca.category_name,
    ic.item_condition,
    count(ITEM_ID)
FROM
     categoryy ca,
    item      i,
    item_condition ic  
WHERE
    ca.category_id = i.category_id
    and ic.IC_ID =i.IC_ID
    group by ca.category_name,ic.item_condition
/