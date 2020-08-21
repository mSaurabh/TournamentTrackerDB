USE [Tournaments]
GO
/****** Object:  StoredProcedure [dbo].[spTournaments_Complete]    Script Date: 8/21/2020 11:56:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==============================================================================
-- Author:		Saurabh Mankar
-- Create date: 8/21/2020
-- Description:	Stored procedure to mark tournament as complete.
-- ===============================================================================
ALTER PROCEDURE [dbo].[spTournaments_Complete]
	-- Add the parameters for the stored procedure here
	@TournamentId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    Update Main
	SET Active = 0
	FROM dbo.Tournaments Main
	WHERE Main.id = @TournamentId AND
	Active = 1;
END
