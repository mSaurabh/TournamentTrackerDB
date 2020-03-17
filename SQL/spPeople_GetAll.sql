USE Tournaments
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================================================
-- Author:		Saurabh Mankar
-- Create date: 3/15/2020
-- Description:	Stored procedure to get all the people
-- ================================================================================
ALTER PROCEDURE [dbo].[spPeople_GetAll]
	-- Add the parameters for the stored procedure here
	--@TeamId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT Main.*
	FROM dbo.People Main;

END
GO
