--Packages

CREATE OR REPLACE PACKAGE ITEM_PACKAGE AS
PROCEDURE Based_On_Category(categ_name in categoryy.category_name%type);
PROCEDURE Price_Based(p in number);
END;
/

--Procedure Based_on_category

--Displaying all the items according to the category
CREATE OR REPLACE PACKAGE BODY ITEM_PACKAGE AS
PROCEDURE Based_On_Category(categ_name in categoryy.category_name%type) IS
p_categ_name categoryy.category_name%type;
p_item_name item.item_name%type;
CURSOR cur2 IS
            SELECT category_name, item_name from categoryy c, item i
            WHERE c.category_id = i.category_id
            AND category_name = categ_name;
BEGIN
    OPEN cur2;
    LOOP
        FETCH cur2 INTO p_categ_name, p_item_name;
        EXIT WHEN cur2%notfound;
        dbms_output.put_line('For the category: ' || p_categ_name || ', The Item : - ' || p_item_name);
    END LOOP;
    CLOSE cur2;
EXCEPTION
        WHEN no_data_found THEN
        dbms_output.put_line('Items does not exist');
END Based_On_Category;

--Displaying items based on the ranges of price

PROCEDURE Price_Based(p in number) IS
    itm_price item.price%type;
    itm_name item.item_name%type;
    itm_id item.item_id%type;
    CURSOR cur1 IS
    SELECT item_id,price,item_name FROM item WHERE price < p;
    BEGIN
        OPEN cur1;
        LOOP
            FETCH cur1 INTO itm_id,itm_price,itm_name;
            EXIT WHEN cur1%notfound;
            dbms_output.put_line('The Item ID: ' || itm_id || ' The Item name: "' || itm_name || '" and its price is ' || itm_price);
        END LOOP;
        CLOSE cur1;
    EXCEPTION
        WHEN no_data_found THEN
        dbms_output.put_line('No such item exist');
    END Price_Based;

END;
/


EXECUTE ITEM_PACKAGE.Based_On_Category('FURNITURE');
EXECUTE ITEM_PACKAGE.Price_Based(50);

----------------------------------------------------------------------------------------

--Displaying the number of items based up on the ID
CREATE OR REPLACE PROCEDURE CART_ITEM_DETAILS(CRT_ID IN VARCHAR)
    IS
    val NUMBER(2);
    BEGIN
    SELECT NUMBER_OF_ITEMS INTO val FROM CART WHERE CART_ID = CRT_ID;
        dbms_output.put_line('The no of items in the cartid ' || CRT_ID ||' is : ' || val);
    EXCEPTION
    WHEN no_data_found THEN
    dbms_output.put_line('Sorry no such cart exist !!');
    END;
/

EXECUTE CART_ITEM_DETAILS(7020);


-------------------------------------------------------------------------------

--For checking Revenue per day
create or replace PROCEDURE Total_Rev(PAY_DATE DATE)
AS
    tmp  number;
    BEGIN
        SELECT sum (amount) as SalesAmount
        INTO tmp
        FROM Payment
        WHERE PAYMENT_DATE = PAY_DATE
        GROUP BY PAYMENT_DATE;
        DBMS_output.put_line('For the selected date Total Revenue is : '|| tmp);
    END;
    /

Execute Total_Rev('12-APR-2021') ;
