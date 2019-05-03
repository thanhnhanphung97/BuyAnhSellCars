USE [BuyAndSellCars]
GO
/****** Object:  Table [dbo].[About]    Script Date: 5/1/2019 1:44:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[About](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[Detail] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](250) NULL,
 CONSTRAINT [PK_About] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Car]    Script Date: 5/1/2019 1:44:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Car](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CategoryID] [bigint] NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[Image] [nvarchar](250) NULL,
	[MoreImages] [xml] NULL,
	[Price] [decimal](18, 0) NULL,
	[PrePay] [decimal](18, 0) NULL,
	[Model] [varchar](10) NULL,
	[Engine] [float] NULL,
	[Fuel] [nvarchar](10) NULL,
	[Gear] [nvarchar](15) NULL,
	[KmTraveled] [int] NULL,
	[CarColor] [nvarchar](20) NULL,
	[InteriorColor] [nvarchar](20) NULL,
	[Origin] [nvarchar](50) NULL,
	[YearOfManufacture] [int] NULL,
	[Seats] [int] NULL,
	[DriveSystem] [nvarchar](50) NULL,
	[Doors] [int] NULL,
	[SalientFeatures] [xml] NULL,
	[Deposited] [bit] NULL,
	[Sold] [bit] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Car] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CarCategory]    Script Date: 5/1/2019 1:44:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CarCategory](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[ParentID] [bigint] NULL,
	[DisplayOrder] [int] NULL CONSTRAINT [DF_CarCategory_DisplayOrder]  DEFAULT ((0)),
	[SeoTitle] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL CONSTRAINT [DF_CarCategory_CreatedDate]  DEFAULT (getdate()),
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[Status] [bit] NULL CONSTRAINT [DF_CarCategory_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_CarCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CarPart]    Script Date: 5/1/2019 1:44:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CarPart](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Code] [varchar](10) NULL,
	[MetaTitle] [varchar](250) NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](250) NULL,
	[Price] [decimal](18, 0) NULL CONSTRAINT [DF_CarPart_Price]  DEFAULT ((0)),
	[PromotionPrice] [decimal](18, 0) NULL CONSTRAINT [DF_CarPart_PromotionPrice]  DEFAULT ((0)),
	[Quantity] [int] NULL CONSTRAINT [DF_CarPart_Quantity]  DEFAULT ((0)),
	[CategoryID] [bigint] NULL CONSTRAINT [DF_CarPart_CategoryID]  DEFAULT ((0)),
	[Warranty] [int] NULL CONSTRAINT [DF_CarPart_Warranty]  DEFAULT ((0)),
	[OriginID] [int] NULL,
	[ManufacturerID] [int] NULL,
	[CreatedDate] [datetime] NULL CONSTRAINT [DF_CarPart_CreatedDate]  DEFAULT (getdate()),
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[Status] [bit] NULL CONSTRAINT [DF_CarPart_Status]  DEFAULT ((0)),
 CONSTRAINT [PK_CarPart] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CarPartCategory]    Script Date: 5/1/2019 1:44:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CarPartCategory](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[ParentID] [bigint] NULL CONSTRAINT [DF_CarPartCategory_ParentID]  DEFAULT ((0)),
	[DisplayOrder] [int] NULL CONSTRAINT [DF_CarPartCategory_DisplayOrder]  DEFAULT ((0)),
	[SeoTitle] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL CONSTRAINT [DF_CarPartCategory_CreatedDate]  DEFAULT (getdate()),
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[Status] [bit] NULL CONSTRAINT [DF_CarPartCategory_Status]  DEFAULT ((1))
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 5/1/2019 1:44:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Content]    Script Date: 5/1/2019 1:44:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Content](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[Image] [nvarchar](250) NULL CONSTRAINT [DF_Content_DisplayOrder]  DEFAULT ((0)),
	[CategoryID] [bigint] NULL,
	[Detail] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL CONSTRAINT [DF_Content_CreatedDate]  DEFAULT (getdate()),
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nvarchar](250) NULL,
	[Status] [bit] NULL CONSTRAINT [DF_Content_Status]  DEFAULT ((1)),
	[ViewCount] [int] NULL CONSTRAINT [DF_Content_ViewCount]  DEFAULT ((0)),
	[Tags] [nvarchar](500) NULL,
 CONSTRAINT [PK_Content] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ContentTag]    Script Date: 5/1/2019 1:44:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ContentTag](
	[ContentID] [bigint] NOT NULL,
	[TagID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ContentTag] PRIMARY KEY CLUSTERED 
(
	[ContentID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 5/1/2019 1:44:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Content] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Footer]    Script Date: 5/1/2019 1:44:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Footer](
	[ID] [varchar](50) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Footer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 5/1/2019 1:44:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL CONSTRAINT [DF_Manufacturer_CreatedDate]  DEFAULT (getdate()),
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Status] [bit] NULL CONSTRAINT [DF_Manufacturer_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 5/1/2019 1:44:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](50) NULL,
	[Link] [nvarchar](250) NULL,
	[DisplayOrder] [int] NULL,
	[Target] [nvarchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NewsCategory]    Script Date: 5/1/2019 1:44:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NewsCategory](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[ParentID] [bigint] NULL,
	[DisplayOrder] [int] NULL CONSTRAINT [DF_Category_DisplayOrder]  DEFAULT ((0)),
	[SeoTitle] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL CONSTRAINT [DF_Category_CreatedDate]  DEFAULT (getdate()),
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[Status] [bit] NULL CONSTRAINT [DF_Category_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Origin]    Script Date: 5/1/2019 1:44:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Origin](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL CONSTRAINT [DF_Origin_CreatedDate]  DEFAULT (getdate()),
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Status] [bit] NULL CONSTRAINT [DF_Origin_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_Origin] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SystemConfig]    Script Date: 5/1/2019 1:44:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemConfig](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL,
	[Value] [nvarchar](250) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_SystemConfig] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tag]    Script Date: 5/1/2019 1:44:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tag](
	[ID] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 5/1/2019 1:44:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](32) NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL CONSTRAINT [DF_User_CreatedDate]  DEFAULT (getdate()),
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[CarCategory] ON 

INSERT [dbo].[CarCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (1, N'Honda', N'honda', 0, 1, N'Honda Car', CAST(N'2019-04-16 00:24:37.330' AS DateTime), N'admin', CAST(N'2019-04-16 00:00:00.000' AS DateTime), N'admin', N'honda', N'honda                                                                                                                                                                                                                                                     ', 1)
INSERT [dbo].[CarCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (2, N'Toyota', N'toyota', 1, 1, N'Toyota Car', CAST(N'2019-04-16 00:25:08.217' AS DateTime), N'admin', CAST(N'2019-04-16 01:01:26.797' AS DateTime), N'admin', N'toyota', N'toyota                                                                                                                                                                                                                                                    ', 0)
INSERT [dbo].[CarCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (4, N'aa', N'aa', 1, 2, N'aa', CAST(N'2019-04-16 00:58:19.487' AS DateTime), N'admin', CAST(N'2019-04-16 01:08:14.293' AS DateTime), N'admin', N'aa', N'aa                                                                                                                                                                                                                                                        ', 1)
INSERT [dbo].[CarCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (8, N'bb', N'bb', 1, 1, N'bb', CAST(N'2019-04-16 00:58:19.487' AS DateTime), N'admin', CAST(N'2019-04-16 01:08:14.293' AS DateTime), N'admin', N'bb', N'bb                                                                                                                                                                                                                                                        ', 1)
SET IDENTITY_INSERT [dbo].[CarCategory] OFF
SET IDENTITY_INSERT [dbo].[CarPart] ON 

INSERT [dbo].[CarPart] ([ID], [Name], [Code], [MetaTitle], [SeoTitle], [Description], [Image], [Price], [PromotionPrice], [Quantity], [CategoryID], [Warranty], [OriginID], [ManufacturerID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (1, N'aaa', N'AB-1578', N'aaa', N'Bán aaa giá rẻ, giao hàng nhanh chóng | B&SCars', N'<p>nvladnlnvsadnvsavn</p>

<p><strong>jalfkjalfjdflkajsfljfl ad<u>dfjlskfjlasfjl&nbsp;&nbsp;<em>fjsdlfkjdalfjslfjlsdfjlsjlsajfl adfkashfkashfka</em></u></strong></p>
', N'/Data/images/News/91fcfb59.jpg', CAST(123456 AS Decimal(18, 0)), CAST(456 AS Decimal(18, 0)), 50, 6, 2, 2, 1, CAST(N'2019-04-30 17:06:03.753' AS DateTime), N'admin', CAST(N'2019-05-01 02:37:40.380' AS DateTime), N'admin', N'phụ tùng ', N'phụ tùng ô tô honda                                                                                                                                                                                                                                       ', 1)
INSERT [dbo].[CarPart] ([ID], [Name], [Code], [MetaTitle], [SeoTitle], [Description], [Image], [Price], [PromotionPrice], [Quantity], [CategoryID], [Warranty], [OriginID], [ManufacturerID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (2, N'aaa', N'AB-1578', N'aaa', N'Bán aaa giá rẻ, giao hàng nhanh chóng | B&SCars', N'<p><span style="font-size:16px">asfasfjlfjsdlfjsalfjl</span></p>

<p style="text-align:center"><input alt="" src="/Data/images/News/20190329_dulichdalat.jpg" style="width: 1600px; height: 1200px;" type="image" /></p>

<p>&nbsp;</p>

<p>sdaflksadjflasjdflsajdfllsajf</p>

<p>&nbsp;</p>

<p style="text-align:right"><input alt="" src="/Data/images/News/91fcfb59.jpg" style="width: 500px; height: 360px;" type="image" /></p>
', N'/Data/images/News/20190329_dulichdalat.jpg', CAST(123456 AS Decimal(18, 0)), CAST(-1 AS Decimal(18, 0)), 50, 6, 2, 6, 3, CAST(N'2019-05-01 02:34:45.393' AS DateTime), N'admin', CAST(N'2019-05-01 02:34:45.393' AS DateTime), N'admin', N'phụ tùng ', N'phụ tùng ô tô honda                                                                                                                                                                                                                                       ', 0)
SET IDENTITY_INSERT [dbo].[CarPart] OFF
SET IDENTITY_INSERT [dbo].[CarPartCategory] ON 

INSERT [dbo].[CarPartCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (1, N'Ốc Vít', N'oc Vit', 0, 2, N'ốc vít bù lon con ốc', CAST(N'2019-04-15 03:48:34.800' AS DateTime), N'admin', CAST(N'2019-04-15 03:54:58.853' AS DateTime), N'admin', N'ốc vít, bù lon, con tán', N'trang bán ốc vít                                                                                                                                                                                                                                          ', 1)
INSERT [dbo].[CarPartCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (2, N'Bù Lon', N'bu-lon', 0, 3, N'Phụ Tùng Bù Lon', CAST(N'2019-04-15 04:01:26.087' AS DateTime), N'admin', CAST(N'2019-04-15 16:20:17.833' AS DateTime), N'admin', N'bù lon, con tán, ốc vít', N'trang bán phụ tùng                                                                                                                                                                                                                                        ', 1)
INSERT [dbo].[CarPartCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (6, N'a', N'a', 1, 4, N'd', CAST(N'2019-04-15 16:28:41.137' AS DateTime), N'admin', CAST(N'2019-04-15 16:28:51.103' AS DateTime), N'admin', N'b', N'c                                                                                                                                                                                                                                                         ', 1)
INSERT [dbo].[CarPartCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (9, N'abc', N'abc', 0, 1, N'c', CAST(N'2019-05-01 10:55:00.337' AS DateTime), N'admin', CAST(N'2019-05-01 10:55:00.337' AS DateTime), N'admin', N'a', N'b                                                                                                                                                                                                                                                         ', 1)
SET IDENTITY_INSERT [dbo].[CarPartCategory] OFF
SET IDENTITY_INSERT [dbo].[Content] ON 

INSERT [dbo].[Content] ([ID], [Name], [MetaTitle], [Image], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [Tags]) VALUES (1, N'Tin lá cải ', N'tin-la-cai', N'0', 1, N'aaaaaaaaa', CAST(N'2019-03-17 00:00:00.000' AS DateTime), N'admin', CAST(N'2019-03-17 00:00:00.000' AS DateTime), N'admin', N'aaaaaaaaaaaaaaa', N'aaaaaaaaaaaaaaa                                                                                                                                                                                                                                           ', 1, 10, N'a')
INSERT [dbo].[Content] ([ID], [Name], [MetaTitle], [Image], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [Tags]) VALUES (2, N'Tin lá cải ', N'tin-la-cai', N'0', 2, N'aaaaaaaaa', CAST(N'2019-03-17 00:00:00.000' AS DateTime), N'admin', CAST(N'2019-03-17 00:00:00.000' AS DateTime), N'admin', N'aaaaaaaaaaaaaaa', N'aaaaaaaaaaaaaaa                                                                                                                                                                                                                                           ', 1, 10, N'a')
INSERT [dbo].[Content] ([ID], [Name], [MetaTitle], [Image], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [Tags]) VALUES (3, N'Tin lá cải ', N'tin-la-cai', N'0', 1, N'aaaaaaaaa', CAST(N'2019-03-17 00:00:00.000' AS DateTime), N'admin', CAST(N'2019-03-17 00:00:00.000' AS DateTime), N'admin', N'aaaaaaaaaaaaaaa', N'aaaaaaaaaaaaaaa                                                                                                                                                                                                                                           ', 1, 10, N'a')
INSERT [dbo].[Content] ([ID], [Name], [MetaTitle], [Image], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [Tags]) VALUES (4, N'Tin lá cải ', N'tin-la-cai', N'0', 2, N'aaaaaaaaa', CAST(N'2019-03-17 00:00:00.000' AS DateTime), N'admin', CAST(N'2019-03-17 00:00:00.000' AS DateTime), N'admin', N'aaaaaaaaaaaaaaa', N'aaaaaaaaaaaaaaa                                                                                                                                                                                                                                           ', 1, 10, N'a')
INSERT [dbo].[Content] ([ID], [Name], [MetaTitle], [Image], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [Tags]) VALUES (5, N'Tin lá cải ', N'tin-la-cai', N'0', 1, N'aaaaaaaaa', CAST(N'2019-03-17 00:00:00.000' AS DateTime), N'admin', CAST(N'2019-03-17 00:00:00.000' AS DateTime), N'admin', N'aaaaaaaaaaaaaaa', N'aaaaaaaaaaaaaaa                                                                                                                                                                                                                                           ', 1, 10, N'a')
INSERT [dbo].[Content] ([ID], [Name], [MetaTitle], [Image], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [Tags]) VALUES (6, N'Tin lá cải ', N'tin-la-cai', N'/Data/images/News/20190329_dulichdalat.jpg', 2, N'<p>asdsad</p>', CAST(N'2019-03-17 00:00:00.000' AS DateTime), N'admin', CAST(N'2019-03-17 00:00:00.000' AS DateTime), N'admin', N'aaaaa', N'aaaaaaaaaaaaaaa                                                                                                                                                                                                                                           ', 0, 10, N'a')
INSERT [dbo].[Content] ([ID], [Name], [MetaTitle], [Image], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [Tags]) VALUES (7, N'Tin lá cải ', N'tin-la-cai', N'/Data/images/News/20190329_dulichdalat.jpg', 1, N'aaaaaaaaa', CAST(N'2019-03-17 00:00:00.000' AS DateTime), N'admin', CAST(N'2019-03-17 00:00:00.000' AS DateTime), N'admin', N'aaaaaaaaaaaaaaa', N'aaaaaaaaaaaaaaa                                                                                                                                                                                                                                           ', 1, 10, N'a')
INSERT [dbo].[Content] ([ID], [Name], [MetaTitle], [Image], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [Tags]) VALUES (8, N'Tin lá cải ', N'tin-la-cai', N'/Data/images/News/20190329_dulichdalat.jpg', 1, N'aaaaaaaaa', CAST(N'2019-03-17 00:00:00.000' AS DateTime), N'admin', CAST(N'2019-03-17 00:00:00.000' AS DateTime), N'admin', N'213', N'aaaaaaaaaaaaaaa                                                                                                                                                                                                                                           ', 1, 10, N'a')
INSERT [dbo].[Content] ([ID], [Name], [MetaTitle], [Image], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [Tags]) VALUES (9, N'Tin lá cải ', N'tin-la-cai', N'/Data/images/News/20190329_dulichdalat.jpg', 2, N'aaaaaaaaa', CAST(N'2019-03-17 00:00:00.000' AS DateTime), N'admin', CAST(N'2019-03-17 00:00:00.000' AS DateTime), N'admin', N'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', N'aaaaaaaaaaaaaaa                                                                                                                                                                                                                                           ', 1, 10, N'a')
INSERT [dbo].[Content] ([ID], [Name], [MetaTitle], [Image], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [Tags]) VALUES (10, N'tin mua chó dạo', N'tin-mua-cho-dao', N'/Data/images/News/20190329_dulichdalat.jpg', 2, N'<p>sadada</p>
', CAST(N'2019-03-17 00:00:00.000' AS DateTime), N'admin', CAST(N'2019-04-14 00:19:14.603' AS DateTime), N'admin', N'213', N'3                                                                                                                                                                                                                                                         ', 0, 10, N'a')
INSERT [dbo].[Content] ([ID], [Name], [MetaTitle], [Image], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [Tags]) VALUES (12, N'tin lá cải', N'tin-la-cai', N'/Data/images/News/20190329_dulichdalat.jpg', 2, N' afsafsdfsadfd ', CAST(N'2019-04-13 01:54:22.713' AS DateTime), N'admin', CAST(N'2019-04-13 01:54:22.713' AS DateTime), N'admin', N'5', N'213                                                                                                                                                                                                                                                       ', 0, 3, N'a')
INSERT [dbo].[Content] ([ID], [Name], [MetaTitle], [Image], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [Tags]) VALUES (18, N'aa', N'aa', N'/Data/images/News/20190329_dulichdalat.jpg', 2, N'<p>asdsad</p>', CAST(N'2019-04-13 04:12:39.343' AS DateTime), N'admin', CAST(N'2019-04-13 04:12:39.343' AS DateTime), N'admin', N'4', N'23                                                                                                                                                                                                                                                        ', 1, 3, N'a')
INSERT [dbo].[Content] ([ID], [Name], [MetaTitle], [Image], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [Tags]) VALUES (25, N'abcde', N'abcde', N'/Data/images/News/20190329_dulichdalat.jpg', 2, N'<p>asdsad</p>
', CAST(N'2019-04-13 09:04:44.550' AS DateTime), N'admin', CAST(N'2019-04-21 00:19:57.210' AS DateTime), N'admin', N'as', N'asd                                                                                                                                                                                                                                                       ', 1, 1, N'aa')
INSERT [dbo].[Content] ([ID], [Name], [MetaTitle], [Image], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [Tags]) VALUES (32, N'abc', N'', N'/Data/images/News/20190329_dulichdalat.jpg', 2, N'<p>asdsad</p>
', CAST(N'2019-04-13 09:38:09.577' AS DateTime), N'admin', CAST(N'2019-04-15 16:12:10.913' AS DateTime), N'admin', N'b', N'a                                                                                                                                                                                                                                                         ', 1, 34, N'c')
INSERT [dbo].[Content] ([ID], [Name], [MetaTitle], [Image], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [Tags]) VALUES (37, N'abc', N'abc', N'/Data/images/News/20190329_dulichdalat.jpg', 2, NULL, CAST(N'2019-04-13 09:38:09.577' AS DateTime), N'admin', CAST(N'2019-04-13 19:16:59.617' AS DateTime), N'admin', N'b', N'a                                                                                                                                                                                                                                                         ', 0, 2, N'c')
INSERT [dbo].[Content] ([ID], [Name], [MetaTitle], [Image], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [Tags]) VALUES (41, N'ABC', N'abc', N'/Data/images/News/91fcfb59.jpg', 2, N'<p>sacsacsacsacsa</p>
', CAST(N'2019-04-13 15:42:36.803' AS DateTime), N'admin', CAST(N'2019-04-15 16:12:39.777' AS DateTime), N'admin', N'không có', N'test 1 chút tin tức thôi mà!                                                                                                                                                                                                                              ', 1, 0, N'tin-nham;')
INSERT [dbo].[Content] ([ID], [Name], [MetaTitle], [Image], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [Tags]) VALUES (43, N'ccc', N'ccc', N'/Data/images/News/91fcfb59.jpg', 2, N'<p>scacsacsac</p>
', CAST(N'2019-04-13 16:18:10.943' AS DateTime), N'admin', CAST(N'2019-04-14 00:18:49.657' AS DateTime), N'admin', N'a', N'o                                                                                                                                                                                                                                                         ', 1, 0, N'a')
INSERT [dbo].[Content] ([ID], [Name], [MetaTitle], [Image], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [Tags]) VALUES (44, N'ABC', N'ABC', N'/Data/images/News/20190329_dulichdalat.jpg', 3, N'<p>asd</p>
', CAST(N'2019-04-14 00:19:41.590' AS DateTime), N'admin', CAST(N'2019-04-14 14:18:28.453' AS DateTime), N'admin', N'aa', N'a                                                                                                                                                                                                                                                         ', 0, 0, N'a')
SET IDENTITY_INSERT [dbo].[Content] OFF
SET IDENTITY_INSERT [dbo].[Manufacturer] ON 

INSERT [dbo].[Manufacturer] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, N'Honda', CAST(N'2019-05-01 11:04:26.337' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Manufacturer] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, N'Toyota', CAST(N'2019-05-01 11:04:33.110' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Manufacturer] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (3, N'Royar', CAST(N'2019-05-01 11:04:44.040' AS DateTime), NULL, CAST(N'2019-05-01 12:09:50.947' AS DateTime), N'admin', 1)
SET IDENTITY_INSERT [dbo].[Manufacturer] OFF
SET IDENTITY_INSERT [dbo].[NewsCategory] ON 

INSERT [dbo].[NewsCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (1, N'Tin Thế Giới', N'Tin-The-Gioi', 0, 4, N'Blogs - World', CAST(N'2019-03-17 19:12:04.463' AS DateTime), N'admin', CAST(N'2019-04-15 02:41:57.157' AS DateTime), N'admin', N'Tin Thế Giới', N'Tin tức - sự kiện trên thế giới                                                                                                                                                                                                                           ', 1)
INSERT [dbo].[NewsCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (2, N'Tin Trong Nước', N'Tin Trong Nuoc', 0, 1, N'Blogs - In The National', CAST(N'2019-03-17 19:12:17.897' AS DateTime), N'admin', CAST(N'2019-04-15 03:39:39.723' AS DateTime), N'admin', N'Tin Trong Nước', N'tin tức trong nước                                                                                                                                                                                                                                        ', 1)
INSERT [dbo].[NewsCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (3, N'Thời Sự', N'Thoi-Su', 2, 1, N'Blogs - Thời Sự', CAST(N'2019-04-14 14:09:17.743' AS DateTime), N'admin', CAST(N'2019-04-15 02:43:08.337' AS DateTime), N'admin', N'Thời Sự', N'trang thời sự                                                                                                                                                                                                                                             ', 1)
INSERT [dbo].[NewsCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (4, N'Kinh Tế', N'kinh-te', 2, 4, N'Blogs - Kinh Tế', CAST(N'2019-04-14 14:55:16.933' AS DateTime), NULL, CAST(N'2019-04-15 16:14:09.087' AS DateTime), N'admin', N'kinh tế thị trường, kinh tế quốc tế', N'trang kinh tế                                                                                                                                                                                                                                             ', 1)
INSERT [dbo].[NewsCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (7, N'Pháp Sự', N'Phap-Su', 2, 2, N'Blogs - Pháp Sự Việt Nam', CAST(N'2019-04-14 14:55:33.127' AS DateTime), NULL, CAST(N'2019-04-15 02:34:45.713' AS DateTime), N'admin', N'pháp sự', N'blogs chứa thông tin pháp sư                                                                                                                                                                                                                              ', 1)
INSERT [dbo].[NewsCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (9, N'Thể Thao', N'The-Thao', 2, 3, N'Blogs - Thể Thao', CAST(N'2019-04-15 01:33:08.163' AS DateTime), N'admin', CAST(N'2019-04-15 02:42:19.407' AS DateTime), N'admin', N'Thể Thao', N'Các tin tức về thể thao                                                                                                                                                                                                                                   ', 0)
INSERT [dbo].[NewsCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (10, N'Tuổi Trẻ', N'Tuoi Tre', 2, 5, N'Blogs - Tuổi Trẻ', CAST(N'2019-04-15 02:37:02.700' AS DateTime), N'admin', CAST(N'2019-04-15 03:38:59.840' AS DateTime), N'admin', N'tuổi trẻ', N'trang tuổi trẻ                                                                                                                                                                                                                                            ', 1)
INSERT [dbo].[NewsCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (11, N'Tin Ngoài Trái Đất', N'Tin Ngoai Trai dat', 0, 2, N'Blogs - Tin Từ Vũ Trụ', CAST(N'2019-04-15 03:40:41.247' AS DateTime), N'admin', CAST(N'2019-04-15 03:40:41.247' AS DateTime), N'admin', N'vũ trụ, ngoài trái đất', N'trang thông tin ngoài trái đất                                                                                                                                                                                                                            ', 1)
SET IDENTITY_INSERT [dbo].[NewsCategory] OFF
SET IDENTITY_INSERT [dbo].[Origin] ON 

INSERT [dbo].[Origin] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, N'Chính Hãng', CAST(N'2019-05-01 10:22:41.757' AS DateTime), N'admin', CAST(N'2019-05-01 10:22:41.757' AS DateTime), N'admin', 1)
INSERT [dbo].[Origin] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, N'Nhập Khẩu', CAST(N'2019-05-01 10:22:55.947' AS DateTime), N'admin', CAST(N'2019-05-01 10:22:55.947' AS DateTime), N'admin', 1)
INSERT [dbo].[Origin] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (3, N'Lắp Ráp Trong Nước', CAST(N'2019-05-01 10:23:23.173' AS DateTime), N'admin', CAST(N'2019-05-01 10:23:23.173' AS DateTime), N'admin', 1)
INSERT [dbo].[Origin] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (4, N'Đài Loan', CAST(N'2019-05-01 10:23:30.357' AS DateTime), N'admin', CAST(N'2019-05-01 10:24:20.813' AS DateTime), N'admin', 0)
INSERT [dbo].[Origin] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (5, N'Trung Quốc', CAST(N'2019-05-01 10:23:35.800' AS DateTime), N'admin', CAST(N'2019-05-01 10:23:35.800' AS DateTime), N'admin', 1)
INSERT [dbo].[Origin] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (6, N'Korea', CAST(N'2019-05-01 10:23:41.573' AS DateTime), N'admin', CAST(N'2019-05-01 10:23:57.643' AS DateTime), N'admin', 1)
INSERT [dbo].[Origin] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (7, N'Japan', CAST(N'2019-05-01 10:25:22.443' AS DateTime), N'admin', CAST(N'2019-05-01 10:25:22.443' AS DateTime), N'admin', 1)
INSERT [dbo].[Origin] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (8, N'Malaysia', CAST(N'2019-05-01 10:25:42.797' AS DateTime), N'admin', CAST(N'2019-05-01 10:25:42.797' AS DateTime), N'admin', 1)
INSERT [dbo].[Origin] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (9, N'Singapore', CAST(N'2019-05-01 10:25:59.020' AS DateTime), N'admin', CAST(N'2019-05-01 10:25:59.020' AS DateTime), N'admin', 1)
SET IDENTITY_INSERT [dbo].[Origin] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Phone], [Email], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (3, N'admin', N'202cb962ac59075b964b07152d234b70', N'P.T.Nhan', N'Binh Duong', N'0123456789', N'thanhnhanphung97@gmail.com', CAST(N'2019-03-14 02:39:17.933' AS DateTime), N'admin', CAST(N'2019-03-14 00:00:00.000' AS DateTime), N'admin', 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Phone], [Email], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (4, N'test03', N'202cb962ac59075b964b07152d234b70', N'Hoang', N'HN', N'0123456789', N'cc@gmail.com', CAST(N'2019-03-14 02:39:17.933' AS DateTime), N'admin', CAST(N'2019-03-14 00:00:00.000' AS DateTime), N'admin', 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Phone], [Email], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (5, N'test04', N'202cb962ac59075b964b07152d234b70', N'Nghia', N'Hai Phong', N'0123456789', N'dd@gmail.com', CAST(N'2019-03-14 02:39:17.933' AS DateTime), N'admin', CAST(N'2019-03-14 00:00:00.000' AS DateTime), N'admin', 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Phone], [Email], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (6, N'test05', N'202cb962ac59075b964b07152d234b70', N'Hau', N'Da Nang', N'0123456789', N'ee@gmail.com', CAST(N'2019-03-14 02:39:17.933' AS DateTime), N'admin', CAST(N'2019-03-14 00:00:00.000' AS DateTime), N'admin', 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Phone], [Email], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (7, N'test06', N'202cb962ac59075b964b07152d234b70', N'Tam', N'DakLak', N'0123456789', N'dd@gmail.com', CAST(N'2019-03-14 02:39:17.933' AS DateTime), N'admin', CAST(N'2019-03-14 00:00:00.000' AS DateTime), N'admin', 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Phone], [Email], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (8, N'test07', N'202cb962ac59075b964b07152d234b70', N'Quoc', N'Gia Lai', N'0123456789', N'ff@gmail.com', CAST(N'2019-03-14 02:39:17.933' AS DateTime), N'admin', CAST(N'2019-03-14 00:00:00.000' AS DateTime), N'admin', 0)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Phone], [Email], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (9, N'test08', N'202cb962ac59075b964b07152d234b70', N'Dong', N'TPHCM', N'0123456789', N'gg@gmail.com', CAST(N'2019-03-14 02:39:17.933' AS DateTime), N'admin', CAST(N'2019-03-14 00:00:00.000' AS DateTime), N'admin', 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Phone], [Email], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (10, N'test09', N'202cb962ac59075b964b07152d234b70', N'AA', N'TPHCM', N'0123456789', N'hh@gmail.com', CAST(N'2019-03-14 02:39:17.933' AS DateTime), N'admin', CAST(N'2019-03-14 00:00:00.000' AS DateTime), N'admin', 0)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Phone], [Email], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (11, N'test10', N'202cb962ac59075b964b07152d234b70', N'BB', N'TPHCM', N'0123456789', N'ii@gmail.com', CAST(N'2019-03-14 02:39:17.933' AS DateTime), N'admin', CAST(N'2019-03-14 00:00:00.000' AS DateTime), N'admin', 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Phone], [Email], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (12, N'test11', N'202cb962ac59075b964b07152d234b70', N'ABC', N'Q3', N'0123456789', N'kk@gmail.com', CAST(N'2019-03-14 02:39:17.933' AS DateTime), N'admin', NULL, N'admin', 0)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Phone], [Email], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (13, N'test12', N'202cb962ac59075b964b07152d234b70', N'DD', N'Q7 TPHCM', N'0123456789', N'll@gmail.com', CAST(N'2019-03-14 02:39:17.933' AS DateTime), N'admin', NULL, N'admin', 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Phone], [Email], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (15, N'bbbb', N'202cb962ac59075b964b07152d234b70', N'Nguyen van a', N'Bình Dương', N'01226112017', N'myfriend1102vn@yahoo.com', CAST(N'2019-03-16 22:55:22.110' AS DateTime), N'admin', CAST(N'2019-03-16 22:55:22.110' AS DateTime), N'admin', 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Phone], [Email], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (38, N'abcd123', N'202cb962ac59075b964b07152d234b70', N'nguyen van bb', N'Bình Dương', N'01226112017', N'myfriend1102vn@yahoo.com', CAST(N'2019-03-16 22:55:48.890' AS DateTime), N'admin', NULL, N'admin', 0)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Phone], [Email], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (43, N'user001', N'202cb962ac59075b964b07152d234b70', N'nguyen van a', N'Binh Duong', N'0123456789', N'aaa@gmail.com', CAST(N'2019-04-11 09:27:38.913' AS DateTime), N'admin', NULL, N'admin', 1)
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[About] ADD  CONSTRAINT [DF_About_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Car] ADD  CONSTRAINT [DF_Car_CategoryID]  DEFAULT ((0)) FOR [CategoryID]
GO
ALTER TABLE [dbo].[Car] ADD  CONSTRAINT [DF_Car_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Car] ADD  CONSTRAINT [DF_Car_Deposited]  DEFAULT ((0)) FOR [Deposited]
GO
ALTER TABLE [dbo].[Car] ADD  CONSTRAINT [DF_Car_Sold]  DEFAULT ((0)) FOR [Sold]
GO
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [DF_Feedback_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [DF_Feedback_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_DisplayOrder]  DEFAULT ((0)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_Status]  DEFAULT ((1)) FOR [Status]
GO
