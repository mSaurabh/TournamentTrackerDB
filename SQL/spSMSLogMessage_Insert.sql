USE [Tournaments]
GO
/****** Object:  StoredProcedure [dbo].[spPeople_Insert]    Script Date: 9/20/2020 5:54:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==============================================================================
-- Author:		Saurabh Mankar
-- Create date: 9/20/2020
-- Description:	Stored Procedure to Insert SMS Log as a part of notification
-- Input :
--		   1. Message Cost
--		   2. Message Currency
--		   3. Message Status
--		   4. Message Length
--		   5. To Phone Number
--		   6. From Phone Number
-- Output :
--		   1.Id (Unique SMS Log Id of the newly insert status message)
-- ==============================================================================
ALTER PROCEDURE [dbo].[spSMSLogMessage_Insert]
(
	@MessageCost money
    ,@MessageCurrency varchar(25)
    ,@MessageStatus varchar(50)
    ,@MessageLength int
    ,@MessageToPhoneNumber varchar(50)
    ,@MessageFromPhoneNumber varchar(50)
	,@id int =0 OUTPUT
)
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert the Prize with the help of filled out fields from the form
	INSERT INTO [dbo].[SMSLog]
           ([MessageCost]
           ,[MessageCurrency]
           ,[MessageStatus]
           ,[MessageLength]
           ,[MessageToPhoneNumber]
           ,[MessageFromPhoneNumber])
     VALUES
           (
            @MessageCost
           ,@MessageCurrency
           ,@MessageStatus
           ,@MessageLength
           ,@MessageToPhoneNumber
           ,@MessageFromPhoneNumber)

	SET @id = SCOPE_IDENTITY();
	
END
