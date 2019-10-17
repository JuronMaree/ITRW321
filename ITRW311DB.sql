
/* awe*/ 

    Drop Table Transactions;
Drop Table DVD;
Drop Table Customers;
Drop Table Shop;
Drop Table Address;
Drop Table Age_Restriction;
Drop Table Genre;





CREATE TABLE Genre (
        Genre_ID      NUMBER(7)       PRIMARY KEY             NOT NULL,
        Genre_Description        VARCHAR2(20)                            NOT NULL
                    );
                    
CREATE TABLE Age_Restriction (
        Age_Res_ID      NUMBER(7)       PRIMARY KEY             NOT NULL,
        Age_Restriction_Description        VARCHAR2(20)         NOT NULL
                            );        
                            
                            
CREATE TABLE Address (
        Address_ID      NUMBER(7)       PRIMARY KEY      NOT NULL,
        Address_Name        VARCHAR2(20)         NOT NULL,
        Addres_Number        VARCHAR2(6)         NOT NULL,
        City                VARCHAR2(20)         NOT NULL,
        Postal_Code        Number(10)            NOT NULL
                            );      
                            
CREATE TABLE Shop (
        Shop_ID                 NUMBER(7)       PRIMARY KEY      NOT NULL,
        Shop_Description        VARCHAR2(20)         NOT NULL,
        Address_ID              NUMBER(7)         NOT NULL,
        CONSTRAINT fk_Address_ID1 FOREIGN KEY (Address_ID)
        REFERENCES Address(Address_ID)

                    );    
                    
CREATE TABLE Customers (
        Customers_ID      NUMBER(7)       PRIMARY KEY      NOT NULL,
        F_Name        VARCHAR2(20)         NOT NULL,
        L_Name        VARCHAR2(20)         NOT NULL,
        Address_ID        NUMBER(7)         NOT NULL,
        Cell_Number        NUMBER(10)         NOT NULL,
        Date_Joined        DATE         DEFAULT SYSDATE,
        
        CONSTRAINT fk_Address_ID2 FOREIGN KEY (Address_ID)
        REFERENCES Address(Address_ID)
                    ); 
                    
CREATE TABLE DVD (
        DVD_ID          NUMBER(7)       PRIMARY KEY      NOT NULL,
        Title           VARCHAR2(20)         NOT NULL,
        Genre_ID        NUMBER(7)         NOT NULL,
        Age_Res_ID      NUMBER(7)         NOT NULL,
        Date_Of_Release DATE         NOT NULL,
        Length_Of_DVD   NUMBER(4)         NOT NULL,
        DVD_Cost        Number(5)         NOT NULL,
    
        
        CONSTRAINT fk_Genre_ID1 FOREIGN KEY (Genre_ID)
                REFERENCES Genre(Genre_ID),
        CONSTRAINT fk_Age_Res_ID1 FOREIGN KEY (Age_Res_ID)
                REFERENCES Age_Restriction(Age_Res_ID)
                    ); 
CREATE TABLE Transactions (
        Transaction_ID          NUMBER(7)       PRIMARY KEY      NOT NULL,
        Customer_ID             NUMBER(7)         NOT NULL,
        DVD_ID                  NUMBER(7)         NOT NULL,
        Shop_ID         NUMBER(7)         NOT NULL,
        Rental_Date             DATE            DEFAULT SYSDATE,
        Return_Date             DATE            DEFAULT SYSDATE,
        Total                   NUMBER(10)         NOT NULL,
        
        CONSTRAINT fk_Customer_ID1 FOREIGN KEY (Customer_ID)
                REFERENCES Customers(Customers_ID),
        CONSTRAINT fk_DVD_ID1 FOREIGN KEY (DVD_ID)
                REFERENCES DVD(DVD_ID),
        CONSTRAINT fk_Shop_ID1 FOREIGN KEY (Shop_ID)
                REFERENCES Shop(Shop_ID)
                    ); 

/* Sequences
*/    
Drop SEQuENCE GenreGenerate;
Drop SEQuENCE Age_Res_Generate;
Drop SEQuENCE DVD_Generate;
Drop SEQuENCE Shop_Generate;
Drop SEQuENCE Transaction_Generate;
Drop SEQuENCE Customers_Generate;
Drop SEQuENCE Address_Generate;
Drop SEQuENCE CustomerAddress_Generate;

CREATE SEQUENCE GenreGenerate
INCREMENT BY 1
START WITH 1
MAXVALUE 9999999
NOCACHE
NOCYCLE;

CREATE SEQUENCE Age_Res_Generate
INCREMENT BY 1
START WITH 1
MAXVALUE 9999999
NOCACHE
NOCYCLE;

CREATE SEQUENCE DVD_Generate
INCREMENT BY 1
START WITH 1
MAXVALUE 9999999
NOCACHE
NOCYCLE;   

CREATE SEQUENCE Shop_Generate
INCREMENT BY 1
START WITH 1
MAXVALUE 9999999
NOCACHE
NOCYCLE;  

CREATE SEQUENCE Transaction_Generate
INCREMENT BY 1
START WITH 1
MAXVALUE 9999999
NOCACHE
NOCYCLE;  

CREATE SEQUENCE Customers_Generate
INCREMENT BY 1
START WITH 1
MAXVALUE 9999999
NOCACHE
NOCYCLE;

CREATE SEQUENCE Address_Generate
INCREMENT BY 1
START WITH 1
MAXVALUE 9999999
NOCACHE
NOCYCLE;

CREATE SEQUENCE CustomerAddress_Generate
INCREMENT BY 1
START WITH 1
MAXVALUE 9999999
NOCACHE
NOCYCLE;

/* Insert GENRE


*/    

INSERT INTO Genre
        (Genre_ID, Genre_Description)
        VALUES
        (GenreGenerate.NEXTVAL, 'Action');   
        
INSERT INTO Genre
        (Genre_ID, Genre_Description)
        VALUES
        (GenreGenerate.NEXTVAL, 'Adventure');     
        
INSERT INTO Genre
        (Genre_ID, Genre_Description)
        VALUES
        (GenreGenerate.NEXTVAL, 'Comedy');
        
