USE Tournaments;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==============================================================================
-- Author:		Saurabh Mankar
-- Create date: 3/17/2020
-- Description:	Stored Procedure to Insert Prize From the Create Prize Form
-- Input :
--		   1. Place Number
--		   2. Place Name
--		   3. Prize Amount
--		   4. Prize Percentage
-- Output :
--		   1.Id (Unique Prize Id of the newly created Prize)
-- ==============================================================================
ALTER PROCEDURE [dbo].[spPrizes_Insert]
(
	-- Add the parameters for the stored procedure here
	@PlaceNumber int  , 
	@PlaceName NVARCHAR(50) ,
	@PrizeAmount MONEY,
	@PrizePercentage FLOAT,
	@id int =0 OUTPUT
)
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert the Prize with the help of filled out fields from the form
	INSERT INTO [dbo].[Prizes]
           ([PlaceNumber]
           ,[PlaceName]
           ,[PrizeAmount]
           ,[PrizePercentage])
     VALUES
           (@PlaceNumber
           ,@PlaceName
           ,@PrizeAmount
           ,@PrizePercentage)

		SET @id = SCOPE_IDENTITY();
	
END
GO
