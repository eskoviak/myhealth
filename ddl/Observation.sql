use myHealth;

CREATE TABLE Observation (
	clientId	CHAR(40) NOT NULL,
	obsDate		DATETIME NOT NULL,
	obsType		INT NOT NULL,
	obsData		TEXT NOT NULL
);
