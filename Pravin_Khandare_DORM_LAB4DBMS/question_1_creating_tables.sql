create table if not exists supplier(
SUPP_ID INT,
SUPP_NAME VARCHAR(50) NOT NULL,
SUPP_CITY VARCHAR(50) NOT NULL,
SUPP_PHONE VARCHAR(50) NOT NULL,
primary key(SUPP_ID) 
);

create table if not exists customers(
CUS_ID INT,
CUS_NAME VARCHAR(20) NOT NULL,
CUS_PHONE VARCHAR(10) NOT NULL,
CUS_CITY VARCHAR(30) NOT NULL,
CUS_GENDER CHAR(1) NOT NULL,
primary key(CUS_ID)
);

create table if not exists category(
CAT_ID INT,
CAT_NAME VARCHAR(20) NOT NULL,
primary key(CAT_ID)
);

create table if not exists product(
PRO_ID INT,
PRO_NAME VARCHAR(20) DEFAULT 'dummy',
PRO_DESC VARCHAR(60) NOT NULL,
CAT_ID INT,
primary key(PRO_ID),
foreign key(CAT_ID) REFERENCES category(CAT_ID) 
);

create table if not exists supplier_pricing(
PRICING_ID INT,
PRO_ID INT,
SUPP_ID INT,
SUPP_PRICE INT DEFAULT 0,
primary key(PRICING_ID),
foreign key(PRO_ID) REFERENCES product(PRO_ID),
foreign key(SUPP_ID) REFERENCES supplier(SUPP_ID)
);

CREATE TABLE IF NOT EXISTS orders (
    ORD_ID INT,
    ORD_AMOUNT INT NOT NULL,
    ORD_DATE DATE NOT NULL,
    CUS_ID INT,
    PRICING_ID INT,
    PRIMARY KEY (ORD_ID),
    FOREIGN KEY (CUS_ID)
        REFERENCES customers (CUS_ID),
    FOREIGN KEY (PRICING_ID)
        REFERENCES supplier_pricing (PRICING_ID)
);

create table if not exists rating(
RAT_ID INT,
ORD_ID INT,
RAT_RATSTARS INT NOT NULL,
primary key(RAT_ID),
foreign key(ORD_ID) REFERENCES orders(ORD_ID)
);

