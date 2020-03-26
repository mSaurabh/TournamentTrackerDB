USE Tournaments;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =====================================================================================
-- Author:		Saurabh Mankar
-- Create date: 3/26/2020
-- Description:	Stored Procedure to Insert Tournament from the Create Tournament Form
-- Input :
--		   1. Tournament Fee
--		   2. Entry Fee
--		   3. Active (Default to 1 when we create a new tournament)
-- Output :
--		   1.Id (Unique Tournament Id of the newly created Tournament)
-- =====================================================================================
ALTER PROCEDURE [dbo].[spTournament_Insert]
(
	-- Add the parameters for the stored procedure here
	@TournamentName NVARCHAR(50) ,
	@EntryFee MONEY,
	@id int =0 OUTPUT
)
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert the Tournament with the help of filled out fields from the form
	INSERT INTO [dbo].[Tournaments]
           ([TournamentName]
           ,[EntryFee]
           ,[Active])
     VALUES
           (@TournamentName
           ,@EntryFee
           ,1)

		SET @id = SCOPE_IDENTITY();
	
END
GO