INSERT INTO Genre
        (Genre_ID, Genre_Description)
        VALUES
        (GenreGenerate.NEXTVAL, 'Sci-Fi');
        
INSERT INTO Genre
        (Genre_ID, Genre_Description)
        VALUES
        (GenreGenerate.NEXTVAL, 'Animation');
        
INSERT INTO Genre
        (Genre_ID, Genre_Description)
        VALUES
        (GenreGenerate.NEXTVAL, 'Romance');  
        
        
/* Insert Age Restriction
*/    
INSERT INTO Age_Restriction
        (Age_Res_ID, Age_Restriction_Description)
        VALUES
        (AGE_RES_GENERATE.nextval, '18+');
        
INSERT INTO Age_Restriction
        (Age_Res_ID, Age_Restriction_Description)
        VALUES
        (AGE_RES_GENERATE.nextval, '16');
        
INSERT INTO Age_Restriction
        (Age_Res_ID, Age_Restriction_Description)
        VALUES
        (AGE_RES_GENERATE.nextval, '13');
        
INSERT INTO Age_Restriction
        (Age_Res_ID, Age_Restriction_Description)
        VALUES
        (AGE_RES_GENERATE.nextval, 'PG');  
        
INSERT INTO Age_Restriction
        (Age_Res_ID, Age_Restriction_Description)
        VALUES
        (AGE_RES_GENERATE.nextval, 'FAM');  
                    
/* Insert Address
*/    
INSERT INTO Address
        (Address_ID, Address_Name,Addres_Number,City,Postal_Code)
        VALUES
        (ADDRESS_GENERATE.nextval, 'Langstraat','91','Potchefstroom',2520);
        
INSERT INTO Address
        (Address_ID, Address_Name,Addres_Number,City,Postal_Code)
        VALUES
        (ADDRESS_GENERATE.nextval, 'Kerkstraat','9','Potchefstroom',2520);
        
INSERT INTO Address
        (Address_ID, Address_Name,Addres_Number,City,Postal_Code)
        VALUES
        (ADDRESS_GENERATE.nextval, 'Retiefstraat','12','Klerksdorp',2531);
        
INSERT INTO Address
        (Address_ID, Address_Name,Addres_Number,City,Postal_Code)
        VALUES
        (ADDRESS_GENERATE.nextval, 'VanZylstraat','54','Potchefstroom',2520);
        
INSERT INTO Address
        (Address_ID, Address_Name,Addres_Number,City,Postal_Code)
        VALUES
        (ADDRESS_GENERATE.nextval, 'Kortstraat','47','Parys',2854);
        
INSERT INTO Address
        (Address_ID, Address_Name,Addres_Number,City,Postal_Code)
        VALUES
        (ADDRESS_GENERATE.nextval, 'Operastraat','89','Potchefstroom',2520);
        
INSERT INTO Address
        (Address_ID, Address_Name,Addres_Number,City,Postal_Code)
        VALUES
        (ADDRESS_GENERATE.nextval, 'Kerkstraat','8','Parys',2854);
        
INSERT INTO Address
        (Address_ID, Address_Name,Addres_Number,City,Postal_Code)
        VALUES
        (ADDRESS_GENERATE.nextval, 'Voortrekkerstraat','41','Potchefstroom',2520);
        
INSERT INTO Address
        (Address_ID, Address_Name,Addres_Number,City,Postal_Code)
        VALUES
        (ADDRESS_GENERATE.nextval, 'Stevebikostraat','132','Potchefstroom',2520);
        
INSERT INTO Address
        (Address_ID, Address_Name,Addres_Number,City,Postal_Code)
        VALUES
        (ADDRESS_GENERATE.nextval, 'Jonkerstraat','125','Potchefstroom',2520);
        
INSERT INTO Address
        (Address_ID, Address_Name,Addres_Number,City,Postal_Code)
        VALUES
        (ADDRESS_GENERATE.nextval, 'Krubstraat','14','Klerksdorp',2531);
        
INSERT INTO Address
        (Address_ID, Address_Name,Addres_Number,City,Postal_Code)
        VALUES
        (ADDRESS_GENERATE.nextval, 'Bloustraat','15','Parys',2854);
        
INSERT INTO Address
        (Address_ID, Address_Name,Addres_Number,City,Postal_Code)
        VALUES
        (ADDRESS_GENERATE.nextval, 'Hoekstraat','12','Parys',2854);
        
INSERT INTO Address
        (Address_ID, Address_Name,Addres_Number,City,Postal_Code)
        VALUES
        (ADDRESS_GENERATE.nextval, 'Breedestraat','4','Klerksdorp',2531);
        
INSERT INTO Address
        (Address_ID, Address_Name,Addres_Number,City,Postal_Code)
        VALUES
        (ADDRESS_GENERATE.nextval, 'Kromstraat','8','Potchefstroom',2520);
        /*15*/
        
/* Insert Shop
*/
INSERT INTO Shop
        (Shop_ID, Shop_Description,Address_ID)
        VALUES
        (SHOP_GENERATE.nextval, 'MovieMeg1',1);
       
INSERT INTO Shop
        (Shop_ID, Shop_Description,Address_ID)
        VALUES
        (SHOP_GENERATE.nextval, 'MovieMeg2',2);
        
INSERT INTO Shop
        (Shop_ID, Shop_Description,Address_ID)
        VALUES
        (SHOP_GENERATE.nextval, 'MovieMeg3',3);   

/* Insert Customers
*/
INSERT INTO Customers
        (Customers_ID, F_Name,L_Name,Address_ID,Cell_Number,Date_Joined)
        VALUES
        (CUSTOMERS_GENERATE.nextval, 'Juron','Maree',CustomerAddress_Generate.nextval,0824676853,TO_DATE('03/01/2015', 'DD/MM/YYYY'));
        
INSERT INTO Customers
        (Customers_ID, F_Name,L_Name,Address_ID,Cell_Number,Date_Joined)
        VALUES
        (CUSTOMERS_GENERATE.nextval, 'Johan','van Rooyen',CustomerAddress_Generate.nextval,0715125230,TO_DATE('11/01/2015', 'DD/MM/YYYY'));
        
