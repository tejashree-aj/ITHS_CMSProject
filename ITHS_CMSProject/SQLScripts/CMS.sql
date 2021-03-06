USE [master]
GO
/****** Object:  Database [ITHS_CMSDatabase]    Script Date: 6/16/2021 12:13:45 PM ******/
CREATE DATABASE [ITHS_CMSDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CMSProjectDataBase', FILENAME = N'C:\Users\TejashreeJagdale\CMSProjectDataBase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CMSProjectDataBase_log', FILENAME = N'C:\Users\TejashreeJagdale\CMSProjectDataBase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ITHS_CMSDatabase] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ITHS_CMSDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ITHS_CMSDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ITHS_CMSDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ITHS_CMSDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ITHS_CMSDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ITHS_CMSDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [ITHS_CMSDatabase] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ITHS_CMSDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ITHS_CMSDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ITHS_CMSDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ITHS_CMSDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ITHS_CMSDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ITHS_CMSDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ITHS_CMSDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ITHS_CMSDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ITHS_CMSDatabase] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ITHS_CMSDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ITHS_CMSDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ITHS_CMSDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ITHS_CMSDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ITHS_CMSDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ITHS_CMSDatabase] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [ITHS_CMSDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ITHS_CMSDatabase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ITHS_CMSDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [ITHS_CMSDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ITHS_CMSDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ITHS_CMSDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ITHS_CMSDatabase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ITHS_CMSDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ITHS_CMSDatabase] SET QUERY_STORE = OFF
GO
USE [ITHS_CMSDatabase]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [ITHS_CMSDatabase]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 6/16/2021 12:13:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 6/16/2021 12:13:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 6/16/2021 12:13:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 6/16/2021 12:13:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 6/16/2021 12:13:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 6/16/2021 12:13:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 6/16/2021 12:13:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[FirstName] [nvarchar](60) NULL,
	[LastName] [nvarchar](max) NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 6/16/2021 12:13:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blogs]    Script Date: 6/16/2021 12:13:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blogs](
	[BlogId] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[ImageURL] [nvarchar](max) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Author] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Blogs] PRIMARY KEY CLUSTERED 
(
	[BlogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Footers]    Script Date: 6/16/2021 12:13:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Footers](
	[FooterId] [int] IDENTITY(1,1) NOT NULL,
	[HtmlText] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_Footers] PRIMARY KEY CLUSTERED 
(
	[FooterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Headers]    Script Date: 6/16/2021 12:13:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Headers](
	[HeaderId] [int] IDENTITY(1,1) NOT NULL,
	[HtmlText] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_Headers] PRIMARY KEY CLUSTERED 
