
CREATE DATABASE RealEstate;
--1
CREATE TABLE Property(
property_id varchar(10) PRIMARY KEY,
property_price int NOT NULL,
property_address varchar(20) NOT NULL,
property_sizeSqFt int NOT NULL,
property_status varchar(20) NOT NULL check(property_status in('available', 'sold', 'rented'))
);


--2
CREATE TABLE property_type(
ptype_id varchar(10) PRIMARY KEY,
property_id varchar(10) FOREIGN KEY REFERENCES Property(property_id),
property_description varchar(15) NOT NULL check(property_description in('apartment', 'house'))
);

--3
CREATE TABLE property_feature(
feature_id int PRIMARY KEY,
property_id varchar(10) FOREIGN KEY REFERENCES Property(property_id),
gym varchar(20)  NOT NULL            check(gym in('available', 'not available')),
swimming_pool varchar(20) NOT NULL  check(swimming_pool in('available', 'not available')),
garden varchar(20)  NOT NULL        check(garden in('available', 'not available')),
parking_space varchar(20)  NOT NULL check(parking_space in('available', 'not available')),
security_system varchar(20)  NOT NULL check(security_system in('available', 'not available')),
balcony varchar(20)    NOT NULL     check(balcony in('available', 'not available'))
);

--4
CREATE TABLE Buyer(
buyer_id varchar(10) PRIMARY KEY,
property_id varchar(10)  FOREIGN KEY REFERENCES Property(property_id),
buyer_name varchar(25) NOT NULL CHECK(buyer_name NOT LIKE '%[^A-Za-z/]%'),
buyer_fname varchar(25) NOT NULL CHECK(buyer_fname NOT LIKE '%[^A-Za-z/]%'),
buyer_email varchar(30) NOT NULL Check(buyer_email LIKE '%_@__%.__%'),
buyer_phoneNo varchar(25) NOT NULL Check (buyer_phoneNo NOT LIKE '%[^0-9+-]%')
);


--5
CREATE TABLE buyer_transaction(
btransaction_id varchar(10) PRIMARY KEY,
buyer_id varchar(10) FOREIGN KEY REFERENCES Buyer(buyer_id),
property_id varchar(10) FOREIGN KEY REFERENCES Property(property_id),
amount int NOT NULL,
payment_date date 
);


--6
CREATE TABLE MaintenanceRequest(
request_id varchar(10) PRIMARY KEY,
property_id varchar(10)  FOREIGN KEY REFERENCES Property(property_id),
request_description varchar(100) NOT NULL,
request_date date NOT NULL,
request_status varchar(20) NOT NULL check(request_status in('pending', 'in progress', 'completed'))
);


--7
CREATE TABLE Tenant(
tenant_id varchar(10) PRIMARY KEY,
tenant_name varchar(20)  NOT NULL CHECK(tenant_name NOT LIKE '%[^A-Za-z/]%'),
tenant_fname varchar(20) NOT NULL CHECK(tenant_fname NOT LIKE '%[^A-Za-z/]%'),
tenant_phoneNo varchar(20) NOT NULL Check (tenant_phoneNo NOT LIKE '%[^0-9+-]%')
);


--8
CREATE TABLE Landlord(
landlord_id varchar(10) PRIMARY KEY,
landlord_name varchar(20)  NOT NULL Check(landlord_name NOT LIKE '%[^A-Za-z/]%'),
landlord_fname varchar(20) NOT NULL Check(landlord_fname NOT LIKE '%[^A-Za-z/]%'),
landlord_phoneNo varchar(20) NOT NULL Check (landlord_phoneNo NOT LIKE '%[^0-9+-]%'),
landlord_email varchar(25) NOT NULL Check(landlord_email LIKE '%_@__%.__%')
);


--9
CREATE TABLE RentedProperties(
rented_id varchar(10) PRIMARY KEY,
property_id varchar(10) FOREIGN KEY REFERENCES Property(property_id),
tenant_id varchar(10) FOREIGN KEY REFERENCES Tenant(tenant_id),
landlord_id varchar(10) FOREIGN KEY REFERENCES Landlord(landlord_id),
rStart_date date 
);



--10
CREATE TABLE rp_transaction(
rpTransaction_id varchar(10) PRIMARY KEY,
rented_id varchar(10) FOREIGN KEY REFERENCES RentedProperties(rented_id),
property_id varchar(10) FOREIGN KEY REFERENCES Property(property_id),
amount int NOT NULL,
payment_date date
);