INSERT INTO Customers
        (Customers_ID, F_Name,L_Name,Address_ID,Cell_Number,Date_Joined)
        VALUES
        (CUSTOMERS_GENERATE.nextval, 'Linda','van Zyl',CustomerAddress_Generate.nextval,0811254789,TO_DATE('15/03/2015', 'DD/MM/YYYY'));        

INSERT INTO Customers
        (Customers_ID, F_Name,L_Name,Address_ID,Cell_Number,Date_Joined)
        VALUES
        (CUSTOMERS_GENERATE.nextval, 'Ruan','Kotze',CustomerAddress_Generate.nextval,0812145963,TO_DATE('16/03/2015', 'DD/MM/YYYY'));
        
INSERT INTO Customers
        (Customers_ID, F_Name,L_Name,Address_ID,Cell_Number,Date_Joined)
        VALUES
        (CUSTOMERS_GENERATE.nextval, 'Nathan','Grobler',CustomerAddress_Generate.nextval,0821236684,TO_DATE('17/03/2015', 'DD/MM/YYYY'));
        
INSERT INTO Customers
        (Customers_ID, F_Name,L_Name,Address_ID,Cell_Number,Date_Joined)
        VALUES
        (CUSTOMERS_GENERATE.nextval, 'Gerrit','Smit',CustomerAddress_Generate.nextval,0715487536,TO_DATE('18/03/2015', 'DD/MM/YYYY'));
        
INSERT INTO Customers
        (Customers_ID, F_Name,L_Name,Address_ID,Cell_Number,Date_Joined)
        VALUES
        (CUSTOMERS_GENERATE.nextval, 'Kobus','du Plessis',CustomerAddress_Generate.nextval,0854125632,TO_DATE('25/04/2015', 'DD/MM/YYYY'));
        
INSERT INTO Customers
        (Customers_ID, F_Name,L_Name,Address_ID,Cell_Number,Date_Joined)
        VALUES
        (CUSTOMERS_GENERATE.nextval, 'Dirk','Odendaal',CustomerAddress_Generate.nextval,0815245896,TO_DATE('26/04/2015', 'DD/MM/YYYY'));
        
INSERT INTO Customers
        (Customers_ID, F_Name,L_Name,Address_ID,Cell_Number,Date_Joined)
        VALUES
        (CUSTOMERS_GENERATE.nextval, 'Koos','van Wyk',CustomerAddress_Generate.nextval,0813297411,TO_DATE('27/04/2015', 'DD/MM/YYYY'));
        
INSERT INTO Customers
        (Customers_ID, F_Name,L_Name,Address_ID,Cell_Number,Date_Joined)
        VALUES
        (CUSTOMERS_GENERATE.nextval, 'Piet','van Wyk',CustomerAddress_Generate.nextval,0812794802,TO_DATE('30/05/2015', 'DD/MM/YYYY'));
    
INSERT INTO Customers
        (Customers_ID, F_Name,L_Name,Address_ID,Cell_Number,Date_Joined)
        VALUES
        (CUSTOMERS_GENERATE.nextval, 'Petrus','Brand',CustomerAddress_Generate.nextval,0715482580,TO_DATE('31/05/2015', 'DD/MM/YYYY'));
        
INSERT INTO Customers
        (Customers_ID, F_Name,L_Name,Address_ID,Cell_Number,Date_Joined)
        VALUES
        (CUSTOMERS_GENERATE.nextval, 'Louis','Koster',CustomerAddress_Generate.nextval,0714250004,TO_DATE('18/06/2015', 'DD/MM/YYYY'));
        
INSERT INTO Customers
        (Customers_ID, F_Name,L_Name,Address_ID,Cell_Number,Date_Joined)
        VALUES
        (CUSTOMERS_GENERATE.nextval, 'At','Koster',CustomerAddress_Generate.nextval,0812444021,TO_DATE('19/06/2015', 'DD/MM/YYYY'));
        
INSERT INTO Customers
        (Customers_ID, F_Name,L_Name,Address_ID,Cell_Number,Date_Joined)
        VALUES
        (CUSTOMERS_GENERATE.nextval, 'Annelize','Roux',CustomerAddress_Generate.nextval,0815552233,TO_DATE('20/06/2015', 'DD/MM/YYYY'));
        
INSERT INTO Customers
        (Customers_ID, F_Name,L_Name,Address_ID,Cell_Number,Date_Joined)
        VALUES
        (CUSTOMERS_GENERATE.nextval, 'Naomi','Ferrera',CustomerAddress_Generate.nextval,0714455826,TO_DATE('21/06/2015', 'DD/MM/YYYY'));
        /*15*/

