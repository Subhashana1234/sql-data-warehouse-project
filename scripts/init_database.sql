/*
==============================================================
Create Database and Schemas
==============================================================

Script Purpose:
This script creates a new database named 'DataWarehouse'
after checking if it already exists.

If the database exists, it will be dropped and recreated.
Additionally, the script sets up three schemas within the
database:

    - bronze  : Raw data layer
    - silver  : Cleaned and transformed data layer
    - gold    : Analytics and reporting layer

WARNING:
Running this script will drop the entire 'DataWarehouse'
database if it already exists.

All data inside the database will be permanently deleted.
Proceed with caution and ensure proper backups exist                                    
before running this script.
==============================================================
*/

use master;
--Drop and recreate the ;DataWarehouse'database
if exists (select 1 from sys.databases where name='DataWarehouse')
begin
  alter database DataWarehouse set single_user with rollback immediate;                     
  drop database DataWarehouse;
end;
go

---create the 'datawarehouse'database
create database DataWarehouse;

use DataWarehouse;

create schema bronze;
go
create schema silver;
go
create schema gold;
go
