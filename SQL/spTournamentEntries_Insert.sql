USE Tournaments;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ===========================================================================================
-- Author:		Saurabh Mankar
-- Create date: 3/26/2020
-- Description:	Stored Procedure to Insert Tournament Entries from the Create Tournament Form
-- Input :
--		   1. Tournament Id
--		   2. Team Id
-- Output :
--		   1.Id (Unique Tournament Entries Id of the newly created Team)
-- ===========================================================================================
ALTER PROCEDURE [dbo].[spTournamentEntries_Insert]
(
	-- Add the parameters for the stored procedure here
	@TournamentId int,
	@TeamId int ,
	@id int =0 OUTPUT
)
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert the Tournament with the help of filled out fields from the form
	INSERT INTO [dbo].[TournamentEntries]
           ([TournamentId]
           ,[TeamId])
     VALUES
           (@TournamentId
           ,@TeamId)

		SET @id = SCOPE_IDENTITY();	
END
GO
