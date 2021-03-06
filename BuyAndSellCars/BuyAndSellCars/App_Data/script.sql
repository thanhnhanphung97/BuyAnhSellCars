USE [BuyAndSellCars]
GO
/****** Object:  Table [dbo].[Car]    Script Date: 5/13/2019 5:46:54 AM ******/
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
/****** Object:  Table [dbo].[CarCategory]    Script Date: 5/13/2019 5:46:54 AM ******/
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
/****** Object:  Table [dbo].[CarPart]    Script Date: 5/13/2019 5:46:54 AM ******/
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
/****** Object:  Table [dbo].[CarPartCategory]    Script Date: 5/13/2019 5:46:54 AM ******/
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
/****** Object:  Table [dbo].[Content]    Script Date: 5/13/2019 5:46:54 AM ******/
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
/****** Object:  Table [dbo].[Decentralization]    Script Date: 5/13/2019 5:46:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Decentralization](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserManager] [bit] NULL CONSTRAINT [DF_Decentralization_AddUser]  DEFAULT ((0)),
	[CarPartManager] [bit] NULL CONSTRAINT [DF_Decentralization_EditUser]  DEFAULT ((0)),
	[CarManager] [bit] NULL CONSTRAINT [DF_Decentralization_DeleteUser]  DEFAULT ((0)),
	[OrderManager] [bit] NULL CONSTRAINT [DF_Decentralization_MainMenu]  DEFAULT ((0)),
	[NewsManager] [bit] NULL CONSTRAINT [DF_Decentralization_NewsCategory]  DEFAULT ((0)),
	[SystemManager] [bit] NULL CONSTRAINT [DF_Decentralization_CarPartCategory]  DEFAULT ((0)),
 CONSTRAINT [PK_Decentralization] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 5/13/2019 5:46:54 AM ******/
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
	[CreatedDate] [datetime] NULL CONSTRAINT [DF_Feedback_CreatedDate]  DEFAULT (getdate()),
	[Status] [bit] NULL CONSTRAINT [DF_Feedback_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Footer]    Script Date: 5/13/2019 5:46:54 AM ******/
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
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 5/13/2019 5:46:54 AM ******/
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
/****** Object:  Table [dbo].[MemberGroup]    Script Date: 5/13/2019 5:46:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberGroup](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](250) NULL,
	[DecenID] [int] NULL,
 CONSTRAINT [PK_MemberGroup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Menu]    Script Date: 5/13/2019 5:46:54 AM ******/
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
/****** Object:  Table [dbo].[NewsCategory]    Script Date: 5/13/2019 5:46:54 AM ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 5/13/2019 5:46:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CustomerID] [bigint] NULL,
	[ShipName] [nvarchar](50) NULL,
	[ShipMobile] [varchar](50) NULL,
	[ShipAddress] [nvarchar](100) NULL,
	[ShipEmail] [nvarchar](50) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 5/13/2019 5:46:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ProductID] [bigint] NOT NULL,
	[OrderID] [bigint] NOT NULL,
	[Quantity] [int] NULL CONSTRAINT [DF_OrderDetail_Quantity]  DEFAULT ((1)),
	[Price] [decimal](18, 0) NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Origin]    Script Date: 5/13/2019 5:46:54 AM ******/
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
	[Type] [int] NULL,
 CONSTRAINT [PK_Origin] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SalientFeatures]    Script Date: 5/13/2019 5:46:54 AM ******/
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
/****** Object:  Table [dbo].[SystemConfig]    Script Date: 5/13/2019 5:46:54 AM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 5/13/2019 5:46:54 AM ******/
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
	[Type] [int] NULL,
	[GroupID] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Car] ON 

