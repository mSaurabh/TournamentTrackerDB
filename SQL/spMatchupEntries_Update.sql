USE Tournaments
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================================================
-- Author:		Saurabh Mankar
-- Create date: 5/8/2020
-- Description:	Stored procedure to update team scores for team in a given matchup.
-- ================================================================================
ALTER PROCEDURE [dbo].[spMatchupEntries_Update]
	-- Add the parameters for the stored procedure here
	@id int,
	@TeamCompetingId int = NULL,
	@Score FLOAT = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE dbo.MatchupEntries
	SET TeamCompetingId = @TeamCompetingId,
		Score = @Score
	WHERE id = @id;

END
GO