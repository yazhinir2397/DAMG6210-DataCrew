-- GRANTING PERMISSIONS

CREATE USER Customer1 IDENTIFIED BY Oracle_12345;
CREATE USER Seller1 IDENTIFIED BY Oracle_12345;
CREATE USER Shipper1 IDENTIFIED BY Oracle_12345;

grant create session to Customer1;
grant create session to Seller1;
grant create session to Shipper1;

--CUSTOMER GRANT PERMISSION

GRANT INSERT, UPDATE, DELETE ON CUSTOMER TO Customer1;
GRANT INSERT, UPDATE ON ADDRESS TO Customer1;
GRANT INSERT, UPDATE ON ZIP_CODE TO Customer1;
GRANT INSERT, UPDATE, DELETE ON CART TO Customer1;
GRANT SELECT ON PAYMENT TO Customer1;
GRANT SELECT ON ITEM TO Customer1;
GRANT SELECT ON CATEGORYY TO Customer1;
GRANT SELECT ON SHIPMENT TO Customer1;
GRANT SELECT ON ITEM_CONDITION TO Customer1;

commit;

--SELLER GRANT PERMISSION

GRANT INSERT, UPDATE, DELETE ON SELLER TO Seller1;
GRANT INSERT, UPDATE, DELETE ON ADDRESS TO Seller1;
GRANT INSERT, UPDATE, DELETE ON ZIP_CODE TO Seller1;
GRANT SELECT, INSERT, UPDATE ON ITEM TO Seller1;
GRANT SELECT, INSERT, UPDATE ON ITEM_CONDITION TO Seller1;


commit;

--SHIPPER GRANT PERMISSION

GRANT INSERT, UPDATE, DELETE ON SHIPPER TO Shipper1;
GRANT SELECT, INSERT, UPDATE, DELETE ON SHIPMENT TO Shipper1;

commit;