--11
CREATE TABLE LeaseAgreement(
agreement_id varchar(10) PRIMARY KEY ,
rented_id varchar(10) NOT NULL FOREIGN KEY REFERENCES RentedProperties(rented_id),
monthly_rent int NOT NULL,
agStart_date date NOT NULL,
agEnd_date date NOT NULL
);


-------------------------------------------------------------------------------------------------------------------------
-- Create the Admin Login (Have the full access)
CREATE LOGIN AdminLogin WITH PASSWORD = 'admin@123456789';

-- Create the Staff Login (Have partial access)
CREATE LOGIN StaffLogin WITH PASSWORD = 'staff@123456789';

-- Create the Read-only Login (Have read-only access)
CREATE LOGIN ReadOnlyLogin WITH PASSWORD = 'readonly@123456789';

-- Create the Admin User and grant full access to all tables
CREATE USER AdminUser FOR LOGIN AdminLogin;
GRANT SELECT, INSERT, UPDATE, DELETE ON Property TO AdminUser;
GRANT SELECT, INSERT, UPDATE, DELETE ON property_type TO AdminUser;
GRANT SELECT, INSERT, UPDATE, DELETE ON property_feature TO AdminUser;
GRANT SELECT, INSERT, UPDATE, DELETE ON Buyer TO AdminUser;
GRANT SELECT, INSERT, UPDATE, DELETE ON buyer_transaction TO AdminUser;
GRANT SELECT, INSERT, UPDATE, DELETE ON MaintenanceRequest TO AdminUser;
GRANT SELECT, INSERT, UPDATE, DELETE ON Tenant TO AdminUser;
GRANT SELECT, INSERT, UPDATE, DELETE ON Landlord TO AdminUser;
GRANT SELECT, INSERT, UPDATE, DELETE ON RentedProperties TO AdminUser;
GRANT SELECT, INSERT, UPDATE, DELETE ON rp_transaction TO AdminUser;
GRANT SELECT, INSERT, UPDATE, DELETE ON LeaseAgreement TO AdminUser;

-- Create the Staff User and grant partial access
CREATE USER StaffUser FOR LOGIN StaffLogin;
GRANT SELECT, INSERT, UPDATE ON Property TO StaffUser;
GRANT SELECT, INSERT, UPDATE ON MaintenanceRequest TO StaffUser;
GRANT SELECT, INSERT, UPDATE ON RentedProperties TO StaffUser;
GRANT SELECT ON property_type TO StaffUser;
GRANT SELECT ON property_feature TO StaffUser;
GRANT SELECT ON Buyer TO StaffUser;
GRANT SELECT ON buyer_transaction TO StaffUser;
GRANT SELECT ON Tenant TO StaffUser;
GRANT SELECT ON Landlord TO StaffUser;
GRANT SELECT ON rp_transaction TO StaffUser;
GRANT SELECT ON LeaseAgreement TO StaffUser;

-- Create the Read-only User and grant read-only access
CREATE USER ReadOnlyUser FOR LOGIN ReadOnlyLogin;
GRANT SELECT ON Property TO ReadOnlyUser;
GRANT SELECT ON property_type TO ReadOnlyUser;
GRANT SELECT ON property_feature TO ReadOnlyUser;
GRANT SELECT ON Buyer TO ReadOnlyUser;
GRANT SELECT ON buyer_transaction TO ReadOnlyUser;
GRANT SELECT ON MaintenanceRequest TO ReadOnlyUser;
GRANT SELECT ON Tenant TO ReadOnlyUser;
GRANT SELECT ON Landlord TO ReadOnlyUser;
GRANT SELECT ON RentedProperties TO ReadOnlyUser;
GRANT SELECT ON rp_transaction TO ReadOnlyUser;
GRANT SELECT ON LeaseAgreement TO ReadOnlyUser;



---------------------------------------------------------------------------------------------------------------------------------------------------------------------
---Full Backup
BACKUP DATABASE RealEstate TO DISK = 'C:\DBBACKUP\ REALESTATE.bak'
GO
---Differential Backup
BACKUP DATABASE RealEstate TO DISK = 'C:\DBBACKUP\REALESTATE.bak' WITH DIFFERENTIAL 
GO
---Log Backup
BACKUP LOG RealEstate TO DISK = 'C:\DBBACKUP\REALESTATE.bak'
GO
------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Create an Audit Object
USE master
CREATE SERVER AUDIT RealEstate_Audit
TO FILE ( FILEPATH ='C:\audit' );  

--- Enable the Audit Object
ALTER SERVER AUDIT RealEstate_Audit WITH (STATE = ON);  

