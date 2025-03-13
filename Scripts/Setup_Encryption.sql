-- Create Tables
PRINT 'Creating Customers Table...';
GO
:r Tables/Create_Customers_Table.sql
GO

-- Encrypt Data
PRINT 'Encrypting Data...';
GO
:r Security/Encrypt_Data.sql
GO

-- Create Security Policies
PRINT 'Setting Security Policies...';
GO
:r Security/Security_Policy.sql
GO

-- Create Stored Procedures
PRINT 'Creating Stored Procedures...';
GO
:r Procedures/sp_EncryptSensitiveData.sql
GO
:r Procedures/sp_DecryptSensitiveData.sql
GO

PRINT 'Data Encryption & Security Setup Completed!';
