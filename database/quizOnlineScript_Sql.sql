USE [master]
GO
/****** Object:  Database [quizonline]    Script Date: 2021-04-29 1:52:19 ******/
CREATE DATABASE [quizonline]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'quizonline', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\quizonline.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'quizonline_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\quizonline_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [quizonline] SET COMPATIBILITY_LEVEL = 120
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
ALTER DATABASE [quizonline] SET AUTO_CLOSE ON 
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
ALTER DATABASE [quizonline] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [quizonline] SET  MULTI_USER 
GO
ALTER DATABASE [quizonline] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [quizonline] SET DB_CHAINING OFF 
GO
ALTER DATABASE [quizonline] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [quizonline] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [quizonline] SET DELAYED_DURABILITY = DISABLED 
GO
USE [quizonline]
GO
/****** Object:  Table [dbo].[account]    Script Date: 2021-04-29 1:52:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[account_exam]    Script Date: 2021-04-29 1:52:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account_exam](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[account_Id] [int] NOT NULL,
	[exam_Id] [int] NOT NULL,
	[score] [decimal](5, 1) NOT NULL,
	[created_Date] [date] NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_account_exam] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[answer]    Script Date: 2021-04-29 1:52:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[answer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[content] [varchar](250) NOT NULL,
	[iscorrect] [bit] NOT NULL CONSTRAINT [DF__answer__iscorrec__25869641]  DEFAULT ((0)),
	[question_Id] [int] NOT NULL,
	[created_Date] [date] NOT NULL,
	[created_By] [int] NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_answer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[exam]    Script Date: 2021-04-29 1:52:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[exam_question]    Script Date: 2021-04-29 1:52:19 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[level]    Script Date: 2021-04-29 1:52:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[level](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[created_Date] [date] NOT NULL,
	[created_By] [int] NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_level] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[question]    Script Date: 2021-04-29 1:52:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[question](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[content] [varchar](max) NOT NULL,
	[answer_Type] [int] NULL CONSTRAINT [DF__question__answer__2A4B4B5E]  DEFAULT (NULL),
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[student_answer]    Script Date: 2021-04-29 1:52:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_answer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created_Date] [date] NOT NULL,
	[created_By] [int] NOT NULL,
	[answer_Id] [int] NULL,
	[account_Id] [int] NOT NULL,
	[exam_question_Id] [int] NOT NULL,
 CONSTRAINT [PK_student_answer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[subject]    Script Date: 2021-04-29 1:52:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
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
USE [master]
GO
ALTER DATABASE [quizonline] SET  READ_WRITE 
GO
