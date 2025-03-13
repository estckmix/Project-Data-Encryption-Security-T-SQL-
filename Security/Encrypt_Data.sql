DECLARE @EncryptionKey NVARCHAR(50) = 'SecureKey2025!';

INSERT INTO Customers (Name, SSN, CreditCardNumber)
VALUES 
    ('John Doe', ENCRYPTBYPASSPHRASE(@EncryptionKey, '123-45-6789'), ENCRYPTBYPASSPHRASE(@EncryptionKey, '4111-1111-1111-1111')),
    ('Jane Smith', ENCRYPTBYPASSPHRASE(@EncryptionKey, '987-65-4321'), ENCRYPTBYPASSPHRASE(@EncryptionKey, '5500-0000-0000-0004'));
