CREATE DATABASE	[ShopKiKeo]
GO

USE [ShopKiKeo]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 12/18/2019 4:23:19 AM ******/
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
/****** Object:  Table [dbo].[BillDetail]    Script Date: 12/18/2019 4:23:20 AM ******/
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
/****** Object:  Table [dbo].[Cart]    Script Date: 12/18/2019 4:23:20 AM ******/
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
/****** Object:  Table [dbo].[Contact]    Script Date: 12/18/2019 4:23:20 AM ******/
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
/****** Object:  Table [dbo].[Customers]    Script Date: 12/18/2019 4:23:20 AM ******/
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
/****** Object:  Table [dbo].[FeedBack]    Script Date: 12/18/2019 4:23:20 AM ******/
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
/****** Object:  Table [dbo].[NewsFeed]    Script Date: 12/18/2019 4:23:20 AM ******/
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
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 12/18/2019 4:23:20 AM ******/
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
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 12/18/2019 4:23:20 AM ******/
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
/****** Object:  Table [dbo].[Products]    Script Date: 12/18/2019 4:23:20 AM ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 12/18/2019 4:23:20 AM ******/
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
/****** Object:  Table [dbo].[Sliders]    Script Date: 12/18/2019 4:23:20 AM ******/
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
/****** Object:  Table [dbo].[Suport]    Script Date: 12/18/2019 4:23:20 AM ******/
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
/****** Object:  Table [dbo].[User ]    Script Date: 12/18/2019 4:23:21 AM ******/
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
/****** Object:  Table [dbo].[UserGroup]    Script Date: 12/18/2019 4:23:21 AM ******/
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
/****** Object:  Table [dbo].[UserRole]    Script Date: 12/18/2019 4:23:21 AM ******/
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
