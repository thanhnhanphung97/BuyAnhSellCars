USE [BuyAndSellCars]
GO
/****** Object:  Table [dbo].[About]    Script Date: 5/3/2019 11:55:49 PM ******/
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
	[MetaDescriptions] [nvarchar](250) NULL,
 CONSTRAINT [PK_About] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Car]    Script Date: 5/3/2019 11:55:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Car](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CategoryID] [bigint] NULL CONSTRAINT [DF_Car_CategoryID]  DEFAULT ((0)),
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[Image] [nvarchar](250) NULL,
	[MoreImages] [xml] NULL,
	[Price] [decimal](18, 0) NULL CONSTRAINT [DF_Car_Price]  DEFAULT ((0)),
	[PrePay] [decimal](18, 0) NULL,
	[Model] [varchar](10) NULL,
	[Engine] [float] NULL,
	[Fuel] [nvarchar](10) NULL,
	[Gear] [nvarchar](15) NULL,
	[KmTraveled] [int] NULL,
	[CarColor] [nvarchar](20) NULL,
	[InteriorColor] [nvarchar](20) NULL,
	[OriginID] [int] NULL,
	[YearOfManufacture] [int] NULL,
	[Seats] [int] NULL,
	[DriveSystem] [nvarchar](50) NULL,
	[Doors] [int] NULL,
	[SalientFeatures] [xml] NULL,
	[CreatedDate] [datetime] NULL CONSTRAINT [DF_Car_CreatedDate]  DEFAULT (getdate()),
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nvarchar](250) NULL,
	[Sold] [bit] NULL CONSTRAINT [DF_Car_Sold]  DEFAULT ((0)),
	[Status] [bit] NULL,
 CONSTRAINT [PK_Car] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CarCategory]    Script Date: 5/3/2019 11:55:49 PM ******/
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
	[MetaDescriptions] [nvarchar](250) NULL,
	[Status] [bit] NULL CONSTRAINT [DF_CarCategory_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_CarCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CarPart]    Script Date: 5/3/2019 11:55:49 PM ******/
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
	[MetaDescriptions] [nvarchar](250) NULL,
	[Status] [bit] NULL CONSTRAINT [DF_CarPart_Status]  DEFAULT ((0)),
 CONSTRAINT [PK_CarPart] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CarPartCategory]    Script Date: 5/3/2019 11:55:49 PM ******/
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
	[MetaDescriptions] [nvarchar](250) NULL,
	[Status] [bit] NULL CONSTRAINT [DF_CarPartCategory_Status]  DEFAULT ((1))
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 5/3/2019 11:55:49 PM ******/
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
/****** Object:  Table [dbo].[Content]    Script Date: 5/3/2019 11:55:49 PM ******/
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
/****** Object:  Table [dbo].[ContentTag]    Script Date: 5/3/2019 11:55:49 PM ******/
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
/****** Object:  Table [dbo].[Feedback]    Script Date: 5/3/2019 11:55:49 PM ******/
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
/****** Object:  Table [dbo].[Footer]    Script Date: 5/3/2019 11:55:49 PM ******/
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
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 5/3/2019 11:55:49 PM ******/
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
/****** Object:  Table [dbo].[Menu]    Script Date: 5/3/2019 11:55:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](50) NULL,
	[Link] [nvarchar](250) NULL,
	[DisplayOrder] [int] NULL CONSTRAINT [DF_Menu_DisplayOrder]  DEFAULT ((0)),
	[Target] [nvarchar](50) NULL,
	[Status] [bit] NULL CONSTRAINT [DF_Menu_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NewsCategory]    Script Date: 5/3/2019 11:55:49 PM ******/
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
	[MetaDescriptions] [nvarchar](250) NULL,
	[Status] [bit] NULL CONSTRAINT [DF_Category_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Origin]    Script Date: 5/3/2019 11:55:49 PM ******/
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
/****** Object:  Table [dbo].[SalientFeatures]    Script Date: 5/3/2019 11:55:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalientFeatures](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_SalientFeatures] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SystemConfig]    Script Date: 5/3/2019 11:55:49 PM ******/
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
/****** Object:  Table [dbo].[Tag]    Script Date: 5/3/2019 11:55:49 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 5/3/2019 11:55:49 PM ******/
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
SET IDENTITY_INSERT [dbo].[Car] ON 

INSERT [dbo].[Car] ([ID], [CategoryID], [Name], [MetaTitle], [SeoTitle], [Image], [MoreImages], [Price], [PrePay], [Model], [Engine], [Fuel], [Gear], [KmTraveled], [CarColor], [InteriorColor], [OriginID], [YearOfManufacture], [Seats], [DriveSystem], [Doors], [SalientFeatures], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Sold], [Status]) VALUES (2, 14, N'Mazda CX5 2.5AT 2018', N'mazda-cx5-2.5at-2018', N'Bán xe Mazda CX5 2.5AT 2018 cũ, giá tốt', N'/Data/images/Car/Mazda/CX5/IMG_9761-800x533.jpg', N'<Images><Image>/Data/images/Car/Mazda/CX5/IMG_9761-800x533.jpg</Image><Image>/Data/images/News/20190329_dulichdalat.jpg</Image><Image>/Data/images/News/20665_f3411328874028db5d02d28c44732.jpg</Image><Image>/Data/images/News/12741917_186287715077384_8091326192450368040_n.jpg</Image></Images>', CAST(982000000 AS Decimal(18, 0)), CAST(285000000 AS Decimal(18, 0)), N'SUV', 2.5, N'Xăng', N'Số Tự Động', 9000, N'Đen', N'Đen', 3, 2018, 5, N'Một Cầu', 5, N'<Salients><Salient>Radio AM/FM</Salient><Salient>Khâu da vô lăng</Salient><Salient>Hệ thống phân phối lực phanh điện tử EBD</Salient><Salient>HAC - Hệ thống hỗ trợ khởi hành ngang dốc</Salient></Salients>', CAST(N'2019-05-02 23:13:02.320' AS DateTime), N'admin', CAST(N'2019-05-02 23:14:40.320' AS DateTime), N'admin', N'Mazda CX5 2.5AT 2018', N'Bán xe Mazda CX5 2.5AT 2018 cũ, giá tốt', 1, 1)
SET IDENTITY_INSERT [dbo].[Car] OFF
SET IDENTITY_INSERT [dbo].[CarCategory] ON 

