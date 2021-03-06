USE [master]
GO
/****** Object:  Database [HomePageVST]    Script Date: 04/06/2021 10:52:32 AM ******/
CREATE DATABASE [HomePageVST]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HomePageVST', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\HomePageVST.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HomePageVST_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\HomePageVST_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HomePageVST] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HomePageVST].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HomePageVST] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HomePageVST] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HomePageVST] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HomePageVST] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HomePageVST] SET ARITHABORT OFF 
GO
ALTER DATABASE [HomePageVST] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HomePageVST] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [HomePageVST] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HomePageVST] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HomePageVST] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HomePageVST] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HomePageVST] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HomePageVST] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HomePageVST] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HomePageVST] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HomePageVST] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HomePageVST] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HomePageVST] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HomePageVST] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HomePageVST] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HomePageVST] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HomePageVST] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HomePageVST] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HomePageVST] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HomePageVST] SET  MULTI_USER 
GO
ALTER DATABASE [HomePageVST] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HomePageVST] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HomePageVST] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HomePageVST] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [HomePageVST]
GO
/****** Object:  Schema [Crawl]    Script Date: 04/06/2021 10:52:32 AM ******/
CREATE SCHEMA [Crawl]
GO
/****** Object:  Schema [poscovst_us]    Script Date: 04/06/2021 10:52:32 AM ******/
CREATE SCHEMA [poscovst_us]
GO
/****** Object:  Table [Crawl].[CoporateCitizenCategory]    Script Date: 04/06/2021 10:52:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Crawl].[CoporateCitizenCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Link] [varchar](200) NOT NULL,
	[Title] [nvarchar](500) NOT NULL,
	[Thumbnail] [varchar](200) NULL,
	[DatePosted] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Crawl].[CoporateCitizenContent]    Script Date: 04/06/2021 10:52:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Crawl].[CoporateCitizenContent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[CoporateCitizenCategoryId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Benefit]    Script Date: 04/06/2021 10:52:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Benefit](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BenefitName] [nvarchar](200) NOT NULL,
	[RecruitmentId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Candidate]    Script Date: 04/06/2021 10:52:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Candidate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](500) NULL,
	[Phone] [varchar](12) NULL,
	[DateApplied] [date] NOT NULL,
	[EmailAddress] [nvarchar](200) NOT NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[DateConfirmed] [date] NULL,
	[CVName] [varchar](100) NOT NULL,
	[CVPath] [varchar](500) NOT NULL,
	[RecruitmentId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Conversation]    Script Date: 04/06/2021 10:52:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conversation](
	[Id] [uniqueidentifier] NOT NULL,
	[Content] [nvarchar](1000) NOT NULL,
	[OwnerId] [uniqueidentifier] NOT NULL,
	[SenderId] [uniqueidentifier] NOT NULL,
	[ParentId] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL DEFAULT (getdate()),
	[Status] [bit] NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 04/06/2021 10:52:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](500) NOT NULL,
	[CompanyAddress] [nvarchar](500) NOT NULL,
	[Telephone] [varchar](15) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[PasswordHash] [varchar](50) NOT NULL,
	[PasswordSalt] [varchar](50) NOT NULL,
	[DateCreated] [date] NOT NULL DEFAULT (getdate()),
	[IsActive] [bit] NOT NULL DEFAULT ((0)),
	[IsVerify] [bit] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Document]    Script Date: 04/06/2021 10:52:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Document](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[Description] [nvarchar](500) NULL,
	[UploadedDate] [date] NULL,
	[IsActive] [bit] NOT NULL,
	[FileName] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HeaderCategory]    Script Date: 04/06/2021 10:52:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HeaderCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Alias] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HeaderDetail]    Script Date: 04/06/2021 10:52:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HeaderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Alias] [varchar](100) NULL,
	[HeaderCategoryId] [int] NULL,
	[ParentId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Images]    Script Date: 04/06/2021 10:52:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Images](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImageDescription] [varchar](100) NULL,
	[FilePath] [varchar](200) NULL,
	[MinimalFilePath] [varchar](200) NULL,
	[DatePosted] [date] NULL DEFAULT (getdate()),
	[IsActive] [bit] NOT NULL DEFAULT ((1)),
	[HeaderDetailId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[JobSkill]    Script Date: 04/06/2021 10:52:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobSkill](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SkillName] [nvarchar](200) NOT NULL,
	[RecruitmentId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Recruitment]    Script Date: 04/06/2021 10:52:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Recruitment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[JobTitle] [nvarchar](200) NOT NULL,
	[JobDescription] [nvarchar](max) NOT NULL,
	[JobRequirement] [nvarchar](max) NULL,
	[Salary] [varchar](50) NULL,
	[DatePosted] [date] NOT NULL CONSTRAINT [Df_Recruitment_DatePosted]  DEFAULT (getdate()),
	[DateExpired] [date] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [Df_Recruitment_IsActive]  DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Role]    Script Date: 04/06/2021 10:52:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 04/06/2021 10:52:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[Id] [uniqueidentifier] NOT NULL,
	[NameCompany] [nvarchar](100) NOT NULL,
	[DayoIncor] [datetime] NOT NULL,
	[Representative] [nvarchar](50) NOT NULL,
	[MainProduct] [nvarchar](50) NOT NULL,
	[MainCustomer] [nvarchar](50) NOT NULL,
	[Contact] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__Supplier__3214EC07C7AFC28A] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SupplierCertificate]    Script Date: 04/06/2021 10:52:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SupplierCertificate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FilePath] [varchar](1000) NOT NULL,
	[FileName] [nvarchar](500) NOT NULL,
	[SupplierId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK__Supplier__3214EC0756CCE60B] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SupplierUser]    Script Date: 04/06/2021 10:52:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplierUser](
	[SupplierId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[password] [nvarchar](100) NOT NULL,
	[RoleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserLogin]    Script Date: 04/06/2021 10:52:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserLogin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](20) NOT NULL,
	[RoleId] [int] NOT NULL,
	[CreatedAt] [date] NULL DEFAULT (getdate()),
	[IsActive] [bit] NOT NULL DEFAULT ((0)),
	[PasswordHash] [nvarchar](50) NULL,
	[PasswordSalt] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [Crawl].[CoporateCitizenCategory] ON 

INSERT [Crawl].[CoporateCitizenCategory] ([Id], [Link], [Title], [Thumbnail], [DatePosted]) VALUES (1, N'https://newsroom.posco.com/en/corporate-citizen-poscos-solution-8-cultivating-the-dreams-of-future-generations/', N'[Corporate Citizen POSCO’s SOLUTION] #8 Cultivating the ‘Dreams’ of Future Generations', N'https://dh4drhh3phab.cloudfront.net/en/wp-content/uploads/2020/10/posco8_kv_960x540-640x360.png', CAST(N'2020-10-05' AS Date))
INSERT [Crawl].[CoporateCitizenCategory] ([Id], [Link], [Title], [Thumbnail], [DatePosted]) VALUES (2, N'https://newsroom.posco.com/en/corporate-citizen-poscos-solution-7-sharing-growth-with-smes-benefit-sharing/', N'[Corporate Citizen POSCO’s SOLUTION] #7 Sharing Growth with SMEs, “Benefit Sharing”', N'https://dh4drhh3phab.cloudfront.net/en/wp-content/uploads/2020/09/posco_kv_960x540-640x360.png', CAST(N'2020-09-04' AS Date))
INSERT [Crawl].[CoporateCitizenCategory] ([Id], [Link], [Title], [Thumbnail], [DatePosted]) VALUES (3, N'https://newsroom.posco.com/en/corporate-citizen-poscos-solution-6-shifting-the-paradigm-of-childbirth/', N'[Corporate Citizen POSCO’s SOLUTION] #6 Shifting the Paradigm of Childbirth', N'https://dh4drhh3phab.cloudfront.net/en/wp-content/uploads/2020/08/posco_kv_960x540-640x360.png', CAST(N'2020-08-21' AS Date))
INSERT [Crawl].[CoporateCitizenCategory] ([Id], [Link], [Title], [Thumbnail], [DatePosted]) VALUES (4, N'https://newsroom.posco.com/en/corporate-citizen-poscos-solution-5-collaboration-art-become-collaboartion/', N'[Corporate Citizen POSCO’s SOLUTION] #5 Collaboration & Art Become CollaboARTion', N'https://dh4drhh3phab.cloudfront.net/en/wp-content/uploads/2020/07/posco_kv_960x540-1-640x360.png', CAST(N'2020-07-17' AS Date))
INSERT [Crawl].[CoporateCitizenCategory] ([Id], [Link], [Title], [Thumbnail], [DatePosted]) VALUES (5, N'https://newsroom.posco.com/en/corporate-citizen-poscos-solution-4-young-man-it-aint-over-till-its-over/', N'[Corporate Citizen POSCO’s SOLUTION #4] Young Man, It Ain’t Over till It’s Over', N'https://dh4drhh3phab.cloudfront.net/en/wp-content/uploads/2020/07/posco_kv_960x540-640x360.png', CAST(N'2020-07-08' AS Date))
INSERT [Crawl].[CoporateCitizenCategory] ([Id], [Link], [Title], [Thumbnail], [DatePosted]) VALUES (6, N'https://newsroom.posco.com/en/corporate-citizen-poscos-solution-3-poscos-beloved-friend-the-ocean/', N'[Corporate Citizen POSCO’s SOLUTION #3] POSCO’s Beloved Friend: The Ocean', N'https://dh4drhh3phab.cloudfront.net/en/wp-content/uploads/2020/06/posco_kv_960x540-2-640x360.png', CAST(N'2020-06-11' AS Date))
INSERT [Crawl].[CoporateCitizenCategory] ([Id], [Link], [Title], [Thumbnail], [DatePosted]) VALUES (7, N'https://newsroom.posco.com/en/corporate-citizen-poscos-solution-2-sharing-competitiveness-sharing-growth/', N'[Corporate Citizen POSCO’s SOLUTION #2] ‘Sharing’ Competitiveness, ‘Sharing’ Growth', N'https://dh4drhh3phab.cloudfront.net/en/wp-content/uploads/2020/06/posco_02_kv_960x540-640x360.png', CAST(N'2020-05-18' AS Date))
INSERT [Crawl].[CoporateCitizenCategory] ([Id], [Link], [Title], [Thumbnail], [DatePosted]) VALUES (8, N'https://newsroom.posco.com/en/corporate-citizen-poscos-solution-posco-employees-giving-program-1-sharing/', N'[Corporate Citizen POSCO’s SOLUTION #1] POSCO ‘Employees’ Giving Program: “1% Sharing”', N'https://dh4drhh3phab.cloudfront.net/en/wp-content/uploads/2020/06/posco_01_kv_960x540-640x360.png', CAST(N'2020-04-21' AS Date))
SET IDENTITY_INSERT [Crawl].[CoporateCitizenCategory] OFF
SET IDENTITY_INSERT [Crawl].[CoporateCitizenContent] ON 

INSERT [Crawl].[CoporateCitizenContent] ([Id], [Content], [CoporateCitizenCategoryId]) VALUES (1, N'<div class="sp_cont_wrap"><h2><strong><span style="color: #ffffff;"><span style="background-color: #c00000;">ISSUE</span></span></strong> <strong> The ‘Dreams’ of future generations</strong></h2>
<p>As children grow in height each year, their dreams change year by year as well. What dreams do children have these days?</p>
<p><img src="https://dh4drhh3phab.cloudfront.net/en/wp-content/uploads/2020/10/posco_img_01.png" alt="" width="960" height="1502" class="aligncenter size-full wp-image-72688"></p>
<p>Last year, the Ministry of Education and Korea Research Institute for Vocational Education &#038; Training surveyed 20,000 elementary, middle, and high school students. The survey showed that the most desired job of elementary school students was an athlete, while middle and high school students wanted to become teachers the most. Among the desired job list of elementary school students, Creator (YouTube, BJ, etc.), which ranked 10th two years ago, rose to third place. Another interesting fact is that beauty designer, cartoonist (webtoon), and baker topped the list of popular jobs.</p>
<p>The fact that children&#8217;s dreams change rapidly every year reflects how fast our society is changing. For this reason, vocational education in modern society requires more delicate and detailed plans than ever before. However, universal vocational education for all is challenging in reality. This is especially the case for underprivileged children likely to be in blind spots.</p>
<p>According to a survey of 1,100 elementary, middle, and high schools last year, the teachers in charge of vocational education stated that efforts to consider underprivileged groups, such as multicultural families, were insufficient compared to other factors while establishing the educational plans.</p>
<p><img src="https://dh4drhh3phab.cloudfront.net/en/wp-content/uploads/2020/10/posco_img_02.png" alt="" width="960" height="589" class="aligncenter size-full wp-image-72691"></p>
<p>A dream seems something like a vague hope, difficult to have, and more difficult to achieve. It is the responsibility of the older generation to help the future generation specify and realize their vague hopes. Those in an environment vulnerable to fulfilling their dreams need only a little more help than others.</p>
<h2><strong><span style="color: #ffffff;"><span style="background-color: #006699;">SOLUTION</span></span></strong> ‘Do Dream’, ‘Chin Chin Rainbow Project’, ‘UNESCO Project for Out-of-school Children’</h2>
<p>To ensure that not a single child is excluded from ‘dreaming’, POSCO operates three programs mainly. The first is ‘Do Dream,’ a support program for the independence of children leaving welfare centers. The second is the ‘Chin Chin Rainbow’ project, which provides support for children from multicultural families, and the third is the ‘Out-of-school Children’ project, which offers basic education support for global youths living in harsh conditions.</p>
<p><span style="color: #006699;"><strong>Do Take Action, Do Dream!</strong></span></p>
<p>Park, who has lived in a welfare center for a long time, said he suddenly made up his mind while watching his classmates taking exams in their second grade in high school.</p>
<p>“I shouldn&#8217;t live like this anymore.”</p>
<p>Although he had always taken the last place in the entire school, he worked hard and was able to enter the Department of Social Welfare at a university he wanted. Park’s dream was to become a social worker.</p>
<p>“I chose the Department of Social Welfare because I wanted to give back as much as I received. Since I was from a completely different background from others, I always worked hard at university as well.”</p>
<p>Park’s grades were good enough to receive a full scholarship, but studying and earning living expenses at the same time wasn’t an easy task. To make matters worse, a friend took advantage of Park’s self-reliance settlement fund, which was given to Park as he left the welfare center. However, Park wasn’t in despair. He took up a part-time job to cover tuition and living expenses, and even went on to graduate school.</p>
<p>Even though Park was more positive than anyone else, a sense of helplessness and despair struck him as hardships in his life continued with no end in sight. Park gave up his dream of becoming a social worker and got a job at a small event company. However, he soon ended up quitting his job and was wandering around. And this was when ‘Do Dream’ lent Park a helping hand.</p>
<p><img src="https://dh4drhh3phab.cloudfront.net/en/wp-content/uploads/2020/10/posco_img_03.png" alt="" width="960" height="1245" class="aligncenter size-full wp-image-72692"></p>
<p>Around 2,600 children leave welfare centers per year. The National Center for the Rights of the Child carries out various programs with numerous non-profit foundations to support the self-reliance and employment of the children leaving the centers on turning 18, and POSCO’s ‘Do Dream’ is one of these programs.</p>
<p>POSCO 1% Foundation provides up to 10 million KRW per person, including annual education expenses, living expenses, interview preparation fees, and benefits for successful employment, to help the children leaving the welfare centers focus on career development and succeed in finding a job.</p>
<p>POSCO 1% Foundation is a non-profit foundation operated with funds donated — 1% of the monthly pay — by employees and executives of POSCO Group and its partners. The fund is managed as a matching grant, with the company matching employee donations one-to-one.</p>
<p>※ Related Article: <a href="/coporate-citizen-newsroom-p8.html" target="_blank" rel="noopener">POSCO ‘Employees’ Giving Program: “1% Sharing”</a></p>
<p>While most of the civil support for the independence of children leaving welfare centers are regarding their tuition fees when entering college, POSCO’s program, ‘Do Dream,’ is quite different. The program supports all education that would help in the economic independence of these children, whether or not they go to college. Those preparing to get a job can apply for the program until the age of 26 after leaving welfare centers, and this was the case for Park. </p>
<p>Park decided to realize his dream of becoming a social worker with the support from ‘Do Dream,’ and after submitting several resumes, he finally succeeded in getting a job as a social worker at a welfare center. </p>
<p>“Thanks to Do Dream, I was able to prepare for my job with a comfortable mind, considering only my aptitude and plans. Even after the support ends, I will continue to move further and prepare for the social worker exam as well. Wouldn’t I become a social worker with good influence to change the world then?”</p>
<p>As a measure to help those children leaving welfare centers to not give up on their dreams, POSCO 1% Foundation has expanded the number of recipients from 20 to 35 this year and has also increased 1:1 case management sessions from two to ten times a year. In addition to the support funds, the Foundation carries out other programs that can be of practical help, including special lectures on employment, mentoring, and regional gatherings. </p>
<p><span style="color: #006699;"><strong>‘Chin Chin Rainbow Project’: For Those From Different Backgrounds</strong></span></p>
<p>The Ministry of Gender Equality and Family operates a variety of youth support policies, including those youths with a migrant background. Under Article 18 of the Youth Welfare Support Act, youths with a migrant background are youths from multicultural families or are North Korean defectors settling in South Korean and require social, cultural adaptation, and language learning support.</p>
<p><img src="https://dh4drhh3phab.cloudfront.net/en/wp-content/uploads/2020/10/01-1.jpg" alt="" width="960" height="541" class="aligncenter size-full wp-image-72689"></p>
<p>POSCO 1% Foundation operates the ‘Chin Chin Rainbow’ program for youths from multicultural and underprivileged families with high growth potential. The program provides vocational education expenses in various fields, such as arts, sports, and IT, and conducts 1:1 mentoring and summer camps. Since 2014, a total of 371 youths have received support, and starting from last year, the number of recipients has been doubled — from the previous 60 — mainly in Pohang and Gwangyang.</p>
<p><span style="color: #006699;"><strong>Every Child Has the Right to Receive Education &#8211; Support Program for Out-of-school Children</strong></span></p>
<p>POSCO 1% Foundation has been carrying out the ‘UNESCO Project for Out-of-school Children’ since 2018, with a mission to ensure that all children around the world can receive basic education. There are 64 million children worldwide who cannot even go to elementary school due to unavoidable reasons, such as poverty, disability, violence, drugs, child labor, human trafficking, war, and refugees. POSCO is providing basic education and meals, and acting as a refuge for 1,150 Thai and Indonesian children living in these conditions so that they can dream of a new future.</p>
<p>In addition, POSCO 1% Foundation has been operating the ‘1% Art School,’ a program that helps children in Pohang and Gwangyang experience various art activities, and ‘Science Beyond Imagination,’ an experiential science education program. POSCO TJ Park Foundation operates the ‘Vision Scholarship Program’ to relieve the gap of education opportunities in Pohang and Gwanyang, and also a mentoring program for university students, ‘POSCO Dream Camp’. </p>
<p>POSCO’s support for future generations will continue until the day comes of a world everyone and anyone can dream!</p>
<div style="background-color: #ffffff;">
<div style="height: auto; border: 2px solid #cccccc; padding: 20px;">
<p><span style="color: #000000;"><strong>[Corporate Citizen POSCO’s SOLUTION] Series </strong></span></p>
<p>· <span style="color: #0000ff;"><a href="/coporate-citizen-newsroom-p8.html" target="_blank" rel="noopener">#1 POSCO ‘Employees’ Giving Program: “1% Sharing”</a><br>
· <a href="/coporate-citizen-newsroom-p7.html" target="_blank" rel="noopener">#2 ‘Sharing’ Competitiveness, ‘Sharing’ Growth</a><br>
· <a href="/coporate-citizen-newsroom-p6.html" target="_blank" rel="noopener">#3 POSCO’s Beloved Friend: The Ocean </a><br>
· <a href="/coporate-citizen-newsroom-p5.html" target="_blank" rel="noopener">#4 Young Man, It Ain’t Over till It’s Over </a><br>
· <a href="/coporate-citizen-newsroom-p4.html" target="_blank" rel="noopener">#5 Collaboration &amp; Art Become CollaboARTion </a><br>
· <a href="/coporate-citizen-newsroom-p3.html" target="_blank" rel="noopener">#6 Shifting the Paradigm of Childbirth </a><br>
· <a href="/coporate-citizen-newsroom-p2.html" target="_blank" rel="noopener">#7 Sharing Growth with SMEs, “Benefit Sharing” </a><br>
</span></p>
</div>
</div>
</div>', 1)
INSERT [Crawl].[CoporateCitizenContent] ([Id], [Content], [CoporateCitizenCategoryId]) VALUES (2, N'<div class="sp_cont_wrap"><h1><span style="color: #000000;">Part 7. Sharing Growth with SMEs</span></h1>
<h2><span style="color: #ffffff;"><span style="background-color: #c00000;">ISSUE</span></span> The localization rate of materials, parts, and equipment in South Korea are in the mid-60%.</h2>
<p>Last year, export regulations on semiconductor materials were an issue in South Korea. Voices were raised on the importance of localizing related technologies. Since the materials, parts, and equipment needed for manufacturing weren’t localized enough, the sudden regulations imposed a challenge. Luckily, however, the event did not escalate into a crisis and did not cause as much damage as expected because Korean companies quickly jumped into handling the situation. The large companies of the manufacturing industry had the technology, and SMEs — aka Hidden Champions — supported them. The key was the cooperation between large companies and SMEs.</p>
<p>However, it is known that SMEs in Korea are generally not competitive in technology. According to the 2018 Survey on Korea Federation of SMEs, the technology of Korean SMEs is 1.9 years behind the U.S., 1.8 years behind Japan, and 1.6 years behind Germany, but estimated to be 2.7 years ahead of China. The technology gap with major countries affects the survival of SMEs themselves. However, it is also a threat that can adversely affect the entire industrial ecosystem of Korea, including large companies, in a chain reaction.</p>
<p>As mentioned in [Corporate Citizen POSCO’s SOLUTION Part 2] “Sharing Competitiveness, Sharing Growth,” polarization between large companies and SMEs is deepening, and cooperation is required for the industrial ecosystem.</p>
<p>SMEs need support from large companies, and large companies need the expertise of SMEs. Building an industrial ecosystem where all parties can coexist would be a way to cope with the rapidly changing business environment.</p>
<h2><span style="color: #ffffff;"><span style="background-color: #006699;">SOLUTION</span></span> POSCO Presents “Benefit Sharing”</h2>
<p>The Korean government is operating a <span style="color: #006699;"><u>“Benefit Sharing”</u></span> system as a support program to create an industrial ecosystem where large companies and SMEs coexist. Actually, POSCO had first introduced the “Benefit Sharing” system in Korea in 2004. The system is one of POSCO’s seven major shared growth programs, which is about carrying out <span style="text-decoration: underline;">improvement tasks</span> together with SMEs and sharing the achieved benefit. This in-house system was acknowledged as a successful business model and has spread to the entire industry.</p>
<p>Through the Benefit Sharing system, SMEs get the opportunity to stabilize supply and increase sales while focusing on technology development. On the other hand, large companies can attain competitiveness, such as improving product quality, through the expertise of SMEs. This has proved to be of advantage to both large companies and SMEs since their coexistence fosters each other’s competitiveness as well. Especially this year, POSCO has branded its shared growth program named “Change Up Together,” and is expanding support for its overall shared growth programs, including the benefit sharing system.</p>
<p><img class="aligncenter size-full wp-image-71863" src="https://dh4drhh3phab.cloudfront.net/en/wp-content/uploads/2020/09/posco_img_01.png" alt="" width="960" height="1380"></p>
<p><span style="color: #ffffff;"><span style="background-color: #0b3b17;">Task Performance Process</span></span> Any POSCO employee or employee of suppliers is free to propose improvement tasks. The following five stages are carried out in order: Task selection, task performance, task evaluation, performance benefit, and monitoring. The entire process is operated transparently through a specialized system. <a href="https://bit.ly/2WKNdWA" target="_blank" rel="noopener">(See the process of the Benefit Sharing system)</a></p>
<p>In the early stages of the operation, the concerning department differed from one task to another, making it inefficient to carry out the tasks. However, as of present, a unified department in charge of operation has enabled a one-stop service — from task selection to benefit sharing — eliminating the inconvenience of the past. Also, POSCO is implementing a non-financial model that carries out tasks that are difficult to quantify, such as tasks concerning safety and the environment.</p>
<p><img class="aligncenter size-full wp-image-71859" src="https://dh4drhh3phab.cloudfront.net/en/wp-content/uploads/2020/09/posco_img_02.png" alt="" width="960" height="412"></p>
<p>As of last year, POSCO recorded a high localization rate of about 90%, which can be said to be the result of its long-term benefit sharing activities. It is a result achieved by integrating the technology of SMEs into specialized fields that were difficult for POSCO to improve on its own.</p>
<p><span style="color: #ffffff;"><span style="background-color: #0b2f3a;">Task Evaluation &#038; Benefit</span></span> Recently, POSCO has upgraded the benefit sharing system by strengthening the benefit for successful tasks. It provides various incentives, such as rewarding 50% of the financial performance in cash or signing a long-term supply right for the solution. It has also sought to reduce the burden of SMEs with a new measure that compensates at least 50% of the task cost even if the task turns out to be inadequate. </p>
<p><img class="aligncenter size-full wp-image-71864" src="https://dh4drhh3phab.cloudfront.net/en/wp-content/uploads/2020/09/posco_img_03.png" alt="" width="960" height="843"></p>
<p>In 2019, POSCO carried out a total of 174 tasks and rewarded 42.9 billion KRW for completed tasks. Since introducing the benefit sharing system in 2004, the company has operated 4,916 accumulated number of tasks, and accumulated shared benefits reach 552.8 billion KRW.</p>
<p><img class="aligncenter size-full wp-image-71865" src="https://dh4drhh3phab.cloudfront.net/en/wp-content/uploads/2020/09/posco_img_04.png" alt="" width="960" height="592"></p>
<p>Amidst the harsh times triggered by the COVID-19 pandemic, POSCO is striving to grow together with its customers, suppliers, and partner companies. The company will expand substantial performance benefits, extend the participation of companies that have no direct business with POSCO, and support channels for growth through joint development and technology sales. As a measure to expand and sustain its achievements, POSCO plans to maximize the shared growth value by applying technologies in similar processes as well.</p>
<p>Expanding the benefit sharing system isn’t a solution for the growth of POSCO, but one for the coexistence of large companies and SMEs in the industrial ecosystem as well. POSCO will continue to expand the benefit sharing system and create opportunities for talented SMEs to grow further.</p>
<h3><span style="color: #006699;"><strong>※ Case Study of the Benefit Sharing System </strong></span></h3>
<div class="txc-textbox" style="background-color: #dbe8fb; border: #79a5e4 1px dashed; padding: 10px;">
<div><b><strong>1. YUJIN MECHATRONICS (Electrical Steel MgO Powder Cleaning System)</strong></b></div>
<p>Product defects occurred due to the Manganese Oxide powder generated while manufacturing electrical steel. As a result of developing a powder cleaning system through the benefit sharing system, the amount of powder was reduced by more than 50%. This resulted in the reduction of about 200 million KRW worth of defective products, and workers didn’t need to put on dust-proof clothing anymore. YUJIN MECHATRONICS secured the right to supply the system for three years, and POSCO plans to expand its use to other plants in the company starting this year.<br>
※ YUJIN MECHATRONICS: A supplier producing industrial automation robot system and equipment</p>
<div><b><strong>2. Hana Tech (Real-time Monitoring System for Blast Furnace)</strong></b></div>
<p>Since the discharge of molten iron at the blast furnace tap hole is irregular, it is hard to monitor the exact temperature of the molten iron. The real-time monitoring system, which was proposed by Hana Tech, enabled workers to predict the condition of furnaces while monitoring the temperature of molten iron in real-time. The temperature was measured without any direct contact and processed into live-data with an optimal algorithm that predicted the condition inside the furnaces, saving about 400 million KRW per year in fuel costs. The system also helped secure the safety of workers. As a benefit, Hana Tech received material compensation and a three-year-term supply right.<br>
※ Hana Tech: A supplier producing precision metal parts</p>
<div><b><strong>3. KWANGWOO Co., Ltd. (Localizing Rolling Oil Component And Improving Performance)</strong></b></div>
<p>KWANGWOO Co., Ltd. is a supplier of rolling oil, which is essential for manufacturing. The company collaborated with Gwangyang Cold Rolling plant No.4 and succeeded in localizing base oil components. The improved components allowed the cleaning of contamination caused during the rolling process, thus reducing both unit price and input volume. POSCO was able to achieve a financial effect of more than 300 million KRW, half of which was shared with the supplier.<br>
※ KWANGWOO Co., Ltd.: A supplier of lubricant and grease</p>
</div>
<div style="background-color: #ffffff;">
<div style="height: auto; border: 2px solid #cccccc; padding: 20px;">
<p><span style="color: #000000;"><strong>[Corporate Citizen POSCO’s SOLUTION] Series </strong></span></p>
<p>· <span style="color: #0000ff;"><a href="/coporate-citizen-newsroom-p8.html" target="_blank" rel="noopener">#1 POSCO ‘Employees’ Giving Program: “1% Sharing”</a><br>
· <a href="/coporate-citizen-newsroom-p7.html" target="_blank" rel="noopener">#2 ‘Sharing’ Competitiveness, ‘Sharing’ Growth</a><br>
· <a href="/coporate-citizen-newsroom-p6.html" target="_blank" rel="noopener">#3 POSCO’s Beloved Friend: The Ocean </a><br>
· <a href="/coporate-citizen-newsroom-p5.html" target="_blank" rel="noopener">#4 Young Man, It Ain’t Over till It’s Over </a><br>
· <a href="/coporate-citizen-newsroom-p4.html" target="_blank" rel="noopener">#5 Collaboration &amp; Art Become CollaboARTion </a><br>
· <a href="/coporate-citizen-newsroom-p3.html" target="_blank" rel="noopener">#6 Shifting the Paradigm of Childbirth </a><br>
</span></p>
</div>
</div>
</div>', 2)
INSERT [Crawl].[CoporateCitizenContent] ([Id], [Content], [CoporateCitizenCategoryId]) VALUES (3, N'<div class="sp_cont_wrap"><h1><span style="color: #000000;">Part 6. Presenting a Role Model to Resolve Low Birth Rate</span></h1>
<p>Here is a couple of the same age who have been married for eight years. On being asked why this couple, who live in Seoul and work in stable large companies, didn’t have any children, they replied that it wasn’t that they didn’t want children — they just couldn’t. The couple managed to buy a house in Seoul (Houses in Seoul are quite expensive) with a loan on getting married, and when they decided to have a child about three years ago, the first problem they faced was “infertility.”</p>
<p>“But even if we do have a child, there’s no one to look after the baby.”</p>
<p>The second problem they will face after giving birth would be “career breaks.” The couple grew up in the provinces and got a job after graduating from college in Seoul. They have no parents or relatives who can take care of their children in Seoul. They leave home for work at 7 a.m. and arrive back home at 7 p.m. Both spend 12 hours out of 24 hours a day outside their house, so if these two have a child, at least one of them must take parental leave.</p>
<p>However, the couple has seen colleagues being assigned to another department or district and pushed out of promotion after parental leave — giving them another reason to hesitate on having children.</p>
<p>“Will I be able to come back to my workplace after parental leave?”</p>
<h2><span style="color: #ffffff;"><span style="background-color: #c00000;">ISSUE</span></span> ‘Childbirth’ &amp; ‘parenting’ have become an obstacle for the 2040 age group.</h2>
<p>The birth rate in Korea is falling rapidly. According to Statistics Korea, the total fertility rate, which is the average number of children a woman is expected to have during her lifetime, fell below one for the first time last year, marking the lowest in the world. There is also a prospect that the number of births and deaths will be reversed for the first time this year, with a further drop to 0.8.</p>
<p><img class="aligncenter size-full wp-image-71719" src="https://dh4drhh3phab.cloudfront.net/en/wp-content/uploads/2020/08/posco_img_01_en.png" alt="" width="960" height="425"></p>
<p>It is a known fact that when the working age population decreases and population ageing increases, the burden of younger generations will inevitably expand and result in sluggish economic growth due to reduced consumption. However, for the 2040 age group, childbirth has long been a matter of choice, not a must. As seen in the case of the couple earlier, childbirth is a challenge, even for economically stable families. This is because childbirth and parenting are considered as obstacles in contemporary living conditions, where both having and raising children are difficult tasks. The obstacles not only make it difficult to sustain the current life but rather deteriorate the quality of life, regardless of class and age.</p>
<p>On recognizing this matter, the government&#8217;s childbirth control policy is also gradually shifting its paradigm.</p>
<div id="attachment_71720" style="width: 970px" class="wp-caption aligncenter"><img class="wp-image-71720 size-full" src="https://dh4drhh3phab.cloudfront.net/en/wp-content/uploads/2020/08/posco_img_02_en.png" alt="" width="960" height="745"><p class="wp-caption-text">*Source: Presidential Committee on Ageing Society and Population Policy (PCASPP)</p></div>
<p>In the past, the government-led childbirth control policy targeting low-income families was focalized on simply increasing birthrate and the number of newborns. However, the goal has now been changed to improve the quality of life for 2040 generations.</p>
<p>A society where working parents can give birth to and raise children at ease. Could it be feasible?</p>
<h2><span style="color: #ffffff;"><span style="background-color: #006699;">SOLUTION</span></span> A POSCO-type role model focusing on improving the quality of life to resolve the low birthrate issue</h2>
<h4>1) Introducing the “working-from-home for parenting” system for the first time in Korea</h4>
<p>Last year, POSCO presented a POSCO-type role model as one of the six major Corporate Citizenship projects and is currently implementing various policies to promote childbirth according to the life cycle of individuals. In particular, POSCO applied the “working-from-home for child care” system for the first time in Korea to prevent career breaks of working parents and also improve the quality of life of employees by balancing work and life.</p>
<p>POSCO’s ‘working-from-home for parenting system without career breaks’ allows employees with children under the age of eight or 2nd grade of elementary school to apply for full-day (8 hours) or half-day (4 hours) working-from-home, depending on the work conditions. Employees applying for the full-day working-from-home system will have the same working hours — from 8 a.m. to 5 p.m. — as other employees. Employees applying for the half-day working-from-home system can choose their working hours according to the parenting environment from the following options: 8 to 12, 10 to 15, and 13 to 17. Depending on the number of children, employees can utilize this system for up to six years. POSCO provides the working-from-home employees with the same salary, welfare, and promotion system as those working in the offices.</p>
<p>The system has been under implementation since July 1. A POSCO employee, who applied for this working-from-home system starting on July 13, said, “It took three hours to commute from my mother&#8217;s, who takes care of my 14-month-old child. I was beginning to understand why people quit their jobs, and just then, POSCO introduced the working-from-home system, and I applied for it.” She added, “Now that I can concentrate on my child with the time saved from commuting, I think I can play a better role than before.”</p>
<p>POSCO plans to expand the ‘Working-from-home for parenting without career breaks’ to its group companies.</p>
<h4>2) A POSCO-type role model: childbirth policy fitting into the life cycle</h4>
<p>Since 2017, POSCO has already been operating a POSCO-type childbirth policy, that covers all phases of the life cycle from marriage, pregnancy, childbirth, and parenting.</p>
<p><img class="aligncenter size-full wp-image-71721" src="https://dh4drhh3phab.cloudfront.net/en/wp-content/uploads/2020/09/posco_img_03_en_0903.png" alt="" width="960" height="471"></p>
<p>In particular, POSCO allows a maximum of 10 days leave for infertility treatment, which is the primary factor of low birthrate and provides up to 1 million KRW (per session) as support for expenses that are offered a maximum of 10 times.</p>
<p>POSCO employees will also receive maternity benefits: 2 million for the firstborn and 5 million KRW for the second. Once the employees’ maternity leave ends, they automatically go into paternity leave, which can be used up to three years, without a separate application procedure. Also, employees can freely adjust working types and hours according to the parenting environment of each individual, utilizing various systems, such as the system of working reduced hours during the child-rearing period and the system of flexible working hours.</p>
<h4><strong>3) Opening Workplace Childcare Center</strong></h4>
<p>POSCO operates 15 workplace childcare centers for employees&#8217; children in Pohang, Gwangyang, Seoul, and the metropolitan area, two of which are workplace shared childcare centers. Among the total number of children enrolled in the two childcare centers, the proportion of SMEs’ children — including partner companies — amounts to over 50%. Established as a measure to resolve the low birth rate issue, the two childcare centers are constructed one each in Pohang and Gwangyang respectively and have been under operation from earlier this year.</p>
<div id="attachment_71725" style="width: 970px" class="wp-caption aligncenter"><img class="wp-image-71725 size-full" src="https://dh4drhh3phab.cloudfront.net/en/wp-content/uploads/2020/08/img.png" alt="" width="960" height="319"><p class="wp-caption-text">▲ POSCO workplace childcare centers: POSCO Dongchon Childcare Center in Pohang (left); POSCO Geumdang Childcare Center in Gwangyang (right)</p></div>
<p>POSCO Dongchon Childcare Center is located right next to POSCO’s headquarters in Pohang. It is equipped with an indoor garden that features a nature-friendly interior space filled with exotic plants, such as lemon and banana trees. On the other hand, POSCO Geumdang Childcare Center in Gwangyang is designed to allow children to play freely in various outdoor playgrounds. Located in the housing complex, it is within walking distances from nearby facilities like marts, movie theaters, libraries, and parks.</p>
<p>The POSCO Seoul Childcare Center, located in POSCO Center, Seoul, can accommodate up to 200 children. In addition to this, POSCO recently renovated its second childcare center in Seoul and opened it so that not only POSCO but also children of partners and residents can be enrolled.</p>
<p>Since 2011, POSCO has been certified as an excellent family-friendly company every year by the Ministry of Gender Equality and Family, and last year, 17 POSCO Group companies received certification. POSCO&#8217;s efforts to become a &#8216;childbirth-friendly company&#8217; with innovative childbirth support activities continue this year as well. The company shared various case studies on the issue of the declining birthrate and provided a forum for spreading social discussions. At the &#8216;2020 Low Birthrate Symposium&#8217; held at POSCO Center on July 14, POSCO shared the various efforts that it had implemented so far to present a role model and resolve the low birthrate issue. The company also discussed the role of corporates in creating quality jobs that can support the parenting of employees amid the Demographic Cliff crisis.</p>
<div class="txc-textbox" style="background-color: #ddf1fd; border: #79a5e4 1px dashed; padding: 10px;"><strong>☞ Related Articles</strong><strong><br>
<span style="color: #0000ff;">· <a href="https://newsroom.posco.com/en/posco-hosts-the-2020-low-birth-rate-symposium/" target="_blank" rel="noopener">POSCO Hosts the 2020 Low Birth Rate Symposium</a></span><br>
<span style="color: #0000ff;">· <a href="https://newsroom.posco.com/en/posco-introduces-telecommuting-system-for-working-parents/" target="_blank" rel="noopener">POSCO Introduces Working-from-home for Parenting System </a></span><br>
</strong></div>
<div style="background-color: #ffffff;">
<div style="height: auto; border: 2px solid #cccccc; padding: 20px;">
<p><span style="color: #000000;"><strong>[Corporate Citizen POSCO’s SOLUTION] Series </strong></span></p>
<p>· <span style="color: #0000ff;"><a href="/coporate-citizen-newsroom-p8.html" target="_blank" rel="noopener">#1 POSCO ‘Employees’ Giving Program: “1% Sharing”</a><br>
· <a href="/coporate-citizen-newsroom-p7.html" target="_blank" rel="noopener">#2 ‘Sharing’ Competitiveness, ‘Sharing’ Growth</a><br>
· <a href="/coporate-citizen-newsroom-p6.html" target="_blank" rel="noopener">#3 POSCO’s Beloved Friend: The Ocean </a><br>
· <a href="/coporate-citizen-newsroom-p5.html" target="_blank" rel="noopener">#4 Young Man, It Ain’t Over till It’s Over </a><br>
· <a href="/coporate-citizen-newsroom-p4.html" target="_blank" rel="noopener">#5 Collaboration &amp; Art Become CollaboARTion </a><br>
</span></p>
</div>
</div>
</div>', 3)
INSERT [Crawl].[CoporateCitizenContent] ([Id], [Content], [CoporateCitizenCategoryId]) VALUES (4, N'<div class="sp_cont_wrap"><h1><span style="color: #000000;">Part 5. Support for Artists with Disabilities</span></h1>
<p><img class="aligncenter size-full wp-image-71504" src="https://dh4drhh3phab.cloudfront.net/en/wp-content/uploads/2020/07/red.jpg" alt="" width="960" height="699"></p>
<p>Here is an artwork titled “Hide and Seek Red.” One additional information is that the painter of this artwork is someone with an autistic developmental disorder.</p>
<p>“How could he create such an artwork when he has a disability?”</p>
<p>If this was the first question to pop out of your mind, you might be looking at this artwork with the perception that this is an artwork by a “disabled person,” rather than perceiving it as a work of art as it is.</p>
<h2><span style="color: #ffffff;"><span style="background-color: #c00000;">ISSUE</span></span> Disability artists face challenges to overcome the barriers of perception and the lack of opportunity.</h2>
<p>Artists with disabilities carry on their journeys in life, surpassing the challenges of their bodies. However, they still encounter another high wall to overcome — the “matter of perception.” Many people perceive artworks and artistic activities of disability artists as “arts done by disabled persons,” rather than just “arts.”</p>
<p>Arts done by disabled persons is a term defining the act of artistic creation or expression from someone with physical or mental disabilities. Simply put, the term focuses on the disabilities of the performers instead of the activities themselves. Considering the disabilities of the artists before appreciating the artwork for itself, is the wall of perception that many disability artists face.<br>
<span style="color: #808080;"><em>※ “Hide and Seek Red” depicts a character covering his eyes with one arm and his friends who are hiding, revealing only their faces. According to the artist’s mother, the artist didn’t have many close friends in his childhood. Then who are the friends hidden in the painting?</em></span></p>
<p>Another high wall blocking artists with disabilities is the problem of “opportunity.”</p>
<p>Let’s look into the fifth comprehensive policy plan for people with disabilities, issued by the Ministry of Health and Welfare in 2018.</p>
<p><img class="aligncenter size-full wp-image-71506" src="https://dh4drhh3phab.cloudfront.net/en/wp-content/uploads/2020/07/posco_img_03.png" alt="" width="960" height="800"></p>
<p>The first to third policy plan (1998~2012) for people with disabilities was mainly about ensuring the equality and rights of the disabled persons. The fourth and fifth (2013~2022) policy plan focuses on relieving the gap between the lives of disabled and non-disabled persons. For this purpose, they include details that assert the importance of providing disabled persons with opportunities in education, culture, and sports sectors.</p>
<p>In reality, many disability artists have difficulties attracting the public&#8217;s attention, despite their artistic talents, since they lack opportunities to receive proper education or showcase their artworks. According to the &lt;2018 Examination and Research of the Current Condition of Arts and Culture of Disabled Artists&gt;, about 41 percent of disability artists responded that there weren&#8217;t enough opportunities to present their artistic activities. The figure is twice higher than the 20 percent of respondents who said, “It&#8217;s enough”.</p>
<p>Not only this, disability artists are struggling with publicity as well.</p>
<p><img class="aligncenter size-full wp-image-71507" src="https://dh4drhh3phab.cloudfront.net/en/wp-content/uploads/2020/07/posco_img_02_0717.jpg" alt="" width="960" height="603"></p>
<p>When asked if works of disability artists needed more publicity, more than 85 percent said it was “necessary,” with half of them deeming publicity “very necessary.” Despite such a dire need for promotion, the survey revealed that more than 60 percent of disability artists don’t have accounts for online artistic activities, such as YouTube, blogs, and other SNS channels. Only three out of ten respondents said that they actually engage in online activities.</p>
<p>Amidst the unsolved challenges of perception and lack of opportunities, a new variable has emerged in our lives today — the Era of New Normal. Will the gap between disability artists and non-disabled artists be narrowed in our reality where untact has become the new normal?</p>
<h2><span style="color: #ffffff;"><span style="background-color: #006699;">SOLUTION</span></span> Collaboration + Art = CollaboArtion</h2>
<p>POSCO 1% Foundation, a non-profit foundation operated with donations — 1% of the monthly pay — from executives and employees of POSCO Group and its partner companies, has devised a new project this year to support disability artists. The project has two objectives: improving the perception of disability artists is one, and putting disability artists on the map with genuine content and influential channels is another. Thus, the new project of POSCO 1% Foundation, “CollaboArtion,” was born.</p>
<p><img class="aligncenter size-full wp-image-71390" src="https://dh4drhh3phab.cloudfront.net/en/wp-content/uploads/2020/07/200615_E_.jpg" alt="" width="1423" height="2000"></p>
<p>The “CollaboArtion” project undertakes two programs. The first is providing opportunities where disability artists can communicate with the public through collaboration videos with celebrities. The second is creating personal storytelling videos of disability artists and promoting their artistic talents, which would present them with better opportunities to participate in artistic activities.</p>
<p>In Britain, where disability arts are well-established, there is a term called “inclusive arts.” It is a form of art where disability artists and non-disabled artists collaborate creatively and interactively. The “CollaboArtion” project is also an inclusive art, providing both disability and non-disabled artists with opportunities to improve their artistic level through unbiased and unrestricted artistic activities and collaborations.</p>
<p>POSCO 1% Foundation invited ten teams of disabled artists with recommendations from the Korea Disabled Artist Association: Boo-Yeol Han (western-style painter, developmental disorder), Hun Lee (one-handed pianist, brain lesion disorder), Hwan Park (western-style painter, visual impairment), Sung-Jin Cho (one-handed magician, brain lesion disorder), Yong-Ho Heo (children’s book author, general paralysis), Moon-Jung Choi &amp; Soo-Min Chae (wheelchair dancers, physical disability), A-Ra Ko (ballerina, auditory disorder), Yae-Na Choi (Pansori, visual impairment), Ji-Yeon Kim (rapper, auditory disorder), and Min-Ju Kim (web novel author, brain lesion disorder).</p>
<p>Each team will create two video contents — one original collaboration video and one impressive storytelling video — with 14 celebrities, including designer Hyeong-Cheol Jan, singer Min-Kyung Kang, and YouTube star Big Marvel. All videos are produced by a professional MCN (Multi-Channel Network) company ‘Treasure Hunter.’ The contents will be released on “POSCO TV, ” POSCO’s YouTube channel, as well as the channels of the influencers.</p>
<div class="video_wrap"><iframe src="https://www.youtube.com/embed/w2W5j-CJFYo?rel=0" width="300" height="150" allowfullscreen="allowfullscreen"><span data-mce-type="bookmark" style="display: inline-block; width: 0px; overflow: hidden; line-height: 0;" class="mce_SELRES_start"><span data-mce-type="bookmark" style="display: inline-block; width: 0px; overflow: hidden; line-height: 0;" mce_selres_start="">?</span></span></iframe></div>
<p>The first collaboration video featuring Boo-Yeol Han, a drawing artist, designer Hyeong-Cheol Jang, and YouTube star Korea Grandma Mak-Rye Park was uploaded on June 25. Boo-Yeol Han is the painter of the artwork “Hide and Seek Red” seen above and the first Korean autistic live drawing artist. The video features Korea Grandma Mak-Rye Park wearing an outfit, designed by Hyeong-Cheol Jang with the artwork of Boo-Yeol Han. The video, uploaded on POSCO TV, gives a glimpse of the life and works of the artist Boo-Yeol Han. Han’s story is delivered directly from him and his mother, presenting the viewers with deep emotions. Starting with Han’s video, POSCO TV will post these very special videos one by one until October.</p>
<div style="background-color: #ffffff;">
<div style="height: auto; border: 2px solid #cccccc; padding: 20px;"><span style="color: #000000;"><strong>[Corporate Citizen POSCO’s SOLUTION] Series </strong><br>
</span><br>
· <span style="color: #0000ff;"><a href="/coporate-citizen-newsroom-p8.html" target="_blank" rel="noopener">#1 POSCO ‘Employees’ Giving Program: “1% Sharing”</a><br>
· <a href="/coporate-citizen-newsroom-p7.html" target="_blank" rel="noopener">#2 ‘Sharing’ Competitiveness, ‘Sharing’ Growth</a><br>
· <a href="/coporate-citizen-newsroom-p6.html" target="_blank" rel="noopener">#3 POSCO’s Beloved Friend: The Ocean </a><br>
· <a href="/coporate-citizen-newsroom-p5.html" target="_blank" rel="noopener">#4 Young Man, It Ain’t Over till It’s Over </a><br>
</span></div>
</div>
</div>', 4)
INSERT [Crawl].[CoporateCitizenContent] ([Id], [Content], [CoporateCitizenCategoryId]) VALUES (5, N'<div class="sp_cont_wrap"><h2><span style="color: #ffffff;"><span style="background-color: #c00000;">ISSUE</span></span> Youth being neglected in the labor market</h2>
<p>The most affected by the COVID-19 issue regarding employment would be the youth. Though being the most productive age group, the youth are faced with a high unemployment rate, and this is expected to continue for the present as the COVID-19 pandemic hasn’t subsided yet. The issue isn’t confined to the labor market alone. As youth unemployment intensifies, it triggers a chain reaction. Young people put off and delay getting married and having children, which is more likely to accelerate population ageing — another severe issue in Korean society.</p>
<p>According to a survey conducted in May by the Korean Statistical Information Service (KOSIS), the unemployment rate of youth (ages 15 to 29) recorded 10.2 percent, and the number of unemployed youth reached 426,000, the highest among all age groups. The Economically Active Population Survey of Statistics Korea stated that as of May 2020, youth unemployment rate* was the highest among the record of each May since 1982.</p>
<p><strong><em><sup>*</sup>Youth Unemployment Rate: The proportion of unemployed persons among the economically active population of ages 15 to 29.</em></strong></p>
<p>The unemployment rate in the first half of 2020 recorded 7.7 percent, with 320,000 unemployed persons. Compared with these figures, the number of unemployed youth has increased by more than 100,000, and the unemployment rate a sharp increase of nearly 3 percent. For the many youth job seekers, this 10 percent figure is bound to seem much more enormous.</p>
<p><img class="aligncenter size-full wp-image-71030" src="https://dh4drhh3phab.cloudfront.net/en/wp-content/uploads/2020/07/posco_img_02_en.png" alt="" width="960" height="580"></p>
<p><span style="color: #003366;"><strong>The best solution for companies to resolve youth unemployment would be to expand the company’s employment through growth. However, with the global economy facing an economic slowdown, and the recent COVID-19 issue, the limits of this method for the company has become apparent.</strong></span></p>
<h2><span style="color: #ffffff;"><span style="background-color: #006699;">SOLUTION 1.</span></span> POSCO’s Practical Support: POSCO Youth Dream</h2>
<p>POSCO customized training programs for job seekers. The objective was to provide real-life business knowledge and practical experience that could be of practical help in the workplace. POSCO also paid careful attention to help youth explore their careers and realize their dreams.</p>
<p>POSCO’s ‘AI &amp; Big Data Academy,’ and the ‘Incubating School for Startups’ are all results of POSCO’s endeavor. The &#8216;POSCO Employment Academy&#8217; enables trainees to enhance both basic and problem-solving skills, while the ‘AI &amp; Big Data Academy’ cultivates expert professionals in engineering and technologies. The ‘Incubating School for Startups’ supports entrepreneurs towards establishing successful start-ups. POSCO has integrated the three training programs into a single name, POSCO Youth Dream, and has successfully branded the program as its own. The program, completed with POSCO’s existing resources — including POSTECH and POSCO Group University — is already making huge strides. As of 2019, a total of 1,108 job seekers have received training through the program, and 302 trainees (27%) succeeded in finding a job or starting a business. POSCO intends to train 5,500 job seekers over the next five years by 2023.</p>
<p>Young people who want to get a job or want to get help from POSCO as a prospective entrepreneur can take a closer look at the program chart below and apply now. Applications can be made through the website.</p>
<p><img class="aligncenter size-full wp-image-71029" src="https://dh4drhh3phab.cloudfront.net/en/wp-content/uploads/2020/07/posco_img_01_en.png" alt="" width="960" height="1125"></p>
<h2><span style="color: #ffffff;"><span style="background-color: #006699;">SOLUTION 2.</span></span> Youth Hope Sharing — A Program That Benefits Both Job Seekers and Partner Companies</h2>
<p>POSCO has been running the ‘Youth Hope Sharing’ program for 15 years. The program provides systematic training from basic and practical skills that are needed in the workplace to the mindset required for engineers. Since the training program is field-oriented, trainees learn directly from experts who have worked in the field for a long time, thus growing familiar with field terms and know-hows.</p>
<p>On completing the program, trainees are credited with job matching opportunities at POSCO partner companies, and the employment rate of trainees since 2005 stands at 95 percent. In 2019, out of 207 trainees, 167 (81%) succeeded in getting jobs at SMEs and partner companies.</p>
<p><img class="aligncenter size-full wp-image-68846" src="https://dh4drhh3phab.cloudfront.net/en/wp-content/uploads/2020/07/posco_img_03_en.png" alt="" width="960" height="642"></p>
<p>As trainees enhance their skills within the two months training period and succeed in obtaining a job, it leads to the growth in the partner companies’ capabilities as well, thus creating a circulation structure.</p>
<h3><strong>l POSCO youth dream support continues in 2020</strong></h3>
<p>In response to the voices of the youth, POSCO promises to provide programs that will enable youth job seekers and prospective entrepreneurs to advance towards their dreams. POSCO believes that its endeavor to help resolve problems facing society will serve as a foundation for its role as a Corporate Citizen.</p>
<p>For outstanding participants of the ‘AI Big Data Academy,’ POSCO is offering an employment opportunity at POSCO and POSCO ICT. From the second half of the year, POSCO plans to provide job matching programs for those trainees who have completed the ‘Practical Corporate Employment Education’ and are interested in POSCO partner companies and suppliers. POSCO is supporting the many different dreams and visions of the youth through its various programs.</p>
<p>POSCO’s training program for youth job seekers and entrepreneurs was postponed earlier this year due to the COVID-19 issue, but starting from May, they have been resumed gradually. More details can be found on related websites.</p>
<div style="background-color: #ffffff;">
<div style="height: auto; border: 2px solid #cccccc; padding: 20px;"><span style="color: #000000;"><strong>[Corporate Citizen POSCO’s SOLUTION] Series </strong><br>
</span><br>
· <span style="color: #0000ff;"><a href="/coporate-citizen-newsroom-p8.html" target="_blank" rel="noopener">#1 POSCO ‘Employees’ Giving Program: “1% Sharing”</a><br>
· <a href="/coporate-citizen-newsroom-p7.html" target="_blank" rel="noopener">#2 ‘Sharing’ Competitiveness, ‘Sharing’ Growth</a><br>
· <a href="/coporate-citizen-newsroom-p6.html" target="_blank" rel="noopener">#3 POSCO’s Beloved Friend: The Ocean </a><br>
</span></div>
</div>
</div>', 5)
INSERT [Crawl].[CoporateCitizenContent] ([Id], [Content], [CoporateCitizenCategoryId]) VALUES (6, N'<div class="sp_cont_wrap"><h2><strong><span style="color: #ffffff;"><span style="background-color: #c00000;"> ISSUE </span></span></strong> <strong> ‘Whitening’ phenomenon — aka sea desertification — is threatening the marine ecosystem. </strong></h2>
<p>In South Korea, there are different kinds of fish that people eat for every season. The reason that makes this possible is the geographical feature of the country. South Korea is a peninsula, meaning that the country is surrounded by the sea on three sides. Fish is caught all year round, with annual consumption of marine products reaching 58.4 kilograms per person as of 2017 — the highest in the world.</p>
<p>However, in contrast to this record, the amount of local fish catches have been decreasing. According to Statistics Korea, the annual production of marine products recorded 914,000 tons in 2019, down about 100,000 tons from 1,013,000 tons in 2018. The reason behind the disappearance of the formerly abundant fishery resources is the ‘Whitening’ phenomenon.</p>
<p>The whitening phenomenon, also known as sea desertification, is observed as marine algae living in the coastal rock beds disappear and are replaced with coralline algae. It is caused by multiple factors, including the following: rising sea temperature due to climate change, lack of nutrients (nitrogen, phosphorus, and silicon) in the seawater, and a decrease of iron components in the sea.</p>
<p>According to a study from FIRA (Korea Fisheries Resources Agency) in 2017, 61.7% of the costal rock bed in the East Sea was suffering from sea desertification. Every year, an astounding 12,970 hectares of rock beds are turning into sea deserts.</p>
<div id="attachment_70647" style="width: 970px" class="wp-caption aligncenter"><img class="wp-image-70647 size-full" src="https://dh4drhh3phab.cloudfront.net/en/wp-content/uploads/2020/06/posco_img_01-2.png" alt="" width="960" height="300"><p class="wp-caption-text">▲ Pink coralline algae replacing marine algae on the rock bed (left) and the rock bed transforming into a sea desert (right) (Source: FIRA)</p></div>
<p>The sea forest provides a basic food source for marine life and also a breeding ground for fish and shellfish. It acts as the foundation of the marine ecosystem by devising rich fishery resources and forming hideouts from predators. When these sea forests begin to disappear, shellfish, such as abalone, conch, and clam, cannot grow here. This result, in turn, is bound to pose a threat to the marine food chain.</p>
<h2><strong><span style="color: #ffffff;"><span style="background-color: #006699;"> SOLUTION </span></span></strong> POSCO’s Environmental Solution: Sea Forest Cultivation</h2>
<p>From its very beginning, POSCO has placed importance on its social responsibility for the environment and has been pursuing various environmental activities accordingly. Since 2000, the company has been evaluating projects that can be of practical assistance to the marine ecosystem as well as local communities. The projects weren&#8217;t just about financial support. POSCO utilized what it does best — steelmaking. The ‘Sea Forest Cultivation’ project is one of them.</p>
<h3><strong>Triton: the artificial reef brand made with POSCO&#8217;s steel slag</strong></h3>
<p>The main purpose of the ‘Sea Forest Cultivation’ project is to restore areas damaged by the whitening phenomenon. With the help of POSCO-developed Triton reefs, these areas are transformed into sea forests with abundant marine algae.</p>
<p><img class="aligncenter size-full wp-image-70648" src="https://dh4drhh3phab.cloudfront.net/en/wp-content/uploads/2020/06/posco_img_02_en.png" alt="" width="960" height="494"></p>
<p>Steel slag, a co-product of the steelmaking process, has high mineral content such as calcium and iron, that are useful for marine ecosystems than general aggregates. It also has a lower risk of being damaged from typhoons and tsunamis due to its high gravity and strength. There are three types of Triton reefs: A-type, T-type, and Steel-combined Triton. These Triton reefs have been approved by the Ministry of Oceans and Fisheries in 2014 and have been used for national sea forest cultivation projects since then.</p>
<p><img class="aligncenter size-full wp-image-70649" src="https://dh4drhh3phab.cloudfront.net/en/wp-content/uploads/2020/06/posco_img_03_en.png" alt="" width="960" height="362"></p>
<p>POSCO’s artificial reef project dates back to 2000. RIST, a research institute of industrial science and technology affiliated with POSCO, and the National Institute of Fisheries Science came together and installed 179 Triton reefs in Jeollanamdo Province. In 2010, POSCO signed an MOU with the Ministry of Oceans and Fisheries to create sea forests and fishery resources. Since then, 6,559 Triton reefs were installed in total as of 2019.</p>
<p><img class="aligncenter size-full wp-image-70650" src="https://dh4drhh3phab.cloudfront.net/en/wp-content/uploads/2020/06/posco_img_04_en.png" alt="" width="960" height="378"></p>
<p>The Triton sea forest, created in 30 locations in the Samcheok-Yeosu area, proves its excellent capability to restore the marine ecosystem and create fishery resources. In fact, investigation at the Triton sea forest in Yeosu revealed that compared to the surrounding general reefs, the Triton sea forest contained 1.9 times more marine life, 1.7 times more water, and 1.3 times more diverse algae.</p>
<p><img class="aligncenter size-full wp-image-70668" src="https://dh4drhh3phab.cloudfront.net/en/wp-content/uploads/2020/06/posco_img_05_en.png" alt="" width="960" height="909"></p>
<div id="attachment_70651" style="width: 970px" class="wp-caption aligncenter"><img class="wp-image-70651 size-full" src="https://dh4drhh3phab.cloudfront.net/en/wp-content/uploads/2020/06/posco_img_06.png" alt="" width="960" height="300"><p class="wp-caption-text">▲ Various marine algae growing abundantly in the Triton sea forest in Yeosu.</p></div>
<p>On May 28, POSCO set off to create another sea forest to mark the National Ocean Day (May 31). The new sea forest, created with Triton reefs and Triton sea fertilizers, was installed in Ulleung Island, where the whitening phenomenon was at its peak. For the project, POSCO gathered opinions from the local community and decided to create the sea forest in the 17~20-meter-deep area off the coast of Namyangri. Starting from May 13, 100 A-type Triton reefs and 750 Triton blocks were installed for two days, and on May 28, a ceremony was held to celebrate the creation of a new sea forest amidst the presence of local government officials.</p>
<div id="attachment_70653" style="width: 970px" class="wp-caption aligncenter"><img class="wp-image-70653 size-full" src="https://dh4drhh3phab.cloudfront.net/en/wp-content/uploads/2020/06/posco_img_10.png" alt="" width="960" height="640"><p class="wp-caption-text">▲ POSCO installing Triton sea forest in Ulleung Island</p></div>
<p>The sea forest cultivation project is the first Corporate Citizen project of local cooperation to restore the marine ecosystem. The project is expected to expand the food resource for high value-added fish species and also help improve the income of local fishermen. POSCO and Ulleung Island will continue follow-up management — including research of water quality, supplemental planting of marine algae, and exterminating harmful organisms.</p>
<h3>Triton Sea Forest can store “Blue Carbon”</h3>
<p>Triton sea forest is capable of storing carbon dioxide due to the carbonation of steel slag — its main material — and the photosynthesis of marine algae through which the sea forest can store 10 to 20 tons of carbon dioxide annually per hectare. The carbon dioxide stored in the coastal and marine ecosystem is called “Blue Carbon”.</p>
<p><img class="aligncenter size-full wp-image-70693" src="https://dh4drhh3phab.cloudfront.net/en/wp-content/uploads/2020/06/posco_img_08_en.png" alt="" width="960" height="873"></p>
<p>The marine ecosystem has up to 50 times more carbon absorption capacity than the terrestrial ecosystem. The reason why the Triton sea forest is considered as an effective means of blue carbon to prevent global warming lies here. However, since the marine ecosystem is less accessible and more difficult to understand than the terrestrial ecosystem, related studies have been insufficient. POSCO is to conduct scientific investigations on the effect of storing greenhouse gases in Triton sea forests.</p>
<p>Since January 2019, POSCO has been conducting joint research on blue carbon with POSTECH in Odo-ri, Pohang, where POSCO has created a sea forest with Triton reefs. Together, they measure the amount of carbon dioxide dissolved in seawater and analyze the dissolved organic carbon present in marine algae, sediments, and seawater.</p>
<div id="attachment_70669" style="width: 970px" class="wp-caption aligncenter"><img class="wp-image-70669 size-full" src="https://dh4drhh3phab.cloudfront.net/en/wp-content/uploads/2020/06/posco_img_09_en.png" alt="" width="960" height="489"><p class="wp-caption-text">▲ A CO₂ monitoring system being installed in the Triton sea forest of Odo-ri, Pohang, in 2016.</p></div>
<p>Triton reef is the perfect place to observe the blue carbon effect of sea forests because of its durability and ability to nurture a sea forest. The research conducted here is expected to lay the foundation for further studies regarding the effect of storing greenhouse gases in sea forests. POSCO will not stop here, but move on to seek ways to help the steel industry adapt to climate change in the marine sector. As a measure, the company will cooperate with Nippon Steel (Japanese steelmaker) on the blue carbon subject.</p>
<p><strong>&#8216;Building a Better Future Together&#8217;</strong> is what POSCO wishes to achieve through the sea forest cultivation project. POSCO will continue on its journey to becoming a global sustainable company, advancing past its title of leading global steelmaker.</p>
<div style="background-color: #ffffff;">
<div style="height: auto; border: 2px solid #cccccc; padding: 20px;"><span style="color: #000000;"><strong>[Corporate Citizen POSCO’s SOLUTION] Series </strong><br>
</span>· <span style="color: #0000ff;"><a href="/coporate-citizen-newsroom-p8.html" target="_blank" rel="noopener">#1 POSCO ‘Employees’ Giving Program: “1% Sharing”</a><br>
· <a href="/coporate-citizen-newsroom-p7.html" target="_blank" rel="noopener">#2 ‘Sharing’ Competitiveness, ‘Sharing’ Growth</a></span></div>
</div>
</div>', 6)
INSERT [Crawl].[CoporateCitizenContent] ([Id], [Content], [CoporateCitizenCategoryId]) VALUES (7, N'<div class="sp_cont_wrap"><h1><span style="color: #000000;">Part 2. Innovating the Competitiveness of Small and Medium Sized Enterprises (SMEs)</span></h1>
<h2><strong><span style="color: #ffffff;"><span style="background-color: #c00000;">ISSUE</span></span></strong> <strong>Manufacturing Industry: the backbone of Korean economy. But its SMEs are facing significant challenges.</strong></h2>
<p>The United Nations Industrial Development Organization (UNIDO) announces the countries’ ranking of manufacturing competitiveness every year. The Republic of Korea entered 17th in 1990 and made it to the Top 10 in 2003. In 2017, it ranked 4th. It took Korea just 28 years to jump from 17th to 4th — a truly remarkable leap forward. The products of the manufacturing industry make up 90 percent of total exports, and domestic jobs created by the industry add up to over 4.5 million. As of 2017, the GDP portion of the nation&#8217;s manufacturing industry stands at 30.4 percent — higher than that of China (29.3 percent). In this respect, it is evident that the manufacturing industry has played a significant role in the rapid growth of Korean economy.</p>
<p>However, Korea’s manufacturing industry is said to be facing huge challenges. The business in the manufacturing industry — including steel, shipbuilding, and automotive — have reached the maturity stage, and are struggling against fierce competition amid overcapacity in the global market. Besides, There has been an increasing number of issues regarding the ecosystem of the manufacturing industry in recent years, such as promoting balanced growth between large companies and SMEs. The industry is being flooded with new technologies of the Fourth Industrial Revolution — such as Big Data, the Internet of Things (IoT), and Artificial Intelligence. There are concerns that these technologies might widen the disparity between large companies and SMEs. Eventually, the gap in knowledge, information, and technology could lead to economic polarization.</p>
<p>According to OECD statistics, Korea is one of the countries with the largest productivity gap between large companies and SMEs. The labor productivity of SMEs relative to large companies recorded 53.8 percent in 1988 but fell to 32.5 percent in 2014. On the scale of R&amp;D expenditures, the gap between the two gradually widened over time as well. These gaps led to a huge difference in business performance, which in turn resulted in the disparity of labor, resources, and R&amp;D investment capacity. This kind of repeated cycle is fatal to the industrial ecosystem vulnerable to its instability.</p>
<p><img class="aligncenter wp-image-69277 size-full" src="https://dh4drhh3phab.cloudfront.net/en/wp-content/uploads/2020/05/posco_01_.png" width="960" height="705"></p>
<p>POSCO has an important role here. The World Economic Forum announced POSCO as a ‘Lighthouse Factory’ for pioneering the manufacturing industry by applying core technologies of the Fourth Industrial Revolution. There are 44 lighthouse factories around the world and POSCO is the first and only Korean company on the list.</p>
<p>So, POSCO came up with a solution: establishing and pursuing shared growth programs that enable SMEs to become smart together. Since POSCO has the competitiveness that transforms the huge steelworks into a lighthouse factory, the company is stepping forward, more than willingly, to share its competitiveness with SMEs in a bid to strengthen the industrial ecosystem.</p>
<h2><strong><span style="color: #ffffff;"><span style="background-color: #006699;">SOLUTION</span></span></strong> <strong>A POSCO-type Shared Growth</strong></h2>
<p>At POSCO, the term ‘Shared Growth’ isn’t a new concept. The company started its first Shared Growth activities in the late 1990s. In 2005, POSCO established an organization dedicated to the purpose and currently operates a total of 33 Shared Growth programs. The “Benefit Sharing” system, which is run by the government and participated by 472 companies nationwide, is known to be first launched by POSCO in 2004.</p>
<p>Among the many Shared Growth programs, POSCO focalizes on the POSCO-type Productivity Innovation as an effort to bridge the gap between large companies and SMEs.</p>
<p><img class="aligncenter wp-image-69272 size-full" src="https://dh4drhh3phab.cloudfront.net/en/wp-content/uploads/2020/05/posco_02_.png" width="960" height="849"></p>
<p>The &#8216;POSCO-type Productivity Innovation&#8217; program is an activity to transfer QSS (Quick Six Sigma), a POSCO’s own manufacturing innovation technique, and smart factory technology successfully built by POSCO. To facilitate it, POSCO is to contribute 20 billion KRW over five years and the government adds 10 billion KRW to run the program. So far, POSCO-type Productivity Innovation activities look similar to those of other companies.</p>
<p>However, delving into the details of the program, you might find something interesting — the program consists of two steps. The first step is ‘smartization consulting to enhance competence,’ and the second is ‘support service to build a smart factory’. Those two approaches might seem quite similar at first glance, but there is a reason why POSCO operates the program in this way. POSCO strives hard to teach how to fish rather than just give the fish itself.</p>
<p><img class="aligncenter wp-image-69273 size-full" src="https://dh4drhh3phab.cloudfront.net/en/wp-content/uploads/2020/05/posco_03.png" width="960" height="354"></p>
<p>Let’s say that building a smart factory is like making smart fishing spots and fishing gears. Good tools and fisheries are important, but before that, the fishers also need training. In the manufacturing industry, the importance of the workforce is paramount, so a smart factory can be completed only when the workforce becomes smart as well. For companies that need this fundamental change in structure, step 1 (smartization consulting) is implemented instead of building the smart factory straight away. POSCO carries out step 2 (support service to build a smart factory) for those companies that have already gone through innovation and are expected to create synergy with the build of a smart factory. The competitiveness and productivity innovation that POSCO would like to share lies here: a people-centered smart factory.</p>
<h3><strong><span style="color: #ffffff;"><span style="background-color: #006699;"> SOLUTION STEP 1 </span></span> </strong><strong>S</strong><strong>martization Consulting to Enhance Competence</strong></h3>
<p><img class="aligncenter wp-image-69216 size-full" src="https://dh4drhh3phab.cloudfront.net/en/wp-content/uploads/2020/05/posco_04.png" width="960" height="495"></p>
<p>‘Smartization consulting to enhance competence’ is an improved version of POSCO’s QSS Innovation activities that had been carried on from 2013 to 2018. QSS Innovation is an industrial movement to improve the productivity of the manufacturing workplace. ‘Smartization consulting’ also uses the QSS as a consulting tool, but this activity concentrates on changing the SMEs’ fundamental structure and lay the foundation for smartization prior to build a smart factory. Thus, the project not only enables innovation in productivity but also help detect areas that require a smart factory. As of 2019, POSCO had carried out consulting projects in 108 companies and plans to expand to 110 companies in 2020.</p>
<h3><strong><span style="color: #ffffff;"><span style="background-color: #006699;"> SOLUTION STEP 2 </span></span> Support Service to Build a Smart Factory</strong></h3>
<p><img class="aligncenter wp-image-69212 size-full" src="https://dh4drhh3phab.cloudfront.net/en/wp-content/uploads/2020/05/posco_05.png" width="960" height="503"></p>
<p>In the second step of the program, POSCO Group specialists help build a smart system that is suitable for the company. At this point, the surrounding environment and the scale of the company are taken into consideration. The provided services include monitoring facilities, MES, and ERP, etc. A customized system — according to the SMEs’ smartization level — is proposed and built, with POSCO and the government each bearing 30% of total expenses. If the project cost is less than 20 million KRW, the total amount is borne by the POSCO and the government — without the burden of SMEs.</p>
<p>In most &#8216;smart factory building support&#8217; provided by large companies, the support ends with just installing the system. But POSCO’s support can be differentiated since it reshapes the mind-set of the workforce in step 1, and then builds the smart factory in step 2. It is an ideal program, not just for establishing smart facilities but also for nurturing an intelligent workforce as well. Though there are some cases where the first and second steps of the program are conducted independently, POSCO plans to maximize synergies by implementing both steps as an integrated program. POSCO provided supports for 110 companies last year, and 120 companies will be supported this year. Targets include POSCO suppliers, partner and client companies, POSCO Group suppliers, and also companies that have no business transactions with POSCO.</p>
<p>&#8220;Shouldn&#8217;t our company be of a certain scale to get consulting from POSCO?&#8221; The answer is no. For the smaller SMEs, POSCO plans to introduce &#8220;Mini QSS&#8221; initiating this year. POSCO is to carry out consulting for smaller companies as well so that these companies can easily start innovative activities that are essential for growth.</p>
<h3><span style="color: #006699;"><strong>※ Solution Case Study</strong></span></h3>
<div class="txc-textbox" style="background-color: #dbe8fb; border: #79a5e4 1px dashed; padding: 10px;">
<div><b><strong>&lt;Smartization Consulting to Enhance Competence&gt;</strong></b></div>
<p><strong>Seohan Antamin Co., Ltd.,</strong> located in the southeastern industrial complex in Incheon, is a company that produces non-flammable internal and external construction materials. In 2016, the company launched the QSS Innovation activities (currently the smartization consulting) with POSCO. POSCO’s consultants visited the site every week and the consulting lasted for three years. In the year after the consulting started, the company’s performance graph showed a dramatic increase with defect indicators showing a steep decrease.</p>
<p>Such dramatic changes were possible just by innovating the way of working. As the activities turned out to be successful, Executives who were pessimistic about the QSS Innovation began to realize that field improvements and defect reduction activities eventually led to enhanced business performance. Employees broke their bad habits and initiated behavior changes on their own. The failure rate at the site fell dramatically. Last year, Seohan Antamin was presented with the Gold Tower of Order of Industrial Service Merit, once again proving the importance of the way of working.</p>
<p><img class="aligncenter wp-image-69213 size-full" src="https://dh4drhh3phab.cloudfront.net/en/wp-content/uploads/2020/05/posco_06.png" width="960" height="431"></p>
</div>
<div class="txc-textbox" style="background-color: #dbe8fb; border: #79a5e4 1px dashed; padding: 10px;">
<p><strong>&lt;Support Service to Build a Smart Factory&gt;</strong></p>
<p><strong>Daesung MDI</strong> is a limestone production &amp; supply company that operates silo facilities in Yeongwol district. Silo is a facility used for storing limestone and resemble tall towers. Workers had to go up and down such silos to check the inside and monitor the inventory. This inefficient way produced unproductive results. Since the inventory was monitored manually, the information was inaccurate. Also, production and sales departments couldn’t share inventory information in real-time, and this led to a major setback in sales.</p>
<p>In 2019, Daesung MDI built a smart factory in cooperation with POSCO. Workers no longer needed to climb the tall silos. Risks of safety accidents reduced greatly. The monitoring system installed in the silos provided accurate inventory information. This information is simultaneously shared through a mobile system without any restrictions. Now, marketers can operate sales activities with accurate information.</p>
<p><img class="aligncenter wp-image-69289 size-full" src="https://dh4drhh3phab.cloudfront.net/en/wp-content/uploads/2020/05/posco_07.png" width="960" height="744"></p>
</div>
<div style="background-color: #ffffff;">
<div style="height: auto; border: 2px solid #cccccc; padding: 20px;">
<p><span style="color: #000000;"><strong>Corporate Citizen POSCO’s SOLUTION Series</strong></span></p>
<p><strong>· <a href="/coporate-citizen-newsroom-p8.html" target="_blank" rel="noopener"><span style="color: #0000ff;">#1: POSCO ‘Employees’ Giving Program, “1% Sharing”</span></a></strong></p>
</div>
</div>
</div>', 7)
INSERT [Crawl].[CoporateCitizenContent] ([Id], [Content], [CoporateCitizenCategoryId]) VALUES (8, N'<div class="sp_cont_wrap"><p>COVID-19 has affected our society for the past few months. Lately, while the spread in Korea is in decrease, the virus has become a global pandemic. It has changed our everyday lives with apparent impacts on various sectors, such as social, educational, economic, and industrial sectors. We have never experienced this before, and it even seems as if we&#8217;re seeing the Butterfly Effect — &#8216;the flapping of a butterfly&#8217;s wings in Brazil causing a tornado in Texas&#8217; — in real action.</p>
<h2><span style="color: #ffffff;"><span style="background-color: #c00000;">ISSUE</span></span> The Unbearable ‘Hyperconnectivity’ of Being</h2>
<p>With the COVID-19 crisis, a close connection was observed among all the existing components in our lives including the state, society, economy, and industry.</p>
<p>“Hyper-Connected Society,” is not just a term describing phenomena in the cyber world. It is applied to the actual reality we live in, which in turn makes us realize that it takes more than a single person to make a safer and better world.</p>
<p><img class="aligncenter size-full wp-image-68634" src="https://dh4drhh3phab.cloudfront.net/en/wp-content/uploads/2020/04/posco_01_.png" alt="" width="960" height="1011"></p>
<p>The defense strategy to fight against the virus in the hyperconnected era is “Untact” and “Social Distancing” that have to do with cutting up the existing connection. Ironically, the power to overcome this situation is ‘staying together.’ How do the two go together? The trick lies here — social solidarity. It’s about the members of society, including the state and local government, quarantine task force, medical professionals, as well as citizens and corporations, to work together in their respective roles and join forces.</p>
<p>At present, Korean society has witnessed multiple cases of this social solidarity: Medical volunteers; Corporates, and citizens donating relief goods or funds for medical staff and quarantine task force; Volunteers making face masks; And companies providing staff training facilities for patient treatment.</p>
<p>Although COVID-19 is all over the news and the media, the virus isn’t the only concern confronting our society today. Youth unemployment, economic inequality, and problems associated with socially vulnerable groups including the elderly, disabled, and multicultural families are some of the many long-standing issues.</p>
<p>Corporates are indeed playing their parts respectively, facing these challenges. By utilizing accumulated assets, capabilities, and their businesses, they help in resolving social problems and overcoming crises. In turn, society acknowledges and credits these companies. This exchange creates a solid ring that enables both corporates and society to coexist in harmony.</p>
<p>The true value of business activity is mainly presented in two ways: 1) Meeting the needs of society businesswise, and 2) Demonstrating its ability to cope with the challenges of given times. In fact, these are apparent in numerous cases with leading companies around the world.</p>
<p>What about POSCO? POSCO had announced itself as “Corporate Citizen,” and committed to participate in solving social problems and contribute to creating a better world. So what actions have POSCO taken?</p>
<h2><span style="color: #ffffff;"><span style="background-color: #006699;">Solution</span></span> POSCO 1% Sharing: 99% POSCO Employees Donating 1% of Monthly Pay</h2>
<p>Empathy and sympathy. These two qualities would be the first thing that comes to mind when confronting the weak sides of society. To help someone going through a difficult time, one must be able to step into the shoes of that person and truly relate to the problems.</p>
<p>POSCO has been striving hard to resolve social issues for a long time. Currently, the company has taken up the slogan ‘With POSCO,’ which exhibits its empathy and sympathy towards society. Along with several other programs, POSCO is implementing a unique program to put this mission into practice — 1% Sharing.</p>
<p>POSCO&#8217;s 1% Sharing is aided by funds donated — 1% of the monthly pay — by employees and is used for the benefits of society. The donation is voluntary and automatically deducted from the salary. 98.5% of POSCO employees are taking part willingly, with pride that they are contributing to making a difference in society. 1% is a small amount, but when it adds up, it becomes huge. In 2019, the annual donation collected reached approximately 9 billion KRW.</p>
<p><img class="aligncenter size-full wp-image-68635" src="https://dh4drhh3phab.cloudfront.net/en/wp-content/uploads/2020/04/posco_02.png" alt="" width="960" height="349"></p>
<p><strong>Giving Activities: Started by General Managers &amp; Executives and Continued by the Labor-Management Committee</strong></p>
<p>In 2011, POSCO&#8217;s 1% Sharing commenced with general managers and executives donating 1% of their salaries. Two years later, as of February 2013, the Labor-Management Committee (LMC) took over and actively launched the 1% Love Campaign. As more and more employees sympathized with the purpose, they began to participate which led to an expansion in the scale of the fund. In November 2013, POSCO established the &#8216;POSCO 1% Foundation&#8217; as a measure to manage the fund in a more meaningful way. Adding on to support the 1% Sharing, the company went on to match employee donations with a one-to-one matching grant.</p>
<p>In its first year, the 1% Foundation raised 4 billion KRW in donations and since then, it has been focusing on activities to support the underprivileged groups of the community. As the end of 2019, the foundation has grown into a representative foundation with 98.5% POSCO employees participating and funds reaching 9.3 billion KRW.</p>
<p>The case of the 1% Foundation is the first and only example in Korea. There’s no other corporate that runs a social-giving foundation and supports it with matching donations of employees — reaching up to 98.5% of total employees. In fact, it seems like a rare case globally as well.</p>
<p>The 1% Foundation is growing even larger as 26 group companies and 88 partner companies joined in. At the end of last year, the number of donors reported a record-high 34,000.</p>
<p><strong>Trust Issues? No problem. Real Employee Donors in Charge of Program Suggestion And Execution! </strong></p>
<p>Statistics show that Korea isn’t a forerunner when it comes to donations. According to the 2018 World Giving Index published by the CAF, Korea ranked 60 among 146 survey countries — the 21st among the 36 OECD countries. This ranking is considerably low compared to the level of Korea’s GDP.</p>
<p><img class="aligncenter size-full wp-image-68636" src="https://dh4drhh3phab.cloudfront.net/en/wp-content/uploads/2020/04/posco_03.png" width="960" height="342"></p>
<p>In November 2019, Statistics Korea released a survey result that shows a decrease in the proportion of those who have donated in the past year or are willing to donate in the future. The percentage of respondents who have donated in the past year was 25.6% — down 10.8 percentage point from 2011 (36.4%). When asked for the reason of not donating, “Not enough financial resources” recorded 51.9%, lower than 2017 (57.3%). However, “Lack of trust in charity organizations” indicated an increase of 6 percentage point compared to 2017 (8.9% → 14.9%). This shows that the credibility and transparency of charity organizations do affect donations.</p>
<p><img class="aligncenter size-full wp-image-68637" src="https://dh4drhh3phab.cloudfront.net/en/wp-content/uploads/2020/04/posco_04.png" alt="" width="960" height="627"></p>
<p>The main driving force of the POSCO 1% Foundation is the donors. The donors actively participate in the planning, executing, and evaluation of the entire giving programs. The Fund Management Committee, consisting of donor and staff representatives, evaluates each program implemented by the Foundation. The execution of actual programs is carried on by the Foundation Bureau, which is composed of 150 employee donors of Pohang, Gwangyang, and Seoul. The Foundation Bureau is in charge of the following: selecting beneficiaries, monitoring each project, and reporting on the 1% Sharing to employee donors.</p>
<p>The project areas of POSCO 1% Foundation are determined according to the results of employee surveys. Since most employees have donated in the hope of supporting those in difficult situations, all projects of the POSCO 1% Foundation aim to educate the underprivileged and help build their self-sufficiency.</p>
<p>Many donors also participate in the operating process of the projects. POSCO 1% Foundation has succeeded in narrowing the gap with donors by promoting projects that encourage the self-directed contribution of employees. ‘Change My Town’ — a project that was proposed and directly executed by donors — is a good example with completed tasks reaching up to 49 as of last year. The following are some of the main programs of the project: 1) Ideas to eliminate blind spots in neighborhoods, 2) Funding a special summer vacation for those unable to afford a vacation, 3) Providing books, and 4) Relief activities at typhoon struck areas.</p>
<p>The projects are mainly focused on resolving issues of the communities directly related to the donors. The reason for this is based on POSCO’s idea: Help and support must start from its local community, expand into other regions, and at last further advance into other countries as well.</p>
<p>While supplying funds to beneficiaries, POSCO employee donors provide mentoring and encouragement throughout the program as well. The beneficiaries of the foundation say that they truly appreciate the warmth of the 35,000 employees — more than the donated fund itself. The key point of the 1% Foundation could be considered this: the sincerity of the participating employee donors.</p>
<div style="background-color: #daf2fe;">
<div style="height: auto; border: 1px solid #006699; padding: 20px;">
<h3 style="text-align: center;"><strong>The Story of the POSCO 1% Sharing Beneficiaries</strong></h3>
<p><em>“Knowing that I was supported by so many POSCO employees was quite overwhelming. They even came to my games and cheered for me. I could win the gold medal and also break the Korean record, all thanks to them. The special wheelchair, which POSCO supported, enabled me to keep balance and play in a stable condition.”</em><br>
<em>– Mr. OOO from Pohang, who participated in the field games of the National Paralympic Games held in Seoul, 2019.</em></p>
<p><em>“I grew up at a shelter. When I turned 18, I had to leave the facility. I had 5 million KRW, which I soon ran out of because I got scammed. I began living at the school dormitory and took up a part-time job to pay for my living. The real problem occurred after I graduated from school. I dreamed of becoming a social worker, but I couldn&#8217;t make a living out of it, so I ended up getting a job at a small event company. However, shortly afterward, the company had to close down. I was at a loss and couldn’t figure out what to do. That was when I met POSCO 1% Foundation. The foundation supported my tuition and living expenses so that I could become a social worker. Also, the Financial Volunteer Group consisting of POSCO Finance Office employees, gave me financial advice, including ways to get a safe loan and manage my bank account as well. Thanks to these supports, I was able to study and become a social worker. I’m really grateful to the POSCO employees who reached out to me when I most needed help. POSCO 1% Foundation truly changed my life.”</em></p>
<p><em>– Mr. OOO, currently a social worker</em></p>
</div>
</div>
<p><strong>Transparent Management — Not Even a Penny into &#8216;Company PR’</strong></p>
<p>One of the distinguishable features of POSCO 1% Foundation is its transparent management. Each quarter, a report of each project — including every detail of how the fund was used — is published through EP(Enterprise Portal). The foundation operates its website and runs a separate online system integrated with EP where POSCO employees can participate in donations or apply other changes in real-time. The transparent management cultivated credibility in the foundation and was followed by special donations, that include employees’ prize bonuses and other external profits. In 2019, the number of special donations totaled 512 cases.</p>
<p><img class="aligncenter size-full wp-image-68638" src="https://dh4drhh3phab.cloudfront.net/en/wp-content/uploads/2020/04/posco_05.png" alt="" width="960" height="196"></p>
<p>POSCO CEO Jeong-Woo, Choi, also contributed to the 98.5% of employee participation. He clearly stated that although POSCO 1% Foundation is operated with donations from POSCO employees, it is to be run as a separate non-profit foundation. Choi made sure that none of the funds at POSCO 1% Foundation was used for corporate PR activities.</p>
<p><img class="aligncenter size-full wp-image-68639" src="https://dh4drhh3phab.cloudfront.net/en/wp-content/uploads/2020/04/posco_06_.png" width="960" height="724"></p>
<p>The participants of the 1% Sharing testify how happy they are to be a part. Though 1% might be a small amount, the expectations are very high as it may shine a light in the shadows of many. It is said that dewdrops gathered together can form a great ocean. POSCO Newsroom believes that the 1% Sharing of POSCO will continue to flow into the lives of people in need.</p>
</div>', 8)
SET IDENTITY_INSERT [Crawl].[CoporateCitizenContent] OFF
INSERT [dbo].[Conversation] ([Id], [Content], [OwnerId], [SenderId], [ParentId], [CreatedDate], [Status]) VALUES (N'cf9702b3-d0c7-4dc2-bda3-026fc685f035', N'sdfsdfsdf', N'a1bd76a0-7ead-4ceb-8744-d92d55f4ef86', N'a1bd76a0-7ead-4ceb-8744-d92d55f4ef86', NULL, CAST(N'2021-06-02 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Conversation] ([Id], [Content], [OwnerId], [SenderId], [ParentId], [CreatedDate], [Status]) VALUES (N'a6c10551-8adc-44d5-a22c-12319d889b69', N'fghfghgfhfg', N'a1bd76a0-7ead-4ceb-8744-d92d55f4ef86', N'a1bd76a0-7ead-4ceb-8744-d92d55f4ef86', NULL, CAST(N'2021-06-02 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Conversation] ([Id], [Content], [OwnerId], [SenderId], [ParentId], [CreatedDate], [Status]) VALUES (N'14431bad-31ee-4531-9603-268e3a1dce92', N'ghjhgjghj', N'a1bd76a0-7ead-4ceb-8744-d92d55f4ef86', N'a1bd76a0-7ead-4ceb-8744-d92d55f4ef86', NULL, CAST(N'2021-06-02 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Conversation] ([Id], [Content], [OwnerId], [SenderId], [ParentId], [CreatedDate], [Status]) VALUES (N'1a23c1a9-8d39-4f4c-85c3-408faf9772a9', N'sdfsdfsdfsdf', N'a1bd76a0-7ead-4ceb-8744-d92d55f4ef86', N'a1bd76a0-7ead-4ceb-8744-d92d55f4ef86', NULL, CAST(N'2021-06-02 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Conversation] ([Id], [Content], [OwnerId], [SenderId], [ParentId], [CreatedDate], [Status]) VALUES (N'd85360e4-da18-45ae-9eb0-4e2b294dddfe', N'sdfdsfdsfsd', N'a1bd76a0-7ead-4ceb-8744-d92d55f4ef86', N'a1bd76a0-7ead-4ceb-8744-d92d55f4ef86', NULL, CAST(N'2021-06-02 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Conversation] ([Id], [Content], [OwnerId], [SenderId], [ParentId], [CreatedDate], [Status]) VALUES (N'9ff5c4da-ea60-4774-a1c6-53dd179cae7d', N'dsfsdfds', N'a1bd76a0-7ead-4ceb-8744-d92d55f4ef86', N'a1bd76a0-7ead-4ceb-8744-d92d55f4ef86', NULL, CAST(N'2021-06-02 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Conversation] ([Id], [Content], [OwnerId], [SenderId], [ParentId], [CreatedDate], [Status]) VALUES (N'c8a57152-c426-46b0-8acc-5a76d2cb0902', N'dfgdfgdfgdfg', N'a1bd76a0-7ead-4ceb-8744-d92d55f4ef86', N'a1bd76a0-7ead-4ceb-8744-d92d55f4ef86', NULL, CAST(N'2021-06-02 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Conversation] ([Id], [Content], [OwnerId], [SenderId], [ParentId], [CreatedDate], [Status]) VALUES (N'f453cd62-8d1b-40c6-94eb-5cdfb9e15560', N'Content A1BD76A0-7EAD-4CEB-8744-D92D55F4EF86', N'a1bd76a0-7ead-4ceb-8744-d92d55f4ef86', N'a1bd76a0-7ead-4ceb-8744-d92d55f4ef86', NULL, CAST(N'2021-06-02 10:21:55.800' AS DateTime), 0)
INSERT [dbo].[Conversation] ([Id], [Content], [OwnerId], [SenderId], [ParentId], [CreatedDate], [Status]) VALUES (N'd099aa43-0f64-4ed2-b08f-7b48da25d8eb', N'fgdfgfd', N'a1bd76a0-7ead-4ceb-8744-d92d55f4ef86', N'a1bd76a0-7ead-4ceb-8744-d92d55f4ef86', NULL, CAST(N'2021-06-02 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Conversation] ([Id], [Content], [OwnerId], [SenderId], [ParentId], [CreatedDate], [Status]) VALUES (N'2e7bea8f-7010-4ad9-8c0d-8269428ac36d', N'hjhkjhkjhkhjk', N'e4013a16-180b-49f5-8f27-c0654b21bb36', N'a1bd76a0-7ead-4ceb-8744-d92d55f4ef86', NULL, CAST(N'2021-06-02 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Conversation] ([Id], [Content], [OwnerId], [SenderId], [ParentId], [CreatedDate], [Status]) VALUES (N'c76cf9de-429b-4774-907d-859ae651fd95', N'dfdsfsdf', N'89d2a430-7602-4c70-8641-a716fc929150', N'a1bd76a0-7ead-4ceb-8744-d92d55f4ef86', NULL, CAST(N'2021-06-02 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Conversation] ([Id], [Content], [OwnerId], [SenderId], [ParentId], [CreatedDate], [Status]) VALUES (N'fea61c75-45d1-4687-9fd6-88ad34352a50', N'hgjghjghj', N'a1bd76a0-7ead-4ceb-8744-d92d55f4ef86', N'a1bd76a0-7ead-4ceb-8744-d92d55f4ef86', NULL, CAST(N'2021-06-02 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Conversation] ([Id], [Content], [OwnerId], [SenderId], [ParentId], [CreatedDate], [Status]) VALUES (N'623902c7-e4ca-41a3-9a38-ac9399e388b2', N';KL;KL;KL;LK;', N'a1bd76a0-7ead-4ceb-8744-d92d55f4ef86', N'a1bd76a0-7ead-4ceb-8744-d92d55f4ef86', NULL, CAST(N'2021-06-02 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Conversation] ([Id], [Content], [OwnerId], [SenderId], [ParentId], [CreatedDate], [Status]) VALUES (N'bb122455-331f-4696-8016-afd81b780b0c', N'Content E4013A16-180B-49F5-8F27-C0654B21BB36', N'e4013a16-180b-49f5-8f27-c0654b21bb36', N'e4013a16-180b-49f5-8f27-c0654b21bb36', NULL, CAST(N'2021-06-02 10:21:55.800' AS DateTime), 0)
INSERT [dbo].[Conversation] ([Id], [Content], [OwnerId], [SenderId], [ParentId], [CreatedDate], [Status]) VALUES (N'92d35846-ac07-4d04-a072-b1372987a989', N'Content 89D2A430-7602-4C70-8641-A716FC929150', N'89d2a430-7602-4c70-8641-a716fc929150', N'89d2a430-7602-4c70-8641-a716fc929150', NULL, CAST(N'2021-06-02 10:21:55.797' AS DateTime), 0)
INSERT [dbo].[Conversation] ([Id], [Content], [OwnerId], [SenderId], [ParentId], [CreatedDate], [Status]) VALUES (N'59de04df-3d50-4990-aa5e-bb799a464543', N'fafafafdasf', N'89d2a430-7602-4c70-8641-a716fc929150', N'a1bd76a0-7ead-4ceb-8744-d92d55f4ef86', NULL, CAST(N'2021-06-02 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Conversation] ([Id], [Content], [OwnerId], [SenderId], [ParentId], [CreatedDate], [Status]) VALUES (N'83a341b6-63fc-4223-92d7-ea69d4a931ca', N'asdasd', N'e4013a16-180b-49f5-8f27-c0654b21bb36', N'a1bd76a0-7ead-4ceb-8744-d92d55f4ef86', NULL, CAST(N'2021-06-02 00:00:00.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([Id], [CompanyName], [CompanyAddress], [Telephone], [Email], [PasswordHash], [PasswordSalt], [DateCreated], [IsActive], [IsVerify]) VALUES (9, N'CTY TNHH YANTAI MOON VIET NAM ', N'LO 55, KCX -CN LINH TRUNG 3 AN TINH TRANG BANG TAY NINH ', N'0909308822', N'THTHUY2003@GMAIL.COM', N'MHjh6fHMTW2peg7UjAIUB0HIWUCPx0D4', N'MQjx21Iz8Ln7HnkZMQ4doxpLDTm4rcEY', CAST(N'2020-11-07' AS Date), 1, 1)
INSERT [dbo].[Customer] ([Id], [CompanyName], [CompanyAddress], [Telephone], [Email], [PasswordHash], [PasswordSalt], [DateCreated], [IsActive], [IsVerify]) VALUES (34, N'Business Sweden', N'Lotte Hanoi Center', N'0838741694', N'nguyen.dang@business-sweden.se', N'yvVRSH5GgOIs8WXP3CWW1KSS7Juno/jD', N'qIL2PsPVkWX2FfhSXEI0buvgxK8i5ugI', CAST(N'2020-11-09' AS Date), 1, 1)
INSERT [dbo].[Customer] ([Id], [CompanyName], [CompanyAddress], [Telephone], [Email], [PasswordHash], [PasswordSalt], [DateCreated], [IsActive], [IsVerify]) VALUES (36, N'Posco VST', N'Nhơn Trạch', N'02513560360', N'poscovstkcn1@gmail.com', N'1lfeybeV4u6fBzZN25yQLaYiy8+45n43', N'20EFG+/gDTXXTxUIAk1+FV5/YXlUo//D', CAST(N'2020-11-10' AS Date), 1, 1)
INSERT [dbo].[Customer] ([Id], [CompanyName], [CompanyAddress], [Telephone], [Email], [PasswordHash], [PasswordSalt], [DateCreated], [IsActive], [IsVerify]) VALUES (39, N'Phu Khang Tech', N'202/12 Nguyễn Xí, Phường 26, Quận Bình Thạnh, TPHCM', N'0944054927', N'khoa.phukhang@gmail.com', N'c/hES0Omlu5o+fPhYaVACJbZk9TfUPHD', N'cjVb2RcD7FSArVZwMBYSRdqT72w+r8+K', CAST(N'2020-11-17' AS Date), 0, 0)
INSERT [dbo].[Customer] ([Id], [CompanyName], [CompanyAddress], [Telephone], [Email], [PasswordHash], [PasswordSalt], [DateCreated], [IsActive], [IsVerify]) VALUES (40, N'DTL', N'DTL', N'0838698730', N'vothanhlam1973@gmail.com', N'+fr+4aFxJIrT9efo6HlIOxyYzTowACdV', N'0aBRmnSJEMg1FD22LfvMFZuyEgI1nA8X', CAST(N'2020-11-25' AS Date), 0, 0)
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[HeaderCategory] ON 

INSERT [dbo].[HeaderCategory] ([Id], [Name], [Alias]) VALUES (1, N'Introduction', N'introduction')
INSERT [dbo].[HeaderCategory] ([Id], [Name], [Alias]) VALUES (2, N'Process & Product', N'Process-Product')
INSERT [dbo].[HeaderCategory] ([Id], [Name], [Alias]) VALUES (3, N'Open Business', N'introduction')
INSERT [dbo].[HeaderCategory] ([Id], [Name], [Alias]) VALUES (4, N'PR', N'pr')
INSERT [dbo].[HeaderCategory] ([Id], [Name], [Alias]) VALUES (5, N'Contact', N'contact')
INSERT [dbo].[HeaderCategory] ([Id], [Name], [Alias]) VALUES (6, N'About Stainless Steel', N'about-stainless-steel')
SET IDENTITY_INSERT [dbo].[HeaderCategory] OFF
SET IDENTITY_INSERT [dbo].[HeaderDetail] ON 

INSERT [dbo].[HeaderDetail] ([Id], [Name], [Alias], [HeaderCategoryId], [ParentId]) VALUES (1, N'Introduction', N'introduction', 1, NULL)
INSERT [dbo].[HeaderDetail] ([Id], [Name], [Alias], [HeaderCategoryId], [ParentId]) VALUES (2, N'Vision', N'vision', 1, NULL)
INSERT [dbo].[HeaderDetail] ([Id], [Name], [Alias], [HeaderCategoryId], [ParentId]) VALUES (3, N'History', N'history', 1, NULL)
INSERT [dbo].[HeaderDetail] ([Id], [Name], [Alias], [HeaderCategoryId], [ParentId]) VALUES (4, N'Organization', N'organization', 1, NULL)
INSERT [dbo].[HeaderDetail] ([Id], [Name], [Alias], [HeaderCategoryId], [ParentId]) VALUES (5, N'Production Process', NULL, 2, NULL)
INSERT [dbo].[HeaderDetail] ([Id], [Name], [Alias], [HeaderCategoryId], [ParentId]) VALUES (6, N'Products', NULL, 2, NULL)
INSERT [dbo].[HeaderDetail] ([Id], [Name], [Alias], [HeaderCategoryId], [ParentId]) VALUES (7, N'VST Specilized Products', NULL, 2, NULL)
INSERT [dbo].[HeaderDetail] ([Id], [Name], [Alias], [HeaderCategoryId], [ParentId]) VALUES (8, N'Recruitment', N'recruitment', 3, NULL)
INSERT [dbo].[HeaderDetail] ([Id], [Name], [Alias], [HeaderCategoryId], [ParentId]) VALUES (9, N'Scrap Bidding', N'scrap-bidding', 3, NULL)
INSERT [dbo].[HeaderDetail] ([Id], [Name], [Alias], [HeaderCategoryId], [ParentId]) VALUES (10, N'Purchasing', N'purchasing', 3, NULL)
INSERT [dbo].[HeaderDetail] ([Id], [Name], [Alias], [HeaderCategoryId], [ParentId]) VALUES (11, N'Ethics', N'ethics', 3, NULL)
INSERT [dbo].[HeaderDetail] ([Id], [Name], [Alias], [HeaderCategoryId], [ParentId]) VALUES (12, N'News & Infomation', N'news-information', 4, NULL)
INSERT [dbo].[HeaderDetail] ([Id], [Name], [Alias], [HeaderCategoryId], [ParentId]) VALUES (13, N'Facilities', N'facilities', 4, NULL)
INSERT [dbo].[HeaderDetail] ([Id], [Name], [Alias], [HeaderCategoryId], [ParentId]) VALUES (14, N'Contact VST', N'contact-vst', 5, NULL)
INSERT [dbo].[HeaderDetail] ([Id], [Name], [Alias], [HeaderCategoryId], [ParentId]) VALUES (15, N'Posco Family', N'posco-family', 5, NULL)
INSERT [dbo].[HeaderDetail] ([Id], [Name], [Alias], [HeaderCategoryId], [ParentId]) VALUES (16, N'Stainless Steel Guidebook', N'stainless-steel-guidebook', 6, NULL)
INSERT [dbo].[HeaderDetail] ([Id], [Name], [Alias], [HeaderCategoryId], [ParentId]) VALUES (17, N'Corrosion', N'corrosion', 6, NULL)
INSERT [dbo].[HeaderDetail] ([Id], [Name], [Alias], [HeaderCategoryId], [ParentId]) VALUES (18, N'Welding', N'welding', 6, NULL)
INSERT [dbo].[HeaderDetail] ([Id], [Name], [Alias], [HeaderCategoryId], [ParentId]) VALUES (19, N'Forming', N'forming', 6, NULL)
INSERT [dbo].[HeaderDetail] ([Id], [Name], [Alias], [HeaderCategoryId], [ParentId]) VALUES (20, N'Application', NULL, 6, NULL)
INSERT [dbo].[HeaderDetail] ([Id], [Name], [Alias], [HeaderCategoryId], [ParentId]) VALUES (21, N'Series 400 Stanless Steel', NULL, 6, NULL)
INSERT [dbo].[HeaderDetail] ([Id], [Name], [Alias], [HeaderCategoryId], [ParentId]) VALUES (22, N'2B', N'production-process-2b', 2, 5)
INSERT [dbo].[HeaderDetail] ([Id], [Name], [Alias], [HeaderCategoryId], [ParentId]) VALUES (23, N'BA', N'production-process-ba', 2, 5)
INSERT [dbo].[HeaderDetail] ([Id], [Name], [Alias], [HeaderCategoryId], [ParentId]) VALUES (24, N'Precision', N'precision', 2, 5)
INSERT [dbo].[HeaderDetail] ([Id], [Name], [Alias], [HeaderCategoryId], [ParentId]) VALUES (25, N'Surface Processing', N'surface-processing', 2, 5)
INSERT [dbo].[HeaderDetail] ([Id], [Name], [Alias], [HeaderCategoryId], [ParentId]) VALUES (26, N'Series 300', NULL, 2, 6)
INSERT [dbo].[HeaderDetail] ([Id], [Name], [Alias], [HeaderCategoryId], [ParentId]) VALUES (27, N'Series 400', NULL, 2, 6)
INSERT [dbo].[HeaderDetail] ([Id], [Name], [Alias], [HeaderCategoryId], [ParentId]) VALUES (28, N'301Cu', N'301cu', 2, 7)
INSERT [dbo].[HeaderDetail] ([Id], [Name], [Alias], [HeaderCategoryId], [ParentId]) VALUES (29, N'304Cu', N'304cu', 2, 7)
INSERT [dbo].[HeaderDetail] ([Id], [Name], [Alias], [HeaderCategoryId], [ParentId]) VALUES (30, N'329J3L', N'329j3l', 2, 7)
INSERT [dbo].[HeaderDetail] ([Id], [Name], [Alias], [HeaderCategoryId], [ParentId]) VALUES (31, N'430RE', N'430re', 2, 7)
INSERT [dbo].[HeaderDetail] ([Id], [Name], [Alias], [HeaderCategoryId], [ParentId]) VALUES (32, N'445NF', N'445nf', 2, 7)
INSERT [dbo].[HeaderDetail] ([Id], [Name], [Alias], [HeaderCategoryId], [ParentId]) VALUES (33, N'No.4/HL Surface', N'no4-hl-surface', 2, 7)
INSERT [dbo].[HeaderDetail] ([Id], [Name], [Alias], [HeaderCategoryId], [ParentId]) VALUES (34, N'Water Tank Industry', N'water-tank-industry', 6, 20)
INSERT [dbo].[HeaderDetail] ([Id], [Name], [Alias], [HeaderCategoryId], [ParentId]) VALUES (35, N'445NF', N'about-445nf', 6, 21)
INSERT [dbo].[HeaderDetail] ([Id], [Name], [Alias], [HeaderCategoryId], [ParentId]) VALUES (36, N'304/304L', N'304304l', 2, 26)
INSERT [dbo].[HeaderDetail] ([Id], [Name], [Alias], [HeaderCategoryId], [ParentId]) VALUES (37, N'301/301L', N'301301l', 2, 26)
INSERT [dbo].[HeaderDetail] ([Id], [Name], [Alias], [HeaderCategoryId], [ParentId]) VALUES (38, N'316/316L', N'316316l', 2, 26)
INSERT [dbo].[HeaderDetail] ([Id], [Name], [Alias], [HeaderCategoryId], [ParentId]) VALUES (39, N'321', N'321', 2, 26)
INSERT [dbo].[HeaderDetail] ([Id], [Name], [Alias], [HeaderCategoryId], [ParentId]) VALUES (40, N'310S', N'310s', 2, 26)
INSERT [dbo].[HeaderDetail] ([Id], [Name], [Alias], [HeaderCategoryId], [ParentId]) VALUES (41, N'409L', N'409l', 2, 27)
INSERT [dbo].[HeaderDetail] ([Id], [Name], [Alias], [HeaderCategoryId], [ParentId]) VALUES (42, N'410S', N'410s', 2, 27)
INSERT [dbo].[HeaderDetail] ([Id], [Name], [Alias], [HeaderCategoryId], [ParentId]) VALUES (43, N'430', N'430', 2, 27)
INSERT [dbo].[HeaderDetail] ([Id], [Name], [Alias], [HeaderCategoryId], [ParentId]) VALUES (44, N'430J1L', N'430j1l', 2, 27)
INSERT [dbo].[HeaderDetail] ([Id], [Name], [Alias], [HeaderCategoryId], [ParentId]) VALUES (45, N'436L', N'436l', 2, 27)
INSERT [dbo].[HeaderDetail] ([Id], [Name], [Alias], [HeaderCategoryId], [ParentId]) VALUES (46, N'439/430LX', N'439430lx', 2, 27)
INSERT [dbo].[HeaderDetail] ([Id], [Name], [Alias], [HeaderCategoryId], [ParentId]) VALUES (47, N'441', N'441', 2, 27)
INSERT [dbo].[HeaderDetail] ([Id], [Name], [Alias], [HeaderCategoryId], [ParentId]) VALUES (48, N'444', N'444', 2, 27)
INSERT [dbo].[HeaderDetail] ([Id], [Name], [Alias], [HeaderCategoryId], [ParentId]) VALUES (49, N'420J1/420J2', N'420j1420j2', 2, 27)
INSERT [dbo].[HeaderDetail] ([Id], [Name], [Alias], [HeaderCategoryId], [ParentId]) VALUES (50, N'420N1', N'420n1', 2, 27)
INSERT [dbo].[HeaderDetail] ([Id], [Name], [Alias], [HeaderCategoryId], [ParentId]) VALUES (51, N'Coporate Citizen', N'coporate-citizen', 4, NULL)
SET IDENTITY_INSERT [dbo].[HeaderDetail] OFF
SET IDENTITY_INSERT [dbo].[Images] ON 

INSERT [dbo].[Images] ([Id], [ImageDescription], [FilePath], [MinimalFilePath], [DatePosted], [IsActive], [HeaderDetailId]) VALUES (1, N'POSCO VST supports buying watermelons for farmers', N'/media/images/News/News20.PNG', N'/media/thumbnails/News/News20.PNG', CAST(N'2020-09-15' AS Date), 1, 51)
INSERT [dbo].[Images] ([Id], [ImageDescription], [FilePath], [MinimalFilePath], [DatePosted], [IsActive], [HeaderDetailId]) VALUES (2, N'Volunteer activities with VHPC', N'/media/images/News/News19.JPG', N'/media/thumbnails/News/News19.JPG', CAST(N'2020-09-15' AS Date), 1, 12)
INSERT [dbo].[Images] ([Id], [ImageDescription], [FilePath], [MinimalFilePath], [DatePosted], [IsActive], [HeaderDetailId]) VALUES (3, N'Posco Vst Vision Work Shop 2019', N'/media/images/News/News18.JPG', N'/media/thumbnails/News/News18.JPG', CAST(N'2020-09-15' AS Date), 1, 12)
INSERT [dbo].[Images] ([Id], [ImageDescription], [FilePath], [MinimalFilePath], [DatePosted], [IsActive], [HeaderDetailId]) VALUES (4, N'POSCO VST Volunteer Plan at Hoa Mai Orphan', N'/media/images/News/News17.JPG', N'/media/thumbnails/News/News17.JPG', CAST(N'2020-09-15' AS Date), 1, 51)
INSERT [dbo].[Images] ([Id], [ImageDescription], [FilePath], [MinimalFilePath], [DatePosted], [IsActive], [HeaderDetailId]) VALUES (5, N'Anniversary of Founding of Posco VST 10th', N'/media/images/News/News16.JPG', N'/media/thumbnails/News/News16.JPG', CAST(N'2020-09-15' AS Date), 1, 12)
INSERT [dbo].[Images] ([Id], [ImageDescription], [FilePath], [MinimalFilePath], [DatePosted], [IsActive], [HeaderDetailId]) VALUES (6, N'Buiding Charity House at Vung Tau', N'/media/images/News/News15.JPG', N'/media/thumbnails/News/News15.JPG', CAST(N'2020-09-15' AS Date), 1, 12)
INSERT [dbo].[Images] ([Id], [ImageDescription], [FilePath], [MinimalFilePath], [DatePosted], [IsActive], [HeaderDetailId]) VALUES (7, N'Annual Healthy Check for Employees', N'/media/images/News/News14.JPG', N'/media/thumbnails/News/News14.JPG', CAST(N'2020-09-15' AS Date), 1, 12)
INSERT [dbo].[Images] ([Id], [ImageDescription], [FilePath], [MinimalFilePath], [DatePosted], [IsActive], [HeaderDetailId]) VALUES (8, N'Customer & Supplier Appreciation', N'/media/images/News/News13.JPG', N'/media/thumbnails/News/News13.JPG', CAST(N'2020-09-15' AS Date), 1, 12)
INSERT [dbo].[Images] ([Id], [ImageDescription], [FilePath], [MinimalFilePath], [DatePosted], [IsActive], [HeaderDetailId]) VALUES (9, N'Buillding Charity House of Posco Family Activities', N'/media/images/News/News12.JPG', N'/media/thumbnails/News/News12.JPG', CAST(N'2020-09-15' AS Date), 1, 51)
INSERT [dbo].[Images] ([Id], [ImageDescription], [FilePath], [MinimalFilePath], [DatePosted], [IsActive], [HeaderDetailId]) VALUES (10, N'POSCO VST Volunteer Plan at An Lac Orphan', N'/media/images/News/News11.JPG', N'/media/thumbnails/News/News11.JPG', CAST(N'2020-09-15' AS Date), 1, 51)
INSERT [dbo].[Images] ([Id], [ImageDescription], [FilePath], [MinimalFilePath], [DatePosted], [IsActive], [HeaderDetailId]) VALUES (11, N'Anniversary of Founding of Posco VST 7th', N'/media/images/News/News10.JPG', N'/media/thumbnails/News/News10.JPG', CAST(N'2020-09-15' AS Date), 1, 12)
INSERT [dbo].[Images] ([Id], [ImageDescription], [FilePath], [MinimalFilePath], [DatePosted], [IsActive], [HeaderDetailId]) VALUES (12, N'QSS Weekly at Wednesday', N'/media/images/News/News09.JPG', N'/media/thumbnails/News/News09.JPG', CAST(N'2020-09-15' AS Date), 1, 12)
INSERT [dbo].[Images] ([Id], [ImageDescription], [FilePath], [MinimalFilePath], [DatePosted], [IsActive], [HeaderDetailId]) VALUES (13, N'Commemorate The Argeement Of Industry', N'/media/images/News/News08.JPG', N'/media/thumbnails/News/News08.JPG', CAST(N'2020-09-15' AS Date), 1, 12)
INSERT [dbo].[Images] ([Id], [ImageDescription], [FilePath], [MinimalFilePath], [DatePosted], [IsActive], [HeaderDetailId]) VALUES (14, N'QSS Kick Off', N'/media/images/News/News07.JPG', N'/media/thumbnails/News/News07.JPG', CAST(N'2020-09-15' AS Date), 1, 12)
INSERT [dbo].[Images] ([Id], [ImageDescription], [FilePath], [MinimalFilePath], [DatePosted], [IsActive], [HeaderDetailId]) VALUES (15, N'CEO give Present at Lunar New Year', N'/media/images/News/News06.JPG', N'/media/thumbnails/News/News06.JPG', CAST(N'2020-09-15' AS Date), 1, 12)
INSERT [dbo].[Images] ([Id], [ImageDescription], [FilePath], [MinimalFilePath], [DatePosted], [IsActive], [HeaderDetailId]) VALUES (16, N'Customer Appreciation Ceremony - Year End 2015', N'/media/images/News/News05.JPG', N'/media/thumbnails/News/News05.JPG', CAST(N'2020-09-15' AS Date), 1, 12)
INSERT [dbo].[Images] ([Id], [ImageDescription], [FilePath], [MinimalFilePath], [DatePosted], [IsActive], [HeaderDetailId]) VALUES (17, N'Anniversary of Incorporation 6th Posco VST', N'/media/images/News/News04.JPG', N'/media/thumbnails/News/News04.JPG', CAST(N'2020-09-15' AS Date), 1, 12)
INSERT [dbo].[Images] ([Id], [ImageDescription], [FilePath], [MinimalFilePath], [DatePosted], [IsActive], [HeaderDetailId]) VALUES (18, N'POSCO Chairman Visiting Posco VST', N'/media/images/News/News03.JPG', N'/media/thumbnails/News/News03.JPG', CAST(N'2020-09-15' AS Date), 1, 12)
INSERT [dbo].[Images] ([Id], [ImageDescription], [FilePath], [MinimalFilePath], [DatePosted], [IsActive], [HeaderDetailId]) VALUES (19, N'5S Benchmarking', N'/media/images/News/News02.JPG', N'/media/thumbnails/News/News02.JPG', CAST(N'2020-09-15' AS Date), 1, 12)
INSERT [dbo].[Images] ([Id], [ImageDescription], [FilePath], [MinimalFilePath], [DatePosted], [IsActive], [HeaderDetailId]) VALUES (20, N'Posco Vst Vision Work Shop', N'/media/images/News/News01.JPG', N'/media/thumbnails/News/News01.JPG', CAST(N'2020-09-15' AS Date), 1, 12)
INSERT [dbo].[Images] ([Id], [ImageDescription], [FilePath], [MinimalFilePath], [DatePosted], [IsActive], [HeaderDetailId]) VALUES (21, N'Scavenge around the area - Oct 19, 2019', N'/media/images/images update on 11.09.2020/2019/Scavenge around the area - Oct 19, 2019/IMG_7245.JPG', N'/media/thumbnails/images update on 11.09.2020/2019/Scavenge around the area - Oct 19, 2019/IMG_7245.JPG', CAST(N'2020-09-15' AS Date), 1, 51)
INSERT [dbo].[Images] ([Id], [ImageDescription], [FilePath], [MinimalFilePath], [DatePosted], [IsActive], [HeaderDetailId]) VALUES (22, N'Scavenge around the area - Oct 19, 2019', N'/media/images/images update on 11.09.2020/2019/Scavenge around the area - Oct 19, 2019/IMG_7255.JPG', N'/media/thumbnails/images update on 11.09.2020/2019/Scavenge around the area - Oct 19, 2019/IMG_7255.JPG', CAST(N'2020-09-15' AS Date), 1, 51)
INSERT [dbo].[Images] ([Id], [ImageDescription], [FilePath], [MinimalFilePath], [DatePosted], [IsActive], [HeaderDetailId]) VALUES (23, N'Scavenge around the area - Oct 19, 2019', N'/media/images/images update on 11.09.2020/2019/Scavenge around the area - Oct 19, 2019/IMG_7317.JPG', N'/media/thumbnails/images update on 11.09.2020/2019/Scavenge around the area - Oct 19, 2019/IMG_7317.JPG', CAST(N'2020-09-15' AS Date), 1, 51)
INSERT [dbo].[Images] ([Id], [ImageDescription], [FilePath], [MinimalFilePath], [DatePosted], [IsActive], [HeaderDetailId]) VALUES (24, N'Scavenge around the area - Oct 19, 2019', N'/media/images/images update on 11.09.2020/2019/Scavenge around the area - Oct 19, 2019/IMG_7488.JPG', N'/media/thumbnails/images update on 11.09.2020/2019/Scavenge around the area - Oct 19, 2019/IMG_7488.JPG', CAST(N'2020-09-15' AS Date), 1, 51)
INSERT [dbo].[Images] ([Id], [ImageDescription], [FilePath], [MinimalFilePath], [DatePosted], [IsActive], [HeaderDetailId]) VALUES (25, N'Scavenge around the area - Oct 19, 2019', N'/media/images/images update on 11.09.2020/2019/Scavenge around the area - Oct 19, 2019/IMG_7535.JPG', N'/media/thumbnails/images update on 11.09.2020/2019/Scavenge around the area - Oct 19, 2019/IMG_7535.JPG', CAST(N'2020-09-15' AS Date), 1, 51)
INSERT [dbo].[Images] ([Id], [ImageDescription], [FilePath], [MinimalFilePath], [DatePosted], [IsActive], [HeaderDetailId]) VALUES (26, N'Scavenge around the area - Oct 19, 2019', N'/media/images/images update on 11.09.2020/2019/Scavenge around the area - Oct 19, 2019/IMG_7580.JPG', N'/media/thumbnails/images update on 11.09.2020/2019/Scavenge around the area - Oct 19, 2019/IMG_7580.JPG', CAST(N'2020-09-15' AS Date), 1, 51)
INSERT [dbo].[Images] ([Id], [ImageDescription], [FilePath], [MinimalFilePath], [DatePosted], [IsActive], [HeaderDetailId]) VALUES (27, N'Scavenge with VHPC - Jun 01, 2019', N'/media/images/images update on 11.09.2020/2019/Scavenge with VHPC - Jun 01, 2019/IMG_4936.JPG', N'/media/thumbnails/images update on 11.09.2020/2019/Scavenge with VHPC - Jun 01, 2019/IMG_4936.JPG', CAST(N'2020-09-15' AS Date), 1, 51)
INSERT [dbo].[Images] ([Id], [ImageDescription], [FilePath], [MinimalFilePath], [DatePosted], [IsActive], [HeaderDetailId]) VALUES (28, N'Scavenge with VHPC - Jun 01, 2019', N'/media/images/images update on 11.09.2020/2019/Scavenge with VHPC - Jun 01, 2019/IMG_4947.JPG', N'/media/thumbnails/images update on 11.09.2020/2019/Scavenge with VHPC - Jun 01, 2019/IMG_4947.JPG', CAST(N'2020-09-15' AS Date), 1, 51)
INSERT [dbo].[Images] ([Id], [ImageDescription], [FilePath], [MinimalFilePath], [DatePosted], [IsActive], [HeaderDetailId]) VALUES (29, N'Scavenge with VHPC - Jun 01, 2019', N'/media/images/images update on 11.09.2020/2019/Scavenge with VHPC - Jun 01, 2019/IMG_4951.JPG', N'/media/thumbnails/images update on 11.09.2020/2019/Scavenge with VHPC - Jun 01, 2019/IMG_4951.JPG', CAST(N'2020-09-15' AS Date), 1, 51)
INSERT [dbo].[Images] ([Id], [ImageDescription], [FilePath], [MinimalFilePath], [DatePosted], [IsActive], [HeaderDetailId]) VALUES (30, N'POSCO VST Volunteer Plan at Hoa Mai orphanage - Aug, 2019', N'/media/images/images update on 11.09.2020/2019/Visit Hoa Mai orphanage - Aug, 2019/IMG_6025.JPG', N'/media/thumbnails/images update on 11.09.2020/2019/Visit Hoa Mai orphanage - Aug, 2019/IMG_6025.JPG', CAST(N'2020-09-15' AS Date), 1, 51)
INSERT [dbo].[Images] ([Id], [ImageDescription], [FilePath], [MinimalFilePath], [DatePosted], [IsActive], [HeaderDetailId]) VALUES (31, N'POSCO VST Volunteer Plan at Hoa Mai orphanage - Aug, 2019', N'/media/images/images update on 11.09.2020/2019/Visit Hoa Mai orphanage - Aug, 2019/IMG_6053.JPG', N'/media/thumbnails/images update on 11.09.2020/2019/Visit Hoa Mai orphanage - Aug, 2019/IMG_6053.JPG', CAST(N'2020-09-15' AS Date), 1, 51)
INSERT [dbo].[Images] ([Id], [ImageDescription], [FilePath], [MinimalFilePath], [DatePosted], [IsActive], [HeaderDetailId]) VALUES (32, N'POSCO VST Volunteer Plan at Hoa Mai orphanage - Aug, 2019', N'/media/images/images update on 11.09.2020/2019/Visit Hoa Mai orphanage - Aug, 2019/IMG_6067.JPG', N'/media/thumbnails/images update on 11.09.2020/2019/Visit Hoa Mai orphanage - Aug, 2019/IMG_6067.JPG', CAST(N'2020-09-15' AS Date), 1, 51)
INSERT [dbo].[Images] ([Id], [ImageDescription], [FilePath], [MinimalFilePath], [DatePosted], [IsActive], [HeaderDetailId]) VALUES (33, N'POSCO VST Volunteer Plan at Hoa Mai orphanage - Aug, 2019', N'/media/images/images update on 11.09.2020/2019/Visit Hoa Mai orphanage - Aug, 2019/IMG_6080.JPG', N'/media/thumbnails/images update on 11.09.2020/2019/Visit Hoa Mai orphanage - Aug, 2019/IMG_6080.JPG', CAST(N'2020-09-15' AS Date), 1, 51)
INSERT [dbo].[Images] ([Id], [ImageDescription], [FilePath], [MinimalFilePath], [DatePosted], [IsActive], [HeaderDetailId]) VALUES (34, N'POSCO VST Volunteer Plan at Hoa Mai orphanage - Aug, 2019', N'/media/images/images update on 11.09.2020/2019/Visit Hoa Mai orphanage - Aug, 2019/IMG_6103.JPG', N'/media/thumbnails/images update on 11.09.2020/2019/Visit Hoa Mai orphanage - Aug, 2019/IMG_6103.JPG', CAST(N'2020-09-15' AS Date), 1, 51)
INSERT [dbo].[Images] ([Id], [ImageDescription], [FilePath], [MinimalFilePath], [DatePosted], [IsActive], [HeaderDetailId]) VALUES (35, N'Posco Vst awarded water tank in Hanoi - Jul 21, 2020', N'/media/images/images update on 11.09.2020/2020/awarded a water tank in Hanoi - Jul 21, 2020/IMG_0424.JPG', N'/media/thumbnails/images update on 11.09.2020/2020/awarded a water tank in Hanoi - Jul 21, 2020/IMG_0424.JPG', CAST(N'2020-09-15' AS Date), 1, 51)
INSERT [dbo].[Images] ([Id], [ImageDescription], [FilePath], [MinimalFilePath], [DatePosted], [IsActive], [HeaderDetailId]) VALUES (36, N'Posco Vst awarded water tank in Hanoi - Jul 21, 2020', N'/media/images/images update on 11.09.2020/2020/awarded a water tank in Hanoi - Jul 21, 2020/IMG_0525.JPG', N'/media/thumbnails/images update on 11.09.2020/2020/awarded a water tank in Hanoi - Jul 21, 2020/IMG_0525.JPG', CAST(N'2020-09-15' AS Date), 1, 51)
INSERT [dbo].[Images] ([Id], [ImageDescription], [FilePath], [MinimalFilePath], [DatePosted], [IsActive], [HeaderDetailId]) VALUES (37, N'Posco Vst awarded water tank in Hanoi - Jul 21, 2020', N'/media/images/images update on 11.09.2020/2020/awarded a water tank in Hanoi - Jul 21, 2020/IMG_0557.JPG', N'/media/thumbnails/images update on 11.09.2020/2020/awarded a water tank in Hanoi - Jul 21, 2020/IMG_0557.JPG', CAST(N'2020-09-15' AS Date), 1, 51)
INSERT [dbo].[Images] ([Id], [ImageDescription], [FilePath], [MinimalFilePath], [DatePosted], [IsActive], [HeaderDetailId]) VALUES (38, N'Posco Vst awarded water tank in Hanoi - Jul 21, 2020', N'/media/images/images update on 11.09.2020/2020/awarded a water tank in Hanoi - Jul 21, 2020/IMG_0566.JPG', N'/media/thumbnails/images update on 11.09.2020/2020/awarded a water tank in Hanoi - Jul 21, 2020/IMG_0566.JPG', CAST(N'2020-09-15' AS Date), 1, 51)
INSERT [dbo].[Images] ([Id], [ImageDescription], [FilePath], [MinimalFilePath], [DatePosted], [IsActive], [HeaderDetailId]) VALUES (39, N'Posco Vst awarded water tank in Hanoi - Jul 21, 2020', N'/media/images/images update on 11.09.2020/2020/awarded a water tank in Hanoi - Jul 21, 2020/IMG_0572.JPG', N'/media/thumbnails/images update on 11.09.2020/2020/awarded a water tank in Hanoi - Jul 21, 2020/IMG_0572.JPG', CAST(N'2020-09-15' AS Date), 1, 51)
INSERT [dbo].[Images] ([Id], [ImageDescription], [FilePath], [MinimalFilePath], [DatePosted], [IsActive], [HeaderDetailId]) VALUES (40, N'Posco Vst awarded water tank in Hanoi - Jul 21, 2020', N'/media/images/images update on 11.09.2020/2020/awarded a water tank in Hanoi - Jul 21, 2020/IMG_0577.JPG', N'/media/thumbnails/images update on 11.09.2020/2020/awarded a water tank in Hanoi - Jul 21, 2020/IMG_0577.JPG', CAST(N'2020-09-15' AS Date), 1, 51)
INSERT [dbo].[Images] ([Id], [ImageDescription], [FilePath], [MinimalFilePath], [DatePosted], [IsActive], [HeaderDetailId]) VALUES (41, N'Posco Vst awarded water tank in Hanoi - Jul 21, 2020', N'/media/images/images update on 11.09.2020/2020/awarded a water tank in Hanoi - Jul 21, 2020/IMG_0882.JPG', N'/media/thumbnails/images update on 11.09.2020/2020/awarded a water tank in Hanoi - Jul 21, 2020/IMG_0882.JPG', CAST(N'2020-09-15' AS Date), 1, 51)
INSERT [dbo].[Images] ([Id], [ImageDescription], [FilePath], [MinimalFilePath], [DatePosted], [IsActive], [HeaderDetailId]) VALUES (42, N'Posco Vst fair share at Phuoc Thien commune - Jun 27, 2020', N'/media/images/images update on 11.09.2020/2020/fair share at Phuoc Thien commune Jun 27, 2020/IMG_0138.JPG', N'/media/thumbnails/images update on 11.09.2020/2020/fair share at Phuoc Thien commune Jun 27, 2020/IMG_0138.JPG', CAST(N'2020-09-15' AS Date), 1, 51)
INSERT [dbo].[Images] ([Id], [ImageDescription], [FilePath], [MinimalFilePath], [DatePosted], [IsActive], [HeaderDetailId]) VALUES (43, N'Posco Vst fair share at Phuoc Thien commune - Jun 27, 2020', N'/media/images/images update on 11.09.2020/2020/fair share at Phuoc Thien commune Jun 27, 2020/IMG_0180.JPG', N'/media/thumbnails/images update on 11.09.2020/2020/fair share at Phuoc Thien commune Jun 27, 2020/IMG_0180.JPG', CAST(N'2020-09-15' AS Date), 1, 51)
INSERT [dbo].[Images] ([Id], [ImageDescription], [FilePath], [MinimalFilePath], [DatePosted], [IsActive], [HeaderDetailId]) VALUES (44, N'Posco Vst fair share at Phuoc Thien commune - Jun 27, 2020', N'/media/images/images update on 11.09.2020/2020/fair share at Phuoc Thien commune Jun 27, 2020/IMG_0182.JPG', N'/media/thumbnails/images update on 11.09.2020/2020/fair share at Phuoc Thien commune Jun 27, 2020/IMG_0182.JPG', CAST(N'2020-09-15' AS Date), 1, 51)
INSERT [dbo].[Images] ([Id], [ImageDescription], [FilePath], [MinimalFilePath], [DatePosted], [IsActive], [HeaderDetailId]) VALUES (45, N'Posco Vst fair share at Phuoc Thien commune - Jun 27, 2020', N'/media/images/images update on 11.09.2020/2020/fair share at Phuoc Thien commune Jun 27, 2020/IMG_0188.JPG', N'/media/thumbnails/images update on 11.09.2020/2020/fair share at Phuoc Thien commune Jun 27, 2020/IMG_0188.JPG', CAST(N'2020-09-15' AS Date), 1, 51)
INSERT [dbo].[Images] ([Id], [ImageDescription], [FilePath], [MinimalFilePath], [DatePosted], [IsActive], [HeaderDetailId]) VALUES (46, N'Posco Vst fair share at Phuoc Thien commune - Jun 27, 2020', N'/media/images/images update on 11.09.2020/2020/fair share at Phuoc Thien commune Jun 27, 2020/IMG_0332.JPG', N'/media/thumbnails/images update on 11.09.2020/2020/fair share at Phuoc Thien commune Jun 27, 2020/IMG_0332.JPG', CAST(N'2020-09-15' AS Date), 1, 51)
INSERT [dbo].[Images] ([Id], [ImageDescription], [FilePath], [MinimalFilePath], [DatePosted], [IsActive], [HeaderDetailId]) VALUES (47, N'Posco Vst fair share at Phuoc Thien commune - Jun 27, 2020', N'/media/images/images update on 11.09.2020/2020/fair share at Phuoc Thien commune Jun 27, 2020/IMG_0341.JPG', N'/media/thumbnails/images update on 11.09.2020/2020/fair share at Phuoc Thien commune Jun 27, 2020/IMG_0341.JPG', CAST(N'2020-09-15' AS Date), 1, 51)
INSERT [dbo].[Images] ([Id], [ImageDescription], [FilePath], [MinimalFilePath], [DatePosted], [IsActive], [HeaderDetailId]) VALUES (48, N'Posco Vst fair share at Phuoc Thien commune - Jun 27, 2020', N'/media/images/images update on 11.09.2020/2020/fair share at Phuoc Thien commune Jun 27, 2020/IMG_0347.JPG', N'/media/thumbnails/images update on 11.09.2020/2020/fair share at Phuoc Thien commune Jun 27, 2020/IMG_0347.JPG', CAST(N'2020-09-15' AS Date), 1, 51)
INSERT [dbo].[Images] ([Id], [ImageDescription], [FilePath], [MinimalFilePath], [DatePosted], [IsActive], [HeaderDetailId]) VALUES (49, N'Posco Vst fair share at Phuoc Thien commune - Jun 27, 2020', N'/media/images/images update on 11.09.2020/2020/fair share at Phuoc Thien commune Jun 27, 2020/IMG_0362.JPG', N'/media/thumbnails/images update on 11.09.2020/2020/fair share at Phuoc Thien commune Jun 27, 2020/IMG_0362.JPG', CAST(N'2020-09-15' AS Date), 1, 51)
INSERT [dbo].[Images] ([Id], [ImageDescription], [FilePath], [MinimalFilePath], [DatePosted], [IsActive], [HeaderDetailId]) VALUES (50, N'POSCO VST supports buying watermelons for farmers - Feb 20, 2020', N'/media/images/images update on 11.09.2020/2020/rescue watermelon - Feb 20, 2020/IMG_9769.JPG', N'/media/thumbnails/images update on 11.09.2020/2020/rescue watermelon - Feb 20, 2020/IMG_9769.JPG', CAST(N'2020-09-15' AS Date), 1, 51)
INSERT [dbo].[Images] ([Id], [ImageDescription], [FilePath], [MinimalFilePath], [DatePosted], [IsActive], [HeaderDetailId]) VALUES (51, N'POSCO VST supports buying watermelons for farmers - Feb 20, 2020', N'/media/images/images update on 11.09.2020/2020/rescue watermelon - Feb 20, 2020/IMG_9799.JPG', N'/media/thumbnails/images update on 11.09.2020/2020/rescue watermelon - Feb 20, 2020/IMG_9799.JPG', CAST(N'2020-09-15' AS Date), 1, 51)
INSERT [dbo].[Images] ([Id], [ImageDescription], [FilePath], [MinimalFilePath], [DatePosted], [IsActive], [HeaderDetailId]) VALUES (52, N'POSCO VST supports buying watermelons for farmers - Feb 20, 2020', N'/media/images/images update on 11.09.2020/2020/rescue watermelon - Feb 20, 2020/IMG_9800.JPG', N'/media/thumbnails/images update on 11.09.2020/2020/rescue watermelon - Feb 20, 2020/IMG_9800.JPG', CAST(N'2020-09-15' AS Date), 1, 51)
INSERT [dbo].[Images] ([Id], [ImageDescription], [FilePath], [MinimalFilePath], [DatePosted], [IsActive], [HeaderDetailId]) VALUES (53, N'POSCO VST supports buying watermelons for farmers - Feb 20, 2020', N'/media/images/images update on 11.09.2020/2020/rescue watermelon - Feb 20, 2020/IMG_9804.JPG', N'/media/thumbnails/images update on 11.09.2020/2020/rescue watermelon - Feb 20, 2020/IMG_9804.JPG', CAST(N'2020-09-15' AS Date), 1, 51)
INSERT [dbo].[Images] ([Id], [ImageDescription], [FilePath], [MinimalFilePath], [DatePosted], [IsActive], [HeaderDetailId]) VALUES (54, N'POSCO VST supports buying watermelons for farmers - Feb 20, 2020', N'/media/images/images update on 11.09.2020/2020/rescue watermelon - Feb 20, 2020/IMG_9828.JPG', N'/media/thumbnails/images update on 11.09.2020/2020/rescue watermelon - Feb 20, 2020/IMG_9828.JPG', CAST(N'2020-09-15' AS Date), 1, 51)
INSERT [dbo].[Images] ([Id], [ImageDescription], [FilePath], [MinimalFilePath], [DatePosted], [IsActive], [HeaderDetailId]) VALUES (55, N'POSCO VST supports buying watermelons for farmers - Feb 20, 2020', N'/media/images/images update on 11.09.2020/2020/rescue watermelon - Feb 20, 2020/IMG_9835.JPG', N'/media/thumbnails/images update on 11.09.2020/2020/rescue watermelon - Feb 20, 2020/IMG_9835.JPG', CAST(N'2020-09-15' AS Date), 1, 51)
SET IDENTITY_INSERT [dbo].[Images] OFF
SET IDENTITY_INSERT [dbo].[Recruitment] ON 

INSERT [dbo].[Recruitment] ([Id], [JobTitle], [JobDescription], [JobRequirement], [Salary], [DatePosted], [DateExpired], [IsActive]) VALUES (15, N'Chuyên Viên Quản Trị Dự Án', N'<p>- Soạn thảo c&aacute;c hợp đồng đầu tư</p>

<p>- Theo d&otilde;i, triển khai / phối hợp thực hiện c&aacute;c hợp đồng đầu tư, hồ sơ thanh l&yacute; c&aacute;c hợp đồng đầu tư</p>

<p>- Chuẩn bị t&agrave;i liệu b&aacute;n h&agrave;ng (tr&igrave;nh bảng gi&aacute;, phương thức thanh to&aacute;n, ch&iacute;nh s&aacute;ch chiết khấu,&hellip;)</p>

<p>- Quản l&yacute; việc phối hợp phong tỏa t&agrave;i sản đối với c&aacute;c sản phẩm kh&aacute;ch vay mua trong thời - gian chưa được cấp giấy chứng nhận sở hữu.</p>

<p>- Quản l&yacute; danh mục sản phẩm đang kinh doanh của c&ocirc;ng ty.</p>

<p>- Đ&aacute;nh gi&aacute; v&agrave; đề xuất phương &aacute;n giải quyết c&aacute;c sản phẩm tồn kho.</p>

<p>- Theo d&otilde;i v&agrave; cập nhật tiến độ triển khai c&aacute;c dự &aacute;n</p>

<p>- Thực hiện c&aacute;c c&ocirc;ng việc do cấp tr&ecirc;n giao ph&oacute;</p>
', N'<p><em>- Tốt nghiệp đại học c&aacute;c ng&agrave;nh kinh tế, quản l&yacute; dự &aacute;n.</em></p>

<p><em>- Kinh nghiệm l&agrave;m việc: 03 năm - Ngoại ngữ: đọc hiểu</em></p>

<p><em>- Y&ecirc;u cầu chuy&ecirc;n m&ocirc;n: Quản trị dự &aacute;n, soạn thảo hợp đồng, c&oacute; kỹ năng giao tiếp v&agrave; đ&agrave;m ph&aacute;n tốt</em></p>
', N'Up to 150$', CAST(N'2020-02-17' AS Date), CAST(N'2020-10-31' AS Date), 0)
INSERT [dbo].[Recruitment] ([Id], [JobTitle], [JobDescription], [JobRequirement], [Salary], [DatePosted], [DateExpired], [IsActive]) VALUES (16, N'Giáo viên kỹ năng sống', N'<p>- Giảng dạy c&aacute;c lớp ngoại kh&oacute;a, kỹ năng sống cho trẻ mầm non v&agrave; tiểu học theo gi&aacute;o tr&igrave;nh sẵn c&oacute; của trường</p>

<p>-&nbsp;Đảm bảo sự kết nối thường xuy&ecirc;n với phụ huynh để c&oacute; được sự hợp t&aacute;c, đồng h&agrave;nh tốt nhất giữa gia đ&igrave;nh &ndash; nh&agrave; trường trong qu&aacute; tr&igrave;nh nu&ocirc;i dạy b&eacute;</p>

<p>- Quan s&aacute;t, đ&aacute;nh gi&aacute; v&agrave; trao đổi với phụ huynh về t&igrave;nh h&igrave;nh học tập của c&aacute;c em - Tham gia ph&aacute;t triển gi&aacute;o tr&igrave;nh, s&aacute;ng tạo gi&aacute;o cụ</p>

<p>- Tổ chức c&aacute;c sự kiện cho học sinh - C&aacute;c c&ocirc;ng việc kh&aacute;c được ph&acirc;n c&ocirc;ng - Địa chỉ l&agrave;m việc: Quận 7, Quận 2, Quận 3, Ph&uacute; Nhuận</p>

<p>- Thời gian l&agrave;m việc: Thứ 2: 8h - 17h30; Thứ 3 - Thứ 6: 13h30 - 19h30; Thứ 7: 8h - 12h; 15h - 19h; CN: 8h - 12h</p>
', N'<p>- Bằng cấp: cử nh&acirc;n đại học (ưu ti&ecirc;n c&aacute;c ng&agrave;nh sư phạm, t&acirc;m l&yacute; gi&aacute;o dục, quản l&yacute; gi&aacute;o dục, nh&acirc;n văn, c&ocirc;ng t&aacute;c x&atilde; hội)</p>

<p>- Y&ecirc;u th&iacute;ch v&agrave; c&oacute; kinh nghiệm tối thiểu 1 năm l&agrave;m việc, tiếp x&uacute;c với trẻ em - Nhiệt t&igrave;nh, ki&ecirc;n nhẫn, ham học hỏi, chịu kh&oacute;</p>

<p>- C&oacute; tinh thần chủ động, tr&aacute;ch nhiệm trong c&ocirc;ng việc</p>

<p>- C&oacute; khả năng giao tiếp tốt với phụ huynh</p>
', N'800$', CAST(N'2020-08-17' AS Date), CAST(N'2020-11-13' AS Date), 0)
INSERT [dbo].[Recruitment] ([Id], [JobTitle], [JobDescription], [JobRequirement], [Salary], [DatePosted], [DateExpired], [IsActive]) VALUES (17, N'Planning Staff', N'<p>- Make production planning and follow up the production progress</p>

<p>- Manage production materials so that production can operate smoothly</p>

<p>- Check and solve delay order.</p>

<p>- Solve urgent order.</p>

<p>- Support Sales and Production Side.</p>

<p>- Other tasks according to Manager&#39;s request.</p>
', N'<p>- Graduated University/ College</p>

<p>- Have experience in same position at least 2 years</p>

<p>- English and using Computer fluently</p>

<p>- Prefer candidate in Binh Duong</p>

<p>- Salary negotiation</p>
', NULL, CAST(N'2020-08-20' AS Date), CAST(N'2020-12-19' AS Date), 0)
SET IDENTITY_INSERT [dbo].[Recruitment] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([Id], [RoleName]) VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[Role] OFF
INSERT [dbo].[Supplier] ([Id], [NameCompany], [DayoIncor], [Representative], [MainProduct], [MainCustomer], [Contact]) VALUES (N'89d2a430-7602-4c70-8641-a716fc929150', N'cty C', CAST(N'2021-02-01 00:00:00.000' AS DateTime), N'nguyen van c', N'main product', N'main customer', N'nguyen van c')
INSERT [dbo].[Supplier] ([Id], [NameCompany], [DayoIncor], [Representative], [MainProduct], [MainCustomer], [Contact]) VALUES (N'e4013a16-180b-49f5-8f27-c0654b21bb36', N'cty b', CAST(N'2021-06-17 00:00:00.000' AS DateTime), N'nguyen van b', N'main product', N'main customer', N'nguyen van b')
INSERT [dbo].[Supplier] ([Id], [NameCompany], [DayoIncor], [Representative], [MainProduct], [MainCustomer], [Contact]) VALUES (N'a1bd76a0-7ead-4ceb-8744-d92d55f4ef86', N'cty A', CAST(N'2021-05-07 00:00:00.000' AS DateTime), N'nguyen van A', N'product ', N'customer', N'nguyen van a')
SET IDENTITY_INSERT [dbo].[SupplierCertificate] ON 

INSERT [dbo].[SupplierCertificate] ([Id], [FilePath], [FileName], [SupplierId]) VALUES (9, N'/Upload/31052021154750_2022.2023 yearly annual leave usage plan.pdf', N'31052021154750_2022.2023 yearly annual leave usage plan.pdf', N'a1bd76a0-7ead-4ceb-8744-d92d55f4ef86')
INSERT [dbo].[SupplierCertificate] ([Id], [FilePath], [FileName], [SupplierId]) VALUES (10, N'/Upload/01062021085232_Dell R240.pdf', N'01062021085232_Dell R240.pdf', N'e4013a16-180b-49f5-8f27-c0654b21bb36')
INSERT [dbo].[SupplierCertificate] ([Id], [FilePath], [FileName], [SupplierId]) VALUES (11, N'/Upload/01062021085550_2022.2023 yearly annual leave usage plan.pdf', N'01062021085550_2022.2023 yearly annual leave usage plan.pdf', N'89d2a430-7602-4c70-8641-a716fc929150')
SET IDENTITY_INSERT [dbo].[SupplierCertificate] OFF
INSERT [dbo].[SupplierUser] ([SupplierId], [Name], [password], [RoleId]) VALUES (N'89d2a430-7602-4c70-8641-a716fc929150', N'user3', N'c4ca4238a0b923820dcc509a6f75849b', 2)
INSERT [dbo].[SupplierUser] ([SupplierId], [Name], [password], [RoleId]) VALUES (N'e4013a16-180b-49f5-8f27-c0654b21bb36', N'user2', N'c4ca4238a0b923820dcc509a6f75849b', 2)
INSERT [dbo].[SupplierUser] ([SupplierId], [Name], [password], [RoleId]) VALUES (N'a1bd76a0-7ead-4ceb-8744-d92d55f4ef86', N'admin', N'202cb962ac59075b964b07152d234b70', 1)
SET IDENTITY_INSERT [dbo].[UserLogin] ON 

INSERT [dbo].[UserLogin] ([Id], [UserName], [RoleId], [CreatedAt], [IsActive], [PasswordHash], [PasswordSalt]) VALUES (1, N'admin', 1, CAST(N'2020-08-15' AS Date), 1, N'yYXw+zxxBhx1FUsjele0j8VxoxG4EEdR', N'r9FukLK5181H8JeJxdjwOd/7rTczfFH9')
SET IDENTITY_INSERT [dbo].[UserLogin] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UIdx_EmailAddress_RecruitmentId_On_Candidate]    Script Date: 04/06/2021 10:52:32 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UIdx_EmailAddress_RecruitmentId_On_Candidate] ON [dbo].[Candidate]
(
	[EmailAddress] ASC,
	[RecruitmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UIdx_Customer_Email]    Script Date: 04/06/2021 10:52:32 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UIdx_Customer_Email] ON [dbo].[Customer]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [Uidx_Document]    Script Date: 04/06/2021 10:52:32 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [Uidx_Document] ON [dbo].[Document]
(
	[Description] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UIdx_SupplierUser_Name]    Script Date: 04/06/2021 10:52:32 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UIdx_SupplierUser_Name] ON [dbo].[SupplierUser]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UIdx_UserName_ON_UserLogin]    Script Date: 04/06/2021 10:52:32 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UIdx_UserName_ON_UserLogin] ON [dbo].[UserLogin]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Candidate] ADD  DEFAULT ((0)) FOR [EmailConfirmed]
GO
ALTER TABLE [dbo].[Document] ADD  DEFAULT (getdate()) FOR [UploadedDate]
GO
ALTER TABLE [dbo].[Document] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [Crawl].[CoporateCitizenContent]  WITH CHECK ADD  CONSTRAINT [Fk_CoporateCitizenContent_Category] FOREIGN KEY([CoporateCitizenCategoryId])
REFERENCES [Crawl].[CoporateCitizenCategory] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Crawl].[CoporateCitizenContent] CHECK CONSTRAINT [Fk_CoporateCitizenContent_Category]
GO
ALTER TABLE [dbo].[Benefit]  WITH CHECK ADD  CONSTRAINT [Fk_Benefit_Recruitment] FOREIGN KEY([RecruitmentId])
REFERENCES [dbo].[Recruitment] ([Id])
GO
ALTER TABLE [dbo].[Benefit] CHECK CONSTRAINT [Fk_Benefit_Recruitment]
GO
ALTER TABLE [dbo].[Candidate]  WITH CHECK ADD  CONSTRAINT [Fk_Candidate_Recruitment] FOREIGN KEY([RecruitmentId])
REFERENCES [dbo].[Recruitment] ([Id])
GO
ALTER TABLE [dbo].[Candidate] CHECK CONSTRAINT [Fk_Candidate_Recruitment]
GO
ALTER TABLE [dbo].[Conversation]  WITH CHECK ADD  CONSTRAINT [Fk_Conversation_Supplier_Owner] FOREIGN KEY([OwnerId])
REFERENCES [dbo].[Supplier] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Conversation] CHECK CONSTRAINT [Fk_Conversation_Supplier_Owner]
GO
ALTER TABLE [dbo].[Document]  WITH CHECK ADD  CONSTRAINT [Fk_Document_HeaderDetail] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[HeaderDetail] ([Id])
GO
ALTER TABLE [dbo].[Document] CHECK CONSTRAINT [Fk_Document_HeaderDetail]
GO
ALTER TABLE [dbo].[HeaderDetail]  WITH CHECK ADD  CONSTRAINT [Fk_HeaderDetail_HeaderCategory] FOREIGN KEY([HeaderCategoryId])
REFERENCES [dbo].[HeaderCategory] ([Id])
GO
ALTER TABLE [dbo].[HeaderDetail] CHECK CONSTRAINT [Fk_HeaderDetail_HeaderCategory]
GO
ALTER TABLE [dbo].[Images]  WITH CHECK ADD  CONSTRAINT [Fk_Images_HeaderDetail] FOREIGN KEY([HeaderDetailId])
REFERENCES [dbo].[HeaderDetail] ([Id])
GO
ALTER TABLE [dbo].[Images] CHECK CONSTRAINT [Fk_Images_HeaderDetail]
GO
ALTER TABLE [dbo].[JobSkill]  WITH CHECK ADD  CONSTRAINT [Fk_JobSkill_Recruitment] FOREIGN KEY([RecruitmentId])
REFERENCES [dbo].[Recruitment] ([Id])
GO
ALTER TABLE [dbo].[JobSkill] CHECK CONSTRAINT [Fk_JobSkill_Recruitment]
GO
ALTER TABLE [dbo].[SupplierCertificate]  WITH CHECK ADD  CONSTRAINT [FK_SupplierCertificate_Supplier] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Supplier] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SupplierCertificate] CHECK CONSTRAINT [FK_SupplierCertificate_Supplier]
GO
ALTER TABLE [dbo].[SupplierUser]  WITH CHECK ADD  CONSTRAINT [FK_SupplierUser_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[SupplierUser] CHECK CONSTRAINT [FK_SupplierUser_Role]
GO
ALTER TABLE [dbo].[SupplierUser]  WITH CHECK ADD  CONSTRAINT [FK_SupplierUser_Supplier] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Supplier] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SupplierUser] CHECK CONSTRAINT [FK_SupplierUser_Supplier]
GO
ALTER TABLE [dbo].[UserLogin]  WITH CHECK ADD  CONSTRAINT [Fk_UserLogin_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[UserLogin] CHECK CONSTRAINT [Fk_UserLogin_Role]
GO
USE [master]
GO
ALTER DATABASE [HomePageVST] SET  READ_WRITE 
GO
