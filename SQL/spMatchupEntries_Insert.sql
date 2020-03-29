USE Tournaments;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==============================================================================
-- Author:		Saurabh Mankar
-- Create date: 3/29/2020
-- Description:	Stored Procedure to Insert Entries From the Create Teams Form
-- Input :
--		   1. Matchup Id
--		   2. Parent Matchup Id
--		   3. Team Competing Id
--
-- Output :
--		   1.Id (Unique Team Id of the newly created Entry)
-- ==============================================================================
ALTER PROCEDURE [dbo].[spMatchupEntries_Insert]
(
	-- Add the parameters for the stored procedure here
	 @MatchupId INT
    ,@ParentMatchupId INT
    ,@TeamCompetingId INT
	,@id int =0 OUTPUT
)
AS
BEGIN
	SET NOCOUNT ON;

	-- Insert the Team with the help of filled out fields from the form
	INSERT INTO [dbo].[MatchupEntries]
           ([MatchupId]
           ,[ParentMatchupId]
           ,[TeamCompetingId])
     VALUES
           (@MatchupId
           ,@ParentMatchupId
           ,@TeamCompetingId)


	SET @id = SCOPE_IDENTITY();
END
GO