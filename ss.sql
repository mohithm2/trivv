USE [master]
GO
/****** Object:  Database [TrivagoDatabase]    Script Date: 10-11-2019 20:21:23 ******/
CREATE DATABASE [TrivagoDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TRIVAGO2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TRIVAGO2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TRIVAGO2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TRIVAGO2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TrivagoDatabase] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TrivagoDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TrivagoDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TrivagoDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TrivagoDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TrivagoDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TrivagoDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [TrivagoDatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TrivagoDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TrivagoDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TrivagoDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TrivagoDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TrivagoDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TrivagoDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TrivagoDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TrivagoDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TrivagoDatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TrivagoDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TrivagoDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TrivagoDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TrivagoDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TrivagoDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TrivagoDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TrivagoDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TrivagoDatabase] SET RECOVERY FULL 
GO
ALTER DATABASE [TrivagoDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [TrivagoDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TrivagoDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TrivagoDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TrivagoDatabase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TrivagoDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TrivagoDatabase', N'ON'
GO
ALTER DATABASE [TrivagoDatabase] SET QUERY_STORE = OFF
GO
USE [TrivagoDatabase]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 10-11-2019 20:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Agent]    Script Date: 10-11-2019 20:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agent](
	[AGENTID] [varchar](5) NOT NULL,
	[NAME] [varchar](50) NULL,
	[LOCATION] [varchar](50) NULL,
	[CONTACT] [varchar](50) NULL,
	[EMAIL] [varchar](50) NOT NULL,
	[PASSWORD] [varchar](50) NOT NULL,
 CONSTRAINT [PK_AGENT] PRIMARY KEY CLUSTERED 
(
	[AGENTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 10-11-2019 20:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 10-11-2019 20:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 10-11-2019 20:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 10-11-2019 20:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 10-11-2019 20:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 10-11-2019 20:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CUSTOMERID] [varchar](5) NOT NULL,
	[NAME] [varchar](50) NULL,
	[LOCATION] [varchar](50) NULL,
	[CONTACT] [varchar](50) NULL,
	[EMAIL] [varchar](50) NOT NULL,
	[PASSWORD] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CUSTOMER] PRIMARY KEY CLUSTERED 
(
	[CUSTOMERID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 10-11-2019 20:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[HOTELID] [varchar](5) NOT NULL,
	[NAME] [varchar](50) NULL,
	[CONTACT] [varchar](50) NULL,
	[LOCATION] [varchar](50) NULL,
	[DESCRIPTION] [varchar](200) NULL,
	[AGENTID] [varchar](5) NULL,
 CONSTRAINT [PK_HOTEL] PRIMARY KEY CLUSTERED 
(
	[HOTELID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel_Booking]    Script Date: 10-11-2019 20:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel_Booking](
	[HOTELID] [varchar](5) NOT NULL,
	[CUSTOMERID] [varchar](5) NOT NULL,
	[CHECK_IN] [date] NULL,
	[CHECK_OUT] [date] NULL,
 CONSTRAINT [PK_HOTEL_BOOKING] PRIMARY KEY CLUSTERED 
(
	[HOTELID] ASC,
	[CUSTOMERID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Package]    Script Date: 10-11-2019 20:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Package](
	[PACKAGEID] [varchar](5) NOT NULL,
	[PRICE] [varchar](50) NULL,
	[DESCRIPTION] [varchar](200) NULL,
	[ACTIVITIES] [varchar](50) NULL,
	[NO_OF_DAYS] [varchar](50) NULL,
	[PLACES] [varchar](200) NULL,
	[AGENTID] [varchar](5) NULL,
 CONSTRAINT [PK_PACKAGES] PRIMARY KEY CLUSTERED 
(
	[PACKAGEID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Package_Booking]    Script Date: 10-11-2019 20:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Package_Booking](
	[PACKAGEID] [varchar](5) NOT NULL,
	[CUSTOMERID] [varchar](5) NOT NULL,
	[BOOKING_DATE] [date] NULL,
 CONSTRAINT [PK_PACKAGE_BOOKING] PRIMARY KEY CLUSTERED 
(
	[PACKAGEID] ASC,
	[CUSTOMERID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 10-11-2019 20:21:24 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 10-11-2019 20:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 10-11-2019 20:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleId]    Script Date: 10-11-2019 20:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 10-11-2019 20:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 10-11-2019 20:21:24 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD  CONSTRAINT [FK_HOTEL_AGENT] FOREIGN KEY([AGENTID])
REFERENCES [dbo].[Agent] ([AGENTID])
GO
ALTER TABLE [dbo].[Hotel] CHECK CONSTRAINT [FK_HOTEL_AGENT]
GO
ALTER TABLE [dbo].[Hotel_Booking]  WITH CHECK ADD  CONSTRAINT [FK_HOTEL_BOOKING_CUSTOMER] FOREIGN KEY([CUSTOMERID])
REFERENCES [dbo].[Customer] ([CUSTOMERID])
GO
ALTER TABLE [dbo].[Hotel_Booking] CHECK CONSTRAINT [FK_HOTEL_BOOKING_CUSTOMER]
GO
ALTER TABLE [dbo].[Hotel_Booking]  WITH CHECK ADD  CONSTRAINT [FK_HOTEL_BOOKING_HOTEL] FOREIGN KEY([HOTELID])
REFERENCES [dbo].[Hotel] ([HOTELID])
GO
ALTER TABLE [dbo].[Hotel_Booking] CHECK CONSTRAINT [FK_HOTEL_BOOKING_HOTEL]
GO
ALTER TABLE [dbo].[Package]  WITH CHECK ADD  CONSTRAINT [FK_PACKAGES_AGENT] FOREIGN KEY([AGENTID])
REFERENCES [dbo].[Agent] ([AGENTID])
GO
ALTER TABLE [dbo].[Package] CHECK CONSTRAINT [FK_PACKAGES_AGENT]
GO
ALTER TABLE [dbo].[Package_Booking]  WITH CHECK ADD  CONSTRAINT [FK_PACKAGE_BOOKING_CUSTOMER] FOREIGN KEY([CUSTOMERID])
REFERENCES [dbo].[Customer] ([CUSTOMERID])
GO
ALTER TABLE [dbo].[Package_Booking] CHECK CONSTRAINT [FK_PACKAGE_BOOKING_CUSTOMER]
GO
ALTER TABLE [dbo].[Package_Booking]  WITH CHECK ADD  CONSTRAINT [FK_PACKAGE_BOOKING_PACKAGES] FOREIGN KEY([PACKAGEID])
REFERENCES [dbo].[Package] ([PACKAGEID])
GO
ALTER TABLE [dbo].[Package_Booking] CHECK CONSTRAINT [FK_PACKAGE_BOOKING_PACKAGES]
GO
USE [master]
GO
ALTER DATABASE [TrivagoDatabase] SET  READ_WRITE 
GO