/* Insert DVD
*/
INSERT INTO DVD
        (DVD_ID, Title,Genre_ID,Age_Res_ID,Date_Of_Release,Length_Of_DVD,DVD_Cost)
        VALUES
        (DVD_GENERATE.nextval, 'Avengers',2,2,TO_DATE('17/02/2015', 'DD/MM/YYYY'),123,55);   
        
 INSERT INTO DVD
        (DVD_ID, Title,Genre_ID,Age_Res_ID,Date_Of_Release,Length_Of_DVD,DVD_Cost)
        VALUES
        (DVD_GENERATE.nextval, 'Thor: Ragnarok',3,2,TO_DATE('18/02/2015', 'DD/MM/YYYY'),140,60); 
        
 INSERT INTO DVD
        (DVD_ID, Title,Genre_ID,Age_Res_ID,Date_Of_Release,Length_Of_DVD,DVD_Cost)
        VALUES
        (DVD_GENERATE.nextval, 'The Godfather',1,1,TO_DATE('24/03/1942', 'DD/MM/YYYY'),135,80); 
        
 INSERT INTO DVD
        (DVD_ID, Title,Genre_ID,Age_Res_ID,Date_Of_Release,Length_Of_DVD,DVD_Cost)
        VALUES
        (DVD_GENERATE.nextval, 'The Green Mile',1,1,TO_DATE('25/06/1995', 'DD/MM/YYYY'),138,60); 
        
 INSERT INTO DVD
        (DVD_ID, Title,Genre_ID,Age_Res_ID,Date_Of_Release,Length_Of_DVD,DVD_Cost)
        VALUES
        (DVD_GENERATE.nextval, 'Star Wars: Episode 1',4,2,TO_DATE('18/03/1973', 'DD/MM/YYYY'),125,45); 
        
 INSERT INTO DVD
        (DVD_ID, Title,Genre_ID,Age_Res_ID,Date_Of_Release,Length_Of_DVD,DVD_Cost)
        VALUES
        (DVD_GENERATE.nextval, 'Lion King',5,5,TO_DATE('26/04/1997', 'DD/MM/YYYY'),105,50); 
        
 INSERT INTO DVD
        (DVD_ID, Title,Genre_ID,Age_Res_ID,Date_Of_Release,Length_Of_DVD,DVD_Cost)
        VALUES
        (DVD_GENERATE.nextval, 'Antz',5,2,TO_DATE('15/12/2004', 'DD/MM/YYYY'),97,30); 
        
 INSERT INTO DVD
        (DVD_ID, Title,Genre_ID,Age_Res_ID,Date_Of_Release,Length_Of_DVD,DVD_Cost)
        VALUES
        (DVD_GENERATE.nextval, 'Note Book',6,4,TO_DATE('12/02/2015', 'DD/MM/YYYY'),115,50); 
        
 INSERT INTO DVD
        (DVD_ID, Title,Genre_ID,Age_Res_ID,Date_Of_Release,Length_Of_DVD,DVD_Cost)
        VALUES
        (DVD_GENERATE.nextval, 'Journey to centre',2,3,TO_DATE('14/03/2010', 'DD/MM/YYYY'),103,55); 
        
 INSERT INTO DVD
        (DVD_ID, Title,Genre_ID,Age_Res_ID,Date_Of_Release,Length_Of_DVD,DVD_Cost)
        VALUES
        (DVD_GENERATE.nextval, 'Marley and Me',6,2,TO_DATE('15/02/2009', 'DD/MM/YYYY'),115,55); 
        
 INSERT INTO DVD
        (DVD_ID, Title,Genre_ID,Age_Res_ID,Date_Of_Release,Length_Of_DVD,DVD_Cost)
        VALUES
        (DVD_GENERATE.nextval, 'EroticaXXX',6,1,TO_DATE('14/02/2010', 'DD/MM/YYYY'),85,90); 
        
 INSERT INTO DVD
        (DVD_ID, Title,Genre_ID,Age_Res_ID,Date_Of_Release,Length_Of_DVD,DVD_Cost)
        VALUES
        (DVD_GENERATE.nextval, 'Stroomop',2,4,TO_DATE('15/03/2019', 'DD/MM/YYYY'),117,55); 
        
 INSERT INTO DVD
        (DVD_ID, Title,Genre_ID,Age_Res_ID,Date_Of_Release,Length_Of_DVD,DVD_Cost)
        VALUES
        (DVD_GENERATE.nextval, 'Avengers: Endgame',2,1,TO_DATE('17/12/2019', 'DD/MM/YYYY'),195,70); 
        
 INSERT INTO DVD
        (DVD_ID, Title,Genre_ID,Age_Res_ID,Date_Of_Release,Length_Of_DVD,DVD_Cost)
        VALUES
        (DVD_GENERATE.nextval, 'Irom Man',2,2,TO_DATE('17/12/2013', 'DD/MM/YYYY'),124,40); 
        
 INSERT INTO DVD
        (DVD_ID, Title,Genre_ID,Age_Res_ID,Date_Of_Release,Length_Of_DVD,DVD_Cost)
        VALUES
        (DVD_GENERATE.nextval, 'Spirit',2,5,TO_DATE('17/12/2004', 'DD/MM/YYYY'),116,50); 
        /*15*/
        
/*Insert Transactions
*/
INSERT INTO Transactions
        (Transaction_ID, Customer_ID, DVD_ID,Shop_ID, Rental_Date , Return_Date, Total)
        VALUES
        (Transaction_Generate.nextval,1,2,1,TO_DATE('17/12/2015', 'DD/MM/YYYY'),TO_DATE('19/12/2015', 'DD/MM/YYYY'),60);  
        
INSERT INTO Transactions
        (Transaction_ID, Customer_ID, DVD_ID,Shop_ID, Rental_Date , Return_Date, Total)
        VALUES
        (Transaction_Generate.nextval,2,3,1,TO_DATE('19/12/2015', 'DD/MM/YYYY'),TO_DATE('21/12/2015', 'DD/MM/YYYY'),80);  
        
INSERT INTO Transactions
        (Transaction_ID, Customer_ID, DVD_ID,Shop_ID, Rental_Date , Return_Date, Total)
        VALUES
        (Transaction_Generate.nextval,3,8,2,TO_DATE('17/12/2015', 'DD/MM/YYYY'),TO_DATE('19/12/2015', 'DD/MM/YYYY'),50);  
        
INSERT INTO Transactions
        (Transaction_ID, Customer_ID, DVD_ID,Shop_ID, Rental_Date , Return_Date, Total)
        VALUES
        (Transaction_Generate.nextval,4,8,3,TO_DATE('17/12/2015', 'DD/MM/YYYY'),TO_DATE('19/12/2015', 'DD/MM/YYYY'),55);  
        
INSERT INTO Transactions
        (Transaction_ID, Customer_ID, DVD_ID,Shop_ID, Rental_Date , Return_Date, Total)
        VALUES
        (Transaction_Generate.nextval,5,1,1,TO_DATE('17/12/2015', 'DD/MM/YYYY'),TO_DATE('19/12/2015', 'DD/MM/YYYY'),55);  
        
INSERT INTO Transactions
        (Transaction_ID, Customer_ID, DVD_ID,Shop_ID, Rental_Date , Return_Date, Total)
        VALUES
        (Transaction_Generate.nextval,6,4,2,TO_DATE('17/12/2015', 'DD/MM/YYYY'),TO_DATE('19/12/2015', 'DD/MM/YYYY'),60);  
        
