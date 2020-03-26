USE master

IF(Select 1 FROM sys.databases d WHERE d.name = 'Tournaments') IS NULL
BEGIN
	PRINT 'Creating database [Tournaments]...'
	CREATE DATABASE [Tournaments];
	PRINT 'Done !!'
END
GO

Use Tournaments	
GO

/****** Object:  Table [dbo].[Prizes]    Script Date: 3/14/2020 8:45:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[dbo].[Tournaments]') IS NULL
BEGIN
	CREATE TABLE [dbo].[Tournaments](
		[id] [int] IDENTITY(1,1) NOT NULL,
		[TournamentName] [nvarchar](50) NOT NULL,
		[EntryFee] [money] NOT NULL,
	 CONSTRAINT [PK_dbo.Tournament] PRIMARY KEY CLUSTERED 
	(
		[id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END

IF OBJECT_ID('[dbo].[People]') IS NULL
BEGIN
	CREATE TABLE [dbo].[People](
		[id] [int] IDENTITY(1,1) NOT NULL,
		[FirstName] [nvarchar](100) NOT NULL,
		[LastName] [nvarchar](100) NOT NULL,
		[EmailAddress] [nvarchar](200) NOT NULL,
		[PhoneNumber] [varchar](20) NULL,
	 CONSTRAINT [PK_dbo.People] PRIMARY KEY CLUSTERED 
	(
		[id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END

IF OBJECT_ID('[dbo].[Teams]') IS NULL
BEGIN
	CREATE TABLE [dbo].[Teams](
		[id] [int] IDENTITY(1,1) NOT NULL,
		[TeamName] [nvarchar](100) NOT NULL,
	 CONSTRAINT [PK_dbo.Teams] PRIMARY KEY CLUSTERED 
	(
		[id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END

IF OBJECT_ID('[dbo].[Prizes]') IS NULL
BEGIN
	CREATE TABLE [dbo].[Prizes](
		[id] [int] IDENTITY(1,1) NOT NULL,
		[PlaceNumber] [int] NOT NULL,
		[PlaceName] [nvarchar](50) NOT NULL,
		[PrizeAmount] [money] NOT NULL,
		[PrizePercentage] [float] NOT NULL,
	 CONSTRAINT [PK_dbo.Prizes] PRIMARY KEY CLUSTERED 
	(
		[id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END

IF OBJECT_ID('[dbo].[MatchupEntries]') IS NULL
BEGIN
	CREATE TABLE [dbo].[MatchupEntries](
		[id] [int] IDENTITY(1,1) NOT NULL,
		[MatchupId] [int] NOT NULL,
		[ParentMatchupId] [int] NULL,
		[TeamCompetingId] [int] NOT NULL,
		[Score] [float] NULL,
	 CONSTRAINT [PK_dbo.MatchupEntries] PRIMARY KEY CLUSTERED 
	(
		[id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END

IF OBJECT_ID('[dbo].[Matchups]') IS NULL
BEGIN
	CREATE TABLE [dbo].[Matchups](
		[id] [int] IDENTITY(1,1) NOT NULL,
		[TournamentId] [int] NOT NULL,
		[WinnerId] [int] NULL,
		[MatchUpRound] INT NOT NULL,
	 CONSTRAINT [PK_dbo.Matchups] PRIMARY KEY CLUSTERED 
	(
		[id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END

IF OBJECT_ID('[dbo].[TeamMembers]') IS NULL
BEGIN
	CREATE TABLE [dbo].[TeamMembers](
		[id] [int] IDENTITY(1,1) NOT NULL,
		[TeamId] [int] NOT NULL,
		[PersonId] [int] NOT NULL,
	 CONSTRAINT [PK_dbo.TeamMembers] PRIMARY KEY CLUSTERED 
	(
		[id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END

IF OBJECT_ID('[dbo].[TournamentEntries]') IS NULL
BEGIN
	CREATE TABLE [dbo].[TournamentEntries](
		[id] [int] IDENTITY(1,1) NOT NULL,
		[TournamentId] [int] NOT NULL,
		[TeamId] [int] NOT NULL,
	 CONSTRAINT [PK_dbo.TournamentEntries] PRIMARY KEY CLUSTERED 
	(
		[id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END

IF OBJECT_ID('[dbo].[TournamentPrizes]') IS NULL
BEGIN
	CREATE TABLE [dbo].[TournamentPrizes](
		[id] [int] IDENTITY(1,1) NOT NULL,
		[TournamentId] [int] NOT NULL,
		[PrizeId] [int] NOT NULL,
	 CONSTRAINT [PK_TournamentPrizes] PRIMARY KEY CLUSTERED 
	(
		[id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END

/*===================================
* Creating Constraints on the tables 
*===================================*/

