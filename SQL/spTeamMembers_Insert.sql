USE Tournaments;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ===============================================================================
-- Author:		Saurabh Mankar
-- Create date: 3/23/2020
-- Description:	Stored Procedure to Insert Team Members From the Create Team Form
-- Input :
--		   1. Team Id
--		   2. Person Id
-- Output :
--		   1.Id (Unique TeamMember Id of the newly created Team)
-- ===============================================================================
ALTER PROCEDURE [dbo].[spTeamMembers_Insert]
(
	-- Add the parameters for the stored procedure here
	@TeamId int, 
	@PersonId int,
	@id int =0 OUTPUT
)
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert the Team Members with the help of filled out fields from the form
	INSERT INTO [dbo].[TeamMembers]
		([TeamId]
		,[PersonId])
	VALUES
		(@TeamId
		,@PersonId)

	SET @id = SCOPE_IDENTITY();	
END
GO
