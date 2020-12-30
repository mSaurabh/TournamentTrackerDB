USE Tournaments
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================================================
-- Author:		Saurabh Mankar
-- Create date: 12/30/2020
-- Description:	Stored procedure to get all the prizes.
-- ================================================================================
CREATE PROCEDURE [dbo].[spPrizes_GetAll]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT P.id,P.PlaceName,P.PlaceNumber,P.PrizeAmount,P.PrizePercentage
	FROM dbo.Prizes P;

END
GO
