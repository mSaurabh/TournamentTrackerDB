USE Tournaments
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================================================
-- Author:		Saurabh Mankar
-- Create date: 3/15/2020
-- Description:	Stored procedure to get Team Members By Team ID
-- ================================================================================
ALTER PROCEDURE [dbo].[spTeamMembers_GetByTeam]
	-- Add the parameters for the stored procedure here
	@TeamId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT TM.*
	FROM dbo.TeamMembers TM
	INNER JOIN dbo.Teams T ON T.id = TM.TeamId
	WHERE  TM.TeamId =  @TeamId;
END
GO
