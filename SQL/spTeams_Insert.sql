USE Tournaments;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==============================================================================
-- Author:		Saurabh Mankar
-- Create date: 3/23/2020
-- Description:	Stored Procedure to Insert Teams From the Create Teams Form
-- Input :
--		   1. Team Name
-- Output :
--		   1.Id (Unique Team Id of the newly created Team)
-- ==============================================================================
ALTER PROCEDURE [dbo].[spTeams_Insert]
(
	-- Add the parameters for the stored procedure here
	@TeamName NVARCHAR(100) ,
	@id int =0 OUTPUT
)
AS
BEGIN
	SET NOCOUNT ON;

	-- Insert the Team with the help of filled out fields from the form
	INSERT INTO [dbo].[Teams]
		([TeamName])
	VALUES
		(@TeamName);

	SET @id = SCOPE_IDENTITY();
END
GO
