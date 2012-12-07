/*
 * Historical Data Archival ETL
 * Project #75 - Complete Database Implementation
 * SQL Server 2008/2012
 * Technology: SSIS
 * Created: 2013
 */

USE master;
GO

IF EXISTS (SELECT name FROM sys.databases WHERE name = 'ArchivalETL')
BEGIN
    ALTER DATABASE ArchivalETL SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE ArchivalETL;
END
GO

CREATE DATABASE ArchivalETL
ON PRIMARY
(
    NAME = 'ArchivalETL_Data',
    FILENAME = 'C:\SQLData\ArchivalETL_Data.mdf',
    SIZE = 100MB,
    MAXSIZE = 5GB,
    FILEGROWTH = 10MB
)
LOG ON
(
    NAME = 'ArchivalETL_Log',
    FILENAME = 'C:\SQLData\ArchivalETL_Log.ldf',
    SIZE = 50MB,
    MAXSIZE = 1GB,
    FILEGROWTH = 5MB
);
GO

ALTER DATABASE ArchivalETL SET RECOVERY SIMPLE;
ALTER DATABASE ArchivalETL SET AUTO_UPDATE_STATISTICS ON;
GO

USE ArchivalETL;
GO

PRINT 'Database ArchivalETL created successfully';
PRINT 'Project: Historical Data Archival ETL';
PRINT 'Description: Old transactional data archiving';
GO
