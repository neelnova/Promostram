USE [master]
GO
/****** Object:  Database [promostream]    Script Date: 17-11-2018 15:22:01 ******/
CREATE DATABASE [promostream]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'promostream', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\promostream.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'promostream_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\promostream_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [promostream] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [promostream].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [promostream] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [promostream] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [promostream] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [promostream] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [promostream] SET ARITHABORT OFF 
GO
ALTER DATABASE [promostream] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [promostream] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [promostream] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [promostream] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [promostream] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [promostream] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [promostream] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [promostream] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [promostream] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [promostream] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [promostream] SET  DISABLE_BROKER 
GO
ALTER DATABASE [promostream] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [promostream] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [promostream] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [promostream] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [promostream] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [promostream] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [promostream] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [promostream] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [promostream] SET  MULTI_USER 
GO
ALTER DATABASE [promostream] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [promostream] SET DB_CHAINING OFF 
GO
ALTER DATABASE [promostream] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [promostream] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [promostream]
GO
/****** Object:  Table [dbo].[image]    Script Date: 17-11-2018 15:22:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[image](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[image] [nchar](150) NULL,
	[mail] [varchar](150) NULL,
 CONSTRAINT [PK_image] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sub_photographer]    Script Date: 17-11-2018 15:22:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sub_photographer](
	[sid] [int] NOT NULL,
	[type] [varchar](50) NOT NULL,
 CONSTRAINT [PK_sub_photographer] PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_adsbidder]    Script Date: 17-11-2018 15:22:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_adsbidder](
	[abid] [int] IDENTITY(1,1) NOT NULL,
	[adid] [int] NOT NULL,
	[bidder_id] [int] NOT NULL,
	[created] [datetime] NULL,
	[isActive] [char](1) NOT NULL,
	[updated] [datetime] NULL,
	[type] [int] NULL,
 CONSTRAINT [PK_tbl_adsbidder] PRIMARY KEY CLUSTERED 
(
	[abid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_advertisement]    Script Date: 17-11-2018 15:22:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_advertisement](
	[aid] [int] IDENTITY(1,1) NOT NULL,
	[post_title] [text] NOT NULL,
	[description] [text] NOT NULL,
	[isActive] [char](1) NOT NULL,
	[allowuser] [varchar](50) NOT NULL,
	[created] [date] NOT NULL,
	[updated] [date] NOT NULL,
	[cid] [int] NOT NULL,
 CONSTRAINT [PK_tbl_advertisement] PRIMARY KEY CLUSTERED 
(
	[aid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_contract]    Script Date: 17-11-2018 15:22:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_contract](
	[ncid] [int] IDENTITY(1,1) NOT NULL,
	[title] [text] NOT NULL,
	[gen_by] [int] NOT NULL,
	[gen_for] [int] NOT NULL,
	[ad_id] [int] NOT NULL,
	[isActive] [char](1) NOT NULL,
	[created] [date] NOT NULL,
	[updated] [date] NOT NULL,
 CONSTRAINT [PK_tbl_contract] PRIMARY KEY CLUSTERED 
(
	[ncid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_customer]    Script Date: 17-11-2018 15:22:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_customer](
	[cid] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](150) NOT NULL,
	[email] [varchar](150) NOT NULL,
	[contactno] [bigint] NOT NULL,
	[gender] [char](6) NOT NULL,
	[address] [varchar](200) NOT NULL,
	[age] [int] NOT NULL,
	[password] [varchar](12) NOT NULL,
	[qualification] [varchar](50) NULL,
	[isDeactive] [varchar](8) NULL,
	[created] [date] NULL,
	[updated] [date] NULL,
 CONSTRAINT [PK_tbl_customer] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_model]    Script Date: 17-11-2018 15:22:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_model](
	[fid] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](150) NOT NULL,
	[email] [varchar](150) NOT NULL,
	[contactno] [bigint] NOT NULL,
	[gender] [char](7) NOT NULL,
	[address] [varchar](200) NOT NULL,
	[age] [int] NOT NULL,
	[height] [int] NOT NULL,
	[password] [varchar](12) NOT NULL,
	[qualification] [varchar](50) NULL,
	[isDeactive] [varchar](8) NULL,
	[created] [date] NULL,
	[updated] [date] NULL,
 CONSTRAINT [PK_tbl_model] PRIMARY KEY CLUSTERED 
(
	[fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_notification]    Script Date: 17-11-2018 15:22:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_notification](
	[nid] [int] IDENTITY(1,1) NOT NULL,
	[notify_for] [int] NOT NULL,
	[notify_by] [int] NOT NULL,
	[ads_id] [int] NOT NULL,
	[updated] [datetime] NOT NULL,
	[created] [datetime] NOT NULL,
	[isActive] [char](1) NOT NULL,
	[type] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_photographer]    Script Date: 17-11-2018 15:22:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_photographer](
	[pid] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](150) NOT NULL,
	[email] [varchar](150) NOT NULL,
	[contactno] [bigint] NOT NULL,
	[gender] [char](7) NOT NULL,
	[address] [varchar](200) NOT NULL,
	[age] [int] NOT NULL,
	[subid] [int] NOT NULL,
	[password] [varchar](12) NOT NULL,
	[qualification] [varchar](50) NULL,
	[isDeactive] [varchar](50) NULL,
	[created] [date] NULL,
	[updated] [date] NULL,
 CONSTRAINT [PK_table1] PRIMARY KEY CLUSTERED 
(
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_post]    Script Date: 17-11-2018 15:22:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_post](
	[pid] [int] IDENTITY(1,1) NOT NULL,
	[post_desc] [text] NOT NULL,
	[post_img] [varchar](max) NOT NULL,
	[uploder_id] [int] NOT NULL,
	[type] [int] NOT NULL,
	[created] [date] NOT NULL,
	[updated] [date] NOT NULL,
	[isDelete] [char](10) NOT NULL,
 CONSTRAINT [PK_tbl_post] PRIMARY KEY CLUSTERED 
(
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_profile]    Script Date: 17-11-2018 15:22:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_profile](
	[prid] [varchar](50) NULL,
	[type] [varchar](50) NULL,
	[profilepic] [nchar](150) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_work]    Script Date: 17-11-2018 15:22:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_work](
	[wid] [int] IDENTITY(1,1) NOT NULL,
	[con_id] [int] NOT NULL,
	[work_for] [int] NOT NULL,
	[type] [int] NOT NULL,
	[updated] [date] NOT NULL,
	[isActive] [char](1) NOT NULL,
	[created] [date] NOT NULL,
 CONSTRAINT [PK_tbl_work] PRIMARY KEY CLUSTERED 
(
	[wid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[varification]    Script Date: 17-11-2018 15:22:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[varification](
	[cname] [varchar](50) NOT NULL,
	[emailaddress] [varchar](50) NOT NULL,
	[status] [varchar](50) NOT NULL,
	[activationcode] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[image] ON 

INSERT [dbo].[image] ([id], [image], [mail]) VALUES (2052, N'~/img/Screenshot_2017-07-26-18-44-31.png                                                                                                              ', N'16mscit011@gmail.com')
INSERT [dbo].[image] ([id], [image], [mail]) VALUES (2053, N'~/img/WzutdAVwf2uU7XCd.jpg                                                                                                                            ', N'16mscit043@gmail.com')
INSERT [dbo].[image] ([id], [image], [mail]) VALUES (2054, N'~/img/Kisun 20170328_201559.jpg                                                                                                                       ', N'16mscit027@gmail.com')
INSERT [dbo].[image] ([id], [image], [mail]) VALUES (2055, N'~/img/Screenshot_20170416_195743-1_1492353061193.png                                                                                                  ', N'16mscit026@gmail.com')
INSERT [dbo].[image] ([id], [image], [mail]) VALUES (2056, N'~/img/WhatsApp Image 2018-11-17 at 4.11.41 AM.jpeg                                                                                                    ', N'neekatari@protonmail.ch')
SET IDENTITY_INSERT [dbo].[image] OFF
INSERT [dbo].[sub_photographer] ([sid], [type]) VALUES (1, N'fashion')
INSERT [dbo].[sub_photographer] ([sid], [type]) VALUES (2, N'event')
INSERT [dbo].[sub_photographer] ([sid], [type]) VALUES (3, N'sports')
INSERT [dbo].[sub_photographer] ([sid], [type]) VALUES (4, N'wildlife')
SET IDENTITY_INSERT [dbo].[tbl_adsbidder] ON 

INSERT [dbo].[tbl_adsbidder] ([abid], [adid], [bidder_id], [created], [isActive], [updated], [type]) VALUES (71, 25, 1059, CAST(0x0000A99A005AAB4D AS DateTime), N't', CAST(0x0000A99A005AAB4D AS DateTime), 1)
INSERT [dbo].[tbl_adsbidder] ([abid], [adid], [bidder_id], [created], [isActive], [updated], [type]) VALUES (72, 23, 1059, CAST(0x0000A99A005AB019 AS DateTime), N't', CAST(0x0000A99A005AB019 AS DateTime), 1)
INSERT [dbo].[tbl_adsbidder] ([abid], [adid], [bidder_id], [created], [isActive], [updated], [type]) VALUES (73, 25, 7, CAST(0x0000A99A005B0DEF AS DateTime), N't', CAST(0x0000A99A005B0DEF AS DateTime), 2)
INSERT [dbo].[tbl_adsbidder] ([abid], [adid], [bidder_id], [created], [isActive], [updated], [type]) VALUES (74, 26, 1059, CAST(0x0000A99A00F0A890 AS DateTime), N't', CAST(0x0000A99A00F0A890 AS DateTime), 1)
INSERT [dbo].[tbl_adsbidder] ([abid], [adid], [bidder_id], [created], [isActive], [updated], [type]) VALUES (76, 24, 8, CAST(0x0000A99B00500846 AS DateTime), N't', CAST(0x0000A99B00500846 AS DateTime), 2)
INSERT [dbo].[tbl_adsbidder] ([abid], [adid], [bidder_id], [created], [isActive], [updated], [type]) VALUES (1075, 26, 1059, CAST(0x0000A99B00E0BB5F AS DateTime), N't', CAST(0x0000A99B00E0BB5F AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tbl_adsbidder] OFF
SET IDENTITY_INSERT [dbo].[tbl_advertisement] ON 

INSERT [dbo].[tbl_advertisement] ([aid], [post_title], [description], [isActive], [allowuser], [created], [updated], [cid]) VALUES (23, N'bjhbjhbhjbhj', N'bjbjhbjhbhjhh', N't', N'photographer', CAST(0xF43E0B00 AS Date), CAST(0xF43E0B00 AS Date), 5)
INSERT [dbo].[tbl_advertisement] ([aid], [post_title], [description], [isActive], [allowuser], [created], [updated], [cid]) VALUES (24, N'vvghvghvhgv', N'jhvhjjhjhvhvjh', N't', N'model', CAST(0xF43E0B00 AS Date), CAST(0xF43E0B00 AS Date), 6)
INSERT [dbo].[tbl_advertisement] ([aid], [post_title], [description], [isActive], [allowuser], [created], [updated], [cid]) VALUES (25, N'clothshop', N'date-18/5/2019', N't', N'both', CAST(0xF53E0B00 AS Date), CAST(0xF53E0B00 AS Date), 6)
INSERT [dbo].[tbl_advertisement] ([aid], [post_title], [description], [isActive], [allowuser], [created], [updated], [cid]) VALUES (26, N'birthday', N'place: navsari
date : 20/02/2019', N't', N'photographer', CAST(0xF53E0B00 AS Date), CAST(0xF53E0B00 AS Date), 5)
SET IDENTITY_INSERT [dbo].[tbl_advertisement] OFF
SET IDENTITY_INSERT [dbo].[tbl_contract] ON 

INSERT [dbo].[tbl_contract] ([ncid], [title], [gen_by], [gen_for], [ad_id], [isActive], [created], [updated]) VALUES (14, N'clothshop', 6, 1059, 25, N't', CAST(0xF53E0B00 AS Date), CAST(0xF53E0B00 AS Date))
INSERT [dbo].[tbl_contract] ([ncid], [title], [gen_by], [gen_for], [ad_id], [isActive], [created], [updated]) VALUES (15, N'bjhbjhbhjbhj', 5, 1059, 23, N't', CAST(0xF53E0B00 AS Date), CAST(0xF53E0B00 AS Date))
INSERT [dbo].[tbl_contract] ([ncid], [title], [gen_by], [gen_for], [ad_id], [isActive], [created], [updated]) VALUES (16, N'clothshop', 6, 7, 25, N't', CAST(0xF53E0B00 AS Date), CAST(0xF53E0B00 AS Date))
INSERT [dbo].[tbl_contract] ([ncid], [title], [gen_by], [gen_for], [ad_id], [isActive], [created], [updated]) VALUES (17, N'birthday', 5, 1059, 26, N't', CAST(0xF53E0B00 AS Date), CAST(0xF53E0B00 AS Date))
INSERT [dbo].[tbl_contract] ([ncid], [title], [gen_by], [gen_for], [ad_id], [isActive], [created], [updated]) VALUES (18, N'vvghvghvhgv', 6, 8, 24, N't', CAST(0xF63E0B00 AS Date), CAST(0xF63E0B00 AS Date))
SET IDENTITY_INSERT [dbo].[tbl_contract] OFF
SET IDENTITY_INSERT [dbo].[tbl_customer] ON 

INSERT [dbo].[tbl_customer] ([cid], [name], [email], [contactno], [gender], [address], [age], [password], [qualification], [isDeactive], [created], [updated]) VALUES (5, N'yesha', N'16mscit011@gmail.com', 8574365241, N'female', N'navsari', 22, N'yesha', N'bscit', N'f', CAST(0xF53E0B00 AS Date), CAST(0xF63E0B00 AS Date))
INSERT [dbo].[tbl_customer] ([cid], [name], [email], [contactno], [gender], [address], [age], [password], [qualification], [isDeactive], [created], [updated]) VALUES (6, N'kisun', N'16mscit043@gmail.com', 6521487456, N'male  ', N'bardoli', 21, N'kisun', N'mscit ', N'f', CAST(0xF53E0B00 AS Date), CAST(0xF63E0B00 AS Date))
SET IDENTITY_INSERT [dbo].[tbl_customer] OFF
SET IDENTITY_INSERT [dbo].[tbl_model] ON 

INSERT [dbo].[tbl_model] ([fid], [name], [email], [contactno], [gender], [address], [age], [height], [password], [qualification], [isDeactive], [created], [updated]) VALUES (7, N'nilkanth                                                                                                                                              ', N'16mscit027@gmail.com', 7574975789, N'male   ', N'pune', 22, 55, N'kale', N'owner of this website', N'f', CAST(0xF53E0B00 AS Date), CAST(0xF63E0B00 AS Date))
INSERT [dbo].[tbl_model] ([fid], [name], [email], [contactno], [gender], [address], [age], [height], [password], [qualification], [isDeactive], [created], [updated]) VALUES (8, N'shiv', N'neekatari@protonmail.ch', 9685745547, N'male   ', N'surat', 22, 55, N'pubg', N'MBA ', N'f', CAST(0xF63E0B00 AS Date), CAST(0xF63E0B00 AS Date))
SET IDENTITY_INSERT [dbo].[tbl_model] OFF
SET IDENTITY_INSERT [dbo].[Tbl_notification] ON 

INSERT [dbo].[Tbl_notification] ([nid], [notify_for], [notify_by], [ads_id], [updated], [created], [isActive], [type]) VALUES (68, 6, 1059, 25, CAST(0x0000A99A005AAB55 AS DateTime), CAST(0x0000A99A005AAB55 AS DateTime), N'f', 1)
INSERT [dbo].[Tbl_notification] ([nid], [notify_for], [notify_by], [ads_id], [updated], [created], [isActive], [type]) VALUES (69, 5, 1059, 23, CAST(0x0000A99A005AB01B AS DateTime), CAST(0x0000A99A005AB01B AS DateTime), N'f', 1)
INSERT [dbo].[Tbl_notification] ([nid], [notify_for], [notify_by], [ads_id], [updated], [created], [isActive], [type]) VALUES (70, 6, 7, 25, CAST(0x0000A99A005B0DFC AS DateTime), CAST(0x0000A99A005B0DFC AS DateTime), N'f', 2)
INSERT [dbo].[Tbl_notification] ([nid], [notify_for], [notify_by], [ads_id], [updated], [created], [isActive], [type]) VALUES (73, 6, 8, 24, CAST(0x0000A99B005008C8 AS DateTime), CAST(0x0000A99B005008C8 AS DateTime), N'f', 2)
INSERT [dbo].[Tbl_notification] ([nid], [notify_for], [notify_by], [ads_id], [updated], [created], [isActive], [type]) VALUES (1072, 5, 1059, 26, CAST(0x0000A99B00E0BB81 AS DateTime), CAST(0x0000A99B00E0BB81 AS DateTime), N't', 1)
INSERT [dbo].[Tbl_notification] ([nid], [notify_for], [notify_by], [ads_id], [updated], [created], [isActive], [type]) VALUES (71, 5, 1059, 26, CAST(0x0000A99A00F0A89E AS DateTime), CAST(0x0000A99A00F0A89E AS DateTime), N'f', 1)
SET IDENTITY_INSERT [dbo].[Tbl_notification] OFF
SET IDENTITY_INSERT [dbo].[tbl_photographer] ON 

INSERT [dbo].[tbl_photographer] ([pid], [name], [email], [contactno], [gender], [address], [age], [subid], [password], [qualification], [isDeactive], [created], [updated]) VALUES (1059, N'neel', N'16mscit026@gmail.com', 9687926743, N'male   ', N'surat', 21, 1, N'neel', N'bscit', N'f', CAST(0xF53E0B00 AS Date), CAST(0xF63E0B00 AS Date))
SET IDENTITY_INSERT [dbo].[tbl_photographer] OFF
SET IDENTITY_INSERT [dbo].[tbl_post] ON 

INSERT [dbo].[tbl_post] ([pid], [post_desc], [post_img], [uploder_id], [type], [created], [updated], [isDelete]) VALUES (1, N'meWONDER WOMAN HU NILKANTH SOCHTA HAI YESHA KE JAISA KOI NAHI', N'~/userpost/Screenshot_2017-07-26-18-44-31.png', 5, 0, CAST(0xF43E0B00 AS Date), CAST(0xF43E0B00 AS Date), N'f         ')
INSERT [dbo].[tbl_post] ([pid], [post_desc], [post_img], [uploder_id], [type], [created], [updated], [isDelete]) VALUES (2, N'photu with bhagvan', N'~/userpost/IMG_20180330_182136_1522417488195.jpg', 5, 0, CAST(0xF43E0B00 AS Date), CAST(0xF43E0B00 AS Date), N'f         ')
INSERT [dbo].[tbl_post] ([pid], [post_desc], [post_img], [uploder_id], [type], [created], [updated], [isDelete]) VALUES (3, N'chubby chaddo', N'~/userpost/IMG-20161001-WA0020.jpg', 5, 0, CAST(0xF43E0B00 AS Date), CAST(0xF43E0B00 AS Date), N'f         ')
INSERT [dbo].[tbl_post] ([pid], [post_desc], [post_img], [uploder_id], [type], [created], [updated], [isDelete]) VALUES (4, N'yesha #meow', N'~/userpost/IMG-20161001-WA0022.jpg', 5, 0, CAST(0xF43E0B00 AS Date), CAST(0xF43E0B00 AS Date), N'f         ')
INSERT [dbo].[tbl_post] ([pid], [post_desc], [post_img], [uploder_id], [type], [created], [updated], [isDelete]) VALUES (5, N'ham sab', N'~/userpost/IMG_20170921_154013_1505997232649_1506001477855.jpg', 5, 0, CAST(0xF43E0B00 AS Date), CAST(0xF43E0B00 AS Date), N'f         ')
INSERT [dbo].[tbl_post] ([pid], [post_desc], [post_img], [uploder_id], [type], [created], [updated], [isDelete]) VALUES (6, N'frandss', N'~/userpost/Screenshot_2017-08-12-17-53-50.png', 5, 0, CAST(0xF43E0B00 AS Date), CAST(0xF43E0B00 AS Date), N'f         ')
INSERT [dbo].[tbl_post] ([pid], [post_desc], [post_img], [uploder_id], [type], [created], [updated], [isDelete]) VALUES (7, N'nimbu', N'~/userpost/IMG-20161001-WA0021.jpg', 5, 0, CAST(0xF43E0B00 AS Date), CAST(0xF43E0B00 AS Date), N'f         ')
INSERT [dbo].[tbl_post] ([pid], [post_desc], [post_img], [uploder_id], [type], [created], [updated], [isDelete]) VALUES (8, N'treeputi', N'~/userpost/IMG-20161006-WA0004.jpg', 5, 0, CAST(0xF43E0B00 AS Date), CAST(0xF43E0B00 AS Date), N'f         ')
INSERT [dbo].[tbl_post] ([pid], [post_desc], [post_img], [uploder_id], [type], [created], [updated], [isDelete]) VALUES (9, N'badha', N'~/userpost/Snapchat-30090097_1518099441485.jpg', 5, 0, CAST(0xF43E0B00 AS Date), CAST(0xF43E0B00 AS Date), N'f         ')
INSERT [dbo].[tbl_post] ([pid], [post_desc], [post_img], [uploder_id], [type], [created], [updated], [isDelete]) VALUES (10, N'tshirt', N'~/userpost/Screenshot_2018-05-21-13-56-22.png', 5, 0, CAST(0xF43E0B00 AS Date), CAST(0xF43E0B00 AS Date), N'f         ')
INSERT [dbo].[tbl_post] ([pid], [post_desc], [post_img], [uploder_id], [type], [created], [updated], [isDelete]) VALUES (11, N'sports day', N'~/userpost/Snapchat-259621162_1514467261885.jpg', 5, 0, CAST(0xF43E0B00 AS Date), CAST(0xF43E0B00 AS Date), N'f         ')
INSERT [dbo].[tbl_post] ([pid], [post_desc], [post_img], [uploder_id], [type], [created], [updated], [isDelete]) VALUES (12, N'woow', N'~/userpost/Snapchat-220355621_1518099887822.jpg', 5, 0, CAST(0xF43E0B00 AS Date), CAST(0xF43E0B00 AS Date), N'f         ')
INSERT [dbo].[tbl_post] ([pid], [post_desc], [post_img], [uploder_id], [type], [created], [updated], [isDelete]) VALUES (13, N'bhai to fom maj hoi', N'~/userpost/IMG-20161001-WA0021.jpg', 1059, 1, CAST(0xF43E0B00 AS Date), CAST(0xF43E0B00 AS Date), N't         ')
INSERT [dbo].[tbl_post] ([pid], [post_desc], [post_img], [uploder_id], [type], [created], [updated], [isDelete]) VALUES (14, N'love #bae', N'~/userpost/Screenshot_20170416_195743-1_1492353061193.png', 1059, 1, CAST(0xF43E0B00 AS Date), CAST(0xF43E0B00 AS Date), N'f         ')
INSERT [dbo].[tbl_post] ([pid], [post_desc], [post_img], [uploder_id], [type], [created], [updated], [isDelete]) VALUES (15, N'love #bae #shradha', N'~/userpost/Screenshot_20170410_192104-1_1491832296885.png', 1059, 1, CAST(0xF43E0B00 AS Date), CAST(0xF43E0B00 AS Date), N'f         ')
INSERT [dbo].[tbl_post] ([pid], [post_desc], [post_img], [uploder_id], [type], [created], [updated], [isDelete]) VALUES (16, N'#ddd', N'~/userpost/IMG-20161001-WA0020.jpg', 1059, 1, CAST(0xF43E0B00 AS Date), CAST(0xF43E0B00 AS Date), N'f         ')
INSERT [dbo].[tbl_post] ([pid], [post_desc], [post_img], [uploder_id], [type], [created], [updated], [isDelete]) VALUES (17, N'kaini bs jalsa', N'~/userpost/IMG_20170810_192254.jpg', 1059, 1, CAST(0xF43E0B00 AS Date), CAST(0xF43E0B00 AS Date), N'f         ')
INSERT [dbo].[tbl_post] ([pid], [post_desc], [post_img], [uploder_id], [type], [created], [updated], [isDelete]) VALUES (18, N'shweta no pag tutelo', N'~/userpost/IMG_20170921_154016_1505997227879_1506001478992.jpg', 7, 2, CAST(0xF43E0B00 AS Date), CAST(0xF43E0B00 AS Date), N'f         ')
INSERT [dbo].[tbl_post] ([pid], [post_desc], [post_img], [uploder_id], [type], [created], [updated], [isDelete]) VALUES (19, N'we all', N'~/userpost/IMG_2018-03-09_17-27-22_1520596861538.png', 7, 2, CAST(0xF43E0B00 AS Date), CAST(0xF43E0B00 AS Date), N'f         ')
INSERT [dbo].[tbl_post] ([pid], [post_desc], [post_img], [uploder_id], [type], [created], [updated], [isDelete]) VALUES (20, N'with nimbu #bhai', N'~/userpost/IMG_2018-03-05_17-01-10_1520322849067.png', 7, 2, CAST(0xF43E0B00 AS Date), CAST(0xF43E0B00 AS Date), N'f         ')
INSERT [dbo].[tbl_post] ([pid], [post_desc], [post_img], [uploder_id], [type], [created], [updated], [isDelete]) VALUES (21, N'@meow @neel', N'~/userpost/Snapchat-198201187_1517497048983.jpg', 7, 2, CAST(0xF43E0B00 AS Date), CAST(0xF43E0B00 AS Date), N't         ')
INSERT [dbo].[tbl_post] ([pid], [post_desc], [post_img], [uploder_id], [type], [created], [updated], [isDelete]) VALUES (22, N'nimbu ne yesha', N'~/userpost/IMG-20161001-WA0022.jpg', 7, 2, CAST(0xF43E0B00 AS Date), CAST(0xF43E0B00 AS Date), N't         ')
INSERT [dbo].[tbl_post] ([pid], [post_desc], [post_img], [uploder_id], [type], [created], [updated], [isDelete]) VALUES (23, N'anual #performance', N'~/userpost/20180511123705_IMG_6625.JPG_1526100643469.jpg', 1059, 1, CAST(0xF53E0B00 AS Date), CAST(0xF53E0B00 AS Date), N'f         ')
INSERT [dbo].[tbl_post] ([pid], [post_desc], [post_img], [uploder_id], [type], [created], [updated], [isDelete]) VALUES (24, N'#uthfest #masti', N'~/userpost/IMG-20161001-WA0023.jpg', 6, 0, CAST(0xF63E0B00 AS Date), CAST(0xF63E0B00 AS Date), N'f         ')
INSERT [dbo].[tbl_post] ([pid], [post_desc], [post_img], [uploder_id], [type], [created], [updated], [isDelete]) VALUES (25, N'ShivBruh', N'~/userpost/WhatsApp Image 2018-11-17 at 4.11.41 AM.jpeg', 8, 2, CAST(0xF63E0B00 AS Date), CAST(0xF63E0B00 AS Date), N't         ')
INSERT [dbo].[tbl_post] ([pid], [post_desc], [post_img], [uploder_id], [type], [created], [updated], [isDelete]) VALUES (26, N'#bhai bhai', N'~/userpost/WhatsApp Image 2018-11-17 at 4.11.41 AM.jpeg', 8, 2, CAST(0xF63E0B00 AS Date), CAST(0xF63E0B00 AS Date), N'f         ')
INSERT [dbo].[tbl_post] ([pid], [post_desc], [post_img], [uploder_id], [type], [created], [updated], [isDelete]) VALUES (1026, N'demo', N'~/userpost/IMG_20160810_144619.jpg', 7, 2, CAST(0xF63E0B00 AS Date), CAST(0xF63E0B00 AS Date), N'f         ')
SET IDENTITY_INSERT [dbo].[tbl_post] OFF
INSERT [dbo].[tbl_profile] ([prid], [type], [profilepic]) VALUES (N'16mscit026@gmail.com', N'Select category', NULL)
INSERT [dbo].[tbl_profile] ([prid], [type], [profilepic]) VALUES (N'neekatari@protonmail.ch', N'sports', NULL)
INSERT [dbo].[tbl_profile] ([prid], [type], [profilepic]) VALUES (N'16mscit011@gmail.com', N'Select category', NULL)
INSERT [dbo].[tbl_profile] ([prid], [type], [profilepic]) VALUES (N'16mscit011@gmail.com', N'Select category', NULL)
INSERT [dbo].[tbl_profile] ([prid], [type], [profilepic]) VALUES (N'16mscit011@gmail.com', N'Select category', NULL)
INSERT [dbo].[tbl_profile] ([prid], [type], [profilepic]) VALUES (N'16mscit043@gmail.com', N'Select category', NULL)
INSERT [dbo].[tbl_profile] ([prid], [type], [profilepic]) VALUES (N'16mscit027@gmail.com', N'Select category', NULL)
INSERT [dbo].[tbl_profile] ([prid], [type], [profilepic]) VALUES (N'16mscit026@gmail.com', N'event', NULL)
INSERT [dbo].[tbl_profile] ([prid], [type], [profilepic]) VALUES (N'neekatari@protonmail.ch', N'Select category', NULL)
INSERT [dbo].[tbl_profile] ([prid], [type], [profilepic]) VALUES (N'16mscit023@gmail.com', N'fashion', NULL)
INSERT [dbo].[tbl_profile] ([prid], [type], [profilepic]) VALUES (N'abha.damani@utu.ac.in', N'wildlife', NULL)
INSERT [dbo].[tbl_profile] ([prid], [type], [profilepic]) VALUES (N'DAMANI@a.com', N'Select category', NULL)
INSERT [dbo].[tbl_profile] ([prid], [type], [profilepic]) VALUES (N'abha.damani@utu.ac.in', N'Select category', NULL)
INSERT [dbo].[tbl_profile] ([prid], [type], [profilepic]) VALUES (N'neekatari@protonmail.ch', N'fashion', NULL)
INSERT [dbo].[tbl_profile] ([prid], [type], [profilepic]) VALUES (N'neekatari@protonmail.ch', N'sports', NULL)
INSERT [dbo].[tbl_profile] ([prid], [type], [profilepic]) VALUES (N'16mscit027@gmail.com', N'Select category', NULL)
INSERT [dbo].[tbl_profile] ([prid], [type], [profilepic]) VALUES (N'neekatari@protonmail.ch', N'sports', NULL)
INSERT [dbo].[tbl_profile] ([prid], [type], [profilepic]) VALUES (N'neekatari@protonmail.ch', N'event', NULL)
INSERT [dbo].[tbl_profile] ([prid], [type], [profilepic]) VALUES (N'neekatari@protonmail.ch', N'event', NULL)
INSERT [dbo].[tbl_profile] ([prid], [type], [profilepic]) VALUES (N'neekatari@protonmail.ch', N'sports', NULL)
INSERT [dbo].[tbl_profile] ([prid], [type], [profilepic]) VALUES (N'neekatari@protonmail.ch', N'event', NULL)
INSERT [dbo].[tbl_profile] ([prid], [type], [profilepic]) VALUES (N'neekatari@protonmail.ch', N'fashion', NULL)
SET IDENTITY_INSERT [dbo].[tbl_work] ON 

INSERT [dbo].[tbl_work] ([wid], [con_id], [work_for], [type], [updated], [isActive], [created]) VALUES (26, 14, 1059, 1, CAST(0xF53E0B00 AS Date), N't', CAST(0xF53E0B00 AS Date))
INSERT [dbo].[tbl_work] ([wid], [con_id], [work_for], [type], [updated], [isActive], [created]) VALUES (27, 15, 1059, 1, CAST(0xF53E0B00 AS Date), N't', CAST(0xF53E0B00 AS Date))
INSERT [dbo].[tbl_work] ([wid], [con_id], [work_for], [type], [updated], [isActive], [created]) VALUES (28, 16, 7, 2, CAST(0xF53E0B00 AS Date), N't', CAST(0xF53E0B00 AS Date))
INSERT [dbo].[tbl_work] ([wid], [con_id], [work_for], [type], [updated], [isActive], [created]) VALUES (29, 17, 1059, 1, CAST(0xF53E0B00 AS Date), N't', CAST(0xF53E0B00 AS Date))
INSERT [dbo].[tbl_work] ([wid], [con_id], [work_for], [type], [updated], [isActive], [created]) VALUES (30, 18, 8, 2, CAST(0xF63E0B00 AS Date), N't', CAST(0xF63E0B00 AS Date))
SET IDENTITY_INSERT [dbo].[tbl_work] OFF
INSERT [dbo].[varification] ([cname], [emailaddress], [status], [activationcode]) VALUES (N'System.Web.UI.WebControls.TextBox', N'16mscit011@gmail.com', N'Verified', N'585146')
INSERT [dbo].[varification] ([cname], [emailaddress], [status], [activationcode]) VALUES (N'System.Web.UI.WebControls.TextBox', N'16mscit043@gmail.com', N'Verified', N'612421')
INSERT [dbo].[varification] ([cname], [emailaddress], [status], [activationcode]) VALUES (N'System.Web.UI.WebControls.TextBox', N'16mscit027@gmail.com', N'Verified', N'895528')
INSERT [dbo].[varification] ([cname], [emailaddress], [status], [activationcode]) VALUES (N'System.Web.UI.WebControls.TextBox', N'16mscit026@gmail.com', N'Verified', N'426331')
INSERT [dbo].[varification] ([cname], [emailaddress], [status], [activationcode]) VALUES (N'System.Web.UI.WebControls.TextBox', N'neekatari@protonmail.ch', N'Verified', N'195811')
INSERT [dbo].[varification] ([cname], [emailaddress], [status], [activationcode]) VALUES (N'System.Web.UI.WebControls.TextBox', N'16mscit023@gmail.com', N'Unverified', N'171273')
INSERT [dbo].[varification] ([cname], [emailaddress], [status], [activationcode]) VALUES (N'System.Web.UI.WebControls.TextBox', N'abha.damani@utu.ac.in', N'Unverified', N'907650')
INSERT [dbo].[varification] ([cname], [emailaddress], [status], [activationcode]) VALUES (N'System.Web.UI.WebControls.TextBox', N'DAMANI@a.com', N'Unverified', N'385846')
INSERT [dbo].[varification] ([cname], [emailaddress], [status], [activationcode]) VALUES (N'System.Web.UI.WebControls.TextBox', N'abha.damani@utu.ac.in', N'Unverified', N'226302')
ALTER TABLE [dbo].[tbl_adsbidder]  WITH CHECK ADD  CONSTRAINT [FK_tbl_adsbidder_tbl_advertisement] FOREIGN KEY([adid])
REFERENCES [dbo].[tbl_advertisement] ([aid])
GO
ALTER TABLE [dbo].[tbl_adsbidder] CHECK CONSTRAINT [FK_tbl_adsbidder_tbl_advertisement]
GO
ALTER TABLE [dbo].[tbl_advertisement]  WITH CHECK ADD  CONSTRAINT [FK_tbl_advertisement_tbl_customer] FOREIGN KEY([cid])
REFERENCES [dbo].[tbl_customer] ([cid])
GO
ALTER TABLE [dbo].[tbl_advertisement] CHECK CONSTRAINT [FK_tbl_advertisement_tbl_customer]
GO
ALTER TABLE [dbo].[tbl_contract]  WITH CHECK ADD  CONSTRAINT [FK_tbl_contract_tbl_advertisement] FOREIGN KEY([ad_id])
REFERENCES [dbo].[tbl_advertisement] ([aid])
GO
ALTER TABLE [dbo].[tbl_contract] CHECK CONSTRAINT [FK_tbl_contract_tbl_advertisement]
GO
ALTER TABLE [dbo].[tbl_contract]  WITH CHECK ADD  CONSTRAINT [FK_tbl_contract_tbl_customer] FOREIGN KEY([gen_by])
REFERENCES [dbo].[tbl_customer] ([cid])
GO
ALTER TABLE [dbo].[tbl_contract] CHECK CONSTRAINT [FK_tbl_contract_tbl_customer]
GO
ALTER TABLE [dbo].[Tbl_notification]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_notification_tbl_advertisement] FOREIGN KEY([ads_id])
REFERENCES [dbo].[tbl_advertisement] ([aid])
GO
ALTER TABLE [dbo].[Tbl_notification] CHECK CONSTRAINT [FK_Tbl_notification_tbl_advertisement]
GO
ALTER TABLE [dbo].[tbl_work]  WITH CHECK ADD  CONSTRAINT [FK_tbl_work_tbl_contract] FOREIGN KEY([con_id])
REFERENCES [dbo].[tbl_contract] ([ncid])
GO
ALTER TABLE [dbo].[tbl_work] CHECK CONSTRAINT [FK_tbl_work_tbl_contract]
GO
USE [master]
GO
ALTER DATABASE [promostream] SET  READ_WRITE 
GO