--- Create Audit Specification
CREATE DATABASE AUDIT SPECIFICATION RealEstateAuditSpecification
FOR SERVER AUDIT RealEstate_Audit
ADD (DATABASE_OBJECT_ACCESS_GROUP),
ADD (DATABASE_OBJECT_CHANGE_GROUP),
ADD (DELETE ON DATABASE::[RealEstate] BY [dbo]),
ADD (INSERT ON DATABASE::[RealEstate] BY [dbo]),
ADD (SELECT ON DATABASE::[RealEstate] BY [dbo]),
ADD (UPDATE ON DATABASE::[RealEstate] BY [dbo])
WITH (STATE = ON);


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----View to get property details along with property type and features
CREATE VIEW PropertyDetails AS
SELECT 
    p.property_id,
    p.property_price,
    p.property_address,
    p.property_sizeSqFt,
    p.property_status,
    t.property_description,
    f.gym,
    f.swimming_pool,
    f.garden,
    f.parking_space,
    f.balcony
FROM Property p
JOIN property_type t ON p.property_id = t.property_id
JOIN property_feature f ON p.property_id = f.property_id;

SELECT*FROM PropertyDetails

-----View to see details of rented properties along with tenant and landlord information-------------------------------------------------------------
CREATE VIEW RentedPropertyDetails AS
SELECT
    r.rented_id,
    r.rStart_date,
    p.property_id,
    p.property_address,
    t.tenant_id,
    t.tenant_name,
    t.tenant_fname,
    t.tenant_phoneNo,
    l.landlord_id,
    l.landlord_name,
    l.landlord_fname,
    l.landlord_phoneNo
FROM RentedProperties r
JOIN Property p ON r.property_id = p.property_id
JOIN Tenant t ON r.tenant_id = t.tenant_id
JOIN Landlord l ON r.landlord_id = l.landlord_id;

SELECT*FROM RentedPropertyDetails

---------------------------------------------------------------------------------------------------------------------------------------------------------
---Stored Procedure which gives detail information based on user choice. 
CREATE PROCEDURE GetPropertyWithFeatures @property_id varchar(10)
AS
BEGIN
    SELECT P.*, PT.property_description, PF.gym,  PF.swimming_pool, PF.garden, PF.parking_space, PF.security_system, PF.balcony
    FROM Property P
    JOIN property_type PT ON P.property_id = PT.property_id
    JOIN property_feature PF ON P.property_id = PF.property_id
    WHERE P.property_id = @property_id;
END;
EXEC GetPropertyWithFeatures 'p005';


---Stored Procedure which uses aggregate functions such as COUNT(), SUM(), AVG(), MAX() and MIN() to give a summarized data for property_type.
CREATE PROCEDURE GetPropertyTypeSummary
AS
BEGIN
    SELECT pt.property_description AS PropertyType,
           COUNT(p.property_id) AS PropertyCount,
           SUM(p.property_price) AS SumPrice,
		   AVG(p.property_price) AS AveragePrice,
		   MAX(p.property_price) AS MaxPrice,
		   MIN(p.property_price) AS MinPrice
    FROM property_type pt
    INNER JOIN Property p ON pt.property_id = p.property_id
    GROUP BY pt.property_description;
END;
EXEC GetPropertyTypeSummary;

-----Stored procedure which inserts records into all of the tables.-------------------------------------------------------------------------
CREATE PROCEDURE InsertRealEstateData
    @property_id varchar(10), @property_price int, @property_address varchar(20), @property_sizeSqFt int, @property_status varchar(20),
    @ptype_id varchar(10), @property_description varchar(15),
    @feature_id int, @gym varchar(20), @swimming_pool varchar(20), @garden varchar(20), @parking_space varchar(20), @security_system varchar(20), @balcony varchar(20),
    @buyer_id varchar(10), @buyer_name varchar(25), @buyer_fname varchar(25), @buyer_email varchar(30), @buyer_phoneNo varchar(25),
    @btransaction_id varchar(10), @amount int, @payment_date date,
    @request_id varchar(10), @request_description varchar(100), @request_date date, @request_status varchar(20),
    @tenant_id varchar(10), @tenant_name varchar(20), @tenant_fname varchar(20), @tenant_phoneNo varchar(20),
    @landlord_id varchar(10), @landlord_name varchar(20), @landlord_fname varchar(20), @landlord_phoneNo varchar(20),@landlord_email varchar(25),
    @rented_id varchar(10), @rStart_date date, 
	@rpTransaction_id varchar(10), @rpAmount int,  @rpPayment_date date,
    @agreement_id varchar(10),  @monthly_rent int, @agStart_date date, @agEnd_date date
