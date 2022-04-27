--- Table Creation

CREATE TABLE ZIP_CODE(
    AREA_CODE INT NOT NULL PRIMARY KEY,
    CITY VARCHAR(25) NOT NULL,
    STATEE VARCHAR(25) NOT NULL,
    COUNTRY VARCHAR(25) NOT NULL
);

CREATE TABLE ADDRESS(
   ADDRESS_ID INT NOT NULL PRIMARY KEY,
   ADDRESS_LINE1 VARCHAR (100) NOT NULL,
   ADDRESS_LINE2 VARCHAR (100),
   AREA_CODE INT NOT NULL,
   FOREIGN KEY(AREA_CODE) REFERENCES ZIP_CODE(AREA_CODE)
);

CREATE TABLE ITEM_CONDITION(
    IC_ID INT NOT NULL PRIMARY KEY,
    ITEM_CONDITION VARCHAR(50),
    IC_DESCRIPTION VARCHAR(250)
);

CREATE TABLE CATEGORYY(
    CATEGORY_ID INT NOT NULL PRIMARY KEY,
    CATEGORY_NAME VARCHAR(50) NOT NULL
);

CREATE TABLE SHIPPER(
    SHIPPER_ID INT NOT NULL PRIMARY KEY,
    CONTACT_NUMBER INT NOT NULL,
    SHIPPER_NAME VARCHAR(50) NOT NULL,
    SHIPPER_USERNAME VARCHAR(50) NOT NULL,
    SHIPPER_PASSWORD VARCHAR(50) NOT NULL,
    SHIPPER_EMAIL VARCHAR(50) NOT NULL,
    AREA_CODE INT NOT NULL,
    FOREIGN KEY(AREA_CODE) REFERENCES ZIP_CODE(AREA_CODE)
);

CREATE TABLE CUSTOMER(
   CUST_ID INT NOT NULL PRIMARY KEY,
   CUST_NAME VARCHAR (50) NOT NULL,
   CUST_USERNAME VARCHAR (20) NOT NULL,
   CUST_PASSWORD VARCHAR (20) NOT NULL,
   DATE_OF_BIRTH DATE,
   CUST_PH INT NOT NULL,
   CUST_EMAIL VARCHAR(25) NOT NULL,
   ADDRESS_ID INT,
   FOREIGN KEY(ADDRESS_ID) REFERENCES ADDRESS(ADDRESS_ID)
);


CREATE TABLE SELLER(
   SELLER_ID INT NOT NULL PRIMARY KEY,
   SELLER_NAME VARCHAR (50) NOT NULL,
   SELLER_USERNAME VARCHAR (20) NOT NULL,
   SELLER_PASSWORD VARCHAR (20) NOT NULL,
   SELLER_PH INT NOT NULL,
   SELLER_EMAIL VARCHAR(25) NOT NULL,
   ADDRESS_ID INT,
   FOREIGN KEY(ADDRESS_ID) REFERENCES ADDRESS(ADDRESS_ID)
);

CREATE TABLE CART(
    CART_ID INT NOT NULL PRIMARY KEY,
    NUMBER_OF_ITEMS INT NOT NULL,
    TOTAL_COST INT NOT NULL
);

