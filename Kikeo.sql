USE [ShopKiKeo]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 12/27/2019 1:20:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[Id] [int] NOT NULL,
	[Customer_Id] [int] NOT NULL,
	[TotalMoney] [decimal](18, 0) NULL,
	[Date] [datetime] NULL,
	[Status] [int] NULL,
	[Customer_Name] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Number_phone] [nvarchar](50) NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillDetail]    Script Date: 12/27/2019 1:20:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillDetail](
	[BillID] [int] NOT NULL,
	[ProductID] [int] NULL,
	[Quantity] [int] NULL,
	[TotalMoney] [decimal](18, 0) NULL,
 CONSTRAINT [PK_BillDetail] PRIMARY KEY CLUSTERED 
(
	[BillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 12/27/2019 1:20:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[Id] [int] NOT NULL,
	[OrderDetail_Id] [int] NOT NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[OrderDetail_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 12/27/2019 1:20:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Company] [nvarchar](500) NULL,
	[Address] [ntext] NULL,
	[Tel] [varchar](20) NULL,
	[Mal] [varchar](300) NULL,
	[Detail] [ntext] NULL,
	[Date] [datetime] NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 12/27/2019 1:20:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](500) NULL,
	[BirthDay] [datetime] NULL,
	[Province] [nvarchar](300) NULL,
	[Address] [ntext] NULL,
	[Tel] [varchar](20) NULL,
	[Email] [nvarchar](300) NULL,
	[UserName] [nchar](20) NOT NULL,
	[Password] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeedBack]    Script Date: 12/27/2019 1:20:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedBack](
	[FeedbackID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Phone] [nvarchar](12) NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](250) NULL,
	[Content] [nvarchar](250) NULL,
	[Status] [bit] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_FeedBack] PRIMARY KEY CLUSTERED 
(
	[FeedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 12/27/2019 1:20:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](250) NULL,
	[content] [nvarchar](max) NULL,
	[uploader] [int] NULL,
	[image] [nvarchar](350) NULL,
	[date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewsFeed]    Script Date: 12/27/2019 1:20:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsFeed](
	[Id] [int] NOT NULL,
	[Title] [nvarchar](250) NULL,
	[Content] [nvarchar](max) NULL,
	[CreatedBy] [int] NULL,
	[Image] [nvarchar](350) NULL,
	[CreatedDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 12/27/2019 1:20:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] NOT NULL,
	[Product_Id] [int] NOT NULL,
	[Quantity] [int] NULL,
	[Paid] [bit] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[Product_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 12/27/2019 1:20:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[CategoryID] [int] NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[ParentID] [int] NULL,
	[DisplayOrder] [int] NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nvarchar](250) NULL,
	[Status] [bit] NULL,
	[ShowOnHome] [bit] NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 12/27/2019 1:20:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] NOT NULL,
	[CategoryID] [int] NULL,
	[ProductName] [nvarchar](250) NULL,
	[Price] [decimal](18, 0) NULL,
	[ProductImage] [nvarchar](250) NULL,
	[Quantity] [int] NULL,
	[PromotionPrice] [decimal](18, 0) NULL,
	[MetaTitle] [varchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[MoreImages] [xml] NULL,
	[IncludeVAT] [bit] NULL,
	[Detail] [ntext] NULL,
	[Warranty] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nvarchar](250) NULL,
	[Status] [bit] NULL,
	[TopHot] [date] NULL,
	[ViewCounts] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 12/27/2019 1:20:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sliders]    Script Date: 12/27/2019 1:20:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sliders](
	[SlideID] [int] NOT NULL,
	[Image] [nvarchar](250) NULL,
	[DisplayOrder] [int] NULL,
	[Link] [nvarchar](250) NULL,
	[Description] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Sliders] PRIMARY KEY CLUSTERED 