AS
BEGIN
    INSERT INTO Property 
    VALUES (@property_id, @property_price, @property_address, @property_sizeSqFt, @property_status);

    INSERT INTO property_type 
    VALUES (@ptype_id, @property_id, @property_description);

    INSERT INTO property_feature 
    VALUES (@feature_id, @property_id, @gym, @swimming_pool, @garden, @parking_space, @security_system, @balcony);

    INSERT INTO Buyer 
    VALUES (@buyer_id, @property_id, @buyer_name, @buyer_fname, @buyer_email, @buyer_phoneNo);

    INSERT INTO buyer_transaction 
    VALUES (@btransaction_id, @buyer_id, @property_id, @amount, @payment_date);

    INSERT INTO MaintenanceRequest 
    VALUES (@request_id, @property_id, @request_description, @request_date, @request_status);

    INSERT INTO Tenant 
    VALUES (@tenant_id, @tenant_name, @tenant_fname, @tenant_phoneNo);

    INSERT INTO Landlord 
    VALUES (@landlord_id, @landlord_name, @landlord_fname, @landlord_phoneNo, @landlord_email);

    INSERT INTO RentedProperties 
    VALUES (@rented_id, @property_id, @tenant_id, @landlord_id, @rStart_date);

    INSERT INTO rp_transaction 
    VALUES (@rpTransaction_id, @rented_id, @property_id, @rpAmount, @rpPayment_date);

    INSERT INTO LeaseAgreement 
    VALUES (@agreement_id, @rented_id, @monthly_rent, @agStart_date, @agEnd_date);
END;
EXEC InsertRealEstateData
    @property_id = 'P041',  @property_price = 2000000, @property_address = 'Addis Ababa', @property_sizeSqFt = 500, @property_status = 'available',
    @ptype_id = 'PT041', @property_description = 'house',
    @feature_id = 41, @gym = 'available', @swimming_pool = 'available', @garden = 'available', @parking_space = 'not available', @security_system = 'available', @balcony = 'not available',
    @buyer_id = 'B014', @buyer_name = 'Mussie',  @buyer_fname = 'Andom', @buyer_email = 'mussie@email.com', @buyer_phoneNo = '+251964552387',
    @btransaction_id = 'BT014', @amount = 1800000, @payment_date = '2023-08-11',  
	@request_id = 'MR031', @request_description = 'Leaky toilet', @request_date = '2023-08-10', @request_status = 'Pending',
    @tenant_id = 'TE013',  @tenant_name = 'Yosef', @tenant_fname = 'Muluken', @tenant_phoneNo = '+251964553487',
    @landlord_id = 'LL013', @landlord_name = 'Michael',  @landlord_fname = 'Samuel', @landlord_phoneNo = '+251984953487', @landlord_email = 'michael@email.com',
    @rented_id = 'RP013', @rStart_date = '2023-08-01',
    @rpTransaction_id = 'RPT013', @rpAmount = 15000, @rpPayment_date = '2023-08-01',
    @agreement_id = 'LA013', @monthly_rent = 15000, @agStart_date = '2023-08-01', @agEnd_date = '2024-08-01';


-----Stored procedure which updates records of some of the tables.------------------------------------------------------------------------------
    --Updates the 'request_status' column for the MaintenanceRequest table.
CREATE PROCEDURE UpdateMaintenanceRequestStatus  @request_id varchar(10), @new_status varchar(20)
AS
BEGIN
    UPDATE MaintenanceRequest
    SET request_status = @new_status
    WHERE request_id = @request_id;
END;
EXEC UpdateMaintenanceRequestStatus 'put request_id here', 'put request_status here';


-----Stored procedure which delete record from some of the tables.------------------------------------------------------------------------- 
    --Deletes records from the Property table.
CREATE PROCEDURE DeleteProperty @propertyId varchar(10)
AS
BEGIN
    DELETE FROM Property
    WHERE property_id = @propertyId;
END;
EXEC DeleteProperty @propertyId = 'put property_id here';
 
    --Deletes records from the Buyer table.
CREATE PROCEDURE DeleteBuyer @buyerId varchar(10)
AS
BEGIN
    DELETE FROM Buyer
    WHERE buyer_id = @buyerId;
END;
EXEC DeleteBuyer @buyerId = 'put buyer_id here';



-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- This triggers automatically updates the property status in the property table when a property is rented or sold.
--It will update the property status in the Property table based on the changes made in the RentedProperties and Buyer tables.

