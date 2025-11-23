/*
===================================================
Create Database and Schemas
===================================================
Script Purpose:
    This script creates a new database named 'DataWarehouse' after checking
    whether it already exists. If the database exists, it will be dropped
    and recreated. The script also sets up the three core schemas used in
    the Medallion Architecture: 'bronze', 'silver', and 'gold'.

WARNING:
    Running this script will DROP the entire 'DataWarehouse' database if it exists.
    All data in this database will be permanently deleted. Proceed with caution
    and ensure you have a proper backup before executing this script.
*/

USE master; 
GO 

-- Drop and create the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN 
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE; 
    DROP DATABASE DataWarehouse; 
END; 
GO

-- Create Database 'DataWarehouse'
CREATE DATABASE DataWarehouse; 
GO 

USE DataWarehouse; 
GO 

-- Create Schemas
CREATE SCHEMA bronze; 
GO

CREATE SCHEMA silver; 
GO

CREATE SCHEMA gold; 
GO
