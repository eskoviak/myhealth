use myHealth;

CREATE TABLE Observations (
	clientId	CHAR(40) NOT NULL,
	obsDate		DATETIME NOT NULL,
	obsType		INT NOT NULL,
	obsData		BLOB NOT NULL,
	CONSTRAINT fk_obstypes_id FOREIGN KEY (obsType) REFERENCES ObsTypes (ObsId)
)
