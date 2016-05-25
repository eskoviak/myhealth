CREATE TABLE [health].[Clients]
(
    ClientID    UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
    LoginName   CHAR(15) NOT NULL,
    FirstName   CHAR(30) NULL,
    LastName    CHAR(30) NULL,
    passwd      BINARY(50) NOT NULL,
    BirthDate   DATE NULL,
    Height      NUMERIC(18,3) NULL,
    ClientData  XML NULL
)

INSERT INTO health.Clients
VALUES (
'29E3BC7D-2159-4DDF-A829-B673CC8D6ED6',
'eskoviak',
'Ed',
'Skoviak',
CONVERT(BINARY, 'eskoviak'),
'05/18/1957',
175.26,
'');

SELECT * FROM Health.Clients;