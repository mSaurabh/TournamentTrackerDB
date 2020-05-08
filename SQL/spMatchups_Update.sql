USE Tournaments
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================================================
-- Author:		Saurabh Mankar
-- Create date: 5/8/2020
-- Description:	Stored procedure to update winner for a given matchup.
-- ================================================================================
ALTER PROCEDURE [dbo].[spMatchups_Update]
	-- Add the parameters for the stored procedure here
	@id int,
	@WinnerId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE dbo.Matchups
	SET WinnerId = @WinnerId
	WHERE id = @id;

END
GO