IF OBJECT_ID('[FK_TournamentPrizes_PrizeId]') IS NULL
BEGIN
	ALTER TABLE [dbo].[TournamentPrizes]  WITH CHECK ADD  CONSTRAINT [FK_TournamentPrizes_PrizeId] FOREIGN KEY([PrizeId])
	REFERENCES [dbo].[Prizes] ([id])
END
GO

IF OBJECT_ID('[FK_TournamentPrizes_PrizeId]') IS NULL
BEGIN
	ALTER TABLE [dbo].[TournamentPrizes] CHECK CONSTRAINT [FK_TournamentPrizes_PrizeId]
END
GO

IF OBJECT_ID('[FK_TournamentPrizes_TournamentId]') IS NULL
BEGIN
	ALTER TABLE [dbo].[TournamentPrizes]  WITH CHECK ADD  CONSTRAINT [FK_TournamentPrizes_TournamentId] FOREIGN KEY([TournamentId])
	REFERENCES [dbo].[Tournaments] ([id])
END
GO

IF OBJECT_ID('[FK_TournamentPrizes_TournamentId]') IS NULL
BEGIN
	ALTER TABLE [dbo].[TournamentPrizes] CHECK CONSTRAINT [FK_TournamentPrizes_TournamentId]
END
GO

IF OBJECT_ID('[FK_TournamentEntries_TeamId]') IS NULL
BEGIN
	ALTER TABLE [dbo].[TournamentEntries]  WITH CHECK ADD  CONSTRAINT [FK_TournamentEntries_TeamId] FOREIGN KEY([TeamId])
	REFERENCES [dbo].[Teams] ([id])
END
GO

IF OBJECT_ID('[FK_TournamentEntries_TeamId]') IS NULL
BEGIN
	ALTER TABLE [dbo].[TournamentEntries] CHECK CONSTRAINT [FK_TournamentEntries_TeamId]
END
GO

IF OBJECT_ID('[FK_TournamentEntries_TournamentId]') IS NULL
BEGIN
	ALTER TABLE [dbo].[TournamentEntries]  WITH CHECK ADD  CONSTRAINT [FK_TournamentEntries_TournamentId] FOREIGN KEY([TournamentId])
	REFERENCES [dbo].[Tournaments] ([id])
END
GO

IF OBJECT_ID('[FK_TournamentEntries_TournamentId]') IS NULL
BEGIN
	ALTER TABLE [dbo].[TournamentEntries] CHECK CONSTRAINT [FK_TournamentEntries_TournamentId]
END
GO

IF OBJECT_ID('[FK_TeamMembers_PersonId]') IS NULL
BEGIN
	ALTER TABLE [dbo].[TeamMembers]  WITH CHECK ADD  CONSTRAINT [FK_TeamMembers_PersonId] FOREIGN KEY([PersonId])
	REFERENCES [dbo].[People] ([id])
END
GO

IF OBJECT_ID('[FK_TeamMembers_PersonId]') IS NULL
BEGIN
	ALTER TABLE [dbo].[TeamMembers] CHECK CONSTRAINT [FK_TeamMembers_PersonId]
END
GO

IF OBJECT_ID('[FK_TeamMembers_TeamId]') IS NULL
BEGIN
	ALTER TABLE [dbo].[TeamMembers]  WITH CHECK ADD  CONSTRAINT [FK_TeamMembers_TeamId] FOREIGN KEY([TeamId])
	REFERENCES [dbo].[Teams] ([id])
END
GO

IF OBJECT_ID('[FK_TeamMembers_TeamId]') IS NULL
BEGIN
	ALTER TABLE [dbo].[TeamMembers] CHECK CONSTRAINT [FK_TeamMembers_TeamId]