INSERT INTO Transactions
        (Transaction_ID, Customer_ID, DVD_ID,Shop_ID, Rental_Date , Return_Date, Total)
        VALUES
        (Transaction_Generate.nextval,7,7,3,TO_DATE('17/12/2015', 'DD/MM/YYYY'),TO_DATE('19/12/2015', 'DD/MM/YYYY'),30);  
        
INSERT INTO Transactions
        (Transaction_ID, Customer_ID, DVD_ID,Shop_ID, Rental_Date , Return_Date, Total)
        VALUES
        (Transaction_Generate.nextval,8,5,1,TO_DATE('17/12/2015', 'DD/MM/YYYY'),TO_DATE('19/12/2015', 'DD/MM/YYYY'),45);  
        
INSERT INTO Transactions
        (Transaction_ID, Customer_ID, DVD_ID,Shop_ID, Rental_Date , Return_Date, Total)
        VALUES
        (Transaction_Generate.nextval,9,6,2,TO_DATE('17/12/2015', 'DD/MM/YYYY'),TO_DATE('19/12/2015', 'DD/MM/YYYY'),60);  
        
INSERT INTO Transactions
        (Transaction_ID, Customer_ID, DVD_ID,Shop_ID, Rental_Date , Return_Date, Total)
        VALUES
        (Transaction_Generate.nextval,10,15,3,TO_DATE('17/12/2015', 'DD/MM/YYYY'),TO_DATE('19/12/2015', 'DD/MM/YYYY'),100);  
        
INSERT INTO Transactions
        (Transaction_ID, Customer_ID, DVD_ID,Shop_ID, Rental_Date , Return_Date, Total)
        VALUES
        (Transaction_Generate.nextval,11,13,1,TO_DATE('17/12/2015', 'DD/MM/YYYY'),TO_DATE('19/12/2015', 'DD/MM/YYYY'),80);  
        
INSERT INTO Transactions
        (Transaction_ID, Customer_ID, DVD_ID,Shop_ID, Rental_Date , Return_Date, Total)
        VALUES
        (Transaction_Generate.nextval,12,14,2,TO_DATE('17/12/2015', 'DD/MM/YYYY'),TO_DATE('19/12/2015', 'DD/MM/YYYY'),80);  
        
INSERT INTO Transactions
        (Transaction_ID, Customer_ID, DVD_ID,Shop_ID, Rental_Date , Return_Date, Total)
        VALUES
        (Transaction_Generate.nextval,13,12,3,TO_DATE('17/12/2015', 'DD/MM/YYYY'),TO_DATE('19/12/2015', 'DD/MM/YYYY'),85);  
        
INSERT INTO Transactions
        (Transaction_ID, Customer_ID, DVD_ID,Shop_ID, Rental_Date , Return_Date, Total)
        VALUES
        (Transaction_Generate.nextval,14,11,1,TO_DATE('17/12/2015', 'DD/MM/YYYY'),TO_DATE('19/12/2015', 'DD/MM/YYYY'),60);  
        
INSERT INTO Transactions
        (Transaction_ID, Customer_ID, DVD_ID,Shop_ID, Rental_Date , Return_Date, Total)
        VALUES
        (Transaction_Generate.nextval,15,10,3,TO_DATE('17/12/2015', 'DD/MM/YYYY'),TO_DATE('19/12/2015', 'DD/MM/YYYY'),100);
        
/* awe*/ 
        /*15*/
        
/* Create DSS Tables*/        
/*
DROP TABLE TRANSACTION_DIM;
DROP TABLE CUSTOMER_DIM;
DROP TABLE SHOP_DIM;
DROP TABLE DVD_DIM;
DROP TABLE SALES_FACT;
DROP TABLE CUSTOMER_FACT;
DROP TABLE TOPDVD_FACT;

PURGE TABLE TRANSACTION_DIM;
PURGE TABLE CUSTOMER_DIM;
PURGE TABLE SHOP_DIM;
PURGE TABLE DVD DIM;
PURGE TABLE SALES_FACT;
PURGE TABLE CUSTOMER_FACT;
PURGE TABLE TOPDVD_FACT;
*/

CREATE TABLE TRANSACTION_DIM
(
    Transaction_ID    NUMBER(5)        NOT NULL,
    Rental_Title         VARCHAR(30),
    Rental_Date         DATE,
    Return_Date        DATE,
    Total            NUMBER(10),
    CONSTRAINT PK_STAR_Transaction_ID PRIMARY KEY (Transaction_ID)
);

CREATE TABLE CUSTOMER_DIM
(
    Customer_ID         NUMBER(13)        NOT NULL,
    Customer_F_Name    VARCHAR(20),
    Customer_L_Name    VARCHAR(20),
    Customer_Address    VARCHAR(30),
    Cell_Number        NUMBER(10),
    Date_Joined        DATE,
    CONSTRAINT PK_STAR_Customer_ID PRIMARY KEY(Customer_ID)
);

CREATE TABLE SHOP_DIM
(
    Shop_ID        NUMBER(5)         NOT NULL,
    Shop_Description    VARCHAR(50),
    Shop_Address    VARCHAR(30),
    CONSTRAINT PK_STAR_Shop_ID PRIMARY KEY (Shop_ID)
);

CREATE TABLE DVD_DIM
(
    DVD_ID        NUMBER(6)        NOT NULL,
    Title            VARCHAR(30),
    Genre_Description    VARCHAR(10),
    Age_Description    VARCHAR(5),
    Date_Of_Release    DATE,
    Length            NUMBER(3),
    Cost            NUMBER(10),
    CONSTRAINT PK_STAR_DVD_ID PRIMARY KEY (DVD_ID)
);