INSERT [dbo].[Car] ([ID], [CategoryID], [Name], [MetaTitle], [SeoTitle], [Image], [MoreImages], [Price], [PrePay], [Model], [Engine], [Fuel], [Gear], [KmTraveled], [CarColor], [InteriorColor], [OriginID], [YearOfManufacture], [Seats], [DriveSystem], [Doors], [SalientFeatures], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Sold], [Status]) VALUES (2, 14, N'Mazda CX5 2.5AT 2018', N'mazda-cx5-2-5at-2018', N'Bán xe Mazda CX5 2.5AT 2018 cũ, giá tốt', N'/Data/images/Car/Mazda/CX5/IMG_9761-800x533.jpg', N'<Images><Image>/Data/images/Car/Mazda/CX5/IMG_9761-800x533.jpg</Image><Image>/Data/images/Car/Mazda/CX5/IMG_9761-800x533.jpg</Image></Images>', CAST(982000000 AS Decimal(18, 0)), CAST(285000000 AS Decimal(18, 0)), N'SUV', 2.5, N'Xăng', N'Số Tự Động', 9000, N'Đen', N'Đen', 3, 2018, 5, N'Một Cầu', 5, N'<Salients><Salient>Camera hành trình</Salient><Salient>i-stop hệ thống ngắt/ mở động cơ</Salient><Salient>Kính hiển thị tốc độ HUD</Salient><Salient>Radio AM/FM</Salient><Salient>Khâu da vô lăng</Salient><Salient>Hệ thống phân phối lực phanh điện tử EBD</Salient><Salient>HAC - Hệ thống hỗ trợ khởi hành ngang dốc</Salient></Salients>', CAST(N'2019-05-02 23:13:02.320' AS DateTime), N'admin', CAST(N'2019-05-02 23:14:40.320' AS DateTime), N'admin', N'Mazda CX5 2.5AT 2018', N'Bán xe Mazda CX5 2.5AT 2018 cũ, giá tốt', 1, 1)
INSERT [dbo].[Car] ([ID], [CategoryID], [Name], [MetaTitle], [SeoTitle], [Image], [MoreImages], [Price], [PrePay], [Model], [Engine], [Fuel], [Gear], [KmTraveled], [CarColor], [InteriorColor], [OriginID], [YearOfManufacture], [Seats], [DriveSystem], [Doors], [SalientFeatures], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Sold], [Status]) VALUES (10003, 22, N'Hyundai i10 Sedan 1.2AT 2018', N'hyundai-i10-sedan-1-2at-2018', N'Bán Hyundai i10 Sedan 1.2AT 2018 | BaSCars', N'/Data/images/Car/Huyndai/Senda/huyndai_senda_1.jpg', N'<Images><Image>/Data/images/Car/Huyndai/Senda/huyndai_senda_1.jpg</Image><Image>/Data/images/Car/Huyndai/Senda/huyndai_senda_2.jpg</Image><Image>/Data/images/Car/Huyndai/Senda/huyndai_senda_3.jpg</Image></Images>', CAST(419000000 AS Decimal(18, 0)), CAST(200000000 AS Decimal(18, 0)), N'Senda', 1.2, N'Xăng', N'Số Tự Động', 15000, N'Bạc', N'Nhiều Màu', 3, 2018, 5, N'Một Cầu', 4, NULL, CAST(N'2019-05-13 01:32:08.143' AS DateTime), NULL, CAST(N'2019-05-13 03:25:50.553' AS DateTime), NULL, N'Hyundai i10 Sedan 1.2AT 2018', N'Bán Hyundai i10 Sedan 1.2AT 2018 | BaSCars', 0, 1)
INSERT [dbo].[Car] ([ID], [CategoryID], [Name], [MetaTitle], [SeoTitle], [Image], [MoreImages], [Price], [PrePay], [Model], [Engine], [Fuel], [Gear], [KmTraveled], [CarColor], [InteriorColor], [OriginID], [YearOfManufacture], [Seats], [DriveSystem], [Doors], [SalientFeatures], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Sold], [Status]) VALUES (10004, 23, N'Mazda 3 1.5AT 2016', N'mazda-3-1-5at-2016', N'Bán Mazda 3 1.5AT 2016 | Buy And Sell Cars ', N'/Data/images/Car/Mazda/mazda-3-2016-1.jpg', N'<Images><Image>/Data/images/Car/Mazda/mazda-3-2016-1.jpg</Image><Image>/Data/images/Car/Mazda/mazda-3-2016-2.jpg</Image><Image>/Data/images/Car/Mazda/mazda-3-2016-3.jpg</Image><Image>/Data/images/Car/Mazda/mazda-3-2016-4.jpg</Image><Image>/Data/images/Car/Mazda/mazda-3-2016-5.jpg</Image><Image>/Data/images/Car/Mazda/mazda-3-2016-6.jpg</Image><Image>/Data/images/Car/Mazda/mazda-3-2016-7.jpg</Image><Image>/Data/images/Car/Mazda/mazda-3-2016-8.jpg</Image></Images>', CAST(585000000 AS Decimal(18, 0)), CAST(168000000 AS Decimal(18, 0)), N'Sedan', 1.5, N'Xăng', N'Số Tự Động', 27000, N'Trắng', N'Đen', 3, 2016, 5, N'Một Cầu', 4, N'<Salients><Salient>Lazang đúc hợp kim</Salient><Salient>Nhớ vị trí ghế</Salient><Salient>Cửa sổ trời</Salient><Salient>Cruise Control - Ga tự động</Salient><Salient>Phanh tay điện tử</Salient><Salient>Phanh ABS</Salient><Salient>Camera lùi</Salient></Salients>', CAST(N'2019-05-13 01:40:40.110' AS DateTime), NULL, CAST(N'2019-05-13 01:40:40.110' AS DateTime), NULL, N'Mazda 3 1.5AT 2016', N'Bán Mazda 3 1.5AT 2016 | Buy And Sell Cars ', 1, 1)
INSERT [dbo].[Car] ([ID], [CategoryID], [Name], [MetaTitle], [SeoTitle], [Image], [MoreImages], [Price], [PrePay], [Model], [Engine], [Fuel], [Gear], [KmTraveled], [CarColor], [InteriorColor], [OriginID], [YearOfManufacture], [Seats], [DriveSystem], [Doors], [SalientFeatures], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Sold], [Status]) VALUES (10005, 8, N'Honda CR V 2.0AT 2017', N'honda-cr-v-2-0at-2017', N'Bán Xe Honda CR V 2.0AT 2017 | BaSCars uy tín, chất lượng', N'/Data/images/Car/Honda/CR-V/honda-cr-v-2017-1.jpg', N'<Images><Image>/Data/images/Car/Honda/CR-V/honda-cr-v-2017-1.jpg</Image><Image>/Data/images/Car/Honda/CR-V/honda-cr-v-2017-2.jpg</Image><Image>/Data/images/Car/Honda/CR-V/honda-cr-v-2017-3.jpg</Image><Image>/Data/images/Car/Honda/CR-V/honda-cr-v-2017-4.jpg</Image><Image>/Data/images/Car/Honda/CR-V/honda-cr-v-2017-5.jpg</Image><Image>/Data/images/Car/Honda/CR-V/honda-cr-v-2017-6.jpg</Image><Image>/Data/images/Car/Honda/CR-V/honda-cr-v-2017-7.jpg</Image><Image>/Data/images/Car/Honda/CR-V/honda-cr-v-2017-8.jpg</Image><Image>/Data/images/Car/Honda/CR-V/honda-cr-v-2017-9.jpg</Image></Images>', CAST(862000000 AS Decimal(18, 0)), CAST(248000000 AS Decimal(18, 0)), N'Crossover', 2, N'Xăng', N'Số Tự Động', 36000, N'Bạc', N'Đen', 3, 2017, 5, N'Một Cầu', 5, N'<Salients><Salient> Điều hòa tự động</Salient><Salient>Đèn chiếu sáng dạng Projector</Salient><Salient>Radio AM/FM</Salient><Salient>HAC - Hệ thống hỗ trợ khởi hành ngang dốc</Salient><Salient>Điều khiển tích hợp trên vô lăng</Salient><Salient>Gương - kính chỉnh điện - gập điện</Salient><Salient>Chìa khóa thông minh - Khởi động bằng nút bấm</Salient><Salient>Cảm biến trước</Salient><Salient>Cảm biến lùi</Salient><Salient>Cruise Control - Ga tự động</Salient><Salient>Chống trơn trượt</Salient><Salient>Phanh tay điện tử</Salient><Salient> Nội thất bọc da</Salient><Salient>Camera hành trình</Salient><Salient>i-stop hệ thống ngắt/ mở động cơ</Salient><Salient>Kính hiển thị tốc độ HUD</Salient></Salients>', CAST(N'2019-05-13 01:47:47.603' AS DateTime), NULL, CAST(N'2019-05-13 01:47:47.603' AS DateTime), NULL, N'Honda CR V 2.0AT 2017', N'Bán Xe Honda CR V 2.0AT 2017 | BaSCars uy tín, chất lượng', 1, 1)
INSERT [dbo].[Car] ([ID], [CategoryID], [Name], [MetaTitle], [SeoTitle], [Image], [MoreImages], [Price], [PrePay], [Model], [Engine], [Fuel], [Gear], [KmTraveled], [CarColor], [InteriorColor], [OriginID], [YearOfManufacture], [Seats], [DriveSystem], [Doors], [SalientFeatures], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Sold], [Status]) VALUES (10006, 8, N'Honda CR V 2.4AT 2015', N'honda-cr-v-2-4at-2015', N'Bán Xe Honda CR V 2.4AT 2015 | Doanh nghiệp uy tín, chất lượng', N'/Data/images/Car/Honda/CR-V/honda-cr-v-2015.jpg', N'<Images><Image>/Data/images/Car/Honda/CR-V/honda-cr-v-2015.jpg</Image><Image>/Data/images/Car/Honda/City/honda-city-2017-3.jpg</Image><Image>/Data/images/Car/Honda/City/honda-city-2017-4.jpg</Image></Images>', CAST(848000000 AS Decimal(18, 0)), CAST(248000000 AS Decimal(18, 0)), N'SUV', 2.4, N'Xăng', N'Số Tự Động', 38000, N'Nâu', N'Đen', 3, 2015, 5, N'Một Cầu', 4, N'<Salients><Salient>Khâu da vô lăng</Salient><Salient>Màn hình giải trí trung tâm</Salient><Salient>Điều khiển tích hợp trên vô lăng</Salient><Salient>Nhớ vị trí ghế</Salient><Salient>Chìa khóa thông minh - Khởi động bằng nút bấm</Salient></Salients>', CAST(N'2019-05-13 01:51:43.517' AS DateTime), NULL, CAST(N'2019-05-13 01:51:43.517' AS DateTime), NULL, N'Honda CR V 2.4AT 2015', N'Bán Xe Honda CR V 2.4AT 2015 | Doanh nghiệp uy tín, chất lượng', 0, 0)
INSERT [dbo].[Car] ([ID], [CategoryID], [Name], [MetaTitle], [SeoTitle], [Image], [MoreImages], [Price], [PrePay], [Model], [Engine], [Fuel], [Gear], [KmTraveled], [CarColor], [InteriorColor], [OriginID], [YearOfManufacture], [Seats], [DriveSystem], [Doors], [SalientFeatures], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Sold], [Status]) VALUES (10007, 4, N'Honda City Top 1.5AT 2017', N'honda-city-top-1-5at-2017', N'Bán Xe Honda City Top 1.5AT 2017 | BaSCars', N'/Data/images/Car/Honda/City/honda-city-2017-1.jpg', N'<Images><Image>/Data/images/Car/Honda/City/honda-city-2017-1.jpg</Image><Image>/Data/images/Car/Honda/City/honda-city-2017-2.jpg</Image><Image>/Data/images/Car/Honda/City/honda-city-2017-3.jpg</Image><Image>/Data/images/Car/Honda/City/honda-city-2017-4.jpg</Image><Image>/Data/images/Car/Honda/City/honda-city-2017-5.jpg</Image><Image>/Data/images/Car/Honda/City/honda-city-2017-6.jpg</Image></Images>', CAST(560000000 AS Decimal(18, 0)), CAST(161000000 AS Decimal(18, 0)), N'Sedan', 1.5, N'Xăng', N'Số Tự Động', 35000, N'Đen', N'Đen', 3, 2017, 5, N'Một Cầu', 4, N'<Salients><Salient>Đèn chiếu sáng dạng Projector</Salient><Salient>Radio AM/FM</Salient></Salients>', CAST(N'2019-05-13 02:38:25.953' AS DateTime), NULL, CAST(N'2019-05-13 02:38:25.953' AS DateTime), NULL, N'Honda City Top 1.5AT 2017', N'Bán Xe Honda City Top 1.5AT 2017 | BaSCars', 1, 1)
INSERT [dbo].[Car] ([ID], [CategoryID], [Name], [MetaTitle], [SeoTitle], [Image], [MoreImages], [Price], [PrePay], [Model], [Engine], [Fuel], [Gear], [KmTraveled], [CarColor], [InteriorColor], [OriginID], [YearOfManufacture], [Seats], [DriveSystem], [Doors], [SalientFeatures], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Sold], [Status]) VALUES (10008, 4, N'Honda City Top 1.5AT 2017', N'honda-city-top-1-5at-2017', N'Bán Xe Honda City Top 1.5AT 2017 | BaSCars', N'/Data/images/Car/Honda/City/honda-city-2017-3.jpg', N'<Images><Image>/Data/images/Car/Honda/City/honda-city-2017-3.jpg</Image><Image>/Data/images/Car/Honda/City/honda-city-2017-1.jpg</Image><Image>/Data/images/Car/Honda/City/honda-city-2017-2.jpg</Image><Image>/Data/images/Car/Honda/City/honda-city-2017-3.jpg</Image><Image>/Data/images/Car/Honda/City/honda-city-2017-7.jpg</Image><Image>/Data/images/Car/Honda/City/honda-city-2017-6.jpg</Image><Image>/Data/images/Car/Honda/City/honda-city-2017-5.jpg</Image></Images>', CAST(575000000 AS Decimal(18, 0)), CAST(165000000 AS Decimal(18, 0)), N'Sedan', 1.5, N'Xăng', N'Số Tự Động', 25000, N'Đen', N'Đen', 3, 2016, 5, N'Một Cầu', 4, N'<Salients><Salient>Hệ thống phân phối lực phanh điện tử EBD</Salient><Salient>HAC - Hệ thống hỗ trợ khởi hành ngang dốc</Salient><Salient>Lazang đúc hợp kim</Salient></Salients>', CAST(N'2019-05-13 03:21:51.787' AS DateTime), NULL, CAST(N'2019-05-13 03:21:51.787' AS DateTime), NULL, N'Honda City Top 1.5AT 2017', N'Bán Xe Honda City Top 1.5AT 2017 | BaSCars', 1, 1)
INSERT [dbo].[Car] ([ID], [CategoryID], [Name], [MetaTitle], [SeoTitle], [Image], [MoreImages], [Price], [PrePay], [Model], [Engine], [Fuel], [Gear], [KmTraveled], [CarColor], [InteriorColor], [OriginID], [YearOfManufacture], [Seats], [DriveSystem], [Doors], [SalientFeatures], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Sold], [Status]) VALUES (10009, 10, N'Toyota Innova E 2.0MT 2013', N'toyota-innova-e-2-0mt-2013', N'Bán Xe Toyota Innova E 2.0MT 2013', N'/Data/images/Car/Toyota/Innova/toyota-innova-2013-1.jpg', N'<Images><Image>/Data/images/Car/Toyota/Innova/toyota-innova-2013-1.jpg</Image><Image>/Data/images/Car/Toyota/Innova/toyota-innova-2013-2.jpg</Image><Image>/Data/images/Car/Toyota/Innova/toyota-innova-2013-3.jpg</Image><Image>/Data/images/Car/Toyota/Innova/toyota-innova-2013-4.jpg</Image><Image>/Data/images/Car/Toyota/Innova/toyota-innova-2013-5.jpg</Image><Image>/Data/images/Car/Toyota/Innova/toyota-innova-2013-6.jpg</Image><Image>/Data/images/Car/Toyota/Innova/toyota-innova-2013-7.jpg</Image><Image>/Data/images/Car/Toyota/Innova/toyota-innova-2013-8.jpg</Image><Image>/Data/images/Car/Toyota/Innova/toyota-innova-2013-9.jpg</Image></Images>', CAST(512000000 AS Decimal(18, 0)), CAST(220000000 AS Decimal(18, 0)), N'MPV', 2, N'Xăng', N'Số Sàn', 69785, N'Bạc', N'Be', 3, 2013, 7, N'Một Cầu', 5, N'<Salients><Salient> Điều hòa tự động</Salient><Salient>Đèn Led daylight</Salient><Salient>Hệ thống phân phối lực phanh điện tử EBD</Salient><Salient>Ghế chỉnh điện</Salient><Salient>Cảm biến trước</Salient><Salient>Cảm biến lùi</Salient><Salient>Phanh ABS</Salient><Salient>Camera lùi</Salient><Salient>i-stop hệ thống ngắt/ mở động cơ</Salient></Salients>', CAST(N'2019-05-13 03:30:30.760' AS DateTime), NULL, CAST(N'2019-05-13 03:30:30.760' AS DateTime), NULL, N'Toyota Innova E 2.0MT 2013', N'Bán Xe Toyota Innova E 2.0MT 2013', 1, 1)
INSERT [dbo].[Car] ([ID], [CategoryID], [Name], [MetaTitle], [SeoTitle], [Image], [MoreImages], [Price], [PrePay], [Model], [Engine], [Fuel], [Gear], [KmTraveled], [CarColor], [InteriorColor], [OriginID], [YearOfManufacture], [Seats], [DriveSystem], [Doors], [SalientFeatures], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Sold], [Status]) VALUES (10010, 10, N'Toyota Innova E 2.0AT 2017', N'toyota-innova-e-2-0at-2017', N'Bán Xe Toyota Innova E 2.0AT 2017 | BaSCars', N'/Data/images/Car/Toyota/Innova/toyota-innova-2017-1.jpg', N'<Images><Image>/Data/images/Car/Toyota/Innova/toyota-innova-2017-1.jpg</Image><Image>/Data/images/Car/Toyota/Innova/toyota-innova-2017-1.jpg</Image></Images>', CAST(700000000 AS Decimal(18, 0)), CAST(250000000 AS Decimal(18, 0)), N'MPV', 2, N'Xăng', N'Số Tự Động', 31000, N'Bạc', N'Nhiều Màu', 3, 2017, 7, N'Một Cầu', 4, N'<Salients><Salient> Điều hòa tự động</Salient><Salient>Khâu da vô lăng</Salient><Salient>Lazang đúc hợp kim</Salient><Salient>Gương - kính chỉnh điện - gập điện</Salient><Salient>Túi khí an toàn</Salient><Salient>Phanh ABS</Salient><Salient> Nội thất bọc da</Salient></Salients>', CAST(N'2019-05-13 03:44:47.137' AS DateTime), NULL, CAST(N'2019-05-13 03:44:47.137' AS DateTime), NULL, N'Toyota Innova E 2.0AT 2017', N'Bán Xe Toyota Innova E 2.0AT 2017 | BaSCars', 0, 1)
INSERT [dbo].[Car] ([ID], [CategoryID], [Name], [MetaTitle], [SeoTitle], [Image], [MoreImages], [Price], [PrePay], [Model], [Engine], [Fuel], [Gear], [KmTraveled], [CarColor], [InteriorColor], [OriginID], [YearOfManufacture], [Seats], [DriveSystem], [Doors], [SalientFeatures], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Sold], [Status]) VALUES (10011, 24, N'Peugeot 508 1.6AT 2015', N'peugeot-508-1-6at-2015', N'Bán Xe Peugeot 508 1.6AT 2015 | BaSCars', N'/Data/images/Car/Peugeot/508/peugeot-2015-1.jpg', N'<Images><Image>/Data/images/Car/Peugeot/508/peugeot-2015-1.jpg</Image><Image>/Data/images/Car/Peugeot/508/peugeot-2015-2.jpg</Image><Image>/Data/images/Car/Peugeot/508/peugeot-2015-3.jpg</Image><Image>/Data/images/Car/Peugeot/508/peugeot-2015-4.jpg</Image><Image>/Data/images/Car/Peugeot/508/peugeot-2015-5.jpg</Image><Image>/Data/images/Car/Peugeot/508/peugeot-2015-6.jpg</Image><Image>/Data/images/Car/Peugeot/508/peugeot-2015-7.jpg</Image><Image>/Data/images/Car/Peugeot/508/peugeot-2015-8.jpg</Image><Image>/Data/images/Car/Peugeot/508/peugeot-2015-9.jpg</Image><Image>/Data/images/Car/Peugeot/508/peugeot-2015-10.jpg</Image></Images>', CAST(982000000 AS Decimal(18, 0)), CAST(365000000 AS Decimal(18, 0)), N'Sedan', 1.6, N'Xăng', N'Số Tự Động', 59000, N'Đen', N'Be', 10016, 2015, 5, N'Một Cầu', 4, N'<Salients><Salient> EPS - Tay lái trợ lực điện</Salient><Salient>Khâu da vô lăng</Salient><Salient>HAC - Hệ thống hỗ trợ khởi hành ngang dốc</Salient><Salient>Lazang đúc hợp kim</Salient><Salient>Nhớ vị trí ghế</Salient><Salient>Chìa khóa thông minh - Khởi động bằng nút bấm</Salient><Salient>Cảm biến lùi</Salient><Salient>Cân bằng điện tử</Salient><Salient>Phanh ABS</Salient><Salient>Camera hành trình</Salient><Salient>Kính hiển thị tốc độ HUD</Salient></Salients>', CAST(N'2019-05-13 03:53:41.937' AS DateTime), NULL, CAST(N'2019-05-13 03:53:41.937' AS DateTime), NULL, N'Peugeot 508 1.6AT 2015', N'Bán Xe Peugeot 508 1.6AT 2015 | BaSCars', 1, 1)
INSERT [dbo].[Car] ([ID], [CategoryID], [Name], [MetaTitle], [SeoTitle], [Image], [MoreImages], [Price], [PrePay], [Model], [Engine], [Fuel], [Gear], [KmTraveled], [CarColor], [InteriorColor], [OriginID], [YearOfManufacture], [Seats], [DriveSystem], [Doors], [SalientFeatures], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Sold], [Status]) VALUES (10012, 18, N'Chevrolet Cruze LTZ 1.8AT 2016', N'chevrolet-cruze-ltz-1-8at-2016', N'Bán Xe Chevrolet Cruze LTZ 1.8AT 2016 | Doanh Nghiệp  Tư Nhân', N'/Data/images/Car/Chevrolet/Cruze/chevrolet-cruze-2016-1.jpg', N'<Images><Image>/Data/images/Car/Chevrolet/Cruze/chevrolet-cruze-2016-1.jpg</Image><Image>/Data/images/Car/Chevrolet/Cruze/chevrolet-cruze-2016-1.jpg</Image></Images>', CAST(765000000 AS Decimal(18, 0)), CAST(311000000 AS Decimal(18, 0)), N'Sedan', 1.8, N'Xăng', N'Số Tự Động', 42000, N'Bạc', N'Nhiều Màu', 3, 2016, 5, N'Một Cầu', 4, N'<Salients><Salient>Đèn chiếu sáng dạng Projector</Salient><Salient>Hệ thống phân phối lực phanh điện tử EBD</Salient><Salient>Chìa khóa thông minh - Khởi động bằng nút bấm</Salient></Salients>', CAST(N'2019-05-13 04:01:07.307' AS DateTime), NULL, CAST(N'2019-05-13 04:01:07.307' AS DateTime), NULL, N'Chevrolet Cruze LTZ 1.8AT 2016', N'Bán Xe Chevrolet Cruze LTZ 1.8AT 2016 | Doanh Nghiệp  Tư Nhân', 1, 1)
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
INSERT [dbo].[CarCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (13, N'Mazda 6', N'mazda-6', 12, 1, N'Mua Bán Xe Maxda cũ, uy tín, chất lượng, giá tốt', CAST(N'2019-05-02 21:39:40.530' AS DateTime), N'admin', CAST(N'2019-05-13 01:38:54.087' AS DateTime), NULL, N'Hãng Xe Mazda Dòng Mazda 6', N'Mua Bán Xe Maxda cũ, uy tín, chất lượng, giá tốt', 1)
INSERT [dbo].[CarCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (14, N'CX5', N'cx5', 12, 3, N'Mua Bán Xe Maxda cũ, uy tín, chất lượng, giá tốt', CAST(N'2019-05-02 21:40:06.117' AS DateTime), N'admin', CAST(N'2019-05-13 03:26:19.443' AS DateTime), NULL, N'Hãng Xe Mazda Dòng CX5', N'Mua Bán Xe Maxda cũ, uy tín, chất lượng, giá tốt', 1)
INSERT [dbo].[CarCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (15, N'CX6', N'cx6', 12, 5, N'Mua Bán Xe Maxda cũ, uy tín, chất lượng, giá tốt', CAST(N'2019-05-02 21:40:30.167' AS DateTime), N'admin', CAST(N'2019-05-13 03:26:15.223' AS DateTime), NULL, N'Hãng Xe Mazda Dòng CX6', N'Mua Bán Xe Maxda cũ, uy tín, chất lượng, giá tốt', 1)
INSERT [dbo].[CarCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (16, N'Chevrolet', N'chevrolet', 0, 4, N'Mua Bán Xe Chevrolet cũ, uy tín, chất lượng, giá tốt', CAST(N'2019-05-02 21:40:58.610' AS DateTime), N'admin', CAST(N'2019-05-02 21:40:58.610' AS DateTime), N'admin', N'Hãng Xe Chevrolet', N'Mua Bán Xe Chevrolet cũ, uy tín, chất lượng, giá tốt', 0)
INSERT [dbo].[CarCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (17, N'Cruze', N'cruze', 16, 1, N'Mua Bán Xe Chevrolet cũ, uy tín, chất lượng, giá tốt', CAST(N'2019-05-02 21:41:57.843' AS DateTime), N'admin', CAST(N'2019-05-02 21:41:57.843' AS DateTime), N'admin', N'Hãng Xe Chevrolet Dòng Cruze', N'Mua Bán Xe Chevrolet cũ, uy tín, chất lượng, giá tốt', 0)
INSERT [dbo].[CarCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (18, N'Colorado', N'colorado', 16, 3, N'Mua Bán Xe Chevrolet cũ, uy tín, chất lượng, giá tốt', CAST(N'2019-05-02 21:42:25.213' AS DateTime), N'admin', CAST(N'2019-05-12 11:19:30.483' AS DateTime), N'admin', N'Hãng Xe Chevrolet Dòng Colorado', N'Mua Bán Xe Chevrolet cũ, uy tín, chất lượng, giá tốt', 1)
INSERT [dbo].[CarCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (19, N'Peugeot', N'peugeot', 0, 5, N'Mua Bán Xe Peugeot cũ, uy tín, chất lượng, giá tốt', CAST(N'2019-05-02 21:43:24.610' AS DateTime), N'admin', CAST(N'2019-05-02 21:43:24.610' AS DateTime), N'admin', N'Hãng Xe Peugeot', N'Mua Bán Xe Peugeot cũ, uy tín, chất lượng, giá tốt', 1)
INSERT [dbo].[CarCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (20, N'Huyndai', N'huyndai', 0, 2, N'Mua bán xe Huyndai cũ, uy tín, giá rẻ, chất lượng tốt', CAST(N'2019-05-02 21:44:31.873' AS DateTime), N'admin', CAST(N'2019-05-02 21:49:47.600' AS DateTime), N'admin', N'Hãng Xe Huyndai', N'Mua bán xe Huyndai cũ, uy tín, giá rẻ, chất lượng tốt', 1)
INSERT [dbo].[CarCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (22, N'Huyndai i10', N'huyndai-i10', 20, 1, N'Bán Xe Huyndai i10', CAST(N'2019-05-13 01:28:41.597' AS DateTime), NULL, CAST(N'2019-05-13 03:25:42.147' AS DateTime), NULL, N'Huyndai i10', N'Bán Xe Huyndai i10', 1)
INSERT [dbo].[CarCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (23, N'Mazda 3', N'mazda-3', 12, 2, N'Mazda 3', CAST(N'2019-05-13 01:39:10.403' AS DateTime), NULL, CAST(N'2019-05-13 03:26:26.060' AS DateTime), NULL, N'Mazda 3', N'Mazda 3', 1)
INSERT [dbo].[CarCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (24, N'Peugeot 508', N'peugeot-508', 19, 4, N'Bán Xe Peugeot 508 uy tín, chất lượng', CAST(N'2019-05-13 03:51:46.397' AS DateTime), NULL, CAST(N'2019-05-13 03:51:46.397' AS DateTime), NULL, N'Peugeot 508', N'Bán Xe Peugeot 508 uy tín, chất lượng', 1)
SET IDENTITY_INSERT [dbo].[CarCategory] OFF
SET IDENTITY_INSERT [dbo].[CarPart] ON 

INSERT [dbo].[CarPart] ([ID], [Name], [Code], [MetaTitle], [SeoTitle], [Description], [Image], [Price], [PromotionPrice], [Quantity], [CategoryID], [Warranty], [OriginID], [ManufacturerID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (3, N'Máy rửa xe máy áp lực cao Jetta 1,8KW', N'P-JET-1800', N'may-rua-xe-may-ap-luc-cao-jetta-1-8kw', N'Bán Máy rửa xe máy áp lực cao Jetta 1,8KW | Thiết bị rửa xe ô tô', N'<p><u><strong>TH&Ocirc;NG SỐ KỸ THUẬT:&nbsp;</strong></u></p>

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
', N'/Data/images/CarPart/CarWashEquipment/JETTA/JET1800.jpg', CAST(8240000 AS Decimal(18, 0)), CAST(5000000 AS Decimal(18, 0)), 100, 19, 12, 4, 12, CAST(N'2019-05-03 17:55:35.823' AS DateTime), N'admin', CAST(N'2019-05-03 23:52:57.637' AS DateTime), N'admin', N'Máy rửa xe máy áp lực cao Jetta 1,8KW', N'Bán Máy rửa xe máy áp lực cao Jetta 1,8KW | Thiết bị rửa xe ô tô', 1)
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
INSERT [dbo].[CarPart] ([ID], [Name], [Code], [MetaTitle], [SeoTitle], [Description], [Image], [Price], [PromotionPrice], [Quantity], [CategoryID], [Warranty], [OriginID], [ManufacturerID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (7, N'Bộ gioăng đại tu mazda 3 1.5', N'P-BG-MAZDA', N'bo-gioang-dai-tu-mazda-3-1-5', N'Bán Bộ gioăng đại tu mazda 3 1.5| Phụ Tùng ÔTô', N'<p><span style="font-size:16px"><span style="font-family:Arial,Helvetica,sans-serif"><strong><u>TH&Ocirc;NG TIN KỸ THUẬT:</u></strong></span></span></p>

<ol>
	<li><span style="font-size:16px"><span style="font-family:Arial,Helvetica,sans-serif"><strong>T&ecirc;n h&agrave;ng:</strong> Bộ gioăng đại tu</span></span></li>
	<li><span style="font-size:16px"><span style="font-family:Arial,Helvetica,sans-serif"><strong>M&atilde; SP:</strong>&nbsp;8LAD10271A</span></span></li>
	<li><span style="font-size:16px"><span style="font-family:Arial,Helvetica,sans-serif"><strong>Model:</strong> Mazda 3 1.5 2015 -2017</span></span></li>
	<li><span style="font-size:16px"><span style="font-family:Arial,Helvetica,sans-serif"><strong>Xuất sứ:</strong> Th&aacute;i Lan</span></span></li>
	<li><span style="font-family:Arial,Helvetica,sans-serif"><span style="font-size:16px"><strong>Nguồn gốc:&nbsp;</strong>Ch&iacute;nh H&atilde;ng</span></span></li>
	<li><span style="font-size:16px"><span style="font-family:Arial,Helvetica,sans-serif"><strong>Chất liệu:</strong> Cao cấp</span></span></li>
</ol>

<p><span style="font-size:16px"><span style="font-family:Arial,Helvetica,sans-serif">Bộ gioăng đại tu Mazda 3 d&ugrave;ng để duy tu bả dưỡng m&aacute;y. Chất lượng cao, bền bỷ gi&aacute; cả hợp l&yacute;.</span></span></p>
', N'/Data/images/CarPart/OtherCarPart/phutung-mazda.jpg', CAST(1400000 AS Decimal(18, 0)), CAST(-1 AS Decimal(18, 0)), 99, 17, 6, 1, 15, CAST(N'2019-05-03 23:25:59.780' AS DateTime), N'admin', CAST(N'2019-05-03 23:30:29.220' AS DateTime), N'admin', N'Bộ gioăng đại tu Mazda3 1.5', N'Bán Bộ gioăng đại tu mazda 3 1.5| Phụ Tùng ÔTô', 1)
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
', N'/Data/images/CarPart/LiftingBridge/APillar/Asaki-AK038.jpg', CAST(1650000 AS Decimal(18, 0)), CAST(-1 AS Decimal(18, 0)), 37, 16, 6, 7, 17, CAST(N'2019-05-03 23:42:27.107' AS DateTime), N'admin', CAST(N'2019-05-04 00:20:18.670' AS DateTime), N'admin', N'Kích cá sấu Asaki AK-038', N'Bán Kích cá sấu Asaki AK-038 | Cầu Nâng', 1)
INSERT [dbo].[CarPart] ([ID], [Name], [Code], [MetaTitle], [SeoTitle], [Description], [Image], [Price], [PromotionPrice], [Quantity], [CategoryID], [Warranty], [OriginID], [ManufacturerID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (15, N'Cầu nâng chuyên dụng rửa xe ô tô Titan TA-4000', N'P-TA-4000', N'cau-nang-chuyen-dung-rua-xe-o-to-titan-ta-4000', N'Bán Cầu nâng chuyên dụng rửa xe ô tô Titan TA-4000 | Cầu Nâng', N'<p><strong><u>TH&Ocirc;NG SỐ KỸ THUẬT:</u></strong></p>

<ol>
	<li>H&atilde;ng Sản Xuất: TITAN</li>
	<li>Loại: Cầu N&acirc;ng Một Trụ</li>
	<li>C&ocirc;ng Suất Motor: 2.2Kw</li>
	<li>Sức N&acirc;ng (kg): 4000</li>
	<li>Chiều Cao N&acirc;ng Tối Đa (mm): 1740</li>
	<li>Xuất Sứ: Asian&nbsp;</li>
</ol>

<p>&nbsp;</p>
', N'/Data/images/CarPart/LiftingBridge/APillar/titan-ta-4000.jpg', CAST(65900000 AS Decimal(18, 0)), CAST(-1 AS Decimal(18, 0)), 5, 16, 12, 1, 1, CAST(N'2019-05-04 01:23:06.880' AS DateTime), N'admin', CAST(N'2019-05-04 01:23:06.880' AS DateTime), N'admin', N'Cầu nâng chuyên dụng rửa xe ô tô Titan TA-4000', N'Bán Cầu nâng chuyên dụng rửa xe ô tô Titan TA-4000 | Cầu Nâng', 1)
INSERT [dbo].[CarPart] ([ID], [Name], [Code], [MetaTitle], [SeoTitle], [Description], [Image], [Price], [PromotionPrice], [Quantity], [CategoryID], [Warranty], [OriginID], [ManufacturerID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (16, N'BI MAY Ơ TRƯỚC MAZDA CX-5 CHÍNH HÃNG', N'KD353304XC', N'bi-may-o-truoc-mazda-cx-5-chinh-hang', N'Bán BI MAY Ơ TRƯỚC MAZDA CX-5 | Phụ Tùng Mazda', N'<p><span style="font-size:16px"><strong><u>GIỚI THIỆU SẢN PHẨM:</u></strong></span></p>

<p><span style="font-size:16px">Bi May Ơ Trước KD353304XC ch&iacute;nh h&atilde;ng, sử dụng tr&ecirc;n c&aacute;c d&ograve;ng xe Mazda CX-5 2012-2015, Mazda CX-5 2016, sản xuất bởi MAZDA Nhật Bản</span></p>

<p><span style="font-size:16px"><strong><u>MỘT SỐ H&Igrave;NH ẢNH CỦA SẢN PHẨM:</u></strong></span></p>

<p><span style="font-size:16px"><input alt="" src="/Data/images/CarPart/OtherCarPart/bi-may-o-truoc-3.jpg" style="width: 420px; height: 280px;" type="image" /></span></p>

<p><span style="font-size:16px"><input alt="" src="/Data/images/CarPart/OtherCarPart/bi-may-o-truoc-2.jpg" style="width: 420px; height: 280px;" type="image" /></span></p>

<p><span style="font-size:16px"><input alt="" src="/Data/images/CarPart/OtherCarPart/bi-may-o-truoc-1.jpg" style="width: 420px; height: 280px;" type="image" /></span></p>
', N'/Data/images/CarPart/OtherCarPart/bi-may-o-truoc-5.jpg', CAST(1200000 AS Decimal(18, 0)), CAST(-1 AS Decimal(18, 0)), 18, 17, 12, 7, 1, CAST(N'2019-05-05 01:47:15.383' AS DateTime), N'admin', CAST(N'2019-05-05 01:52:14.037' AS DateTime), N'admin', N'BI MAY Ơ TRƯỚC MAZDA CX-5', N'Bán BI MAY Ơ TRƯỚC MAZDA CX-5 | Phụ Tùng Mazda', 1)
INSERT [dbo].[CarPart] ([ID], [Name], [Code], [MetaTitle], [SeoTitle], [Description], [Image], [Price], [PromotionPrice], [Quantity], [CategoryID], [Warranty], [OriginID], [ManufacturerID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (10026, N'Chân máy thủy lực Honda City 2015 (Chân máy dầu)', N'CMPT-152', N'chan-may-thuy-luc-honda-city-2015-(chan-may-dau)', N'Bán Chân máy thủy lực Honda City 2015 | Phụ Tùng Ô Tô', N'<p><strong>Ch&acirc;n m&aacute;y &ocirc; t&ocirc; l&agrave; bộ phận quan trọng của xe c&oacute; nhiệm vụ&nbsp;li&ecirc;n kết giữa động cơ với khung xe, ch&acirc;n m&aacute;y thường được l&agrave;m bằng kim loại hoặc cao su c&oacute; thể chống chịu lực v&agrave; hấp thụ l&agrave;m giảm độ rung khi động cơ vận h&agrave;nh. Tuy nhi&ecirc;n, theo thời gian sử dụng ch&acirc;n m&aacute;y c&oacute; thể bị hao m&ograve;n v&agrave; hỏng h&oacute;c với c&aacute;c triệu chứng sau:</strong></p>

<p><strong>1. Khởi động xe ph&aacute;t ra tiếng ồn</strong></p>

<p>Một trong những triệu chứng phổ biến nhất li&ecirc;n quan đến ch&acirc;n m&aacute;y l&agrave; tiếng ồn đến từ khoang động cơ. Ch&acirc;n m&aacute;y bị m&ograve;n hoặc hư hỏng c&oacute; thể g&acirc;y ra tiếng va chạm, tiếng đập mạnh v&agrave; c&aacute;c loại &acirc;m thanh kh&aacute;c do động cơ dịch chuyển qu&aacute; mức tới c&aacute;c điểm tiếp x&uacute;c.</p>

<p><strong>2. Lực rung qu&aacute; mức</strong></p>

<p>Một triệu chứng kh&aacute;c khi ch&acirc;n m&aacute;y động cơ gặp vấn đề l&agrave; rung động qu&aacute; mức. Nếu cao su hoặc c&aacute;c bộ phận giảm x&oacute;c của ch&acirc;n m&aacute;y bị m&ograve;n hay hư hỏng, khả năng hấp thụ rung từ động cơ sẽ bị giảm đi đ&aacute;ng kể. Độ rung của động cơ sẽ khiến to&agrave;n bộ chiếc xe rung l&ecirc;n, người ngồi trong xe sẽ cảm thấy kh&ocirc;ng thoải m&aacute;i.</p>

<p><strong>3. Động cơ dịch chuyển</strong></p>

<p>Nếu ch&acirc;n m&aacute;y bị hỏng, động cơ cũng thường kh&ocirc;ng c&ograve;n nằm tại vị tr&iacute; cố định. Bởi ch&acirc;n m&aacute;y c&oacute; nhiệm vụ giữ chắc chắn phần động cơ trong khoang động cơ. Nếu ch&acirc;n m&aacute;y bị hỏng kh&ocirc;ng thể l&agrave;m việc b&igrave;nh thường, động cơ sẽ thường c&oacute; xu hướng dịch chuyển, c&oacute; thể l&agrave; ra ph&iacute;a sau, ph&iacute;a trước hoặc 1 trong 2 b&ecirc;n&hellip;</p>

<p>C&oacute; thể cảm nhận được sự di chuyển n&agrave;y khi xe tăng tốc đột ngột, đồng thời cũng c&oacute; tiếng ồn ph&aacute;t ra. Việc động cơ bị di chuyển sẽ &nbsp;ảnh hưởng rất nhiều đến c&aacute;c bộ phận kh&aacute;c trong khoang động cơ.</p>

<p><em>T&oacute;m lại</em>&nbsp;để tạo cảm gi&aacute;c thỏa m&aacute;i m&agrave; an to&agrave;n khi đi xe người sử dụng xe l&ecirc;n thường xuy&ecirc;n kiểm tra hoặc bảo dưỡng xe. Đặc biệt n&ecirc;n thay&nbsp;khi xảy ra 1 trong 3 trường hợp tr&ecirc;n.</p>

<p><br />
&nbsp;</p>

<p>Chuy&ecirc;n cung cấp &quot;<strong><em>Ch&acirc;n m&aacute;y thủy lực Honda City 2015</em></strong>&quot; h&agrave;ng xịn, ch&iacute;nh h&atilde;ng gi&aacute; tốt nhất, thuộc loại&nbsp;&nbsp;nhập khẩu ch&iacute;nh h&atilde;ng, ph&acirc;n phối to&agrave;n quốc, uy t&iacute;n, cam kết chất lượng.&nbsp;<br />
<strong>HOTLINE: 0913.50.54.55</strong>&nbsp;</p>

<p>Ch&uacute;ng t&ocirc;i đề nghị sử dụng &quot;Ch&acirc;n m&aacute;y thủy lực Honda City 2015&quot; đảm bảo chất lượng để c&oacute; được đầy đủ lợi &iacute;ch từ hoạt động tin cậy tuyệt đối của xe. Sử dụng phụ t&ugrave;ng kh&ocirc;ng ch&iacute;nh h&atilde;ng hoặc giả mạo đ&ocirc;i khi c&oacute; thể g&acirc;y ra những hậu quả đ&aacute;ng tiếc.</p>

<ul>
</ul>
', N'/Data/images/CarPart/OtherCarPart/chan-may-thuy-luc-honda.png', CAST(2300000 AS Decimal(18, 0)), CAST(1700000 AS Decimal(18, 0)), 50, 17, 12, 1, 1, CAST(N'2019-05-13 04:14:57.010' AS DateTime), NULL, CAST(N'2019-05-13 04:14:57.010' AS DateTime), NULL, N'Chân máy thủy lực Honda City 2015', N'Bán Chân máy thủy lực Honda City 2015 | Phụ Tùng Ô Tô', 1)
INSERT [dbo].[CarPart] ([ID], [Name], [Code], [MetaTitle], [SeoTitle], [Description], [Image], [Price], [PromotionPrice], [Quantity], [CategoryID], [Warranty], [OriginID], [ManufacturerID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (10027, N'Dầu trợ lực lái Meyle ZHM - Synt', N'ZHM-1080', N'dau-tro-luc-lai-meyle-zhm---synt', N'Bán Dầu trợ lực lái Meyle ZHM - Synt | Phụ Tùng', N'<p><input alt="" src="/Data/images/CarPart/Lubrican/daunhottroluc-2.jpg" style="height:1000px; width:814px" type="image" /></p>

<p><input alt="" src="/Data/images/CarPart/Lubrican/daunhottroluc-3.jpg" style="height:1000px; width:691px" type="image" /></p>

<p><strong>Dầu trợ lực l&aacute;i ch&iacute;nh h&atilde;ng Meyle ZHM - Synt</strong></p>

<p>Dầu trợ lực l&aacute;i Meyle ZHM - Synt l&agrave; sản phẩm dầu c&oacute; m&agrave;u xanh l&aacute; c&acirc;y, được sản xuất bởi h&atilde;ng Meyle v&agrave; được nhập khẩu bởi C&ocirc;ng ty CPTM &ocirc; t&ocirc; Kachi (c&oacute; địa chỉ webside www.autohaus.vn).</p>

<p>Dầu trợ lực l&aacute;i Meyle ZHM - Synt sử dụng cho c&aacute;c hệ thống trợ lực tay l&aacute;i, gi&uacute;p cho việc điều khiển xe được dễ d&agrave;ng hơn rất nhiều v&agrave; k&eacute;o d&agrave;i tuổi thọ hộp số. Dầu trợ lực l&aacute;i Meyle ZHM - Synt thường được sử dụng cho c&aacute;c d&ograve;ng xe cao cấp như Mercedes &ndash;Benz; BMW&hellip;</p>

<p>Th&ocirc;ng tin chung:</p>

<ul>
	<li>T&ecirc;n sản phẩm: Dầu trợ lực l&aacute;i Meyle ZHM - Synt</li>
	<li>Xuất xứ: Made in Germany</li>
	<li>Nhập khẩu bởi: C&ocirc;ng ty CPTM &ocirc; t&ocirc; Kachi (autohaus.vn)</li>
	<li>Đ&oacute;ng g&oacute;i: Can nhựa 1 l&iacute;t</li>
	<li>Gi&aacute; b&aacute;n lẻ (đ&atilde; bao gồm VAT): 440.000 VNĐ</li>
</ul>

<p>Lưu &yacute;: Hiện nay tr&ecirc;n thị trường xuất hiện rất nhiều h&agrave;ng tr&ocirc;i nổi k&eacute;m chất lượng với gi&aacute; b&aacute;n rẻ. Để đảm bảo cho chiếc xế y&ecirc;u của bạn hoạt động đạt hiệu suất cao v&agrave; bền bỉ, ch&uacute;ng t&ocirc;i khuy&ecirc;n c&aacute;c bạn n&ecirc;n sử dụng những sản phẩm ch&iacute;nh h&atilde;ng c&oacute; nguồn gốc xuất xứ r&otilde; r&agrave;ng. Tất cả c&aacute;c sản phẩm của www.autohaus.vn b&aacute;n ra đều đ&aacute;p ứng được những y&ecirc;u cầu khắt khe nhất của kh&aacute;ch h&agrave;ng với chi ph&iacute; hợp l&yacute;. Rất mong nhận được sự ủng hộ của qu&yacute; kh&aacute;ch h&agrave;ng với những sản phẩm của C&ocirc;ng ty ch&uacute;ng t&ocirc;i.</p>
', N'/Data/images/CarPart/Lubrican/daunhottroluc-1.jpg', CAST(440000 AS Decimal(18, 0)), CAST(-1 AS Decimal(18, 0)), 200, 14, 0, 1, 18, CAST(N'2019-05-13 04:21:46.570' AS DateTime), NULL, CAST(N'2019-05-13 04:23:00.547' AS DateTime), NULL, N'Dầu trợ lực lái Meyle ZHM - Synt', N'Bán Dầu trợ lực lái Meyle ZHM - Synt | Phụ Tùng', 1)
INSERT [dbo].[CarPart] ([ID], [Name], [Code], [MetaTitle], [SeoTitle], [Description], [Image], [Price], [PromotionPrice], [Quantity], [CategoryID], [Warranty], [OriginID], [ManufacturerID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (10028, N'Danh sách nơi bán Nhớt thủy lực Vector VG 46 - 200L cập nhật mới nhất 2019', N'DNVVG46', N'danh-sach-noi-ban-nhot-thuy-luc-vector-vg-46---200l-cap-nhat-moi-nhat-2019', N'Bán Nhớt thủy lực Vector VG 46 - 200L  | Phụ Tùng', N'<h4>Chi tiết sản phẩm :&nbsp;<em>Dầu thủy lực VECTOR HYDRAULIC VG 46 - 18L</em></h4>

<p>Dầu thủy lực VECTOR HYDRAULIC VG 46: Được sản xuất từ c&aacute;c lọai dầu kho&aacute;ng tinh chế c&ugrave;ng c&aacute;c loại phụ gia nhập khẩu cao cấp, được sử dụng cho c&aacute;c thiết bị thủy lực đ&ograve;i hỏi t&iacute;nh năng chống &ocirc;-xi h&oacute;a v&agrave; chống m&agrave;i m&ograve;n tốt. Cũng th&iacute;ch hợp với những ứng dụng kh&aacute;c như b&ocirc;i trơn c&aacute;c b&aacute;nh răng chịu tải nhẹ v&agrave; hệ thống tuần ho&agrave;n cần loại dầu nhờn c&oacute; t&iacute;nh chống rỉ v&agrave; chống &ocirc;-xi h&oacute;a.&nbsp;<br />
C&ocirc;ng dụng:<br />
Mức độ m&agrave;i m&ograve;n thấp, k&eacute;o d&agrave;i tuổi thọ c&aacute;c chi tiết của hệ thống thủy lực.<br />
Độ bền h&oacute;a học cao, ngăn ngừa cặn b&ugrave;n v&agrave; cặn nhựa trong hệ thống, giảm thời gian dừng m&aacute;y, k&eacute;o d&agrave;i thời gian sử dụng dầu.<br />
Khả năng lọc tốt, kh&ocirc;ng l&agrave;m tắc nghẽn bộ lọc tinh khi c&oacute; nước lẫn v&agrave;o dầu, gi&uacute;p hệ thống thủy lực hoạt động ổn định.<br />
<br />
Bảo quản: Tr&aacute;nh lửa hoặc những chất dễ ch&aacute;y. Đặt đứng trong nh&agrave; kho c&oacute; m&aacute;i che.<br />
An to&agrave;n: Hạn chế tiếp x&uacute;c trực tiếp trong thời gian d&agrave;i, đặc biệt l&agrave; dầu đ&atilde; qua sử dụng.<br />
Bảo vệ m&ocirc;i trường: thải bỏ dầu đ&atilde; qua sử dụng đ&uacute;ng quy định</p>

<p>Qui c&aacute;ch: 18L</p>

<p><em><strong>Dầu thủy lực</strong></em>&nbsp;l&agrave; loại&nbsp;<a href="https://www.vatgia.com/5390/dau-nhot-dung-dich-bao-duong.html" target="_blank"><strong>dầu nhớt</strong></a>&nbsp;chuy&ecirc;n dụng cho c&aacute;c hệ thống thủy lực ch&uacute;ng được pha chế theo c&ocirc;ng nghệ độc đ&aacute;o rất ưu viết bởi dầu gốc cao cấp kết hợp với hệ phụ gia đa năng c&oacute; t&aacute;c dụng truyền tải năng lượng. Ngo&agrave;i ra&nbsp;<em><strong>dầu thủy lực</strong></em><strong>&nbsp;</strong>c&ograve;n c&oacute; t&aacute;c dụng b&ocirc;i trơn l&agrave;m giảm ma s&aacute;t gi&uacute;p cho sự chuyển động giữa c&aacute;c th&agrave;nh phần được trơn tru, hiệu quả hơn. Khi sử dụng&nbsp;<strong>dầu thủy lực</strong>&nbsp;người ti&ecirc;u d&ugrave;ng cần xem x&eacute;t c&aacute;c yếu tố sau: Thời tiết ở nơi thiết bị được sử dụng, c&aacute;c điều kiện sử dụng của bộ phận thủy lực trong hệ thống truyền động v&agrave; độ nhớt của&nbsp;<em>dầu thủy lực</em>, gi&uacute;p b&ocirc;i trơn hệ thống thủy lực, l&agrave;m m&aacute;t, chống ăn m&ograve;n, chống gỉ c&aacute;c chi tiết của m&aacute;y m&oacute;c để đảm bảo m&aacute;y m&oacute;c hoạt động ch&iacute;nh x&aacute;c v&agrave; ổn định.</p>

<p>Hoạt động của nhiều m&aacute;y m&oacute;c c&ocirc;ng nghiệp được điều khiển bởi hệ thống thủy lực (hydraulic system), một hệ thống sử dụng chất lỏng để truyền &aacute;p lực. Th&ocirc;ng thường, dầu b&ocirc;i trơn v&agrave; đ&ocirc;i khi nước được sử dụng để truyền &aacute;p suất. Dầu b&ocirc;i trơn kh&ocirc;ng chỉ c&oacute; t&aacute;c dụng truyền &aacute;p suất v&agrave; điều khiển d&ograve;ng chảy m&agrave; c&ograve;n tối thiểu h&oacute;a lực ma s&aacute;t v&agrave; sự m&agrave;i m&ograve;n của những phần chuyển động v&agrave; bảo vệ bề mặt kim loại kh&ocirc;ng bị rỉ s&eacute;t.</p>

<p>Th&agrave;nh phần lớn nhất của&nbsp;<strong>dầu thủy lực</strong>&nbsp;l&agrave; dầu kho&aacute;ng được th&ecirc;m phụ gia để đạt một số ti&ecirc;u chuẩn đặc biệt. Dầu thủy lực chống m&agrave;i m&ograve;n (Antiwear hydraulic fluid) l&agrave; lượng&nbsp;<strong>dầu thủy lực</strong>&nbsp;lớn nhất được sử dụng, chiếm khoảng 80%. Mặt kh&aacute;c, nhu cầu cho dầu chống ch&aacute;y (fire-resistant fluid) chỉ khoảng 5% tổng thị trường dầu c&ocirc;ng nghiệp. Dầu chống ch&aacute;y được ph&acirc;n loại th&agrave;nh dầu nền nước (high water-basefluid), nhũ tương nước trong dầu, glycol v&agrave; phosphate ester.</p>
', N'/Data/images/CarPart/Lubrican/vectorakara.jpg', CAST(8800000 AS Decimal(18, 0)), CAST(8100000 AS Decimal(18, 0)), 50, 14, 0, 10018, 19, CAST(N'2019-05-13 04:26:17.980' AS DateTime), NULL, CAST(N'2019-05-13 04:26:17.980' AS DateTime), NULL, N'Nhớt thủy lực Vector VG 46 - 200L ', N'Bán Nhớt thủy lực Vector VG 46 - 200L  | Phụ Tùng', 1)
SET IDENTITY_INSERT [dbo].[CarPart] OFF
SET IDENTITY_INSERT [dbo].[CarPartCategory] ON 

INSERT [dbo].[CarPartCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (1, N'Phụ Tùng Ô Tô', N'phu-tung-o-to', 0, 4, N'Bán phụ tùng ô tô ', CAST(N'2019-04-15 03:48:34.800' AS DateTime), N'admin', CAST(N'2019-05-03 17:35:45.890' AS DateTime), N'admin', N'Phụ Tùng Khác', N'Bán phụ tùng ô tô ', 1)
INSERT [dbo].[CarPartCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (2, N'Cầu Nâng', N'cau-nang', 0, 3, N'Bán Cầu Nâng Xe ÔTô tốt, giá rẻ, uy tín', CAST(N'2019-04-15 04:01:26.087' AS DateTime), N'admin', CAST(N'2019-05-03 17:24:59.870' AS DateTime), N'admin', N'Cầu Nâng Xe ÔTô', N'Bán Cầu Nâng Xe ÔTô tốt, giá rẻ, uy tín', 1)
INSERT [dbo].[CarPartCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (6, N'Dầu Nhớt', N'dau-nhot', 0, 2, N'Bán dầu nhớt xe ôtô', CAST(N'2019-04-15 16:28:41.137' AS DateTime), N'admin', CAST(N'2019-05-03 17:24:03.467' AS DateTime), N'admin', N'Dầu Nhớt Xe ÔTô', N'Bán dầu nhớt xe ôtô', 1)
INSERT [dbo].[CarPartCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (9, N'Lốp Xe Ô Tô', N'lop-xe-o-to', 0, 6, N'Bán lốp xe ô tô tốt, giá rẻ, hàng chất lượng', CAST(N'2019-05-01 10:55:00.337' AS DateTime), N'admin', CAST(N'2019-05-09 16:47:03.617' AS DateTime), N'admin', N'Lốp Xe Ô Tô', N'Bán lốp xe ô tô tốt, giá rẻ, hàng chất lượng', 1)
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
INSERT [dbo].[CarPartCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (20, N'Tất Cả Phụ Tùng', N'tat-ca-phu-tung', 0, 1, N'Phụ Tùng BaSCars | Buy And Sell Cars', CAST(N'2019-05-09 16:47:45.753' AS DateTime), N'admin', CAST(N'2019-05-09 16:47:45.753' AS DateTime), N'admin', N'Phụ Tùng', N'Phụ Tùng BaSCars | Buy And Sell Cars', 1)
SET IDENTITY_INSERT [dbo].[CarPartCategory] OFF
SET IDENTITY_INSERT [dbo].[Content] ON 

INSERT [dbo].[Content] ([ID], [Name], [MetaTitle], [Image], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [Tags]) VALUES (45, N'Cấu tạo và chức năng của van hằng nhiệt trên động cơ', N'cau-tao-va-chuc-nang-cua-van-hang-nhiet-tren-dong-co', N'/Data/images/News/anh-van-hang-nhiet-trong-he-thong-lam-mat.JPG', 13, N'<p><a href="https://phutungotottc.com/search/?category=&amp;key=van+hang+nhiet">V</a>an hằng nhiệt&nbsp;(c&ograve;n gọi l&agrave; van nhiệt, tiếng Anh l&agrave; Thermostats) l&agrave; bộ phận rất quan trọng trong&nbsp;hệ thống l&agrave;m m&aacute;t động cơ.</p>

<p><input alt="" src="/Data/images/News/anh-van-hang-nhiet-trong-he-thong-lam-mat.JPG" style="height:400px; width:600px" type="image" /></p>

<p><strong>Nhiệm vụ của van nhiệt:</strong></p>

<p>Chức năng nhiệm vụ của van nhiệt rất r&otilde; r&agrave;ng trong hệ thống l&agrave;m m&aacute;t, n&oacute; đ&oacute;ng đường nước hoặc dầu đến k&eacute;t l&agrave;m m&aacute;t l&agrave;m m&aacute;t khi nhiệt độ của hệ thống c&ograve;n thấp dưới mức quy định v&agrave; mở van cho nước hoặc đầu qua két l&agrave;m m&aacute;t khi nhiệt độ hệ thống cao hơn mức quy định. Nhờ đ&oacute; l&agrave;m cho&nbsp;hệ thống động cơ&nbsp;c&oacute; thể khởi động nhanh ch&oacute;ng tăng l&ecirc;n tới nhiệt độ l&agrave;m việc, ổn định nhiệt độ , đảm bảo t&iacute;nh kinh tế v&agrave; tr&aacute;nh g&acirc;y &ocirc; nhiễm m&ocirc;i trường ở giai đoạn đầu động cơ l&agrave;m việc.</p>

<p><strong>T&igrave;m hiểu về cấu tạo v&agrave; nguy&ecirc;n l&yacute; l&agrave;m việc</strong></p>

<p>- Sơ đồ cấu tạo như h&igrave;nh b&ecirc;n dưới:</p>

<p><input alt="" src="/Data/images/News/van-hang-nhiet-thuong-bi-hong-sau-qua-trinh-van-hanh.jpg" style="height:396px; width:480px" type="image" /></p>

<p><em>Ảnh: Cấu tạo của van hằng nhiệt</em></p>

<p>+ Van được lắp tr&ecirc;n đường dẫn nước từ nắp m&aacute;y ra k&eacute;t l&agrave;m m&aacute;t&nbsp;</p>

<p>+ M&ocirc;i chất c&ocirc;ng t&aacute;c l&agrave; hạt paraphin rắn chứa trong xi lanh của van.</p>

<p>+ Tr&ecirc;n xi lanh c&oacute; gắn c&aacute;nh van, l&ograve; xo hồi vị lu&ocirc;n &eacute;p van đ&oacute;ng.&nbsp;</p>

<p>- Nguy&ecirc;n l&yacute; l&agrave;m việc như sau: khi nước ở nhiệt độ thấp (khoảng dưới 80 độ C, l&ograve; xo hồi vị đẩy xi lanh mang c&aacute;nh van đi l&ecirc;n l&agrave;m van đ&oacute;ng, nước l&agrave;m m&aacute;t kh&ocirc;ng qua van hằng nhiệt tới&nbsp;<a href="https://phutungotottc.com/search/?category=&amp;key=ket+nuoc">k&eacute;t nước l&agrave;m m&aacute;t.</a>&nbsp;Khi nhiệt độ động cơ đạt nhiệt độ l&agrave;m việc (khoảng 80 - 90 độc C), Parapin gi&atilde;n nở thắng sức cản l&ograve; xo đẩy xi lanh xuống l&agrave;m mở van v&agrave; mở th&ocirc;ng đường nước từ động cơ ra k&eacute;t l&agrave;m m&aacute;t</p>

<p><strong>Những hư hỏng, kiểm tra, sửa chữa</strong></p>

<p>- Thường th&igrave; van nhiệt sẽ bị hỏng khi độ đ&agrave;n hồi th&acirc;n van v&agrave; cơ cấu c&aacute;nh van l&agrave;m việc k&eacute;m, do c&aacute;c chất chứa trong th&acirc;n van bị r&ograve; rỉ dẫn đến hiện tượng van kh&ocirc;ng mở hoặc mở kh&ocirc;ng đủ g&acirc;y n&oacute;ng m&aacute;y khi động cơ l&agrave;m việc với c&ocirc;ng suất lớn, c&oacute; trường hợp van kh&ocirc;ng đ&oacute;ng khi nhiệt độ nước c&ograve;n thấp khiến động cơ chạy l&acirc;u mới đạt nhiệt độ l&agrave;m việc, l&agrave;m tăng &ocirc; nhiễm m&ocirc;i trường v&agrave; ti&ecirc;u hao nhiều nhi&ecirc;n liệu.</p>

<p>- Khi van hằng nhiệt bị hỏng, n&oacute; sẽ ngăn nước l&agrave;m m&aacute;t lưu th&ocirc;ng trong to&agrave;n bộ hệ thống ở nhiệt độ l&agrave;m việc của động cơ bởi n&oacute; lu&ocirc;n đ&oacute;ng lại hoặc kh&ocirc;ng thể ngăn nước l&agrave;m m&aacute;t lưu th&ocirc;ng qua k&eacute;t nước do kh&ocirc;ng thể tự đ&oacute;ng lại khiến động cơ l&agrave;m việc ở nhiệt độ thấp l&acirc;u qu&aacute; mức cần thiết. Nếu van hằng nhiệt kh&ocirc;ng mở ra n&oacute; sẽ l&agrave;m cho nước m&aacute;t chỉ lưu th&ocirc;ng trong động cơ, g&acirc;y ra một số hư hỏng trong hệ thống (<strong>đ&egrave;n check động cơ sẽ s&aacute;ng l&ecirc;n</strong>).</p>

<p>- Khi van hằng nhiệt bị kẹt n&oacute; khiến cho động cơ n&oacute;ng l&ecirc;n rất nhanh, th&ocirc;ng thường chỉ sau khoảng từ 5 đến 15 ph&uacute;t sau khi chạy. H&atilde;y kiểm tra c&aacute;c nguy&ecirc;n nh&acirc;n hư hỏng kh&aacute;c như r&ograve; rỉ nước m&aacute;t v&agrave; th&aacute;o van hằng nhiệt (thường ở cuối ống dẫn nước từ k&eacute;t v&agrave;o động cơ) nếu kh&ocirc;ng chắc chắn vị tr&iacute; của van th&igrave; h&atilde;y tham khảo sổ tay sửa chữa đi k&egrave;m.</p>

<p>Khi đ&atilde; th&aacute;o van hằng nhiệt ra, h&atilde;y kiểm tra t&igrave;nh trạng th&acirc;n van, kiểm tra c&aacute;c vết nứt hay gẫy v&agrave; kiểm tra xem n&oacute; đ&atilde; đ&oacute;ng ho&agrave;n to&agrave;n chưa. Nếu van n&agrave;y vẫn mở th&igrave; chứng tỏ van đ&atilde; bị hỏng v&agrave; cần thay thế. Để kiểm tra khả năng l&agrave;m việc của van hằng nhiệt, h&atilde;y chuẩn bị một ca nước đủ rộng v&agrave; s&acirc;u để đựng vừa van, một bếp đun.</p>

<p><strong>Quy tr&igrave;nh kiểm tra:</strong></p>

<p>Để kiểm tra một van hằng nhiệt cần phải th&aacute;o cụm van ra. Sua đ&oacute; d&ugrave;ng ca đựng nước đ&atilde; chuẩn bị sẵn để hứng nước l&agrave;m m&aacute;t khi th&aacute;o ho&agrave;n to&agrave;n van hằng nhiệt ra. Tiếp theo d&ugrave;ng một đồng hồ đo nhiệt (nhiệt kế) đặt v&agrave;o trong khay nước c&ugrave;ng với van hằng nhiệt. Nhiệt kế sử dụng phải chịu được nước s&ocirc;i ở nhiệt độ cao. D&ugrave;ng bếp hoặc c&ograve;ng đốt 1000W để đun nước l&agrave;m m&aacute;t trong khay, đồng thời quan s&aacute;t nhiệt kế. Van hằng nhiệt vẫn phải đ&oacute;ng cho đến khi nước s&ocirc;i đạt đến 190oF. Ở nhiệt độ n&agrave;y van mới bắt đầu mở ra v&agrave; mở ho&agrave;n to&agrave;n khi nước đạt đến khoảng 195oF. Nếu van hằng nhiệt vẫn đ&oacute;ng k&iacute;n trong khi nước bắt đầu s&ocirc;i th&igrave; chứng tỏ van n&agrave;y đ&atilde; bị hỏng v&agrave; cần phải thay thế. Nếu van hằng nhiệt vẫn mở m&agrave; kh&ocirc;ng co lại được th&igrave; cũng cần phải thay thế.</p>

<p>Lưu &yacute;: Đừng bao giờ khởi động xe nếu kh&ocirc;ng c&oacute; van hằng nhiệt bởi van n&agrave;y hoạt động tương tự như một hệ thống điều chỉnh lưu lượng. Nghĩa l&agrave; van hằng nhiệt điều chỉnh d&ograve;ng lưu lượng nước đi qua hệ thống l&agrave;m m&aacute;t. Nếu nước l&agrave;m m&aacute;t chảy qua k&eacute;t nước qu&aacute; nhanh, sẽ kh&ocirc;ng c&oacute; đủ thời gian để truyền nhiệt cho k&eacute;t nước. L&yacute; do n&agrave;y khiến động cơ bị qu&aacute; nhiệt.</p>
', CAST(N'2019-05-13 04:31:28.643' AS DateTime), N'admin', CAST(N'2019-05-13 04:33:11.143' AS DateTime), N'admin', N'Cấu tạo và chức năng của van hằng nhiệt trên động cơ', N'Cấu tạo và chức năng của van hằng nhiệt trên động cơ', 1, 0, N'van-hang-nhiet; phu-tung;')
INSERT [dbo].[Content] ([ID], [Name], [MetaTitle], [Image], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [Tags]) VALUES (46, N'Những bộ phận hay hỏng nhất trên xe ô tô - Phần 1', N'nhung-bo-phan-hay-hong-nhat-tren-xe-o-to---phan-1', N'/Data/images/News/Auto-Spart-Parts-Car-Parts-Truck-Parts.jpg', 2, N'<p><strong>D&acirc;y cu-roa</strong></p>

<p>D&acirc;y cu-roa nhận lực truyền từ pu-li trục cơ của động cơ, l&agrave;m nhiệm vụ dẫn động h&agrave;ng loạt bộ phận kh&aacute;c như m&aacute;y ph&aacute;t, lốc điều h&ograve;a hay bơm trợ lực l&aacute;i (đối với c&aacute;c d&ograve;ng xe trợ lực thủy lực). Tr&ecirc;n một số mẫu xe sang hay xe thể thao c&oacute; hệ thống treo điều chỉnh độ cao chủ động, d&acirc;y cu-roa c&ograve;n dẫn động hệ thống bơm n&acirc;ng gầm.</p>

<p>Người sử dụng xe c&oacute; thể nhận biết sự xuống cấp của d&acirc;y cu-roa bằng mắt thường khi ph&aacute;t hiện ra c&aacute;c vết nứt vỡ. D&acirc;y cu-roa bị tho&aacute;i h&oacute;a chai cứng thường ph&aacute;t ra tiếng k&ecirc;u r&iacute;t, đặc biệt l&agrave; khi mới nổ m&aacute;y. Tuy nhi&ecirc;n, yếu tố g&acirc;y hỏng h&oacute;c bất ngờ m&agrave; người d&ugrave;ng xe cần cảnh gi&aacute;c l&agrave; bị chuột cắn.</p>

<p><input alt="" src="/Data/images/News/Day_cua_roa.jpg" style="width: 800px; height: 500px;" type="image" /></p>

<p><em><strong>&bull; Lời khuy&ecirc;n của chuy&ecirc;n gia:</strong></em>&nbsp;Nếu kh&ocirc;ng c&oacute; những sự cố hay t&aacute;c động xấu bất thường, d&acirc;y cua-roa cần được thay thế định kỳ sau khoảng 80.000 &ndash; 100.000km. Định kỳ khoảng 1 tuần một lần, bạn n&ecirc;n kiểm tra t&igrave;nh trạng của d&acirc;y cua-roa xem c&oacute; bị nứt, vỡ để c&oacute; thể xử l&yacute;.</p>

<p><strong>B&igrave;nh ắc quy</strong></p>

<p>Thường c&oacute; tuổi thọ từ 3 &ndash; 4 năm hoặc hơn t&ugrave;y thuộc v&agrave;o điều kiện sử dụng v&agrave; bảo dưỡng. Dưới trời nắng n&oacute;ng, qu&aacute; tr&igrave;nh chuyển h&oacute;a v&agrave; sản sinh năng lượng (điện) b&ecirc;n trong ắc-quy sẽ diễn ra nhanh hơn, nhưng điều đ&oacute; lại l&agrave;m giảm tuổi thọ của ắc quy. Ngược lại, trong điều kiện thời tiết lanh, qu&aacute; tr&igrave;nh chuyển h&oacute;a diễn ra chậm hơn, nhưng lại l&agrave;m cho ắc quy sống l&acirc;u hơn. Ngo&agrave;i ra, việc&nbsp;lắp th&ecirc;m qu&aacute; nhiều thiết bị điện tử hoặc xe thường xuy&ecirc;n di chuyển cự ly ngắn, khiến phải khởi động v&agrave; tắt m&aacute;y li&ecirc;n tục cũng ảnh hưởng tuổi thọ ắc quy.</p>

<p>Những dấu hiệu thường thấy khi ắc-quy yếu (trước khi hỏng hẳn) l&agrave; điện &aacute;p bị sụt, c&aacute;c đ&egrave;n b&aacute;o v&agrave; bảng đồng hồ sẽ tối khi bật ch&igrave;a kh&oacute;a v&agrave; khởi động. Qu&aacute; tr&igrave;nh khởi động kh&ocirc;ng được dứt kho&aacute;t như trước. Ắc-quy qu&aacute; yếu sẽ kh&ocirc;ng thể khởi động được động cơ, m&agrave; bạn chỉ c&oacute; thể nghe thấy &acirc;m thanh &ldquo;tạch tạch&rdquo; ph&aacute;t ra từ hệ thống đề.</p>

<p><input alt="" src="/Data/images/News/Ac_quy.jpg" style="width: 800px; height: 500px;" type="image" /></p>

<p><em><strong>&bull; Lời khuy&ecirc;n của chuy&ecirc;n gia:</strong></em>&nbsp;Nếu xe của bạn sử dụng ắc-quy cần bổ sung nước, h&atilde;y kiểm tra định kỳ mức nước của ắc-quy v&agrave; bổ sung kịp thời. Ắc-quy bị cạn nước sẽ hỏng c&aacute;c bản cực v&agrave; sẽ kh&ocirc;ng thể phục hồi khi đổ nước đầy trở lại. Giải ph&aacute;p để xử l&yacute; tạm thời khi b&igrave;nh ắc-quy hết điện dọc đường l&agrave; bạn phải dự ph&ograve;ng một bộ d&acirc;y c&acirc;u để nhờ xe kh&aacute;c hỗ trợ.</p>
', CAST(N'2019-05-13 04:35:44.670' AS DateTime), N'admin', CAST(N'2019-05-13 04:35:44.670' AS DateTime), N'admin', N'Những bộ phận hay hỏng nhất trên xe ô tô - Phần 1', N'Những bộ phận hay hỏng nhất trên xe ô tô - Phần 1', 1, 0, N'bo-phan-o-to')
INSERT [dbo].[Content] ([ID], [Name], [MetaTitle], [Image], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [Tags]) VALUES (48, N'Những bộ phận hay hỏng nhất trên xe ô tô - Phần 2', N'nhung-bo-phan-hay-hong-nhat-tren-xe-o-to---phan-2', N'/Data/images/News/Auto-Spart-Parts-Car-Parts-Truck-Parts.jpg', 2, N'<p><strong>C&aacute;c v&ograve;ng bi</strong></p>

<p>C&oacute; một số v&ograve;ng bi&nbsp;phải chịu &aacute;p lực rất lớn trong qu&aacute; tr&igrave;nh vận h&agrave;nh xe. Đ&oacute; l&agrave; v&ograve;ng bi của cơ cấu tăng d&acirc;y cua-roa, v&ograve;ng bi bộ phận tỳ d&acirc;y cua-roa, v&ograve;ng bi đai cam, v&ograve;ng bi m&aacute;y ph&aacute;t, v&ograve;ng bi lốc điều h&ograve;a v&agrave; bi ổ trục b&aacute;nh xe. Th&ocirc;ng thường, c&aacute;c loại v&ograve;ng bi c&oacute; thể c&oacute; tuổi thọ rất l&acirc;u, đơn cử như bi ổ trục b&aacute;nh xe c&oacute; thể bền bỉ đến 200.000km trong điều kiện sử dụng b&igrave;nh thường (đường s&aacute; tốt, kh&ocirc;ng tải nặng, được bảo dưỡng đầy đủ).</p>

<p>Tuy nhi&ecirc;n, cũng c&oacute; nhiều trường hợp v&ograve;ng bi bị hỏng rất sớm m&agrave; nguy&ecirc;n nh&acirc;n c&oacute; thể l&agrave; do hở phớt chắn mỡ, khiến mỡ b&ocirc;i trơn bị hao hụt hoặc bị nước ngấm v&agrave;o trong. Việc rửa động cơ bằng nước t&ugrave;y tiện v&agrave; kh&ocirc;ng đ&uacute;ng quy tr&igrave;nh cũng c&oacute; thể khiến nước chui v&agrave;o b&ecirc;n trong, l&agrave;m chết v&ograve;ng bi.</p>

<p><input alt="" src="/Data/images/News/Vong_bi.jpg" style="width: 800px; height: 500px;" type="image" /></p>

<p>&nbsp;</p>

<p><em><strong>&bull; Lời khuy&ecirc;n của chuy&ecirc;n gia:</strong>&nbsp;</em>C&aacute;c v&ograve;ng bi khi đ&atilde; bị rơ lắc v&agrave; k&ecirc;u th&igrave; chẳng c&oacute; giải ph&aacute;p n&agrave;o kh&aacute;c ngo&agrave;i việc thay thế kịp thời. V&ograve;ng bi kh&ocirc; v&agrave; k&ecirc;u kh&ocirc;ng chỉ g&acirc;y ồn, m&agrave; c&ograve;n sinh nhiệt rất mạnh, ảnh hưởng đến qu&aacute; tr&igrave;nh l&agrave;m m&aacute;t của động cơ.</p>

<p><strong>Đường ống cung cấp nhi&ecirc;n liệu</strong></p>

<p>Động cơ &ocirc; t&ocirc; kh&ocirc;ng gắn cố định tr&ecirc;n bộ khung xe, m&agrave; được gối l&ecirc;n c&aacute;c ch&acirc;n cao su (hoặc thủy lực, hoặc kh&iacute; n&eacute;n) n&ecirc;n c&oacute; độ dao động tương đối. Ch&iacute;nh v&igrave; vậy, đường ống dẫn nhi&ecirc;n liệu từ b&igrave;nh chứa v&agrave;o đến họng phun được ph&acirc;n chia th&agrave;nh nhiều đoạn với chất liệu kh&aacute;c nhau. Trong khi phần chạy dọc gầm xe được l&agrave;m bằng kim loại th&igrave; đoạn nằm trong khoang m&aacute;y lại l&agrave;m bằng chất liệu nhựa tổng hợp v&agrave; đ&acirc;y ch&iacute;nh l&agrave; đoạn nhạy cảm.</p>

<p>Trong qu&aacute; tr&igrave;nh sử dụng, đoạn ống dẫn bằng nhựa n&agrave;y c&oacute; thể bị chuột cắn, c&aacute;c điểm nối c&oacute; thể bị co ng&oacute;t v&agrave; hở, g&acirc;y r&ograve; rỉ, thậm ch&iacute; l&agrave; hở lớn.</p>

<p>&nbsp;</p>

<p><input alt="" src="/Data/images/News/Ong_nhien_lieu.jpg" style="width: 800px; height: 500px;" type="image" /></p>

<p>&nbsp;</p>

<p><em><strong>&bull; Lời khuy&ecirc;n của chuy&ecirc;n gia:</strong>&nbsp;</em>Ngay khi ph&aacute;t hiện thấy m&ugrave;i xăng bất thường (một số d&ograve;ng xe cao cấp c&oacute; thể xuất hiện đ&egrave;n b&aacute;o lỗi động cơ khi đường ống bị thủng lớn) th&igrave; cần tiến h&agrave;nh kiểm tra. R&ograve; rỉ nhi&ecirc;n liệu l&agrave; một trong những điều kiện g&acirc;y nguy cơ ch&aacute;y xe khi gặp tia lửa điện.</p>

<p><strong>C&aacute;c khớp cử động đa chiều (r&ocirc;-tuyn)</strong></p>

<p>Tr&ecirc;n c&aacute;c d&ograve;ng xe trang bị hệ thống treo kiểu MacPherson ph&iacute;a trước v&agrave; thanh chịu xoắn ph&iacute;a sau (thường tr&ecirc;n c&aacute;c d&ograve;ng xe phổ th&ocirc;ng loại nhỏ), người sử dụng xe c&oacute; thể chẳng phải lo lắng về việc n&agrave;y, bởi to&agrave;n bộ d&agrave;n gầm chỉ c&oacute; một chi tiết sử dụng khớp cử động đa chiều l&agrave; thanh c&acirc;n bằng dọc. Nhưng c&acirc;u chuyện sẽ ho&agrave;n to&agrave;n kh&aacute;c tr&ecirc;n c&aacute;c d&ograve;ng xe trang bị hệ thống treo độc lập ở cả 4 b&aacute;nh hay hệ thống treo đa li&ecirc;n kết với số r&ocirc;-tuyn l&ecirc;n tới cả chục chiếc.</p>

<p>C&aacute;c r&ocirc;-tuyn được b&ocirc;i trơn bằng mỡ với một vỏ cao su bao bọc k&iacute;n b&ecirc;n ngo&agrave;i. Nhưng&nbsp;điều đ&aacute;ng n&oacute;i l&agrave; trong điều kiện đường s&aacute; Việt Nam, mức độ cử động của c&aacute;c khớp thường rất lớn, khiến c&aacute;c bọc cao su bảo vệ mỡ rất nhanh bị r&aacute;ch, khiến nước v&agrave; bụi bẩn b&aacute;m v&agrave;o, l&agrave;m r&ocirc;-tuyn bị rơ rất nhanh. R&ocirc;-tuyn bị rơ sẽ ph&aacute;t ra tiếng k&ecirc;u lục cục khi xe di chuyển tr&ecirc;n đường xấu v&agrave; mấp m&ocirc;, thậm ch&iacute; g&acirc;y rung động v&agrave; hỏng c&aacute;c chi tiết kh&aacute;c.</p>

<p><input alt="" src="/Data/images/News/Ro_tuyn.jpg" style="width: 800px; height: 500px;" type="image" /></p>

<p><em><strong>&bull; Lời khuy&ecirc;n của chuy&ecirc;n gia:</strong></em>&nbsp;Cơ cấu r&ocirc;-tuyn c&oacute; thể chịu đựng rất tốt trong mọi t&igrave;nh huống vận h&agrave;nh xe tr&ecirc;n đường đẹp (&ocirc;m cua gấp, phanh gấp), nhưng c&oacute; thể sẽ bị tổn thương rất nhanh sau một h&agrave;nh tr&igrave;nh vất vả tr&ecirc;n đường qu&aacute; gập ghềnh hoặc chỉ v&igrave; một h&ograve;n đ&aacute; văng dưới gầm xe.</p>

<p><strong>Cao su ch&acirc;n m&aacute;y, ch&acirc;n số</strong></p>

<p>Chỉ to bằng nắm nay, nhưng chi tiết n&agrave;y phải chịu đựng rất nhiều &aacute;p lực lớn. Ch&uacute;ng kh&ocirc;ng chỉ g&aacute;nh đỡ to&agrave;n bộ trọng lượng của động cơ xe v&agrave; hộp số, m&agrave; c&ograve;n chịu sự rung lắc khi xe &ocirc;m cua hoặc tr&ecirc;n đường x&oacute;c v&agrave; nhiệt độ cao của khoang m&aacute;y.</p>

<p>Khi cao su ch&acirc;n m&aacute;y hoặc ch&acirc;n số bị chai cứng hay tệ nhất l&agrave; vỡ, độ rung của động cơ xe sẽ kh&ocirc;ng được hấp thụ m&agrave; truyền trực tiếp ra hệ thống khung, khiến cho xe bị rung, đặc biệt l&agrave; khi đang khởi động, l&uacute;c v&agrave;o số hoặc tr&ecirc;n đường x&oacute;c.</p>

<p><input alt="" src="/Data/images/News/Cao_su_chan_may.jpg" style="width: 800px; height: 500px;" type="image" /></p>

<p>&nbsp;</p>

<p><strong><em>&bull; Lời khuy&ecirc;n của chuy&ecirc;n gia:</em>&nbsp;</strong>Cao su ch&acirc;n m&aacute;y v&agrave; ch&acirc;n số cũng nằm trong danh mục bảo dưỡng xe định kỳ m&agrave; mỗi người sử dụng xe kh&ocirc;ng thể bỏ qua. Ngay khi ph&aacute;t hiện thấy những dấu hiệu bất thường như khoang m&aacute;y k&ecirc;u v&agrave; th&acirc;n xe rung l&uacute;c khởi động th&igrave; bạn cần mang xe đến gara tin cậy để kiểm tra v&agrave; thay thế.</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
', CAST(N'2019-05-13 04:55:58.080' AS DateTime), N'admin', CAST(N'2019-05-13 04:55:58.080' AS DateTime), N'admin', N'Những bộ phận hay hỏng nhất trên xe ô tô', N'Những bộ phận hay hỏng nhất trên xe ô tô', 1, 0, N'phu-tung;')
INSERT [dbo].[Content] ([ID], [Name], [MetaTitle], [Image], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [Tags]) VALUES (49, N'Những bộ phận hay hỏng nhất trên xe ô tô - Phần 3 ', N'nhung-bo-phan-hay-hong-nhat-tren-xe-o-to---phan-3-', N'/Data/images/News/Auto-Spart-Parts-Car-Parts-Truck-Parts.jpg', 2, N'<p><strong>C&agrave;ng v&agrave; cao su c&agrave;ng của hệ thống treo</strong></p>

<p>Cao su c&agrave;ng l&agrave; bộ phận l&oacute;t c&aacute;c khớp nối giữa c&agrave;ng v&agrave; hệ thống khung. Trong qu&aacute; tr&igrave;nh vận h&agrave;nh xe tr&ecirc;n đường xấu, c&agrave;ng sẽ cử động v&agrave; chi tiết cao su n&agrave;y sẽ gi&uacute;p qu&aacute; tr&igrave;nh cử động được &ecirc;m &aacute;i. Với điều kiện đường s&aacute; Việt Nam, việc thường xuy&ecirc;n di chuyển tr&ecirc;n đường x&oacute;c sẽ khiến cao su c&agrave;ng nhanh bị chai, thậm ch&iacute; vị nứt vỡ.</p>

<p>B&ecirc;n cạnh đ&oacute;, c&aacute;c thanh c&agrave;ng của hệ thống treo đa li&ecirc;n kết c&oacute; ưu điểm l&agrave; linh hoạt hơn v&agrave; hấp thụ x&oacute;c tốt hơn, nhưng cũng c&oacute; nhược điểm l&agrave; thường yếu hơn cơ cấu MacPherson hay cầu cứng, n&ecirc;n rất dễ bị cong v&agrave; lệch khi bị va chạm với đ&aacute; hoặc x&oacute;c mạnh.</p>

<p><input alt="" src="/Data/images/News/Cang_sau.jpg" style="width: 800px; height: 500px;" type="image" /></p>

<p><em><strong>&bull; Lời khuy&ecirc;n của chuy&ecirc;n gia:</strong></em>&nbsp;Với c&aacute;c d&ograve;ng xe địa h&igrave;nh trang bị cầu cứng với l&ograve; xo xoắn v&agrave; lốp th&agrave;nh cao, bạn c&oacute; thể thoải m&aacute;i thử th&aacute;ch t&iacute;nh năng của xe tr&ecirc;n những địa h&igrave;nh lởm chởm. Tuy nhi&ecirc;n, nếu l&agrave; xe gầm thấp, lốp mỏng với hệ thống treo đa li&ecirc;n kết, bạn rất c&oacute; thể sẽ phải trả gi&aacute; với một khoản chi ph&iacute; kh&ocirc;ng nhỏ thay thế bộ c&agrave;ng khi liều lĩnh phi qua một ổ g&agrave; lớn hoặc l&ugrave;a một h&ograve;n đ&aacute; v&agrave;o gầm ở tốc độ cao.</p>

<p><strong>Giảm chấn trước</strong></p>

<p>Trong qu&aacute; tr&igrave;nh phanh xe, đặc biệt l&agrave; phanh gấp, hệ thống treo trước phải chịu &aacute;p lực tăng l&ecirc;n gấp nhiều lần do trọng lượng của xe dồn l&ecirc;n. Ch&iacute;nh v&igrave; vậy, giảm chấn trước thường hay hỏng hơn so với giảm chấn sau (rất &iacute;t khi hỏng) v&agrave; chi ph&iacute; thay thế cũng thường cao hơn.</p>

<p>Khi chỉ một trong hai giảm chấn trước bị hỏng (thường l&agrave; bị chảy dầu, c&oacute; thể quan s&aacute;t thấy bằng mắt thường với dấu hiệu l&agrave; giảm x&oacute;c bị ướt nho&egrave;n), người l&aacute;i c&oacute; thể cảm nhận xe kh&ocirc;ng thể hấp thụ được x&oacute;c khi qua c&aacute;c gờ giảm tốc hay đường xấu, g&acirc;y t&igrave;nh trạng x&oacute;c nảy. Tốc độ c&agrave;ng cao, hiện tượng x&oacute;c nảy một b&ecirc;n c&agrave;ng bộc lộ r&otilde;, thậm ch&iacute; c&oacute; thể l&agrave;m lệch đầu xe.</p>

<p><input alt="" src="/Data/images/News/Giam_xoc_truoc.jpg" style="width: 800px; height: 500px;" type="image" /></p>

<p><em><strong>&bull; Lời khuy&ecirc;n của chuy&ecirc;n gia:</strong>&nbsp;</em>Khi một trong hai giảm x&oacute;c bị hỏng th&igrave; giải ph&aacute;p tốt nhất l&agrave; thay mới cả hai b&ecirc;n. Nếu chỉ thay một b&ecirc;n, qu&aacute; tr&igrave;nh hấp thụ x&oacute;c sẽ kh&ocirc;ng đều nhau giữa hai b&aacute;nh xe, vẫn khiến xe mất ổn định khi đi tr&ecirc;n đường xấu. Hơn nữa, việc sử dụng hai giảm x&oacute;c cũ/mới kh&aacute;c nhau sẽ khiến chiếc cũ hỏng trước, lại thay mới, hai b&ecirc;n lại lệch nhau.</p>

<p><strong>Cảm biến kh&iacute; thải</strong></p>

<p>Tr&ecirc;n nhiều loại xe &ocirc;t&ocirc; được sản xuất khoảng 30 năm trở lại đ&acirc;y, cảm biến kh&iacute; thải (cảm biến &ocirc;-xy) l&agrave; bộ phận kh&ocirc;ng thể thiếu. Chức năng của n&oacute; l&agrave; cung cấp th&ocirc;ng tin cho hệ thống kiểm so&aacute;t động cơ về nồng độ của kh&iacute; thải, để từ đ&oacute; hệ thống kiểm so&aacute;t bơm nhi&ecirc;n liệu sẽ cung cấp lượng nhi&ecirc;n liệu ph&ugrave; hợp để đốt ch&aacute;y hiệu quả nhất, gi&uacute;p xe đạt hiệu suất vận h&agrave;nh tốt nhất v&agrave; tiết kiệm nhi&ecirc;n liệu nhất, giảm &ocirc; nhiễm m&ocirc;i trường.</p>

<p>Nếu kh&ocirc;ng kh&iacute; v&agrave;o buồng đốt &iacute;t hơn mức cần thiết, xăng sẽ kh&ocirc;ng thể ch&aacute;y hết v&agrave; bị thải ra ngo&agrave;i, c&ograve;n gọi l&agrave; hỗn hợp &ldquo;gi&agrave;u&rdquo; xăng, v&agrave; ngược lại kh&ocirc;ng kh&iacute; nhiều qu&aacute; sẽ g&acirc;y hiện tượng &ldquo;ngh&egrave;o&rdquo; xăng. Thừa xăng sẽ g&acirc;y &ocirc; nhiễm m&ocirc;i trường, c&ograve;n ngh&egrave;o xăng sẽ l&agrave;m giảm t&iacute;nh năng của động cơ v&agrave; thậm ch&iacute; c&oacute; thể l&agrave;m hỏng động cơ.</p>

<p><input alt="" src="/Data/images/News/Cam_bien_oxy.jpg" style="width: 800px; height: 500px;" type="image" /></p>

<p><em><strong>&bull; Lời khuy&ecirc;n của chuy&ecirc;n gia:</strong></em>&nbsp;Chất lượng nhi&ecirc;n liệu kh&ocirc;ng tốt (nhi&ecirc;n liệu bẩn, lẫn nhiều tạp chất, kh&ocirc;ng đạt ti&ecirc;u chuẩn) l&agrave; một trong những l&yacute; do khiến cảm biến kh&iacute; thải bị hỏng. Khi đ&oacute;, đ&egrave;n b&aacute;o lỗi động cơ sẽ bật s&aacute;ng, k&egrave;m theo đ&oacute; l&agrave; mức ti&ecirc;u hao nhi&ecirc;n liệu c&oacute; thể sẽ tăng đột biến (c&oacute; thể tới 30%). Người sử dụng cần mang xe đến c&aacute;c gara tin cậy để kiểm tra xử l&yacute;.</p>

<p><strong>Bơm cao &aacute;p của hệ thống phun xăng trực tiếp</strong></p>

<p>Với c&aacute;c động cơ sử dụng c&ocirc;ng nghệ phun nhi&ecirc;n liệu trực tiếp, nhi&ecirc;n liệu được bơm v&agrave;o trong buồng đốt qua một hệ thống bơm cao &aacute;p. Th&ocirc;ng thường, bơm cao &aacute;p c&oacute; độ bền rất cao, nhưng ch&iacute;nh yếu tố nhi&ecirc;n liệu l&agrave; ngọn nguồn khiến cho hệ thống n&agrave;y bị hỏng. Bơm cao &aacute;p được l&agrave;m m&aacute;t v&agrave; b&ocirc;i trơn bằng ch&iacute;nh nhi&ecirc;n liệu, n&ecirc;n nhi&ecirc;n liệu bị nhiễm bẩn hoặc khởi động xe trong t&igrave;nh trạng cạn kiệt nhi&ecirc;n liệu sẽ l&agrave;m bơm bị trầy xước, g&acirc;y t&igrave;nh trạng hở v&agrave; giảm &aacute;p suất bơm.</p>

<p><input alt="" src="/Data/images/News/Bom_cao_ap.jpg" style="width: 800px; height: 500px;" type="image" /></p>

<p><em><strong>&bull; Lời khuy&ecirc;n của chuy&ecirc;n gia:</strong>&nbsp;</em>Bơm cao &aacute;p bị hỏng hoặc thiếu &aacute;p trầm trọng c&oacute; thể sẽ dẫn đến sự cố kh&ocirc;ng khởi động được động cơ mặc d&ugrave; điện vẫn khỏe. Trường hợp nhẹ c&oacute; thể khiến lượng nhi&ecirc;n liệu cung cấp kh&ocirc;ng đủ, g&acirc;y t&igrave;nh trạng rung giật v&agrave; yếu. Kh&ocirc;ng c&oacute; đ&egrave;n cảnh b&aacute;o hay t&iacute;n hiệu nhắc nhở n&agrave;o b&aacute;o cho người l&aacute;i biết rằng bơm cao &aacute;p bị hỏng. Ch&iacute;nh v&igrave; vậy, bạn chỉ c&ograve;n c&aacute;ch đưa xe đến gara tin cậy để xử l&yacute;.</p>
', CAST(N'2019-05-13 04:58:11.920' AS DateTime), N'admin', CAST(N'2019-05-13 04:58:11.920' AS DateTime), N'admin', N'Những bộ phận hay hỏng nhất trên xe ô tô', N'Những bộ phận hay hỏng nhất trên xe ô tô', 1, 0, N'phu-tung')
INSERT [dbo].[Content] ([ID], [Name], [MetaTitle], [Image], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [Tags]) VALUES (50, N'5 nguyên tắc vàng giúp phanh xe an toàn', N'5-nguyen-tac-vang-giup-phanh-xe-an-toan', N'/Data/images/News/toc-do-o-to.jpg', 2, N'<p><em>Việc phanh xe đ&uacute;ng c&aacute;ch ch&iacute;nh l&agrave; một trong những thao t&aacute;c quan trọng gi&uacute;p cho người sử dụng v&agrave; chiếc xế y&ecirc;u của m&igrave;nh trở n&ecirc;n an to&agrave;n hơn.</em><br />
&nbsp;<br />
<strong><em>1. Phải l&agrave;m chủ tốc độ</em></strong><br />
&nbsp;<br />
Yếu tố quan trọng nhất ảnh hưởng tới qu&aacute; tr&igrave;nh phanh đ&oacute; ch&iacute;nh l&agrave; tốc độ di chuyển. Một chiếc xe chạy ở tốc độ 96 km/h, mỗi gi&acirc;y sẽ di chuyển được khoảng 27m, tuy nhi&ecirc;n nếu như để dừng được chiếc xe đ&oacute; th&igrave; lại phải mất khoảng 4,5 gi&acirc;y v&agrave; qu&atilde;ng đường phanh l&ecirc;n đến 82m.<br />
&nbsp;<br />
C&ograve;n c&oacute; nhiều thứ t&aacute;c động l&ecirc;n qu&aacute; tr&igrave;nh phanh xe b&ecirc;n cạnh thời gian thực t&iacute;nh từ khi xe bắt đầu phanh như l&agrave; thời gian nhận thức v&agrave; thời gian phản ứng, v&igrave; thế n&oacute; đ&atilde; l&agrave;m tăng đ&aacute;ng kể qu&atilde;ng đường phanh xe. Thời gian nhận thức mất khoảng l&agrave; 3/4 gi&acirc;y để bạn c&oacute; thể ph&aacute;t hiện ra c&aacute;c sự cố v&agrave; bắt đầu qu&aacute; tr&igrave;nh phanh.&nbsp;</p>

<p>C&ograve;n thời gian phản ứng cũng khiến bạn mất th&ecirc;m khoảng 3/4 gi&acirc;y nữa để c&oacute; thể di chuyển ch&acirc;n đặt l&ecirc;n phanh xe. Việc cộng gộp thời gian nhận thức v&agrave; c&ugrave;ng với thời gian phản ứng th&igrave; chiếc xe của bạn đ&atilde; di chuyển một qu&atilde;ng đường l&agrave; 40,2 m trước khi chiếc xe bạn kịp giảm tốc từ tốc độ 96km/h.<br />
&nbsp;<br />
Ch&iacute;nh v&igrave; vậy, chiếc xe bạn đ&atilde; di chuyển một qu&atilde;ng đường hơn 82m từ l&uacute;c bạn nhận ra t&igrave;nh huống cần phải phanh cho đến khi dừng lại ho&agrave;n to&agrave;n, trong v&ograve;ng 4,6 gi&acirc;y, gần bằng với chiều d&agrave;i của một s&acirc;n b&oacute;ng. Nếu như bạn chạy xe c&agrave;ng nhanh th&igrave; qu&atilde;ng đường v&agrave; thời gian phanh c&agrave;ng lớn.<br />
&nbsp;<br />
<strong><em>2. Cần phải ch&uacute; &yacute; đến điều kiện thời tiết</em></strong><br />
&nbsp;<br />
Việc thay đổi phong c&aacute;ch l&aacute;i sẽ gi&uacute;p gia tăng mức độ an to&agrave;n của bạn khi l&aacute;i xe trong điều kiện đường s&aacute;, thời tiết xấu.<br />
&nbsp;<br />
Bởi v&igrave; qu&atilde;ng đường phanh của bạn c&oacute; thể tăng l&ecirc;n gấp nhiều lần khi l&aacute;i xe trong điều kiện thời tiết xấu. Bạn c&oacute; thể mất tới 6,1 gi&acirc;y để dừng chiếc xe lại nếu như di chuyển tr&ecirc;n những cung đường ẩm ướt với tổng qu&atilde;ng đường phanh tăng l&ecirc;n đến 101 m. Hoặc, bạn sẽ mất tới 10,6 gi&acirc;y v&agrave; di chuyển hơn 162m nếu di chuyển tr&ecirc;n mặt đường phủ tuyết. C&oacute; thể thấy khoảng c&aacute;ch n&agrave;y tương đương với qu&atilde;ng đường phanh của một chiếc xe đang di chuyển với tốc độ 145km/h trong điều kiện đường s&aacute; kh&ocirc; r&aacute;o.<br />
&nbsp;<br />
H&atilde;y ch&uacute; &yacute; hơn đến tốc độ xe trong điều kiện thời tiết xấu nếu bạn đang l&aacute;i một chiếc xe tải. Bởi v&igrave; những loại xe n&agrave;y c&oacute; vị tr&iacute; ngồi v&agrave; trọng t&acirc;m xe thường cao hơn nhiều so với c&aacute;c d&ograve;ng xe kh&aacute;c, ch&iacute;nh v&igrave; thế m&agrave; nguy cơ lật xe cũng cao hơn nhiều nếu xe bị phanh gấp.<br />
&nbsp;<br />
<strong><em>3. C&acirc;n nhắc đến tải trọng</em></strong><br />
&nbsp;<br />
Quy luật t&aacute;c động của vật l&yacute; l&agrave; điều m&agrave; bạn sẽ kh&ocirc;ng thể tr&aacute;nh khỏi, đ&oacute; ch&iacute;nh l&agrave; lực qu&aacute;n t&iacute;nh (bởi v&igrave; xe c&oacute; trọng lượng c&agrave;ng lớn th&igrave; qu&atilde;ng đường phanh c&agrave;ng d&agrave;i). Ch&iacute;nh v&igrave; thế, trọng lượng của xe cũng ch&iacute;nh l&agrave; một trong những nh&acirc;n tố quan trọng trong qu&aacute; tr&igrave;nh phanh xe của bạn.<br />
&nbsp;<br />
<strong><em>4. Cần phải giữ khoảng c&aacute;ch an to&agrave;n</em></strong><br />
&nbsp;<br />
Khi l&aacute;i xe h&atilde;y nhớ giữ khoảng c&aacute;ch với c&aacute;c xe kh&aacute;c ở ph&iacute;a trước, b&ecirc;n h&ocirc;ng v&agrave; ph&iacute;a sau xe của bạn. H&atilde;y l&agrave;m theo nguy&ecirc;n tắc &ldquo;3 gi&acirc;y&rdquo; để biết được khoảng c&aacute;ch an to&agrave;n. Khi xe ph&iacute;a trước vượt qua một vật thể n&agrave;o đ&oacute;, một biển hiệu chẳng hạn, th&igrave; l&uacute;c n&agrave;y bạn h&atilde;y bắt đầu đếm đến 3. Nếu như bạn vượt qua cột mốc đ&oacute; trước khi đếm xong th&igrave; điều n&agrave;y c&oacute; nghĩa bạn đang di chuyển qu&aacute; gần. Bạn n&ecirc;n gia tăng khoảng c&aacute;ch n&agrave;y l&ecirc;n trong điều kiện thời tiết qu&aacute; xấu để đảm bảo an to&agrave;n, tr&aacute;nh nguy cơ xảy ra va chạm.</p>

<p><input alt="" src="/Data/images/News/bien_khoang_cach.jpg" style="width: 660px; height: 440px;" type="image" /></p>

<p><strong><em>5. Lốp xe cũng l&agrave; yếu tố quan trọng khi phanh</em></strong><br />
&nbsp;<br />
H&atilde;y ch&uacute; &yacute; đến loại lốp xe m&agrave; bạn đang sử dụng sao cho ph&ugrave; hợp với điều kiện vận h&agrave;nh. Tr&ecirc;n thị trường hiện nay c&oacute; nhiều c&aacute;c loại lốp xe được sử dụng tương ứng với c&aacute;c điều kiện đường s&aacute; kh&aacute;c nhau. Ch&iacute;nh v&igrave; thế m&agrave; muốn tăng khả năng vận h&agrave;nh v&agrave; đảm bảo qu&atilde;ng đường phanh tốt hơn th&igrave; phải lựa chọn loại lốp xe ph&ugrave; hợp.</p>
', CAST(N'2019-05-13 05:00:48.280' AS DateTime), N'admin', CAST(N'2019-05-13 05:00:48.280' AS DateTime), N'admin', N'5 nguyên tắc vàng giúp phanh xe an toàn', N'5 nguyên tắc vàng giúp phanh xe an toàn', 1, 0, N'an-toan;')
SET IDENTITY_INSERT [dbo].[Content] OFF
SET IDENTITY_INSERT [dbo].[Decentralization] ON 

INSERT [dbo].[Decentralization] ([ID], [UserManager], [CarPartManager], [CarManager], [OrderManager], [NewsManager], [SystemManager]) VALUES (1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Decentralization] ([ID], [UserManager], [CarPartManager], [CarManager], [OrderManager], [NewsManager], [SystemManager]) VALUES (3, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Decentralization] ([ID], [UserManager], [CarPartManager], [CarManager], [OrderManager], [NewsManager], [SystemManager]) VALUES (4, 0, 1, 0, 0, 1, 0)
SET IDENTITY_INSERT [dbo].[Decentralization] OFF
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([ID], [Name], [Phone], [Email], [Content], [CreatedDate], [Status]) VALUES (1, N'Phùng Thành Nhân', N'01226112017', N'myfriend1102vn@yahoo.com', N'abcedf', CAST(N'2019-05-11 22:20:19.710' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Feedback] OFF
INSERT [dbo].[Footer] ([ID], [Content], [Status]) VALUES (N'footer', N'<div class="container">
    <div class="row">
        <div class="col-sm-3" style="margin-top:1.3%">
            <h2 class="logo"><a href="/"><img src="/Assets/Clients/images/logo-footer.png" width="150"/></a></h2>
        </div>
        <div class="col-sm-2">
            <h5>Bắt Đầu</h5>
            <ul>
                <li><a href="/">Trang Chủ</a></li>
                <li><a href="/dang-nhap">Đăng Nhập</a></li>
                <li><a href="/dang-ky">Đăng Ký</a></li>
            </ul>
        </div>
        <div class="col-sm-2">
            <h5>Về Chúng Tôi</h5>
            <ul>
                <li><a href="/">Giới Thiệu</a></li>
                <li><a href="/lien-he">Liên Hệ</a></li>
            </ul>
        </div>
        <div class="col-sm-2">
            <h5>Hỗ Trợ</h5>
            <ul>
                <li><a href="/tim-mua-xe">Tìm Mua Xe</a></li>
                <li><a href="/phu-tung/tat-ca-phu-tung-20">Phụ Tùng</a></li>
                <li><a href="/lien-he">Bán Xe</a></li>
            </ul>
        </div>
        <div class="col-sm-3">
            <div class="social-networks">
                <a href="/" class="twitter"><i class="fa fa-twitter"></i></a>
                <a href="/" class="facebook"><i class="fa fa-facebook"></i></a>
                <a href="/" class="google"><i class="fa fa-google-plus"></i></a>
            </div>
            <button type="button" class="btn btn-default"><a href="/lien-he">Liên Hệ</a></button>
        </div>
    </div>
</div>
<div class="footer-copyright">
    <p>© 2019 Copyright </p>
</div>', 1)
SET IDENTITY_INSERT [dbo].[Manufacturer] ON 

INSERT [dbo].[Manufacturer] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, N'Honda', CAST(N'2019-05-01 11:04:26.337' AS DateTime), N'admin', CAST(N'2019-05-03 00:00:00.000' AS DateTime), N'admin', 1)
INSERT [dbo].[Manufacturer] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, N'Toyota', CAST(N'2019-05-01 11:04:33.110' AS DateTime), N'admin', CAST(N'2019-05-03 00:00:00.000' AS DateTime), N'admin', 1)
INSERT [dbo].[Manufacturer] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (12, N'Jetta', CAST(N'2019-05-03 17:43:42.070' AS DateTime), N'admin', CAST(N'2019-05-03 23:31:50.087' AS DateTime), N'admin', 1)
INSERT [dbo].[Manufacturer] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (13, N'Projet', CAST(N'2019-05-03 23:00:19.180' AS DateTime), N'admin', CAST(N'2019-05-03 23:31:42.997' AS DateTime), N'admin', 1)
INSERT [dbo].[Manufacturer] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (14, N'Nissan', CAST(N'2019-05-03 23:04:14.857' AS DateTime), N'admin', CAST(N'2019-05-03 23:04:14.857' AS DateTime), N'admin', 1)
INSERT [dbo].[Manufacturer] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (15, N'ACM', CAST(N'2019-05-03 23:26:23.210' AS DateTime), N'admin', CAST(N'2019-05-03 23:26:23.210' AS DateTime), N'admin', 1)
INSERT [dbo].[Manufacturer] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (16, N'Ford', CAST(N'2019-05-03 23:29:54.940' AS DateTime), N'admin', CAST(N'2019-05-03 23:29:54.940' AS DateTime), N'admin', 1)
INSERT [dbo].[Manufacturer] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (17, N'Asaki', CAST(N'2019-05-03 23:32:05.667' AS DateTime), N'admin', CAST(N'2019-05-03 23:32:05.667' AS DateTime), N'admin', 1)
INSERT [dbo].[Manufacturer] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (18, N'Meyla', CAST(N'2019-05-13 04:22:14.767' AS DateTime), NULL, CAST(N'2019-05-13 04:22:14.767' AS DateTime), NULL, 1)
INSERT [dbo].[Manufacturer] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (19, N'vector', CAST(N'2019-05-13 04:24:04.540' AS DateTime), NULL, CAST(N'2019-05-13 04:24:04.540' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[Manufacturer] OFF
SET IDENTITY_INSERT [dbo].[MemberGroup] ON 

INSERT [dbo].[MemberGroup] ([ID], [Name], [Description], [DecenID]) VALUES (1, N'Super  Administrator', N'Developer - Quản lý tất cả ', 1)
INSERT [dbo].[MemberGroup] ([ID], [Name], [Description], [DecenID]) VALUES (3, N'Administrator', N'quản lý tất cả', 3)
INSERT [dbo].[MemberGroup] ([ID], [Name], [Description], [DecenID]) VALUES (4, N'Member', N'Khong quan ly bat ky thu gi', 4)
SET IDENTITY_INSERT [dbo].[MemberGroup] OFF
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status]) VALUES (2, N'Trang Chủ', N'http://localhost:20455/', 1, N'_self', 0)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status]) VALUES (3, N'Tìm Mua Xe', N'http://localhost:20455/tim-mua-xe/', 2, N'_blank', 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status]) VALUES (4, N'Bán Xe', N'http://localhost:20455/lien-he', 4, N'_self', 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status]) VALUES (5, N'Phụ Tùng', N'http://localhost:20455/phu-tung/tat-ca-phu-tung-20', 3, N'_blank', 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status]) VALUES (6, N'Giới Thiệu', N'http://localhost:20455/gioi-thieu', 5, N'_self', 0)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status]) VALUES (7, N'Liên Hệ', N'http://localhost:20455/lien-he/', 7, N'_self', 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status]) VALUES (8, N'Tin Tức', N'http://localhost:20455/tin-tuc/tin-tuc-12', 6, N'_self', 1)
SET IDENTITY_INSERT [dbo].[Menu] OFF
SET IDENTITY_INSERT [dbo].[NewsCategory] ON 

INSERT [dbo].[NewsCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (1, N'Tin Thế Giới', N'tin-the-gioi', 0, 3, N'Blogs - World', CAST(N'2019-03-17 19:12:04.463' AS DateTime), N'admin', CAST(N'2019-05-12 11:22:17.430' AS DateTime), N'admin', N'Tin Thế Giới', N'Tin tức', 1)
INSERT [dbo].[NewsCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (2, N'Tin Trong Nước', N'tin-trong-nuoc', 0, 2, N'Blogs - In The National', CAST(N'2019-03-17 19:12:17.897' AS DateTime), N'admin', CAST(N'2019-05-12 11:18:50.207' AS DateTime), N'admin', N'Tin Trong Nước', N'tin tức trong nước                                                                                                                                                                                                                                        ', 1)
INSERT [dbo].[NewsCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (12, N'Tin Tức', N'tin-tuc', 0, 1, N'Blogs - Tin Tức', CAST(N'2019-05-12 11:11:01.310' AS DateTime), N'admin', CAST(N'2019-05-12 11:18:42.927' AS DateTime), N'admin', N'Tin Tức', N'Tin Tức', 1)
INSERT [dbo].[NewsCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (13, N'Phụ Tùng Ô Tô', N'phu-tung-o-to', 2, 1, N'Tin tức về phụ tùng ô tô', CAST(N'2019-05-13 04:27:49.033' AS DateTime), NULL, CAST(N'2019-05-13 04:27:49.033' AS DateTime), NULL, N'Tin tức về phụ tùng ô tô', N'Tin tức về phụ tùng ô tô', 1)
SET IDENTITY_INSERT [dbo].[NewsCategory] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (1, CAST(N'2019-05-10 01:46:20.457' AS DateTime), 0, N'Phùng Thành Nhân', N'1226112017', N'Bình Dương', N'myfriend1102vn@yahoo.com', 3)
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (2, CAST(N'2019-05-11 11:30:47.140' AS DateTime), 0, N'Phùng Thành Nhân', N'1226112017', N'Bình Dương', N'myfriend1102vn@yahoo.com', 3)
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (3, CAST(N'2019-05-11 12:21:48.577' AS DateTime), 0, N'Phùng Thành Nhân', N'1226112017', N'Bình Dương', N'myfriend1102vn@yahoo.com', 1)
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (6, CAST(N'2019-05-11 12:39:23.760' AS DateTime), 10047, N'Phùng Thành Nhân', N'1226112017', N'Bình Dương', N'myfriend1102vn@yahoo.com', 0)
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (7, CAST(N'2019-05-12 13:20:39.410' AS DateTime), 13, N'Nguyen Van B', N'0123456789', N'Q7 TPHCM', N'll@gmail.com', 1)
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (8, CAST(N'2019-05-13 03:42:00.200' AS DateTime), 0, N'Phùng Thành Nhân', N'1226112017', N'Bình Dương', N'myfriend1102vn@yahoo.com', 1)
SET IDENTITY_INSERT [dbo].[Order] OFF
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (7, 1, 1, CAST(1400000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (7, 7, 3, CAST(1400000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (8, 6, 2, CAST(5050000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (14, 2, 3, CAST(1650000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (15, 3, 1, CAST(65900000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (16, 1, 2, CAST(1200000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (16, 7, 1, CAST(1200000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (16, 8, 1, CAST(1200000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Origin] ON 

INSERT [dbo].[Origin] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Type]) VALUES (1, N'Chính Hãng', CAST(N'2019-05-01 10:22:41.757' AS DateTime), N'admin', CAST(N'2019-05-01 10:22:41.757' AS DateTime), N'admin', 1, 0)
INSERT [dbo].[Origin] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Type]) VALUES (2, N'Nhập Khẩu', CAST(N'2019-05-01 10:22:55.947' AS DateTime), N'admin', CAST(N'2019-05-01 10:22:55.947' AS DateTime), N'admin', 1, 0)
INSERT [dbo].[Origin] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Type]) VALUES (3, N'Lắp Ráp Trong Nước', CAST(N'2019-05-01 10:23:23.173' AS DateTime), N'admin', CAST(N'2019-05-01 10:23:23.173' AS DateTime), N'admin', 1, 1)
INSERT [dbo].[Origin] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Type]) VALUES (4, N'Đài Loan', CAST(N'2019-05-01 10:23:30.357' AS DateTime), N'admin', CAST(N'2019-05-01 10:24:20.813' AS DateTime), N'admin', 1, 0)
INSERT [dbo].[Origin] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Type]) VALUES (5, N'Trung Quốc', CAST(N'2019-05-01 10:23:35.800' AS DateTime), N'admin', CAST(N'2019-05-01 10:23:35.800' AS DateTime), N'admin', 1, 0)
INSERT [dbo].[Origin] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Type]) VALUES (6, N'Korea', CAST(N'2019-05-01 10:23:41.573' AS DateTime), N'admin', CAST(N'2019-05-01 10:23:57.643' AS DateTime), N'admin', 1, 0)
INSERT [dbo].[Origin] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Type]) VALUES (7, N'Japan', CAST(N'2019-05-01 10:25:22.443' AS DateTime), N'admin', CAST(N'2019-05-01 10:25:22.443' AS DateTime), N'admin', 1, 0)
INSERT [dbo].[Origin] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Type]) VALUES (8, N'Malaysia', CAST(N'2019-05-01 10:25:42.797' AS DateTime), N'admin', CAST(N'2019-05-01 10:25:42.797' AS DateTime), N'admin', 1, 0)
INSERT [dbo].[Origin] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Type]) VALUES (9, N'Singapore', CAST(N'2019-05-01 10:25:59.020' AS DateTime), N'admin', CAST(N'2019-05-01 10:25:59.020' AS DateTime), N'admin', 1, 0)
INSERT [dbo].[Origin] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Type]) VALUES (13, N'Đang Chờ Cập Nhật', CAST(N'2019-05-03 23:02:43.980' AS DateTime), N'admin', CAST(N'2019-05-03 23:02:43.980' AS DateTime), N'admin', 1, 0)
INSERT [dbo].[Origin] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Type]) VALUES (14, N'ThaiLand', CAST(N'2019-05-03 23:03:41.187' AS DateTime), N'admin', CAST(N'2019-05-03 23:03:41.187' AS DateTime), N'admin', 1, 0)
INSERT [dbo].[Origin] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Type]) VALUES (17, N'Chính Hãng', CAST(N'2019-05-05 19:46:05.810' AS DateTime), N'admin', CAST(N'2019-05-05 19:46:05.810' AS DateTime), N'admin', 1, 1)
INSERT [dbo].[Origin] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Type]) VALUES (10015, N'Nhập Khẩu TQ', CAST(N'2019-05-13 01:26:53.503' AS DateTime), NULL, CAST(N'2019-05-13 01:26:53.503' AS DateTime), NULL, 1, 1)
INSERT [dbo].[Origin] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Type]) VALUES (10016, N'Nhập Khẩu Đài Loan', CAST(N'2019-05-13 01:27:02.217' AS DateTime), NULL, CAST(N'2019-05-13 01:27:02.217' AS DateTime), NULL, 1, 1)
INSERT [dbo].[Origin] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Type]) VALUES (10017, N'Nhập Khẩu', CAST(N'2019-05-13 03:58:29.400' AS DateTime), NULL, CAST(N'2019-05-13 03:58:29.400' AS DateTime), NULL, 1, 1)
INSERT [dbo].[Origin] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Type]) VALUES (10018, N'Việt Nam', CAST(N'2019-05-13 04:24:13.723' AS DateTime), NULL, CAST(N'2019-05-13 04:24:13.723' AS DateTime), NULL, 1, 0)
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
INSERT [dbo].[SalientFeatures] ([ID], [Name], [Status]) VALUES (32, N'Cruise Control - Ga tự động', 1)
INSERT [dbo].[SalientFeatures] ([ID], [Name], [Status]) VALUES (33, N'Cửa gió hàng ghế thứ hai', 1)
INSERT [dbo].[SalientFeatures] ([ID], [Name], [Status]) VALUES (34, N' EPS - Tay lái trợ lực điện', 1)
SET IDENTITY_INSERT [dbo].[SalientFeatures] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Phone], [Email], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Type], [GroupID]) VALUES (3, N'superadmin', N'e10adc3949ba59abbe56e057f20f883e', N'P.T.Nhan', N'Binh Duong', N'0123456789', N'thanhnhanphung97@gmail.com', CAST(N'2019-03-14 02:39:17.933' AS DateTime), N'admin', CAST(N'2019-03-14 00:00:00.000' AS DateTime), N'admin', 1, 1, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Phone], [Email], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Type], [GroupID]) VALUES (4, N'admin', N'202cb962ac59075b964b07152d234b70', N'Hoang', N'HN', N'0123456789', N'cc@gmail.com', CAST(N'2019-03-14 02:39:17.933' AS DateTime), N'admin', CAST(N'2019-03-14 00:00:00.000' AS DateTime), N'admin', 1, 1, 3)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Phone], [Email], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Type], [GroupID]) VALUES (5, N'member', N'202cb962ac59075b964b07152d234b70', N'Nghia', N'Hai Phong', N'0123456789', N'dd@gmail.com', CAST(N'2019-03-14 02:39:17.933' AS DateTime), N'admin', CAST(N'2019-03-14 00:00:00.000' AS DateTime), N'admin', 1, 1, 4)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Phone], [Email], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Type], [GroupID]) VALUES (6, N'test05', N'202cb962ac59075b964b07152d234b70', N'Hau', N'Da Nang', N'0123456789', N'ee@gmail.com', CAST(N'2019-03-14 02:39:17.933' AS DateTime), N'admin', CAST(N'2019-03-14 00:00:00.000' AS DateTime), N'admin', 1, 1, 4)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Phone], [Email], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Type], [GroupID]) VALUES (7, N'test06', N'202cb962ac59075b964b07152d234b70', N'Tam', N'DakLak', N'0123456789', N'dd@gmail.com', CAST(N'2019-03-14 02:39:17.933' AS DateTime), N'admin', CAST(N'2019-03-14 00:00:00.000' AS DateTime), N'admin', 0, 1, 4)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Phone], [Email], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Type], [GroupID]) VALUES (8, N'test07', N'202cb962ac59075b964b07152d234b70', N'Quoc', N'Gia Lai', N'0123456789', N'ff@gmail.com', CAST(N'2019-03-14 02:39:17.933' AS DateTime), N'admin', CAST(N'2019-03-14 00:00:00.000' AS DateTime), N'admin', 1, 0, 5)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Phone], [Email], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Type], [GroupID]) VALUES (9, N'test08', N'202cb962ac59075b964b07152d234b70', N'Dong', N'TPHCM', N'0123456789', N'gg@gmail.com', CAST(N'2019-03-14 02:39:17.933' AS DateTime), N'admin', CAST(N'2019-03-14 00:00:00.000' AS DateTime), N'admin', 1, 0, 4)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Phone], [Email], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Type], [GroupID]) VALUES (10, N'test09', N'202cb962ac59075b964b07152d234b70', N'Nguyen Van C', N'TPHCM', N'0123456789', N'hh@gmail.com', CAST(N'2019-03-14 02:39:17.933' AS DateTime), N'admin', CAST(N'2019-03-14 00:00:00.000' AS DateTime), NULL, 0, 0, 5)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Phone], [Email], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Type], [GroupID]) VALUES (11, N'test10', N'202cb962ac59075b964b07152d234b70', N'Nguyen Van D', N'TPHCM', N'0123456789', N'ii@gmail.com', CAST(N'2019-03-14 02:39:17.933' AS DateTime), N'admin', CAST(N'2019-03-14 00:00:00.000' AS DateTime), NULL, 1, 0, 5)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Phone], [Email], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Type], [GroupID]) VALUES (12, N'test11', N'e10adc3949ba59abbe56e057f20f883e', N'Nguyen Van A', N'Q3', N'0123456789', N'kk@gmail.com', CAST(N'2019-03-14 02:39:17.933' AS DateTime), N'admin', CAST(N'2019-03-14 00:00:00.000' AS DateTime), N'admin', 0, 0, 5)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Phone], [Email], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Type], [GroupID]) VALUES (13, N'test12', N'e10adc3949ba59abbe56e057f20f883e', N'Nguyen Van B', N'Q7 TPHCM', N'0123456789', N'll@gmail.com', CAST(N'2019-03-14 02:39:17.933' AS DateTime), N'admin', CAST(N'2019-03-14 00:00:00.000' AS DateTime), N'admin', 1, 0, 5)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Phone], [Email], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Type], [GroupID]) VALUES (43, N'user001', N'202cb962ac59075b964b07152d234b70', N'nguyen van a', N'Binh Duong', N'0123456789', N'aaa@gmail.com', CAST(N'2019-04-11 09:27:38.913' AS DateTime), N'admin', CAST(N'2019-03-14 00:00:00.000' AS DateTime), NULL, 1, 1, 4)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Phone], [Email], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Type], [GroupID]) VALUES (10047, N'ptn001', N'e10adc3949ba59abbe56e057f20f883e', N'Phùng Thành Nhân', N'Bình Dương', N'1226112017', N'myfriend1102vn@yahoo.com', CAST(N'2019-05-12 00:16:37.820' AS DateTime), N'admin', CAST(N'2019-05-12 00:16:37.820' AS DateTime), N'admin', 1, 0, 5)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Phone], [Email], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Type], [GroupID]) VALUES (10048, N'ptnhan002', N'e10adc3949ba59abbe56e057f20f883e', N'Phùng Thành Nhân', N'Bình Dương', N'1226112017', N'myfriend1102vn@yahoo.com', CAST(N'2019-05-12 00:36:22.023' AS DateTime), N'admin', CAST(N'2019-05-12 00:36:22.023' AS DateTime), N'admin', 1, 0, 5)
SET IDENTITY_INSERT [dbo].[User] OFF
