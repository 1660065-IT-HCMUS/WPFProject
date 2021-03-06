IF EXISTS(SELECT NAME FROM SYS.DATABASES WHERE NAME = 'SanPhamDatabase')
DROP DATABASE SanPhamDatabase
GO
CREATE DATABASE SanPhamDatabase
GO
USE [SanPhamDatabase]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 05-Jun-19 12:22:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[IDCategory] [int] IDENTITY(1,1) NOT NULL,
	[NameCategory] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 05-Jun-19 12:22:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Tel] [int] NOT NULL,
	[FullName] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
 CONSTRAINT [PK_Table] PRIMARY KEY CLUSTERED 
(
	[Tel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 05-Jun-19 12:22:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[IDOrderDetail] [int] IDENTITY(1,1) NOT NULL,
	[PurchaseID] [int] NULL,
	[ProductID] [int] NULL,
	[PriceOrderDetail] [money] NULL,
	[QuantityOrderDetail] [int] NULL,
	[TotalOrderDetal] [money] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdateAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDOrderDetail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderState]    Script Date: 05-Jun-19 12:22:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderState](
	[Key] [nvarchar](50) NOT NULL,
	[Value] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 05-Jun-19 12:22:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[IDProduct] [int] IDENTITY(1,1) NOT NULL,
	[NameProduct] [nvarchar](max) NULL,
	[PriceProduct] [money] NULL,
	[QuantityProduct] [int] NULL,
	[ImageProduct] [varchar](max) NULL,
	[InfoProduct] [nvarchar](max) NULL,
	[CategoryID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Purchase]    Script Date: 05-Jun-19 12:22:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase](
	[IDPurchase] [int] IDENTITY(1,1) NOT NULL,
	[CustomerTel] [int] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdateAt] [datetime] NULL,
	[Total] [money] NULL,
	[Status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDPurchase] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([IDCategory], [NameCategory]) VALUES (1, N'Đồng Hồ')