(
	[HeaderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PageContents]    Script Date: 6/16/2021 12:13:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PageContents](
	[PageContentId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[PageId] [int] NOT NULL,
 CONSTRAINT [PK_PageContents] PRIMARY KEY CLUSTERED 
(
	[PageContentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pages]    Script Date: 6/16/2021 12:13:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pages](
	[PageId] [int] IDENTITY(1,1) NOT NULL,
	[PageName] [nvarchar](50) NOT NULL,
	[PageLink] [nvarchar](50) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Pages] PRIMARY KEY CLUSTERED 
(
	[PageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210609202908_InitialMigration', N'5.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210609203522_InitialMigration', N'5.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210612115153_DBUpdate', N'5.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210612120023_BlogTableUpdate', N'5.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210613201749_headerfooterstringlength', N'5.0.6')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'Admin', N'Admin', N'ADMIN', N'ca100f16-3d04-4692-9a81-2bb9bf764e9f')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8dd6aa2f-fc0f-4c5e-927c-652953000923', N'Admin')
GO
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'8dd6aa2f-fc0f-4c5e-927c-652953000923', NULL, NULL, N'admin@cms.se', N'ADMIN@CMS.SE', N'admin@cms.se', N'ADMIN@CMS.SE', 0, N'AQAAAAEAACcQAAAAEPBbTbmWue5CeZrzn5ZmwCYh5rIPfoKo3zcsofMOTkNy3BQMRDLYvtk66niIVJ8gog==', N'V7DRI6XTLYHGPS4PSOHTP3FHEKB5V4JF', N'4b44ea1e-9fbc-4dc1-9f57-442f1f9f7ef0', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Blogs] ON 

INSERT [dbo].[Blogs] ([BlogId], [Content], [ImageURL], [Title], [Author]) VALUES (1, N'<p style="box-sizing: border-box; margin-top: 15px; margin-bottom: 15px; font-family: ''Source Serif Pro'', sans-serif; font-size: 18px; line-height: 30px; background-color: #ffffff;"><span style="box-sizing: border-box; vertical-align: inherit;"><span style="box-sizing: border-box; vertical-align: inherit;">The labor of those things, I judge: they deserted the general''s house, say, on behalf of the courts to the dispute, however, honey, id hendrerit to be faithful.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">The praise of men or bad, since the developer albucius dough.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">An empty soft dangers or not.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">Those who merely an animal book, are just two of them.</span></span></p>
<p style="box-sizing: border-box; margin-top: 15px; margin-bottom: 15px; font-family: ''Source Serif Pro'', sans-serif; font-size: 18px; line-height: 30px; background-color: #ffffff;"><span style="box-sizing: border-box; vertical-align: inherit;"><span style="box-sizing: border-box; vertical-align: inherit;">However, the pursuit of For, as was of teaching, so that his diam nibh suscipit, ipsum her, that I have lied, of Menander.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">Consulate perceived and the fact that since the unarmed pitches.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">We marched into practice, it is accurate to say no use.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">Vix no is swept out by the majesty of the whole, and that football is accustomed to them.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">Receives when first encountered.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">We would like Japan to get the two, neither of the Performance signiferumque.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">No right of perpetual persists boasts abundant right to ask you these very void.</span></span></p>
<p style="box-sizing: border-box; margin-top: 15px; margin-bottom: 15px; font-family: ''Source Serif Pro'', sans-serif; font-size: 18px; line-height: 30px; background-color: #ffffff;"><span style="box-sizing: border-box; vertical-align: inherit;"><span style="box-sizing: border-box; vertical-align: inherit;">She is instructed definiebas.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">But the glorious cause slips.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">Those who do not empty facilisis, to do either of Menander the midpoint of.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">This, I wish that afterwards he can be the first, the pleasures of the sea no any financing, he said, ought to be in the use of their stubbornness.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">Theophrastus an abandoned mine.</span></span></p>
<p style="box-sizing: border-box; margin-top: 15px; margin-bottom: 15px; font-family: ''Source Serif Pro'', sans-serif; font-size: 18px; line-height: 30px; background-color: #ffffff;"><span style="box-sizing: border-box; vertical-align: inherit;"><span style="box-sizing: border-box; vertical-align: inherit;">Epicure no laughing approve, Performance dress is pulled out, an attack thrill of my players.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">To open the object antioxidants it to them from coming.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">Football is easy to debate.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">She is the only force deductible, sea in error learning assueverit, these glories will be repudiated.&nbsp;</span></span></p>
<p style="box-sizing: border-box; margin-top: 15px; margin-bottom: 15px; font-family: ''Source Serif Pro'', sans-serif; font-size: 18px; line-height: 30px; background-color: #ffffff;"><span style="box-sizing: border-box; vertical-align: inherit;">Football we are good citizens;</span></p>
<ul style="box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; padding-left: 40px; font-family: ''Source Serif Pro'', sans-serif; font-size: 18px; line-height: 30px; overflow: hidden; background-color: #ffffff;">
<li style="box-sizing: border-box; margin-top: 10px; margin-bottom: 10px; padding-left: 10px;"><span style="box-sizing: border-box; vertical-align: inherit;">No call requests are neglegentur, she Sea entertain, but even writers call.&nbsp;</span></li>
<li style="box-sizing: border-box; margin-top: 10px; margin-bottom: 10px; padding-left: 10px;"><span style="box-sizing: border-box; vertical-align: inherit;"><span style="box-sizing: border-box; vertical-align: inherit;">Fearing that honey no.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">An sea of ​​truth no eum, ne sea the pain come tumbling down.&nbsp;</span></span></li>
<li style="box-sizing: border-box; margin-top: 10px; margin-bottom: 10px; padding-left: 10px;"><span style="box-sizing: border-box; vertical-align: inherit;">In like manner, in its entirety or not to obtain it.</span></li>
</ul>
<p style="box-sizing: border-box; margin-top: 15px; margin-bottom: 15px; font-family: ''Source Serif Pro'', sans-serif; font-size: 18px; line-height: 30px; background-color: #ffffff;"><span style="box-sizing: border-box; vertical-align: inherit;"><span style="box-sizing: border-box; vertical-align: inherit;">Do not you want to at any time over the years, say nothing to them in that to obtain, over the years is hardly normal for him.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">The names of the enemy, and healed them, and in Greek we read pri cu.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">Indeed, it barely animal.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">Which, not to the rest, to be abandoned, so that the force moves in its entirety, or because of that a lot of iron.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">Two changes do with taste, but these boasts more measured.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">In fact, and the others, and they marched on to arrest, it is fierce, the teacher not to the needs of the honey.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">Oh no mistake that you want.</span></span></p>
<p style="box-sizing: border-box; margin-top: 15px; margin-bottom: 15px; font-family: ''Source Serif Pro'', sans-serif; font-size: 18px; line-height: 30px; background-color: #ffffff;"><span style="box-sizing: border-box; vertical-align: inherit;"><span style="box-sizing: border-box; vertical-align: inherit;">This, nor any kind of layer, say nothing of the stories about the want to go through.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">Homer sounds unusual, but two, should strive argument or philosophy.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">Tation of the country, accurate, in them, no to be unable either of one''s own stories, not to arrest her and on behalf of the Greek.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">However, since the common law, but it luptatum open.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">Digest subscribe to them, force them to work in sadi.</span></span></p>
<p style="box-sizing: border-box; margin-top: 15px; margin-bottom: 15px; font-family: ''Source Serif Pro'', sans-serif; font-size: 18px; line-height: 30px; background-color: #ffffff;"><span style="box-sizing: border-box; vertical-align: inherit;"><span style="box-sizing: border-box; vertical-align: inherit;">This salt is everywhere.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">To what it is obliquely epicuri.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">Homework is annoying to invest because when in the definition.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">The argument would be reported to the sea, optimistic it can pursue pleasure.</span></span></p>
<p style="box-sizing: border-box; margin-top: 15px; margin-bottom: 15px; font-family: ''Source Serif Pro'', sans-serif; font-size: 18px; line-height: 30px; background-color: #ffffff;">&nbsp;</p>
<p style="box-sizing: border-box; margin-top: 15px; margin-bottom: 15px; font-family: ''Source Serif Pro'', sans-serif; font-size: 18px; line-height: 30px; background-color: #ffffff;"><span style="box-sizing: border-box; vertical-align: inherit;"><span style="box-sizing: border-box; vertical-align: inherit;">Because of this, I say to diam my meetings.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">Cu is only for the feel, in short, of Antiope the force from one civility.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">They would see no correctly.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">Undertakes force flies to honey to the voices of the day.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">To be my doming no one, when he, seasoned with salt homage to Thee.</span></span></p>
<p style="box-sizing: border-box; margin-top: 15px; margin-bottom: 15px; font-family: ''Source Serif Pro'', sans-serif; font-size: 18px; line-height: 30px; background-color: #ffffff;"><span style="box-sizing: border-box; vertical-align: inherit;"><span style="box-sizing: border-box; vertical-align: inherit;">When this obstacle is to be desired which is instructed unto him, mazim in Latin, to what it is.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">When this it is only to learn how to interprete it, the force may not in its entirety in both directions, no two the same, the teacher were brought into relation.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">An discussion of persistence sea Homer have a corrupt practice it.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">Nullam at any time they want you, changes his mind was assigned them, they will not.</span></span></p>
<blockquote style="box-sizing: border-box; margin: 40px 0px 30px; padding: 30px 0px 10px; border-left: 5px none #e2e2e2; font-size: 24px; line-height: 36px; border-top: 2px solid #000000; border-right-style: none; border-bottom-style: none; font-family: ''Source Serif Pro'', sans-serif; font-weight: bold; background-color: #ffffff;"><span style="box-sizing: border-box; vertical-align: inherit;"><span style="box-sizing: border-box; vertical-align: inherit;">This salt is everywhere.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">To what it is obliquely epicuri.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">Homework is annoying to invest because when in the definition.</span></span></blockquote>
<p style="box-sizing: border-box; margin-top: 15px; margin-bottom: 15px; font-family: ''Source Serif Pro'', sans-serif; font-size: 18px; line-height: 30px; background-color: #ffffff;"><span style="box-sizing: border-box; vertical-align: inherit;"><span style="box-sizing: border-box; vertical-align: inherit;">Albucius curling but at the first reading, in order, the books of an appetite for delicatissimi the administration of justice, to have some present mnesarchum have not the.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">It has no fault.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">At its assueverit honey.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">You must use a little time, so that concept.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">Was greeted by the honey, peanut, there is no and all the furniture of the right of you.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">Mucins have occurred philosophy el unico has at.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">The passionate argument but must in the world.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">Of honor, has come together: for football, has been set aside to benefit the honey and the honey, to prevent the errors of the first deserted the general''s.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">The teacher ever since rejected, but moves are often two, written in open country or football.</span></span></p>
<p style="box-sizing: border-box; margin-top: 15px; margin-bottom: 15px; font-family: ''Source Serif Pro'', sans-serif; font-size: 18px; line-height: 30px; background-color: #ffffff;">&nbsp;</p>
<p style="box-sizing: border-box; margin-top: 15px; margin-bottom: 15px; font-family: ''Source Serif Pro'', sans-serif; font-size: 18px; line-height: 30px; background-color: #ffffff;"><span style="box-sizing: border-box; vertical-align: inherit;"><span style="box-sizing: border-box; vertical-align: inherit;">As has often meets you for doing this takes.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">Football is easy to regular citizens.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">With a new CD refinement.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">The first signiferumque him, He draweth also the football, I am afraid, neither shall any congue.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">I interpret it soothes the debate, which took concludaturque an nibh.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">For to be deceived consequat a difference there is with difficulty, the use of the number of changes to accommodate the football, it takes away the charm of no result from them.</span></span></p>', N'\images\BlogImages\japan-blog.jpeg', N'JAPAN HOUSE OPENS IN MOUNTAINSIDE TO FOSTER PEAK CREATIVITY.', N'CASSETTES TORPHY')
INSERT [dbo].[Blogs] ([BlogId], [Content], [ImageURL], [Title], [Author]) VALUES (3, N'<p style="box-sizing: border-box; margin-top: 15px; margin-bottom: 15px; font-family: ''Source Serif Pro'', sans-serif; font-size: 18px; line-height: 30px; background-color: #ffffff;"><span style="box-sizing: border-box; vertical-align: inherit;"><span style="box-sizing: border-box; vertical-align: inherit;">The labor of those things, I judge: they deserted the general''s house, say, on behalf of the courts to the dispute, however, honey, id hendrerit to be faithful.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">The praise of men or bad, since the developer albucius dough.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">An empty soft dangers or not.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">Those who merely an animal book, are just two of them.</span></span></p>
<p style="box-sizing: border-box; margin-top: 15px; margin-bottom: 15px; font-family: ''Source Serif Pro'', sans-serif; font-size: 18px; line-height: 30px; background-color: #ffffff;"><span style="box-sizing: border-box; vertical-align: inherit;"><span style="box-sizing: border-box; vertical-align: inherit;">However, the pursuit of For, as was of teaching, so that his diam nibh suscipit, ipsum her, that I have lied, of Menander.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">Consulate perceived and the fact that since the unarmed pitches.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">We marched into practice, it is accurate to say no use.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">Vix no is swept out by the majesty of the whole, and that football is accustomed to them.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">Receives when first encountered.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">We would like Japan to get the two, neither of the Performance signiferumque.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">No right of perpetual persists boasts abundant right to ask you these very void.</span></span></p>
<p style="box-sizing: border-box; margin-top: 15px; margin-bottom: 15px; font-family: ''Source Serif Pro'', sans-serif; font-size: 18px; line-height: 30px; background-color: #ffffff;"><span style="box-sizing: border-box; vertical-align: inherit;"><span style="box-sizing: border-box; vertical-align: inherit;">She is instructed definiebas.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">But the glorious cause slips.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">Those who do not empty facilisis, to do either of Menander the midpoint of.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">This, I wish that afterwards he can be the first, the pleasures of the sea no any financing, he said, ought to be in the use of their stubbornness.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">Theophrastus an abandoned mine.</span></span></p>
<p style="box-sizing: border-box; margin-top: 15px; margin-bottom: 15px; font-family: ''Source Serif Pro'', sans-serif; font-size: 18px; line-height: 30px; background-color: #ffffff;"><span style="box-sizing: border-box; vertical-align: inherit;"><span style="box-sizing: border-box; vertical-align: inherit;">Epicure no laughing approve, Performance dress is pulled out, an attack thrill of my players.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">To open the object antioxidants it to them from coming.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">Football is easy to debate.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">She is the only force deductible, sea in error learning assueverit, these glories will be repudiated.&nbsp;</span></span></p>
<p style="box-sizing: border-box; margin-top: 15px; margin-bottom: 15px; font-family: ''Source Serif Pro'', sans-serif; font-size: 18px; line-height: 30px; background-color: #ffffff;"><span style="box-sizing: border-box; vertical-align: inherit;">Football we are good citizens;</span></p>
<ul style="box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; padding-left: 40px; font-family: ''Source Serif Pro'', sans-serif; font-size: 18px; line-height: 30px; overflow: hidden; background-color: #ffffff;">
<li style="box-sizing: border-box; margin-top: 10px; margin-bottom: 10px; padding-left: 10px;"><span style="box-sizing: border-box; vertical-align: inherit;">No call requests are neglegentur, she Sea entertain, but even writers call.&nbsp;</span></li>
<li style="box-sizing: border-box; margin-top: 10px; margin-bottom: 10px; padding-left: 10px;"><span style="box-sizing: border-box; vertical-align: inherit;"><span style="box-sizing: border-box; vertical-align: inherit;">Fearing that honey no.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">An sea of ​​truth no eum, ne sea the pain come tumbling down.&nbsp;</span></span></li>
<li style="box-sizing: border-box; margin-top: 10px; margin-bottom: 10px; padding-left: 10px;"><span style="box-sizing: border-box; vertical-align: inherit;">In like manner, in its entirety or not to obtain it.</span></li>
</ul>
<p style="box-sizing: border-box; margin-top: 15px; margin-bottom: 15px; font-family: ''Source Serif Pro'', sans-serif; font-size: 18px; line-height: 30px; background-color: #ffffff;"><span style="box-sizing: border-box; vertical-align: inherit;"><span style="box-sizing: border-box; vertical-align: inherit;">Do not you want to at any time over the years, say nothing to them in that to obtain, over the years is hardly normal for him.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">The names of the enemy, and healed them, and in Greek we read pri cu.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">Indeed, it barely animal.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">Which, not to the rest, to be abandoned, so that the force moves in its entirety, or because of that a lot of iron.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">Two changes do with taste, but these boasts more measured.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">In fact, and the others, and they marched on to arrest, it is fierce, the teacher not to the needs of the honey.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">Oh no mistake that you want.</span></span></p>
<p style="box-sizing: border-box; margin-top: 15px; margin-bottom: 15px; font-family: ''Source Serif Pro'', sans-serif; font-size: 18px; line-height: 30px; background-color: #ffffff;"><span style="box-sizing: border-box; vertical-align: inherit;"><span style="box-sizing: border-box; vertical-align: inherit;">This, nor any kind of layer, say nothing of the stories about the want to go through.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">Homer sounds unusual, but two, should strive argument or philosophy.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">Tation of the country, accurate, in them, no to be unable either of one''s own stories, not to arrest her and on behalf of the Greek.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">However, since the common law, but it luptatum open.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">Digest subscribe to them, force them to work in sadi.</span></span></p>
<p style="box-sizing: border-box; margin-top: 15px; margin-bottom: 15px; font-family: ''Source Serif Pro'', sans-serif; font-size: 18px; line-height: 30px; background-color: #ffffff;"><span style="box-sizing: border-box; vertical-align: inherit;"><span style="box-sizing: border-box; vertical-align: inherit;">This salt is everywhere.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">To what it is obliquely epicuri.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">Homework is annoying to invest because when in the definition.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">The argument would be reported to the sea, optimistic it can pursue pleasure.</span></span></p>', N'\images\BlogImages\5b48e52333b04e520247608a_image-14-p-1600.jpeg', N'HELMUT LANG CELEBRATES TAXI DRIVERS WORLDWIDE IN LATEST CAMPAIGN', N'ALESSANDRA ORTIZ')
INSERT [dbo].[Blogs] ([BlogId], [Content], [ImageURL], [Title], [Author]) VALUES (4, N'<p style="box-sizing: border-box; margin-top: 15px; margin-bottom: 15px; font-family: ''Source Serif Pro'', sans-serif; font-size: 18px; line-height: 30px; background-color: #ffffff;"><span style="box-sizing: border-box; vertical-align: inherit;"><span style="box-sizing: border-box; vertical-align: inherit;">The labor of those things, I judge: they deserted the general''s house, say, on behalf of the courts to the dispute, however, honey, id hendrerit to be faithful.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">The praise of men or bad, since the developer albucius dough.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">An empty soft dangers or not.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">Those who merely an animal book, are just two of them.</span></span></p>
<p style="box-sizing: border-box; margin-top: 15px; margin-bottom: 15px; font-family: ''Source Serif Pro'', sans-serif; font-size: 18px; line-height: 30px; background-color: #ffffff;"><span style="box-sizing: border-box; vertical-align: inherit;"><span style="box-sizing: border-box; vertical-align: inherit;">However, the pursuit of For, as was of teaching, so that his diam nibh suscipit, ipsum her, that I have lied, of Menander.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">Consulate perceived and the fact that since the unarmed pitches.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">We marched into practice, it is accurate to say no use.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">Vix no is swept out by the majesty of the whole, and that football is accustomed to them.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">Receives when first encountered.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">We would like Japan to get the two, neither of the Performance signiferumque.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">No right of perpetual persists boasts abundant right to ask you these very void.</span></span></p>
<p style="box-sizing: border-box; margin-top: 15px; margin-bottom: 15px; font-family: ''Source Serif Pro'', sans-serif; font-size: 18px; line-height: 30px; background-color: #ffffff;"><span style="box-sizing: border-box; vertical-align: inherit;"><span style="box-sizing: border-box; vertical-align: inherit;">She is instructed definiebas.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">But the glorious cause slips.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">Those who do not empty facilisis, to do either of Menander the midpoint of.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">This, I wish that afterwards he can be the first, the pleasures of the sea no any financing, he said, ought to be in the use of their stubbornness.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">Theophrastus an abandoned mine.</span></span></p>
<p style="box-sizing: border-box; margin-top: 15px; margin-bottom: 15px; font-family: ''Source Serif Pro'', sans-serif; font-size: 18px; line-height: 30px; background-color: #ffffff;"><span style="box-sizing: border-box; vertical-align: inherit;"><span style="box-sizing: border-box; vertical-align: inherit;">Epicure no laughing approve, Performance dress is pulled out, an attack thrill of my players.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">To open the object antioxidants it to them from coming.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">Football is easy to debate.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">She is the only force deductible, sea in error learning assueverit, these glories will be repudiated.&nbsp;</span></span></p>
<p style="box-sizing: border-box; margin-top: 15px; margin-bottom: 15px; font-family: ''Source Serif Pro'', sans-serif; font-size: 18px; line-height: 30px; background-color: #ffffff;"><span style="box-sizing: border-box; vertical-align: inherit;">Football we are good citizens;</span></p>
<ul style="box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; padding-left: 40px; font-family: ''Source Serif Pro'', sans-serif; font-size: 18px; line-height: 30px; overflow: hidden; background-color: #ffffff;">
<li style="box-sizing: border-box; margin-top: 10px; margin-bottom: 10px; padding-left: 10px;"><span style="box-sizing: border-box; vertical-align: inherit;">No call requests are neglegentur, she Sea entertain, but even writers call.&nbsp;</span></li>
<li style="box-sizing: border-box; margin-top: 10px; margin-bottom: 10px; padding-left: 10px;"><span style="box-sizing: border-box; vertical-align: inherit;"><span style="box-sizing: border-box; vertical-align: inherit;">Fearing that honey no.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">An sea of ​​truth no eum, ne sea the pain come tumbling down.&nbsp;</span></span></li>
<li style="box-sizing: border-box; margin-top: 10px; margin-bottom: 10px; padding-left: 10px;"><span style="box-sizing: border-box; vertical-align: inherit;">In like manner, in its entirety or not to obtain it.</span></li>
</ul>
<p style="box-sizing: border-box; margin-top: 15px; margin-bottom: 15px; font-family: ''Source Serif Pro'', sans-serif; font-size: 18px; line-height: 30px; background-color: #ffffff;"><span style="box-sizing: border-box; vertical-align: inherit;"><span style="box-sizing: border-box; vertical-align: inherit;">Do not you want to at any time over the years, say nothing to them in that to obtain, over the years is hardly normal for him.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">The names of the enemy, and healed them, and in Greek we read pri cu.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">Indeed, it barely animal.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">Which, not to the rest, to be abandoned, so that the force moves in its entirety, or because of that a lot of iron.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">Two changes do with taste, but these boasts more measured.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">In fact, and the others, and they marched on to arrest, it is fierce, the teacher not to the needs of the honey.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">Oh no mistake that you want.</span></span></p>
<p style="box-sizing: border-box; margin-top: 15px; margin-bottom: 15px; font-family: ''Source Serif Pro'', sans-serif; font-size: 18px; line-height: 30px; background-color: #ffffff;"><span style="box-sizing: border-box; vertical-align: inherit;"><span style="box-sizing: border-box; vertical-align: inherit;">This, nor any kind of layer, say nothing of the stories about the want to go through.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">Homer sounds unusual, but two, should strive argument or philosophy.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">Tation of the country, accurate, in them, no to be unable either of one''s own stories, not to arrest her and on behalf of the Greek.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">However, since the common law, but it luptatum open.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">Digest subscribe to them, force them to work in sadi.</span></span></p>
<p style="box-sizing: border-box; margin-top: 15px; margin-bottom: 15px; font-family: ''Source Serif Pro'', sans-serif; font-size: 18px; line-height: 30px; background-color: #ffffff;"><span style="box-sizing: border-box; vertical-align: inherit;"><span style="box-sizing: border-box; vertical-align: inherit;">This salt is everywhere.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">To what it is obliquely epicuri.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">Homework is annoying to invest because when in the definition.&nbsp;</span><span style="box-sizing: border-box; vertical-align: inherit;">The argument would be reported to the sea, optimistic it can pursue pleasure.</span></span></p>', N'\images\BlogImages\blog2.jpeg', N'BOWLCUT LAUNCH A NEW SUMMER COLLECTION THAT PAYS HOMAGE TO “UK LEGENDS”', N' ROSANNA ONDRICKA')
INSERT [dbo].[Blogs] ([BlogId], [Content], [ImageURL], [Title], [Author]) VALUES (5, N'<p style="box-sizing: border-box; margin-top: 15px; margin-bottom: 15px; font-family: ''Source Serif Pro'', sans-serif; font-size: 18px; line-height: 30px; background-color: #ffffff;">Ea iudico labore deserunt mei, pro ad dicant forensibus dissentiunt, mel id hendrerit incorrupte. Viris laudem malorum an eum, cu quo elit albucius corrumpit. Inani mollis pericula an nec. Modo brute liber ea qui, aeque cetero duo ei.</p>
<p style="box-sizing: border-box; margin-top: 15px; margin-bottom: 15px; font-family: ''Source Serif Pro'', sans-serif; font-size: 18px; line-height: 30px; background-color: #ffffff;">Autem docendi persecuti nam ut, ne his diam nibh suscipit, eam augue mentitum menandri ea. Consulatu percipitur et nam, cum ex inermis vocibus. Nobis deterruisset usu in, dicam oporteat apeirian no usu. Vix no evertitur maiestatis, tota idque solet eu eos. Offendit suscipit pri cu. Modo volumus eleifend ut duo, ex euismod signiferumque nec. No ius perpetua pertinacia, ius gloriatur honestatis quaerendum ad, te has ipsum inani.</p>
<p style="box-sizing: border-box; margin-top: 15px; margin-bottom: 15px; font-family: ''Source Serif Pro'', sans-serif; font-size: 18px; line-height: 30px; background-color: #ffffff;">Ea sit eruditi definiebas. Causae labitur maiestatis sed in. Qui inani facilisis ne, ut vel menandri mediocritatem. Id utinam postea possit pri, sea no aliquam imperdiet voluptatibus, in usu diceret oportere pertinacia. Deserunt theophrastus mea an.</p>
<p style="box-sizing: border-box; margin-top: 15px; margin-bottom: 15px; font-family: ''Source Serif Pro'', sans-serif; font-size: 18px; line-height: 30px; background-color: #ffffff;">Probo ridens epicurei per no, euismod ornatus detraxit mea ex, an nisl impetus suavitate mei. Ut aperiri recusabo facilisis eam, ei his veniam noluisse. Eu facilis disputando eum. Ea vis solum eleifend, sea in errem doctus assueverit, has te gloriatur repudiandae.&nbsp;</p>
<p style="box-sizing: border-box; margin-top: 15px; margin-bottom: 15px; font-family: ''Source Serif Pro'', sans-serif; font-size: 18px; line-height: 30px; background-color: #ffffff;">Eu mei nobis bonorum civibus:</p>
<ul style="box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; padding-left: 40px; font-family: ''Source Serif Pro'', sans-serif; font-size: 18px; line-height: 30px; overflow: hidden; background-color: #ffffff;">
<li style="box-sizing: border-box; margin-top: 10px; margin-bottom: 10px; padding-left: 10px;">No vocent postulant neglegentur mei, ea sea tantas viderer, scriptorem appellantur vel at.&nbsp;</li>
<li style="box-sizing: border-box; margin-top: 10px; margin-bottom: 10px; padding-left: 10px;">Illum reformidans mel no. An sea veri nusquam gubergren, ne sea dolor labitur.&nbsp;</li>
<li style="box-sizing: border-box; margin-top: 10px; margin-bottom: 10px; padding-left: 10px;">Aeque integre adipisci nec ne.</li>
</ul>
<p style="box-sizing: border-box; margin-top: 15px; margin-bottom: 15px; font-family: ''Source Serif Pro'', sans-serif; font-size: 18px; line-height: 30px; background-color: #ffffff;">Elitr aliquando vis ne, eum ea omittam adipisci, elitr tation vix ei. Homero inimicus et eos, graece legimus pri cu. Vix ei animal equidem. Quo ne ceteros deseruisse, ut vim movet integre, vel ea amet ferri. Duo agam mutat saperet cu, his at gloriatur moderatius. Nam et alii deterruisset comprehensam, mel ne doctus pertinax necessitatibus. Ipsum error utinam vis no.</p>
<p style="box-sizing: border-box; margin-top: 15px; margin-bottom: 15px; font-family: ''Source Serif Pro'', sans-serif; font-size: 18px; line-height: 30px; background-color: #ffffff;">Id nec ullum accumsan, omittam fabellas vis in. Homero vocibus insolens duo at, appetere argumentum philosophia vel ne. In eos tation regione apeirian, no nec possim propriae fabellas, ne graeci comprehensam pro. Sed cu legimus commune, aperiam luptatum eam at. Scaevola scribentur ei his, gubergren elaboraret vim ea.</p>
<p style="box-sizing: border-box; margin-top: 15px; margin-bottom: 15px; font-family: ''Source Serif Pro'', sans-serif; font-size: 18px; line-height: 30px; background-color: #ffffff;">Id sale ubique sit. Id eam oblique epicuri. Sit duis placerat molestiae ad, nam ut minim erant definitionem. Argumentum referrentur sea ut, eu eam falli persequeris voluptatibus.</p>', N'\images\BlogImages\solotravellers.jpeg', N'THOUSANDS OF PREVIOUSLY UNSEEN PHOTOGRAPHS BY ANDY WARHOL WILL BE MADE PUBLIC THIS AUTUMN', N' ANNIE LUEILWITZ')
SET IDENTITY_INSERT [dbo].[Blogs] OFF
GO
SET IDENTITY_INSERT [dbo].[Footers] ON 

INSERT [dbo].[Footers] ([FooterId], [HtmlText]) VALUES (1, N'© 2021 - ITHS_CMSProject')
SET IDENTITY_INSERT [dbo].[Footers] OFF
GO
SET IDENTITY_INSERT [dbo].[Headers] ON 

INSERT [dbo].[Headers] ([HeaderId], [HtmlText]) VALUES (1, N'ITHS Travel Blog')
SET IDENTITY_INSERT [dbo].[Headers] OFF
GO
SET IDENTITY_INSERT [dbo].[PageContents] ON 

INSERT [dbo].[PageContents] ([PageContentId], [Title], [Content], [PageId]) VALUES (1, N'GDPR & Privacy Policy', N'<div class="text-center mt-5 pt-hresp-1 pb-hresp-2 " style="box-sizing: border-box; padding-top: 1rem; padding-bottom: 2rem; color: #5a5a5a; font-family: hkgrotesk, -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, ''Helvetica Neue'', Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol''; font-size: 15px; background-color: #ffffff; margin-top: 3rem !important; text-align: center !important;">
<h2 class="mb-2" style="box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem !important; font-weight: 500; line-height: 1.2; font-size: 2rem;"><span id="gdpr-ccpa" style="box-sizing: border-box;">Privacy and Cookie Policy Generator for the GDPR, ePrivacy and CCPA</span></h2>
<p class="serif w-75 text-lg mx-auto" style="box-sizing: border-box; width: 854.994px; font-family: tisa, -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, ''Helvetica Neue'', Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol''; font-size: 1.2rem !important; margin: 0px auto !important 1rem auto !important;">We help you meet complex legislation-specific requirements at the click of a button.</p>
</div>
<div class="row justify-content-between mb-5" style="box-sizing: border-box; display: flex; flex-wrap: wrap; margin-right: -15px; margin-left: -15px; color: #5a5a5a; font-family: hkgrotesk, -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, ''Helvetica Neue'', Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol''; font-size: 15px; background-color: #ffffff; -webkit-box-pack: justify !important; justify-content: space-between !important; margin-bottom: 3rem !important;">
<div class="col-md-6" style="box-sizing: border-box; position: relative; width: 584.989px; padding-right: 15px; padding-left: 15px; -webkit-box-flex: 0; flex: 0 0 50%; max-width: 50%;">
<article class="mx-auto" style="box-sizing: border-box; margin-right: auto !important; margin-left: auto !important;">
<figure class="mx-auto bg-light-gray circle-192 my-4" style="box-sizing: border-box; display: block; border-radius: 50%; text-align: center; width: 192px; height: 192px; line-height: 192px; margin-top: 1.5rem !important; margin-bottom: 1.5rem !important; background-color: #f1f1f1 !important;"><img class="loaded" style="box-sizing: border-box; vertical-align: middle; border-style: none;" src="https://www.iubenda.com/assets/site/red/products/which_preferences-678770b5d078dbd82b282db10be4743f.svg" alt="Which preferences icon" width="150" height="150" data-lazy-src="/assets/site/red/products/which_preferences-678770b5d078dbd82b282db10be4743f.svg" data-was-processed="true" /></figure>
<h3 class="text-lg font-weight-semibold mb-4 text-center" style="box-sizing: border-box; margin-top: 0px; line-height: 1.2; margin-bottom: 1.5rem !important; font-size: 1.2rem !important; text-align: center !important;">For the GDPR and ePrivacy (EU Cookie Law)</h3>
<div class="my-4 text-center mb-5" style="box-sizing: border-box; margin-top: 1.5rem !important; margin-bottom: 3rem !important; text-align: center !important;"><a class="btn btn-sm btn-light" style="box-sizing: border-box; color: #ffffff; text-decoration-line: none; background-color: #5a5a5a; display: inline-block; vertical-align: middle; user-select: none; border: 1px solid #5a5a5a; padding: 0.25rem 1rem; font-size: 0.875rem; line-height: 1.5; border-radius: 2rem; transition: color 0.15s ease-in-out 0s, background-color 0.15s ease-in-out 0s, border-color 0.15s ease-in-out 0s, box-shadow 0.15s ease-in-out 0s, -webkit-box-shadow 0.15s ease-in-out 0s; cursor: pointer;" href="https://www.iubenda.com/en/gdpr">More on 360&deg; GDPR Compliance</a></div>
<p class="text-muted serif mt-4 mb-4" style="box-sizing: border-box; font-family: tisa, -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, ''Helvetica Neue'', Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol''; margin-top: 1.5rem !important; margin-bottom: 1.5rem !important; color: #6c757d !important;">The GDPR can apply to you whether or not you reside in the EU or have EU users and consequences of none compliance can be quite serious. Our generator takes the guesswork out compliance and allows you to create GDPR and ePrivacy compliant Privacy and Cookie Policies in minutes!</p>
<ul class="list-unstyled list-item-mb-3 serif text-muted" style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; padding-left: 0px; list-style: none; font-family: tisa, -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, ''Helvetica Neue'', Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol''; color: #6c757d !important;">
<li class="d-flex" style="box-sizing: border-box; display: flex !important; margin-bottom: 1rem !important;"><img class="flex-shrink mr-3 loaded" style="box-sizing: border-box; vertical-align: middle; border-style: none; margin-right: 1rem !important; flex-shrink: 0;" src="https://www.iubenda.com/assets/site/red/general/pages/vat/check-ccccae9f0ad823bb8a63fbcb9104e22c.svg" alt="Check icon" width="32" height="32" data-lazy-src="/assets/site/red/general/pages/vat/check-ccccae9f0ad823bb8a63fbcb9104e22c.svg" data-was-processed="true" />
<div style="box-sizing: border-box;">Displaying GDPR related language, disclosures, and instructions as legally required</div>
</li>
<li class="d-flex" style="box-sizing: border-box; display: flex !important; margin-bottom: 1rem !important;"><img class="flex-shrink mr-3 loaded" style="box-sizing: border-box; vertical-align: middle; border-style: none; margin-right: 1rem !important; flex-shrink: 0;" src="https://www.iubenda.com/assets/site/red/general/pages/vat/check-ccccae9f0ad823bb8a63fbcb9104e22c.svg" alt="Check icon" width="32" height="32" data-lazy-src="/assets/site/red/general/pages/vat/check-ccccae9f0ad823bb8a63fbcb9104e22c.svg" data-was-processed="true" />
<div style="box-sizing: border-box;">Readily accessible from every page of your site (as legally required)</div>
</li>
<li class="d-flex" style="box-sizing: border-box; display: flex !important; margin-bottom: 0px !important;"><img class="flex-shrink mr-3 loaded" style="box-sizing: border-box; vertical-align: middle; border-style: none; margin-right: 1rem !important; flex-shrink: 0;" src="https://www.iubenda.com/assets/site/red/general/pages/vat/check-ccccae9f0ad823bb8a63fbcb9104e22c.svg" alt="Check icon" width="32" height="32" data-lazy-src="/assets/site/red/general/pages/vat/check-ccccae9f0ad823bb8a63fbcb9104e22c.svg" data-was-processed="true" />
<div style="box-sizing: border-box;">Seamless integration with the Cookie Solution for IAB integrated Cookie consent management once activated within the generator + more</div>
</li>
</ul>
</article>
</div>
<div class="col-md-6" style="box-sizing: border-box; position: relative; width: 584.989px; padding-right: 15px; padding-left: 15px; -webkit-box-flex: 0; flex: 0 0 50%; max-width: 50%;">
<article class="mx-auto" style="box-sizing: border-box; margin-right: auto !important; margin-left: auto !important;">
<figure class="mx-auto bg-light-gray circle-192 my-4" style="box-sizing: border-box; display: block; border-radius: 50%; text-align: center; width: 192px; height: 192px; line-height: 192px; margin-top: 1.5rem !important; margin-bottom: 1.5rem !important; background-color: #f1f1f1 !important;"><img class="loaded" style="box-sizing: border-box; vertical-align: middle; border-style: none;" src="https://www.iubenda.com/assets/site/red/products/dashboard_preferences-93075310f52cd192d60bd7b2084e0b23.svg" alt="Dashboard preferences icon" width="150" height="150" data-lazy-src="/assets/site/red/products/dashboard_preferences-93075310f52cd192d60bd7b2084e0b23.svg" data-was-processed="true" /></figure>
<h3 class="text-lg font-weight-semibold mb-4 text-center" style="box-sizing: border-box; margin-top: 0px; line-height: 1.2; margin-bottom: 1.5rem !important; font-size: 1.2rem !important; text-align: center !important;">For the CCPA</h3>
<div class="my-4 text-center mb-5" style="box-sizing: border-box; margin-top: 1.5rem !important; margin-bottom: 3rem !important; text-align: center !important;"><a class="btn btn-sm btn-light" style="box-sizing: border-box; color: #ffffff; text-decoration-line: none; background-color: #5a5a5a; display: inline-block; vertical-align: middle; user-select: none; border: 1px solid #5a5a5a; padding: 0.25rem 1rem; font-size: 0.875rem; line-height: 1.5; border-radius: 2rem; transition: color 0.15s ease-in-out 0s, background-color 0.15s ease-in-out 0s, border-color 0.15s ease-in-out 0s, box-shadow 0.15s ease-in-out 0s, -webkit-box-shadow 0.15s ease-in-out 0s; cursor: pointer;" href="https://www.iubenda.com/en/ccpa">More on 360&deg; CCPA Compliance</a></div>
<p class="text-muted serif mt-4 mb-4" style="box-sizing: border-box; font-family: tisa, -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, ''Helvetica Neue'', Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol''; margin-top: 1.5rem !important; margin-bottom: 1.5rem !important; color: #6c757d !important;">The often compared to the EU''s GDPR, the Californian Consumer Privacy Act (CCPA) grants additional rights to Californian consumers and places several new requirements on businesses, including disclosure and&nbsp;<a class="link-underline text-dark" style="box-sizing: border-box; text-decoration-line: none; background-color: transparent; position: relative; z-index: 1; box-shadow: rgba(0, 0, 0, 0.1) 0px 3px 0px -1px; color: #5a5a5a !important;" href="https://www.iubenda.com/en/help/19133#how-iubenda-can-help">opt-out requirements</a>. Our solution makes it easy for you to create CCPA Compliant Privacy Policies by:</p>
<ul class="list-unstyled list-item-mb-3 serif text-muted" style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; padding-left: 0px; list-style: none; font-family: tisa, -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, ''Helvetica Neue'', Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol''; color: #6c757d !important;">
<li class="d-flex" style="box-sizing: border-box; display: flex !important; margin-bottom: 1rem !important;"><img class="flex-shrink mr-3 loaded" style="box-sizing: border-box; vertical-align: middle; border-style: none; margin-right: 1rem !important; flex-shrink: 0;" src="https://www.iubenda.com/assets/site/red/general/pages/vat/check-ccccae9f0ad823bb8a63fbcb9104e22c.svg" alt="Check icon" width="32" height="32" data-lazy-src="/assets/site/red/general/pages/vat/check-ccccae9f0ad823bb8a63fbcb9104e22c.svg" data-was-processed="true" />
<div style="box-sizing: border-box;">Displaying CCPA related language, disclosures, and instructions as legally required</div>
</li>
<li class="d-flex" style="box-sizing: border-box; display: flex !important; margin-bottom: 1rem !important;"><img class="flex-shrink mr-3 loaded" style="box-sizing: border-box; vertical-align: middle; border-style: none; margin-right: 1rem !important; flex-shrink: 0;" src="https://www.iubenda.com/assets/site/red/general/pages/vat/check-ccccae9f0ad823bb8a63fbcb9104e22c.svg" alt="Check icon" width="32" height="32" data-lazy-src="/assets/site/red/general/pages/vat/check-ccccae9f0ad823bb8a63fbcb9104e22c.svg" data-was-processed="true" />
<div style="box-sizing: border-box;">Indicating services active on your site which might constitute a sale under the CCPA definition (as legally required)</div>
</li>
<li class="d-flex" style="box-sizing: border-box; display: flex !important; margin-bottom: 0px !important;"><img class="flex-shrink mr-3 loaded" style="box-sizing: border-box; vertical-align: middle; border-style: none; margin-right: 1rem !important; flex-shrink: 0;" src="https://www.iubenda.com/assets/site/red/general/pages/vat/check-ccccae9f0ad823bb8a63fbcb9104e22c.svg" alt="Check icon" width="32" height="32" data-lazy-src="/assets/site/red/general/pages/vat/check-ccccae9f0ad823bb8a63fbcb9104e22c.svg" data-was-processed="true" />
<div style="box-sizing: border-box;">Automatically updating your embedded privacy policy with the CCPA text once activated within the generator &ndash; no need to re-integrate the code on your site</div>
</li>
</ul>
</article>
</div>
</div>', 4)
INSERT [dbo].[PageContents] ([PageContentId], [Title], [Content], [PageId]) VALUES (2, N'About Us', N'<p style="box-sizing: inherit; margin: 0px 0px 1em; padding: 0px; color: #4a4a4a; font-family: ''Galano Grotesque Alt'', Roboto, Oxygen, Ubuntu, Cantarell, ''Fira Sans'', ''Droid Sans'', ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 20px; background-color: #ffffff;"><em style="box-sizing: inherit;">An About Us page helps your company make a good first impression, and is critical for building customer trust and loyalty. An About Us page should make sure to cover basic information about the store and its founders, explain the company''s purpose and how it differs from the competition, and encourage discussion and interaction. Here are some free templates, samples, and example About Us pages to help your ecommerce store stand out from the crowd.</em></p>
<p style="box-sizing: inherit; margin: 0px 0px 1em; padding: 0px; color: #4a4a4a; font-family: ''Galano Grotesque Alt'', Roboto, Oxygen, Ubuntu, Cantarell, ''Fira Sans'', ''Droid Sans'', ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 20px; background-color: #ffffff;">When it comes to personalizing your online store, nothing is more effective than an About Us page. This is a quick summary of your company''s history and purpose, and should provide a clear overview of the company''s brand story. A great About Us page can help tell your brand story, establish customer loyalty, and turn your bland ecommerce store into an well-loved brand icon. Most importantly, it will give your customers a reason to shop from your brand.</p>
<p style="box-sizing: inherit; margin: 0px 0px 1em; padding: 0px; color: #4a4a4a; font-family: ''Galano Grotesque Alt'', Roboto, Oxygen, Ubuntu, Cantarell, ''Fira Sans'', ''Droid Sans'', ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 20px; background-color: #ffffff;">In this post, we''ll give you&nbsp;<span style="box-sizing: inherit; color: #363636; font-weight: bold;">three different ways to create a professional about us page</span>&nbsp;for your online store, blog, or other website - use our&nbsp;<a style="box-sizing: inherit; color: #8268fc; cursor: pointer; text-decoration-line: none;" href="https://www.volusion.com/tools/about-us-generator/" target="_blank" rel="noopener">about us page generator</a>, use the fill-in-the-blank about us template below, or create your own custom page using the about us examples within this article.</p>
<blockquote style="box-sizing: inherit; margin: 50px auto; padding: 1.25em 1.5em; background-color: #ffffff; border-left-width: 5px; border-left-color: #8268fc; color: #8268fc; max-width: 85%; font-size: 1.5rem; font-family: ''Galano Grotesque Alt'', Roboto, Oxygen, Ubuntu, Cantarell, ''Fira Sans'', ''Droid Sans'', ''Helvetica Neue'', Helvetica, Arial, sans-serif;">
<p style="box-sizing: inherit; margin: 0px; padding: 0px; font-size: 1.5rem;">Use the About Us Page Generator or fill in the template below to have a professional-looking page in minutes.</p>
</blockquote>
<p style="box-sizing: inherit; margin: 0px 0px 1em; padding: 0px; color: #4a4a4a; font-family: ''Galano Grotesque Alt'', Roboto, Oxygen, Ubuntu, Cantarell, ''Fira Sans'', ''Droid Sans'', ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 20px; background-color: #ffffff;">So let''s get started! Since we know you''re busy and probably just looking for something to copy/paste, we''ll jump right into the About Us Page template. Just fill in the blanks and you''ll have a professional-looking page in minutes. After that, we encourage you to read the rest of the article. It explains why About Us pages are extra important for ecommerce sites, gives you some tips on how to build the perfect About Us page that your customers will love, and shows some great example About Us pages to help inspire you.</p>
<h2 style="box-sizing: inherit; margin: 1.1428em 0px 0.5714em; padding: 0px; font-size: 1.75em; color: #181432; line-height: 1.125; font-family: ''Galano Grotesque Alt'', Roboto, Oxygen, Ubuntu, Cantarell, ''Fira Sans'', ''Droid Sans'', ''Helvetica Neue'', Helvetica, Arial, sans-serif; background-color: #ffffff;">About Us Page Generator</h2>
<p style="box-sizing: inherit; margin: 0px 0px 1em; padding: 0px; color: #4a4a4a; font-family: ''Galano Grotesque Alt'', Roboto, Oxygen, Ubuntu, Cantarell, ''Fira Sans'', ''Droid Sans'', ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 20px; background-color: #ffffff;">We''ve created an automatic&nbsp;<a style="box-sizing: inherit; color: #8268fc; cursor: pointer; text-decoration-line: none;" href="https://www.volusion.com/tools/about-us-generator" target="_blank" rel="noopener">About Us Page Generator tool</a>&nbsp;that will give you short, medium, and long versions of About Us page text that you can copy and paste directly onto your website. Just fill in the blanks on the form and get a custom About Us page that you can copy-and-paste directly onto your own website. If you''d rather use a text-based template, there''s one below.</p>
<h2 style="box-sizing: inherit; margin: 1.1428em 0px 0.5714em; padding: 0px; font-size: 1.75em; color: #181432; line-height: 1.125; font-family: ''Galano Grotesque Alt'', Roboto, Oxygen, Ubuntu, Cantarell, ''Fira Sans'', ''Droid Sans'', ''Helvetica Neue'', Helvetica, Arial, sans-serif; background-color: #ffffff;">About Us Page Template</h2>
<p style="box-sizing: inherit; margin: 0px 0px 1em; padding: 0px; color: #4a4a4a; font-family: ''Galano Grotesque Alt'', Roboto, Oxygen, Ubuntu, Cantarell, ''Fira Sans'', ''Droid Sans'', ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 20px; background-color: #ffffff;">We''ve created a sample About Us template designed to work well for virtually any online store, blog, or website. Just fill in the brackets with your company''s information and you''ll have a professional About Us page written in minutes. If you want to put a personal touch on your page (which we highly recommend), check out the About Us examples below the template.</p>
<h3 style="box-sizing: inherit; margin: 1.3333em 0px 0.6666em; padding: 0px; font-size: 1.5em; color: #181432; line-height: 1.125; font-family: ''Galano Grotesque Alt'', Roboto, Oxygen, Ubuntu, Cantarell, ''Fira Sans'', ''Droid Sans'', ''Helvetica Neue'', Helvetica, Arial, sans-serif; background-color: #ffffff;">Copy and paste onto your own About Us page:</h3>
<p><em style="box-sizing: inherit; color: #4a4a4a; font-family: ''Galano Grotesque Alt'', Roboto, Oxygen, Ubuntu, Cantarell, ''Fira Sans'', ''Droid Sans'', ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 20px; background-color: #ffffff;">Welcome to [store name], your number one source for all things [product, ie: shoes, bags, dog treats]. We''re dedicated to giving you the very best of [product], with a focus on [three characteristics, ie: dependability, customer service and uniqueness.]</em></p>
<p style="box-sizing: inherit; margin: 0px 0px 1em; padding: 0px; color: #4a4a4a; font-family: ''Galano Grotesque Alt'', Roboto, Oxygen, Ubuntu, Cantarell, ''Fira Sans'', ''Droid Sans'', ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 20px; background-color: #ffffff;"><em style="box-sizing: inherit;">Founded in [year] by [founder''s name], [store name] has come a long way from its beginnings in a [starting location, ie: home office, toolshed, Houston, TX.]. When [store founder] first started out, his/her passion for [passion of founder, ie: helping other parents be more eco-friendly, providing the best equipment for his fellow musicians] drove him to [action, ie: do intense research, quit her day job], and gave him the impetus to turn hard work and inspiration into to a booming online store. We now serve customers all over [place, ie: the US, the world, the Austin area], and are thrilled to be a part of the [adjective, ie: quirky, eco-friendly, fair trade] wing of the [industry type, ie: fashion, baked goods, watches] industry.</em></p>
<p style="box-sizing: inherit; margin: 0px 0px 1em; padding: 0px; color: #4a4a4a; font-family: ''Galano Grotesque Alt'', Roboto, Oxygen, Ubuntu, Cantarell, ''Fira Sans'', ''Droid Sans'', ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 20px; background-color: #ffffff;"><em style="box-sizing: inherit;">We hope you enjoy our products as much as we enjoy offering them to you. If you have any questions or comments, please don''t hesitate to contact us.</em></p>
<p style="box-sizing: inherit; margin: 0px 0px 1em; padding: 0px; color: #4a4a4a; font-family: ''Galano Grotesque Alt'', Roboto, Oxygen, Ubuntu, Cantarell, ''Fira Sans'', ''Droid Sans'', ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 20px; background-color: #ffffff;"><em style="box-sizing: inherit;">Sincerely,<br style="box-sizing: inherit;" />Name, [title, ie: CEO, Founder, etc.]</em></p>', 2)
INSERT [dbo].[PageContents] ([PageContentId], [Title], [Content], [PageId]) VALUES (3, N'Contact Us', N'<section id="carousel_be04" class="u-align-center u-clearfix u-grey-10 u-section-2" style="box-sizing: border-box; position: relative; text-align: center; color: #111111; background-color: #e5e5e5; background-image: none; font-family: ''Open Sans'', sans-serif; font-size: 16px;">
<div class="u-clearfix u-sheet u-valign-middle-lg u-valign-middle-xl u-sheet-1" style="box-sizing: border-box; position: relative; width: 1140px; margin: 0px auto; display: flex; flex-direction: column; justify-content: center; min-height: 809px; pointer-events: none;">
<h2 class="u-text u-text-1" style="box-sizing: border-box; margin: 60px 0px 0px; line-height: 1.1; color: inherit; font-size: 3rem; font-family: Roboto, sans-serif; position: relative; overflow-wrap: break-word; padding: 0px; pointer-events: initial;">How can we help you?</h2>
<p class="u-text u-text-2" style="box-sizing: border-box; margin: 19px auto 0px; padding: 0px; position: relative; overflow-wrap: break-word; width: 641px; pointer-events: initial;"><span style="box-sizing: border-box; font-weight: bold;">Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.&nbsp;</span>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt <strong>in culpa qui officia deserunt mollit anim id est laborum.</strong></p>
<div class="u-expanded-width-md u-expanded-width-sm u-expanded-width-xs u-list u-list-1" style="box-sizing: border-box; position: relative; display: flex; flex-direction: column; min-height: 470px; width: 796px; height: auto; margin: 40px auto 60px; pointer-events: initial;">
<div class="u-repeater u-repeater-1" style="box-sizing: border-box; display: grid; grid-template-columns: repeat(2, calc(50% - 20px)); grid-auto-columns: calc(50% - 20px); grid-auto-rows: calc(50% - 20px); gap: 40px; flex: 1 1 0%;">
<div class="u-align-center u-container-style u-list-item u-repeater-item u-white u-list-item-1" style="box-sizing: border-box; display: flex; position: relative; background-color: #ffffff; background-image: none;">
<div class="u-container-layout u-similar-container u-valign-middle-sm u-valign-top-lg u-valign-top-md u-valign-top-xl u-valign-top-xs u-container-layout-1" style="box-sizing: border-box; position: relative; flex: 1 1 0%; max-width: 100%; display: flex; flex-direction: column; justify-content: flex-start; padding: 30px;">
<h5 class="u-align-center u-text u-text-3" style="box-sizing: border-box; margin: 20px 0px 0px; line-height: 1.2; color: inherit; font-size: 1.25rem; font-family: Roboto, sans-serif; position: relative; overflow-wrap: break-word; padding: 0px; text-transform: uppercase;">OUR MAIN OFFICE</h5>
<p class="u-align-center u-text u-text-4" style="box-sizing: border-box; margin: 19px 0px 0px; padding: 0px; position: relative; overflow-wrap: break-word;">Stockholm</p>
</div>
</div>
<div class="u-container-style u-list-item u-repeater-item u-white u-list-item-2" style="box-sizing: border-box; display: flex; position: relative; background-color: #ffffff; text-align: left; background-image: none;">
<div class="u-container-layout u-similar-container u-valign-middle-sm u-valign-top-lg u-valign-top-md u-valign-top-xl u-valign-top-xs u-container-layout-2" style="box-sizing: border-box; position: relative; flex: 1 1 0%; max-width: 100%; display: flex; flex-direction: column; justify-content: flex-start; padding: 30px;">
<h5 class="u-align-center u-text u-text-5" style="box-sizing: border-box; margin: 20px 0px 0px; line-height: 1.2; color: inherit; font-size: 1.25rem; font-family: Roboto, sans-serif; position: relative; text-align: center; overflow-wrap: break-word; padding: 0px; text-transform: uppercase;">PHONE NUMBER</h5>
<p class="u-align-center u-text u-text-6" style="box-sizing: border-box; margin: 19px 0px 0px; padding: 0px; position: relative; text-align: center; overflow-wrap: break-word;">+46 123456789<br style="box-sizing: border-box;" />888-0123-4567 (Toll Free)</p>
</div>
</div>
<div class="u-align-center u-container-style u-list-item u-repeater-item u-white u-list-item-3" style="box-sizing: border-box; display: flex; position: relative; background-color: #ffffff; background-image: none;">
<div class="u-container-layout u-similar-container u-valign-middle-sm u-valign-top-lg u-valign-top-md u-valign-top-xl u-valign-top-xs u-container-layout-3" style="box-sizing: border-box; position: relative; flex: 1 1 0%; max-width: 100%; display: flex; flex-direction: column; justify-content: flex-start; padding: 30px;">
<h5 class="u-align-center u-text u-text-7" style="box-sizing: border-box; margin: 20px 0px 0px; line-height: 1.2; color: inherit; font-size: 1.25rem; font-family: Roboto, sans-serif; position: relative; overflow-wrap: break-word; padding: 0px; text-transform: uppercase;">FAX</h5>
<p class="u-align-center u-text u-text-8" style="box-sizing: border-box; margin: 19px 0px 0px; padding: 0px; position: relative; overflow-wrap: break-word;">1-234-567-8900</p>
</div>
</div>
<div class="u-align-center u-container-style u-list-item u-repeater-item u-white u-list-item-4" style="box-sizing: border-box; display: flex; position: relative; background-color: #ffffff; background-image: none;">
<div class="u-container-layout u-similar-container u-valign-middle-sm u-valign-top-lg u-valign-top-md u-valign-top-xl u-valign-top-xs u-container-layout-4" style="box-sizing: border-box; position: relative; flex: 1 1 0%; max-width: 100%; display: flex; flex-direction: column; justify-content: flex-start; padding: 30px;">
<h5 class="u-align-center u-text u-text-9" style="box-sizing: border-box; margin: 20px 0px 0px; line-height: 1.2; color: inherit; font-size: 1.25rem; font-family: Roboto, sans-serif; position: relative; overflow-wrap: break-word; padding: 0px; text-transform: uppercase;">EMAIL</h5>
<p class="u-align-center u-text u-text-10" style="box-sizing: border-box; margin: 19px 0px 0px; padding: 0px; position: relative; overflow-wrap: break-word;"><a class="u-active-none u-border-1 u-border-palette-2-base u-btn u-button-link u-button-style u-hover-none u-none u-text-palette-2-base u-btn-1" style="box-sizing: border-box; border-width: 1px; text-decoration-line: none; display: inline; cursor: pointer; font-size: inherit; font-family: inherit; line-height: inherit; letter-spacing: inherit; text-transform: inherit; font-weight: inherit; border-style: none none solid; border-image: initial; outline-width: 0px; margin: 0px; font-style: initial; user-select: none; vertical-align: baseline; text-align: inherit; padding: 0px; border-radius: 0px; align-self: flex-start; stroke: none; background-color: transparent !important; color: #5c54db !important; border-color: #5c54db !important;" href="mailto:hello@theme.com">admin@cms.se</a></p>
<p>&nbsp;</p>
</div>
</div>
</div>
</div>
</div>
</section>', 3)
SET IDENTITY_INSERT [dbo].[PageContents] OFF
GO
SET IDENTITY_INSERT [dbo].[Pages] ON 

INSERT [dbo].[Pages] ([PageId], [PageName], [PageLink], [IsDeleted]) VALUES (1, N'Home', N'/Index', 0)
INSERT [dbo].[Pages] ([PageId], [PageName], [PageLink], [IsDeleted]) VALUES (2, N'About Us', N'/AboutUs', 0)
INSERT [dbo].[Pages] ([PageId], [PageName], [PageLink], [IsDeleted]) VALUES (3, N'Contact', N'/Contacts', 0)
INSERT [dbo].[Pages] ([PageId], [PageName], [PageLink], [IsDeleted]) VALUES (4, N'Privacy', N'/Privacy', 0)
INSERT [dbo].[Pages] ([PageId], [PageName], [PageLink], [IsDeleted]) VALUES (5, N'Test', N'/Test', 0)
SET IDENTITY_INSERT [dbo].[Pages] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 6/16/2021 12:13:45 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 6/16/2021 12:13:45 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 6/16/2021 12:13:45 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 6/16/2021 12:13:45 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 6/16/2021 12:13:45 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 6/16/2021 12:13:45 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 6/16/2021 12:13:45 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PageContents_PageId]    Script Date: 6/16/2021 12:13:45 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_PageContents_PageId] ON [dbo].[PageContents]
(
	[PageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[PageContents]  WITH CHECK ADD  CONSTRAINT [FK_PageContents_Pages_PageId] FOREIGN KEY([PageId])
REFERENCES [dbo].[Pages] ([PageId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PageContents] CHECK CONSTRAINT [FK_PageContents_Pages_PageId]
GO
USE [master]
GO
ALTER DATABASE [ITHS_CMSDatabase] SET  READ_WRITE 
GO