INSERT [dbo].[CarCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (1, N'Honda', N'honda', 0, 1, N'Mua Bán Xe Honda cũ, uy tín, chất lượng, giá tốt', CAST(N'2019-04-16 00:24:37.330' AS DateTime), N'admin', CAST(N'2019-05-02 21:18:11.780' AS DateTime), N'admin', N'Hãng Honda', N'Mua Bán Xe Honda cũ, uy tín, chất lượng, giá tốt                                                                                                                                                                                                          ', 1)
INSERT [dbo].[CarCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (2, N'Accord', N'accord', 1, 1, N'Toyota Car', CAST(N'2019-04-16 00:25:08.217' AS DateTime), N'admin', CAST(N'2019-05-02 21:18:25.387' AS DateTime), N'admin', N'toyota', N'toyota                                                                                                                                                                                                                                                    ', 1)
INSERT [dbo].[CarCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (4, N'City', N'city', 1, 2, N'Mua Bán Xe Honda cũ, uy tín, chất lượng, giá tốt', CAST(N'2019-04-16 00:58:19.487' AS DateTime), N'admin', CAST(N'2019-05-02 21:18:34.007' AS DateTime), N'admin', N'Hãng Honda Dòng Xe City', N'Mua Bán Xe Honda cũ, uy tín, chất lượng, giá tốt                                                                                                                                                                                                          ', 1)
INSERT [dbo].[CarCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (8, N'CR V', N'cr-v', 1, 3, N'Mua Bán Xe Toyota cũ, uy tín, chất lượng, giá tốt', CAST(N'2019-04-16 00:58:19.487' AS DateTime), N'admin', CAST(N'2019-05-02 21:18:43.730' AS DateTime), N'admin', N'Hãng Honda Dòng Xe CR V', N'Mua Bán Xe Toyota cũ, uy tín, chất lượng, giá tốt                                                                                                                                                                                                         ', 1)
INSERT [dbo].[CarCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (9, N'Toyota', N'toyota', 0, 6, N'Mua Bán Xe Toyota cũ, uy tín, chất lượng, giá tốt', CAST(N'2019-05-02 21:15:07.127' AS DateTime), N'admin', CAST(N'2019-05-02 21:49:05.870' AS DateTime), N'admin', N'ÔTô Hãng  Toyota', N'Mua Bán Xe Toyota cũ, uy tín, chất lượng, giá tốt                                                                                                                                                                                                         ', 1)
INSERT [dbo].[CarCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (10, N'Innova', N'innova', 9, 2, N'Mua bán xe Toyota Innova cũ, uy tín, chất lượng, giá tốt', CAST(N'2019-05-02 21:16:26.667' AS DateTime), N'admin', CAST(N'2019-05-02 21:48:58.167' AS DateTime), N'admin', N'Hãng Toyota Dòng Innova', N'Mua bán xe Toyota Innova cũ, uy tín, chất lượng, giá tốt                                                                                                                                                                                                  ', 1)
INSERT [dbo].[CarCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (11, N'Camry', N'camry', 9, 1, N'Mua Bán Xe Toyota cũ, uy tín, chất lượng, giá tốt', CAST(N'2019-05-02 21:37:48.090' AS DateTime), N'admin', CAST(N'2019-05-02 21:48:50.457' AS DateTime), N'admin', N'Hãng Toyota Dòng Xe Camry', N'Mua Bán Xe Toyota cũ, uy tín, chất lượng, giá tốt', 1)
INSERT [dbo].[CarCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (12, N'Mazda', N'mazda', 0, 3, N'Mua Bán Xe Maxda cũ, uy tín, chất lượng, giá tốt', CAST(N'2019-05-02 21:38:29.070' AS DateTime), N'admin', CAST(N'2019-05-02 21:38:29.070' AS DateTime), N'admin', N'Hãng Xe Mazda', N'Mua Bán Xe Maxda cũ, uy tín, chất lượng, giá tốt', 1)
INSERT [dbo].[CarCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (13, N'Mezda 6', N'mezda-6', 12, 1, N'Mua Bán Xe Maxda cũ, uy tín, chất lượng, giá tốt', CAST(N'2019-05-02 21:39:40.530' AS DateTime), N'admin', CAST(N'2019-05-02 23:15:36.837' AS DateTime), N'admin', N'Hãng Xe Mazda Dòng Mazda 6', N'Mua Bán Xe Maxda cũ, uy tín, chất lượng, giá tốt', 1)
INSERT [dbo].[CarCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (14, N'CX5', N'cx5', 12, 2, N'Mua Bán Xe Maxda cũ, uy tín, chất lượng, giá tốt', CAST(N'2019-05-02 21:40:06.117' AS DateTime), N'admin', CAST(N'2019-05-02 21:40:06.117' AS DateTime), N'admin', N'Hãng Xe Mazda Dòng CX5', N'Mua Bán Xe Maxda cũ, uy tín, chất lượng, giá tốt', 1)
INSERT [dbo].[CarCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (15, N'CX6', N'cx6', 12, 3, N'Mua Bán Xe Maxda cũ, uy tín, chất lượng, giá tốt', CAST(N'2019-05-02 21:40:30.167' AS DateTime), N'admin', CAST(N'2019-05-02 21:40:30.167' AS DateTime), N'admin', N'Hãng Xe Mazda Dòng CX6', N'Mua Bán Xe Maxda cũ, uy tín, chất lượng, giá tốt', 1)
INSERT [dbo].[CarCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (16, N'Chevrolet', N'chevrolet', 0, 4, N'Mua Bán Xe Chevrolet cũ, uy tín, chất lượng, giá tốt', CAST(N'2019-05-02 21:40:58.610' AS DateTime), N'admin', CAST(N'2019-05-02 21:40:58.610' AS DateTime), N'admin', N'Hãng Xe Chevrolet', N'Mua Bán Xe Chevrolet cũ, uy tín, chất lượng, giá tốt', 0)
INSERT [dbo].[CarCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (17, N'Cruze', N'cruze', 16, 1, N'Mua Bán Xe Chevrolet cũ, uy tín, chất lượng, giá tốt', CAST(N'2019-05-02 21:41:57.843' AS DateTime), N'admin', CAST(N'2019-05-02 21:41:57.843' AS DateTime), N'admin', N'Hãng Xe Chevrolet Dòng Cruze', N'Mua Bán Xe Chevrolet cũ, uy tín, chất lượng, giá tốt', 0)
INSERT [dbo].[CarCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (18, N'Colorado', N'colorado', 16, 2, N'Mua Bán Xe Chevrolet cũ, uy tín, chất lượng, giá tốt', CAST(N'2019-05-02 21:42:25.213' AS DateTime), N'admin', CAST(N'2019-05-02 21:42:25.213' AS DateTime), N'admin', N'Hãng Xe Chevrolet Dòng Colorado', N'Mua Bán Xe Chevrolet cũ, uy tín, chất lượng, giá tốt', 1)
INSERT [dbo].[CarCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (19, N'Peugeot', N'peugeot', 0, 5, N'Mua Bán Xe Peugeot cũ, uy tín, chất lượng, giá tốt', CAST(N'2019-05-02 21:43:24.610' AS DateTime), N'admin', CAST(N'2019-05-02 21:43:24.610' AS DateTime), N'admin', N'Hãng Xe Peugeot', N'Mua Bán Xe Peugeot cũ, uy tín, chất lượng, giá tốt', 1)
INSERT [dbo].[CarCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (20, N'Huyndai', N'huyndai', 0, 2, N'Mua bán xe Huyndai cũ, uy tín, giá rẻ, chất lượng tốt', CAST(N'2019-05-02 21:44:31.873' AS DateTime), N'admin', CAST(N'2019-05-02 21:49:47.600' AS DateTime), N'admin', N'Hãng Xe Huyndai', N'Mua bán xe Huyndai cũ, uy tín, giá rẻ, chất lượng tốt', 1)
SET IDENTITY_INSERT [dbo].[CarCategory] OFF
SET IDENTITY_INSERT [dbo].[CarPart] ON 

INSERT [dbo].[CarPart] ([ID], [Name], [Code], [MetaTitle], [SeoTitle], [Description], [Image], [Price], [PromotionPrice], [Quantity], [CategoryID], [Warranty], [OriginID], [ManufacturerID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (3, N'Máy rửa xe máy áp lực cao Jetta 1,8KW', N'P-JET-1800', N'may-rua-xe-may-ap-luc-cao-jetta-1,8kw', N'Bán Máy rửa xe máy áp lực cao Jetta 1,8KW | Thiết bị rửa xe ô tô', N'<p><u><strong>TH&Ocirc;NG SỐ KỸ THUẬT:&nbsp;</strong></u></p>

<ol>
	<li>C&ocirc;ng suất m&ocirc; tơ: 1.8Kw</li>
	<li>Điện &aacute;p: 220v/50Hz</li>
	<li>Tốc độ: 1450 v/p</li>
	<li>&Aacute;p lực lớn nhất: 70bar</li>
	<li>Lưu lượng: 15.4 L/p</li>
	<li>Chiều d&agrave;i v&ograve;i phun: 8m hoặc 15m</li>
	<li>V&ograve;i phun: g&oacute;c 0 độ / 15 độ / 40 độ / V&ograve;i phun h&oacute;a chất</li>
	<li>Trọng lượng: 36kg</li>
	<li>Bảo h&agrave;nh: 12 th&aacute;ng</li>
</ol>

<p><u><strong>H&Igrave;NH ẢNH CHI TIẾT CỦA M&Aacute;Y RỬA XE M&Aacute;Y &Aacute;P LỰC CAO JETTA 1.8KW</strong></u></p>

<p><input alt="" src="/Data/images/CarPart/CarWashEquipment/JETTA/JET1800.jpg" style="height:680px; width:681px" type="image" /></p>

<p><input alt="" src="/Data/images/CarPart/CarWashEquipment/JETTA/JET1800-1.jpg" style="height:800px; width:599px" type="image" /></p>
', N'/Data/images/CarPart/CarWashEquipment/JETTA/JET1800.jpg', CAST(8240000 AS Decimal(18, 0)), CAST(-1 AS Decimal(18, 0)), 100, 19, 12, 4, 12, CAST(N'2019-05-03 17:55:35.823' AS DateTime), N'admin', CAST(N'2019-05-03 23:52:57.637' AS DateTime), N'admin', N'Máy rửa xe máy áp lực cao Jetta 1,8KW', N'Bán Máy rửa xe máy áp lực cao Jetta 1,8KW | Thiết bị rửa xe ô tô', 1)
INSERT [dbo].[CarPart] ([ID], [Name], [Code], [MetaTitle], [SeoTitle], [Description], [Image], [Price], [PromotionPrice], [Quantity], [CategoryID], [Warranty], [OriginID], [ManufacturerID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (4, N'Máy rửa xe cao áp Jetta Jet3000-1', N'P-JET-3000', N'may-rua-xe-cao-ap-jetta-jet3000-1', N'Bán Máy rửa xe cao áp Jetta Jet3000-1 | Thiết bị rửa xe Ôtô', N'<p><strong><u>TH&Ocirc;NG SỐ KỸ THUẬT:</u></strong></p>

<ol>
	<li><strong>H&atilde;ng Sản Xuất:&nbsp;</strong>JETTA</li>
	<li><strong>Loại Thiết Bị:&nbsp;</strong>M&aacute;y rửa xe &ocirc;t&ocirc;</li>
	<li><strong>C&ocirc;ng Suất:&nbsp;</strong>3Kw</li>
	<li><strong>Điện &Aacute;p:&nbsp;</strong>220V</li>
</ol>
', N'/Data/images/CarPart/CarWashEquipment/JETTA/jet3000-1.jpg', CAST(14240000 AS Decimal(18, 0)), CAST(-1 AS Decimal(18, 0)), 20, 19, 12, 1, 12, CAST(N'2019-05-03 22:38:49.610' AS DateTime), N'admin', CAST(N'2019-05-03 23:53:10.430' AS DateTime), N'admin', N'JETTA 3000-1', N'Bán Máy rửa xe cao áp Jetta Jet3000-1 | Thiết bị rửa xe Ôtô', 1)
INSERT [dbo].[CarPart] ([ID], [Name], [Code], [MetaTitle], [SeoTitle], [Description], [Image], [Price], [PromotionPrice], [Quantity], [CategoryID], [Warranty], [OriginID], [ManufacturerID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (5, N'Càng A Nissan Teana 2010-2012', N'P-A-NISSAN', N'cang-a-nissan-teana-2010-2012', N'Bán  Càng A Nissan Teana 2010-2012 | Phụ Tùng ÔTô', N'<p><span style="font-size:16px">T&ecirc;n SP: C&agrave;ng A<br />
Model: Teana 2010 - 2012</span></p>

<p><span style="font-size:16px">Xuất sứ: ThaiLand</span></p>

<p><span style="font-size:16px">Chất liệu: Cao cấp;</span></p>

<p><strong><span style="font-size:16px">&ldquo;C&agrave;ng a Nissan Teana&rdquo;&nbsp;phụ t&ugrave;ng ch&iacute;nh h&atilde;ng thương hiệu Nissan</span></strong></p>

<h3><strong><span style="font-size:16px">Ch&uacute;ng t&ocirc;i khuy&ecirc;n bạn d&ugrave;ng &ldquo;C&agrave;ng a Nissan Teana&Prime;&nbsp;để đảm bảo chất lượng &nbsp;sử dụng phục vụ tốt nhất cho chiếc xe hoạt động hiệu quả hơn. Sử dụng phụ t&ugrave;ng giả mạo hoặc kh&ocirc;ng ch&iacute;nh h&atilde;ng đ&ocirc;i khi sẽ dẫn đến hậu quả kh&ocirc;ng tốt, đặc biệt khiến bạn mất nhiều thời gian v&agrave; tiền bạc.</span></strong></h3>

<h3><strong><span style="font-size:16px">Ch&uacute;ng t&ocirc;i cam&nbsp;kết b&aacute;n h&agrave;ng đảm bảo đ&uacute;ng nguồn gốc xuất xứ của sản phẩm, gi&aacute; cả cạnh tranh.</span></strong></h3>

<h3><strong><span style="font-size:16px">Tất cả c&aacute;c sản phẩm được đổi, trả lại h&agrave;ng trong v&ograve;ng 7 ng&agrave;y kể từ ng&agrave;y xuất h&agrave;ng. Với điều kiện h&agrave;ng c&ograve;n nguy&ecirc;n vẹn, kh&ocirc;ng lắp r&aacute;p, trầy xước, c&ograve;n nguy&ecirc;n vỏ hộp.</span></strong></h3>

<h3><strong><span style="font-size:16px">Tất cả sản phẩm của ch&uacute;ng t&ocirc;i đều c&oacute; dịch vụ Ship to&agrave;n quốc.</span></strong></h3>
', N'/Data/images/CarPart/OtherCarPart/canganissanteana.jpg', CAST(1400000 AS Decimal(18, 0)), CAST(-1 AS Decimal(18, 0)), 45, 17, 12, 14, 14, CAST(N'2019-05-03 23:11:08.977' AS DateTime), N'admin', CAST(N'2019-05-03 23:11:08.977' AS DateTime), N'admin', N'Càng A Nissan Teana 2010 - 2012', N'Bán  Càng A Nissan Teana 2010-2012 | Phụ Tùng ÔTô', 1)
INSERT [dbo].[CarPart] ([ID], [Name], [Code], [MetaTitle], [SeoTitle], [Description], [Image], [Price], [PromotionPrice], [Quantity], [CategoryID], [Warranty], [OriginID], [ManufacturerID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (6, N'Két làm mát Tubo Nissan Navara D40T', N'P-A-NISSAN', N'ket-lam-mat-tubo-nissan-navara-d40t', N'Bán Két làm mát Tubo Nissan Navara D40T | Phụ Tùng ÔTô', N'<p><span style="font-family:Arial,Helvetica,sans-serif"><span style="font-size:16px"><strong><u>TH&Ocirc;NG SỐ KỸ THUẬT:&nbsp;</u></strong></span></span></p>

<p>&nbsp;</p>

<ol>
	<li><span style="font-family:Arial,Helvetica,sans-serif"><span style="font-size:16px"><strong>T&ecirc;n h&agrave;ng:&nbsp;&nbsp;</strong>K&eacute;t l&agrave;m m&aacute;t tubo Navara</span></span></li>
	<li><span style="font-family:Arial,Helvetica,sans-serif"><span style="font-size:16px"><strong>Model:</strong>&nbsp; 2012 -2014</span></span></li>
	<li><span style="font-family:Arial,Helvetica,sans-serif"><span style="font-size:16px"><strong>Xuất sứ:</strong>&nbsp; Th&aacute;i Lan</span></span></li>
	<li><span style="font-family:Arial,Helvetica,sans-serif"><span style="font-size:16px"><strong>Chất liệu:&nbsp;&nbsp;</strong>Cao cấp</span></span></li>
	<li><span style="font-family:Arial,Helvetica,sans-serif"><span style="font-size:16px"><strong>Loại phụ t&ugrave;ng:&nbsp;</strong>K&eacute;t l&agrave;m m&aacute;t Tubo</span></span></li>
</ol>

<p><span style="font-family:Arial,Helvetica,sans-serif"><span style="font-size:16px"><strong><u>MỘT SỐ H&Igrave;NH ẢNH CỦA SẢN PHẨM:</u></strong></span></span></p>

<p><span style="font-family:Arial,Helvetica,sans-serif"><span style="font-size:16px"><strong><u><input alt="" src="/Data/images/CarPart/OtherCarPart/ketlammat-nissan-1.jpg" style="width: 800px; height: 449px;" type="image" /></u></strong></span></span></p>

<p><span style="font-family:Arial,Helvetica,sans-serif"><span style="font-size:16px"><strong><u><input alt="" src="/Data/images/CarPart/OtherCarPart/ketlammat-nissan.jpg" style="width: 800px; height: 449px;" type="image" />​​​​​​​</u></strong></span></span></p>

<p>&nbsp;</p>

<p>&nbsp;</p>
', N'/Data/images/CarPart/OtherCarPart/ketlammat-nissan.jpg', CAST(1900000 AS Decimal(18, 0)), CAST(-1 AS Decimal(18, 0)), 10, 17, 0, 14, 14, CAST(N'2019-05-03 23:17:20.863' AS DateTime), N'admin', CAST(N'2019-05-03 23:17:20.863' AS DateTime), N'admin', N'Két làm mát Tubo Nissan Navara D40T', N'Bán Két làm mát Tubo Nissan Navara D40T | Phụ Tùng ÔTô', 1)
INSERT [dbo].[CarPart] ([ID], [Name], [Code], [MetaTitle], [SeoTitle], [Description], [Image], [Price], [PromotionPrice], [Quantity], [CategoryID], [Warranty], [OriginID], [ManufacturerID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (7, N'Bộ gioăng đại tu mazda 3 1.5', N'P-BG-MAZDA', N'bo-gioang-dai-tu-mazda-3-1.5', N'Bán Bộ gioăng đại tu mazda 3 1.5| Phụ Tùng ÔTô', N'<p><span style="font-size:16px"><span style="font-family:Arial,Helvetica,sans-serif"><strong><u>TH&Ocirc;NG TIN KỸ THUẬT:</u></strong></span></span></p>

<ol>
	<li><span style="font-size:16px"><span style="font-family:Arial,Helvetica,sans-serif"><strong>T&ecirc;n h&agrave;ng:</strong> Bộ gioăng đại tu</span></span></li>
	<li><span style="font-size:16px"><span style="font-family:Arial,Helvetica,sans-serif"><strong>M&atilde; SP:</strong>&nbsp;8LAD10271A</span></span></li>
	<li><span style="font-size:16px"><span style="font-family:Arial,Helvetica,sans-serif"><strong>Model:</strong> Mazda 3 1.5 2015 -2017</span></span></li>
	<li><span style="font-size:16px"><span style="font-family:Arial,Helvetica,sans-serif"><strong>Xuất sứ:</strong> Th&aacute;i Lan</span></span></li>
	<li><span style="font-family:Arial,Helvetica,sans-serif"><span style="font-size:16px"><strong>Nguồn gốc:&nbsp;</strong>Ch&iacute;nh H&atilde;ng</span></span></li>
	<li><span style="font-size:16px"><span style="font-family:Arial,Helvetica,sans-serif"><strong>Chất liệu:</strong> Cao cấp</span></span></li>
</ol>

<p><span style="font-size:16px"><span style="font-family:Arial,Helvetica,sans-serif">Bộ gioăng đại tu Mazda 3 d&ugrave;ng để duy tu bả dưỡng m&aacute;y. Chất lượng cao, bền bỷ gi&aacute; cả hợp l&yacute;.</span></span></p>
', N'/Data/images/CarPart/OtherCarPart/phutung-mazda.jpg', CAST(1400000 AS Decimal(18, 0)), CAST(-1 AS Decimal(18, 0)), 100, 17, 6, 1, 15, CAST(N'2019-05-03 23:25:59.780' AS DateTime), N'admin', CAST(N'2019-05-03 23:30:29.220' AS DateTime), N'admin', N'Bộ gioăng đại tu Mazda3 1.5', N'Bán Bộ gioăng đại tu mazda 3 1.5| Phụ Tùng ÔTô', 1)
INSERT [dbo].[CarPart] ([ID], [Name], [Code], [MetaTitle], [SeoTitle], [Description], [Image], [Price], [PromotionPrice], [Quantity], [CategoryID], [Warranty], [OriginID], [ManufacturerID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (8, N'Lốc lạnh Ford Transit', N'P-FT-FORD', N'loc-lanh-ford-transit', N'Bán Lốc lạnh Ford Transit | Phụ Tùng ÔTô', N'<p>...</p>
', N'/Data/images/CarPart/OtherCarPart/fort-transit.JPG', CAST(5050000 AS Decimal(18, 0)), CAST(-1 AS Decimal(18, 0)), 10, 17, 12, 1, 16, CAST(N'2019-05-03 23:29:39.367' AS DateTime), N'admin', CAST(N'2019-05-03 23:30:34.150' AS DateTime), N'admin', N'Lốc lạnh Ford Transit', N'Bán Lốc lạnh Ford Transit | Phụ Tùng ÔTô', 1)
INSERT [dbo].[CarPart] ([ID], [Name], [Code], [MetaTitle], [SeoTitle], [Description], [Image], [Price], [PromotionPrice], [Quantity], [CategoryID], [Warranty], [OriginID], [ManufacturerID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (9, N'Kích cá sấu Asaki AK-017', N'P-AK-017', N'kich-ca-sau-asaki-ak-017', N'Bán Kích cá sấu Asaki AK-017 | Cầu Nâng ', N'<p><span style="font-size:16px"><span style="font-family:Arial,Helvetica,sans-serif"><strong><u>TH&Ocirc;NG SỐ KỸ THUẬT:&nbsp;</u></strong></span></span></p>

<ol>
	<li><span style="font-size:16px"><span style="font-family:Arial,Helvetica,sans-serif"><strong>H&atilde;ng Sản Xuất:&nbsp;</strong>Asaki</span></span></li>
	<li><span style="font-size:16px"><span style="font-family:Arial,Helvetica,sans-serif">Loại: Cầu n&acirc;ng một trụ&nbsp;</span></span></li>
	<li><span style="font-size:16px"><span style="font-family:Arial,Helvetica,sans-serif">Sức n&acirc;ng (kg): 2000Kg</span></span></li>
	<li><span style="font-size:16px"><span style="font-family:Arial,Helvetica,sans-serif">Khoảng c&aacute;ch hai trụ (mm): 0</span></span></li>
	<li><span style="font-size:16px"><span style="font-family:Arial,Helvetica,sans-serif">Xuất Sứ: Japan</span></span></li>
</ol>
', N'/Data/images/CarPart/LiftingBridge/APillar/Asaki-AK017.jpg', CAST(570000 AS Decimal(18, 0)), CAST(-1 AS Decimal(18, 0)), 40, 16, 0, 7, 17, CAST(N'2019-05-03 23:39:41.930' AS DateTime), N'admin', CAST(N'2019-05-03 23:48:51.950' AS DateTime), N'admin', N'Kích cá sấu Asaki AK-017', N'Bán Kích cá sấu Asaki AK-017 | Cầu Nâng ', 1)
INSERT [dbo].[CarPart] ([ID], [Name], [Code], [MetaTitle], [SeoTitle], [Description], [Image], [Price], [PromotionPrice], [Quantity], [CategoryID], [Warranty], [OriginID], [ManufacturerID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (14, N'Kích cá sấu Asaki AK-038', N'P-AK-038', N'kich-ca-sau-asaki-ak-038', N'Bán Kích cá sấu Asaki AK-038 | Cầu Nâng', N'<p><span style="font-size:16px"><span style="font-family:Arial,Helvetica,sans-serif"><strong><u>TH&Ocirc;NG SỐ KỸ THUẬT:&nbsp;</u></strong></span></span></p>

<ol>
	<li><span style="font-size:16px"><span style="font-family:Arial,Helvetica,sans-serif"><strong>H&atilde;ng Sản Xuất:&nbsp;</strong>Asaki</span></span></li>
	<li><span style="font-size:16px"><span style="font-family:Arial,Helvetica,sans-serif">Loại: Cầu n&acirc;ng một trụ&nbsp;</span></span></li>
	<li><span style="font-size:16px"><span style="font-family:Arial,Helvetica,sans-serif">Sức n&acirc;ng (kg): 3000Kg</span></span></li>
	<li><span style="font-size:16px"><span style="font-family:Arial,Helvetica,sans-serif">Khoảng c&aacute;ch hai trụ (mm): 0</span></span></li>
	<li><span style="font-size:16px"><span style="font-family:Arial,Helvetica,sans-serif">Xuất Sứ: Japan</span></span></li>
</ol>
', N'/Data/images/CarPart/LiftingBridge/APillar/Asaki-AK038.jpg', CAST(1650000 AS Decimal(18, 0)), CAST(-1 AS Decimal(18, 0)), 40, 16, 6, 7, 17, CAST(N'2019-05-03 23:42:27.107' AS DateTime), N'admin', CAST(N'2019-05-03 23:49:54.980' AS DateTime), N'admin', N'Kích cá sấu Asaki AK-038', N'Bán Kích cá sấu Asaki AK-038 | Cầu Nâng', 1)
SET IDENTITY_INSERT [dbo].[CarPart] OFF
SET IDENTITY_INSERT [dbo].[CarPartCategory] ON 

INSERT [dbo].[CarPartCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (1, N'Phụ Tùng Ô Tô', N'phu-tung-o-to', 0, 4, N'Bán phụ tùng ô tô ', CAST(N'2019-04-15 03:48:34.800' AS DateTime), N'admin', CAST(N'2019-05-03 17:35:45.890' AS DateTime), N'admin', N'Phụ Tùng Khác', N'Bán phụ tùng ô tô ', 1)
INSERT [dbo].[CarPartCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (2, N'Cầu Nâng', N'cau-nang', 0, 3, N'Bán Cầu Nâng Xe ÔTô tốt, giá rẻ, uy tín', CAST(N'2019-04-15 04:01:26.087' AS DateTime), N'admin', CAST(N'2019-05-03 17:24:59.870' AS DateTime), N'admin', N'Cầu Nâng Xe ÔTô', N'Bán Cầu Nâng Xe ÔTô tốt, giá rẻ, uy tín', 1)
INSERT [dbo].[CarPartCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (6, N'Dầu Nhớt', N'dau-nhot', 0, 2, N'Bán dầu nhớt xe ôtô', CAST(N'2019-04-15 16:28:41.137' AS DateTime), N'admin', CAST(N'2019-05-03 17:24:03.467' AS DateTime), N'admin', N'Dầu Nhớt Xe ÔTô', N'Bán dầu nhớt xe ôtô', 1)
INSERT [dbo].[CarPartCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (9, N'Lốp Xe Ô Tô', N'lop-xe-o-to', 0, 1, N'Bán lốp xe ô tô tốt, giá rẻ, hàng chất lượng', CAST(N'2019-05-01 10:55:00.337' AS DateTime), N'admin', CAST(N'2019-05-03 17:22:25.963' AS DateTime), N'admin', N'Lốp Xe Ô Tô', N'Bán lốp xe ô tô tốt, giá rẻ, hàng chất lượng', 1)
INSERT [dbo].[CarPartCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (10, N'Thiết Bị Rửa Xe ÔTô', N'thiet-bi-rua-xe-oto', 0, 5, N'Bán Thiết Bị Rửa Xe ÔTô tốt, uy tín, giá rẻ', CAST(N'2019-05-03 17:25:40.500' AS DateTime), N'admin', CAST(N'2019-05-03 17:25:40.500' AS DateTime), N'admin', N'Thiết Bị Rửa Xe ÔTô', N'Bán Thiết Bị Rửa Xe ÔTô tốt, uy tín, giá rẻ', 1)
INSERT [dbo].[CarPartCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (11, N'Lốp Xe Ô Tô Hãng Bridgestone', N'lop-xe-o-to-hang-bridgestone', 9, 1, N'Bán Lốp Xe Ô Tô Hãng Bridgestone tốt, uy tín, chất lượng', CAST(N'2019-05-03 17:27:45.817' AS DateTime), N'admin', CAST(N'2019-05-03 17:27:45.817' AS DateTime), N'admin', N'Lốp Xe Ô Tô Hãng Bridgestone', N'Bán Lốp Xe Ô Tô Hãng Bridgestone tốt, uy tín, chất lượng', 1)
INSERT [dbo].[CarPartCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (12, N'Lốp Xe Ô Tô Hãng Hankook', N'lop-xe-o-to-hang-hankook', 9, 2, N'Bán Lốp Xe Ô Tô Hãng Hankook tốt, uy tín, giá rẻ', CAST(N'2019-05-03 17:28:39.967' AS DateTime), N'admin', CAST(N'2019-05-03 17:28:39.967' AS DateTime), N'admin', N'Lốp Xe Ô Tô Hãng Hankook', N'Bán Lốp Xe Ô Tô Hãng Hankook tốt, uy tín, giá rẻ', 0)
INSERT [dbo].[CarPartCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (13, N'Lốp Xe Ô Tô Hãng Michelin', N'lop-xe-o-to-hang-michelin', 9, 3, N'Bán Lốp Xe Ô Tô Hãng Michelin tốt, uy tín, giá rẻ', CAST(N'2019-05-03 17:31:21.597' AS DateTime), N'admin', CAST(N'2019-05-03 17:31:21.597' AS DateTime), N'admin', N'Lốp Xe Ô Tô Hãng Michelin', N'Bán Lốp Xe Ô Tô Hãng Michelin tốt, uy tín, giá rẻ', 1)
INSERT [dbo].[CarPartCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (14, N'Dầu Động Cơ', N'dau-Iong-co', 6, 1, N'Bán Dầu Động Cơ Xe Ô Tô', CAST(N'2019-05-03 17:32:30.067' AS DateTime), N'admin', CAST(N'2019-05-03 17:32:30.067' AS DateTime), N'admin', N'Dầu Động Cơ', N'Bán Dầu Động Cơ Xe Ô Tô', 1)
INSERT [dbo].[CarPartCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (15, N'Dầu Chống Gỉ', N'dau-chong-gi', 6, 2, N'Bán Dầu Chống Gỉ Cho Xe Ô Tô', CAST(N'2019-05-03 17:32:49.643' AS DateTime), N'admin', CAST(N'2019-05-03 17:32:49.643' AS DateTime), N'admin', N'Dầu Chống Gỉ', N'Bán Dầu Chống Gỉ Cho Xe Ô Tô', 1)
INSERT [dbo].[CarPartCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (16, N'Cầu Nâng Một Trụ', N'cau-nang-mot-tru', 2, 1, N'Bán Cầu Nâng Một Trụ Cho Xe Ô Tô', CAST(N'2019-05-03 17:33:56.707' AS DateTime), N'admin', CAST(N'2019-05-03 17:33:56.707' AS DateTime), N'admin', N'Cầu Nâng Một Trụ', N'Bán Cầu Nâng Một Trụ Cho Xe Ô Tô', 1)
INSERT [dbo].[CarPartCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (17, N'Phụ Tùng Khác', N'phu-tung-khac', 1, 1, N'Bán Các Loại Phụ Tùng Xe Ô Tô', CAST(N'2019-05-03 17:36:11.643' AS DateTime), N'admin', CAST(N'2019-05-03 17:36:11.643' AS DateTime), N'admin', N'Phụ Tùng Khác', N'Bán Các Loại Phụ Tùng Xe Ô Tô', 1)
INSERT [dbo].[CarPartCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (18, N'Thiết Bị Rửa Xe Hãng PROJET', N'thiet-bi-rua-xe-hang-projet', 10, 1, N'Bán Thiết Bị Rửa Xe Hãng PROJET uy tín', CAST(N'2019-05-03 17:37:26.687' AS DateTime), N'admin', CAST(N'2019-05-03 17:37:26.687' AS DateTime), N'admin', N'Thiết Bị Rửa Xe Hãng PROJET', N'Bán Thiết Bị Rửa Xe Hãng PROJET uy tín', 1)
INSERT [dbo].[CarPartCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (19, N'Thiết Bị Rửa Xe Hãng JETTA', N'thiet-bi-rua-xe-hang-jetta', 10, 2, N'Bán Thiết Bị Rửa Xe Hãng JETTA uy tín', CAST(N'2019-05-03 17:38:04.597' AS DateTime), N'admin', CAST(N'2019-05-03 17:38:04.597' AS DateTime), N'admin', N'Thiết Bị Rửa Xe Hãng JETTA', N'Bán Thiết Bị Rửa Xe Hãng JETTA uy tín', 1)
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
INSERT [dbo].[Manufacturer] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (12, N'Jetta', CAST(N'2019-05-03 17:43:42.070' AS DateTime), N'admin', CAST(N'2019-05-03 23:31:50.087' AS DateTime), N'admin', 1)
INSERT [dbo].[Manufacturer] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (13, N'Projet', CAST(N'2019-05-03 23:00:19.180' AS DateTime), N'admin', CAST(N'2019-05-03 23:31:42.997' AS DateTime), N'admin', 1)
INSERT [dbo].[Manufacturer] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (14, N'Nissan', CAST(N'2019-05-03 23:04:14.857' AS DateTime), N'admin', CAST(N'2019-05-03 23:04:14.857' AS DateTime), N'admin', 1)
INSERT [dbo].[Manufacturer] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (15, N'ACM', CAST(N'2019-05-03 23:26:23.210' AS DateTime), N'admin', CAST(N'2019-05-03 23:26:23.210' AS DateTime), N'admin', 1)
INSERT [dbo].[Manufacturer] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (16, N'Ford', CAST(N'2019-05-03 23:29:54.940' AS DateTime), N'admin', CAST(N'2019-05-03 23:29:54.940' AS DateTime), N'admin', 1)
INSERT [dbo].[Manufacturer] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (17, N'Asaki', CAST(N'2019-05-03 23:32:05.667' AS DateTime), N'admin', CAST(N'2019-05-03 23:32:05.667' AS DateTime), N'admin', 1)
SET IDENTITY_INSERT [dbo].[Manufacturer] OFF
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status]) VALUES (2, N'Trang Chủ', N'http://localhost:20455/', 1, N'_self', 0)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status]) VALUES (3, N'Tìm Mua Xe', N'http://localhost:20455/tim-mua-xe/', 2, N'_blank', 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status]) VALUES (4, N'Bán Xe', N'http://localhost:20455/ban-xe/', 4, N'_blank', 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status]) VALUES (5, N'Phụ Tùng', N'http://localhost:20455/phu-tung', 3, N'_blank', 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status]) VALUES (6, N'Giới Thiệu', N'http://localhost:20455/gioi-thieu', 5, N'_self', 0)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status]) VALUES (7, N'Liên Hệ', N'http://localhost:20455/lien-he/', 7, N'_self', 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status]) VALUES (8, N'Tin Tức', N'http://localhost:20455/tin-tuc', 6, N'_blank', 1)
SET IDENTITY_INSERT [dbo].[Menu] OFF
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
INSERT [dbo].[Origin] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (4, N'Đài Loan', CAST(N'2019-05-01 10:23:30.357' AS DateTime), N'admin', CAST(N'2019-05-01 10:24:20.813' AS DateTime), N'admin', 1)
INSERT [dbo].[Origin] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (5, N'Trung Quốc', CAST(N'2019-05-01 10:23:35.800' AS DateTime), N'admin', CAST(N'2019-05-01 10:23:35.800' AS DateTime), N'admin', 1)
INSERT [dbo].[Origin] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (6, N'Korea', CAST(N'2019-05-01 10:23:41.573' AS DateTime), N'admin', CAST(N'2019-05-01 10:23:57.643' AS DateTime), N'admin', 1)
INSERT [dbo].[Origin] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (7, N'Japan', CAST(N'2019-05-01 10:25:22.443' AS DateTime), N'admin', CAST(N'2019-05-01 10:25:22.443' AS DateTime), N'admin', 1)
INSERT [dbo].[Origin] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (8, N'Malaysia', CAST(N'2019-05-01 10:25:42.797' AS DateTime), N'admin', CAST(N'2019-05-01 10:25:42.797' AS DateTime), N'admin', 1)
INSERT [dbo].[Origin] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (9, N'Singapore', CAST(N'2019-05-01 10:25:59.020' AS DateTime), N'admin', CAST(N'2019-05-01 10:25:59.020' AS DateTime), N'admin', 1)
INSERT [dbo].[Origin] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (13, N'Đang Chờ Cập Nhật', CAST(N'2019-05-03 23:02:43.980' AS DateTime), N'admin', CAST(N'2019-05-03 23:02:43.980' AS DateTime), N'admin', 1)
INSERT [dbo].[Origin] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (14, N'ThaiLand', CAST(N'2019-05-03 23:03:41.187' AS DateTime), N'admin', CAST(N'2019-05-03 23:03:41.187' AS DateTime), N'admin', 1)
SET IDENTITY_INSERT [dbo].[Origin] OFF
SET IDENTITY_INSERT [dbo].[SalientFeatures] ON 

INSERT [dbo].[SalientFeatures] ([ID], [Name], [Status]) VALUES (1, N'Kính hiển thị tốc độ HUD', 1)
INSERT [dbo].[SalientFeatures] ([ID], [Name], [Status]) VALUES (3, N'i-stop hệ thống ngắt/ mở động cơ', 1)
INSERT [dbo].[SalientFeatures] ([ID], [Name], [Status]) VALUES (4, N'Camera hành trình', 1)
INSERT [dbo].[SalientFeatures] ([ID], [Name], [Status]) VALUES (5, N'Camera lùi', 1)
INSERT [dbo].[SalientFeatures] ([ID], [Name], [Status]) VALUES (6, N' Nội thất bọc da', 1)
INSERT [dbo].[SalientFeatures] ([ID], [Name], [Status]) VALUES (7, N'Phanh ABS', 1)
INSERT [dbo].[SalientFeatures] ([ID], [Name], [Status]) VALUES (8, N'Phanh tay điện tử', 1)
INSERT [dbo].[SalientFeatures] ([ID], [Name], [Status]) VALUES (9, N'Cân bằng điện tử', 1)
INSERT [dbo].[SalientFeatures] ([ID], [Name], [Status]) VALUES (10, N'Chống trơn trượt', 1)
INSERT [dbo].[SalientFeatures] ([ID], [Name], [Status]) VALUES (11, N'Cruise Control - Ga tự động', 1)
INSERT [dbo].[SalientFeatures] ([ID], [Name], [Status]) VALUES (12, N'Cảm biến lùi', 1)
INSERT [dbo].[SalientFeatures] ([ID], [Name], [Status]) VALUES (13, N'Cảm biến trước', 1)
INSERT [dbo].[SalientFeatures] ([ID], [Name], [Status]) VALUES (14, N'Túi khí an toàn', 1)
INSERT [dbo].[SalientFeatures] ([ID], [Name], [Status]) VALUES (15, N'Cửa sổ trời', 1)
INSERT [dbo].[SalientFeatures] ([ID], [Name], [Status]) VALUES (16, N'Chìa khóa thông minh - Khởi động bằng nút bấm', 1)
INSERT [dbo].[SalientFeatures] ([ID], [Name], [Status]) VALUES (17, N'Gương - kính chỉnh điện - gập điện', 1)
INSERT [dbo].[SalientFeatures] ([ID], [Name], [Status]) VALUES (18, N'Ghế chỉnh điện', 1)
INSERT [dbo].[SalientFeatures] ([ID], [Name], [Status]) VALUES (19, N'Nhớ vị trí ghế', 1)
INSERT [dbo].[SalientFeatures] ([ID], [Name], [Status]) VALUES (20, N'Điều khiển tích hợp trên vô lăng', 1)
INSERT [dbo].[SalientFeatures] ([ID], [Name], [Status]) VALUES (21, N'Lazang đúc hợp kim', 1)
INSERT [dbo].[SalientFeatures] ([ID], [Name], [Status]) VALUES (22, N'Màn hình giải trí trung tâm', 1)
INSERT [dbo].[SalientFeatures] ([ID], [Name], [Status]) VALUES (23, N'HAC - Hệ thống hỗ trợ khởi hành ngang dốc', 1)
INSERT [dbo].[SalientFeatures] ([ID], [Name], [Status]) VALUES (24, N'Hệ thống phân phối lực phanh điện tử EBD', 1)
INSERT [dbo].[SalientFeatures] ([ID], [Name], [Status]) VALUES (25, N'Khâu da vô lăng', 1)
INSERT [dbo].[SalientFeatures] ([ID], [Name], [Status]) VALUES (26, N'Radio AM/FM', 1)
INSERT [dbo].[SalientFeatures] ([ID], [Name], [Status]) VALUES (28, N'Đèn chiếu sáng dạng Projector', 1)
INSERT [dbo].[SalientFeatures] ([ID], [Name], [Status]) VALUES (29, N'Đèn Led daylight', 1)
INSERT [dbo].[SalientFeatures] ([ID], [Name], [Status]) VALUES (31, N' Điều hòa tự động', 1)
SET IDENTITY_INSERT [dbo].[SalientFeatures] OFF
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
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [DF_Feedback_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [DF_Feedback_Status]  DEFAULT ((1)) FOR [Status]
GO
