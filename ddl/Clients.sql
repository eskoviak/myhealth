use myHealth;

CREATE TABLE Clients (
    clientId	char(40) primary key,
    userName	varchar(32) not null,
    firstName	varchar(32) not null,
    lastName	varchar(32) not null,
    passwd	varbinary(32) not null,
    dateOfBirth date );
    
    
