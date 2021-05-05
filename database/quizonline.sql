USE [master]
GO
/****** Object:  Database [quizonline]    Script Date: 05/05/2021 2:14:25 CH ******/
CREATE DATABASE [quizonline]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'quizonline', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\quizonline.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'quizonline_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\quizonline_log.ldf' , SIZE = 139264KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [quizonline] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [quizonline].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [quizonline] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [quizonline] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [quizonline] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [quizonline] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [quizonline] SET ARITHABORT OFF 
GO
ALTER DATABASE [quizonline] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [quizonline] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [quizonline] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [quizonline] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [quizonline] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [quizonline] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [quizonline] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [quizonline] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [quizonline] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [quizonline] SET  ENABLE_BROKER 
GO
ALTER DATABASE [quizonline] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [quizonline] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [quizonline] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [quizonline] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [quizonline] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [quizonline] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [quizonline] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [quizonline] SET RECOVERY FULL 
GO
ALTER DATABASE [quizonline] SET  MULTI_USER 
GO
ALTER DATABASE [quizonline] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [quizonline] SET DB_CHAINING OFF 
GO
ALTER DATABASE [quizonline] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [quizonline] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [quizonline] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'quizonline', N'ON'
GO
ALTER DATABASE [quizonline] SET QUERY_STORE = OFF
GO
USE [quizonline]
GO
/****** Object:  Table [dbo].[account]    Script Date: 05/05/2021 2:14:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](250) NOT NULL,
	[fullname] [varchar](250) NOT NULL,
	[photo] [varchar](250) NULL,
	[email] [varchar](250) NOT NULL,
	[phone] [varchar](12) NOT NULL,
	[address] [varchar](250) NULL,
	[isActive] [int] NOT NULL,
	[otp] [varchar](10) NULL,
	[account_Type] [int] NOT NULL,
	[created_Date] [date] NOT NULL,
	[created_By] [int] NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[account_exam]    Script Date: 05/05/2021 2:14:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account_exam](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[account_Id] [int] NOT NULL,
	[exam_Id] [int] NOT NULL,
	[score] [decimal](5, 1) NOT NULL,
	[answer_correct] [int] NULL,
	[answer_uncorrect] [int] NULL,
	[created_Date] [date] NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_account_exam] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[answer]    Script Date: 05/05/2021 2:14:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[answer](
	[id] [int] NOT NULL,
	[content] [varchar](250) NOT NULL,
	[iscorrect] [bit] NOT NULL,
	[question_Id] [int] NOT NULL,
	[created_Date] [date] NOT NULL,
	[created_By] [int] NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_answer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[exam]    Script Date: 05/05/2021 2:14:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exam](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](100) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[status] [int] NOT NULL,
	[created_Date] [date] NOT NULL,
	[created_By] [int] NOT NULL,
	[level_Id] [int] NOT NULL,
	[subject_Id] [int] NOT NULL,
 CONSTRAINT [PK_exam] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[exam_question]    Script Date: 05/05/2021 2:14:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exam_question](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[exam_Id] [int] NOT NULL,
	[question_Id] [int] NOT NULL,
	[created_Date] [date] NOT NULL,
	[created_By] [int] NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_exam_question] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[level]    Script Date: 05/05/2021 2:14:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[level](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[created_Date] [date] NOT NULL,
	[created_By] [int] NOT NULL,
	[stt] [int] NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_level] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[question]    Script Date: 05/05/2021 2:14:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[question](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[content] [varchar](max) NOT NULL,
	[answer_Type] [int] NULL,
	[image] [varchar](100) NULL,
	[score] [decimal](5, 1) NOT NULL,
	[created_Date] [date] NOT NULL,
	[created_By] [int] NOT NULL,
	[status] [int] NOT NULL,
	[level_Id] [int] NOT NULL,
	[subject_Id] [int] NOT NULL,
 CONSTRAINT [PK_question] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_answer]    Script Date: 05/05/2021 2:14:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_answer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created_Date] [date] NOT NULL,
	[created_By] [int] NOT NULL,
	[answer_Id] [int] NULL,
	[answer_Ids] [nvarchar](10) NULL,
	[account_Id] [int] NOT NULL,
	[exam_question_Id] [int] NOT NULL,
 CONSTRAINT [PK_student_answer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subject]    Script Date: 05/05/2021 2:14:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subject](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](250) NOT NULL,
	[created_Date] [date] NOT NULL,
	[image] [varchar](250) NULL,
	[created_By] [int] NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_subject] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[account] ON 

INSERT [dbo].[account] ([id], [username], [password], [fullname], [photo], [email], [phone], [address], [isActive], [otp], [account_Type], [created_Date], [created_By], [status]) VALUES (1, N'admin', N'$2a$10$Ot0Pg3dk/qIZ.mLKIJ9meeNCZDV3fdUpGePNXzOOW4eYjipgIB.SS', N'Admin', N' ', N'admin@gmail.com', N'0868946944', N'Tay Ninh', 1, NULL, 1, CAST(N'2021-04-25' AS Date), 1, 1)
INSERT [dbo].[account] ([id], [username], [password], [fullname], [photo], [email], [phone], [address], [isActive], [otp], [account_Type], [created_Date], [created_By], [status]) VALUES (3, N'student', N'$2a$10$Ot0Pg3dk/qIZ.mLKIJ9meeNCZDV3fdUpGePNXzOOW4eYjipgIB.SS', N'Student', N' ', N'student@gmail.com', N'0868946944', N'Tay Ninh', 1, NULL, 2, CAST(N'2021-04-25' AS Date), 1, 1)
INSERT [dbo].[account] ([id], [username], [password], [fullname], [photo], [email], [phone], [address], [isActive], [otp], [account_Type], [created_Date], [created_By], [status]) VALUES (5, N'student2', N'$2a$10$Ot0Pg3dk/qIZ.mLKIJ9meeNCZDV3fdUpGePNXzOOW4eYjipgIB.SS', N'Student 2', N'', N'student2@gmail.com', N'0868946944', N'tay Ninh', 1, NULL, 2, CAST(N'2021-04-25' AS Date), 1, 1)
SET IDENTITY_INSERT [dbo].[account] OFF
GO
SET IDENTITY_INSERT [dbo].[account_exam] ON 

INSERT [dbo].[account_exam] ([id], [account_Id], [exam_Id], [score], [answer_correct], [answer_uncorrect], [created_Date], [status]) VALUES (8, 5, 17, CAST(0.0 AS Decimal(5, 1)), 0, 5, CAST(N'2021-05-05' AS Date), 1)
SET IDENTITY_INSERT [dbo].[account_exam] OFF
GO
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (2, N'answer_1_4', 1, 4, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (3, N'answer_2_4', 0, 4, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (4, N'answer_3_4', 0, 4, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (5, N'answer_4_4', 0, 4, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (6, N'answer_1_5', 1, 5, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (7, N'answer_2_5', 0, 5, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (8, N'answer_3_5', 0, 5, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (9, N'answer_4_5', 0, 5, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (10, N'answer_1_6', 1, 6, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (11, N'answer_2_6', 0, 6, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (12, N'answer_3_6', 0, 6, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (13, N'answer_4_6', 0, 6, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (14, N'answer_1_7', 1, 7, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (15, N'answer_2_7', 0, 7, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (16, N'answer_3_7', 0, 7, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (17, N'answer_4_7', 0, 7, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (18, N'answer_1_8', 1, 8, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (19, N'answer_2_8', 0, 8, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (20, N'answer_3_8', 0, 8, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (21, N'answer_4_8', 0, 8, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (22, N'answer_1_9', 1, 9, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (23, N'answer_2_9', 0, 9, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (24, N'answer_3_9', 0, 9, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (25, N'answer_4_9', 0, 9, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (26, N'answer_1_10', 1, 10, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (27, N'answer_2_10', 0, 10, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (28, N'answer_3_10', 0, 10, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (29, N'answer_4_10', 0, 10, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (30, N'answer_1_11', 1, 11, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (31, N'answer_2_11', 0, 11, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (32, N'answer_3_11', 0, 11, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (33, N'answer_4_11', 0, 11, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (34, N'answer_1_12', 1, 12, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (35, N'answer_2_12', 0, 12, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (36, N'answer_3_12', 0, 12, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (37, N'answer_4_12', 0, 12, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (38, N'answer_1_13', 1, 13, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (39, N'answer_2_13', 0, 13, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (40, N'answer_3_13', 0, 13, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (41, N'answer_4_13', 0, 13, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (42, N'answer_1_14', 1, 14, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (43, N'answer_2_14', 0, 14, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (44, N'answer_3_14', 0, 14, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (45, N'answer_4_14', 0, 14, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (46, N'answer_1_15', 1, 15, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (47, N'answer_2_15', 0, 15, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (48, N'answer_3_15', 0, 15, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (49, N'answer_4_15', 0, 15, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (50, N'answer_1_16', 1, 16, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (51, N'answer_2_16', 0, 16, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (52, N'answer_3_16', 0, 16, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (53, N'answer_4_16', 0, 16, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (54, N'answer_1_17', 1, 17, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (55, N'answer_2_17', 0, 17, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (56, N'answer_3_17', 0, 17, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (57, N'answer_4_17', 0, 17, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (58, N'answer_1_18', 1, 18, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (59, N'answer_2_18', 0, 18, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (60, N'answer_3_18', 0, 18, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (61, N'answer_4_18', 0, 18, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (62, N'answer_1_19', 1, 19, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (63, N'answer_2_19', 0, 19, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (64, N'answer_3_19', 0, 19, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (65, N'answer_4_19', 0, 19, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (66, N'answer_1_20', 1, 20, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (67, N'answer_2_20', 0, 20, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (68, N'answer_3_20', 0, 20, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (69, N'answer_4_20', 0, 20, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (70, N'answer_1_21', 1, 21, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (71, N'answer_2_21', 0, 21, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (72, N'answer_3_21', 0, 21, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (73, N'answer_4_21', 0, 21, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (74, N'answer_1_22', 1, 22, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (75, N'answer_2_22', 0, 22, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (76, N'answer_3_22', 0, 22, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (77, N'answer_4_22', 0, 22, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (78, N'answer_1_23', 1, 23, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (79, N'answer_2_23', 0, 23, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (80, N'answer_3_23', 0, 23, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (81, N'answer_4_23', 0, 23, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (82, N'answer_1_24', 1, 24, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (83, N'answer_2_24', 0, 24, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (84, N'answer_3_24', 0, 24, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (85, N'answer_4_24', 0, 24, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (86, N'answer_1_25', 1, 25, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (87, N'answer_2_25', 0, 25, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (88, N'answer_3_25', 0, 25, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (89, N'answer_4_25', 0, 25, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (90, N'answer_1_26', 1, 26, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (91, N'answer_2_26', 0, 26, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (92, N'answer_3_26', 0, 26, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (93, N'answer_4_26', 0, 26, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (94, N'answer_1_27', 1, 27, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (95, N'answer_2_27', 0, 27, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (96, N'answer_3_27', 0, 27, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (97, N'answer_4_27', 0, 27, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (98, N'answer_1_28', 1, 28, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (99, N'answer_2_28', 0, 28, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (100, N'answer_3_28', 0, 28, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (101, N'answer_4_28', 0, 28, CAST(N'2021-04-26' AS Date), 1, 1)
GO
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (102, N'answer_1_29', 1, 29, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (103, N'answer_2_29', 0, 29, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (104, N'answer_3_29', 0, 29, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (105, N'answer_4_29', 0, 29, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (106, N'answer_1_30', 1, 30, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (107, N'answer_2_30', 0, 30, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (108, N'answer_3_30', 0, 30, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (109, N'answer_4_30', 0, 30, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (110, N'answer_1_31', 1, 31, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (111, N'answer_2_31', 0, 31, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (112, N'answer_3_31', 0, 31, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (113, N'answer_4_31', 0, 31, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (114, N'answer_1_32', 1, 32, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (115, N'answer_2_32', 0, 32, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (116, N'answer_3_32', 0, 32, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (117, N'answer_4_32', 0, 32, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (118, N'answer_1_33', 1, 33, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (119, N'answer_2_33', 0, 33, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (120, N'answer_3_33', 0, 33, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (121, N'answer_4_33', 0, 33, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (122, N'answer_1_34', 1, 34, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (123, N'answer_2_34', 0, 34, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (124, N'answer_3_34', 0, 34, CAST(N'2021-04-26' AS Date), 1, 1)
INSERT [dbo].[answer] ([id], [content], [iscorrect], [question_Id], [created_Date], [created_By], [status]) VALUES (125, N'answer_4_34', 0, 34, CAST(N'2021-04-26' AS Date), 1, 1)
GO
SET IDENTITY_INSERT [dbo].[exam] ON 

INSERT [dbo].[exam] ([id], [code], [name], [status], [created_Date], [created_By], [level_Id], [subject_Id]) VALUES (17, N'EX00017', N'Exam 05/05/2021', 1, CAST(N'2021-05-05' AS Date), 1, 2, 2)
INSERT [dbo].[exam] ([id], [code], [name], [status], [created_Date], [created_By], [level_Id], [subject_Id]) VALUES (18, N'EX00018', N'Exam 05/05/2021', 1, CAST(N'2021-05-05' AS Date), 1, 2, 1)
INSERT [dbo].[exam] ([id], [code], [name], [status], [created_Date], [created_By], [level_Id], [subject_Id]) VALUES (19, N'EX00019', N'Exam 05/05/2021', 1, CAST(N'2021-05-05' AS Date), 1, 2, 1)
SET IDENTITY_INSERT [dbo].[exam] OFF
GO
SET IDENTITY_INSERT [dbo].[exam_question] ON 

INSERT [dbo].[exam_question] ([id], [exam_Id], [question_Id], [created_Date], [created_By], [status]) VALUES (31, 17, 17, CAST(N'2021-05-05' AS Date), 1, 1)
INSERT [dbo].[exam_question] ([id], [exam_Id], [question_Id], [created_Date], [created_By], [status]) VALUES (32, 17, 23, CAST(N'2021-05-05' AS Date), 1, 1)
INSERT [dbo].[exam_question] ([id], [exam_Id], [question_Id], [created_Date], [created_By], [status]) VALUES (33, 17, 29, CAST(N'2021-05-05' AS Date), 1, 1)
INSERT [dbo].[exam_question] ([id], [exam_Id], [question_Id], [created_Date], [created_By], [status]) VALUES (34, 17, 20, CAST(N'2021-05-05' AS Date), 1, 1)
INSERT [dbo].[exam_question] ([id], [exam_Id], [question_Id], [created_Date], [created_By], [status]) VALUES (35, 17, 16, CAST(N'2021-05-05' AS Date), 1, 1)
SET IDENTITY_INSERT [dbo].[exam_question] OFF
GO
SET IDENTITY_INSERT [dbo].[level] ON 

INSERT [dbo].[level] ([id], [name], [created_Date], [created_By], [stt], [status]) VALUES (2, N'Easy', CAST(N'2021-04-25' AS Date), 1, 1, 1)
INSERT [dbo].[level] ([id], [name], [created_Date], [created_By], [stt], [status]) VALUES (3, N'Medium', CAST(N'2021-04-25' AS Date), 1, 2, 1)
INSERT [dbo].[level] ([id], [name], [created_Date], [created_By], [stt], [status]) VALUES (6, N'Advanced', CAST(N'2021-04-25' AS Date), 1, 3, 1)
SET IDENTITY_INSERT [dbo].[level] OFF
GO
SET IDENTITY_INSERT [dbo].[question] ON 

INSERT [dbo].[question] ([id], [content], [answer_Type], [image], [score], [created_Date], [created_By], [status], [level_Id], [subject_Id]) VALUES (4, N'question 1', 1, NULL, CAST(1.0 AS Decimal(5, 1)), CAST(N'2021-04-26' AS Date), 1, 1, 2, 2)
INSERT [dbo].[question] ([id], [content], [answer_Type], [image], [score], [created_Date], [created_By], [status], [level_Id], [subject_Id]) VALUES (5, N'question 1', 1, NULL, CAST(1.0 AS Decimal(5, 1)), CAST(N'2021-04-26' AS Date), 1, 1, 2, 2)
INSERT [dbo].[question] ([id], [content], [answer_Type], [image], [score], [created_Date], [created_By], [status], [level_Id], [subject_Id]) VALUES (6, N'question 1', 1, NULL, CAST(1.0 AS Decimal(5, 1)), CAST(N'2021-04-26' AS Date), 1, 1, 2, 2)
INSERT [dbo].[question] ([id], [content], [answer_Type], [image], [score], [created_Date], [created_By], [status], [level_Id], [subject_Id]) VALUES (7, N'question 1', 1, NULL, CAST(1.0 AS Decimal(5, 1)), CAST(N'2021-04-26' AS Date), 1, 1, 2, 2)
INSERT [dbo].[question] ([id], [content], [answer_Type], [image], [score], [created_Date], [created_By], [status], [level_Id], [subject_Id]) VALUES (8, N'question 2', 1, NULL, CAST(1.0 AS Decimal(5, 1)), CAST(N'2021-04-26' AS Date), 1, 1, 3, 2)
INSERT [dbo].[question] ([id], [content], [answer_Type], [image], [score], [created_Date], [created_By], [status], [level_Id], [subject_Id]) VALUES (9, N'question 3', 1, NULL, CAST(1.0 AS Decimal(5, 1)), CAST(N'2021-04-26' AS Date), 1, 1, 6, 2)
INSERT [dbo].[question] ([id], [content], [answer_Type], [image], [score], [created_Date], [created_By], [status], [level_Id], [subject_Id]) VALUES (10, N'question 4', 1, NULL, CAST(1.0 AS Decimal(5, 1)), CAST(N'2021-04-26' AS Date), 1, 1, 3, 2)
INSERT [dbo].[question] ([id], [content], [answer_Type], [image], [score], [created_Date], [created_By], [status], [level_Id], [subject_Id]) VALUES (11, N'question 5', 1, NULL, CAST(1.0 AS Decimal(5, 1)), CAST(N'2021-04-26' AS Date), 1, 1, 3, 2)
INSERT [dbo].[question] ([id], [content], [answer_Type], [image], [score], [created_Date], [created_By], [status], [level_Id], [subject_Id]) VALUES (12, N'question 6', 1, NULL, CAST(1.0 AS Decimal(5, 1)), CAST(N'2021-04-26' AS Date), 1, 1, 3, 2)
INSERT [dbo].[question] ([id], [content], [answer_Type], [image], [score], [created_Date], [created_By], [status], [level_Id], [subject_Id]) VALUES (13, N'question 7', 1, NULL, CAST(1.0 AS Decimal(5, 1)), CAST(N'2021-04-26' AS Date), 1, 1, 3, 2)
INSERT [dbo].[question] ([id], [content], [answer_Type], [image], [score], [created_Date], [created_By], [status], [level_Id], [subject_Id]) VALUES (14, N'question 8', 1, NULL, CAST(1.0 AS Decimal(5, 1)), CAST(N'2021-04-26' AS Date), 1, 1, 3, 2)
INSERT [dbo].[question] ([id], [content], [answer_Type], [image], [score], [created_Date], [created_By], [status], [level_Id], [subject_Id]) VALUES (15, N'question 9', 1, NULL, CAST(1.0 AS Decimal(5, 1)), CAST(N'2021-04-26' AS Date), 1, 1, 6, 2)
INSERT [dbo].[question] ([id], [content], [answer_Type], [image], [score], [created_Date], [created_By], [status], [level_Id], [subject_Id]) VALUES (16, N'question 10', 1, NULL, CAST(1.0 AS Decimal(5, 1)), CAST(N'2021-04-26' AS Date), 1, 1, 2, 2)
INSERT [dbo].[question] ([id], [content], [answer_Type], [image], [score], [created_Date], [created_By], [status], [level_Id], [subject_Id]) VALUES (17, N'question 11', 1, NULL, CAST(1.0 AS Decimal(5, 1)), CAST(N'2021-04-26' AS Date), 1, 1, 2, 2)
INSERT [dbo].[question] ([id], [content], [answer_Type], [image], [score], [created_Date], [created_By], [status], [level_Id], [subject_Id]) VALUES (18, N'question 12', 1, NULL, CAST(1.0 AS Decimal(5, 1)), CAST(N'2021-04-26' AS Date), 1, 1, 6, 2)
INSERT [dbo].[question] ([id], [content], [answer_Type], [image], [score], [created_Date], [created_By], [status], [level_Id], [subject_Id]) VALUES (19, N'question 13', 1, NULL, CAST(1.0 AS Decimal(5, 1)), CAST(N'2021-04-26' AS Date), 1, 1, 3, 2)
INSERT [dbo].[question] ([id], [content], [answer_Type], [image], [score], [created_Date], [created_By], [status], [level_Id], [subject_Id]) VALUES (20, N'question 14', 1, NULL, CAST(1.0 AS Decimal(5, 1)), CAST(N'2021-04-26' AS Date), 1, 1, 2, 2)
INSERT [dbo].[question] ([id], [content], [answer_Type], [image], [score], [created_Date], [created_By], [status], [level_Id], [subject_Id]) VALUES (21, N'question 15', 1, NULL, CAST(1.0 AS Decimal(5, 1)), CAST(N'2021-04-26' AS Date), 1, 1, 2, 2)
INSERT [dbo].[question] ([id], [content], [answer_Type], [image], [score], [created_Date], [created_By], [status], [level_Id], [subject_Id]) VALUES (22, N'question 16', 1, NULL, CAST(1.0 AS Decimal(5, 1)), CAST(N'2021-04-26' AS Date), 1, 1, 3, 2)
INSERT [dbo].[question] ([id], [content], [answer_Type], [image], [score], [created_Date], [created_By], [status], [level_Id], [subject_Id]) VALUES (23, N'question 17', 2, NULL, CAST(1.0 AS Decimal(5, 1)), CAST(N'2021-04-26' AS Date), 1, 1, 2, 2)
INSERT [dbo].[question] ([id], [content], [answer_Type], [image], [score], [created_Date], [created_By], [status], [level_Id], [subject_Id]) VALUES (24, N'question 18', 1, NULL, CAST(1.0 AS Decimal(5, 1)), CAST(N'2021-04-26' AS Date), 1, 1, 6, 2)
INSERT [dbo].[question] ([id], [content], [answer_Type], [image], [score], [created_Date], [created_By], [status], [level_Id], [subject_Id]) VALUES (25, N'question 19', 1, NULL, CAST(1.0 AS Decimal(5, 1)), CAST(N'2021-04-26' AS Date), 1, 1, 2, 2)
INSERT [dbo].[question] ([id], [content], [answer_Type], [image], [score], [created_Date], [created_By], [status], [level_Id], [subject_Id]) VALUES (26, N'question 20', 1, NULL, CAST(1.0 AS Decimal(5, 1)), CAST(N'2021-04-26' AS Date), 1, 1, 2, 2)
INSERT [dbo].[question] ([id], [content], [answer_Type], [image], [score], [created_Date], [created_By], [status], [level_Id], [subject_Id]) VALUES (27, N'question 21', 1, NULL, CAST(1.0 AS Decimal(5, 1)), CAST(N'2021-04-26' AS Date), 1, 1, 6, 2)
INSERT [dbo].[question] ([id], [content], [answer_Type], [image], [score], [created_Date], [created_By], [status], [level_Id], [subject_Id]) VALUES (28, N'question 22', 1, NULL, CAST(1.0 AS Decimal(5, 1)), CAST(N'2021-04-26' AS Date), 1, 1, 3, 2)
INSERT [dbo].[question] ([id], [content], [answer_Type], [image], [score], [created_Date], [created_By], [status], [level_Id], [subject_Id]) VALUES (29, N'question 23', 1, NULL, CAST(1.0 AS Decimal(5, 1)), CAST(N'2021-04-26' AS Date), 1, 1, 2, 2)
INSERT [dbo].[question] ([id], [content], [answer_Type], [image], [score], [created_Date], [created_By], [status], [level_Id], [subject_Id]) VALUES (30, N'question 24', 1, NULL, CAST(1.0 AS Decimal(5, 1)), CAST(N'2021-04-26' AS Date), 1, 1, 6, 2)
INSERT [dbo].[question] ([id], [content], [answer_Type], [image], [score], [created_Date], [created_By], [status], [level_Id], [subject_Id]) VALUES (31, N'question 25', 1, NULL, CAST(1.0 AS Decimal(5, 1)), CAST(N'2021-04-26' AS Date), 1, 1, 2, 2)
INSERT [dbo].[question] ([id], [content], [answer_Type], [image], [score], [created_Date], [created_By], [status], [level_Id], [subject_Id]) VALUES (32, N'question 26', 1, NULL, CAST(1.0 AS Decimal(5, 1)), CAST(N'2021-04-26' AS Date), 1, 1, 6, 2)
INSERT [dbo].[question] ([id], [content], [answer_Type], [image], [score], [created_Date], [created_By], [status], [level_Id], [subject_Id]) VALUES (33, N'question 27', 1, NULL, CAST(1.0 AS Decimal(5, 1)), CAST(N'2021-04-26' AS Date), 1, 1, 2, 2)
INSERT [dbo].[question] ([id], [content], [answer_Type], [image], [score], [created_Date], [created_By], [status], [level_Id], [subject_Id]) VALUES (34, N'question 28', 1, NULL, CAST(1.0 AS Decimal(5, 1)), CAST(N'2021-04-26' AS Date), 1, 1, 3, 2)
SET IDENTITY_INSERT [dbo].[question] OFF
GO
SET IDENTITY_INSERT [dbo].[student_answer] ON 

INSERT [dbo].[student_answer] ([id], [created_Date], [created_By], [answer_Id], [answer_Ids], [account_Id], [exam_question_Id]) VALUES (45, CAST(N'2021-05-05' AS Date), 5, 55, N'', 5, 31)
INSERT [dbo].[student_answer] ([id], [created_Date], [created_By], [answer_Id], [answer_Ids], [account_Id], [exam_question_Id]) VALUES (46, CAST(N'2021-05-05' AS Date), 5, 56, N'', 5, 31)
INSERT [dbo].[student_answer] ([id], [created_Date], [created_By], [answer_Id], [answer_Ids], [account_Id], [exam_question_Id]) VALUES (47, CAST(N'2021-05-05' AS Date), 5, 79, N'', 5, 32)
INSERT [dbo].[student_answer] ([id], [created_Date], [created_By], [answer_Id], [answer_Ids], [account_Id], [exam_question_Id]) VALUES (48, CAST(N'2021-05-05' AS Date), 5, 67, N'', 5, 34)
INSERT [dbo].[student_answer] ([id], [created_Date], [created_By], [answer_Id], [answer_Ids], [account_Id], [exam_question_Id]) VALUES (49, CAST(N'2021-05-05' AS Date), 5, 103, N'', 5, 33)
INSERT [dbo].[student_answer] ([id], [created_Date], [created_By], [answer_Id], [answer_Ids], [account_Id], [exam_question_Id]) VALUES (50, CAST(N'2021-05-05' AS Date), 5, 104, N'', 5, 33)
INSERT [dbo].[student_answer] ([id], [created_Date], [created_By], [answer_Id], [answer_Ids], [account_Id], [exam_question_Id]) VALUES (51, CAST(N'2021-05-05' AS Date), 5, 53, N'', 5, 35)
SET IDENTITY_INSERT [dbo].[student_answer] OFF
GO
SET IDENTITY_INSERT [dbo].[subject] ON 

INSERT [dbo].[subject] ([id], [name], [created_Date], [image], [created_By], [status]) VALUES (1, N'Subject 1', CAST(N'2021-04-26' AS Date), N'logo.png', 1, 1)
INSERT [dbo].[subject] ([id], [name], [created_Date], [image], [created_By], [status]) VALUES (2, N'Subject 2', CAST(N'2021-04-26' AS Date), N'logo.png', 1, 1)
INSERT [dbo].[subject] ([id], [name], [created_Date], [image], [created_By], [status]) VALUES (3, N'Subject 3', CAST(N'2021-04-26' AS Date), N'logo.png', 1, 1)
INSERT [dbo].[subject] ([id], [name], [created_Date], [image], [created_By], [status]) VALUES (4, N'Subject 4', CAST(N'2021-04-26' AS Date), N'logo.png', 1, 1)
INSERT [dbo].[subject] ([id], [name], [created_Date], [image], [created_By], [status]) VALUES (5, N'Subject 5', CAST(N'2021-04-26' AS Date), N'logo.png', 1, 1)
INSERT [dbo].[subject] ([id], [name], [created_Date], [image], [created_By], [status]) VALUES (6, N'Subject 6', CAST(N'2021-04-26' AS Date), N'logo.png', 1, 1)
INSERT [dbo].[subject] ([id], [name], [created_Date], [image], [created_By], [status]) VALUES (7, N'Subject 7', CAST(N'2021-04-26' AS Date), N'logo.png', 1, 1)
SET IDENTITY_INSERT [dbo].[subject] OFF
GO
ALTER TABLE [dbo].[answer] ADD  CONSTRAINT [DF__answer__iscorrec__25869641]  DEFAULT ((0)) FOR [iscorrect]
GO
ALTER TABLE [dbo].[question] ADD  CONSTRAINT [DF__question__answer__2A4B4B5E]  DEFAULT (NULL) FOR [answer_Type]
GO
ALTER TABLE [dbo].[student_answer] ADD  CONSTRAINT [DF__student_a__answe__2C3393D0]  DEFAULT (NULL) FOR [answer_Id]
GO
ALTER TABLE [dbo].[account_exam]  WITH CHECK ADD  CONSTRAINT [FK_account_exam_account] FOREIGN KEY([account_Id])
REFERENCES [dbo].[account] ([id])
GO
ALTER TABLE [dbo].[account_exam] CHECK CONSTRAINT [FK_account_exam_account]
GO
ALTER TABLE [dbo].[account_exam]  WITH CHECK ADD  CONSTRAINT [FK_account_exam_exam] FOREIGN KEY([exam_Id])
REFERENCES [dbo].[exam] ([id])
GO
ALTER TABLE [dbo].[account_exam] CHECK CONSTRAINT [FK_account_exam_exam]
GO
ALTER TABLE [dbo].[answer]  WITH CHECK ADD  CONSTRAINT [FK_answer_question] FOREIGN KEY([question_Id])
REFERENCES [dbo].[question] ([id])
GO
ALTER TABLE [dbo].[answer] CHECK CONSTRAINT [FK_answer_question]
GO
ALTER TABLE [dbo].[exam]  WITH CHECK ADD  CONSTRAINT [FK_exam_level] FOREIGN KEY([level_Id])
REFERENCES [dbo].[level] ([id])
GO
ALTER TABLE [dbo].[exam] CHECK CONSTRAINT [FK_exam_level]
GO
ALTER TABLE [dbo].[exam]  WITH CHECK ADD  CONSTRAINT [FK_exam_subject] FOREIGN KEY([subject_Id])
REFERENCES [dbo].[subject] ([id])
GO
ALTER TABLE [dbo].[exam] CHECK CONSTRAINT [FK_exam_subject]
GO
ALTER TABLE [dbo].[exam_question]  WITH CHECK ADD  CONSTRAINT [FK_exam_question_exam] FOREIGN KEY([exam_Id])
REFERENCES [dbo].[exam] ([id])
GO
ALTER TABLE [dbo].[exam_question] CHECK CONSTRAINT [FK_exam_question_exam]
GO
ALTER TABLE [dbo].[exam_question]  WITH CHECK ADD  CONSTRAINT [FK_exam_question_question] FOREIGN KEY([question_Id])
REFERENCES [dbo].[question] ([id])
GO
ALTER TABLE [dbo].[exam_question] CHECK CONSTRAINT [FK_exam_question_question]
GO
ALTER TABLE [dbo].[question]  WITH CHECK ADD  CONSTRAINT [FK_question_level] FOREIGN KEY([level_Id])
REFERENCES [dbo].[level] ([id])
GO
ALTER TABLE [dbo].[question] CHECK CONSTRAINT [FK_question_level]
GO
ALTER TABLE [dbo].[question]  WITH CHECK ADD  CONSTRAINT [FK_question_subject] FOREIGN KEY([subject_Id])
REFERENCES [dbo].[subject] ([id])
GO
ALTER TABLE [dbo].[question] CHECK CONSTRAINT [FK_question_subject]
GO
ALTER TABLE [dbo].[student_answer]  WITH CHECK ADD  CONSTRAINT [FK_student_answer_account] FOREIGN KEY([account_Id])
REFERENCES [dbo].[account] ([id])
GO
ALTER TABLE [dbo].[student_answer] CHECK CONSTRAINT [FK_student_answer_account]
GO
ALTER TABLE [dbo].[student_answer]  WITH CHECK ADD  CONSTRAINT [FK_student_answer_answer] FOREIGN KEY([answer_Id])
REFERENCES [dbo].[answer] ([id])
GO
ALTER TABLE [dbo].[student_answer] CHECK CONSTRAINT [FK_student_answer_answer]
GO
ALTER TABLE [dbo].[student_answer]  WITH CHECK ADD  CONSTRAINT [FK_student_answer_exam_question] FOREIGN KEY([exam_question_Id])
REFERENCES [dbo].[exam_question] ([id])
GO
ALTER TABLE [dbo].[student_answer] CHECK CONSTRAINT [FK_student_answer_exam_question]
GO
/****** Object:  StoredProcedure [dbo].[FindExamBySubjectLevelAccount]    Script Date: 05/05/2021 2:14:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[FindExamBySubjectLevelAccount]
@Account_Id int,
@Level_Id int,
@Subject_Id int
as
select * from exam
where id in (select examView.*
from (	select e.id  
		from exam e, level l, subject s 
		where	e.level_Id=l.id 
		AND		e.subject_Id = s.id
		AND		l.id=@Level_Id
		AND		s.id=@Subject_Id) as examView
left join account_exam ae on ae.exam_Id=examView.id
where ae.account_Id!=@Account_Id)
GO
/****** Object:  StoredProcedure [dbo].[FindRandomQuestionByLevel]    Script Date: 05/05/2021 2:14:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FindRandomQuestionByLevel]
@Level_Id int,
@Quantity int
AS
SELECT TOP (@Quantity) * FROM question WHERE level_Id=@Level_Id
ORDER BY NEWID()
GO
/****** Object:  StoredProcedure [dbo].[FindRandomQuestionBySubjectLevel]    Script Date: 05/05/2021 2:14:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[FindRandomQuestionBySubjectLevel]
@Subject_Id int,
@Level_Id int,
@Quantity int
as
select top (@Quantity) * 
from question q
where	q.level_Id=@Level_Id
AND		q.subject_Id = @Subject_Id
AND		q.status=1
AND		(select COUNT(*) from answer where question_Id = q.id) >0
order by newid()
GO
USE [master]
GO
ALTER DATABASE [quizonline] SET  READ_WRITE 
GO
