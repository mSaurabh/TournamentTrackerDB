USE Tournaments
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================================================
-- Author:		Saurabh Mankar
-- Create date: 3/15/2020
-- Description:	Stored procedure to get all the matchup entries for a given matchup
-- ================================================================================
ALTER PROCEDURE [dbo].[spMatchupEntries_GetByMatchup]
	-- Add the parameters for the stored procedure here
	@MatchupId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT Main.*
	FROM dbo.MatchupEntries Main
	INNER JOIN dbo.Matchups M ON M.id = Main.MatchupId
	WHERE M.id = @MatchupId

END
GO
