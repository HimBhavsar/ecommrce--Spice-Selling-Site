/****** Object:  Table [dbo].[DeliveryAgency]    Script Date: 07-Aug-20 7:04:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DeliveryAgency](
	[DeliveryAgencyID] [int] IDENTITY(1,1) NOT NULL,
	[DeliveryAgencyName] [varchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_DeliveryAgency] PRIMARY KEY CLUSTERED 
(
	[DeliveryAgencyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DeliveryDetails]    Script Date: 07-Aug-20 7:04:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DeliveryDetails](
	[DeliveryID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDetailsID] [int] NOT NULL,
	[ProductPackagingID] [int] NOT NULL,
	[Qty] [int] NOT NULL,
	[DeliveredAgencyID] [int] NOT NULL,
	[IssuedDateTime] [datetime] NOT NULL,
	[DeliveryChallanNo] [varchar](50) NULL,
	[DeliveryTrackingNo] [varchar](50) NULL,
	[DeliveredDateTime] [datetime] NULL,
	[DeliveryRemarks] [varchar](200) NULL,
 CONSTRAINT [PK_DeliveryDetails] PRIMARY KEY CLUSTERED 
(
	[DeliveryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MastAdminUsers]    Script Date: 07-Aug-20 7:04:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MastAdminUsers](
	[AdminUserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](20) NOT NULL,
	[Password] [varchar](20) NOT NULL,
	[RightsMastProductCategory] [varchar](5) NOT NULL,
	[RightsMastProducts] [varchar](5) NOT NULL,
	[RightsProductPackaging] [varchar](5) NOT NULL,
	[RightsOrders] [varchar](5) NOT NULL,
	[RightsDelivery] [varchar](5) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_MastAdminUsers] PRIMARY KEY CLUSTERED 
(
	[AdminUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MastCustomer]    Script Date: 07-Aug-20 7:04:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MastCustomer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](25) NOT NULL,
	[LastName] [varchar](25) NOT NULL,
	[MobileNumber] [varchar](10) NOT NULL,
	[Password] [varchar](20) NULL,
	[Address1] [varchar](50) NOT NULL,
	[Address2] [varchar](50) NULL,
	[Area] [varchar](25) NOT NULL,
	[City] [varchar](25) NOT NULL,
	[Pin] [varchar](10) NOT NULL,
	[State] [varchar](50) NOT NULL,
 CONSTRAINT [PK_MastCustomer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MastProductCategory]    Script Date: 07-Aug-20 7:04:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MastProductCategory](
	[ProductCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[ProductCategory] [varchar](25) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_MastProductCategory] PRIMARY KEY CLUSTERED 
(
	[ProductCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MastProductPackaging]    Script Date: 07-Aug-20 7:04:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MastProductPackaging](
	[ProductPackagingID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[WeightInGrams] [int] NOT NULL,
	[MRP] [decimal](18, 2) NOT NULL,
	[Discount] [decimal](18, 2) NULL,
	[RecommendedPack] [bit] NOT NULL,
	[InStock] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_MastProductPackaging] PRIMARY KEY CLUSTERED 
(
	[ProductPackagingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MastProducts]    Script Date: 07-Aug-20 7:04:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MastProducts](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
	[ProductCategoryID] [int] NOT NULL,
	[ProductDescription] [varchar](200) NULL,
	[ProductImagePath] [varchar](100) NOT NULL,
	[NewLaunch] [bit] NOT NULL,
	[OurSpeciality] [bit] NOT NULL,
	[MostPopular] [bit] NOT NULL,
	[StarRating] [decimal](18, 2) NULL,
	[RelatedProducts] [varchar](100) NULL,
	[InStock] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_MastProducts] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 07-Aug-20 7:04:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailsID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductPackagingID] [int] NOT NULL,
	[Qty] [int] NOT NULL,
	[MRP] [decimal](18, 2) NOT NULL,
	[Discount] [decimal](18, 2) NULL,
	[FinalRate] [decimal](18, 2) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 07-Aug-20 7:04:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderNumber] [varchar](15) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[OrderDateTime] [datetime] NOT NULL,
	[OrderValue] [decimal](18, 2) NULL,
	[IsCancelled] [bit] NOT NULL,
	[CancellationReason] [varchar](500) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Settings]    Script Date: 07-Aug-20 7:04:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Settings](
	[OrderNumberSuffix] [varchar](5) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[MastCustomer] ON 

GO
INSERT [dbo].[MastCustomer] ([CustomerID], [FirstName], [LastName], [MobileNumber], [Password], [Address1], [Address2], [Area], [City], [Pin], [State]) VALUES (1, N'Him', N'Bhavsar', N'9876543210', NULL, N'Ahmedabad', NULL, N'Ghatlodia', N'Ahmedabad', N'380061', N'Gujarat')

GO
SET IDENTITY_INSERT [dbo].[MastCustomer] OFF
GO
SET IDENTITY_INSERT [dbo].[MastProductCategory] ON 

GO
INSERT [dbo].[MastProductCategory] ([ProductCategoryID], [ProductCategory], [IsActive]) VALUES (1, N'Whole Spices', 1)
GO
INSERT [dbo].[MastProductCategory] ([ProductCategoryID], [ProductCategory], [IsActive]) VALUES (2, N'Grounded Spices', 1)
GO
INSERT [dbo].[MastProductCategory] ([ProductCategoryID], [ProductCategory], [IsActive]) VALUES (3, N'Blended Spices', 1)
GO
INSERT [dbo].[MastProductCategory] ([ProductCategoryID], [ProductCategory], [IsActive]) VALUES (4, N'Pickle Masala', 1)
GO
INSERT [dbo].[MastProductCategory] ([ProductCategoryID], [ProductCategory], [IsActive]) VALUES (5, N'Dry Fruits', 1)
GO
SET IDENTITY_INSERT [dbo].[MastProductCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[MastProductPackaging] ON 

GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (1, 1, 200, CAST(45.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (2, 1, 500, CAST(110.00 AS Decimal(18, 2)), NULL, 1, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (3, 1, 1000, CAST(210.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (4, 2, 200, CAST(48.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (5, 2, 500, CAST(118.00 AS Decimal(18, 2)), NULL, 1, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (6, 2, 1000, CAST(225.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (7, 3, 200, CAST(68.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (8, 3, 500, CAST(167.00 AS Decimal(18, 2)), NULL, 1, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (9, 3, 1000, CAST(325.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (10, 4, 200, CAST(88.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (11, 4, 500, CAST(217.00 AS Decimal(18, 2)), NULL, 1, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (12, 4, 1000, CAST(425.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (13, 5, 200, CAST(45.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (14, 5, 500, CAST(110.00 AS Decimal(18, 2)), NULL, 1, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (15, 5, 1000, CAST(215.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (16, 6, 200, CAST(36.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (17, 6, 500, CAST(87.00 AS Decimal(18, 2)), NULL, 1, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (18, 6, 1000, CAST(170.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (19, 7, 200, CAST(18.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (20, 7, 500, CAST(42.00 AS Decimal(18, 2)), NULL, 1, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (21, 7, 1000, CAST(80.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (22, 8, 200, CAST(48.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (23, 8, 500, CAST(117.00 AS Decimal(18, 2)), NULL, 1, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (24, 8, 1000, CAST(230.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (25, 9, 200, CAST(26.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (26, 9, 500, CAST(64.00 AS Decimal(18, 2)), NULL, 1, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (27, 9, 1000, CAST(125.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (28, 10, 200, CAST(53.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (29, 10, 500, CAST(130.00 AS Decimal(18, 2)), NULL, 1, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (30, 10, 1000, CAST(258.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (31, 11, 200, CAST(50.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (32, 11, 500, CAST(122.00 AS Decimal(18, 2)), NULL, 1, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (33, 11, 1000, CAST(240.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (34, 12, 200, CAST(65.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (35, 12, 500, CAST(200.00 AS Decimal(18, 2)), NULL, 1, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (36, 13, 200, CAST(50.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (37, 13, 500, CAST(122.00 AS Decimal(18, 2)), NULL, 1, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (38, 13, 1000, CAST(240.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (39, 14, 200, CAST(168.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (40, 14, 500, CAST(410.00 AS Decimal(18, 2)), NULL, 1, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (41, 14, 1000, CAST(810.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (42, 15, 200, CAST(285.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (43, 15, 500, CAST(710.00 AS Decimal(18, 2)), NULL, 1, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (44, 15, 1000, CAST(1400.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (45, 16, 200, CAST(1050.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (46, 16, 500, CAST(2575.00 AS Decimal(18, 2)), NULL, 1, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (47, 16, 1000, CAST(5050.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (48, 17, 200, CAST(135.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (49, 17, 500, CAST(330.00 AS Decimal(18, 2)), NULL, 1, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (50, 17, 1000, CAST(650.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (51, 18, 200, CAST(198.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (52, 18, 500, CAST(490.00 AS Decimal(18, 2)), NULL, 1, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (53, 18, 1000, CAST(970.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (54, 19, 200, CAST(65.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (55, 19, 500, CAST(160.00 AS Decimal(18, 2)), NULL, 1, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (56, 19, 1000, CAST(318.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (57, 20, 200, CAST(163.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (58, 20, 500, CAST(405.00 AS Decimal(18, 2)), NULL, 1, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (59, 20, 1000, CAST(805.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (60, 21, 50, CAST(22.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (61, 21, 100, CAST(40.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (62, 21, 200, CAST(70.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (63, 21, 500, CAST(170.00 AS Decimal(18, 2)), NULL, 1, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (64, 21, 1000, CAST(320.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (65, 21, 5000, CAST(1250.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (66, 22, 50, CAST(45.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (67, 22, 50, CAST(57.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (68, 22, 500, CAST(540.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (69, 22, 500, CAST(420.00 AS Decimal(18, 2)), NULL, 1, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (70, 22, 1000, CAST(1040.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (71, 22, 1000, CAST(800.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (72, 23, 50, CAST(52.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (73, 23, 500, CAST(470.00 AS Decimal(18, 2)), NULL, 1, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (74, 23, 1000, CAST(860.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (75, 24, 50, CAST(40.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (76, 24, 500, CAST(350.00 AS Decimal(18, 2)), NULL, 1, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (77, 24, 1000, CAST(620.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (78, 25, 50, CAST(40.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (79, 25, 500, CAST(350.00 AS Decimal(18, 2)), NULL, 1, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (80, 25, 1000, CAST(620.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (81, 26, 50, CAST(40.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (82, 26, 100, CAST(76.00 AS Decimal(18, 2)), NULL, 1, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (83, 26, 500, CAST(350.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (84, 26, 1000, CAST(620.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (85, 27, 50, CAST(38.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (86, 27, 500, CAST(330.00 AS Decimal(18, 2)), NULL, 1, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (87, 27, 1000, CAST(580.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (88, 28, 50, CAST(36.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (89, 28, 500, CAST(310.00 AS Decimal(18, 2)), NULL, 1, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (90, 28, 1000, CAST(540.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (91, 29, 50, CAST(36.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (92, 29, 500, CAST(310.00 AS Decimal(18, 2)), NULL, 1, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (93, 29, 1000, CAST(540.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (94, 30, 50, CAST(34.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (95, 30, 500, CAST(290.00 AS Decimal(18, 2)), NULL, 1, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (96, 30, 1000, CAST(500.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (97, 31, 50, CAST(32.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (98, 31, 500, CAST(270.00 AS Decimal(18, 2)), NULL, 1, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (99, 31, 1000, CAST(460.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (100, 32, 50, CAST(32.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (101, 32, 500, CAST(280.00 AS Decimal(18, 2)), NULL, 1, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (102, 32, 1000, CAST(480.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (103, 33, 50, CAST(32.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (104, 33, 150, CAST(90.00 AS Decimal(18, 2)), NULL, 1, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (105, 33, 500, CAST(270.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (106, 33, 1000, CAST(460.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (107, 34, 50, CAST(30.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (108, 34, 500, CAST(250.00 AS Decimal(18, 2)), NULL, 1, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (109, 34, 1000, CAST(420.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (110, 35, 100, CAST(72.00 AS Decimal(18, 2)), NULL, 1, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (111, 35, 500, CAST(350.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (112, 36, 20, CAST(10.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (113, 36, 12, CAST(10.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (114, 36, 50, CAST(37.00 AS Decimal(18, 2)), NULL, 1, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (115, 36, 150, CAST(100.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (116, 36, 500, CAST(320.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (117, 36, 1000, CAST(580.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (118, 37, 20, CAST(10.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (119, 37, 12, CAST(10.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (120, 37, 50, CAST(37.00 AS Decimal(18, 2)), NULL, 1, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (121, 37, 150, CAST(100.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (122, 37, 500, CAST(320.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (123, 37, 1000, CAST(580.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (124, 38, 30, CAST(10.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (125, 38, 150, CAST(65.00 AS Decimal(18, 2)), NULL, 1, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (126, 38, 750, CAST(270.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (127, 38, 1000, CAST(330.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (128, 39, 200, CAST(65.00 AS Decimal(18, 2)), NULL, 1, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (129, 39, 500, CAST(155.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (130, 40, 50, CAST(12.00 AS Decimal(18, 2)), NULL, 1, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (131, 40, 100, CAST(23.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (132, 40, 1000, CAST(200.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (133, 41, 50, CAST(25.00 AS Decimal(18, 2)), NULL, 1, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (134, 42, 50, CAST(22.00 AS Decimal(18, 2)), NULL, 1, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (135, 43, 15, CAST(20.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (136, 43, 50, CAST(60.00 AS Decimal(18, 2)), NULL, 1, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (137, 43, 500, CAST(550.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (138, 43, 1000, CAST(1020.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (139, 44, 50, CAST(43.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (140, 44, 100, CAST(85.00 AS Decimal(18, 2)), NULL, 1, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (141, 44, 1000, CAST(655.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (142, 45, 50, CAST(52.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (143, 45, 100, CAST(100.00 AS Decimal(18, 2)), NULL, 1, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (144, 45, 1000, CAST(825.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (145, 46, 25, CAST(20.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (146, 46, 100, CAST(78.00 AS Decimal(18, 2)), NULL, 1, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (147, 46, 500, CAST(330.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (148, 46, 1000, CAST(580.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (149, 47, 200, CAST(65.00 AS Decimal(18, 2)), NULL, 0, 1, 1)
GO
INSERT [dbo].[MastProductPackaging] ([ProductPackagingID], [ProductID], [WeightInGrams], [MRP], [Discount], [RecommendedPack], [InStock], [IsActive]) VALUES (150, 47, 500, CAST(155.00 AS Decimal(18, 2)), NULL, 1, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[MastProductPackaging] OFF
GO
SET IDENTITY_INSERT [dbo].[MastProducts] ON 

GO
INSERT [dbo].[MastProducts] ([ProductID], [ProductName], [ProductCategoryID], [ProductDescription], [ProductImagePath], [NewLaunch], [OurSpeciality], [MostPopular], [StarRating], [RelatedProducts], [InStock], [IsActive]) VALUES (1, N'Chilli Powder - Economic', 2, N'A fine-ground chilli powder that is a perfect blend of colour and pungency.', N'ProductImages/TemporaryImage.png', 0, 1, 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[MastProducts] ([ProductID], [ProductName], [ProductCategoryID], [ProductDescription], [ProductImagePath], [NewLaunch], [OurSpeciality], [MostPopular], [StarRating], [RelatedProducts], [InStock], [IsActive]) VALUES (2, N'Chilli Powder - Regular', 2, N'A fine-ground chilli powder that is a perfect blend of colour and pungency.', N'ProductImages/ChilliPowder.png', 0, 1, 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[MastProducts] ([ProductID], [ProductName], [ProductCategoryID], [ProductDescription], [ProductImagePath], [NewLaunch], [OurSpeciality], [MostPopular], [StarRating], [RelatedProducts], [InStock], [IsActive]) VALUES (3, N'Chilli Powder - Resham Patto', 2, N'A fine-ground chilli powder that is a perfect blend of colour and pungency.', N'ProductImages/ChilliPowerReshamPatto.png', 0, 1, 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[MastProducts] ([ProductID], [ProductName], [ProductCategoryID], [ProductDescription], [ProductImagePath], [NewLaunch], [OurSpeciality], [MostPopular], [StarRating], [RelatedProducts], [InStock], [IsActive]) VALUES (4, N'Chilli Powder - Kashmiri', 2, N'A fine-ground chilli powder that is a perfect blend of colour and pungency.', N'ProductImages/ChilliPowerKashmiri.png', 0, 1, 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[MastProducts] ([ProductID], [ProductName], [ProductCategoryID], [ProductDescription], [ProductImagePath], [NewLaunch], [OurSpeciality], [MostPopular], [StarRating], [RelatedProducts], [InStock], [IsActive]) VALUES (5, N'Dhanajeeru', 2, N'This ground coriander or cilantro powder is obtained from coriander seeds of the coriander plant.', N'ProductImages/DhanajeeruPowder.png', 0, 1, 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[MastProducts] ([ProductID], [ProductName], [ProductCategoryID], [ProductDescription], [ProductImagePath], [NewLaunch], [OurSpeciality], [MostPopular], [StarRating], [RelatedProducts], [InStock], [IsActive]) VALUES (6, N'Haldi', 2, N'A garden-fresh turmeric powder that has a golden-yellow colour. Known for its high carcumin (colour property) content.', N'ProductImages/HaldiPowder.png', 0, 1, 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[MastProducts] ([ProductID], [ProductName], [ProductCategoryID], [ProductDescription], [ProductImagePath], [NewLaunch], [OurSpeciality], [MostPopular], [StarRating], [RelatedProducts], [InStock], [IsActive]) VALUES (7, N'Rai', 1, N'', N'ProductImages/rai.png', 0, 1, 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[MastProducts] ([ProductID], [ProductName], [ProductCategoryID], [ProductDescription], [ProductImagePath], [NewLaunch], [OurSpeciality], [MostPopular], [StarRating], [RelatedProducts], [InStock], [IsActive]) VALUES (8, N'Jeera', 2, N'Mahalaxmi Jeera Powder gives a mouth-watering taste to all dishes and is loved by the western world for its versatility.', N'ProductImages/JeeraPowder.png', 0, 1, 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[MastProducts] ([ProductID], [ProductName], [ProductCategoryID], [ProductDescription], [ProductImagePath], [NewLaunch], [OurSpeciality], [MostPopular], [StarRating], [RelatedProducts], [InStock], [IsActive]) VALUES (9, N'Methi', 2, N'', N'ProductImages/methi.png', 0, 1, 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[MastProducts] ([ProductID], [ProductName], [ProductCategoryID], [ProductDescription], [ProductImagePath], [NewLaunch], [OurSpeciality], [MostPopular], [StarRating], [RelatedProducts], [InStock], [IsActive]) VALUES (10, N'Variyali', 1, N'', N'ProductImages/variyali.png', 0, 1, 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[MastProducts] ([ProductID], [ProductName], [ProductCategoryID], [ProductDescription], [ProductImagePath], [NewLaunch], [OurSpeciality], [MostPopular], [StarRating], [RelatedProducts], [InStock], [IsActive]) VALUES (11, N'Ajwain', 1, N'', N'ProductImages/ajwain.png', 0, 1, 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[MastProducts] ([ProductID], [ProductName], [ProductCategoryID], [ProductDescription], [ProductImagePath], [NewLaunch], [OurSpeciality], [MostPopular], [StarRating], [RelatedProducts], [InStock], [IsActive]) VALUES (12, N'Gorkeri - Aachar Masala', 4, N'', N'ProductImages/AacharMasala.png', 0, 1, 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[MastProducts] ([ProductID], [ProductName], [ProductCategoryID], [ProductDescription], [ProductImagePath], [NewLaunch], [OurSpeciality], [MostPopular], [StarRating], [RelatedProducts], [InStock], [IsActive]) VALUES (13, N'Whole Chilli', 1, N'', N'ProductImages/WholeChilli.png', 0, 1, 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[MastProducts] ([ProductID], [ProductName], [ProductCategoryID], [ProductDescription], [ProductImagePath], [NewLaunch], [OurSpeciality], [MostPopular], [StarRating], [RelatedProducts], [InStock], [IsActive]) VALUES (14, N'Cinnamon (Taj)', 1, N'', N'ProductImages/cinnamon.png', 0, 1, 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[MastProducts] ([ProductID], [ProductName], [ProductCategoryID], [ProductDescription], [ProductImagePath], [NewLaunch], [OurSpeciality], [MostPopular], [StarRating], [RelatedProducts], [InStock], [IsActive]) VALUES (15, N'Clove', 1, N'', N'ProductImages/clove.png', 0, 1, 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[MastProducts] ([ProductID], [ProductName], [ProductCategoryID], [ProductDescription], [ProductImagePath], [NewLaunch], [OurSpeciality], [MostPopular], [StarRating], [RelatedProducts], [InStock], [IsActive]) VALUES (16, N'Cardamom', 1, N'', N'ProductImages/cardamom.png', 0, 1, 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[MastProducts] ([ProductID], [ProductName], [ProductCategoryID], [ProductDescription], [ProductImagePath], [NewLaunch], [OurSpeciality], [MostPopular], [StarRating], [RelatedProducts], [InStock], [IsActive]) VALUES (17, N'Black Pepper', 1, N'', N'ProductImages/BlackPepper.png', 0, 1, 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[MastProducts] ([ProductID], [ProductName], [ProductCategoryID], [ProductDescription], [ProductImagePath], [NewLaunch], [OurSpeciality], [MostPopular], [StarRating], [RelatedProducts], [InStock], [IsActive]) VALUES (18, N'Big Cardamom - Elcha', 1, N'', N'ProductImages/BigCardamomElcha.png', 0, 1, 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[MastProducts] ([ProductID], [ProductName], [ProductCategoryID], [ProductDescription], [ProductImagePath], [NewLaunch], [OurSpeciality], [MostPopular], [StarRating], [RelatedProducts], [InStock], [IsActive]) VALUES (19, N'Whole Coriander - Dhana', 1, N'', N'ProductImages/WholeCorianderDhana.png', 0, 1, 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[MastProducts] ([ProductID], [ProductName], [ProductCategoryID], [ProductDescription], [ProductImagePath], [NewLaunch], [OurSpeciality], [MostPopular], [StarRating], [RelatedProducts], [InStock], [IsActive]) VALUES (20, N'Asafoetida', 2, N'', N'ProductImages/asafoetida.png', 0, 1, 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[MastProducts] ([ProductID], [ProductName], [ProductCategoryID], [ProductDescription], [ProductImagePath], [NewLaunch], [OurSpeciality], [MostPopular], [StarRating], [RelatedProducts], [InStock], [IsActive]) VALUES (21, N'Garam Masala', 3, N'', N'ProductImages/GaramMasala.png', 0, 1, 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[MastProducts] ([ProductID], [ProductName], [ProductCategoryID], [ProductDescription], [ProductImagePath], [NewLaunch], [OurSpeciality], [MostPopular], [StarRating], [RelatedProducts], [InStock], [IsActive]) VALUES (22, N'Tea Masala', 3, N'', N'ProductImages/TeaMasala.png', 0, 1, 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[MastProducts] ([ProductID], [ProductName], [ProductCategoryID], [ProductDescription], [ProductImagePath], [NewLaunch], [OurSpeciality], [MostPopular], [StarRating], [RelatedProducts], [InStock], [IsActive]) VALUES (23, N'Veg. Biriyani Masala', 3, N'', N'ProductImages/VegBiriyaniMasala.png', 0, 1, 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[MastProducts] ([ProductID], [ProductName], [ProductCategoryID], [ProductDescription], [ProductImagePath], [NewLaunch], [OurSpeciality], [MostPopular], [StarRating], [RelatedProducts], [InStock], [IsActive]) VALUES (24, N'Rajwadi Garam Masala', 3, N'', N'ProductImages/RajwadiGaramMasala.png', 0, 1, 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[MastProducts] ([ProductID], [ProductName], [ProductCategoryID], [ProductDescription], [ProductImagePath], [NewLaunch], [OurSpeciality], [MostPopular], [StarRating], [RelatedProducts], [InStock], [IsActive]) VALUES (25, N'Punjabi Gravy Masala', 3, N'', N'ProductImages/PunjabiGravyMasala.png', 0, 1, 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[MastProducts] ([ProductID], [ProductName], [ProductCategoryID], [ProductDescription], [ProductImagePath], [NewLaunch], [OurSpeciality], [MostPopular], [StarRating], [RelatedProducts], [InStock], [IsActive]) VALUES (26, N'Undhiya Masala', 3, N'', N'ProductImages/UndhiyaMasala.png', 0, 1, 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[MastProducts] ([ProductID], [ProductName], [ProductCategoryID], [ProductDescription], [ProductImagePath], [NewLaunch], [OurSpeciality], [MostPopular], [StarRating], [RelatedProducts], [InStock], [IsActive]) VALUES (27, N'Pavbhaji Masala', 3, N'', N'ProductImages/PavbhajiMasala.png', 0, 1, 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[MastProducts] ([ProductID], [ProductName], [ProductCategoryID], [ProductDescription], [ProductImagePath], [NewLaunch], [OurSpeciality], [MostPopular], [StarRating], [RelatedProducts], [InStock], [IsActive]) VALUES (28, N'Kitchenking Masala', 3, N'', N'ProductImages/KitchenkingMasala.png', 0, 1, 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[MastProducts] ([ProductID], [ProductName], [ProductCategoryID], [ProductDescription], [ProductImagePath], [NewLaunch], [OurSpeciality], [MostPopular], [StarRating], [RelatedProducts], [InStock], [IsActive]) VALUES (29, N'Kachhi Dabeli Masala', 3, N'', N'ProductImages/KachhiDabeli.png', 0, 1, 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[MastProducts] ([ProductID], [ProductName], [ProductCategoryID], [ProductDescription], [ProductImagePath], [NewLaunch], [OurSpeciality], [MostPopular], [StarRating], [RelatedProducts], [InStock], [IsActive]) VALUES (30, N'Panipuri Masala', 3, N'', N'ProductImages/PanipuriMasala.png', 0, 1, 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[MastProducts] ([ProductID], [ProductName], [ProductCategoryID], [ProductDescription], [ProductImagePath], [NewLaunch], [OurSpeciality], [MostPopular], [StarRating], [RelatedProducts], [InStock], [IsActive]) VALUES (31, N'Sambhar Masala', 3, N'', N'ProductImages/SambharMasala.png', 0, 1, 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[MastProducts] ([ProductID], [ProductName], [ProductCategoryID], [ProductDescription], [ProductImagePath], [NewLaunch], [OurSpeciality], [MostPopular], [StarRating], [RelatedProducts], [InStock], [IsActive]) VALUES (32, N'Chhole Masala', 3, N'', N'ProductImages/ChholeMasala.png', 0, 1, 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[MastProducts] ([ProductID], [ProductName], [ProductCategoryID], [ProductDescription], [ProductImagePath], [NewLaunch], [OurSpeciality], [MostPopular], [StarRating], [RelatedProducts], [InStock], [IsActive]) VALUES (33, N'Chat Masala', 3, N'', N'ProductImages/ChatMasala.png', 0, 1, 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[MastProducts] ([ProductID], [ProductName], [ProductCategoryID], [ProductDescription], [ProductImagePath], [NewLaunch], [OurSpeciality], [MostPopular], [StarRating], [RelatedProducts], [InStock], [IsActive]) VALUES (34, N'Sabji Masala', 3, N'', N'ProductImages/SabjiMasala.png', 0, 1, 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[MastProducts] ([ProductID], [ProductName], [ProductCategoryID], [ProductDescription], [ProductImagePath], [NewLaunch], [OurSpeciality], [MostPopular], [StarRating], [RelatedProducts], [InStock], [IsActive]) VALUES (35, N'Kasuri Methi', 2, N'', N'ProductImages/KasuriMethi.png', 0, 1, 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[MastProducts] ([ProductID], [ProductName], [ProductCategoryID], [ProductDescription], [ProductImagePath], [NewLaunch], [OurSpeciality], [MostPopular], [StarRating], [RelatedProducts], [InStock], [IsActive]) VALUES (36, N'Chicken Masala', 3, N'', N'ProductImages/ChickenMasala.png', 0, 1, 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[MastProducts] ([ProductID], [ProductName], [ProductCategoryID], [ProductDescription], [ProductImagePath], [NewLaunch], [OurSpeciality], [MostPopular], [StarRating], [RelatedProducts], [InStock], [IsActive]) VALUES (37, N'Mutton Masala', 3, N'', N'ProductImages/MuttonMasala.png', 0, 1, 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[MastProducts] ([ProductID], [ProductName], [ProductCategoryID], [ProductDescription], [ProductImagePath], [NewLaunch], [OurSpeciality], [MostPopular], [StarRating], [RelatedProducts], [InStock], [IsActive]) VALUES (38, N'Chhas Masala', 3, N'', N'ProductImages/ChhasMasala.png', 0, 1, 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[MastProducts] ([ProductID], [ProductName], [ProductCategoryID], [ProductDescription], [ProductImagePath], [NewLaunch], [OurSpeciality], [MostPopular], [StarRating], [RelatedProducts], [InStock], [IsActive]) VALUES (39, N'Aachar Masala', 4, N'', N'ProductImages/AacharMasala.png', 0, 1, 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[MastProducts] ([ProductID], [ProductName], [ProductCategoryID], [ProductDescription], [ProductImagePath], [NewLaunch], [OurSpeciality], [MostPopular], [StarRating], [RelatedProducts], [InStock], [IsActive]) VALUES (40, N'Chevda Masala', 3, N'', N'ProductImages/ChevdaMasala.png', 0, 1, 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[MastProducts] ([ProductID], [ProductName], [ProductCategoryID], [ProductDescription], [ProductImagePath], [NewLaunch], [OurSpeciality], [MostPopular], [StarRating], [RelatedProducts], [InStock], [IsActive]) VALUES (41, N'Mahalaxmi', 3, N'', N'ProductImages/TemporaryImage.png', 0, 1, 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[MastProducts] ([ProductID], [ProductName], [ProductCategoryID], [ProductDescription], [ProductImagePath], [NewLaunch], [OurSpeciality], [MostPopular], [StarRating], [RelatedProducts], [InStock], [IsActive]) VALUES (42, N'Shree Mahalaxmi', 3, N'', N'ProductImages/TemporaryImage.png', 0, 1, 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[MastProducts] ([ProductID], [ProductName], [ProductCategoryID], [ProductDescription], [ProductImagePath], [NewLaunch], [OurSpeciality], [MostPopular], [StarRating], [RelatedProducts], [InStock], [IsActive]) VALUES (43, N'Adadiya Masala', 3, N'', N'ProductImages/AdadiyaMasala.png', 0, 1, 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[MastProducts] ([ProductID], [ProductName], [ProductCategoryID], [ProductDescription], [ProductImagePath], [NewLaunch], [OurSpeciality], [MostPopular], [StarRating], [RelatedProducts], [InStock], [IsActive]) VALUES (44, N'Dry Ginger', 2, N'', N'ProductImages/dryginger.png', 0, 1, 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[MastProducts] ([ProductID], [ProductName], [ProductCategoryID], [ProductDescription], [ProductImagePath], [NewLaunch], [OurSpeciality], [MostPopular], [StarRating], [RelatedProducts], [InStock], [IsActive]) VALUES (45, N'Black Pepper', 2, N'', N'ProductImages/BlackPepperPowder.png', 0, 1, 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[MastProducts] ([ProductID], [ProductName], [ProductCategoryID], [ProductDescription], [ProductImagePath], [NewLaunch], [OurSpeciality], [MostPopular], [StarRating], [RelatedProducts], [InStock], [IsActive]) VALUES (46, N'Pizza Seasioning', 3, N'', N'ProductImages/PizzaSeasioning.png', 0, 1, 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[MastProducts] ([ProductID], [ProductName], [ProductCategoryID], [ProductDescription], [ProductImagePath], [NewLaunch], [OurSpeciality], [MostPopular], [StarRating], [RelatedProducts], [InStock], [IsActive]) VALUES (47, N'Gol Keri (Aachar Masala Mix)', 4, N'', N'ProductImages/GorkeriAacharMasala.png', 0, 1, 1, NULL, NULL, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[MastProducts] OFF
GO
INSERT [dbo].[Settings] ([OrderNumberSuffix]) VALUES (N'ISM-')
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'AVED (A=Add, V=View,E=Edit,D=Delete' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MastAdminUsers', @level2type=N'COLUMN',@level2name=N'RightsMastProductCategory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ISM-00001' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'OrderNumber'
GO
