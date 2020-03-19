USE Tournaments;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==============================================================================
-- Author:		Saurabh Mankar
-- Create date: 3/19/2020
-- Description:	Stored Procedure to Insert Person from the Add Team Member Form
-- Input :
--		   1. First Name
--		   2. Last Name
--		   3. Email Address
--		   4. CellPhone Number
-- Output :
--		   1.Id (Unique Person Id of the newly created Person)
-- ==============================================================================
ALTER PROCEDURE [dbo].[spPeople_Insert]
(
	@FirstName nvarchar(100)
	,@LastName nvarchar(100)
	,@EmailAddress nvarchar(200)
	,@CellPhoneNumber nvarchar(20)
	,@id int =0 OUTPUT
)
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert the Prize with the help of filled out fields from the form
	INSERT INTO [dbo].[People]
           ([FirstName]
           ,[LastName]
           ,[EmailAddress]
           ,[CellPhoneNumber])
     VALUES
           (@FirstName
           ,@LastName
           ,@EmailAddress
           ,@CellPhoneNumber)

	SET @id = SCOPE_IDENTITY();
	
END
GO