CREATE TABLE SALES_FACT
(
    Time_Month        NUMBER(2)        NOT NULL,
    Shop_ID        NUMBER(5)        NOT NULL,
    Customer_ID        NUMBER(13)        NOT NULL,
    Transaction_ID    NUMBER(5)        NOT NULL,
    Sales_Quantity     NUMBER(3),
    Sales_Total        NUMBER(4),
CONSTRAINT PK_STAR_SALES_FACT PRIMARY KEY (Time_Month, Shop_ID, Customer_ID, Transaction_ID),
CONSTRAINT FK_STAR_SALES_Shop_ID FOREIGN KEY (Shop_ID) REFERENCES SHOP_DIM(Shop_ID),
CONSTRAINT FK_STAR_SALES_Customer_ID FOREIGN KEY (Customer_ID) REFERENCES CUSTOMER_DIM(Customer_ID),
CONSTRAINT FK_STAR_SALES_Transaction_ID FOREIGN KEY (Transaction_ID) REFERENCES TRANSACTION_DIM(Transaction_ID)
);

CREATE TABLE CUSTOMER_FACT
(
    Time_Year        NUMBER(4)        NOT NULL,
    Time_Month        NUMBER(2)        NOT NULL,
    Shop_ID        NUMBER(5)        NOT NULL,
    Customer_ID        NUMBER(13)        NOT NULL,
    
    Total_Sales        NUMBER(3),
    Total_Price        Number(10)
    ,
CONSTRAINT PK_STAR_CUS_FACT PRIMARY KEY (Time_Year, Time_Month, Shop_ID, Customer_ID));
,
CONSTRAINT FK_STAR_CUS_Shop_ID FOREIGN KEY (Shop_ID) REFERENCES SHOP_DIM(Shop_ID),
CONSTRAINT FK_STAR_CUS_Customer_ID FOREIGN KEY (Customer_ID) REFERENCES CUSTOMER_DIM(Customer_ID),
CONSTRAINT FK_STAR_CUS_Trans_ID FOREIGN KEY (Transaction_ID) REFERENCES TRANSACTION_DIM(Transaction_ID)
);

CREATE TABLE TOPDVD_FACT
(
    DVD_ID            NUMBER(6)        NOT NULL,
    Shop_ID            NUMBER(5)        NOT NULL,
    Transaction_ID  NUMBER(6) NOT NULL,
    Time_Month            NUMBER(2)        NOT NULL,
    Total_Sales            NUMBER(3),
    Total_Price_Per_Genre    Number(10),
    CONSTRAINT PK_STAR_TOPDVD_FACT PRIMARY KEY (DVD_ID, Shop_ID,Transaction_ID, Time_Month),
CONSTRAINT FK_STAR_TOPDVD_DVD_ID FOREIGN KEY (DVD_ID) REFERENCES DVD_DIM(DVD_ID),
CONSTRAINT FK_STAR_TOPDVD_Shop_ID FOREIGN KEY (Shop_ID) REFERENCES SHOP_DIM(Shop_ID),CONSTRAINT FK_STAR_CUS_Trans_ID FOREIGN KEY (Transaction_ID) REFERENCES TRANSACTION_DIM(Transaction_ID)
);

  
/* SQL to populate SALES_FACT*/

ALTER TABLE SALES_FACT
DISABLE CONSTRAINT 
 PK_STAR_SALES_FACT ;


ALTER TABLE SALES_FACT
DISABLE CONSTRAINT 
 FK_STAR_SALES_Shop_ID ;

ALTER TABLE SALES_FACT
DISABLE CONSTRAINT 
 FK_STAR_SALES_Customer_ID ;

ALTER TABLE SALES_FACT 
DISABLE CONSTRAINT 
 FK_STAR_SALES_Transaction_ID ;


ALTER TABLE TRANSACTION_DIM 
DISABLE CONSTRAINT 
 PK_STAR_Transaction_ID ;


ALTER TABLE CUSTOMER_DIM 
DISABLE CONSTRAINT 
 PK_STAR_Customer_ID;


ALTER TABLE SHOP_DIM 
DISABLE CONSTRAINT
 PK_STAR_Shop_ID;


BEGIN
 
COMMIT;

SET TRANSACTION READ WRITE NAME "UpdateSales_Fact" ;
SAVEPOINT SalesFactSP;

INSERT INTO SALES_FACT
    SELECT DISTINCT
    EXTRACT(MONTH FROM t.Rental_Date)"Month",
    s.Shop_ID AS "Shop",
c.Customers_ID AS "Customer",
t.Transaction_ID AS "Transaction",
Count(t.Transaction_ID),
SUM(t.TOTAl)"Total"

FROM Transactions t, SHOP s, Customers c

WHERE t.RENTAL_DATE >(SELECT TRANSACTION_UPDATE_DATE From TRANSACTION_UPDATE WHERE Transaction_Update_number = 1)
 AND t.Customer_ID = c.Customers_ID 
    AND t.Shop_ID = s.SHOP_ID
GROUP BY EXTRACT(MONTH FROM t.Rental_Date), s.Shop_ID,c.Customers_ID , t.TRANSACTION_ID ;


INSERT 
INTO TRANSACTION_DIM 
SELECT DISTINCT t.TRANSACTION_ID ,d.TITLE,t.RENTAL_DATE,t.RETURN_DATE,t.TOTAL
FROM Transactions t ,DVD d
WHERE t.DVD_ID = d.DVD_ID;


INSERT INTO SHOP_DIM
SELECT DISTINCT s.SHOP_ID ,s.SHOP_DESCRIPTION, a.Address_Name
FROM SHOP s ,ADDRESS a
WHERE s.Address_ID = a.Address_ID;




INSERT INTO CUSTOMER_DIM
SELECT DISTINCT c.Customers_ID, c.F_Name, c.L_Name , a.Address_Name,c.Cell_Number , c.Date_Joined
FROM customers  c,ADDRESS a
WHERE c.Address_ID  = a.Address_ID;
 
COMMIT;

EXCEPTION WHEN OTHERS THEN ROLLBACK TO SalesFactSP;

END;



ALTER TABLE SALES_FACT
ENABLE CONSTRAINT 
 PK_STAR_SALES_FACT ;


ALTER TABLE SALES_FACT
ENABLE CONSTRAINT 
 FK_STAR_SALES_Shop_ID ;

ALTER TABLE SALES_FACT
ENABLE CONSTRAINT 
 FK_STAR_SALES_Customer_ID ;