END
GO

IF OBJECT_ID('[FK_Matchups_WinnerId]') IS NULL
BEGIN
	ALTER TABLE [dbo].[Matchups]  WITH CHECK ADD  CONSTRAINT [FK_Matchups_WinnerId] FOREIGN KEY([WinnerId])
	REFERENCES [dbo].[People] ([id])
END
GO

IF OBJECT_ID('[FK_Matchups_WinnerId]') IS NULL
BEGIN
	ALTER TABLE [dbo].[Matchups] CHECK CONSTRAINT [FK_Matchups_WinnerId]
END
GO

IF OBJECT_ID('[FK_Matchups_TournamentId]') IS NULL
BEGIN
	ALTER TABLE [dbo].[Matchups]  WITH CHECK ADD  CONSTRAINT [FK_Matchups_TournamentId] FOREIGN KEY([TournamentId])
	REFERENCES [dbo].[Tournaments] ([id])
END
GO

IF OBJECT_ID('[FK_Matchups_TournamentId]') IS NULL
BEGIN
	ALTER TABLE [dbo].[Matchups] CHECK CONSTRAINT [FK_Matchups_TournamentId]
END
GO

IF OBJECT_ID('[DF_dbo.MatchupEntries_Score]') IS NULL
BEGIN
	ALTER TABLE [dbo].[MatchupEntries] ADD  CONSTRAINT [DF_dbo.MatchupEntries_Score]  DEFAULT ((0)) FOR [Score]
END
GO

IF OBJECT_ID('[FK_MatchupEntries_MatchupId]') IS NULL
BEGIN
	ALTER TABLE [dbo].[MatchupEntries]  WITH CHECK ADD  CONSTRAINT [FK_MatchupEntries_MatchupId] FOREIGN KEY([MatchupId])
	REFERENCES [dbo].[Matchups] ([id])
END
GO

IF OBJECT_ID('[FK_MatchupEntries_MatchupId]') IS NULL
BEGIN
	ALTER TABLE [dbo].[MatchupEntries] CHECK CONSTRAINT [FK_MatchupEntries_MatchupId]
END
GO

IF OBJECT_ID('[FK_MatchupEntries_ParentMatchupId]') IS NULL
BEGIN
	ALTER TABLE [dbo].[MatchupEntries]  WITH CHECK ADD  CONSTRAINT [FK_MatchupEntries_ParentMatchupId] FOREIGN KEY([ParentMatchupId])
	REFERENCES [dbo].[Matchups] ([id])
END
GO

IF OBJECT_ID('[FK_MatchupEntries_ParentMatchupId]') IS NULL
BEGIN
	ALTER TABLE [dbo].[MatchupEntries] CHECK CONSTRAINT [FK_MatchupEntries_ParentMatchupId]
END
GO

IF OBJECT_ID('[FK_MatchupEntries_TeamCompetingId]') IS NULL
BEGIN
	ALTER TABLE [dbo].[MatchupEntries]  WITH CHECK ADD  CONSTRAINT [FK_MatchupEntries_TeamCompetingId] FOREIGN KEY([TeamCompetingId])
	REFERENCES [dbo].[Teams] ([id])
END
GO

IF OBJECT_ID('[FK_MatchupEntries_TeamCompetingId]') IS NULL
BEGIN
	ALTER TABLE [dbo].[MatchupEntries] CHECK CONSTRAINT [FK_MatchupEntries_TeamCompetingId]
END
GO

IF OBJECT_ID('[DF_dbo.Prizes_PrizeAmount]') IS NULL
BEGIN
	ALTER TABLE [dbo].[Prizes] ADD  CONSTRAINT [DF_dbo.Prizes_PrizeAmount]  DEFAULT ((0)) FOR [PrizeAmount]
END
GO

IF OBJECT_ID('[DF_dbo.Prizes_PrizePercentage]') IS NULL
BEGIN
	ALTER TABLE [dbo].[Prizes] ADD  CONSTRAINT [DF_dbo.Prizes_PrizePercentage]  DEFAULT ((0)) FOR [PrizePercentage]
END
GO