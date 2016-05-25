USE [SR28]
GO

/****** Object:  Table [Health].[RecipeDetail]    Script Date: 2/1/2016 6:50:32 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [Health].[RecipeDetail](
	[RecipeID] [int] NOT NULL,
    [NDB_No] [char](14) NOT NULL,
	[Long_Desc] [varchar](200) NULL,
	[Amount] [numeric](5, 1) NOT NULL,
	[Measure] [char](14) NOT NULL,
	[Sodium] [numeric](12, 3) NULL,
	[Energy] [numeric](12, 3) NULL,
	[K] [numeric](12, 3) NULL,
	[Protein] [numeric](12, 3) NULL,
	[Carbs] [numeric](12, 3) NULL,
	[Lipids] [numeric](12, 3) NULL,
	[Cholesterol] [numeric](12, 3) NULL
)

GO

SET ANSI_PADDING OFF
GO

