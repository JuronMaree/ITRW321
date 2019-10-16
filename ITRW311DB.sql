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
        (DVD_ID, Title,Genre_ID,Age_Res_ID,Date_Of_Release,Length_Of_DVD,DVD_Cost,Shop_ID)
        VALUES
        (DVD_GENERATE.nextval, 'Avengers',2,2,TO_DATE('17/02/2015', 'DD/MM/YYYY'),123,55,1);   
        
 INSERT INTO DVD
        (DVD_ID, Title,Genre_ID,Age_Res_ID,Date_Of_Release,Length_Of_DVD,DVD_Cost,Shop_ID)
        VALUES
        (DVD_GENERATE.nextval, 'Thor: Ragnarok',3,2,TO_DATE('18/02/2015', 'DD/MM/YYYY'),140,60,1); 
        
 INSERT INTO DVD
        (DVD_ID, Title,Genre_ID,Age_Res_ID,Date_Of_Release,Length_Of_DVD,DVD_Cost,Shop_ID)
        VALUES
        (DVD_GENERATE.nextval, 'The Godfather',1,1,TO_DATE('24/03/1942', 'DD/MM/YYYY'),135,80,1); 
        
 INSERT INTO DVD
        (DVD_ID, Title,Genre_ID,Age_Res_ID,Date_Of_Release,Length_Of_DVD,DVD_Cost,Shop_ID)
        VALUES
        (DVD_GENERATE.nextval, 'The Green Mile',1,1,TO_DATE('25/06/1995', 'DD/MM/YYYY'),138,60,1); 
        
 INSERT INTO DVD
        (DVD_ID, Title,Genre_ID,Age_Res_ID,Date_Of_Release,Length_Of_DVD,DVD_Cost,Shop_ID)
        VALUES
        (DVD_GENERATE.nextval, 'Star Wars: Episode 1',4,2,TO_DATE('18/03/1973', 'DD/MM/YYYY'),125,45,1); 
        
 INSERT INTO DVD
        (DVD_ID, Title,Genre_ID,Age_Res_ID,Date_Of_Release,Length_Of_DVD,DVD_Cost,Shop_ID)
        VALUES
        (DVD_GENERATE.nextval, 'Lion King',5,5,TO_DATE('26/04/1997', 'DD/MM/YYYY'),105,50,2); 
        
 INSERT INTO DVD
        (DVD_ID, Title,Genre_ID,Age_Res_ID,Date_Of_Release,Length_Of_DVD,DVD_Cost,Shop_ID)
        VALUES
        (DVD_GENERATE.nextval, 'Antz',5,2,TO_DATE('15/12/2004', 'DD/MM/YYYY'),97,30,2); 
        
 INSERT INTO DVD
        (DVD_ID, Title,Genre_ID,Age_Res_ID,Date_Of_Release,Length_Of_DVD,DVD_Cost,Shop_ID)
        VALUES
        (DVD_GENERATE.nextval, 'Note Book',6,4,TO_DATE('12/02/2015', 'DD/MM/YYYY'),115,50,2); 
        
 INSERT INTO DVD
        (DVD_ID, Title,Genre_ID,Age_Res_ID,Date_Of_Release,Length_Of_DVD,DVD_Cost,Shop_ID)
        VALUES
        (DVD_GENERATE.nextval, 'Journey to the centre of the earth',2,3,TO_DATE('14/03/2010', 'DD/MM/YYYY'),103,55,2); 
        
 INSERT INTO DVD
        (DVD_ID, Title,Genre_ID,Age_Res_ID,Date_Of_Release,Length_Of_DVD,DVD_Cost,Shop_ID)
        VALUES
        (DVD_GENERATE.nextval, 'Marley and Me',6,2,TO_DATE('15/02/2009', 'DD/MM/YYYY'),115,55,2); 
        
 INSERT INTO DVD
        (DVD_ID, Title,Genre_ID,Age_Res_ID,Date_Of_Release,Length_Of_DVD,DVD_Cost,Shop_ID)
        VALUES
        (DVD_GENERATE.nextval, 'EroticaXXX',6,1,TO_DATE('14/02/2010', 'DD/MM/YYYY'),85,90,3); 
        
 INSERT INTO DVD
        (DVD_ID, Title,Genre_ID,Age_Res_ID,Date_Of_Release,Length_Of_DVD,DVD_Cost,Shop_ID)
        VALUES
        (DVD_GENERATE.nextval, 'Stroomop',2,4,TO_DATE('15/03/2019', 'DD/MM/YYYY'),117,55,3); 
        
 INSERT INTO DVD
        (DVD_ID, Title,Genre_ID,Age_Res_ID,Date_Of_Release,Length_Of_DVD,DVD_Cost,Shop_ID)
        VALUES
        (DVD_GENERATE.nextval, 'Avengers: Endgame',2,1,TO_DATE('17/12/2019', 'DD/MM/YYYY'),195,70,3); 
        
 INSERT INTO DVD
        (DVD_ID, Title,Genre_ID,Age_Res_ID,Date_Of_Release,Length_Of_DVD,DVD_Cost,Shop_ID)
        VALUES
        (DVD_GENERATE.nextval, 'Irom Man',2,2,TO_DATE('17/12/2013', 'DD/MM/YYYY'),124,40,3); 
        
 INSERT INTO DVD
        (DVD_ID, Title,Genre_ID,Age_Res_ID,Date_Of_Release,Length_Of_DVD,DVD_Cost,Shop_ID)
        VALUES
        (DVD_GENERATE.nextval, 'Spirit',2,5,TO_DATE('17/12/2004', 'DD/MM/YYYY'),116,50,3); 
        /*15*/
        
