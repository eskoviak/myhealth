USE myHealth;

CREATE TABLE RecipeMaster
	(
	RecipeID int PRIMARY KEY AUTO_INCREMENT,
	Long_Desc varchar(200) NOT NULL,
	NDB_No char(14) NOT NULL,
	Narrative BLOB NULL
	);
