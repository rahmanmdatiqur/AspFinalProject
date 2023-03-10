USE [master]
GO
/****** Object:  Database [HMSB]    Script Date: 11/20/2022 11:31:41 AM ******/
CREATE DATABASE [HMSB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HMSB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\HMSB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HMSB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\HMSB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HMSB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HMSB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HMSB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HMSB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HMSB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HMSB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HMSB] SET ARITHABORT OFF 
GO
ALTER DATABASE [HMSB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HMSB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HMSB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HMSB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HMSB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HMSB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HMSB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HMSB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HMSB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HMSB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HMSB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HMSB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HMSB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HMSB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HMSB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HMSB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HMSB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HMSB] SET RECOVERY FULL 
GO
ALTER DATABASE [HMSB] SET  MULTI_USER 
GO
ALTER DATABASE [HMSB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HMSB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HMSB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HMSB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HMSB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HMSB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'HMSB', N'ON'
GO
ALTER DATABASE [HMSB] SET QUERY_STORE = OFF
GO
USE [HMSB]
GO
/****** Object:  Table [dbo].[BloodGroup]    Script Date: 11/20/2022 11:31:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BloodGroup](
	[bg_id] [int] IDENTITY(1,1) NOT NULL,
	[bloodgroup] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[bg_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Disese]    Script Date: 11/20/2022 11:31:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Disese](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[d_Name] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doctors]    Script Date: 11/20/2022 11:31:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doctors](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[bg_id] [int] NOT NULL,
	[contact] [nvarchar](20) NOT NULL,
	[email] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 11/20/2022 11:31:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pName] [nvarchar](50) NOT NULL,
	[joinDate] [date] NOT NULL,
	[bg_id] [int] NOT NULL,
	[d_Id] [int] NOT NULL,
	[picture] [nvarchar](200) NULL,
	[isActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BloodGroup] ON 

INSERT [dbo].[BloodGroup] ([bg_id], [bloodgroup]) VALUES (1, N'A+')
INSERT [dbo].[BloodGroup] ([bg_id], [bloodgroup]) VALUES (2, N'A+')
INSERT [dbo].[BloodGroup] ([bg_id], [bloodgroup]) VALUES (6, N'O-')
INSERT [dbo].[BloodGroup] ([bg_id], [bloodgroup]) VALUES (7, N'B+')
INSERT [dbo].[BloodGroup] ([bg_id], [bloodgroup]) VALUES (8, N'AB+')
INSERT [dbo].[BloodGroup] ([bg_id], [bloodgroup]) VALUES (9, N'AB-')
INSERT [dbo].[BloodGroup] ([bg_id], [bloodgroup]) VALUES (10, N'A-')
INSERT [dbo].[BloodGroup] ([bg_id], [bloodgroup]) VALUES (11, N'O+')
SET IDENTITY_INSERT [dbo].[BloodGroup] OFF
GO
SET IDENTITY_INSERT [dbo].[Disese] ON 

INSERT [dbo].[Disese] ([id], [d_Name]) VALUES (2, N'Fever')
INSERT [dbo].[Disese] ([id], [d_Name]) VALUES (5, N'Covid_19')
INSERT [dbo].[Disese] ([id], [d_Name]) VALUES (6, N'Alergy')
INSERT [dbo].[Disese] ([id], [d_Name]) VALUES (7, N'CAD')
INSERT [dbo].[Disese] ([id], [d_Name]) VALUES (8, N'Stroke')
INSERT [dbo].[Disese] ([id], [d_Name]) VALUES (9, N'Respiratory illness')
INSERT [dbo].[Disese] ([id], [d_Name]) VALUES (10, N'COPD')
INSERT [dbo].[Disese] ([id], [d_Name]) VALUES (11, N'Cancers')
INSERT [dbo].[Disese] ([id], [d_Name]) VALUES (12, N'Diabetes')
INSERT [dbo].[Disese] ([id], [d_Name]) VALUES (14, N'Diarrhea')
SET IDENTITY_INSERT [dbo].[Disese] OFF
GO
SET IDENTITY_INSERT [dbo].[doctors] ON 

INSERT [dbo].[doctors] ([id], [name], [bg_id], [contact], [email]) VALUES (1, N'Faruk', 1, N'0164455632', N'faruk@gmail.com')
SET IDENTITY_INSERT [dbo].[doctors] OFF
GO
SET IDENTITY_INSERT [dbo].[Patient] ON 

INSERT [dbo].[Patient] ([id], [pName], [joinDate], [bg_id], [d_Id], [picture], [isActive]) VALUES (9, N'Kalam Khan', CAST(N'2022-11-09' AS Date), 2, 2, N'881f6ce5-25ed-46bb-8253-e9ac0b125015_.jpg', 1)
INSERT [dbo].[Patient] ([id], [pName], [joinDate], [bg_id], [d_Id], [picture], [isActive]) VALUES (10, N'Faruk', CAST(N'2022-12-10' AS Date), 2, 5, N'52d41e85-f26c-4517-84c6-8cfef2d32cac_.jpg', 1)
INSERT [dbo].[Patient] ([id], [pName], [joinDate], [bg_id], [d_Id], [picture], [isActive]) VALUES (11, N'Hasan', CAST(N'2022-11-16' AS Date), 6, 7, N'e88f82e4-61f8-478e-8523-e632831c3bc5_.jpg', 1)
INSERT [dbo].[Patient] ([id], [pName], [joinDate], [bg_id], [d_Id], [picture], [isActive]) VALUES (12, N'Zinat Ara', CAST(N'2022-11-04' AS Date), 8, 6, N'02b834b3-14c1-4f83-90c8-0ae7ae9af6df_.jpg', 1)
INSERT [dbo].[Patient] ([id], [pName], [joinDate], [bg_id], [d_Id], [picture], [isActive]) VALUES (14, N'Rahul', CAST(N'2022-11-16' AS Date), 11, 11, N'7a213c33-6b5b-4adb-b0a1-c6097f0eb055_.jpg', 1)
INSERT [dbo].[Patient] ([id], [pName], [joinDate], [bg_id], [d_Id], [picture], [isActive]) VALUES (15, N'Akash Khan', CAST(N'2022-11-08' AS Date), 7, 14, N'eaf20922-926f-4423-81a5-c058a4475807_.jpg', 1)
INSERT [dbo].[Patient] ([id], [pName], [joinDate], [bg_id], [d_Id], [picture], [isActive]) VALUES (16, N'Nazia Sultana', CAST(N'2022-12-07' AS Date), 9, 10, N'b52567f2-a8cc-4bb0-b674-12ab21791c10_.jpg', 1)
INSERT [dbo].[Patient] ([id], [pName], [joinDate], [bg_id], [d_Id], [picture], [isActive]) VALUES (17, N'Abdullah', CAST(N'2022-11-15' AS Date), 11, 8, N'2f3dbfc3-9d25-41cd-b272-9adae96e2fa9_.jpg', 1)
INSERT [dbo].[Patient] ([id], [pName], [joinDate], [bg_id], [d_Id], [picture], [isActive]) VALUES (18, N'Raha ', CAST(N'2022-11-27' AS Date), 9, 12, N'418684f2-6554-4076-8349-b753596d872d_.jpg', 1)
INSERT [dbo].[Patient] ([id], [pName], [joinDate], [bg_id], [d_Id], [picture], [isActive]) VALUES (19, N'Rafat Khan', CAST(N'2022-11-22' AS Date), 11, 6, N'60e5b067-f910-4d86-83ad-542a1d154ea7_.jpg', 1)
INSERT [dbo].[Patient] ([id], [pName], [joinDate], [bg_id], [d_Id], [picture], [isActive]) VALUES (20, N'Safina Khatun', CAST(N'2022-12-07' AS Date), 8, 7, N'650f5ce7-b8a8-4299-b391-905ea20ca655_.jpg', 1)
INSERT [dbo].[Patient] ([id], [pName], [joinDate], [bg_id], [d_Id], [picture], [isActive]) VALUES (21, N'Razzak', CAST(N'2022-11-01' AS Date), 6, 12, N'1efc0b65-3667-49d8-970f-b186288b994f_.jpg', 1)
SET IDENTITY_INSERT [dbo].[Patient] OFF
GO
ALTER TABLE [dbo].[doctors]  WITH CHECK ADD FOREIGN KEY([bg_id])
REFERENCES [dbo].[BloodGroup] ([bg_id])
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD FOREIGN KEY([bg_id])
REFERENCES [dbo].[BloodGroup] ([bg_id])
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD FOREIGN KEY([bg_id])
REFERENCES [dbo].[BloodGroup] ([bg_id])
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD FOREIGN KEY([d_Id])
REFERENCES [dbo].[Disese] ([id])
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD FOREIGN KEY([d_Id])
REFERENCES [dbo].[Disese] ([id])
GO
USE [master]
GO
ALTER DATABASE [HMSB] SET  READ_WRITE 
GO
