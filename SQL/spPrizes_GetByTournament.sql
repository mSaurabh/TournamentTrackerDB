USE Tournaments
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================================================
-- Author:		Saurabh Mankar
-- Create date: 3/15/2020
-- Description:	Stored procedure to get all the prizes for a given tournament
-- ================================================================================
ALTER PROCEDURE [dbo].[spPrizes_GetByTournament]
	-- Add the parameters for the stored procedure here
	@TournamentId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT P.*
	FROM dbo.Prizes P
	INNER JOIN dbo.TournamentPrizes TP ON TP.PrizeId = P.id
	WHERE  TP.TournamentId =  @TournamentId;
END
GO
