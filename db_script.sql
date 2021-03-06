USE [Spotify]
GO
/****** Object:  Table [dbo].[rating]    Script Date: 6/12/2022 9:58:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rating](
	[rating_pid] [int] IDENTITY(1,1) NOT NULL,
	[song_xid] [int] NULL,
	[rating] [int] NULL,
 CONSTRAINT [PK_rating] PRIMARY KEY CLUSTERED 
(
	[rating_pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblArtist]    Script Date: 6/12/2022 9:58:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblArtist](
	[Srno] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[DOB] [date] NULL,
	[Bio] [varchar](500) NULL,
 CONSTRAINT [PK_tblArtist] PRIMARY KEY CLUSTERED 
(
	[Srno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblSongs]    Script Date: 6/12/2022 9:58:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSongs](
	[Srno] [int] IDENTITY(1,1) NOT NULL,
	[SongName] [varchar](100) NOT NULL,
	[DOR] [date] NULL,
	[Cover] [varchar](50) NULL,
	[RatingOne] [int] NULL,
	[RatingTwo] [int] NULL,
	[RatingThree] [int] NULL,
	[RatingFour] [int] NULL,
	[RatingFive] [int] NULL,
 CONSTRAINT [PK_tblSongs] PRIMARY KEY CLUSTERED 
(
	[Srno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTransiction]    Script Date: 6/12/2022 9:58:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTransiction](
	[Srno] [int] IDENTITY(1,1) NOT NULL,
	[SongID] [int] NOT NULL,
	[ArtistID] [int] NOT NULL,
 CONSTRAINT [PK_tblTransiction] PRIMARY KEY CLUSTERED 
(
	[Srno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[rating]  WITH CHECK ADD FOREIGN KEY([song_xid])
REFERENCES [dbo].[tblSongs] ([Srno])
GO
/****** Object:  StoredProcedure [dbo].[usp_AddAddRating]    Script Date: 6/12/2022 9:58:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_AddAddRating]
	@Rating int
	
AS
BEGIN
Declare @ExistingRating int

IF(@Rating =1)
BEGIN 

Select @ExistingRating =  RatingOne from tblSongs  where Srno=1

update tblSongs SET RatingOne=@ExistingRating+1
END                  

IF(@Rating =2)
BEGIN 


Select @ExistingRating =  RatingTwo from tblSongs  where Srno=1

update tblSongs SET RatingTwo=@ExistingRating+1

END   
IF(@Rating =3)
BEGIN 


Select @ExistingRating =  RatingThree from tblSongs  where Srno=1

update tblSongs SET RatingThree=@ExistingRating+1

END 
IF(@Rating =4)
BEGIN 


Select @ExistingRating =  RatingFour from tblSongs  where Srno=1

update tblSongs SET RatingFour=@ExistingRating+1

END 

IF(@Rating =5)
BEGIN 

Select @ExistingRating =  RatingFive from tblSongs  where Srno=1

update tblSongs SET RatingFive=@ExistingRating+1

END 

END

GO
/****** Object:  StoredProcedure [dbo].[usp_AddArtist]    Script Date: 6/12/2022 9:58:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AddArtist]
	@ArtistName as varchar(100),
	@ArtistDOB as datetime,
	@ArtistBio as varchar(500)

	
AS
BEGIN
	 Insert into tblArtist(Name,DOB,Bio)
            Values(@ArtistName,@ArtistDOB,@ArtistBio)
END

GO
/****** Object:  StoredProcedure [dbo].[usp_AddSong]    Script Date: 6/12/2022 9:58:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AddSong]
	@SongName as varchar(100),
	@ReleaseDate as datetime,
	@Artwork as varchar(500),
	@Artist as varchar(100)
	
AS
BEGIN
	 Insert into tblSongs(SongName,DOR,Cover)
     Values(@SongName,@ReleaseDate,@Artwork)

     Insert into tblTransiction(SongID,ArtistID)
	 values( (select top 1 (Srno) from tblSongs order by Srno desc) ,@Artist)
END

GO
/****** Object:  StoredProcedure [dbo].[usp_GetArtist]    Script Date: 6/12/2022 9:58:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetArtist] 
	
AS
BEGIN
	
	select * from tblArtist;

END

GO
/****** Object:  StoredProcedure [dbo].[usp_GetArtistDetails]    Script Date: 6/12/2022 9:58:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetArtistDetails]
	
AS
BEGIN
		select TAR.*,TS.SongName,TS.Cover,TS.DOR from tblArtist TAR  inner join tblTransiction TR
	    on TAR.Srno=TR.ArtistID
	    
		inner join tblSongs TS
	    on TR.SongID=TS.Srno
	
END

GO
/****** Object:  StoredProcedure [dbo].[usp_GetSongsDetails]    Script Date: 6/12/2022 9:58:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetSongsDetails]
	
AS
BEGIN
		
select SongName,DOR,Cover,tblSongs.Srno,tblArtist.Name,
(select t.rating from
(select avg(rating) as rating,song_xid from rating where song_xid=tblSongs.Srno group by song_xid)t) as rating
from tblSongs inner join tblTransiction on tblSongs.Srno=SongID inner join tblArtist on ArtistID=tblArtist.Srno 
order by rating desc;



	
END

GO
