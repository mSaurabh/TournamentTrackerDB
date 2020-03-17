USE Tournaments
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================================================
-- Author:		Saurabh Mankar
-- Create date: 3/15/2020
-- Description:	Stored procedure to get all the matchups for a given tournament
-- ================================================================================
ALTER PROCEDURE [dbo].[spMatchups_GetByTournament]
	-- Add the parameters for the stored procedure here
	@TournamentId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT Main.*
	FROM dbo.MatchupEntries Main
	INNER JOIN dbo.Teams T ON T.id = Main.TeamCompetingId
	INNER JOIN dbo.TournamentEntries TE ON TE.TeamId = T.id
	WHERE TE.TournamentId = @TournamentId

END
GO
