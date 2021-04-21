USE [master]
GO
/****** Object:  Database [quizonline]    Script Date: 4/21/2021 5:25:00 PM ******/
CREATE DATABASE [quizonline]
GO
USE [quizonline]
GO
/****** Object:  Table [dbo].[account]    Script Date: 4/21/2021 5:25:01 PM ******/

GO

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
)
)
GO
/****** Object:  Table [dbo].[account_exam]    Script Date: 4/21/2021 5:25:01 PM ******/

GO

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
)
)
GO
/****** Object:  Table [dbo].[answer]    Script Date: 4/21/2021 5:25:01 PM ******/

GO

GO
CREATE TABLE [dbo].[answer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[content] [varchar](250) NOT NULL,
	[iscorrect] [bit] NOT NULL,
	[question_Id] [int] NOT NULL,
	[created_Date] [date] NOT NULL,
	[created_By] [int] NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_answer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)
)
GO
/****** Object:  Table [dbo].[exam]    Script Date: 4/21/2021 5:25:01 PM ******/

GO

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
)
)
GO
/****** Object:  Table [dbo].[exam_question]    Script Date: 4/21/2021 5:25:01 PM ******/

GO

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
)
)
GO
/****** Object:  Table [dbo].[level]    Script Date: 4/21/2021 5:25:01 PM ******/

GO

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
)
)
GO
/****** Object:  Table [dbo].[question]    Script Date: 4/21/2021 5:25:01 PM ******/

GO

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
 CONSTRAINT [PK_question] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)
) TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_answer]    Script Date: 4/21/2021 5:25:01 PM ******/

GO

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
)
)
GO
/****** Object:  Table [dbo].[subject]    Script Date: 4/21/2021 5:25:01 PM ******/

GO

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
)
)
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

INSERT [dbo].[account] ([id], [username], [password], [fullname], [photo], [email], [phone], [address], [isActive], [otp], [account_Type], [created_Date], [created_By], [status]) 
VALUES (1, N'ngoctu', N'$2a$10$EQSbkY7rJv2w2CKhiJ6SkuTM4nE.Q696WLgsg4FmuQFYdurqYH6bC', N'Ngoc Tu', NULL, N'admin@gm.c', N'123', N'address', 3, NULL, 1, CAST(0x57430B00 AS Date), 1, 1)