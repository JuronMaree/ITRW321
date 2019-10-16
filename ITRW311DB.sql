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
        Shop_ID         NUMBER(7)         NOT NULL,
        
        CONSTRAINT fk_Genre_ID1 FOREIGN KEY (Genre_ID)
                REFERENCES Genre(Genre_ID),
        CONSTRAINT fk_Age_Res_ID1 FOREIGN KEY (Age_Res_ID)
                REFERENCES Age_Restriction(Age_Res_ID),
        CONSTRAINT fk_Shop_ID1 FOREIGN KEY (Shop_ID)
                REFERENCES Shop(Shop_ID)
                    ); 
CREATE TABLE Transactions (
        Transaction_ID          NUMBER(7)       PRIMARY KEY      NOT NULL,
        Customer_ID             NUMBER(7)         NOT NULL,
        DVD_ID                  NUMBER(7)         NOT NULL,
        Rental_Date             DATE            DEFAULT SYSDATE,
        Return_Date             DATE            DEFAULT SYSDATE,
        Total                   NUMBER(10)         NOT NULL,
        
        CONSTRAINT fk_Customer_ID1 FOREIGN KEY (Customer_ID)
                REFERENCES Customers(Customers_ID),
        CONSTRAINT fk_DVD_ID1 FOREIGN KEY (DVD_ID)
                REFERENCES DVD(DVD_ID)
                    ); 

/* Sequences
*/    
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

/* Insert GENRE
*/    

INSERT INTO Genre
        (Genre_ID, Genre_Description)
        VALUES
        (GenreGenerate.NEXTVAL, 'Action');                    
/* Insert Age Restriction
*/    
INSERT INTO Age_Restriction
        (Age_Res_ID, Age_Restriction_Description)
        VALUES
        (AGE_RES_GENERATE.nextval, '18+');                  
                    
/* Insert Address
*/    
INSERT INTO Address
        (Address_ID, Address_Name,Addres_Number,City,Postal_Code)
        VALUES
        (ADDRESS_GENERATE.nextval, 'Kerkstraat','9','Potchefstroom',2520);                       
                    
                    
INSERT INTO Shop
        (Shop_ID, Shop_Description,Address_ID)
        VALUES
        (SHOP_GENERATE.nextval, 'MovieMeg',1);                       
                    
INSERT INTO Customers
        (Customers_ID, F_Name,L_Name,Address_ID,Cell_Number,Date_Joined)
        VALUES
        (CUSTOMERS_GENERATE.nextval, 'Juron', 'Maree',1,0824676853,TO_DATE('17/12/2015', 'DD/MM/YYYY'));                                
 INSERT INTO DVD
        (DVD_ID, Title,Genre_ID,Age_Res_ID,Date_Of_Release,Length_Of_DVD,DVD_Cost,Shop_ID)
        VALUES
        (DVD_GENERATE.nextval, 'Avengers',2,1,TO_DATE('17/12/2015', 'DD/MM/YYYY'),123,55,1);                         
                                        
  INSERT INTO Transactions
        (Transaction_ID, Customer_ID, DVD_ID, Rental_Date , Return_Date, Total)
        VALUES
        (Transaction_Generate.nextval,1,2,TO_DATE('17/12/2015', 'DD/MM/YYYY'),TO_DATE('19/12/2015', 'DD/MM/YYYY'),123);                    
                    
                    
                    
                    
                    
          
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    