/*Insert Transactions
*/
INSERT INTO Transactions
        (Transaction_ID, Customer_ID, DVD_ID, Rental_Date , Return_Date, Total)
        VALUES
        (Transaction_Generate.nextval,1,2,TO_DATE('17/12/2015', 'DD/MM/YYYY'),TO_DATE('19/12/2015', 'DD/MM/YYYY'),60);  
        
INSERT INTO Transactions
        (Transaction_ID, Customer_ID, DVD_ID, Rental_Date , Return_Date, Total)
        VALUES
        (Transaction_Generate.nextval,2,3,TO_DATE('19/12/2015', 'DD/MM/YYYY'),TO_DATE('21/12/2015', 'DD/MM/YYYY'),80);  
        
INSERT INTO Transactions
        (Transaction_ID, Customer_ID, DVD_ID, Rental_Date , Return_Date, Total)
        VALUES
        (Transaction_Generate.nextval,3,8,TO_DATE('17/12/2015', 'DD/MM/YYYY'),TO_DATE('19/12/2015', 'DD/MM/YYYY'),50);  
        
INSERT INTO Transactions
        (Transaction_ID, Customer_ID, DVD_ID, Rental_Date , Return_Date, Total)
        VALUES
        (Transaction_Generate.nextval,4,9,TO_DATE('17/12/2015', 'DD/MM/YYYY'),TO_DATE('19/12/2015', 'DD/MM/YYYY'),55);  
        
INSERT INTO Transactions
        (Transaction_ID, Customer_ID, DVD_ID, Rental_Date , Return_Date, Total)
        VALUES
        (Transaction_Generate.nextval,5,1,TO_DATE('17/12/2015', 'DD/MM/YYYY'),TO_DATE('19/12/2015', 'DD/MM/YYYY'),55);  
        
INSERT INTO Transactions
        (Transaction_ID, Customer_ID, DVD_ID, Rental_Date , Return_Date, Total)
        VALUES
        (Transaction_Generate.nextval,6,4,TO_DATE('17/12/2015', 'DD/MM/YYYY'),TO_DATE('19/12/2015', 'DD/MM/YYYY'),60);  
        
INSERT INTO Transactions
        (Transaction_ID, Customer_ID, DVD_ID, Rental_Date , Return_Date, Total)
        VALUES
        (Transaction_Generate.nextval,7,7,TO_DATE('17/12/2015', 'DD/MM/YYYY'),TO_DATE('19/12/2015', 'DD/MM/YYYY'),30);  
        
INSERT INTO Transactions
        (Transaction_ID, Customer_ID, DVD_ID, Rental_Date , Return_Date, Total)
        VALUES
        (Transaction_Generate.nextval,8,5,TO_DATE('17/12/2015', 'DD/MM/YYYY'),TO_DATE('19/12/2015', 'DD/MM/YYYY'),45);  
        
INSERT INTO Transactions
        (Transaction_ID, Customer_ID, DVD_ID, Rental_Date , Return_Date, Total)
        VALUES
        (Transaction_Generate.nextval,9,6,TO_DATE('17/12/2015', 'DD/MM/YYYY'),TO_DATE('19/12/2015', 'DD/MM/YYYY'),60);  
        
INSERT INTO Transactions
        (Transaction_ID, Customer_ID, DVD_ID, Rental_Date , Return_Date, Total)
        VALUES
        (Transaction_Generate.nextval,10,15,TO_DATE('17/12/2015', 'DD/MM/YYYY'),TO_DATE('19/12/2015', 'DD/MM/YYYY'),100);  
        
INSERT INTO Transactions
        (Transaction_ID, Customer_ID, DVD_ID, Rental_Date , Return_Date, Total)
        VALUES
        (Transaction_Generate.nextval,11,13,TO_DATE('17/12/2015', 'DD/MM/YYYY'),TO_DATE('19/12/2015', 'DD/MM/YYYY'),80);  
        
INSERT INTO Transactions
        (Transaction_ID, Customer_ID, DVD_ID, Rental_Date , Return_Date, Total)
        VALUES
        (Transaction_Generate.nextval,12,14,TO_DATE('17/12/2015', 'DD/MM/YYYY'),TO_DATE('19/12/2015', 'DD/MM/YYYY'),80);  
        
INSERT INTO Transactions
        (Transaction_ID, Customer_ID, DVD_ID, Rental_Date , Return_Date, Total)
        VALUES
        (Transaction_Generate.nextval,13,12,TO_DATE('17/12/2015', 'DD/MM/YYYY'),TO_DATE('19/12/2015', 'DD/MM/YYYY'),85);  
        
INSERT INTO Transactions
        (Transaction_ID, Customer_ID, DVD_ID, Rental_Date , Return_Date, Total)
        VALUES
        (Transaction_Generate.nextval,14,11,TO_DATE('17/12/2015', 'DD/MM/YYYY'),TO_DATE('19/12/2015', 'DD/MM/YYYY'),60);  
        
INSERT INTO Transactions
        (Transaction_ID, Customer_ID, DVD_ID, Rental_Date , Return_Date, Total)
        VALUES
        (Transaction_Generate.nextval,15,10,TO_DATE('17/12/2015', 'DD/MM/YYYY'),TO_DATE('19/12/2015', 'DD/MM/YYYY'),100);
        /*15*/
                    
                    
                    
                    
                    
          
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    