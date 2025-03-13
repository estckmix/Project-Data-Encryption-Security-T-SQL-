T-SQL Project: Data Encryption & Security

This T-SQL project implements data encryption for sensitive information like Social Security Numbers (SSNs) and credit card numbers. It uses SQL Server's encryption functions and provides a stored procedure for authorized decryption.
________________________________________

1. Directory Structure

Organize SQL scripts into a structured format:

DataEncryptionSecurity/

│

├── Tables/

│   ├── Create_Customers_Table.sql

│

├── Security/

│   ├── Encrypt_Data.sql

│   ├── Decrypt_Data.sql

│   ├── Security_Policy.sql

│

├── Procedures/

│   ├── sp_EncryptSensitiveData.sql

│   ├── sp_DecryptSensitiveData.sql

│

├── Scripts/

│   ├── Setup_Encryption.sql

│

└── README.md
________________________________________

2. SQL Components

A. Creating the Customers Table with Encrypted Columns

The Customers table stores sensitive data using SQL Server's ENCRYPTION BY PASSWORD feature.

________________________________________

B. Encrypt Data Using a Secure Password

This script encrypts SSNs and Credit Card Numbers when inserting records.

________________________________________

C. Decrypt Data (Authorized Users Only)

Only authorized users can decrypt the data using a stored procedure.

Usage:

EXEC sp_DecryptSensitiveData @CustomerID = 1, @Password = 'SecureKey2025!';

________________________________________

D. Security Policy - Restrict Decryption to Admins

To enhance security, limit access to decryption using a database role.


Only users in the SecurityAdmin role can decrypt data:

EXEC sp_addrolemember 'SecurityAdmin', 'admin_user';

________________________________________

Stored Procedures

A. Procedure to Encrypt Data (sp_EncryptSensitiveData.sql)

This stored procedure inserts encrypted sensitive data into the Customers table.

Usage:

EXEC sp_EncryptSensitiveData 

    @Name='Alice Brown', 
    
    @SSN='222-33-4444', 
    
    @CreditCardNumber='1234-5678-9012-3456', 
    
    @Password='SecureKey2025!';
    
________________________________________

B. Procedure to Decrypt Data (sp_DecryptSensitiveData.sql)

This stored procedure retrieves and decrypts sensitive data for authorized users.

Usage:

EXEC sp_DecryptSensitiveData 

    @CustomerID=1, 
    
    @Password='SecureKey2025!';
    
________________________________________

E. Master Script for Full Setup

This script sets up the entire encryption system in one execution.

Execution:

:r Scripts/Setup_Encryption.sql
________________________________________

3. Usage and Monitoring

Insert encrypted data:

EXEC sp_EncryptSensitiveData @Name='Alice Brown', @SSN='222-33-4444', @CreditCardNumber='1234-5678-9012-3456';

2Decrypt data (authorized users only):

EXEC sp_DecryptSensitiveData @CustomerID=1, @Password='SecureKey2025!';

3Restrict decryption to SecurityAdmin role:

EXEC sp_addrolemember 'SecurityAdmin', 'admin_user';

________________________________________

4. Benefits of This Approach

Strong encryption for sensitive data.

Role-based security for controlled decryption.

Modular design for easy maintenance and scalability.

This Data Encryption & Security project ensures that sensitive data remains secure and only accessible to authorized users. Let me know if you need any modifications!