ALTER TABLE SALES_FACT 
ENABLE CONSTRAINT 
 FK_STAR_SALES_Transaction_ID ;


ALTER TABLE TRANSACTION_DIM 
ENABLE CONSTRAINT 
 PK_STAR_Transaction_ID ;


ALTER TABLE CUSTOMER_DIM 
ENABLE CONSTRAINT 
 PK_STAR_Customer_ID;


ALTER TABLE SHOP_DIM 
ENABLE CONSTRAINT
 PK_STAR_Shop_ID;





/* SQL to populate CUSTOMER_FACT*/

/* REG CUSTOME_FACT*/
ALTER TABLE CUSTOMER_FACT
DISABLE CONSTRAINT
 PK_STAR_CUS_FACT;

ALTER TABLE CUSTOMER_FACT
DISABLE CONSTRAINT
 FK_STAR_CUS_Shop_ID;

ALTER TABLE CUSTOMER_FACT
DISABLE CONSTRAINT
 FK_STAR_CUS_Customer_ID;

ALTER TABLE CUSTOMER_FACT
DISABLE CONSTRAINT
 FK_STAR_CUS_Trans_ID;
 
ALTER TABLE CUSTOMER_DIM
DISABLE CONSTRAINT
PK_STAR_CUSTOMER_ID ;

ALTER TABLE SHOP_DIM
DISABLE CONSTRAINT
PK_STAR_SHOP_ID;

ALTER TABLE TRANSACTION_DIM
DISABLE CONSTRAINT
PK_STAR_TRANSACTION_ID;



BEGIN
COMMIT;
SET TRANSACTION READ WRITE NAME "UpdateCustomer_Fact" ;
SAVEPOINT CustomerFactSP;

INSERT INTO CUSTOMER_FACT
    SELECT DISTINCT
        EXTRACT(YEAR FROM c.DATE_JOINED) "YEAR Joined",
        EXTRACT(MONTH FROM c.DATE_JOINED) "MONTH Joined",
        s.Shop_ID AS "Shop",
        c.Customers_ID AS "Customer",
        Count(t.Transaction_ID) "TOTAL SALES" ,
        SUM(t.TOTAL) "TOTAL"

FROM customers c, SHOP s , transactions t

WHERE c.Date_Joined >(SELECT CUSTOMER_UPDATE_DATE FROM CUSTOMER_UPDATE WHERE CUSTOMER_UPDATE_NUMBER =1)
    AND c.Customers_ID = t.Customer_ID 
    AND t.SHOP_ID = s.SHOP_ID
GROUP BY EXTRACT(YEAR FROM c.DATE_JOINED),EXTRACT(MONTH FROM c.DATE_JOINED),c.Customers_ID,s.SHOP_ID ;



        
INSERT INTO SHOP_DIM
SELECT DISTINCT s.SHOP_ID,s.SHOP_DESCRIPTION,a.Address_Name
FROM SHOP s ,ADDRESS A
WHERE a.ADDRESS_ID=s.ADDRESS_ID ;

INSERT INTO CUSTOMER_DIM
SELECT DISTINCT c.Customers_ID, c.F_Name, c.L_Name,a.Address_Name,c.Cell_Number, c.Date_Joined
FROM CUSTOMERs c ,ADDRESS a
WHERE c.ADDRESS_ID=a.ADDRESS_ID ;

INSERT INTO TRANSACTION_DIM
SELECT DISTINCT t.Transaction_ID, t.Title, t.RENTAL_DATE,  t.RETURN_DATE, t.TOTAL
FROM TRANSACTIONs t;

ALTER TABLE CUSTOMER_FACT
ENABLE CONSTRAINT
 PK_STAR_CUSTOMER_FACT;

ALTER TABLE CUSTOMER_FACT
ENABLE CONSTRAINT
 FK_STAR_SHOP_DIM;

ALTER TABLE CUSTOMER_FACT
ENABLE CONSTRAINT
 FK_STAR_CUSTOMER_DIM;

ALTER TABLE CUSTOMER_DIM
ENABLE CONSTRAINT
PK_STAR_CUSTOMER_ID ;

ALTER TABLE SHOP_DIM
ENABLE CONSTRAINT
PK_STAR_SHOP_ID;

ALTER TABLE TRANSACTION_DIM
ENABLE CONSTRAINT
PK_STAR_TRANSACTION_ID;


/* SQL to populate TOPDVD_FACT*/

ALTER TABLE TOPDVD_FACT   
DISABLE CONSTRAINT 
PK_STAR_TOPDVD_FACT;

ALTER TABLE TOPDVD_FACT
DISABLE CONSTRAINT
FK_STAR_TOPDVD_DVD_ID;

ALTER TABLE TOPDVD_FACT
DISABLE CONSTRAINT
FK_STAR_TOPDVD_Shop_ID;

ALTER TABLE DVD_DIM 
DISABLE CONSTRAINT 
PK_STAR_DVD_ID;


ALTER TABLE SHOP_DIM 
DISABLE CONSTRAINT 
 PK_STAR_Shop_ID;

BEGIN

COMMIT;

SET TRANSACTION READ WRITE NAME "UpdateTopDVDFact";
SAVEPOINT TopDVDFactSP;

INSERT INTO TOPDVD_FACT
SELECT DISTINCT 
d.DVD_ID AS "DVD",
s.Shop_ID AS "Shop",
t.Transaction_ID,
EXTRACT(MONTH FROM t.Rental_Date) "Month",
COUNT(t.DVD_ID),
SUM(t.Total)
FROM SHOP s, DVD d, transactions t
WHERE d.DATE_OF_RELEASE > (SELECT TOPDVD_UPDATE_DATE FROM DVD_UPDATE WHERE TOPDVD_UPDATE_NUMBER =1)
    AND d.DVD_ID = t.DVD_ID
    AND t.SHOP_ID = t.SHOP_ID
GROUP BY s.Shop_ID,d.DVD_ID,t.DVD_ID,EXTRACT(MONTH FROM t.Rental_Date) ;