--1
CREATE TRIGGER UpdatePropertyStatus
ON RentedProperties
AFTER INSERT
AS
BEGIN
    DECLARE @property_id varchar(10);
    DECLARE @status varchar(20);

    SELECT @property_id = property_id FROM inserted;
    SELECT @status = 'rented'; 

    UPDATE Property
    SET property_status = @status
    WHERE property_id = @property_id;
END;

-- To see the result of property status after it is rented
DECLARE @propertyIdToCheck varchar(10) = 'property_id_here';
SELECT property_status
FROM Property
WHERE property_id = @propertyIdToCheck;


--2
CREATE TRIGGER UpdatePropertyStatus_Sold
ON buyer_transaction
AFTER INSERT
AS
BEGIN
    DECLARE @property_id varchar(10);
    DECLARE @status varchar(20);

    SELECT @property_id = property_id FROM inserted;
    SELECT @status = 'sold'; 

    UPDATE Property
    SET property_status = @status
    WHERE property_id = @property_id;
END;

-- To see the result of property status after it is sold
DECLARE @propertyIdToCheck varchar(10) = 'property_id_here';
SELECT property_status
FROM Property
WHERE property_id = @propertyIdToCheck;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------

---This function returns a list of available properties for rent or purchase.
CREATE FUNCTION dbo.GetAvailableProperties()
RETURNS TABLE
AS
RETURN (
    SELECT p.property_id, p.property_price, p.property_address, p.property_sizeSqFt, p.property_status,
           pt.property_description,
           pf.gym, pf.swimming_pool, pf.garden, pf.parking_space, pf.security_system, pf.balcony
    FROM Property p
    JOIN property_type pt ON p.property_id = pt.property_id
    JOIN property_feature pf ON p.property_id = pf.property_id
    WHERE p.property_status = 'available'
);
SELECT *
FROM dbo.GetAvailableProperties();

---This function calculates the average rent payment amount for all rented properties.
CREATE FUNCTION dbo.CalculateAverageRentPayment()
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @avgRent DECIMAL(10, 2);
    
    SELECT @avgRent = AVG(amount)
    FROM rp_transaction;
    
    RETURN @avgRent;
END;

SELECT dbo.CalculateAverageRentPayment() AS AverageRentPayment;



---This function retrieves the count of properties based on their status (available, sold, rented).
CREATE FUNCTION GetPropertyCountByStatus(@Status VARCHAR(20))
RETURNS INT
AS
BEGIN
    DECLARE @PropertyCount INT;
    
    SELECT @PropertyCount = COUNT(*)
    FROM Property
    WHERE property_status = @Status;
    
    RETURN @PropertyCount;
END;

DECLARE @Status VARCHAR(20) = 'available'; 
SELECT dbo.GetPropertyCountByStatus(@Status) AS PropertyCount;

----------------------------------------------------------------------------------------------------------------------------------------







-- Non-Clustered Indexes

-- 1. Property table
CREATE NONCLUSTERED INDEX IX_Property_Status ON Property(property_status);

-- 2. Buyer table
CREATE NONCLUSTERED INDEX IX_Buyer_PropertyID ON Buyer(property_id);
CREATE NONCLUSTERED INDEX IX_Buyer_Email ON Buyer(buyer_email);

-- 3. Buyer_Transaction table
CREATE NONCLUSTERED INDEX IX_BuyerTransaction_BuyerID ON buyer_transaction(buyer_id);
CREATE NONCLUSTERED INDEX IX_BuyerTransaction_PropertyID ON buyer_transaction(property_id);

-- 4. MaintenanceRequest table
CREATE NONCLUSTERED INDEX IX_MaintenanceRequest_PropertyID ON MaintenanceRequest(property_id);

-- 5. Tenant table
CREATE NONCLUSTERED INDEX IX_Tenant_PhoneNo ON Tenant(tenant_phoneNo);

-- 6. Landlord table
CREATE NONCLUSTERED INDEX IX_Landlord_PhoneNo ON Landlord(landlord_phoneNo);

-- 7. RentedProperties table
CREATE NONCLUSTERED INDEX IX_RentedProperties_TenantID ON RentedProperties(tenant_id);
CREATE NONCLUSTERED INDEX IX_RentedProperties_LandlordID ON RentedProperties(landlord_id);

-- 8. LeaseAgreement table
CREATE NONCLUSTERED INDEX IX_LeaseAgreement_RentedID ON LeaseAgreement(rented_id);

-- 9. rp_transaction table
CREATE NONCLUSTERED INDEX IX_RPTransaction_RentedID ON rp_transaction(rented_id);
CREATE NONCLUSTERED INDEX IX_RPTransaction_PropertyID ON rp_transaction(property_id);
