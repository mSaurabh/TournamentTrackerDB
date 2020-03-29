USE Tournaments;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =====================================================================================
-- Author:		Saurabh Mankar
-- Create date: 3/29/2020
-- Description:	Stored Procedure to Insert Matchup from the Create Tournament Form
-- Input :
--		   1. Tournament Id
--		   2. MatchUp Round #
-- Output :
--		   1.Id (Unique Tournament Id of the newly created Matchup)
-- =====================================================================================
ALTER PROCEDURE [dbo].[spMatchups_Insert]
(
	-- Add the parameters for the stored procedure here
	@TournamentId INT,
	@MatchUpRound INT,
	@id int =0 OUTPUT
)
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert the Tournament with the help of filled out fields from the form
	INSERT INTO [dbo].[Matchups]
           ([MatchUpRound]
           ,[TournamentId])
     VALUES
           (@MatchUpRound
           ,@TournamentId)

		SET @id = SCOPE_IDENTITY();
	
END
GO