Transactions
        (Transaction_ID, Customer_ID, DVD_ID,Shop_ID, Rental_Date , Return_Date, Total)
INSERT INTO SHOP_DIM
SELECT DISTINCT s.SHOP_ID ,s.SHOP_DESCRIPTION, 
a.ADDRES_NAME
FROM SHOP s ,ADDRESS a
WHERE s.ADDRES_ID = a.ADDRES_ID;


INSERT INTO DVD_DIM
SELECT DISTINCT d.DVD_ID, d.Title, g.Genre_Description, a.Age_Restriction_Description, d.Date_Of_Release, d.Length_OF_DVD, d.DVD_Cost
    FROM DVD d, GENRE g, AGE_RESTRICTION a

    WHERE d.GENRE_ID = g.GENRE_ID 
        AND d.AGE_RES_ID = a.AGE_RES_ID;

COMMIT;
 
EXCEPTION
 
WHEN OTHERS THEN
 
ROLLBACK TO TopDVDFactSP;
 
END;


ALTER TABLE TOPDVD_FACT   
ENABLE CONSTRAINT 
PK_STAR_TOPDVD;

ALTER TABLE TOPDVD_FACT
ENABLE CONSTRAINT
FK_DVD_DIM;

ALTER TABLE TOPDVD_FACT
ENABLE CONSTRAINT
FK_SHOP_DIM;

ALTER TABLE DVD_DIM 
ENABLE CONSTRAINT 
PK_STAR_DVD_ID;


ALTER TABLE SHOP_DIM 
ENABLE CONSTRAINT 
PK_STAR_Shop_ID;

/* Update/Refrsh*/
DROP TABLE TRANSACTION_UPDATE ;
DROP TABLE CUSTOMER_UPDATE ;
DROP TABLE DVD_UPDATE;

PURGE TABLE CUSTOMER_UPDATE;
PURGE TABLE TRANSACTION_UPDATE;
PURGE TABLE DVD_UPDATE;

CREATE TABLE TRANSACTION_UPDATE
(
Transaction_Update_number  NUMBER(1) NOT NULL,
TRANSACTION_UPDATE_DATE  DATE,
CONSTRAINT PK_TRANSACTION_UPDATE PRIMARY KEY(Transaction_Update_number)
);


CREATE TABLE CUSTOMER_UPDATE
( 
CUSTOMER_UPDATE_NUMBER             NUMBER(1) NOT NULL, 
CUSTOMER_UPDATE_DATE             DATE, 
CONSTRAINT PK_CUSTOMER_UPDATE PRIMARY KEY(CUSTOMER_UPDATE_NUMBER) 
);


CREATE TABLE DVD_UPDATE
(
TOPDVD_UPDATE_NUMBER             NUMBER(1) NOT NULL,
 TOPDVD_UPDATE_DATE                 DATE, 
CONSTRAINT PK_TOPDVD_UPDATE PRIMARY KEY(TOPDVD_UPDATE_NUMBER)
);


INSERT ALL
INTO TRANSACTION_UPDATE(Transaction_Update_number ,TRANSACTION_UPDATE_DATE )
VALUES (1,TO_DATE('01/01/2015', 'DD/MM/YYYY'))

INTO CUSTOMER_UPDATE(CUSTOMER_UPDATE_NUMBER ,CUSTOMER_UPDATE_DATE )
VALUES (1,TO_DATE('01/01/2015', 'DD/MM/YYYY'))

INTO DVD_UPDATE(TOPDVD_UPDATE_NUMBER ,TOPDVD_UPDATE_DATE )
VALUES (1,TO_DATE('01/01/2015', 'DD/MM/YYYY'))

SELECT 1 FROM DUAL;


UPDATE TRANSACTION_UPDATE
SET Transaction_Update_number=1,TRANSACTION_UPDATE_DATE=SYSDATE;

UPDATE CUSTOMER_UPDATE
SET CUSTOMER_UPDATE_NUMBER=1,CUSTOMER_UPDATE_DATE=SYSDATE;

UPDATE DVD_UPDATE
SET TOPDVD_UPDATE_NUMBER=1,TOPDVD_UPDATE_DATE=SYSDATE;

/* Creation of Indexes*/
CREATE INDEX SHOP_DESCRIP_IDX
ON SHOP(Shop_DESCRIPTION);

CREATE INDEX TRANS_RETURN_IDX
ON TRANSACTIONs(RETURN_DATE);


/* SQL QUERIES - INFORMATION FOR DECISION MAKING*/

/*This statement shows which Shop sold the most DVDs*/

SELECT c.CUSTOMER_F_NAME, c.CUSTOMER_L_NAME, s.SHOP_DESCRIPTION, sf.SALES_QUANTITY , sf.SALES_TOTAL
FROM CUSTOMER_DIM c , SHOP_DIM s , TRANSACTION_DIM t, SALES_FACT sf
WHERE sf.SHOP_ID= s.SHOP_ID 
AND sf.CUSTOMER_ID = c.CUSTOMER_ID
AND sf.TRANSACTION_ID = t.TRANSACTION_ID

/*This statement shows the name and surname of the client that bought the most DVD. It also shows the Shop where the DVD was sold. The quantity of DVD that is sold as well as the Total price:
*/
SELECT cf.Time_YEAR,cf.TIME_MONTH, s.SHOP_DESCRIPTION,c.CUSTOMER_F_NAME, cf.TOTAL_SALES , cf.TOTAL_PRICE
FROM CUSTOMER_FACT cf , CUSTOMER_DIM c , SHOP_DIM  s 
WHERE cf.SHOP_ID = s.SHOP_ID
    AND cf.CUSTOMER_ID = c.CUSTOMER_ID ;

/*Shows the best DVDS sold per DVD, GENRE , SHOP.*/

SELECT d.Title, s.SHOP_DESCRIPTION, tf.Time_MONTH, tf.TOTAL_SALES, tf.TOTAL_PRICE
FROM TOPDVD_FACT tf , SHOP_DIM s , DVD_DIM  d
WHERE tf.DVD_ID = d.DVD_ID
    AND tf.SHOP_ID = s.SHOP_ID;

           