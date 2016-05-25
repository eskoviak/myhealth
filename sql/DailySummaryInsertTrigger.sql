USE [SR28]
GO

/****** Object:  Trigger [Health].[UpdateNutrients]    Script Date: 1/30/2016 5:44:31 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [Health].[UpdateNutrients]
ON [Health].[DailyDetail]
AFTER INSERT
AS
EXEC [Health].[sp_get_Details];


GO

ALTER TABLE [Health].[DailyDetail] ENABLE TRIGGER [UpdateNutrients]
GO