INSERT [dbo].[Category] ([IDCategory], [NameCategory]) VALUES (2, N'Máy Đo Huyết Áp')
INSERT [dbo].[Category] ([IDCategory], [NameCategory]) VALUES (3, N'Nhiệt Kế')
INSERT [dbo].[Category] ([IDCategory], [NameCategory]) VALUES (4, N'Cân')
INSERT [dbo].[Category] ([IDCategory], [NameCategory]) VALUES (5, N'Máy Massage')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (1, 1, 3, 1950000.0000, 3, 5850000.0000, NULL, NULL)
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (15, 6, 19, 2500000.0000, 1, 2500000.0000, CAST(N'2019-05-22T23:03:34.593' AS DateTime), CAST(N'2019-05-22T23:03:34.593' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (16, 6, 16, 650000.0000, 1, 650000.0000, CAST(N'2019-05-22T23:03:34.593' AS DateTime), CAST(N'2019-05-22T23:03:34.593' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (17, 6, 17, 95000.0000, 1, 95000.0000, CAST(N'2019-05-22T23:03:34.593' AS DateTime), CAST(N'2019-05-22T23:03:34.593' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (18, 6, 23, 3200000.0000, 1, 3200000.0000, CAST(N'2019-05-22T23:03:34.593' AS DateTime), CAST(N'2019-05-22T23:03:34.593' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (20, 8, 2, 8190000.0000, 1, 8190000.0000, CAST(N'2019-05-23T13:40:05.320' AS DateTime), CAST(N'2019-05-23T13:40:05.320' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (21, 8, 3, 1950000.0000, 1, 1950000.0000, CAST(N'2019-05-23T13:40:05.353' AS DateTime), CAST(N'2019-05-23T13:40:05.353' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (22, 8, 7, 1120000.0000, 1, 1120000.0000, CAST(N'2019-05-23T13:40:05.353' AS DateTime), CAST(N'2019-05-23T13:40:05.353' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (23, 9, 3, 1950000.0000, 3, 5850000.0000, CAST(N'2019-05-24T21:44:20.250' AS DateTime), CAST(N'2019-05-24T21:44:20.250' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (24, 9, 4, 890000.0000, 2, 1780000.0000, CAST(N'2019-05-24T21:44:20.257' AS DateTime), CAST(N'2019-05-24T21:44:20.257' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (25, 9, 7, 1120000.0000, 2, 2240000.0000, CAST(N'2019-05-24T21:44:20.260' AS DateTime), CAST(N'2019-05-24T21:44:20.260' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (26, 10, 7, 1120000.0000, 4, 4480000.0000, CAST(N'2019-05-24T21:44:23.433' AS DateTime), CAST(N'2019-05-24T21:44:23.433' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (27, 11, 5, 3500000.0000, 5, 17500000.0000, CAST(N'2019-05-24T21:44:26.333' AS DateTime), CAST(N'2019-05-24T21:44:26.333' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (28, 12, 3, 1950000.0000, 1, 1950000.0000, CAST(N'2019-05-25T14:11:01.340' AS DateTime), CAST(N'2019-05-25T14:11:01.340' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (29, 12, 6, 890000.0000, 1, 890000.0000, CAST(N'2019-05-25T14:11:01.350' AS DateTime), CAST(N'2019-05-25T14:11:01.350' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (30, 12, 7, 1120000.0000, 1, 1120000.0000, CAST(N'2019-05-25T14:11:01.350' AS DateTime), CAST(N'2019-05-25T14:11:01.350' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (31, 12, 5, 3500000.0000, 1, 3500000.0000, CAST(N'2019-05-25T14:11:01.350' AS DateTime), CAST(N'2019-05-25T14:11:01.350' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (32, 13, 4, 890000.0000, 1, 890000.0000, CAST(N'2019-05-25T14:12:24.863' AS DateTime), CAST(N'2019-05-25T14:12:24.863' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (33, 13, 3, 1950000.0000, 1, 1950000.0000, CAST(N'2019-05-25T14:12:24.917' AS DateTime), CAST(N'2019-05-25T14:12:24.917' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (34, 14, 2, 8190000.0000, 1, 8190000.0000, CAST(N'2019-05-25T14:35:54.503' AS DateTime), CAST(N'2019-05-25T14:35:54.503' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (35, 14, 3, 1950000.0000, 13, 25350000.0000, CAST(N'2019-05-25T14:35:54.550' AS DateTime), CAST(N'2019-05-25T14:35:54.550' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (36, 14, 4, 890000.0000, 3, 2670000.0000, CAST(N'2019-05-25T14:35:54.553' AS DateTime), CAST(N'2019-05-25T14:35:54.553' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (37, 14, 7, 1120000.0000, 4, 4480000.0000, CAST(N'2019-05-25T14:35:54.553' AS DateTime), CAST(N'2019-05-25T14:35:54.553' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (38, 14, 6, 890000.0000, 2, 1780000.0000, CAST(N'2019-05-25T14:35:54.553' AS DateTime), CAST(N'2019-05-25T14:35:54.553' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (39, 15, 4, 890000.0000, 4, 3560000.0000, CAST(N'2019-05-26T02:10:16.900' AS DateTime), CAST(N'2019-05-26T02:10:16.900' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (40, 15, 5, 3500000.0000, 1, 3500000.0000, CAST(N'2019-05-26T02:10:16.930' AS DateTime), CAST(N'2019-05-26T02:10:16.930' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (41, 15, 3, 1950000.0000, 22, 42900000.0000, CAST(N'2019-05-26T02:10:16.933' AS DateTime), CAST(N'2019-05-26T02:10:16.933' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (42, 16, 3, 1950000.0000, 4, 7800000.0000, CAST(N'2019-05-26T02:30:58.297' AS DateTime), CAST(N'2019-05-26T02:30:58.297' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (43, 17, 5, 3500000.0000, 1, 3500000.0000, CAST(N'2019-05-26T02:32:16.683' AS DateTime), CAST(N'2019-05-26T02:32:16.683' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (44, 18, 3, 1950000.0000, 1, 1950000.0000, CAST(N'2019-05-26T02:34:38.693' AS DateTime), CAST(N'2019-05-26T02:34:38.693' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (45, 18, 4, 890000.0000, 5, 4450000.0000, CAST(N'2019-05-26T02:34:38.723' AS DateTime), CAST(N'2019-05-26T02:34:38.723' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (46, 18, 5, 3500000.0000, 2, 7000000.0000, CAST(N'2019-05-26T02:34:38.723' AS DateTime), CAST(N'2019-05-26T02:34:38.723' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (47, 19, 10, 900000.0000, 3, 2700000.0000, CAST(N'2019-05-26T02:47:12.203' AS DateTime), CAST(N'2019-05-26T02:47:12.203' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (48, 20, 7, 1120000.0000, 5, 5600000.0000, CAST(N'2019-05-26T02:48:17.107' AS DateTime), CAST(N'2019-05-26T02:48:17.107' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (49, 21, 3, 1950000.0000, 2, 3900000.0000, CAST(N'2019-05-26T02:50:53.550' AS DateTime), CAST(N'2019-05-26T02:50:53.550' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (50, 22, 5, 3500000.0000, 2, 7000000.0000, CAST(N'2019-05-26T02:51:26.413' AS DateTime), CAST(N'2019-05-26T02:51:26.413' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (51, 23, 3, 1950000.0000, 2, 3900000.0000, CAST(N'2019-05-26T02:52:54.880' AS DateTime), CAST(N'2019-05-26T02:52:54.883' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (52, 24, 10, 900000.0000, 4, 3600000.0000, CAST(N'2019-05-26T03:16:48.927' AS DateTime), CAST(N'2019-05-26T03:16:48.927' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (53, 25, 21, 290000.0000, 1, 290000.0000, CAST(N'2019-05-26T03:25:16.613' AS DateTime), CAST(N'2019-05-26T03:25:16.613' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (54, 25, 10, 900000.0000, 1, 900000.0000, CAST(N'2019-05-26T03:25:16.620' AS DateTime), CAST(N'2019-05-26T03:25:16.620' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (55, 25, 12, 800000.0000, 1, 800000.0000, CAST(N'2019-05-26T03:25:16.620' AS DateTime), CAST(N'2019-05-26T03:25:16.620' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (56, 25, 15, 800000.0000, 1, 800000.0000, CAST(N'2019-05-26T03:25:16.620' AS DateTime), CAST(N'2019-05-26T03:25:16.620' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (57, 26, 3, 1950000.0000, 2, 3900000.0000, CAST(N'2019-05-26T03:30:58.687' AS DateTime), CAST(N'2019-05-26T03:30:58.687' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (58, 27, 3, 1950000.0000, 2, 3900000.0000, CAST(N'2019-05-26T03:32:13.507' AS DateTime), CAST(N'2019-05-26T03:32:13.507' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (59, 28, 4, 890000.0000, 3, 2670000.0000, CAST(N'2019-05-26T03:34:46.323' AS DateTime), CAST(N'2019-05-26T03:34:46.323' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (60, 29, 3, 1950000.0000, 5, 9750000.0000, CAST(N'2019-05-28T14:53:19.793' AS DateTime), CAST(N'2019-05-28T14:53:19.793' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (61, 29, 5, 3500000.0000, 4, 14000000.0000, CAST(N'2019-05-28T14:53:19.840' AS DateTime), CAST(N'2019-05-28T14:53:19.840' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (62, 30, 2, 8190000.0000, 5, 40950000.0000, CAST(N'2019-05-28T14:59:15.880' AS DateTime), CAST(N'2019-05-28T14:59:15.880' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (63, 31, 11, 1850000.0000, 2, 3700000.0000, CAST(N'2019-05-28T15:21:07.153' AS DateTime), CAST(N'2019-05-28T15:21:07.153' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (64, 31, 12, 800000.0000, 3, 2400000.0000, CAST(N'2019-05-28T15:21:07.163' AS DateTime), CAST(N'2019-05-28T15:21:07.163' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (65, 31, 16, 650000.0000, 1, 650000.0000, CAST(N'2019-05-28T15:21:07.163' AS DateTime), CAST(N'2019-05-28T15:21:07.163' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (66, 32, 10, 900000.0000, 2, 1800000.0000, CAST(N'2019-05-28T15:37:07.267' AS DateTime), CAST(N'2019-05-28T15:37:07.267' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (67, 32, 11, 1850000.0000, 3, 5550000.0000, CAST(N'2019-05-28T15:37:07.277' AS DateTime), CAST(N'2019-05-28T15:37:07.277' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (68, 32, 15, 800000.0000, 1, 800000.0000, CAST(N'2019-05-28T15:37:07.277' AS DateTime), CAST(N'2019-05-28T15:37:07.277' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (69, 32, 6, 890000.0000, 2, 1780000.0000, CAST(N'2019-05-28T15:37:07.277' AS DateTime), CAST(N'2019-05-28T15:37:07.277' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (70, 32, 27, 440000.0000, 2, 880000.0000, CAST(N'2019-05-28T15:37:07.277' AS DateTime), CAST(N'2019-05-28T15:37:07.277' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (71, 33, 2, 8190000.0000, 3, 24570000.0000, CAST(N'2019-06-03T14:31:00.557' AS DateTime), CAST(N'2019-06-03T14:31:00.557' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (72, 34, 2, 8190000.0000, 4, 32760000.0000, CAST(N'2019-06-03T14:33:01.513' AS DateTime), CAST(N'2019-06-03T14:33:01.513' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (73, 35, 3, 1950000.0000, 3, 5850000.0000, CAST(N'2019-06-03T15:02:10.037' AS DateTime), CAST(N'2019-06-03T15:02:10.037' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (74, 35, 2, 8190000.0000, 2, 16380000.0000, CAST(N'2019-06-03T15:02:10.070' AS DateTime), CAST(N'2019-06-03T15:02:10.070' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (75, 35, 4, 890000.0000, 4, 3560000.0000, CAST(N'2019-06-03T15:02:10.070' AS DateTime), CAST(N'2019-06-03T15:02:10.070' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (76, 35, 5, 3500000.0000, 2, 7000000.0000, CAST(N'2019-06-03T15:02:10.070' AS DateTime), CAST(N'2019-06-03T15:02:10.070' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (77, 36, 4, 890000.0000, 3, 2670000.0000, CAST(N'2019-06-03T15:05:03.063' AS DateTime), CAST(N'2019-06-03T15:05:03.063' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (78, 36, 2, 8190000.0000, 3, 24570000.0000, CAST(N'2019-06-03T15:05:03.097' AS DateTime), CAST(N'2019-06-03T15:05:03.097' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (79, 37, 4, 890000.0000, 2, 1780000.0000, CAST(N'2019-06-04T12:33:34.793' AS DateTime), CAST(N'2019-06-04T12:33:34.793' AS DateTime))
INSERT [dbo].[OrderDetail] ([IDOrderDetail], [PurchaseID], [ProductID], [PriceOrderDetail], [QuantityOrderDetail], [TotalOrderDetal], [CreatedAt], [UpdateAt]) VALUES (80, 37, 5, 3500000.0000, 1, 3500000.0000, CAST(N'2019-06-04T12:33:34.827' AS DateTime), CAST(N'2019-06-04T12:33:34.827' AS DateTime))
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
INSERT [dbo].[OrderState] ([Key], [Value]) VALUES (N'Cancelled', 3)
INSERT [dbo].[OrderState] ([Key], [Value]) VALUES (N'Complete', 2)
INSERT [dbo].[OrderState] ([Key], [Value]) VALUES (N'New', 1)
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([IDProduct], [NameProduct], [PriceProduct], [QuantityProduct], [ImageProduct], [InfoProduct], [CategoryID]) VALUES (2, N'Apple Watch Series 3 GPS ', 8190000.0000, 15, N'0390a6b0-607c-443e-a0f0-de09a84dc08a.jpeg', N'Đồng Hồ Thông Minh Apple Watch Series 3 GPS Space Gray Aluminum Case With Black Sport Band sở hữu thiết kế sang trọng, đẳng cấp với những cạnh bo tròn mềm mại, tinh tế kết hợp dây đeo chắc chắn, mạnh mẽ giúp tự tin thể hiện đẳng cấp. Không chỉ sở hữu vẻ đẹp tinh tế, nổi bật Apple Watch Series 3 còn gây ấn tượng với những chức năng thông minh, tiện dụng đáp ứng tối đa nhu cầu giải trí, tập luyện, giải quyết công việc của bạn mọi lúc, mọi nơi.
Thiết bị có thể kết nối dễ dàng, nhanh chóng với iPhone giúp bạn có thể nhận mọi thông báo như nhận cuộc gọi, nhắn tin, trả lời email, cập nhật từ mạng xã hội...trực tiếp từ Apple Watch Series 3 không cần mang theo iPhone. Tính năng này giúp bạn không bỏ lỡ bất kỳ thông báo, cuộc gọi quan trọng khi tham gia tập luyện thể dục, thể thao hay đang lái xe. Đặc biệt, bộ xử lý kép kết hợp với bộ vi xử lý đồ họa mạnh mẽ giúp Apple Watch xử lý các tác vụ nhanh chóng, mượt mà.
', 1)
INSERT [dbo].[Product] ([IDProduct], [NameProduct], [PriceProduct], [QuantityProduct], [ImageProduct], [InfoProduct], [CategoryID]) VALUES (3, N'Xiaomi Amazfit Bip', 1950000.0000, 10, N'53aacd09-2443-496b-877e-93339097af8f.jpg', N'Đồng hồ thông minh thế hệ mới Xiaomi Amazfit Bip (Bit Pace) có tính năng phục vụ theo dõi sức khỏe như đo nhịp tim, theo dõi giấc ngủ hàng ngày. Bạn có thể sử dụng đồng hồ thông minh Xiaomi Amazfit Bip để theo dõi quá trình tập luyện thể dục thể thao như chạy bộ, đạp xe, bơi lội...
Sử dụng đồng hồ thông minh giúp quản lý cuộc gọi khi có người gọi đến, xem thông tin cuộc gọi, hủy cuộc gọi, có thể xem được trực tiếp tin nhắn hiển thị trên mặt đồng hồ. Xiaomi Amazfit BIP Youth Version tương thích với các điện thoại thông minh sử dụng hệ điều hành Android4.4 hoặc IOS8 trở lên (IPhone), bạn có thể linh động sử dụng
Ngoài điều hành trên điện thoại, đồng hồ thông minh kết nối với điện thoại theo chuẩn Bluetooth 4.0 mới nhất. Đặc biệt điện thoại thông minh Xiaomi còn hỗ trợ GPS vẽ đoạn đường vừa tập, vừa chạy lúc đi tập sẽ không cần phải mang theo điện thoại.
Đồng hồ thông minh có thể đo nhịp tim động tĩnh, đo nhịp tim liên tục trong cả buổi tập hay lần tập cho kết quả chính xác. Thiết bị có hỗ trợ Glonass được sử dụng cho vận động viên chuyên nghiệp, có thể phân tích quá trình tập luyện dựa vào dữ liệu thu thập để đưa ra những đánh giá tổng quan.
Màn hình cảm ứng 28 inch, độ phân giải 176 x 176 pixel, kính cường lực chống xước Corning Gorilla sang trọng. Sử dụng công nghệ phản chiếu ánh sáng cho độ hiển thị rõ ràng sắc nét ngoài trời, ánh sáng nền tự động điều chỉnh tuỳ thuộc vào môi trường.

Dung lượng pin 190mah cho thời gian sử dụng hỗn hợp đến 45 ngày. Nếu sử dụng như chiếc đồng hồ đeo tay để xem giờ thì có thể sử dụng trong 4 tháng. Nếu bật chế độ GPS liên tục theo dõi thì sử dụng được 22 giờ đủ để người dùng thoải mái sử dụng cho các nhu cầu làm việc, tập luyện, giải trí trọn vẹn một ngày.', 1)
INSERT [dbo].[Product] ([IDProduct], [NameProduct], [PriceProduct], [QuantityProduct], [ImageProduct], [InfoProduct], [CategoryID]) VALUES (4, N'Xiaomi Mi Band 3', 890000.0000, 10, N'2dda3df3-8bca-4e57-b947-3d0df68a66e6.jpg', N'Vòng Đeo Tay Thông Minh Theo Dõi Vận Động Xiaomi Mi Band 3 tương tự như Xiaomi Mi Band 2 bao gồm màn hình OLED và dây đeo làm từ cao su tổng hợp. Điểm khác biệt duy nhất đó là màn hình OLED được làm cong 2,5D giúp khả năng vuốt chạm dễ dàng hơn. Trong khi đó, thành dây của Mi Band 3 được làm rộng và mỏng hơn, độ mịn cũng được cải thiện, mang lại cảm giác đeo rất thoải mái trong thời gian dài.
Mi Band 3 được trang bị màn hình OLED có kích thước 0.78 inch với độ phân giải 128x80 pixel giúp hiển thị thông tin như đồng hồ, nhịp tim, số bước chân trong ngày… Đặc biệt, Xiaomi Mi Band 3 có dạng cảm ứng để hỗ trợ các thao tác dựa trên cử chỉ như vuốt lên và xuống để chuyển đổi các chức năng, còn trượt sang trái và phải để duyệt các mục.
Mi Fit là ứng dụng chính chủ của Xiaomi giúp ghép nối thiết bị vòng đeo tay thông minh Mi Band với các thiết bị smartphone để theo dõi các thông số về sức khoẻ, cài đặt báo thức hay lên lị Khi cài đặt ứng dụng Mi Fit trên smartphone và kết nối với Mi Band 3, ứng dụng này sẽ ghi nhận lại những thông tin sức khoẻ thu thập được từ chiếc vòng Mi Band 3 như nhịp tim, số bước chân, lượng calo tiêu thụ hay tình trạng giấc ngủ Từ đó, người dùng có thể có những điều chỉnh hợp lý nhất cho việc chăm sóc và giữ gìn sức khoẻ.', 1)
INSERT [dbo].[Product] ([IDProduct], [NameProduct], [PriceProduct], [QuantityProduct], [ImageProduct], [InfoProduct], [CategoryID]) VALUES (5, N'Xiaomi Amazfit Pace', 3500000.0000, 10, N'afb15c4d-3738-46af-be5c-82e3fe7ee4d2.jpg', N'Đồng hồ thông minh của Xiaomi được thiết kế theo phong cách thể thao và cổ điển với mặt đồng hồ tròn và xung quanh của đồng hồ cũng được vát tròn, đây là dòng sản phẩm được thiết kế hướng đến đối tượng người sử dụng thích chơi thể thao đặc biệt là chạy bộ
Xiaomi Amazfit sử dụng dây silicon màu đen, nhà sản xuất khoét nhiều khe hở trên đó, vừa là gài chốt khi đeo, vừa để thoát khí và mồ hôi nếu chúng ta chạy bộ lâu. Mặt sau của đồng hồ là 4 chấu sạc và cảm biến nhịp tim, Amazfit sử dụng một bộ sạc gắn chặt vào đồng hồ chứ không phải là sạc không dây.
Về phần mềm, Amazfit không chạy Android Wear mà là phần mềm được Xiaomi làm riêng, nó khá đơn giản. Từ giao diện đồng hồ chính, bạn vuốt qua trái/phải và trên/dưới để chuyển qua các màn hình, tính năng khác nhau. Để thay đổi giao diện đồng hồ bạn phải thực hiện trên smartphone chứ Amazfit không cho thực hiện trực tiếp trên đó (có sẵn 10 mặt đồng hồ). Vuốt qua phải sẽ đưa bạn vào màn hình chuyên cho chạy bộ với các thông tin trên đó, vuốt qua trái sẽ là các tính năng đo nhịp tim, thông báo, la bàn...
Về cấu hình, đồng hồ này được Xiaomi trang bị cho màn hình kích thước 1"3 độ phân giải 300 x 300 điểm ảnh, CPU 1.2GHz, RAM 512MB và bộ nhớ trong 4GB, pin 200mAh. Đồng hồ được tích hợp sẵn GPS để theo dõi quá trình chạy bộ của chúng ta và cũng có thể chống nước.
', 1)
INSERT [dbo].[Product] ([IDProduct], [NameProduct], [PriceProduct], [QuantityProduct], [ImageProduct], [InfoProduct], [CategoryID]) VALUES (6, N'Máy đo huyết áp bắp tay tự động HEM-8712', 890000.0000, 10, N'2cda7318-4577-4cb7-9258-632f0ee0051a.jpg', N'Hem-8712 thiết kế nhỏ gọn tiện lợi để có thể mang theo mọi nơi nhờ sử dụng pin AA 1.5V. Hơn nữa cách sử dụng đơn giản và cấu hình thân thiện với tất cả mọi người sẽ giúp bạn sử dụng máy một cách dễ dàng
Được trang bị màn hình rộng thoáng, các chữ số hiển thị rõ ràng. Màn hình máy hiển thị đầy đủ kết quả đo huyết áp tối đa, tối thiểu và nhịp tim
Omron Hem-8712 ứng dụng công nghệ Intellisense mới cho kết quả chính xác cao, tự động bơm và xả khí. Có đèn chỉ dẫn cách quấn vòng bít đúng, báo lỗi cử động người khi đo
Omron Hem-8712 có biểu tượng cảnh báo huyết áp cao khi vượt ngưỡng 135/85 giúp người đo dễ dàng biết được tình trạng huyết áp để có phản ứng, giải quyết kịp thời.
', 2)
INSERT [dbo].[Product] ([IDProduct], [NameProduct], [PriceProduct], [QuantityProduct], [ImageProduct], [InfoProduct], [CategoryID]) VALUES (7, N'Máy đo huyết áp bắp tay tự động Omron HEM-7121', 1120000.0000, 10, N'664381a9-8fd4-49a6-94e0-609ddb816cac.jpg', N'Máy đo huyết áp bắp tay Omron HEM-7121 có màu trắng sang trọng với thân máy bằng nhựa cho độ bền cao, sáng bóng dễ vệ sinh. Máy đo huyết áp sử dụng công nghệ Intellisense mới, đo tự động, cho kết quả chính xác cao, có đèn chỉ dẫn cách quấn vòng bít đúng, báo lỗi cử động người và nhịp tim bất thường khi đo. Máy có biểu tượng báo huyết áp cao hiển thị sau quá trình đo giúp người bệnh biết được mức huyết áp và uống thuốc kịp thời
Với bộ nhớ lưu đến 30 kết quả đo, máy đo huyết áp Omron HEM-7121 giúp bạn dễ dàng so sánh kết quả các lần đo khác nhau để biết được tình hình huyết áp của mình và có những điều chỉnh kịp thời trong chế độ ăn uống, nghỉ ngơi và tập luyện.

Omron HEM-7121 có thết kế nhỏ gọn và rất dễ sử dụng. Bạn có thể tự đo tại nhà cho bản thân và những người trong gia đình mà không cần phải nhờ đến sự gúp đỡ của bác sĩ như trước đây nữa.
Với máy đo huyết áp tự động Omron HEM-7121, bạn có thể kiểm tra huyết áp một cách nhanh chóng và đơn giản. Công nghệ đo tự động sẽ giúp bạn biết được chỉ số huyết áp và nhịp tim của mình trong tích tắc
', 2)
INSERT [dbo].[Product] ([IDProduct], [NameProduct], [PriceProduct], [QuantityProduct], [ImageProduct], [InfoProduct], [CategoryID]) VALUES (8, N'Máy đo huyết áp điện tử tự động CH-650', 750000.0000, 10, N'388113a1-9258-4e23-bb41-d0862ca00f59.jpg', N'Máy đo huyết áp điện tử Citizen CH-650 là thiết bị đo huyết áp cổ tay hoàn toàn tự động, sử dụng phương pháp dao động kế cho kết quả rất chính xác. Kết quả về các chỉ số huyết áp tối đa, huyết áp tối thiểu và nhịp tim sẽ được hiển thị lên màn hình LCD rất dễ quan sát
Máy đo huyết áp điện tử cổ tay Citizen CH-650 có thể báo nhịp tim bất thường, báo pin yếu, có hộp đựng tiện lợi, máy đo được thiết kế hiện đại. Đặc biệt máy tự động tắt nguồn khi không sử dụng, được thiết kế gọn nhẹ, dễ dàng mang theo khi đi xa
Citizen CH-650 trang bị bộ nhớ với 90 kết quả, có thể tính được chỉ số trung bình của 3 lần đo gần nhất giúp người dùng dễ dàng so sánh và theo dõi tình hình sức khỏe, từ đó có sự điều chỉnh hợp lý trong chế độ ăn uống, luyện tập và nghỉ ngơi
', 2)
INSERT [dbo].[Product] ([IDProduct], [NameProduct], [PriceProduct], [QuantityProduct], [ImageProduct], [InfoProduct], [CategoryID]) VALUES (10, N'Máy đo huyết áp bắp tay Beurer BM-35', 900000.0000, 10, N'bc4039d3-28cc-4b5b-a669-605686f78db4.jpg', N'bắp tay Beurer BM-35 sẽ giúp bảo vệ sức khỏe tối ưu cho các thành viên trong gia đình bạn. Máy có chế độ tự động đo huyết áp, bộ nhớ dành cho 2 người, lưu trữ 120 kết quả cùng ngày, giờ đo, cho kết quả chính xác. Ngoài ra, máy còn có cảnh báo loạn nhịp tim, tự ngắt khi ngưng sử dụng.
Beurer BM35 có kích thước rất nhỏ gọn, trọng lượng nhẹ nên bạn có thể đo huyết áp thường xuyên, mọi nơi, mọi lúc. Máy đo huyết áp tại nhà có thiết kế đẹp, màu sắc thanh lịch, thân thiện với mọi nhà
có màn hình rộng, hiển thị kết quả rõ nét trên nền trắng sáng về huyết áp tối đa, huyết áp tối thiểu, nhịp tim
Máy đo huyết áp bắp tay Beurer BM35 có thể sử dụng cho 2 người với bộ nhớ lưu trữ 60 kết quả/người cùng thời gian đo. Sản phẩm có tính năng tính giá trị trung bình kết quả đo buổi sáng và buổi tối của 7 ngày đo gần nhất
Dựa trên kết quả đo thực tế, máy đo huyết áp bắp tay sẽ cảnh báo nếu bạn có hiện tượng rối loạn nhịp tim, giúp bạn nhanh chóng nắm bắt được sức khỏe tim mạch, có biện pháp để phòng tránh và điều trị sớm
Với công nghệ tiên tiến nhất thế giới, sản phẩm được trang bị những sensor cảm biến với độ chính xác tuyệt đối, cho kết quả đo huyết áp chính xác khiến bạn hoàn toàn yên tâm về thông số kết quả

', 2)
INSERT [dbo].[Product] ([IDProduct], [NameProduct], [PriceProduct], [QuantityProduct], [ImageProduct], [InfoProduct], [CategoryID]) VALUES (11, N'Máy đo huyết áp bắp tay Beurer BM-58', 1850000.0000, 10, N'b97e6a3f-35b5-4a00-a5bd-aff863489ac7.jpg', N'Với máy đo huyết áp điện tử Beurer BM-58 (CHLB Đức) bạn có thể tự kiểm tra huyết áp của mình một cách nhanh chóng và dễ dàng. Chỉ cần nhấn nút, máy sẽ tự động điều chỉnh áp suất bơm hơi dựa trên cỡ tay và các dao động huyết áp, đồng thời lựa chọn tốc độ xả hơi lý tưởng, giảm thiểu những khó chịu khi đo huyết áp. Đặc biệt, máy có chức năng phát hiện chứng loạn nhịp tim, phân loại huyết áp dựa trên những chỉ tiêu huyết áp của WHO đã được cài sẵn trong máy
', 2)
INSERT [dbo].[Product] ([IDProduct], [NameProduct], [PriceProduct], [QuantityProduct], [ImageProduct], [InfoProduct], [CategoryID]) VALUES (12, N'Nhiệt kế đo trán hồng ngoại Microlife FR1MF1', 800000.0000, 10, N'3d18e2e5-2884-48f2-9fed-9b2649b2279d.jpg', N'Nhiệt kế điện tử Microlife FR1MF1 được thiết kế sang trọng, nhỏ gọn, dễ dàng cất giữ và mang theo khi đi du lịch. Nhiệt kế sử dụng 2 pin AA dễ dàng thay thế. Ngoài ra, các nút chức năng được bố trí khá hợp lý cùng màn hình LCD lớn giúp hiển thị thông số rõ ràng hơn cho người dùng.
Độ chính xác của nhiệt kế đã được kiểm nghiệm lâm sàng tại Châu Âu và được các bác sỹ khuyên dùng. Các chức năng của máy được thể hiện rõ ràng, đầy đủ ngay trên thân máy, dễ dàng sử dụng, thích hợp cho mọi gia đình. Chưa hết, với công nghệ cảm ứng nhiệt hồng ngoại vùng trán thông minh không cần chạm, máy sẽ cho kết quả nhanh và chính xác trong 1 giây, sai số nhỏ chỉ 0,2 độ C
', 3)
INSERT [dbo].[Product] ([IDProduct], [NameProduct], [PriceProduct], [QuantityProduct], [ImageProduct], [InfoProduct], [CategoryID]) VALUES (14, N'Nhiệt kế điện tử Citizen CTA 302', 90000.0000, 10, N'2b4977b3-ea2d-4f99-94ce-340483e4d59a.jpg', N'Citizen CTA 302 được làm bằng chất liệu nhựa cao cấp cho độ bền cao. Bề mặt trơn nhẵn không thấm nước
Citizen CTA 302 đo nhiệt độ cơ thể ở các vị trí: nách - miệng - hậu môn
CTA-302 cho kết quả đo thân nhiệt với độ chính xác cao. Nếu nhiệt độ quá 37.5 độ C nhiệt kế sẽ phát ra tiếng bíp kéo dài trong 4 giây
Bộ nhớ lưu kết quả đo gần nhất
Có tiếng "bíp" cảnh báo sốt
Chức năng tự động tắt nguồn giúp tiết kiệm pin.
', 3)
INSERT [dbo].[Product] ([IDProduct], [NameProduct], [PriceProduct], [QuantityProduct], [ImageProduct], [InfoProduct], [CategoryID]) VALUES (15, N'Nhiệt kế hồng ngoại đo trán Polygreen KI-8280', 800000.0000, 10, N'd5742f14-621f-43fa-9599-74933469df9a.jpg', N'đo nhiệt độ ở trán mà không cần tiếp xúc, khoảng cách đo từ 3 - 5cm giúp bạn tránh được các bệnh truyền nhiễm từ người khác. Đây chính là là lựa chọn lý tưởng cho các gia đình có trẻ nhỏ vì có thể đo thân nhiệt ngay cả khi trẻ đang ngủ và không gây sợ hãi cho trẻ khi kiểm tra thân nhiệt.
thiết kế cấu trúc đầu dò độc đáo kết hợp cùng cảm biến hồng ngoại tiên tiến và tầm đo rộng giúp đo nhiệt độ cơ thể cho kết quả nhanh chỉ sau 1 - 3 giây
có thể đo nhiệt độ nhiều vật thể khác thông qua bề mặt mà không cần chạm đến vật thể nhưng vẫn đưa ra kết quả thật chính xác và đáng tin cậy.
được làm từ chất liệu nhựa cao cấp cho độ bền cao. Nhiệt kế hồng ngoại Polygreen đạt tiêu chuẩn: ISO 13485, EN 12470-3, IEC60601-1, ASTM E 11965-98 nên sử dụng an toàn cho trẻ sơ sinh và trẻ nhỏ
được tích hợp chức năng phát cảnh báo khi có dấu hiệu sốt cao (từ 37.5 độ C trở lên) giúp bạn phát hiện và có biện pháp chữa trị kịp thời để tránh các biến chứng nguy hiểm
tự động tắt sau 60 giây không sử dụng để tiết kiệm năng lượng. Sản phẩm lưu được kết quả của 10 lần đo gần nhất giúp bạn tiện so sánh và theo dõi kết quả
', 3)
INSERT [dbo].[Product] ([IDProduct], [NameProduct], [PriceProduct], [QuantityProduct], [ImageProduct], [InfoProduct], [CategoryID]) VALUES (16, N'Nhiệt kế đo trán Uright TD1119', 650000.0000, 10, N'b9d09542-555e-4e77-be35-104314a88e30.jpg', N'Uright TD1119 là chiếc nhiệt kế điện tử lý tưởng dùng cho gia đình, phòng khám, bệnh viện. Nhiệt kế Uright TD1119 ứng dụng phương pháp đo bức xạ hồng ngoại để kiểm tra thân nhiệt ở trán. Ánh sáng hồng ngoại cực kỳ an toàn cho sức khỏe, cho kết quả đo vô cùng chính xác.
có khoảng đo từ 32 - 43 độ C, có chức năng cảnh báo sốt, có thông báo pin yếu. Nhiệt kế Uright thiết kế màn hình LCD lớn giúp hiển thị kết quả đo nhiệt độ rõ ràng, dễ nhìn. Màn hình màu giúp bạn có thể đo nhiệt độ cho bé vào ban đêm dễ dàng. 
Bộ nhớ tự động lưu lại kết quả của 10 lần đo cuối cùng, giúp người dùng hay bác sĩ dễ dàng tham khảo khi cần thiết. Nhiệt kế đo trán Uright sử dụng 1 pin CR2032 (3V) có tuổi thọ sử dụng tới 5.000 lần đo. Khi không sử dụng máy sẽ tự động tắt sau 1 phút giúp tiết kiệm pin tối đa
Máy cho tốc độ nhanh và chính xác. Độ chính xác của nhiệt kế đạt chuẩn ASTM EI965-98 và 93/42EEC. Khi đo xong máy sẽ có âm thanh bíp giúp người dùng dễ nhận biết.
Thân máy được làm từ nhựa cao cấp, bền bỉ, an toàn cho làn da của bé. Kiểu dáng máy nhỏ gọn dễ mang theo khi đi chơi xa
', 3)
INSERT [dbo].[Product] ([IDProduct], [NameProduct], [PriceProduct], [QuantityProduct], [ImageProduct], [InfoProduct], [CategoryID]) VALUES (17, N'Nhiệt kế điện tử Beurer FT 15/1', 95000.0000, 10, N'2f2b8931-5e9b-4138-93f1-1af64c1b7215.jpg', N'Nhiệt kế điện tử Beurer FT 15/1 là thiết bị theo dõi nhiệt độ cơ thể có thiết kế nhỏ gọn, tiện sử dụng. Nhiệt kế cho kết quả đo nhanh chóng, chính xác ngay sau khi bấm nút, với màn hình nhỏ, rõ, sắc nét. 

Nhiệt kế sử dụng chất liệu siêu nhẹ và kiểu dáng nhỏ gọn, cho phép bạn dễ dàng sử dụng và cất giữ. An toàn cho sức khỏe gia đình khỏi nguy cơ độc hại do thủy ngân như nhiệt kế thường
Vị trí đo linh hoạt.
Không dùng thủy tinh và không chứa thủy ngân.
Có bộ nhớ.
Có âm thanh báo khi đo xong.
Báo động khi phát hiện có dấu hiệu sốt.
Không thấm nước.
Đã được khử trùng.
Có hộp bảo quản.
Thiết kế nhỏ gọn, tiện lợi, dễ dàng sử dụng.
Đo ở nách, miệng và hậu môn...
Chuyển đổi được giữa hai đơn vị đo là độ C và độ F.
Tự động tắt khi không sử dụng.
Sử dụng pin.
', 3)
INSERT [dbo].[Product] ([IDProduct], [NameProduct], [PriceProduct], [QuantityProduct], [ImageProduct], [InfoProduct], [CategoryID]) VALUES (18, N'Cân điện tử iMediCare IB 303/310', 350000.0000, 10, N'1761fa85-1845-4b3b-ad95-be00e32fdda7.jpg', N'thiết kế bề mặt cân bằng kính cao cấp, chịu lực tốt sẽ đem đến cho sản phẩm độ bền cao sau thời gian dài sử dụng.
với thiết kế nhỏ gọn, chịu được trọng tải tối đa 150kg với độ sai số nhỏ 0.1kg, giúp người sử dụng có thể đặt cân ở góc nhỏ trong gia đình để có thể theo dõi cân nặng của cả gia đình
sử dụng công nghệ cảm biến thông minh mang đến độ chính xác cao. Cân thích hợp dùng cho gia đình giúp đo trọng lượng của các thành viên thường xuyên nhằm có chế độ ăn hợp lý hơn
có màn hình LCD với kích thước 6.2 x 2.6 cm nên quan sát kết quả cân đo dễ dàng. Ngoài ra, iMediCare IB 303/310 còn có tính năng báo pin yếu giúp người dùng thay pin đúng lúc để cân đo chính xác hơn
', 4)
INSERT [dbo].[Product] ([IDProduct], [NameProduct], [PriceProduct], [QuantityProduct], [ImageProduct], [InfoProduct], [CategoryID]) VALUES (19, N'Cân sức khỏe và phân tích cơ thể Tanita BC-543', 2500000.0000, 10, N'85623e40-fc8e-4415-aef7-bed3c97fdcaf.jpg', N'Cân sức khỏe và phân tích cơ thể Tanita BC-543 có thể đo tốc độ chuyển hóa cơ bản (tính lượng calo tối thiểu cần thiết) đồng thời tính thời gian chuyển hóa và phân loại thể hình (cân bằng giữa cơ và mỡ). Cân sức khỏe Tanita có thể đo cân nặng, độ béo cơ thể (%), đo lượng nước cơ thể (%) cũng như độ béo nội tạng, tính trọng lượng xương, trọng lượng cơ
Với thiết kế tinh xảo và hiện đại, mặt cân được làm bằng kính siêu chịu lực, chống xước và có thể tải được trọng lượng lên đến 150kg. Cân sức khỏe và phân tích cơ thể Tanita BC-543 có độ chính xác cực cao, dung sai chỉ dưới 100 grams và có dải phân chia độ béo cho người lớn và trẻ em (6 - 99 tuổi), giúp bạn dễ dàng đánh giá 1 cách chính xác nhất về cơ thể mình
Cân sức khỏe Tanita cho bạn biết:

Tác động của bữa ăn hàng ngày tới cơ thể như thế nào, liệu chế độ dinh dưỡng của bạn đã tốt hay chưa?
Sự thay đổi của trọng lượng cơ và tốc độ chuyển hóa cơ bản, từ đó điều chỉnh chương trình tập luyện sao cho phù hợp.
Tình trạng béo nội tạng, là tiêu chí rất quan trọng để ngăn ngừa nguy cơ gây nên các bệnh như đái tháo đường típ 2 và bệnh tim mạch.
Giúp bạn lên mục tiêu tập luyện cho bản thân
Có dải phân chia độ béo cho người lớn và trẻ em (6 - 99 tuổi)
Đo cân nặng
Đo độ béo cơ thể (%) 
Đo lượng nước cơ thể (%) 
Tính độ béo nội tạng
Tính trọng lượng xương 
Tính trọng lượng cơ 
Đo tốc độ chuyển hóa cơ bản (tính lượng calo tối thiểu cần thiết)
Tính thời gian chuyển hóa (cho biết cơ thể bạn "già" như thế nào?)
Phân loại thể hình (cân bằng giữa cơ và mỡ)
Lưu lại kết quả phân tích trước
Có mode dành cho vận động viên
Có khả năng lưu 4 thông tin cá nhân 
Có mode dành cho khách
Sai số 100g
Dải đo <150kg
Sử dụng pin
', 4)
INSERT [dbo].[Product] ([IDProduct], [NameProduct], [PriceProduct], [QuantityProduct], [ImageProduct], [InfoProduct], [CategoryID]) VALUES (20, N'Cân sức khỏe ArirangLife AR-S18E', 290000.0000, 10, N'92892426-3ff5-4341-87b8-5d4482170d1e.jpg', N'Cân đo trọng lượng theo định kỳ là điều nên làm để bảo vệ sức khỏe của mỗi thành viên trong gia đình. Cân sức khỏe ArirangLife có mức cân từ 2kg - 180kg sẽ giúp bạn cân được cả trọng lượng cho cả trẻ sơ sinh, trẻ nhỏ
ArirangLife AR-S18E thiết kế dạng hình vuông với kích thước 28 x 28 x 2.5cm (dài x rộng x dày). Mặt cân sử dụng chất liệu kính chịu lực với độ dày 6 ly cho độ bền cao. Những người có trọng lượng 180kg vẫn có thể đứng lên cân rất an toàn mà không sợ mặt kính bị vỡ. 
Đây là dòng cân sức khỏe điện tử sử dụng 2 pin AAA rất dễ mua ngoài thị trường. Tháo lắp pin đơn giản
Mặt dưới của cân làm từ nhựa cao cấp nên không lo gỉ sét trong quá trình sử dụng. Chất liệu nhựa đem lại tính thẩm mỹ cao và giúp cân có trọng lượng nhẹ hơn, dễ di chuyển', 4)
INSERT [dbo].[Product] ([IDProduct], [NameProduct], [PriceProduct], [QuantityProduct], [ImageProduct], [InfoProduct], [CategoryID]) VALUES (21, N'Cân sức khỏe ArirangLife AR-S18K', 290000.0000, 10, N'bea1851a-975b-435e-8788-1379ad176e25.jpg', N'AR-S18K được sản xuất trên công nghệ cảm biến siêu nhạy, cân sẽ tự hoạt động khi người dùng bước lên cân và tự ngắt khi người dùng bước xuống, giúp tiết kiệm pin và đảm bảo độ bền cho sản phẩm
Cân điện tử có phạm vi cân từ 2 - 180kg, với mức tải trọng lớn sẽ là sự lựa chọn phù hợp với mọi thành viên trong gia đình.
Mặt cân AirangLife làm từ kính chịu lực có độ dày 6mm, người dùng dễ dàng đứng vững cố định vị trí khi cân, tiện lợi vệ sinh cân thường xuyên
Cân có kích thước nhỏ 28cm x 28cm x 2,5cm cùng mức trọng lượng 2,55kg để bạn có thể cất giữ hay mang cất theo bất cứ nới đâu.
', 4)
INSERT [dbo].[Product] ([IDProduct], [NameProduct], [PriceProduct], [QuantityProduct], [ImageProduct], [InfoProduct], [CategoryID]) VALUES (23, N'Bồn massage chân Beurer FB-50', 3200000.0000, 10, N'd0a7de51-a05f-4328-b2f8-e7e3ae0cc9c7.jpg', N'
Beurer FB-50 có màu trắng xám sang trọng,  được làm bằng nhựa cao cấp cho độ bền cao với 4 chức năng chính: massage rung, massage sủi, làm nóng và giữ ấm nước
FB50 gồm:

4 mấu nam châm gắn trong bồn ngâm
Bồn ngâm
Ba đầu massage chăm sóc chân: đầu massage chân nhẹ nhàng, bàn chải và đầu đánh chai chân.
Các đầu massage được lắp vào giá đỡ ở giữa bồn, dùng chân ấn nhẹ để kích hoạt motor điện.

Đầu bàn chải dùng để kích thích các vùng cảm ứng ở gót chân.
Đầu massage chăm sóc chân nhẹ nhàng, giúp thúc đẩy vòng tuần hoàn.
Đầu đánh chai dùng để tẩy các tế bào da chết và chai chân.
', 5)
INSERT [dbo].[Product] ([IDProduct], [NameProduct], [PriceProduct], [QuantityProduct], [ImageProduct], [InfoProduct], [CategoryID]) VALUES (24, N'Máy massage đấm đôi Beurer MG80', 1850000.0000, 10, N'b9b7c2a7-14b3-4b3b-b8a2-b1016367be93.jpg', N'Máy massage đấm đôi Beurer MG80 với 2 đầu mát xa công suất lớn, kết hợp với đèn hồng ngoại, dễ dàng điều chỉnh tốc độ và cường độ mát xa, cấu tạo ưu việt đem lại kết quả mát xa tốt nhất cho bạn. Máy massage Beurer hoạt động với chế độ massage kết hợp nhiệt hồng ngoại giúp thúc đẩy việc lưu thông tuần hoàn máu được tốt hơn
là một trong những sản phẩm chăm sóc sức khỏe gia đình hàng đầu của hãng Beurer. Với tính năng độc đáo, kiểu dáng hiện đại, được sản xuất bằng công nghệ tiên tiến nhất, máy massage đấm đôi MG80 đã làm hài lòng cả những khách hàng khó tính nhất của thị trường Châu Âu và thế giới.
Với 2 đầu massage công suất lớn, kết hợp với đèn hồng ngoại, dễ dàng điều chỉnh tốc độ và cường độ massage, cấu tạo ưu việt đem lại kết quả massage tốt nhất cho bạn. Ngoài ra máy còn có hai bộ đầu massage đi kèm phù hợp với các vùng khác nhau của cơ thể. 

Beurer MG80 được thiết kế thông minh với hai đầu rung song song. Beurer MG80 với những tính năng và ưu điểm vượt trội, chuyên dùng massage cho cơ thể, massage lưng, đùi, massage toàn thân xua tan mệt mỏi, tạo cảm giác thư thái.

Để tránh nóng máy, không nên sử dụng máy liên tục quá 15 phút. Sau 15 phút nên ngắt điện, chờ máy nguội bớt trước khi sử dụng tiếp.
', 5)
INSERT [dbo].[Product] ([IDProduct], [NameProduct], [PriceProduct], [QuantityProduct], [ImageProduct], [InfoProduct], [CategoryID]) VALUES (26, N'Đai massage eo Maxcare Max626', 1900000.0000, 10, N'62900967-522e-4175-a85a-42cf2e34446e.jpg', N'Đai giảm béo bụng Maxcare Max626 với tần số rung 3.200 và sưởi bằng nhiệt hồng ngoại giúp đốt cháy mỡ thừa, tái tạo tế bào, làm săn chắc da, cho bạn vòng eo thon thả, vóc dáng thanh mảnh, cân đối.
', 5)
INSERT [dbo].[Product] ([IDProduct], [NameProduct], [PriceProduct], [QuantityProduct], [ImageProduct], [InfoProduct], [CategoryID]) VALUES (27, N'Máy massage cầm tay Beurer MG16', 440000.0000, 10, N'37ef365f-10e5-4c53-89d4-d3448ed0abbf.jpg', N'Máy massage cầm tay Beurer MG16 thiết kế nhỏ gọn, tiện dụng cho việc massage thư giãn cho vùng trên cơ thể. Bạn sẽ dễ dàng sử dụng cho các vùng như: đầu, lưng, cổ, cánh tay, vai, đùi và bắp chân. Máy hoạt động dựa trên Nguyên lý massage theo rung động nhẹ nhàng của ba đầu. Bạn chỉ cần bật và di chuyển máy bằng một lực rất nhỏ, chậm dần đều, lan tỏa ra các khu vực cần thư giãn.
Máy massage Beurer có nhiều tính năng nổi bật, tiện dụng dễ dàng thao tác ở mọi vị trí và hoàn cảnh khác nhau. Máy sử dụng pin, an toàn khi sử dụng và dễ dàng thay thế. Máy massage cầm tay tạo ra các rung động nhẹ, lan tỏa giúp giảm đau và thư giãn vùng đầu, các cơ trên cơ thể và mặt.
Máy massage cầm tay Beurer MG16 không chỉ giúp bạn giảm những cơn đau bất chợt, xóa tan mệt mỏi mà còn làm giảm sự căng thẳng của các dây thần kinh, thúc đẩy tuần hoàn máu trong cơ thể. Máy massage cầm tay 3 chân thích hợp sử dụng cho gia đình có người lớn tuổi, dân văn phòng thường xuyên đau mỏi cơ bắp...
sử dụng rất đơn giản, bạn chỉ cần nhấn nút nguồn một lần để mở máy và nhấn một lần nữa để tắt máy phù hợp với tất cả các đối tượng
', 5)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[Purchase] ON 

INSERT [dbo].[Purchase] ([IDPurchase], [CustomerTel], [CreatedAt], [UpdateAt], [Total], [Status]) VALUES (1, NULL, CAST(N'2019-05-20T23:53:17.633' AS DateTime), CAST(N'2019-05-20T23:53:17.633' AS DateTime), 5850000.0000, N'Complete')
INSERT [dbo].[Purchase] ([IDPurchase], [CustomerTel], [CreatedAt], [UpdateAt], [Total], [Status]) VALUES (6, NULL, CAST(N'2019-05-22T23:03:34.577' AS DateTime), CAST(N'2019-05-22T23:03:34.577' AS DateTime), 6445000.0000, N'Complete')
INSERT [dbo].[Purchase] ([IDPurchase], [CustomerTel], [CreatedAt], [UpdateAt], [Total], [Status]) VALUES (8, NULL, CAST(N'2019-05-23T13:40:04.480' AS DateTime), CAST(N'2019-05-23T13:40:04.480' AS DateTime), 11260000.0000, N'Complete')
INSERT [dbo].[Purchase] ([IDPurchase], [CustomerTel], [CreatedAt], [UpdateAt], [Total], [Status]) VALUES (9, NULL, CAST(N'2019-05-24T21:44:20.130' AS DateTime), CAST(N'2019-05-24T21:44:20.130' AS DateTime), 9870000.0000, N'Complete')
INSERT [dbo].[Purchase] ([IDPurchase], [CustomerTel], [CreatedAt], [UpdateAt], [Total], [Status]) VALUES (10, NULL, CAST(N'2019-05-24T21:44:23.430' AS DateTime), CAST(N'2019-05-28T15:23:15.277' AS DateTime), 4480000.0000, N'Complete')
INSERT [dbo].[Purchase] ([IDPurchase], [CustomerTel], [CreatedAt], [UpdateAt], [Total], [Status]) VALUES (11, NULL, CAST(N'2019-05-24T21:44:26.330' AS DateTime), CAST(N'2019-06-05T11:59:35.470' AS DateTime), 17500000.0000, N'Cancelled')
INSERT [dbo].[Purchase] ([IDPurchase], [CustomerTel], [CreatedAt], [UpdateAt], [Total], [Status]) VALUES (12, NULL, CAST(N'2019-05-25T14:11:00.790' AS DateTime), CAST(N'2019-05-27T17:39:45.683' AS DateTime), 7460000.0000, N'Cancelled')
INSERT [dbo].[Purchase] ([IDPurchase], [CustomerTel], [CreatedAt], [UpdateAt], [Total], [Status]) VALUES (13, NULL, CAST(N'2019-05-25T14:12:17.343' AS DateTime), CAST(N'2019-05-25T14:12:17.343' AS DateTime), 2840000.0000, N'New')
INSERT [dbo].[Purchase] ([IDPurchase], [CustomerTel], [CreatedAt], [UpdateAt], [Total], [Status]) VALUES (14, NULL, CAST(N'2019-05-25T14:35:53.443' AS DateTime), CAST(N'2019-05-25T14:35:53.447' AS DateTime), 42470000.0000, N'Complete')
INSERT [dbo].[Purchase] ([IDPurchase], [CustomerTel], [CreatedAt], [UpdateAt], [Total], [Status]) VALUES (15, NULL, CAST(N'2019-05-26T02:10:16.400' AS DateTime), CAST(N'2019-05-26T02:10:16.400' AS DateTime), 49960000.0000, N'New')
INSERT [dbo].[Purchase] ([IDPurchase], [CustomerTel], [CreatedAt], [UpdateAt], [Total], [Status]) VALUES (16, NULL, CAST(N'2019-05-26T02:30:57.810' AS DateTime), CAST(N'2019-05-26T02:30:57.810' AS DateTime), 7800000.0000, N'New')
INSERT [dbo].[Purchase] ([IDPurchase], [CustomerTel], [CreatedAt], [UpdateAt], [Total], [Status]) VALUES (17, NULL, CAST(N'2019-05-26T02:32:16.250' AS DateTime), CAST(N'2019-05-26T02:32:16.250' AS DateTime), 3500000.0000, N'New')
INSERT [dbo].[Purchase] ([IDPurchase], [CustomerTel], [CreatedAt], [UpdateAt], [Total], [Status]) VALUES (18, NULL, CAST(N'2019-05-26T02:34:38.003' AS DateTime), CAST(N'2019-05-26T02:34:38.003' AS DateTime), 13400000.0000, N'Complete')
INSERT [dbo].[Purchase] ([IDPurchase], [CustomerTel], [CreatedAt], [UpdateAt], [Total], [Status]) VALUES (19, NULL, CAST(N'2019-05-26T02:47:11.553' AS DateTime), CAST(N'2019-05-26T02:47:11.553' AS DateTime), 2700000.0000, N'New')
INSERT [dbo].[Purchase] ([IDPurchase], [CustomerTel], [CreatedAt], [UpdateAt], [Total], [Status]) VALUES (20, NULL, CAST(N'2019-05-26T02:48:17.103' AS DateTime), CAST(N'2019-05-26T02:48:17.103' AS DateTime), 5600000.0000, N'New')
INSERT [dbo].[Purchase] ([IDPurchase], [CustomerTel], [CreatedAt], [UpdateAt], [Total], [Status]) VALUES (21, NULL, CAST(N'2019-05-26T02:50:53.090' AS DateTime), CAST(N'2019-05-26T02:50:53.090' AS DateTime), 3900000.0000, N'New')
INSERT [dbo].[Purchase] ([IDPurchase], [CustomerTel], [CreatedAt], [UpdateAt], [Total], [Status]) VALUES (22, NULL, CAST(N'2019-05-26T02:51:26.407' AS DateTime), CAST(N'2019-05-26T02:51:26.407' AS DateTime), 7000000.0000, N'New')
INSERT [dbo].[Purchase] ([IDPurchase], [CustomerTel], [CreatedAt], [UpdateAt], [Total], [Status]) VALUES (23, NULL, CAST(N'2019-05-26T02:52:54.190' AS DateTime), CAST(N'2019-05-26T02:52:54.190' AS DateTime), 3900000.0000, N'Complete')
INSERT [dbo].[Purchase] ([IDPurchase], [CustomerTel], [CreatedAt], [UpdateAt], [Total], [Status]) VALUES (24, NULL, CAST(N'2019-05-26T03:16:48.237' AS DateTime), CAST(N'2019-05-26T03:16:48.237' AS DateTime), 3600000.0000, N'New')
INSERT [dbo].[Purchase] ([IDPurchase], [CustomerTel], [CreatedAt], [UpdateAt], [Total], [Status]) VALUES (25, NULL, CAST(N'2019-05-26T03:25:15.927' AS DateTime), CAST(N'2019-05-26T03:25:15.927' AS DateTime), 2790000.0000, N'New')
INSERT [dbo].[Purchase] ([IDPurchase], [CustomerTel], [CreatedAt], [UpdateAt], [Total], [Status]) VALUES (26, NULL, CAST(N'2019-05-26T03:30:58.253' AS DateTime), CAST(N'2019-05-26T03:30:58.253' AS DateTime), 3900000.0000, N'New')
INSERT [dbo].[Purchase] ([IDPurchase], [CustomerTel], [CreatedAt], [UpdateAt], [Total], [Status]) VALUES (27, NULL, CAST(N'2019-05-26T03:32:13.503' AS DateTime), CAST(N'2019-05-26T03:32:13.503' AS DateTime), 3900000.0000, N'New')
INSERT [dbo].[Purchase] ([IDPurchase], [CustomerTel], [CreatedAt], [UpdateAt], [Total], [Status]) VALUES (28, NULL, CAST(N'2019-05-26T03:34:45.650' AS DateTime), CAST(N'2019-05-26T03:34:45.650' AS DateTime), 2670000.0000, N'New')
INSERT [dbo].[Purchase] ([IDPurchase], [CustomerTel], [CreatedAt], [UpdateAt], [Total], [Status]) VALUES (29, NULL, CAST(N'2019-05-28T14:53:19.017' AS DateTime), CAST(N'2019-05-28T14:53:19.017' AS DateTime), 23750000.0000, N'New')
INSERT [dbo].[Purchase] ([IDPurchase], [CustomerTel], [CreatedAt], [UpdateAt], [Total], [Status]) VALUES (30, NULL, CAST(N'2019-05-28T14:59:15.463' AS DateTime), CAST(N'2019-05-28T14:59:15.463' AS DateTime), 40950000.0000, N'Complete')
INSERT [dbo].[Purchase] ([IDPurchase], [CustomerTel], [CreatedAt], [UpdateAt], [Total], [Status]) VALUES (31, NULL, CAST(N'2019-05-28T15:21:06.857' AS DateTime), CAST(N'2019-05-28T15:21:06.857' AS DateTime), 6750000.0000, N'Complete')
INSERT [dbo].[Purchase] ([IDPurchase], [CustomerTel], [CreatedAt], [UpdateAt], [Total], [Status]) VALUES (32, NULL, CAST(N'2019-05-28T15:37:06.970' AS DateTime), CAST(N'2019-05-28T15:37:06.970' AS DateTime), 10810000.0000, N'Complete')
INSERT [dbo].[Purchase] ([IDPurchase], [CustomerTel], [CreatedAt], [UpdateAt], [Total], [Status]) VALUES (33, NULL, CAST(N'2019-06-03T14:31:00.180' AS DateTime), CAST(N'2019-06-03T14:31:00.180' AS DateTime), 24570000.0000, N'Complete')
INSERT [dbo].[Purchase] ([IDPurchase], [CustomerTel], [CreatedAt], [UpdateAt], [Total], [Status]) VALUES (34, NULL, CAST(N'2019-06-03T14:33:01.223' AS DateTime), CAST(N'2019-06-03T14:33:01.223' AS DateTime), 32760000.0000, N'New')
INSERT [dbo].[Purchase] ([IDPurchase], [CustomerTel], [CreatedAt], [UpdateAt], [Total], [Status]) VALUES (35, NULL, CAST(N'2019-06-03T15:02:09.733' AS DateTime), CAST(N'2019-06-03T15:02:09.733' AS DateTime), 32790000.0000, N'New')
INSERT [dbo].[Purchase] ([IDPurchase], [CustomerTel], [CreatedAt], [UpdateAt], [Total], [Status]) VALUES (36, NULL, CAST(N'2019-06-03T15:05:02.783' AS DateTime), CAST(N'2019-06-03T15:05:02.783' AS DateTime), 27240000.0000, N'New')
INSERT [dbo].[Purchase] ([IDPurchase], [CustomerTel], [CreatedAt], [UpdateAt], [Total], [Status]) VALUES (37, NULL, CAST(N'2019-06-04T12:33:34.513' AS DateTime), CAST(N'2019-06-04T12:33:34.513' AS DateTime), 5280000.0000, N'New')
SET IDENTITY_INSERT [dbo].[Purchase] OFF
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([IDProduct])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Purchase] FOREIGN KEY([PurchaseID])
REFERENCES [dbo].[Purchase] ([IDPurchase])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Purchase]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([IDCategory])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Purchase]  WITH CHECK ADD  CONSTRAINT [FK_Purchase_Customer] FOREIGN KEY([CustomerTel])
REFERENCES [dbo].[Customer] ([Tel])
GO
ALTER TABLE [dbo].[Purchase] CHECK CONSTRAINT [FK_Purchase_Customer]
GO
ALTER TABLE [dbo].[Purchase]  WITH CHECK ADD  CONSTRAINT [FK_Purchase_OrderState] FOREIGN KEY([Status])
REFERENCES [dbo].[OrderState] ([Key])
GO
ALTER TABLE [dbo].[Purchase] CHECK CONSTRAINT [FK_Purchase_OrderState]
GO
