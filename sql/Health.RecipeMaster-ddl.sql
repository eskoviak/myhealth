/*
   Monday, February 1, 20166:33:30 AM
   User: sqladmin
   Server: bw8jb2inq1.database.windows.net
   Database: SR28
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE Health.RecipeMaster
	(
	RecipeID int NOT NULL IDENTITY (1, 1),
	Long_Desc varchar(200) NOT NULL,
	NDB_No char(14) NOT NULL,
	Narratvie xml NULL
	)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE Health.RecipeMaster ADD CONSTRAINT
	PK_RecipeMaster PRIMARY KEY CLUSTERED 
	(
	RecipeID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE Health.RecipeMaster SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