(
	[SlideID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suport]    Script Date: 12/27/2019 1:20:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suport](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Tel] [varchar](20) NULL,
	[Type] [int] NULL,
	[Nick] [varchar](50) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Suport] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User ]    Script Date: 12/27/2019 1:20:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User ](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](500) NULL,
	[UserName] [varchar](500) NULL,
	[Password] [varchar](500) NULL,
	[CreatedDate] [datetime] NULL,
	[Status] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[Email] [nvarchar](50) NULL,
	[Group_ID] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserGroup]    Script Date: 12/27/2019 1:20:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGroup](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 12/27/2019 1:20:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[Group_ID] [int] NOT NULL,
	[Role_ID] [int] NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[Group_ID] ASC,
	[Role_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Bill] ([Id], [Customer_Id], [TotalMoney], [Date], [Status], [Customer_Name], [Address], [Email], [Number_phone]) VALUES (1, 5, CAST(11900000 AS Decimal(18, 0)), CAST(N'2019-04-16T00:00:00.000' AS DateTime), 1, N'Nguyễn Hoàng Long', NULL, N'long98hoang@gmail.com', N'841372723618')
INSERT [dbo].[Bill] ([Id], [Customer_Id], [TotalMoney], [Date], [Status], [Customer_Name], [Address], [Email], [Number_phone]) VALUES (2, 6, CAST(2000000 AS Decimal(18, 0)), CAST(N'2019-12-16T00:00:00.000' AS DateTime), 1, N'Phạm Lê Huy', NULL, N'phamlehuy@gmail.com', N'841372723618')
INSERT [dbo].[Bill] ([Id], [Customer_Id], [TotalMoney], [Date], [Status], [Customer_Name], [Address], [Email], [Number_phone]) VALUES (3, 7, CAST(2000000 AS Decimal(18, 0)), CAST(N'2019-12-20T00:00:00.000' AS DateTime), 0, N'Hoàng Thị Thủy', NULL, N'nguyenhath97@gmail.com', N'841372723618')
INSERT [dbo].[Bill] ([Id], [Customer_Id], [TotalMoney], [Date], [Status], [Customer_Name], [Address], [Email], [Number_phone]) VALUES (5, 8, CAST(2000000 AS Decimal(18, 0)), CAST(N'2019-12-20T00:00:00.000' AS DateTime), 0, N'Nguyễn Thị Hồng', NULL, N'long98hoang@gmail.com', N'841372723618')
INSERT [dbo].[Bill] ([Id], [Customer_Id], [TotalMoney], [Date], [Status], [Customer_Name], [Address], [Email], [Number_phone]) VALUES (7, 9, CAST(2000000 AS Decimal(18, 0)), CAST(N'2019-12-18T00:00:00.000' AS DateTime), 1, N'Phạm Lê Huy', NULL, N'phamlehuy@gmail.com', N'841372723618')
INSERT [dbo].[Bill] ([Id], [Customer_Id], [TotalMoney], [Date], [Status], [Customer_Name], [Address], [Email], [Number_phone]) VALUES (8, 10, CAST(25400400 AS Decimal(18, 0)), CAST(N'2019-12-18T00:00:00.000' AS DateTime), 0, N'Phạm Lê Huy', NULL, N'phamlehuy@gmail.com', N'841372723618')
INSERT [dbo].[BillDetail] ([BillID], [ProductID], [Quantity], [TotalMoney]) VALUES (1, 10, 1, CAST(11900000 AS Decimal(18, 0)))
INSERT [dbo].[BillDetail] ([BillID], [ProductID], [Quantity], [TotalMoney]) VALUES (2, 12, 1, CAST(2000000 AS Decimal(18, 0)))
INSERT [dbo].[BillDetail] ([BillID], [ProductID], [Quantity], [TotalMoney]) VALUES (3, 8, 1, CAST(2000000 AS Decimal(18, 0)))
INSERT [dbo].[BillDetail] ([BillID], [ProductID], [Quantity], [TotalMoney]) VALUES (5, 12, 1, CAST(2000000 AS Decimal(18, 0)))
INSERT [dbo].[BillDetail] ([BillID], [ProductID], [Quantity], [TotalMoney]) VALUES (7, 8, 1, CAST(2000000 AS Decimal(18, 0)))
INSERT [dbo].[BillDetail] ([BillID], [ProductID], [Quantity], [TotalMoney]) VALUES (8, 13, 2, CAST(12700200 AS Decimal(18, 0)))
INSERT [dbo].[Contact] ([Id], [Name], [Company], [Address], [Tel], [Mal], [Detail], [Date]) VALUES (1, N'Nguyễn Thị Hà', N'MTA', N'HQV', N'09876543221', NULL, NULL, NULL)
INSERT [dbo].[Customers] ([Id], [Name], [BirthDay], [Province], [Address], [Tel], [Email], [UserName], [Password]) VALUES (1, N'Nguyen Thi Ha', CAST(N'1997-03-26T00:00:00.000' AS DateTime), N'Ha Noi', N'HQV', NULL, N'mta.edu@gmail.com', N'ha                  ', N'1                                                 ')
INSERT [dbo].[Customers] ([Id], [Name], [BirthDay], [Province], [Address], [Tel], [Email], [UserName], [Password]) VALUES (2, N'Pham Le Huy', CAST(N'1998-09-25T00:00:00.000' AS DateTime), N'Ha Noi', N'HQV', NULL, N'mta.edu@gmail.com', N'huy                 ', N'1                                                 ')
INSERT [dbo].[Customers] ([Id], [Name], [BirthDay], [Province], [Address], [Tel], [Email], [UserName], [Password]) VALUES (3, N'Nguyen Hoang Long', CAST(N'1998-09-25T00:00:00.000' AS DateTime), N'Ha Noi', N'HQV', NULL, N'mta.edu@gmail.com', N'long                ', N'1                                                 ')
INSERT [dbo].[FeedBack] ([FeedbackID], [Name], [Phone], [Email], [Address], [Content], [Status], [CreatedDate]) VALUES (1, N'Phạm Lê Huy', N'0191823733', N'mta.edu@gmail.com', N'HQV', NULL, 1, CAST(N'2019-10-10T19:04:52.127' AS DateTime))
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([id], [title], [content], [uploader], [image], [date]) VALUES (25, N'Bộ sưu tập đồng hồ đeo tay bí ẩn mang phong cách ma cà rồng', N'<h2>Peren SOD l&agrave; sự kết hợp ho&agrave;n hảo giữa truyền thuyết Dracula huyền b&iacute; v&agrave; chất lượng cao cấp của đồng hồ Thụy Sĩ danh tiếng.</h2>

<p>Chiếc&nbsp;<a href="http://kenh14.vn/dong-ho-deo-tay.html" target="_blank">đồng hồ đeo tay</a>&nbsp;Peren Son of the Dragon (Peren SOD), l&agrave; sản phẩm của h&atilde;ng đồng hồ Peren Watches đến từ Transylvania, qu&ecirc; hương của b&aacute; tước&nbsp;<a href="http://kenh14.vn/dracula.html" target="_blank">Dracula</a>. Sản phẩm được nh&agrave;o nặn từ niềm tự h&agrave;o qu&yacute; tộc kết hợp với n&eacute;t huyền b&iacute; thần thoại nổi tiếng của v&ugrave;ng đất&nbsp;<a href="http://kenh14.vn/ma-ca-rong.html" target="_blank">ma c&agrave; rồng</a>.</p>

<p>Video giới thiệu đồng hồ Peren Son of the Dragon.</p>

<p><img alt="Bộ sưu tập đồng hồ đeo tay bí ẩn mang phong cách ma cà rồng - Ảnh 2." src="http://k14.vcmedia.vn/thumb_w/650/2016/1-1461869284819.jpg" style="margin:0px" /></p>

<p>Peren SOD l&agrave; chiếc đồng hồ đẹp độc đ&aacute;o vừa cộp m&aacute;c Thụy Sĩ kh&ocirc;ng c&ograve;n g&igrave; để ch&ecirc;.</p>

<p>Thiết kế của Peren SOD lấy cảm hứng chủ đạo từ huyền thoại ma c&agrave; rồng, với c&aacute;c đường n&eacute;t mang sắc đỏ m&aacute;u như kim giờ, vạch số hay đường chỉ tr&ecirc;n quai đeo. Tr&ecirc;n nền đen chủ đạo, từng chi tiết lu&ocirc;n nổi bật một c&aacute;ch mạnh mẽ v&agrave; c&oacute; phần b&iacute; ẩn, ngay cả trong &aacute;nh s&aacute;ng ban ng&agrave;y.</p>

<p>Mặt đồng hồ c&oacute; đường k&iacute;nh 40 mm v&agrave; độ d&agrave;y 10mm, với mặt k&iacute;nh Sapphire chống xước. Ngo&agrave;i kim chỉ giờ ph&uacute;t gi&acirc;y, Peren SOD c&ograve;n hiện ng&agrave;y trong th&aacute;ng ở vị tr&iacute; 12 giờ, v&agrave; một đồng hồ chu k&igrave; mặt trăng m&agrave;u đỏ m&aacute;u cực độc ở vị tr&iacute; 6 giờ. Mặt lưng th&eacute;p kh&ocirc;ng gỉ được in biểu tượng con rồng lấy từ ch&iacute;nh t&ograve;a l&acirc;u đ&agrave;i của b&aacute; tước Dracula.</p>

<p>Để sản phẩm của m&igrave;nh đạt chất lượng tốt nhất, Peren Watches kh&ocirc;ng ngại ngần bắt tay với những nh&agrave; sản xuất đồng hồ sừng sỏ nhất Thụy Sĩ. Từ c&aacute;c chi tiết kỹ thuật tới chất lượng gia c&ocirc;ng, chất liệu chế t&aacute;c đều được đầu tư xứng đ&aacute;ng. Mỗi chiếc đồng hồ Peren SOD đều l&agrave; một sự kết hợp chuẩn chỉ giữa kiểu d&aacute;ng v&agrave; chất lượng.</p>

<p>Hiện tại, dự &aacute;n thu h&uacute;t vốn cộng đồng của Peren SOD sắp vướt gấp đ&ocirc;i dự kiến ban đầu với số tiền l&ecirc;n tới gần 50 ngh&igrave;n USD (khoảng 1,1 tỉ VND). Dự kiến, mẫu đồng hồ n&agrave;y sẽ được ra mắt v&agrave;o th&aacute;ng 6/2016 với gi&aacute; 299 USD (khoảng 6,7 triệu VND).&nbsp;Bạn đọc c&oacute; thể sở hữu cho m&igrave;nh một chiếc đồng hồ đeo tay Peren SOD bằng c&aacute;ch ủng hộ dự &aacute;n số tiền ngay từ b&acirc;y giờ.</p>

<p><a href="https://www.kickstarter.com/projects/1288586432/peren-sod-accessible-luxury-swiss-made-transylvani?ref=category" target="_blank">Bạn c&oacute; thể tham khảo v&agrave; đặt mua sản phẩm</a></p>

<p><img alt="Bộ sưu tập đồng hồ đeo tay bí ẩn mang phong cách ma cà rồng - Ảnh 3." src="http://k14.vcmedia.vn/thumb_w/650/2016/2-1461869284842.jpg" style="margin:0px" /></p>

<p>Phi&ecirc;n bản quai kim loại vẫn đẹp v&agrave; cứng c&aacute;p.</p>

<p><img alt="Bộ sưu tập đồng hồ đeo tay bí ẩn mang phong cách ma cà rồng - Ảnh 4." src="http://k14.vcmedia.vn/thumb_w/650/2016/2-1461869285286.png" style="margin:0px" /></p>

<p>Mặt đồng hồ chau chuốt từng chi tiết.</p>

<p><img alt="Bộ sưu tập đồng hồ đeo tay bí ẩn mang phong cách ma cà rồng - Ảnh 5." src="http://k14.vcmedia.vn/thumb_w/650/2016/11-1461869284880.jpg" style="margin:0px" /></p>

<p>Peren SOD c&oacute; gi&aacute; khoảng 6,7 triệu VND v&agrave; ra mắt v&agrave;o th&aacute;ng 6/2016</p>
', 1, N'/images/news/1-1461869284819-88-0-513-680-crop-1461869341958.jpg', NULL)
INSERT [dbo].[News] ([id], [title], [content], [uploader], [image], [date]) VALUES (26, N'Bộ sưu tập đồng hồ Ý sành điệu với mức giá bình dân đến bất ngờ', N'<h2>ang chảnh đ&acirc;u chỉ d&agrave;nh cho d&acirc;n nh&agrave; gi&agrave;u l&agrave; những g&igrave; bạn sẽ thốt l&ecirc;n sau khi xem bộ sưu tập đồng hồ n&agrave;y.</h2>

<p>Từ l&acirc;u, những chiếc đồng hồ đến từ &Yacute; đ&atilde; chiếm trọn tr&aacute;i tim của biết bao người nhờ sự tinh xảo v&agrave; tuyệt đẹp trong từng chi tiết. Tuy nhi&ecirc;n, để sở hữu 1 chiếc đồng hồ hạng sang như vậy, số tiền bạn phải bỏ ra l&agrave; cực kỳ lớn. Mong muốn đem đến chiếc đồng hồ với chất lượng tốt, mang phong c&aacute;ch ch&acirc;u &Acirc;u &nbsp;nhưng gi&aacute; cả lại rất phải chăng l&agrave; tham vọng của c&ocirc;ng ty Pegasus Watches Venezia tại Venice, &Yacute; khi thiết kế mẫu đồng hồ c&ugrave;ng t&ecirc;n n&agrave;y.</p>

<p>&nbsp;Video giới thiệu đồng hồ&nbsp;Pegasus Watches Venezia.</p>

<p><img alt="Bộ sưu tập đồng hồ Ý sành điệu với mức giá bình dân đến bất ngờ - Ảnh 2." src="http://k14.vcmedia.vn/thumb_w/600/2016/photo-1-1458490182325.jpg" style="margin:0px" /></p>

<p>&nbsp;Đồng hồ thời trang mang đậm vẻ đẹp cổ điển &Yacute;.</p>

<p>Điểm đặc biệt khi nhắc tới Pegasus Watches Venezia l&agrave; vẻ đẹp sang trọng nhưng cũng rất ho&agrave;i cổ, khiến ta nhớ về những chiếc đồng hồ hạng sang nổi tiếng từ thế kỷ 20. Chi tiết đậm chất &Yacute; nhất của chiếc đồng hồ n&agrave;y l&agrave; d&acirc;y đeo da được l&agrave;m từ da &Yacute; ch&iacute;nh h&atilde;ng v&agrave; hộp đựng l&agrave;m từ quả &oacute;c ch&oacute; ở th&agrave;nh phố Sorrento. Để l&agrave;m h&agrave;i l&ograve;ng ngay cả những vị kh&aacute;ch kh&oacute; t&iacute;nh nhất, nh&agrave; sản xuất chỉ sử dụng 100% da thuộc tự nhi&ecirc;n, được c&aacute;c nghệ nh&acirc;n nổi tiếng của &Yacute; chế t&aacute;c, tạo ra độ mềm mại, cổ điển v&agrave; si&ecirc;u bền.</p>

<p>Chiếc đồng hồ c&oacute; k&iacute;ch thước trung b&igrave;nh với b&aacute;n k&iacute;nh 40mm, được trang bị bộ cơ chuyển động quarz Miyota 2115, bộ chuyển động của thương hiệu đồng hồ Citizen danh tiếng. Mặt đồng hồ được l&agrave;m từ tinh thể đ&aacute; nguy&ecirc;n chất với lớp phủ gi&uacute;p chống l&oacute;a v&agrave; xước. Vỏ ngo&agrave;i được l&agrave;m từ th&eacute;p kh&ocirc;ng gỉ chất lượng cao nhằm tăng tuổi thọ của chiếc đồng hồ. Ngo&agrave;i ra, Pegasus Watches Venezia c&ograve;n c&oacute; khả năng chống thấm nước ở độ s&acirc;u 100m.</p>

<p>Hiện bộ sưu tập đồng hồ n&agrave;y đang thu h&uacute;t được hơn 17 ngh&igrave;n EUR tr&ecirc;n Kickstarter (khoảng gần 426 triệu VND), gấp gần 3 lần số vốn ban đầu. Dự kiến sản phẩm sẽ được b&aacute;n ra v&agrave;o th&aacute;ng 7/2016 với mức gi&aacute; 109 EUR ( khoảng 2,7 triệu VND), một mức gi&aacute; cực rẻ so với c&aacute;c thương hiệu sang chảnh b&acirc;y giờ . Bạn đọc y&ecirc;u th&iacute;ch c&oacute; thể đặt mua sản phẩm từ b&acirc;y giờ tr&ecirc;n Kickstarter để nhận được mức gi&aacute; ưu đ&atilde;i c&ugrave;ng qu&agrave; tặng đi k&egrave;m.</p>

<p><a href="https://www.kickstarter.com/projects/pegasuswatches/pegasus-venezia-legionarius-italian-luxury-homage?ref=category_popular" target="_blank">Bạn c&oacute; thể tham khảo v&agrave; đặt mua sản phẩm</a></p>

<p><img alt="Bộ sưu tập đồng hồ Ý sành điệu với mức giá bình dân đến bất ngờ - Ảnh 3." src="http://k14.vcmedia.vn/thumb_w/600/2016/photo-1-1458490245707.png" style="margin:0px" /></p>

<p>&nbsp;Hộp đựng đặc biệt l&agrave;m từ quả &oacute;c ch&oacute; từ th&agrave;nh phố Sorrento nổi tiếng.&nbsp;</p>

<p><img alt="Bộ sưu tập đồng hồ Ý sành điệu với mức giá bình dân đến bất ngờ - Ảnh 4." src="http://k14.vcmedia.vn/thumb_w/600/2016/photo-1-1458490255297.jpg" style="margin:0px" /></p>

<p>&nbsp;Vẻ đẹp sang trọng nhưng cũng rất ho&agrave;i cổ, khiến ta nhớ về những chiếc đồng hồ hạng sang nổi tiếng từ thế kỷ 20.</p>

<p><img alt="Bộ sưu tập đồng hồ Ý sành điệu với mức giá bình dân đến bất ngờ - Ảnh 5." src="http://k14.vcmedia.vn/thumb_w/600/2016/photo-1-1458490267420.jpeg" style="margin:0px" /></p>

<p>&nbsp;D&acirc;y đeo&nbsp;được c&aacute;c nghệ nh&acirc;n nổi tiếng của &Yacute; chế t&aacute;c, tạo ra độ mềm mại, cổ điển v&agrave; si&ecirc;u bền.</p>

<p><img alt="Bộ sưu tập đồng hồ Ý sành điệu với mức giá bình dân đến bất ngờ - Ảnh 6." src="http://k14.vcmedia.vn/thumb_w/600/2016/photo-1-1458490403394.png" style="margin:0px" /></p>

<p>&nbsp;Chiếc đồng hồ được chế t&aacute;c tỉ mỉ đến từng chi tiết.</p>

<p><img alt="Bộ sưu tập đồng hồ Ý sành điệu với mức giá bình dân đến bất ngờ - Ảnh 7." src="http://k14.vcmedia.vn/thumb_w/600/2016/photo-1-1458490289878.png" style="margin:0px" /></p>

<p>&nbsp;Dự kiến sản phẩm sẽ được b&aacute;n ra v&agrave;o th&aacute;ng 7/2016 với mức gi&aacute; khoảng 2,7 triệu VND.</p>
', 1, N'/images/news/photo-1-1458490182325-20-82-344-602-crop-1458490576234.jpg', NULL)
INSERT [dbo].[News] ([id], [title], [content], [uploader], [image], [date]) VALUES (27, N'Điểm mặt những mẫu đồng hồ G-Shock mới ra mắt trong tháng 3/2016', N'<h2>H&atilde;ng đồng hồ Casio đ&atilde; li&ecirc;n tục cho ra đời mẫu G-Shock phi&ecirc;n bản đặc biệt d&agrave;nh ri&ecirc;ng cho c&aacute;c fan h&acirc;m mộ d&ograve;ng đồng hồ đeo tay n&agrave;y.</h2>

<p><strong>1.&nbsp; G-Shock Istanbul 2016 GA-100 Collection</strong></p>

<p>Nh&acirc;n dịp sự kiện G-Shock City Festival sắp được tổ chức v&agrave;o 8/5 tới tại th&agrave;nh phố Istanbul, Thổ Nhĩ Kỳ, Casio đ&atilde; cho ra mắt bộ sưu tập d&agrave;nh ri&ecirc;ng cho lễ hội với t&ecirc;n gọi Istanbul 2016 GA-100 Collection. Đ&uacute;ng như t&ecirc;n gọi của m&igrave;nh, bộ sưu tập mới n&agrave;y mang đậm chất Thổ khi c&aacute;c danh lam thắng cảnh nổi tiếng tại Istanbul như cầu Bosphorus, ngọn th&aacute;p Maiden đều xuất hiện tr&ecirc;n d&acirc;y đồng hồ. Dự kiến,&nbsp;G-Shock Istanbul 2016 GA-100 sẽ ra mắt c&ugrave;ng ng&agrave;y với lễ hội G-Shock với số lượng giới hạn 500 chiếc cho ba m&agrave;u l&agrave; đỏ, trắng v&agrave; đen.</p>

<p><a href="http://www.ersasaat.com.tr/istanbul/" target="_blank">Bạn c&oacute; thể tham khảo v&agrave; đặt mua sản phẩm</a></p>

<p><img alt="Điểm mặt những mẫu đồng hồ G-Shock mới ra mắt trong tháng 3/2016 - Ảnh 1." src="http://k14.vcmedia.vn/thumb_w/600/2016/g1-1457941164389.jpg" style="margin:0px" /></p>

<p>&nbsp;Bộ sưu tập G-Shock được ra mắt nh&acirc;n dịp sự kiện G-Shock City Festival tại Istanbul, Thổ Nhĩ Kỳ.</p>

<p><img alt="Điểm mặt những mẫu đồng hồ G-Shock mới ra mắt trong tháng 3/2016 - Ảnh 2." src="http://k14.vcmedia.vn/thumb_w/600/2016/g2-1457941164404.jpg" style="margin:0px" /></p>

<p>Bộ sưu tập n&agrave;y sẽ c&oacute; ba m&agrave;u sắc đỏ, trắng v&agrave; đen.</p>

<p><img alt="Điểm mặt những mẫu đồng hồ G-Shock mới ra mắt trong tháng 3/2016 - Ảnh 3." src="http://k14.vcmedia.vn/thumb_w/600/2016/g3-1457941164414.jpg" style="margin:0px" /></p>

<p>&nbsp;D&acirc;y đồng hồ xuất hiện những địa danh nổi tiếng tại Istanbul.</p>

<p><img alt="Điểm mặt những mẫu đồng hồ G-Shock mới ra mắt trong tháng 3/2016 - Ảnh 4." src="http://k14.vcmedia.vn/thumb_w/600/2016/g4-1457941164424.jpg" style="margin:0px" /></p>

<p>&nbsp;Bộ sưu tập sẽ được ra mắt v&agrave;o ng&agrave;y th&aacute;ng 8/5 tới đ&acirc;y.</p>

<p><strong>2.&nbsp; G-Shock Trend White Collection</strong></p>

<p>Cũng trong dịp n&agrave;y, chi nh&aacute;nh G-Shock Soho tại th&agrave;nh phố New York, Mỹ cũng vừa giới thiệu tr&ecirc;n mạng x&atilde; hội bộ sưu tập mang m&agrave;u trắng thời thượng - Trend White. Với thiết kế đơn giản c&ugrave;ng m&agrave;u sắc lịch l&atilde;m, kh&ocirc;ng kh&oacute; để nhận ra sức h&uacute;t kh&oacute; cưỡng từ những mẫu đồng hồ đeo tay thời thượng n&agrave;y. G-Shock Trend White Collection hiện đang được ch&agrave;o b&aacute;n tr&ecirc;n c&aacute;c trang web b&aacute;n h&agrave;ng trực tuyến với số lượng giới hạn.</p>

<p><a href="https://www.facebook.com/gshocksoho/" target="_blank">Bạn c&oacute; thể tham khảo v&agrave; đặt mua sản phẩm</a></p>

<p><img alt="Điểm mặt những mẫu đồng hồ G-Shock mới ra mắt trong tháng 3/2016 - Ảnh 5." src="http://k14.vcmedia.vn/thumb_w/600/2016/g5-1457942560473.jpeg" style="margin:0px" /></p>

<p>&nbsp;&nbsp;M&agrave;u trắng thời thượng c&ugrave;ng thiết kế nguy&ecirc;n bản đầy hấp dẫn.</p>

<p><img alt="Điểm mặt những mẫu đồng hồ G-Shock mới ra mắt trong tháng 3/2016 - Ảnh 6." src="http://k14.vcmedia.vn/thumb_w/600/2016/g6-1457942560495.jpg" style="margin:0px" /></p>

<p>&nbsp;Trend White chỉ c&oacute; 3 mẫu với số lượng giới hạn.</p>

<p><strong>3.&nbsp;</strong><strong>G-Shock</strong><strong>&nbsp;GWF Frogman Love The Sea And The Earth 2016 I.C.E.R.C. 25th Anniversary</strong></p>

<p>Nhằm kỷ niệm 25 th&agrave;nh lập Trung t&acirc;m nghi&ecirc;n cứu quốc tế về động vật biển, chi nh&aacute;nh G-Shock xứ hoa anh đ&agrave;o đ&atilde; cho ra mắt 1500 chiếc G-Shock thuộc d&ograve;ng GWF Frogman. Tất cả c&aacute;c mẫu trong bộ sưu tập n&agrave;y đều được in logo ri&ecirc;ng&nbsp;c&ugrave;ng hộp đựng đặc biệt của I&nbsp;.C.E.R.C.. Theo dự kiến, bộ sưu tập&nbsp;I.C.E.R.C. sẽ được ra mắt v&agrave;o th&aacute;ng 6 tới đ&acirc;y.</p>

<p><a href="http://g-shock.jp/" target="_blank">Bạn c&oacute; thể tham khảo v&agrave; đặt mua sản phẩm</a></p>

<p><img alt="Điểm mặt những mẫu đồng hồ G-Shock mới ra mắt trong tháng 3/2016 - Ảnh 7." src="http://k14.vcmedia.vn/thumb_w/600/2016/g10-1457942560513.jpg" style="margin:0px" /></p>

<p>&nbsp;Mẫu GWF Frogman được ra mắt nhằm kỷ niệm 25 th&agrave;nh lập trung t&acirc;m nghi&ecirc;n cứu quốc tế về động vật biển.</p>

<p><img alt="Điểm mặt những mẫu đồng hồ G-Shock mới ra mắt trong tháng 3/2016 - Ảnh 8." src="http://k14.vcmedia.vn/thumb_w/600/2016/g11-1457942560520.jpg" style="margin:0px" /></p>

<p>&nbsp;Sẽ chỉ c&oacute; 1500 mẫu Frogman phi&ecirc;n bản đặc biệt được ra mắt.</p>

<p><img alt="Điểm mặt những mẫu đồng hồ G-Shock mới ra mắt trong tháng 3/2016 - Ảnh 9." src="http://k14.vcmedia.vn/thumb_w/600/2016/g12-1457942560541.jpg" style="margin:0px" /></p>

<p>&nbsp;Kh&ocirc;ng chỉ c&oacute; G-Shock m&agrave; c&ograve;n c&oacute; phi&ecirc;n bản Baby-G d&agrave;nh cho ph&aacute;i nữ.</p>

<p><strong>4. G-Shock&nbsp;</strong></p>

<p>C&ugrave;ng ra mắt trong th&aacute;ng 6 với d&ograve;ng GWF Frogman, Casio Nhật Bản cũng cho ra mắt c&aacute;c mẫu đồng hồ mới trong d&ograve;ng G-LIDE với chủ đề đại dương. Kh&ocirc;ng như c&aacute;c mẫu G-Shock kh&aacute;c, G-LIDE được Casio trang bị th&ecirc;m bảng thủy chiều, lịch mặt trăng v&agrave; cả bộ cảm biến nhiệt. Đ&acirc;y sẽ l&agrave; lựa chọn ho&agrave;n hảo cho c&aacute;c thủy thủ cũng như những người y&ecirc;u th&iacute;ch h&agrave;ng hải.&nbsp;G-LIDE GAX-100 c&oacute; gi&aacute; 16 ngh&igrave;n JPY (khoảng 3,2 triệu VND) cho bản thường v&agrave; 19 ngh&igrave;n JPY (khoảng 3,8 triệu VND) cho c&aacute;c phi&ecirc;n bản m&agrave;u sắc đặc biệt.</p>

<p><a href="http://g-shock.jp/" target="_blank">Bạn c&oacute; thể tham khảo v&agrave; đặt mua sản phẩm</a></p>

<p><img alt="Điểm mặt những mẫu đồng hồ G-Shock mới ra mắt trong tháng 3/2016 - Ảnh 10." src="http://k14.vcmedia.vn/thumb_w/600/2016/g13-1457942560559.jpg" style="margin:0px" /></p>

<p>&nbsp;G-LIDE GAX-100 cũng được Casio cho ra mắt trong th&aacute;ng 6.</p>

<p><img alt="Điểm mặt những mẫu đồng hồ G-Shock mới ra mắt trong tháng 3/2016 - Ảnh 11." src="http://k14.vcmedia.vn/thumb_w/600/2016/g14-1457942560564.jpg" style="margin:0px" /></p>

<p>&nbsp;</p>

<p><img alt="Điểm mặt những mẫu đồng hồ G-Shock mới ra mắt trong tháng 3/2016 - Ảnh 12." src="http://k14.vcmedia.vn/thumb_w/600/2016/g15-1457942560571.jpg" style="margin:0px" /></p>

<p>&nbsp;D&ograve;ng G-LIDE được trang bị cảm biến nhiệt, lịch mặt trăng v&agrave; bảng thuỷ chiều.</p>

<p><img alt="Điểm mặt những mẫu đồng hồ G-Shock mới ra mắt trong tháng 3/2016 - Ảnh 13." src="http://k14.vcmedia.vn/thumb_w/600/2016/g16-1457942560576.jpg" style="margin:0px" /></p>

<p>&nbsp;Đ&acirc;y sẽ l&agrave; lựa chọn ho&agrave;n hảo d&agrave;nh cho những người y&ecirc;u th&iacute;ch ng&agrave;nh h&agrave;ng hải.</p>

<p><img alt="Điểm mặt những mẫu đồng hồ G-Shock mới ra mắt trong tháng 3/2016 - Ảnh 14." src="http://k14.vcmedia.vn/thumb_w/600/2016/g17-1457942560583.jpg" style="margin:0px" /></p>

<p>&nbsp;C&aacute;c phi&ecirc;n bản G-LIDE đặc biệt với c&aacute;c m&agrave;u sắc sặc sỡ kh&aacute;c nhau.</p>
', 1, N'/images/news/g5-1457942560473-11-0-449-700-crop-1457943192601.jpeg', NULL)
INSERT [dbo].[News] ([id], [title], [content], [uploader], [image], [date]) VALUES (28, N'Chiêm ngưỡng cỗ máy thời gian tinh xảo hàng đầu thế giới', N'<h2>Bạn c&oacute; bao giờ nghĩ rằng để l&agrave;m ra mặt đồng hồ lại giống như một t&aacute;c phẩm nghệ thuật như thế n&agrave;y hay chưa?</h2>

<p>C&aacute;c d&acirc;y chuyền m&aacute;y m&oacute;c hoạt động trơn tru lu&ocirc;n tạo ra sức hấp dẫn đến kỳ lạ&nbsp;với con người. C&agrave;ng d&agrave;i, c&agrave;ng hoạt động trơn tru th&igrave; lại c&agrave;ng tạo ra sức thu h&uacute;t kh&oacute; tả, nhất l&agrave; với những cỗ m&aacute;y mang t&ecirc;n nh&agrave; ph&aacute;t minh kỳ t&agrave;i Rube Goldberg.&nbsp;</p>

<p>Hầu hết c&aacute;c d&acirc;y chuyền n&agrave;y mang t&ecirc;n nh&agrave; ph&aacute;t minh người Mỹ đều rất đồ sộ v&agrave; d&agrave;i, nhiều khi c&oacute; thể k&eacute;o từ trong x&oacute; bếp ra đến tận đầu ng&otilde;. Theo l&yacute; giải của nhiều người, ch&uacute;ng phải d&agrave;i như vậy th&igrave; mới thể hiện được hết độ hay ho của t&aacute;c phẩm. Nhưng c&aacute;c nh&agrave; thiết kế đồng hồ tại Seiko lại kh&ocirc;ng nghĩ như vậy, họ đ&atilde; tạo ra một cỗ m&aacute;y t&iacute; hon v&agrave; đầy hấp dẫn mang t&ecirc;n gọi &quot;Kiệt t&aacute;c thời gian&quot;.</p>

<p>&nbsp;</p>

<p><img alt="Chiêm ngưỡng cỗ máy thời gian tinh xảo hàng đầu thế giới - Ảnh 2." src="http://k14.vcmedia.vn/thumb_w/500/2016/ezgif-2003959055-1458897108968.gif" style="margin:0px; width:500px" /></p>

<p>&nbsp;Cỗ m&aacute;y d&acirc;y chuyền quyến rũ nhất thế giới l&agrave; đ&acirc;y chứ đ&acirc;u?</p>

<p>Kh&ocirc;ng sử dụng bất cứ thứ g&igrave; to t&aacute;t, c&aacute;c nghệ nh&acirc;n trong đoạn clip sử dụng ch&iacute;nh những m&oacute;n đồ &quot;c&acirc;y nh&agrave; l&aacute; vườn&quot; với họ - linh kiện đồng hồ. Ngo&agrave;i c&aacute;c chi tiết m&aacute;y m&oacute;c, t&aacute;c phẩm c&ograve;n c&oacute; sự tham gia của con người, yếu tố kh&ocirc;ng thể thiếu trong việc tạo n&ecirc;n những kiệt t&aacute;c thời gian. Tất cả được sắp xếp nhịp nh&agrave;ng, kh&eacute;o l&eacute;o như một d&acirc;y chuyền lắp r&aacute;p đồng hồ thực sự. V&agrave; đừng ngần ngại xem đến gi&acirc;y cuối c&ugrave;ng, bạn sẽ biết được b&iacute; mật đầy bất ngờ của d&acirc;y chuyền n&agrave;y.&nbsp;</p>

<p><img alt="Chiêm ngưỡng cỗ máy thời gian tinh xảo hàng đầu thế giới - Ảnh 3." src="http://k14.vcmedia.vn/thumb_w/500/2016/rube2-1458898210435.gif" style="margin:0px; width:500px" /></p>

<p>&nbsp;Kiệt t&aacute;c thời gian đến ch&iacute;nh từ những chi tiết c&acirc;y nh&agrave; l&aacute; vườn của Seiko.</p>

<p><img alt="Chiêm ngưỡng cỗ máy thời gian tinh xảo hàng đầu thế giới - Ảnh 4." src="http://k14.vcmedia.vn/thumb_w/500/2016/rube3-1458898210270.gif" style="margin:0px; width:500px" /></p>

<p>&nbsp;R&ograve;ng rọc l&agrave;m từ những chi tiết đến từ b&ecirc;n trong đồng hồ Seiko.</p>

<p><img alt="Chiêm ngưỡng cỗ máy thời gian tinh xảo hàng đầu thế giới - Ảnh 5." src="http://k14.vcmedia.vn/thumb_w/500/2016/rube4-1458898213720.gif" style="margin:0px; width:500px" /></p>

<p>&nbsp;Phản ứng d&acirc;y chuyền ch&iacute;nh l&agrave; &quot;thương hiệu&quot; của những cỗ m&aacute;y Rube Goldberg.</p>

<p><img alt="Chiêm ngưỡng cỗ máy thời gian tinh xảo hàng đầu thế giới - Ảnh 6." src="http://k14.vcmedia.vn/thumb_w/500/2016/rube5-1458898212576.gif" style="margin:0px; width:500px" /></p>

<p>&nbsp;Kh&ocirc;ng thể kh&ocirc;ng kể đến con người - một mắt x&iacute;ch quan trọng của cỗ m&aacute;y.</p>

<p><img alt="Chiêm ngưỡng cỗ máy thời gian tinh xảo hàng đầu thế giới - Ảnh 7." src="http://k14.vcmedia.vn/thumb_w/500/2016/rube6-1458898211794.gif" style="margin:0px; width:500px" /></p>

<p>&nbsp;Tất cả nhằm tạo n&ecirc;n một chiếc đồng hồ đeo tay ho&agrave;n hảo.</p>

<p><img alt="Chiêm ngưỡng cỗ máy thời gian tinh xảo hàng đầu thế giới - Ảnh 8." src="http://k14.vcmedia.vn/thumb_w/500/2016/rube7-1458898210106.gif" style="margin:0px; width:500px" /></p>

<p>&nbsp;H&igrave;nh d&aacute;ng thực sự của cỗ m&aacute;y d&acirc;y chuyền của Seiko.</p>
', 1, N'/images/news/rube2-1458898210435.gif', NULL)
INSERT [dbo].[News] ([id], [title], [content], [uploader], [image], [date]) VALUES (29, N'Khỏi cần giấy ghi chú, chiếc đồng hồ này sẽ nhắc bạn làm gì mỗi ngày', N'<h2>Chiếc đồng hồ th&ocirc;ng minh t&iacute;ch hợp t&iacute;nh năng xem giờ v&agrave; ng&agrave;y th&aacute;ng một l&uacute;c gi&uacute;p bạn quản l&yacute; thật tốt thời gian biểu của m&igrave;nh.</h2>

<p>Đồng hồ th&ocirc;ng minh đang ng&agrave;y c&agrave;ng chiếm ưu thế trong đời sống h&agrave;ng ng&agrave;y của ch&iacute;nh ch&uacute;ng ta. Tuy c&oacute; rất nhiều &yacute; tưởng đột ph&aacute; ra đời để cải tiến đồng hồ đeo tay, nhưng chẳng c&oacute; ai nghĩ đến việc tạo ra một chiếc đồng hồ xem được lịch tr&igrave;nh h&agrave;ng ng&agrave;y cả. Đi ti&ecirc;n phong trong lĩnh vực n&agrave;y, c&ocirc;ng ty c&ocirc;ng nghệ What? Watch đến từ Vienna, &Aacute;o đ&atilde; d&agrave;y c&ocirc;ng s&aacute;ng chế ra đồng hồ Calendar Watch.</p>

<p>&nbsp;Video giới thiệu đồng hồ Calendar Watch.</p>

<p><img alt="Khỏi cần giấy ghi chú, chiếc đồng hồ này sẽ nhắc bạn làm gì mỗi ngày - Ảnh 2." src="http://k14.vcmedia.vn/thumb_w/600/2016/photo-1-1457631467855.png" style="margin:0px" /></p>

<p>&nbsp;Chiếc đồng hồ t&iacute;ch hợp lịch điện tử đầu ti&ecirc;n tr&ecirc;n thế giới.</p>

<p>Calendar Watch kh&ocirc;ng chỉ&nbsp;tự động&nbsp;hiển thị giờ, m&agrave; c&ograve;n cho thấy lịch tr&igrave;nh trong 12-24 tiếng tiếp theo của bạn bằng c&aacute;ch đồng bộ th&ocirc;ng tin với điện thoại. Ngo&agrave;i việc hiển thị c&aacute;c c&ocirc;ng việc cần l&agrave;m trong ng&agrave;y, n&oacute; sẽ rung l&ecirc;n v&agrave; nhấp nh&aacute;y m&agrave;n h&igrave;nh để b&aacute;o những việc quan trọng. Khi bạn kh&ocirc;ng sử dụng, Calendar Watch sẽ tự động chuyển sang chế độ tiết kiệm pin, chỉ hiển thị giờ, tuy nhi&ecirc;n sẽ ngay lập tức hoạt động trở lại khi ph&aacute;t hiện ra bạn đang cần đến n&oacute;.</p>

<p>Chiếc đồng hồ c&oacute; mặt k&iacute;nh l&agrave;m từ sapphire với lớp phủ chống l&oacute;a đảm bảo bề mặt kh&ocirc;ng bị trầy xước, b&ecirc;n trong c&oacute; gắn cảm biến rung v&agrave; m&agrave;n h&igrave;nh hiển thị c&oacute; kết nối Bluetooth. Ba kim đồng hồ được t&iacute;ch hợp với s&oacute;ng di động, n&ecirc;n sẽ tự động điều chỉnh giờ ch&iacute;nh x&aacute;c, ngay cả khi bạn đi du lịch đến c&aacute;c m&uacute;i giờ kh&aacute;c nhau. Ngo&agrave;i ra đồng hồ c&ograve;n c&oacute; khả năng chống thấm nước ở mức &aacute;p suất l&ecirc;n tới 5 atm.</p>

<p>Bạn c&oacute; thể chọn một trong 3 mẫu thiết kế hiện c&oacute; của Calendar Watch l&agrave; Polar White, Aqua Blue hoặc phi&ecirc;n bản đặc biệt Black. Trong khi Polar White nổi bật với m&agrave;u trắng thanh lịch c&ugrave;ng d&acirc;y đeo bằng da thật m&agrave;u n&acirc;u, Aqua Blue g&acirc;y bắt mắt bởi m&agrave;u xanh dương quyến rũ, th&igrave; Black vẫn rất cuốn h&uacute;t với vẻ sang trọng của m&igrave;nh.</p>

<p>Hiện mẫu đồng hồ n&agrave;y đ&atilde; huy động th&agrave;nh c&ocirc;ng hơn 137 ngh&igrave;n EUR (khoảng 3,4 tỷ VND) tr&ecirc;n trang g&oacute;p vốn Kickstarter, gấp 1,5 lần số vốn ban đầu. Dự kiến sản phẩm sẽ được b&aacute;n ra v&agrave;o th&aacute;ng 9/2016 với mức gi&aacute; từ 240 EUR (5,9 triệu VND). Bạn đọc y&ecirc;u th&iacute;ch c&oacute; thể đặt mua sản phẩm ngay b&acirc;y giờ tr&ecirc;n Kickstarter để nhận được mức gi&aacute; giảm 40-50%.</p>

<p><a href="https://www.kickstarter.com/projects/1540240985/calendar-watch?ref=ksrfb" target="_blank">Bạn c&oacute; thể tham khảo v&agrave; đặt mua sản phẩm</a></p>

<p><img alt="Khỏi cần giấy ghi chú, chiếc đồng hồ này sẽ nhắc bạn làm gì mỗi ngày - Ảnh 3." src="http://k14.vcmedia.vn/thumb_w/600/2016/photo-1-1457631584821.jpg" style="margin:0px" /></p>

<p>&nbsp;Tr&ecirc;n mặt số của đồng hồ kh&ocirc;ng chỉ hiển thị giờ, m&agrave; c&ograve;n cho thấy lịch tr&igrave;nh trong 12-24 tiếng tiếp theo của bạn.</p>

<p><img alt="Khỏi cần giấy ghi chú, chiếc đồng hồ này sẽ nhắc bạn làm gì mỗi ngày - Ảnh 4." src="http://k14.vcmedia.vn/thumb_w/600/2016/photo-1-1457631609710.png" style="margin:0px" /></p>

<p>&nbsp;Bạn c&oacute; thể chọn một trong 3 mẫu thiết kế hiện c&oacute; của Calendar Watch l&agrave; Polar White, Aqua Blue hoặc phi&ecirc;n bản đặc biệt Black.</p>

<p><img alt="Khỏi cần giấy ghi chú, chiếc đồng hồ này sẽ nhắc bạn làm gì mỗi ngày - Ảnh 5." src="http://k14.vcmedia.vn/thumb_w/500/2016/photo-1-1457631624827.gif" style="margin:0px; width:500px" /></p>

<p>Đồng hồ sẽ tự động đồng bộ lịch tr&igrave;nh với điện thoại của bạn v&agrave; hiển thị c&aacute;c c&ocirc;ng việc cần l&agrave;m trong ng&agrave;y.</p>

<p><img alt="Khỏi cần giấy ghi chú, chiếc đồng hồ này sẽ nhắc bạn làm gì mỗi ngày - Ảnh 6." src="http://k14.vcmedia.vn/thumb_w/500/2016/photo-1-1457631634153.gif" style="margin:0px; width:500px" /></p>

<p>&nbsp;Ba kim đồng hồ được t&iacute;ch hợp với s&oacute;ng di động, n&ecirc;n sẽ tự động điều chỉnh giờ ch&iacute;nh x&aacute;c, ngay cả khi bạn đi du lịch đến c&aacute;c m&uacute;i giờ kh&aacute;c nhau.</p>

<p><img alt="Khỏi cần giấy ghi chú, chiếc đồng hồ này sẽ nhắc bạn làm gì mỗi ngày - Ảnh 7." src="http://k14.vcmedia.vn/thumb_w/500/2016/photo-1-1457631682150.gif" style="margin:0px; width:500px" /></p>

<p>&nbsp;Nếu bạn c&oacute; ghi ch&uacute; đặc biệt cho một việc n&agrave;o đ&oacute;, chiếc đồng hồ sẽ th&ocirc;ng b&aacute;o cho bạn bằng c&aacute;ch rung l&ecirc;n v&agrave; nhấp nh&aacute;y m&agrave;n h&igrave;nh.</p>

<p><img alt="Khỏi cần giấy ghi chú, chiếc đồng hồ này sẽ nhắc bạn làm gì mỗi ngày - Ảnh 8." src="http://k14.vcmedia.vn/thumb_w/600/2016/photo-1-1457631709620.png" style="margin:0px" /></p>

<p>&nbsp;Dự kiến sản phẩm sẽ được b&aacute;n ra v&agrave;o th&aacute;ng 9/2016 với mức gi&aacute; từ 5,9 triệu VND.&nbsp;</p>
', 1, N'/images/news/photo-1-1457631634153-0-6-372-601-crop-1457631886861.gif', NULL)
INSERT [dbo].[News] ([id], [title], [content], [uploader], [image], [date]) VALUES (30, N'Bộ sưu tập đồng hồ gỗ tự nhiên thân thiện với môi trường', N'<h2>Những chiếc đồng hồ mang nh&atilde;n hiệu GUFO được chế t&aacute;c đầy tinh xảo từ gỗ tự nhi&ecirc;n xứng đ&aacute;ng l&agrave; m&oacute;n đồ độc nhất v&ocirc; nhị trong bộ sưu tập đồng hồ của bạn.</h2>

<p>Khi đồng hồ trở th&agrave;nh biểu tượng của thời trang như hiện nay, cuộc đua giữa những nh&agrave; sản xuất l&agrave;m h&agrave;i l&ograve;ng kh&aacute;ch h&agrave;ng c&agrave;ng trở n&ecirc;n gay gắt. Mong muốn chiếc đồng hồ kh&ocirc;ng chỉ đẹp, m&agrave; c&ograve;n độc đ&aacute;o v&agrave; duy nhất, một nh&oacute;m thiết kế của c&ocirc;ng ty Giuseppe Marino đến từ Milan, &Yacute; đ&atilde; d&agrave;y c&ocirc;ng nghi&ecirc;n cứu v&agrave; tạo ra bộ sưu tập đồng hồ GUFO.</p>

<p>&nbsp;Video giới thiệu đồng hồ GUFO.</p>

<p><img alt="Bộ sưu tập đồng hồ gỗ tự nhiên thân thiện với môi trường - Ảnh 2." src="http://k14.vcmedia.vn/thumb_w/600/2016/photo-1-1456244034804.jpg" style="margin:0px" /></p>

<p>&nbsp;Đồng hồ l&agrave;m từ gỗ 100% cực kỳ độc đ&aacute;o.</p>

<p>Chất liệu l&agrave; điều l&agrave;m n&ecirc;n sự kh&aacute;c biệt của d&ograve;ng đồng hồ n&agrave;y. GUFO được l&agrave;m từ 100% gỗ tự nhi&ecirc;n cao cấp, với tất cả c&aacute;c chi tiết đều được khắc đẽo tỉ mỉ bằng tay. V&igrave; kh&ocirc;ng c&oacute; 2 miếng gỗ n&agrave;o giống nhau ho&agrave;n to&agrave;n, nh&agrave; sản xuất tự tin khẳng định mỗi chiếc đồng hồ GUFO l&agrave; duy nhất, kh&ocirc;ng lo đụng h&agrave;ng. Bộ sưu tập c&oacute; rất nhiều mẫu thiết kế kh&aacute;c nhau với b&aacute;n k&iacute;nh dao động từ 36-45mm, mặt đồng hồ l&agrave;m từ k&iacute;nh chống xước, vỡ nhằm gia tăng tuổi thọ của mỗi chiếc đồng hồ.</p>

<p>Bộ sưu tập GUFO nổi bật với 2 d&ograve;ng đồng hồ ch&iacute;nh l&agrave; Rebel với thiết kế mặt k&iacute;nh tr&ograve;n v&agrave; Dark Rarity với thiết kế mặt vu&ocirc;ng. Tất cả được l&agrave;m chủ yếu từ gỗ mun, gỗ c&acirc;y phong, gỗ c&acirc;y Koa tại Hawai v&agrave; gỗ mun ngựa vằn, mang đến vẻ đẹp độc đ&aacute;o rất ri&ecirc;ng. Kh&ocirc;ng dừng ở đ&oacute;, nh&agrave; sản xuất c&ograve;n tiếp tục cho ra mắt mẫu đồng hồ mặt gỗ nhưng d&acirc;y đeo dệt sợi c&oacute; thể thay đổi chỉ trong v&ograve;ng 10 gi&acirc;y. Với 33 mẫu d&acirc;y đeo đủ m&agrave;u sắc, họa tiết, bạn c&oacute; thể dễ d&agrave;ng thay đổi phong c&aacute;ch linh hoạt mỗi ng&agrave;y.</p>

<p>Hiện tại mẫu đồng hồ n&agrave;y đ&atilde; huy động th&agrave;nh c&ocirc;ng 7,5 ngh&igrave;n EUR ( gần 184 triệu VND) tr&ecirc;n trang g&oacute;p vốn Kickstarter, gấp 2,5 lần số vốn ban đầu. Dự kiến sản phẩm sẽ được xuất xưởng v&agrave;o th&aacute;ng 4/2016 với mức gi&aacute; 119 EUR (khoảng 2,9 triệu VND). Bạn đọc y&ecirc;u th&iacute;ch h&atilde;y đặt mua ngay b&acirc;y giờ tr&ecirc;n Kickstarter để nhận mức gi&aacute; ưu đ&atilde;i chỉ 79 EUR (1,9 triệu VND).</p>

<p><a href="https://www.kickstarter.com/projects/giuseppemarino/gufo-the-original-wooden-watches-ecofriendly-and-h?ref=category_popular" target="_blank">Bạn c&oacute; thể tham khảo v&agrave; đặt mua sản phẩm</a></p>

<p><img alt="Bộ sưu tập đồng hồ gỗ tự nhiên thân thiện với môi trường - Ảnh 3." src="http://k14.vcmedia.vn/thumb_w/600/2016/photo-1-1456244689467.jpg" style="margin:0px" /></p>

<p>&nbsp;Bộ sưu tập GUFO nổi bật với 2 d&ograve;ng đồng hồ ch&iacute;nh l&agrave; Rebel.</p>

<p><img alt="Bộ sưu tập đồng hồ gỗ tự nhiên thân thiện với môi trường - Ảnh 4." src="http://k14.vcmedia.vn/thumb_w/600/2016/photo-1-1456244703123.jpg" style="margin:0px" /></p>

<p>&nbsp;V&agrave; d&ograve;ng đồng hồ Dark Rarity.</p>

<p><img alt="Bộ sưu tập đồng hồ gỗ tự nhiên thân thiện với môi trường - Ảnh 5." src="http://k14.vcmedia.vn/thumb_w/600/2016/photo-1-1456244727084.png" style="margin:0px" /></p>

<p>&nbsp;Thiết kế mặt k&iacute;nh tr&ograve;n đ&iacute;nh đ&aacute; sang trọng.</p>

<p><img alt="Bộ sưu tập đồng hồ gỗ tự nhiên thân thiện với môi trường - Ảnh 6." src="http://k14.vcmedia.vn/thumb_w/600/2016/photo-1-1456244741197.jpg" style="margin:0px" /></p>

<p>&nbsp;Hay mặt đồng hồ vu&ocirc;ng lịch l&atilde;m cho nam giới.</p>

<p><img alt="Bộ sưu tập đồng hồ gỗ tự nhiên thân thiện với môi trường - Ảnh 7." src="http://k14.vcmedia.vn/thumb_w/600/2016/photo-1-1456244853153.jpg" style="margin:0px" /></p>

<p>&nbsp;Đồng hồ được l&agrave;m chủ yếu từ gỗ mun, gỗ c&acirc;y phong, gỗ c&acirc;y Koa tại Hawai v&agrave; gỗ mun ngựa vằn, mang đến vẻ đẹp độc đ&aacute;o rất ri&ecirc;ng.</p>

<p><img alt="Bộ sưu tập đồng hồ gỗ tự nhiên thân thiện với môi trường - Ảnh 8." src="http://k14.vcmedia.vn/thumb_w/600/2016/photo-1-1456244762353.jpg" style="margin:0px" /></p>

<p>&nbsp;Mẫu đồng hồ mặt gỗ nhưng d&acirc;y đeo dệt sợi c&oacute; thể thay đổi chỉ trong v&ograve;ng 10 gi&acirc;y.</p>

<p><img alt="Bộ sưu tập đồng hồ gỗ tự nhiên thân thiện với môi trường - Ảnh 9." src="http://k14.vcmedia.vn/thumb_w/600/2016/photo-1-1456244789588.jpg" style="margin:0px" /></p>

<p>&nbsp;Đủ loại d&acirc;y đeo với m&agrave;u sắc, họa tiết kh&aacute;c nhau.</p>

<p><img alt="Bộ sưu tập đồng hồ gỗ tự nhiên thân thiện với môi trường - Ảnh 10." src="http://k14.vcmedia.vn/thumb_w/600/2016/photo-1-1456244796976.jpg" style="margin:0px" /></p>

<p>&nbsp;Cho bạn thay đổi phong c&aacute;ch linh hoạt mỗi ng&agrave;y.</p>

<p><img alt="Bộ sưu tập đồng hồ gỗ tự nhiên thân thiện với môi trường - Ảnh 11." src="http://k14.vcmedia.vn/thumb_w/600/2016/photo-1-1456244863510.jpg" style="margin:0px" /></p>

<p>&nbsp;V&igrave; kh&ocirc;ng c&oacute; 2 miếng gỗ n&agrave;o giống nhau ho&agrave;n to&agrave;n, nh&agrave; sản xuất tự tin khẳng định mỗi chiếc đồng hồ GUFO l&agrave; duy nhất, kh&ocirc;ng lo đụng h&agrave;ng.</p>

<p><img alt="Bộ sưu tập đồng hồ gỗ tự nhiên thân thiện với môi trường - Ảnh 12." src="http://k14.vcmedia.vn/thumb_w/600/2016/photo-1-1456244879434.jpg" style="margin:0px" /></p>

<p>&nbsp;Dự kiến sản phẩm sẽ được xuất xưởng v&agrave;o th&aacute;ng 4/2016 với mức gi&aacute; khoảng 2,9 triệu VND.</p>
', NULL, N'/images/news/photo-1-1456244879434-50-26-457-676-crop-1456245284368.jpg', NULL)
SET IDENTITY_INSERT [dbo].[News] OFF
INSERT [dbo].[NewsFeed] ([Id], [Title], [Content], [CreatedBy], [Image], [CreatedDate]) VALUES (4, N'Bộ sưu tập đồng hồ đeo tay bí ẩn mang phong cách ma cà rồng', N'<h2>Peren SOD l&agrave; sự kết hợp ho&agrave;n hảo giữa truyền thuyết Dracula huyền b&iacute; v&agrave; chất lượng cao cấp của đồng hồ Thụy Sĩ danh tiếng.</h2>', 1, N'/images/news/1-1461869284819-88-0-513-680-crop-1461869341958.jpg', NULL)
INSERT [dbo].[NewsFeed] ([Id], [Title], [Content], [CreatedBy], [Image], [CreatedDate]) VALUES (5, N'Bộ sưu tập đồng hồ Ý sành điệu với mức giá bình dân đến bất ngờ', N'<h2>ang chảnh đ&acirc;u chỉ d&agrave;nh cho d&acirc;n nh&agrave; gi&agrave;u l&agrave; những g&igrave; bạn sẽ thốt l&ecirc;n sau khi xem bộ sưu tập đồng hồ n&agrave;y.</h2>', 1, N'/images/news/photo-1-1458490182325-20-82-344-602-crop-1458490576234.jpg', NULL)
INSERT [dbo].[NewsFeed] ([Id], [Title], [Content], [CreatedBy], [Image], [CreatedDate]) VALUES (6, N'Điểm mặt những mẫu đồng hồ G-Shock mới ra mắt trong tháng 3/2016', N'<h2>H&atilde;ng đồng hồ Casio đ&atilde; li&ecirc;n tục cho ra đời mẫu G-Shock phi&ecirc;n bản đặc biệt d&agrave;nh ri&ecirc;ng cho c&aacute;c fan h&acirc;m mộ d&ograve;ng đồng hồ đeo tay n&agrave;y.</h2>', 1, N'/images/news/g5-1457942560473-11-0-449-700-crop-1457943192601.jpeg', NULL)
INSERT [dbo].[NewsFeed] ([Id], [Title], [Content], [CreatedBy], [Image], [CreatedDate]) VALUES (7, N'Chiêm ngưỡng cỗ máy thời gian tinh xảo hàng đầu thế giới', N'<h2>Bạn c&oacute; bao giờ nghĩ rằng để l&agrave;m ra mặt đồng hồ lại giống như một t&aacute;c phẩm nghệ thuật như thế n&agrave;y hay chưa?</h2>', 1, N'/images/news/rube2-1458898210435.gif', NULL)
INSERT [dbo].[NewsFeed] ([Id], [Title], [Content], [CreatedBy], [Image], [CreatedDate]) VALUES (8, N'Khỏi cần giấy ghi chú, chiếc đồng hồ này sẽ nhắc bạn làm gì mỗi ngày', N'<h2>Chiếc đồng hồ th&ocirc;ng minh t&iacute;ch hợp t&iacute;nh năng xem giờ v&agrave; ng&agrave;y th&aacute;ng một l&uacute;c gi&uacute;p bạn quản l&yacute; thật tốt thời gian biểu của m&igrave;nh.</h2>', 1, N'/images/news/photo-1-1457631634153-0-6-372-601-crop-1457631886861.gif', NULL)
INSERT [dbo].[NewsFeed] ([Id], [Title], [Content], [CreatedBy], [Image], [CreatedDate]) VALUES (9, N'Bộ sưu tập đồng hồ gỗ tự nhiên thân thiện với môi trường', N'<h2>Những chiếc đồng hồ mang nh&atilde;n hiệu GUFO được chế t&aacute;c đầy tinh xảo từ gỗ tự nhi&ecirc;n xứng đ&aacute;ng l&agrave; m&oacute;n đồ độc nhất v&ocirc; nhị trong bộ sưu tập đồng hồ của bạn.</h2>', 1, N'/images/news/photo-1-1456244879434-50-26-457-676-crop-1456245284368.jpg', NULL)
INSERT [dbo].[NewsFeed] ([Id], [Title], [Content], [CreatedBy], [Image], [CreatedDate]) VALUES (10, N'Mẫu đồng hồ mà bạn luôn muốn đeo trên tay mỗi ngày', N'<h2>hiếc đồng hồ Miro Everyday được thiết kế để trở th&agrave;nh người bạn đồng h&agrave;nh của bất cứ ai trong mọi ho&agrave;n cảnh.</h2>', 1, N'/images/news/photo-1-1455508701639-42-7-438-641-crop-1455509204088.jpg', NULL)
INSERT [dbo].[NewsFeed] ([Id], [Title], [Content], [CreatedBy], [Image], [CreatedDate]) VALUES (11, N'Tưng bừng sắm Tết với bộ sưu tập đồng hồ cá tính đến từ G-Shock', N'<h2>Chiếc đồng hồ thể thao chất lừ sẽ trở th&agrave;nh điểm nhấn ho&agrave;n hảo cho trang phục chơi Tết năm nay.</h2>', 1, N'/images/news/5-1455104428905-28-0-465-700-crop-1455104460828.jpg', NULL)
INSERT [dbo].[NewsFeed] ([Id], [Title], [Content], [CreatedBy], [Image], [CreatedDate]) VALUES (12, N'Bộ sưu tập đồng hồ đeo tay thời thượng với thiết kế thách thức thời gian', N'<h2>Vẻ đẹp vĩnh cửu của những chiếc đồng hồ Thụy Điển nổi tiếng bao đời l&agrave; những g&igrave; Jacob &amp; Skold muốn t&aacute;i hiện trong mẫu thiết kế n&agrave;y.</h2>', 1, N'/images/news/photo-1-1454512418215-9-40-378-631-crop-1454512649469.jpg', NULL)
INSERT [dbo].[NewsFeed] ([Id], [Title], [Content], [CreatedBy], [Image], [CreatedDate]) VALUES (13, N'Top 7 chiếc đồng hồ gây ấn tượng nhất tại triển lãm SIHH 2016', N'<h2>hững chiếc đồng hồ n&agrave;y được ra mắt đầu năm 2016 tại SIHH - triển l&atilde;m đồng hồ quy tụ những si&ecirc;u phẩm danh tiếng nhất thế giới.</h2>', 1, N'/images/news/photo-1-1454384469522-8-58-390-670-crop-1454385125789.jpg', NULL)
INSERT [dbo].[NewsFeed] ([Id], [Title], [Content], [CreatedBy], [Image], [CreatedDate]) VALUES (14, N'Bộ sưu tập đồng hồ hàng hải dành cho các chàng trai mê phong cách cổ điển lịch lãm', N'<h2>Phong c&aacute;ch cổ điển của những ch&agrave;ng thủy thủ thế kỷ 19 l&agrave; những g&igrave; bộ sưu tập đồng hồ The Nereid sẽ mang đến cho ph&aacute;i mạnh.</h2>', 1, N'/images/news/photo-1-1454297981619-86-44-444-617-crop-1454299296631.jpg', NULL)
INSERT [dbo].[ProductCategory] ([CategoryID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (1, N'RADO', N'', 1, 0, NULL, CAST(N'2019-10-10T18:49:09.037' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([CategoryID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (2, N'CADINO', NULL, NULL, 0, NULL, CAST(N'2019-10-10T18:50:35.377' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([CategoryID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (3, N'BULOVA', NULL, NULL, 0, NULL, CAST(N'2019-10-10T18:51:30.280' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([CategoryID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (4, N'CITIZEN', NULL, NULL, 0, NULL, CAST(N'2019-10-10T18:51:37.300' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([CategoryID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (5, N'SEIKO', NULL, NULL, 0, NULL, CAST(N'2019-10-10T18:51:48.553' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([CategoryID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (6, N'CASIO', NULL, NULL, 0, NULL, CAST(N'2019-10-11T13:05:26.477' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([CategoryID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (7, N'ORIENT', NULL, NULL, 0, NULL, CAST(N'2019-10-11T13:05:26.540' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([CategoryID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (8, N'SKAGEN', NULL, NULL, 0, NULL, CAST(N'2019-10-11T13:05:26.593' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([CategoryID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (9, N'TITAN', NULL, NULL, 0, NULL, CAST(N'2019-10-11T13:05:26.640' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([CategoryID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (10, N'THỤY SĨ', NULL, NULL, 0, NULL, CAST(N'2019-10-11T13:05:26.690' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Price], [ProductImage], [Quantity], [PromotionPrice], [MetaTitle], [Description], [MoreImages], [IncludeVAT], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCounts]) VALUES (6, 1, N'ĐỒNG HỒ RADO R12637013', CAST(11900000 AS Decimal(18, 0)), N'/images/products/R12637013.jpg', 100, CAST(1390000 AS Decimal(18, 0)), NULL, N'ORIGINAL 35 mm, stainless steel, sapphire', NULL, NULL, NULL, NULL, CAST(N'2019-10-11T14:13:25.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Price], [ProductImage], [Quantity], [PromotionPrice], [MetaTitle], [Description], [MoreImages], [IncludeVAT], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCounts]) VALUES (8, 2, N'ĐỒNG HỒ CADINO R12413064', CAST(2000000 AS Decimal(18, 0)), N'/images/c-2.jpg', 49, CAST(2500000 AS Decimal(18, 0)), NULL, N'ORIGINAL 35 mm, stainless steel, sapphire', NULL, NULL, NULL, NULL, CAST(N'2019-10-11T14:13:25.203' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Price], [ProductImage], [Quantity], [PromotionPrice], [MetaTitle], [Description], [MoreImages], [IncludeVAT], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCounts]) VALUES (10, 2, N'ĐỒNG HỒ CADINO R12637013', CAST(11900000 AS Decimal(18, 0)), N'/images/products/1-1461869284819-88-0-513-680-crop-1461869341958.jpg', 49, CAST(1390000 AS Decimal(18, 0)), NULL, N'ORIGINAL 35 mm, stainless steel, sapphire', NULL, NULL, NULL, NULL, CAST(N'2019-10-11T14:13:25.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Price], [ProductImage], [Quantity], [PromotionPrice], [MetaTitle], [Description], [MoreImages], [IncludeVAT], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCounts]) VALUES (11, 3, N'ĐỒNG HỒ BULOVA R12637013', CAST(13700200 AS Decimal(18, 0)), N'/images/p-1.png', 50, CAST(1874000 AS Decimal(18, 0)), NULL, N'Sang trọng,đính pha lê, lịch thứ ngày, mặt số màu đen', NULL, NULL, NULL, NULL, CAST(N'2019-10-11T14:13:25.337' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Price], [ProductImage], [Quantity], [PromotionPrice], [MetaTitle], [Description], [MoreImages], [IncludeVAT], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCounts]) VALUES (12, 3, N'ĐỒNG HỒ BULOVA R12413064', CAST(2000000 AS Decimal(18, 0)), N'/images/p-2.png', 98, CAST(2500000 AS Decimal(18, 0)), NULL, N'ORIGINAL 35 mm, stainless steel, sapphire', NULL, NULL, NULL, NULL, CAST(N'2019-10-11T14:13:25.387' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Price], [ProductImage], [Quantity], [PromotionPrice], [MetaTitle], [Description], [MoreImages], [IncludeVAT], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCounts]) VALUES (13, 3, N'ĐỒNG HỒ BULOVA R12413064', CAST(12700200 AS Decimal(18, 0)), N'/images/products/photo-1-1455508701639-42-7-438-641-crop-1455509204088.jpg', 50, CAST(1474000 AS Decimal(18, 0)), NULL, N'Sang trọng,đính pha lê, lịch thứ ngày, mặt số màu đen', NULL, NULL, NULL, NULL, CAST(N'2019-10-11T14:13:25.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Price], [ProductImage], [Quantity], [PromotionPrice], [MetaTitle], [Description], [MoreImages], [IncludeVAT], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCounts]) VALUES (14, 3, N'ĐỒNG HỒ BULOVA R12637013', CAST(11900000 AS Decimal(18, 0)), N'/images/products/photo-1-1454512418215-9-40-378-631-crop-1454512649469.jpg', 50, CAST(1390000 AS Decimal(18, 0)), NULL, N'ORIGINAL 35 mm, stainless steel, sapphire', NULL, NULL, NULL, NULL, CAST(N'2019-10-11T14:13:25.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Price], [ProductImage], [Quantity], [PromotionPrice], [MetaTitle], [Description], [MoreImages], [IncludeVAT], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCounts]) VALUES (15, 4, N'ĐỒNG HỒ BULOVA R12637013', CAST(13700200 AS Decimal(18, 0)), N'/images/p-4.png', 51, CAST(1874000 AS Decimal(18, 0)), NULL, N'Sang trọng,đính pha lê, lịch thứ ngày, mặt số màu đen', NULL, NULL, NULL, NULL, CAST(N'2019-10-11T14:13:25.517' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Price], [ProductImage], [Quantity], [PromotionPrice], [MetaTitle], [Description], [MoreImages], [IncludeVAT], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCounts]) VALUES (16, 4, N'ĐỒNG HỒ CITIZEN 12413064', CAST(2000000 AS Decimal(18, 0)), N'/images/p-5.png', 50, CAST(2500000 AS Decimal(18, 0)), NULL, N'ORIGINAL 35 mm, stainless steel, sapphire', NULL, NULL, NULL, NULL, CAST(N'2019-10-11T14:13:25.560' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Price], [ProductImage], [Quantity], [PromotionPrice], [MetaTitle], [Description], [MoreImages], [IncludeVAT], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCounts]) VALUES (18, 4, N'ĐỒNG HỒ CITIZEN R12637013', CAST(11900000 AS Decimal(18, 0)), N'/images/products/photo-1-1455508701639-42-7-438-641-crop-1455509204088.jpg', 50, CAST(1390000 AS Decimal(18, 0)), NULL, N'ORIGINAL 35 mm, stainless steel, sapphire', NULL, NULL, NULL, NULL, CAST(N'2019-10-11T14:13:25.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Price], [ProductImage], [Quantity], [PromotionPrice], [MetaTitle], [Description], [MoreImages], [IncludeVAT], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCounts]) VALUES (19, 5, N'ĐỒNG HỒ SEIKO R12637013', CAST(13700200 AS Decimal(18, 0)), N'/images/p-7.png', 50, CAST(1874000 AS Decimal(18, 0)), NULL, N'Sang trọng,đính pha lê, lịch thứ ngày, mặt số màu đen', NULL, NULL, NULL, NULL, CAST(N'2019-10-11T14:13:25.697' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Price], [ProductImage], [Quantity], [PromotionPrice], [MetaTitle], [Description], [MoreImages], [IncludeVAT], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCounts]) VALUES (20, 5, N'ĐỒNG HỒ SEIKO R12413064', CAST(2000000 AS Decimal(18, 0)), N'/images/products/abt-1.jpg', 50, CAST(2500000 AS Decimal(18, 0)), NULL, N'ORIGINAL 35 mm, stainless steel, sapphire', NULL, NULL, NULL, NULL, CAST(N'2019-10-11T14:13:25.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Price], [ProductImage], [Quantity], [PromotionPrice], [MetaTitle], [Description], [MoreImages], [IncludeVAT], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCounts]) VALUES (21, 5, N'ĐỒNG HỒ SEIKO R12413064', CAST(12700200 AS Decimal(18, 0)), N'/images/s-1.jpg', 50, CAST(1474000 AS Decimal(18, 0)), NULL, N'Sang trọng,đính pha lê, lịch thứ ngày, mặt số màu đen', NULL, NULL, NULL, NULL, CAST(N'2019-10-11T14:13:25.973' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Price], [ProductImage], [Quantity], [PromotionPrice], [MetaTitle], [Description], [MoreImages], [IncludeVAT], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCounts]) VALUES (22, 5, N'ĐỒNG HỒ SEIKO R12637013', CAST(11900000 AS Decimal(18, 0)), N'/images/products/R12637013.jpg', 50, CAST(1390000 AS Decimal(18, 0)), NULL, N'ORIGINAL 35 mm, stainless steel, sapphire', NULL, NULL, NULL, NULL, CAST(N'2019-10-11T14:13:26.020' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Price], [ProductImage], [Quantity], [PromotionPrice], [MetaTitle], [Description], [MoreImages], [IncludeVAT], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCounts]) VALUES (23, 6, N'ĐỒNG HỒ CASIOR 12637013', CAST(13700200 AS Decimal(18, 0)), N'/images/products/R12408613-220x275.jpg', 50, CAST(1874000 AS Decimal(18, 0)), NULL, N'Sang trọng,đính pha lê, lịch thứ ngày, mặt số màu đen', NULL, NULL, NULL, NULL, CAST(N'2019-10-11T14:13:26.067' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Price], [ProductImage], [Quantity], [PromotionPrice], [MetaTitle], [Description], [MoreImages], [IncludeVAT], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCounts]) VALUES (24, 6, N'ĐỒNG HỒ CASIO R12413065', CAST(2000000 AS Decimal(18, 0)), N'/images/p-1.png', 50, CAST(2500000 AS Decimal(18, 0)), NULL, N'ORIGINAL 35 mm, stainless steel, sapphire', NULL, NULL, NULL, NULL, CAST(N'2019-10-11T14:13:26.110' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Price], [ProductImage], [Quantity], [PromotionPrice], [MetaTitle], [Description], [MoreImages], [IncludeVAT], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCounts]) VALUES (25, 6, N'ĐỒNG HỒ CASIO R12413064', CAST(12700200 AS Decimal(18, 0)), N'/images/products/R12413064.jpg', 50, CAST(1474000 AS Decimal(18, 0)), NULL, N'Sang trọng,đính pha lê, lịch thứ ngày, mặt số màu đen', NULL, NULL, NULL, NULL, CAST(N'2019-10-11T14:13:26.150' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Price], [ProductImage], [Quantity], [PromotionPrice], [MetaTitle], [Description], [MoreImages], [IncludeVAT], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCounts]) VALUES (26, 6, N'ĐỒNG HỒ CASIO R12637013', CAST(11900000 AS Decimal(18, 0)), N'/images/c-2.jpg', 50, CAST(1390000 AS Decimal(18, 0)), NULL, N'ORIGINAL 35 mm, stainless steel, sapphire', NULL, NULL, NULL, NULL, CAST(N'2019-10-11T14:13:26.193' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Price], [ProductImage], [Quantity], [PromotionPrice], [MetaTitle], [Description], [MoreImages], [IncludeVAT], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCounts]) VALUES (27, 7, N'ĐỒNG HỒ ORIENT R12637013', CAST(13700200 AS Decimal(18, 0)), N'/images/products/R12408613-220x275.jpg', 50, CAST(1874000 AS Decimal(18, 0)), NULL, N'Sang trọng,đính pha lê, lịch thứ ngày, mặt số màu đen', NULL, NULL, NULL, NULL, CAST(N'2019-10-11T14:13:26.237' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Price], [ProductImage], [Quantity], [PromotionPrice], [MetaTitle], [Description], [MoreImages], [IncludeVAT], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCounts]) VALUES (28, 7, N'ĐỒNG HỒ ORIENT R12413064', CAST(2000000 AS Decimal(18, 0)), N'/images/p-3.png', 50, CAST(2500000 AS Decimal(18, 0)), NULL, N'ORIGINAL 35 mm, stainless steel, sapphire', NULL, NULL, NULL, NULL, CAST(N'2019-10-11T14:13:26.283' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Price], [ProductImage], [Quantity], [PromotionPrice], [MetaTitle], [Description], [MoreImages], [IncludeVAT], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCounts]) VALUES (29, 7, N'ĐỒNG HỒ ORIENT R12413064', CAST(12700200 AS Decimal(18, 0)), N'/images/products/R12413064.jpg', 50, CAST(1474000 AS Decimal(18, 0)), NULL, N'Sang trọng,đính pha lê, lịch thứ ngày, mặt số màu đen', NULL, NULL, NULL, NULL, CAST(N'2019-10-11T14:13:26.330' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Price], [ProductImage], [Quantity], [PromotionPrice], [MetaTitle], [Description], [MoreImages], [IncludeVAT], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCounts]) VALUES (30, 7, N'ĐỒNG HỒ ORIENT R12637013', CAST(11900000 AS Decimal(18, 0)), N'/images/products/R12637013.jpg', 50, CAST(1390000 AS Decimal(18, 0)), NULL, N'ORIGINAL 35 mm, stainless steel, sapphire', NULL, NULL, NULL, NULL, CAST(N'2019-10-11T14:13:26.373' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Price], [ProductImage], [Quantity], [PromotionPrice], [MetaTitle], [Description], [MoreImages], [IncludeVAT], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCounts]) VALUES (31, 8, N'ĐỒNG HỒ SKAGEN R12637013', CAST(13700200 AS Decimal(18, 0)), N'/images/p-2.png', 50, CAST(1874000 AS Decimal(18, 0)), NULL, N'Sang trọng,đính pha lê, lịch thứ ngày, mặt số màu đen', NULL, NULL, NULL, NULL, CAST(N'2019-10-11T14:13:26.417' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Price], [ProductImage], [Quantity], [PromotionPrice], [MetaTitle], [Description], [MoreImages], [IncludeVAT], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCounts]) VALUES (32, 8, N'ĐỒNG HỒ SKAGEN R12413064', CAST(2000000 AS Decimal(18, 0)), N'/images/s-3.jpg', 50, CAST(2500000 AS Decimal(18, 0)), NULL, N'ORIGINAL 35 mm, stainless steel, sapphire', NULL, NULL, NULL, NULL, CAST(N'2019-10-11T14:13:26.463' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Price], [ProductImage], [Quantity], [PromotionPrice], [MetaTitle], [Description], [MoreImages], [IncludeVAT], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCounts]) VALUES (33, 8, N'ĐỒNG HỒ SKAGEN R12413064', CAST(12700200 AS Decimal(18, 0)), N'/images/products/R12413064.jpg', 50, CAST(1474000 AS Decimal(18, 0)), NULL, N'Sang trọng,đính pha lê, lịch thứ ngày, mặt số màu đen', NULL, NULL, NULL, NULL, CAST(N'2019-10-11T14:13:26.507' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Price], [ProductImage], [Quantity], [PromotionPrice], [MetaTitle], [Description], [MoreImages], [IncludeVAT], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCounts]) VALUES (34, 8, N'ĐỒNG HỒ SKAGEN R12637013', CAST(11900000 AS Decimal(18, 0)), N'/images/c-3.jpg', 50, CAST(1390000 AS Decimal(18, 0)), NULL, N'ORIGINAL 35 mm, stainless steel, sapphire', NULL, NULL, NULL, NULL, CAST(N'2019-10-11T14:13:26.553' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Price], [ProductImage], [Quantity], [PromotionPrice], [MetaTitle], [Description], [MoreImages], [IncludeVAT], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCounts]) VALUES (35, 9, N'ĐỒNG HỒ TITAN R12413064', CAST(13700200 AS Decimal(18, 0)), N'/images/products/R12408613-220x275.jpg', 50, CAST(1874000 AS Decimal(18, 0)), NULL, N'Sang trọng,đính pha lê, lịch thứ ngày, mặt số màu đen', NULL, NULL, NULL, NULL, CAST(N'2019-10-11T14:13:26.600' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Price], [ProductImage], [Quantity], [PromotionPrice], [MetaTitle], [Description], [MoreImages], [IncludeVAT], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCounts]) VALUES (36, 9, N'ĐỒNG HỒ TITAN R12413064', CAST(2000000 AS Decimal(18, 0)), N'/images/p-8.png', 50, CAST(2500000 AS Decimal(18, 0)), NULL, N'ORIGINAL 35 mm, stainless steel, sapphire', NULL, NULL, NULL, NULL, CAST(N'2019-10-11T14:13:26.643' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Price], [ProductImage], [Quantity], [PromotionPrice], [MetaTitle], [Description], [MoreImages], [IncludeVAT], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCounts]) VALUES (37, 9, N'ĐỒNG HỒ TITAN R12413064', CAST(12700200 AS Decimal(18, 0)), N'/images/products/bnr-1.jpg', 50, CAST(1474000 AS Decimal(18, 0)), NULL, N'Sang trọng,đính pha lê, lịch thứ ngày, mặt số màu đen', NULL, NULL, NULL, NULL, CAST(N'2019-10-11T14:13:26.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Price], [ProductImage], [Quantity], [PromotionPrice], [MetaTitle], [Description], [MoreImages], [IncludeVAT], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCounts]) VALUES (38, 9, N'ĐỒNG HỒ TITAN R12637013', CAST(11900000 AS Decimal(18, 0)), N'/images/p-7.png', 49, CAST(1390000 AS Decimal(18, 0)), NULL, N'ORIGINAL 35 mm, stainless steel, sapphire', NULL, NULL, NULL, NULL, CAST(N'2019-10-11T14:13:26.730' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Price], [ProductImage], [Quantity], [PromotionPrice], [MetaTitle], [Description], [MoreImages], [IncludeVAT], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCounts]) VALUES (39, 10, N'ĐỒNG HỒ TITAN R12413064', CAST(13700200 AS Decimal(18, 0)), N'/images/products/R12408613-220x275.jpg', 50, CAST(1874000 AS Decimal(18, 0)), NULL, N'Sang trọng,đính pha lê, lịch thứ ngày, mặt số màu đen', NULL, NULL, NULL, NULL, CAST(N'2019-10-11T14:13:26.777' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Price], [ProductImage], [Quantity], [PromotionPrice], [MetaTitle], [Description], [MoreImages], [IncludeVAT], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCounts]) VALUES (40, 10, N'ĐỒNG HỒ THỤY SĨ R12413064', CAST(2000000 AS Decimal(18, 0)), N'/images/c-1.jpg', 50, CAST(2500000 AS Decimal(18, 0)), NULL, N'ORIGINAL 35 mm, stainless steel, sapphire', NULL, NULL, NULL, NULL, CAST(N'2019-10-11T14:13:26.820' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Price], [ProductImage], [Quantity], [PromotionPrice], [MetaTitle], [Description], [MoreImages], [IncludeVAT], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCounts]) VALUES (41, 10, N'ĐỒNG HỒ THỤY SĨ R12413064', CAST(12700000 AS Decimal(18, 0)), N'/images/products/p-4.png', 50, CAST(1474000 AS Decimal(18, 0)), NULL, N'Sang trọng,đính pha lê, lịch thứ ngày, mặt số màu đen', NULL, NULL, NULL, NULL, CAST(N'2019-10-11T14:13:26.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Price], [ProductImage], [Quantity], [PromotionPrice], [MetaTitle], [Description], [MoreImages], [IncludeVAT], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCounts]) VALUES (42, 10, N'ĐỒNG HỒ THỤY SĨ R12637013', CAST(11900000 AS Decimal(18, 0)), N'/images/s-1.jpg', 50, CAST(1390000 AS Decimal(18, 0)), NULL, N'ORIGINAL 35 mm, stainless steel, sapphire', NULL, NULL, NULL, NULL, CAST(N'2019-10-11T14:13:26.907' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [ProductName], [Price], [ProductImage], [Quantity], [PromotionPrice], [MetaTitle], [Description], [MoreImages], [IncludeVAT], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCounts]) VALUES (45, 6, N'ĐỒNG HỒ CASIO R12408988', CAST(2000000 AS Decimal(18, 0)), N'/images/products/abt-1.jpg', 100, CAST(10000000 AS Decimal(18, 0)), NULL, N'Sang trọng,đính pha lê, lịch thứ ngày, mặt số màu đen', NULL, NULL, N'Đồng hồ chính hãng', NULL, CAST(N'2019-12-17T05:20:09.603' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'Báo cáo tồn kho')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (2, N'Danh sách sản phẩm')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (3, N'Phân quyền')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (4, N'Quản lí đơn hàng')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (5, N'Quản lí khách hàng')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (6, N'Quản lí nhân viên')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (7, N'Quản lí phiếu mua hàng')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (8, N'Quản lí sản phẩm')
INSERT [dbo].[User ] ([Id], [Name], [UserName], [Password], [CreatedDate], [Status], [ModifiedDate], [Email], [Group_ID]) VALUES (1, N'Phạm Lê Huy', N'huy', N'1', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[User ] ([Id], [Name], [UserName], [Password], [CreatedDate], [Status], [ModifiedDate], [Email], [Group_ID]) VALUES (2, N'Nguyễn Hoàng Long', N'long', N'1', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[User ] ([Id], [Name], [UserName], [Password], [CreatedDate], [Status], [ModifiedDate], [Email], [Group_ID]) VALUES (3, N'Nguyễn Thị Hà', N'ha', N'1', NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[User ] ([Id], [Name], [UserName], [Password], [CreatedDate], [Status], [ModifiedDate], [Email], [Group_ID]) VALUES (4, N'nguyen thi ha', N'nguyenthiha', N'1', NULL, NULL, NULL, N'nguyenhath97@gmail.com', 2)
INSERT [dbo].[User ] ([Id], [Name], [UserName], [Password], [CreatedDate], [Status], [ModifiedDate], [Email], [Group_ID]) VALUES (5, N'Nguyễn Hoàng Long', N'longhoang', N'1', NULL, NULL, NULL, N'long98hoang', 3)
INSERT [dbo].[User ] ([Id], [Name], [UserName], [Password], [CreatedDate], [Status], [ModifiedDate], [Email], [Group_ID]) VALUES (6, N'Nguyễn Hoàng Long', N'longhoang', N'1', NULL, NULL, NULL, N'long98hoang', 3)
INSERT [dbo].[User ] ([Id], [Name], [UserName], [Password], [CreatedDate], [Status], [ModifiedDate], [Email], [Group_ID]) VALUES (7, N'Nguyễn Hoàng Long', N'longhoang', N'1', NULL, NULL, NULL, N'long98hoang', 3)
INSERT [dbo].[User ] ([Id], [Name], [UserName], [Password], [CreatedDate], [Status], [ModifiedDate], [Email], [Group_ID]) VALUES (8, N'Nguyễn Thị Hồng', N'hong', N'1', NULL, NULL, NULL, N'long98hoang@gmail.com', 3)
INSERT [dbo].[User ] ([Id], [Name], [UserName], [Password], [CreatedDate], [Status], [ModifiedDate], [Email], [Group_ID]) VALUES (9, N'Nguyễn Thị Hồng', N'hong', N'1', NULL, NULL, NULL, N'nguyenhong@gmail.com', 3)
INSERT [dbo].[User ] ([Id], [Name], [UserName], [Password], [CreatedDate], [Status], [ModifiedDate], [Email], [Group_ID]) VALUES (10, N'HA', N'khai', N'1', NULL, NULL, NULL, N'phamlehuy@gmail.com', 3)
INSERT [dbo].[UserGroup] ([Id], [Name], [Status]) VALUES (1, N'admin', NULL)
INSERT [dbo].[UserGroup] ([Id], [Name], [Status]) VALUES (2, N'Nhân viên', NULL)
INSERT [dbo].[UserGroup] ([Id], [Name], [Status]) VALUES (3, N'Khách hàng', NULL)
INSERT [dbo].[UserRole] ([Group_ID], [Role_ID]) VALUES (1, 1)
INSERT [dbo].[UserRole] ([Group_ID], [Role_ID]) VALUES (1, 2)
INSERT [dbo].[UserRole] ([Group_ID], [Role_ID]) VALUES (1, 3)
INSERT [dbo].[UserRole] ([Group_ID], [Role_ID]) VALUES (1, 4)
INSERT [dbo].[UserRole] ([Group_ID], [Role_ID]) VALUES (1, 5)
INSERT [dbo].[UserRole] ([Group_ID], [Role_ID]) VALUES (1, 6)
INSERT [dbo].[UserRole] ([Group_ID], [Role_ID]) VALUES (1, 7)
INSERT [dbo].[UserRole] ([Group_ID], [Role_ID]) VALUES (1, 8)
INSERT [dbo].[UserRole] ([Group_ID], [Role_ID]) VALUES (2, 1)
INSERT [dbo].[UserRole] ([Group_ID], [Role_ID]) VALUES (2, 2)
INSERT [dbo].[UserRole] ([Group_ID], [Role_ID]) VALUES (2, 4)
INSERT [dbo].[UserRole] ([Group_ID], [Role_ID]) VALUES (2, 7)
INSERT [dbo].[UserRole] ([Group_ID], [Role_ID]) VALUES (3, 2)
ALTER TABLE [dbo].[FeedBack] ADD  CONSTRAINT [DF_FeedBack_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[FeedBack] ADD  CONSTRAINT [DF_FeedBack_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_DisplayOrder]  DEFAULT ((0)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_ShowOnHome]  DEFAULT ((0)) FOR [ShowOnHome]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Sliders] ADD  CONSTRAINT [DF_Sliders_DisplayOrder]  DEFAULT ((1)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[Sliders] ADD  CONSTRAINT [DF_Sliders_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Sliders] ADD  CONSTRAINT [DF_Sliders_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_User ] FOREIGN KEY([Id])
REFERENCES [dbo].[User ] ([Id])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_User ]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Customers] FOREIGN KEY([Id])
REFERENCES [dbo].[Customers] ([Id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Customers]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Products] FOREIGN KEY([Product_Id])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Products]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductCategory] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[ProductCategory] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductCategory]
GO
