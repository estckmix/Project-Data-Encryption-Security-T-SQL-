CREATE PROCEDURE sp_EncryptSensitiveData
    @Name NVARCHAR(100),
    @SSN NVARCHAR(50),
    @CreditCardNumber NVARCHAR(50),
    @Password NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Customers (Name, SSN, CreditCardNumber)
    VALUES 
        (@Name, 
         ENCRYPTBYPASSPHRASE(@Password, @SSN), 
         ENCRYPTBYPASSPHRASE(@Password, @CreditCardNumber));

    PRINT 'Data has been securely encrypted and stored.';
END;