CREATE PROCEDURE sp_DecryptSensitiveData
    @CustomerID INT,
    @Password NVARCHAR(50)
AS
BEGIN
    DECLARE @SSN NVARCHAR(11);
    DECLARE @CreditCard NVARCHAR(19);

    SELECT 
        @SSN = CONVERT(NVARCHAR(50), DECRYPTBYPASSPHRASE(@Password, SSN)),
        @CreditCard = CONVERT(NVARCHAR(50), DECRYPTBYPASSPHRASE(@Password, CreditCardNumber))
    FROM Customers WHERE CustomerID = @CustomerID;

    IF @SSN IS NOT NULL AND @CreditCard IS NOT NULL
        SELECT @CustomerID AS CustomerID, @SSN AS SSN, @CreditCard AS CreditCardNumber;
    ELSE
        RAISERROR('Unauthorized access or incorrect password!', 16, 1);
END;
