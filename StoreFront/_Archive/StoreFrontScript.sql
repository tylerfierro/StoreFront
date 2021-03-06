/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.5026)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[XboxEmployees]') AND type in (N'U'))
ALTER TABLE [dbo].[XboxEmployees] DROP CONSTRAINT IF EXISTS [FK_XboxEmployees_Games]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[XboxEmployees]') AND type in (N'U'))
ALTER TABLE [dbo].[XboxEmployees] DROP CONSTRAINT IF EXISTS [FK_XboxEmployees_Employee's]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Xbox]') AND type in (N'U'))
ALTER TABLE [dbo].[Xbox] DROP CONSTRAINT IF EXISTS [FK_Xbox_XboxStatuses]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Xbox]') AND type in (N'U'))
ALTER TABLE [dbo].[Xbox] DROP CONSTRAINT IF EXISTS [FK_Xbox_XboxAccessories]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Xbox]') AND type in (N'U'))
ALTER TABLE [dbo].[Xbox] DROP CONSTRAINT IF EXISTS [FK_Xbox_Department's]
GO
/****** Object:  Table [dbo].[XboxStatuses]    Script Date: 11/6/2020 11:42:07 AM ******/
DROP TABLE IF EXISTS [dbo].[XboxStatuses]
GO
/****** Object:  Table [dbo].[XboxEmployees]    Script Date: 11/6/2020 11:42:07 AM ******/
DROP TABLE IF EXISTS [dbo].[XboxEmployees]
GO
/****** Object:  Table [dbo].[XboxAccessories]    Script Date: 11/6/2020 11:42:07 AM ******/
DROP TABLE IF EXISTS [dbo].[XboxAccessories]
GO
/****** Object:  Table [dbo].[Xbox]    Script Date: 11/6/2020 11:42:07 AM ******/
DROP TABLE IF EXISTS [dbo].[Xbox]
GO
/****** Object:  Table [dbo].[Games]    Script Date: 11/6/2020 11:42:07 AM ******/
DROP TABLE IF EXISTS [dbo].[Games]
GO
/****** Object:  Table [dbo].[Employee's]    Script Date: 11/6/2020 11:42:07 AM ******/
DROP TABLE IF EXISTS [dbo].[Employee's]
GO
/****** Object:  Table [dbo].[Department's]    Script Date: 11/6/2020 11:42:07 AM ******/
DROP TABLE IF EXISTS [dbo].[Department's]
GO
/****** Object:  Database [StoreFrontProject]    Script Date: 11/6/2020 11:42:07 AM ******/
DROP DATABASE IF EXISTS [StoreFrontProject]
GO
/****** Object:  Database [StoreFrontProject]    Script Date: 11/6/2020 11:42:07 AM ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'StoreFrontProject')
BEGIN
CREATE DATABASE [StoreFrontProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StoreFrontProject', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\StoreFrontProject.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StoreFrontProject_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\StoreFrontProject_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
END
GO
ALTER DATABASE [StoreFrontProject] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StoreFrontProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StoreFrontProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StoreFrontProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StoreFrontProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StoreFrontProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StoreFrontProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [StoreFrontProject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StoreFrontProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StoreFrontProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StoreFrontProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StoreFrontProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StoreFrontProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StoreFrontProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StoreFrontProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StoreFrontProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StoreFrontProject] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StoreFrontProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StoreFrontProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StoreFrontProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StoreFrontProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StoreFrontProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StoreFrontProject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StoreFrontProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StoreFrontProject] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StoreFrontProject] SET  MULTI_USER 
GO
ALTER DATABASE [StoreFrontProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StoreFrontProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StoreFrontProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StoreFrontProject] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StoreFrontProject] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [StoreFrontProject] SET QUERY_STORE = OFF
GO
USE [StoreFrontProject]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
/****** Object:  Table [dbo].[Department's]    Script Date: 11/6/2020 11:42:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Department''s]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Department's](
	[DepartmentsID] [int] IDENTITY(1,1) NOT NULL,
	[DeptName] [varchar](50) NULL,
	[City] [varchar](20) NULL,
	[State] [char](2) NULL,
 CONSTRAINT [PK_Department's] PRIMARY KEY CLUSTERED 
(
	[DepartmentsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Employee's]    Script Date: 11/6/2020 11:42:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee''s]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Employee's](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](15) NOT NULL,
	[LastName] [varchar](15) NOT NULL,
	[City] [varchar](50) NULL,
	[State] [char](2) NULL,
	[ZipCode] [char](6) NULL,
	[Country] [varchar](30) NULL,
	[DirectReportID] [int] NULL,
 CONSTRAINT [PK_Employee's] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Games]    Script Date: 11/6/2020 11:42:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Games]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Games](
	[GameID] [int] NOT NULL,
	[G_Name] [varchar](50) NULL,
	[G_Company] [varchar](50) NULL,
	[GamePrice] [money] NULL,
	[G_Description] [varchar](max) NULL,
	[G_UnitsSold] [int] NULL,
	[GameImage] [varchar](100) NULL,
	[ReleaseDate] [date] NULL,
 CONSTRAINT [PK_Games] PRIMARY KEY CLUSTERED 
(
	[GameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Xbox]    Script Date: 11/6/2020 11:42:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Xbox]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Xbox](
	[XboxID] [int] IDENTITY(1,1) NOT NULL,
	[G_Name] [varchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[AccessoriesID] [int] NULL,
	[GamePrice] [money] NOT NULL,
	[XboxUnitsSold] [int] NULL,
	[ReleaseDate] [date] NULL,
	[G_Company] [int] NOT NULL,
	[GameImage] [varchar](100) NULL,
	[XboxStatusID] [int] NOT NULL,
	[DepartmentsID] [int] NOT NULL,
 CONSTRAINT [PK_Xbox] PRIMARY KEY CLUSTERED 
(
	[XboxID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[XboxAccessories]    Script Date: 11/6/2020 11:42:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[XboxAccessories]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[XboxAccessories](
	[AccessoriesID] [int] IDENTITY(1,1) NOT NULL,
	[AccessoryStatus] [nvarchar](50) NOT NULL,
	[Access_Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_XboxAccessories] PRIMARY KEY CLUSTERED 
(
	[AccessoriesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[XboxEmployees]    Script Date: 11/6/2020 11:42:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[XboxEmployees]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[XboxEmployees](
	[XboxEmployeesID] [int] IDENTITY(1,1) NOT NULL,
	[GameID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
 CONSTRAINT [PK_XboxEmployees] PRIMARY KEY CLUSTERED 
(
	[XboxEmployeesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[XboxStatuses]    Script Date: 11/6/2020 11:42:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[XboxStatuses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[XboxStatuses](
	[XboxStatusID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_XboxStatuses] PRIMARY KEY CLUSTERED 
(
	[XboxStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Department's] ON 

INSERT [dbo].[Department's] ([DepartmentsID], [DeptName], [City], [State]) VALUES (1, N'Marketing', N'Kansas City', N'MO')
INSERT [dbo].[Department's] ([DepartmentsID], [DeptName], [City], [State]) VALUES (2, N'Finance', N'St.Louis ', N'MO')
INSERT [dbo].[Department's] ([DepartmentsID], [DeptName], [City], [State]) VALUES (3, N'Assembly', N'New York', N'NY')
INSERT [dbo].[Department's] ([DepartmentsID], [DeptName], [City], [State]) VALUES (4, N'Packing', N'New York', N'NY')
INSERT [dbo].[Department's] ([DepartmentsID], [DeptName], [City], [State]) VALUES (5, N'Distribution', N'Kansas City', N'MO')
SET IDENTITY_INSERT [dbo].[Department's] OFF
SET IDENTITY_INSERT [dbo].[Employee's] ON 

INSERT [dbo].[Employee's] ([EmployeeID], [FirstName], [LastName], [City], [State], [ZipCode], [Country], [DirectReportID]) VALUES (1, N'Richard', N'Merrill', N'Bowie', N'TX', N'76230 ', N'US', NULL)
INSERT [dbo].[Employee's] ([EmployeeID], [FirstName], [LastName], [City], [State], [ZipCode], [Country], [DirectReportID]) VALUES (2, N'Kellie', N'Sanchez', N'Jasper', N'TX', N'75951 ', N'US', NULL)
INSERT [dbo].[Employee's] ([EmployeeID], [FirstName], [LastName], [City], [State], [ZipCode], [Country], [DirectReportID]) VALUES (3, N'Samual ', N'George', N'Bethesda-Chevy Chase', N'MD', N'20815 ', N'US', NULL)
INSERT [dbo].[Employee's] ([EmployeeID], [FirstName], [LastName], [City], [State], [ZipCode], [Country], [DirectReportID]) VALUES (4, N'Kareem ', N'Weeks', N'Malden', N'MO', N'63863 ', N'US', NULL)
INSERT [dbo].[Employee's] ([EmployeeID], [FirstName], [LastName], [City], [State], [ZipCode], [Country], [DirectReportID]) VALUES (5, N'Marcos', N'Norris', N'Boulder', N'CO', N'80301 ', N'US', NULL)
INSERT [dbo].[Employee's] ([EmployeeID], [FirstName], [LastName], [City], [State], [ZipCode], [Country], [DirectReportID]) VALUES (6, N'Sebastian', N'Mclellan', N'Sebring', N'FL', N'33870 ', N'US', NULL)
INSERT [dbo].[Employee's] ([EmployeeID], [FirstName], [LastName], [City], [State], [ZipCode], [Country], [DirectReportID]) VALUES (7, N'Grover', N'Hendrix', N'Mamaroneck', N'NY', N'10538 ', N'US', NULL)
INSERT [dbo].[Employee's] ([EmployeeID], [FirstName], [LastName], [City], [State], [ZipCode], [Country], [DirectReportID]) VALUES (8, N'Cecelia ', N'Lester', N'Williamstown', N'NJ', N'08094 ', N'US', NULL)
INSERT [dbo].[Employee's] ([EmployeeID], [FirstName], [LastName], [City], [State], [ZipCode], [Country], [DirectReportID]) VALUES (9, N'Myron', N'Collier', N'Tucumcari', N'NM', N'88401 ', N'US', NULL)
INSERT [dbo].[Employee's] ([EmployeeID], [FirstName], [LastName], [City], [State], [ZipCode], [Country], [DirectReportID]) VALUES (10, N'Luka', N'Smart', N'Prairie du Chien', N'WI', N'53821 ', N'US', NULL)
INSERT [dbo].[Employee's] ([EmployeeID], [FirstName], [LastName], [City], [State], [ZipCode], [Country], [DirectReportID]) VALUES (11, N'Kley', N'Parra', N'Honesdale', N'PA', N'18431 ', N'US', NULL)
INSERT [dbo].[Employee's] ([EmployeeID], [FirstName], [LastName], [City], [State], [ZipCode], [Country], [DirectReportID]) VALUES (12, N'Vinnie', N'Markham', N'El Paso', N'TX', N'79835 ', N'US', NULL)
INSERT [dbo].[Employee's] ([EmployeeID], [FirstName], [LastName], [City], [State], [ZipCode], [Country], [DirectReportID]) VALUES (13, N'Maegan', N'Derrick', N'Altoona', N'PA', N'16601 ', N'US', NULL)
INSERT [dbo].[Employee's] ([EmployeeID], [FirstName], [LastName], [City], [State], [ZipCode], [Country], [DirectReportID]) VALUES (14, N'Nigel', N'Pollard', N'Indiana', N'PA', N'15701 ', N'US', NULL)
INSERT [dbo].[Employee's] ([EmployeeID], [FirstName], [LastName], [City], [State], [ZipCode], [Country], [DirectReportID]) VALUES (15, N'Abbey', N'Major', N'Cape May', N'NJ', N'08204 ', N'US', NULL)
INSERT [dbo].[Employee's] ([EmployeeID], [FirstName], [LastName], [City], [State], [ZipCode], [Country], [DirectReportID]) VALUES (16, N'Ethan', N'Colley', N'Greenwood', N'MO', N'64034 ', N'US', NULL)
INSERT [dbo].[Employee's] ([EmployeeID], [FirstName], [LastName], [City], [State], [ZipCode], [Country], [DirectReportID]) VALUES (17, N'Lorenzo', N'James', N'Knoxville', N'TN', N'37901 ', N'US', NULL)
INSERT [dbo].[Employee's] ([EmployeeID], [FirstName], [LastName], [City], [State], [ZipCode], [Country], [DirectReportID]) VALUES (18, N'Olive', N'Mcmahon', N'Wyandotte', N'MI', N'48192 ', N'US', NULL)
INSERT [dbo].[Employee's] ([EmployeeID], [FirstName], [LastName], [City], [State], [ZipCode], [Country], [DirectReportID]) VALUES (19, N'Jaiden ', N'Newton', N'Worland', N'WY', N'82401 ', N'US', NULL)
INSERT [dbo].[Employee's] ([EmployeeID], [FirstName], [LastName], [City], [State], [ZipCode], [Country], [DirectReportID]) VALUES (20, N'Keiren', N'Day', N'Alamosa', N'CO', N'81101 ', N'US', NULL)
INSERT [dbo].[Employee's] ([EmployeeID], [FirstName], [LastName], [City], [State], [ZipCode], [Country], [DirectReportID]) VALUES (21, N'Karter', N'Wainwright', N'Amana Colonies', N'IA', N'52307 ', N'US', NULL)
INSERT [dbo].[Employee's] ([EmployeeID], [FirstName], [LastName], [City], [State], [ZipCode], [Country], [DirectReportID]) VALUES (22, N'Walter', N'Ferrell', N'Boulder City', N'NV', N'89002 ', N'US', NULL)
INSERT [dbo].[Employee's] ([EmployeeID], [FirstName], [LastName], [City], [State], [ZipCode], [Country], [DirectReportID]) VALUES (23, N'Angelica', N'Harrison', N'Rockville', N'  ', N'      ', N'US', NULL)
SET IDENTITY_INSERT [dbo].[Employee's] OFF
INSERT [dbo].[Games] ([GameID], [G_Name], [G_Company], [GamePrice], [G_Description], [G_UnitsSold], [GameImage], [ReleaseDate]) VALUES (1, N'Fortnite', N'Epic Games', 0.0000, NULL, NULL, NULL, NULL)
INSERT [dbo].[Games] ([GameID], [G_Name], [G_Company], [GamePrice], [G_Description], [G_UnitsSold], [GameImage], [ReleaseDate]) VALUES (2, N'Minecraft', N'Mojang Studios', 30.0000, NULL, NULL, NULL, NULL)
INSERT [dbo].[Games] ([GameID], [G_Name], [G_Company], [GamePrice], [G_Description], [G_UnitsSold], [GameImage], [ReleaseDate]) VALUES (3, N'Madden 21', N'Electronic Arts', 60.0000, NULL, NULL, NULL, NULL)
INSERT [dbo].[Games] ([GameID], [G_Name], [G_Company], [GamePrice], [G_Description], [G_UnitsSold], [GameImage], [ReleaseDate]) VALUES (4, N'Madden 20', N'Electronic Arts', 30.0000, NULL, NULL, NULL, NULL)
INSERT [dbo].[Games] ([GameID], [G_Name], [G_Company], [GamePrice], [G_Description], [G_UnitsSold], [GameImage], [ReleaseDate]) VALUES (5, N'Grand Theft Auto V', N'Rockstar Games', 60.0000, NULL, NULL, NULL, NULL)
INSERT [dbo].[Games] ([GameID], [G_Name], [G_Company], [GamePrice], [G_Description], [G_UnitsSold], [GameImage], [ReleaseDate]) VALUES (6, N'Forza Horizon 4', N'Turn 10 Studios', 10.0000, NULL, NULL, NULL, NULL)
INSERT [dbo].[Games] ([GameID], [G_Name], [G_Company], [GamePrice], [G_Description], [G_UnitsSold], [GameImage], [ReleaseDate]) VALUES (7, N'Red Dead Redemption 2', N'Rockstar Games', 60.0000, NULL, NULL, NULL, NULL)
INSERT [dbo].[Games] ([GameID], [G_Name], [G_Company], [GamePrice], [G_Description], [G_UnitsSold], [GameImage], [ReleaseDate]) VALUES (8, N'Sea Of Thieves', N'Rare', 60.0000, NULL, NULL, NULL, NULL)
INSERT [dbo].[Games] ([GameID], [G_Name], [G_Company], [GamePrice], [G_Description], [G_UnitsSold], [GameImage], [ReleaseDate]) VALUES (9, N'NBA 2K 20', N'Visual Concepts', 60.0000, NULL, NULL, NULL, NULL)
INSERT [dbo].[Games] ([GameID], [G_Name], [G_Company], [GamePrice], [G_Description], [G_UnitsSold], [GameImage], [ReleaseDate]) VALUES (10, N'Assassin''s Creed Odyssey', N'Ubisoft', 15.0000, NULL, NULL, NULL, NULL)
INSERT [dbo].[Games] ([GameID], [G_Name], [G_Company], [GamePrice], [G_Description], [G_UnitsSold], [GameImage], [ReleaseDate]) VALUES (11, N'Resident Evil 2', N'Capcom', 40.0000, NULL, NULL, NULL, NULL)
INSERT [dbo].[Games] ([GameID], [G_Name], [G_Company], [GamePrice], [G_Description], [G_UnitsSold], [GameImage], [ReleaseDate]) VALUES (12, N'Rocket League', N'Psyonix', 20.0000, NULL, NULL, NULL, NULL)
INSERT [dbo].[Games] ([GameID], [G_Name], [G_Company], [GamePrice], [G_Description], [G_UnitsSold], [GameImage], [ReleaseDate]) VALUES (13, N'Destiny 2', N'Bungie', 40.0000, NULL, NULL, NULL, NULL)
INSERT [dbo].[Games] ([GameID], [G_Name], [G_Company], [GamePrice], [G_Description], [G_UnitsSold], [GameImage], [ReleaseDate]) VALUES (14, N'Mortal Kombat 11', N'NetherRealm Studios', 20.0000, NULL, NULL, NULL, NULL)
INSERT [dbo].[Games] ([GameID], [G_Name], [G_Company], [GamePrice], [G_Description], [G_UnitsSold], [GameImage], [ReleaseDate]) VALUES (15, N'Watch Dogs 2', N'Ubisoft', 50.0000, NULL, NULL, NULL, NULL)
INSERT [dbo].[Games] ([GameID], [G_Name], [G_Company], [GamePrice], [G_Description], [G_UnitsSold], [GameImage], [ReleaseDate]) VALUES (16, N'The Sims 4', N'Electronic Arts', 40.0000, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[XboxAccessories] ON 

INSERT [dbo].[XboxAccessories] ([AccessoriesID], [AccessoryStatus], [Access_Name]) VALUES (2, N'IsActive', N'Wireless Controller')
INSERT [dbo].[XboxAccessories] ([AccessoriesID], [AccessoryStatus], [Access_Name]) VALUES (3, N'IsActive', N'Wired Controller')
INSERT [dbo].[XboxAccessories] ([AccessoriesID], [AccessoryStatus], [Access_Name]) VALUES (4, N'IsActive', N'PDP Talon Media Remote')
INSERT [dbo].[XboxAccessories] ([AccessoriesID], [AccessoryStatus], [Access_Name]) VALUES (5, N'IsActive', N'Xbox Rechargeable Battery + USB-C')
INSERT [dbo].[XboxAccessories] ([AccessoriesID], [AccessoryStatus], [Access_Name]) VALUES (6, N'IsActive', N'Xbox Pro Charging Stand')
INSERT [dbo].[XboxAccessories] ([AccessoriesID], [AccessoryStatus], [Access_Name]) VALUES (7, N'IsActive', N'Chat Headset')
INSERT [dbo].[XboxAccessories] ([AccessoriesID], [AccessoryStatus], [Access_Name]) VALUES (8, N'IstActive', N'Stereo Headset')
INSERT [dbo].[XboxAccessories] ([AccessoriesID], [AccessoryStatus], [Access_Name]) VALUES (9, N'IsActive', N'Wired Headset')
INSERT [dbo].[XboxAccessories] ([AccessoriesID], [AccessoryStatus], [Access_Name]) VALUES (10, N'IsActive', N'Hard Drive')
INSERT [dbo].[XboxAccessories] ([AccessoriesID], [AccessoryStatus], [Access_Name]) VALUES (11, N'IsActive', N'LINKSYS WRT32X Dual-Band Gaming Router')
INSERT [dbo].[XboxAccessories] ([AccessoriesID], [AccessoryStatus], [Access_Name]) VALUES (12, N'IsActive', N'Wheel Wireless Racing Controller')
SET IDENTITY_INSERT [dbo].[XboxAccessories] OFF
SET IDENTITY_INSERT [dbo].[XboxEmployees] ON 

INSERT [dbo].[XboxEmployees] ([XboxEmployeesID], [GameID], [EmployeeID]) VALUES (2, 1, 1)
INSERT [dbo].[XboxEmployees] ([XboxEmployeesID], [GameID], [EmployeeID]) VALUES (3, 2, 2)
INSERT [dbo].[XboxEmployees] ([XboxEmployeesID], [GameID], [EmployeeID]) VALUES (4, 3, 3)
INSERT [dbo].[XboxEmployees] ([XboxEmployeesID], [GameID], [EmployeeID]) VALUES (5, 4, 4)
INSERT [dbo].[XboxEmployees] ([XboxEmployeesID], [GameID], [EmployeeID]) VALUES (6, 5, 5)
INSERT [dbo].[XboxEmployees] ([XboxEmployeesID], [GameID], [EmployeeID]) VALUES (7, 6, 6)
INSERT [dbo].[XboxEmployees] ([XboxEmployeesID], [GameID], [EmployeeID]) VALUES (8, 7, 7)
INSERT [dbo].[XboxEmployees] ([XboxEmployeesID], [GameID], [EmployeeID]) VALUES (9, 8, 8)
INSERT [dbo].[XboxEmployees] ([XboxEmployeesID], [GameID], [EmployeeID]) VALUES (10, 9, 9)
INSERT [dbo].[XboxEmployees] ([XboxEmployeesID], [GameID], [EmployeeID]) VALUES (11, 10, 10)
INSERT [dbo].[XboxEmployees] ([XboxEmployeesID], [GameID], [EmployeeID]) VALUES (12, 11, 11)
INSERT [dbo].[XboxEmployees] ([XboxEmployeesID], [GameID], [EmployeeID]) VALUES (13, 12, 12)
INSERT [dbo].[XboxEmployees] ([XboxEmployeesID], [GameID], [EmployeeID]) VALUES (14, 13, 13)
INSERT [dbo].[XboxEmployees] ([XboxEmployeesID], [GameID], [EmployeeID]) VALUES (15, 14, 14)
INSERT [dbo].[XboxEmployees] ([XboxEmployeesID], [GameID], [EmployeeID]) VALUES (16, 15, 15)
INSERT [dbo].[XboxEmployees] ([XboxEmployeesID], [GameID], [EmployeeID]) VALUES (17, 16, 16)
SET IDENTITY_INSERT [dbo].[XboxEmployees] OFF
SET IDENTITY_INSERT [dbo].[XboxStatuses] ON 

INSERT [dbo].[XboxStatuses] ([XboxStatusID], [Status]) VALUES (1, N'OutOfStock')
INSERT [dbo].[XboxStatuses] ([XboxStatusID], [Status]) VALUES (2, N'InStock')
INSERT [dbo].[XboxStatuses] ([XboxStatusID], [Status]) VALUES (3, N'On Backorder')
INSERT [dbo].[XboxStatuses] ([XboxStatusID], [Status]) VALUES (4, N'Discontinued')
SET IDENTITY_INSERT [dbo].[XboxStatuses] OFF
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Xbox_Department''s]') AND parent_object_id = OBJECT_ID(N'[dbo].[Xbox]'))
ALTER TABLE [dbo].[Xbox]  WITH CHECK ADD  CONSTRAINT [FK_Xbox_Department's] FOREIGN KEY([DepartmentsID])
REFERENCES [dbo].[Department's] ([DepartmentsID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Xbox_Department''s]') AND parent_object_id = OBJECT_ID(N'[dbo].[Xbox]'))
ALTER TABLE [dbo].[Xbox] CHECK CONSTRAINT [FK_Xbox_Department's]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Xbox_XboxAccessories]') AND parent_object_id = OBJECT_ID(N'[dbo].[Xbox]'))
ALTER TABLE [dbo].[Xbox]  WITH CHECK ADD  CONSTRAINT [FK_Xbox_XboxAccessories] FOREIGN KEY([AccessoriesID])
REFERENCES [dbo].[XboxAccessories] ([AccessoriesID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Xbox_XboxAccessories]') AND parent_object_id = OBJECT_ID(N'[dbo].[Xbox]'))
ALTER TABLE [dbo].[Xbox] CHECK CONSTRAINT [FK_Xbox_XboxAccessories]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Xbox_XboxStatuses]') AND parent_object_id = OBJECT_ID(N'[dbo].[Xbox]'))
ALTER TABLE [dbo].[Xbox]  WITH CHECK ADD  CONSTRAINT [FK_Xbox_XboxStatuses] FOREIGN KEY([XboxStatusID])
REFERENCES [dbo].[XboxStatuses] ([XboxStatusID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Xbox_XboxStatuses]') AND parent_object_id = OBJECT_ID(N'[dbo].[Xbox]'))
ALTER TABLE [dbo].[Xbox] CHECK CONSTRAINT [FK_Xbox_XboxStatuses]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_XboxEmployees_Employee''s]') AND parent_object_id = OBJECT_ID(N'[dbo].[XboxEmployees]'))
ALTER TABLE [dbo].[XboxEmployees]  WITH CHECK ADD  CONSTRAINT [FK_XboxEmployees_Employee's] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee's] ([EmployeeID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_XboxEmployees_Employee''s]') AND parent_object_id = OBJECT_ID(N'[dbo].[XboxEmployees]'))
ALTER TABLE [dbo].[XboxEmployees] CHECK CONSTRAINT [FK_XboxEmployees_Employee's]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_XboxEmployees_Games]') AND parent_object_id = OBJECT_ID(N'[dbo].[XboxEmployees]'))
ALTER TABLE [dbo].[XboxEmployees]  WITH CHECK ADD  CONSTRAINT [FK_XboxEmployees_Games] FOREIGN KEY([GameID])
REFERENCES [dbo].[Games] ([GameID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_XboxEmployees_Games]') AND parent_object_id = OBJECT_ID(N'[dbo].[XboxEmployees]'))
ALTER TABLE [dbo].[XboxEmployees] CHECK CONSTRAINT [FK_XboxEmployees_Games]
GO
ALTER DATABASE [StoreFrontProject] SET  READ_WRITE 
GO
