CREATE TABLE Division (
  Division_ID INT PRIMARY KEY,
  Name VARCHAR(255) NOT NULL,
  Size_KM2 DECIMAL(10, 2),
  Population INT,
  EstablishedYear INT,
  Landtype VARCHAR(100)
);

CREATE TABLE District (
  District_Name VARCHAR(255) PRIMARY KEY,
  Division_ID INT,
  Area DECIMAL(10, 2),
  Population INT,
  Education_Percentage DECIMAL(5, 2),
  Postal_Code VARCHAR(10),
  FOREIGN KEY (Division_ID) REFERENCES Division(Division_ID)
);

CREATE TABLE Transport_Type (
  Transport_Type_ID INT PRIMARY KEY,
  Transport_Type_Name VARCHAR(255) NOT NULL
);

CREATE TABLE Transport_Route (
  Route_ID INT,
  Start_Point VARCHAR(255),
  End_Point VARCHAR(255),
  Distance DECIMAL(10, 2),
  Transport_Type_ID INT,
  Fare DECIMAL,
  FOREIGN KEY (Start_Point) REFERENCES District(District_Name),
  FOREIGN KEY (End_Point) REFERENCES District(District_Name),
  FOREIGN KEY (Transport_Type_ID) REFERENCES Transport_Type(Transport_Type_ID)
);

CREATE TABLE Education_Type (
  Education_Type_ID INT PRIMARY KEY,
  Type_Name VARCHAR(255) NOT NULL,
  Total_count INT,
  District_Name VARCHAR(255),
  FOREIGN KEY (District_Name) REFERENCES District(District_Name)
);

CREATE TABLE District_Famous_Person (
    Person_ID INT PRIMARY KEY,             
    FULL_NAME VARCHAR(255) NOT NULL,          
    PROFESSION TEXT,                         
    NOTABLE_WORK TEXT,                        
    DISTRICT_NAME VARCHAR(255),              
    FOREIGN KEY (DISTRICT_NAME) REFERENCES District(DISTRICT_NAME)
);

CREATE TABLE Famous_Food (
  Food_ID INT PRIMARY KEY,                 
  Food_Name VARCHAR(255) NOT NULL,      
  Type VARCHAR(100),                      
  Popularity_Score INT,                   
  Description TEXT,                        
  Food_Price_Range VARCHAR(50),            
  District_Name VARCHAR(255),             
  FOREIGN KEY (District_Name) REFERENCES District(DISTRICT_NAME)
);

CREATE TABLE LocalLanguages (
    District_Name VARCHAR(100) NOT NULL,    
    Normal_Language VARCHAR(100) NOT NULL,   
    Local_Language VARCHAR(100) NOT NULL,    
    Understandability_Rate DECIMAL(5, 2),   
    PRIMARY KEY (District_Name),          
    FOREIGN KEY (District_Name) REFERENCES District(District_Name)

);

CREATE TABLE District_Health_Facilities (
  Facility_ID INT PRIMARY KEY,                  
  Facility_Name VARCHAR(255) NOT NULL,            
  Address VARCHAR(255),                           
  Contact VARCHAR(20),                           
  Patient_Capacity INT,                       
  District_Name VARCHAR(255),              
  FOREIGN KEY (District_Name) REFERENCES District(DISTRICT_NAME)
);

CREATE TABLE Cultural_Event (
  Event_ID INT PRIMARY KEY,                     
  Event_Name VARCHAR(255) NOT NULL,               
  Event_Date DATE,                              
  Description TEXT,                             
  Event_Type VARCHAR(100),                    
  Location VARCHAR(255),                      
  District_Name VARCHAR(255),               
  FOREIGN KEY (District_Name) REFERENCES District(District_Name) --
);

CREATE TABLE FamousPlaces (
    Place_ID INT PRIMARY KEY AUTO_INCREMENT,
    Place_Name VARCHAR(150) NOT NULL,
    Description TEXT,
    Visitor_Per_Year INT,
    Entry_Fee DECIMAL(10, 2),
    Opening_Time TIME,
    District_Name VARCHAR(100) NOT NULL, 
    FOREIGN KEY (District_Name) REFERENCES District (District_Name) --
);

