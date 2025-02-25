USE [master]
GO
/****** Object:  Database [YoloEcommerce]    Script Date: 9/2/2024 9:40:44 AM ******/
CREATE DATABASE [YoloEcommerce]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'YoloEcommerce', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MEAN\MSSQL\DATA\YoloEcommerce.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'YoloEcommerce_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MEAN\MSSQL\DATA\YoloEcommerce_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [YoloEcommerce] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [YoloEcommerce].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [YoloEcommerce] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [YoloEcommerce] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [YoloEcommerce] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [YoloEcommerce] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [YoloEcommerce] SET ARITHABORT OFF 
GO
ALTER DATABASE [YoloEcommerce] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [YoloEcommerce] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [YoloEcommerce] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [YoloEcommerce] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [YoloEcommerce] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [YoloEcommerce] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [YoloEcommerce] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [YoloEcommerce] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [YoloEcommerce] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [YoloEcommerce] SET  DISABLE_BROKER 
GO
ALTER DATABASE [YoloEcommerce] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [YoloEcommerce] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [YoloEcommerce] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [YoloEcommerce] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [YoloEcommerce] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [YoloEcommerce] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [YoloEcommerce] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [YoloEcommerce] SET RECOVERY FULL 
GO
ALTER DATABASE [YoloEcommerce] SET  MULTI_USER 
GO
ALTER DATABASE [YoloEcommerce] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [YoloEcommerce] SET DB_CHAINING OFF 
GO
ALTER DATABASE [YoloEcommerce] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [YoloEcommerce] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [YoloEcommerce] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [YoloEcommerce] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'YoloEcommerce', N'ON'
GO
ALTER DATABASE [YoloEcommerce] SET QUERY_STORE = ON
GO
ALTER DATABASE [YoloEcommerce] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [YoloEcommerce]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 9/2/2024 9:40:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categorys]    Script Date: 9/2/2024 9:40:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorys](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Categorys] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Colors]    Script Date: 9/2/2024 9:40:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Colors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 9/2/2024 9:40:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](max) NULL,
	[CustomerPhone] [nvarchar](max) NULL,
	[CustomerEmail] [nvarchar](max) NULL,
	[Request] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[Reply] [nvarchar](max) NULL,
	[SendDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 9/2/2024 9:40:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Quantiny] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[TotalPrice] [float] NOT NULL,
	[IdProduct] [int] NOT NULL,
	[IdOrder] [int] NOT NULL,
	[IdSize] [int] NOT NULL,
	[IdColor] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 9/2/2024 9:40:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](max) NULL,
	[Quantiny] [int] NOT NULL,
	[TotalPrice] [int] NOT NULL,
	[CustomerName] [nvarchar](max) NULL,
	[CustomerPhone] [nvarchar](max) NULL,
	[CreatedBy] [datetime2](7) NOT NULL,
	[DeliveryDate] [datetime2](7) NULL,
	[IdUser] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[Address] [nvarchar](max) NULL,
	[TypePay] [int] NOT NULL,
	[RejectionReason] [nvarchar](max) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductColors]    Script Date: 9/2/2024 9:40:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductColors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdProduct] [int] NOT NULL,
	[IdColor] [int] NOT NULL,
 CONSTRAINT [PK_ProductColors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImages]    Script Date: 9/2/2024 9:40:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Path] [nvarchar](max) NULL,
	[Title] [nvarchar](max) NULL,
	[IdProduct] [int] NOT NULL,
 CONSTRAINT [PK_ProductImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 9/2/2024 9:40:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [float] NOT NULL,
	[IdCategory] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSizes]    Script Date: 9/2/2024 9:40:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSizes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdProduct] [int] NOT NULL,
	[IdSize] [int] NOT NULL,
 CONSTRAINT [PK_ProductSizes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 9/2/2024 9:40:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sizes]    Script Date: 9/2/2024 9:40:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sizes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Sizes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 9/2/2024 9:40:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Fullname] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[IdRole] [int] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240721023637_init', N'5.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240831183637_init_V2', N'5.0.7')
GO
SET IDENTITY_INSERT [dbo].[Categorys] ON 

INSERT [dbo].[Categorys] ([Id], [Name], [Description]) VALUES (1, N'Áo ngắn nam', N'.')
INSERT [dbo].[Categorys] ([Id], [Name], [Description]) VALUES (2, N'Áo ngắn nữ', N'.')
INSERT [dbo].[Categorys] ([Id], [Name], [Description]) VALUES (3, N'Quần nữ', N'.')
INSERT [dbo].[Categorys] ([Id], [Name], [Description]) VALUES (4, N'Quần nam', N'.')
SET IDENTITY_INSERT [dbo].[Categorys] OFF
GO
SET IDENTITY_INSERT [dbo].[Colors] ON 

INSERT [dbo].[Colors] ([Id], [Name]) VALUES (1, N'Xanh')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (2, N'Đỏ')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (3, N'Trắng')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (4, N'Đen')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (5, N'Vàng')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (6, N'Cam')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (7, N'Sữa')
SET IDENTITY_INSERT [dbo].[Colors] OFF
GO
SET IDENTITY_INSERT [dbo].[Contacts] ON 

INSERT [dbo].[Contacts] ([Id], [CustomerName], [CustomerPhone], [CustomerEmail], [Request], [Status], [Reply], [SendDate]) VALUES (1, N'ABV', N'1234567890', N'abc@gmail.com', N'test', 1, NULL, CAST(N'2024-07-21T10:28:06.1128561' AS DateTime2))
INSERT [dbo].[Contacts] ([Id], [CustomerName], [CustomerPhone], [CustomerEmail], [Request], [Status], [Reply], [SendDate]) VALUES (2, N'a', N'123453124', N'thinhanhnguyen2002@gmail.com', N'a', 2, N'Rất hân hạnh được phục vụ bạn!
', CAST(N'2024-08-22T22:26:02.9550626' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Contacts] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([Id], [Quantiny], [Price], [TotalPrice], [IdProduct], [IdOrder], [IdSize], [IdColor]) VALUES (3, 3, 299000, 897000, 8, 3, 4, 1)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [Code], [Quantiny], [TotalPrice], [CustomerName], [CustomerPhone], [CreatedBy], [DeliveryDate], [IdUser], [Status], [Address], [TypePay], [RejectionReason]) VALUES (1, N'70600', 1, 299000, N'Nguyen', N'0867742090', CAST(N'2024-07-21T10:26:35.9406976' AS DateTime2), CAST(N'2024-08-22T23:11:13.2332980' AS DateTime2), 3, 4, N'114, Đức Thắng, Bắc Vọng, Bắc Phú, Sóc Sơn, Hà Nội', 1, NULL)
INSERT [dbo].[Orders] ([Id], [Code], [Quantiny], [TotalPrice], [CustomerName], [CustomerPhone], [CreatedBy], [DeliveryDate], [IdUser], [Status], [Address], [TypePay], [RejectionReason]) VALUES (2, N'71135', 5, 1495000, N'abc', N'012345678', CAST(N'2024-08-22T22:19:14.3444949' AS DateTime2), CAST(N'2024-08-22T23:11:26.0907173' AS DateTime2), 3, 6, N'a, a, a, a', 1, NULL)
INSERT [dbo].[Orders] ([Id], [Code], [Quantiny], [TotalPrice], [CustomerName], [CustomerPhone], [CreatedBy], [DeliveryDate], [IdUser], [Status], [Address], [TypePay], [RejectionReason]) VALUES (3, N'90487', 3, 897000, N'a', N'a', CAST(N'2024-08-23T10:23:43.0612740' AS DateTime2), NULL, 4, 1, N'a, a, a, a', 1, NULL)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductColors] ON 

INSERT [dbo].[ProductColors] ([Id], [IdProduct], [IdColor]) VALUES (24, 7, 3)
INSERT [dbo].[ProductColors] ([Id], [IdProduct], [IdColor]) VALUES (25, 7, 4)
INSERT [dbo].[ProductColors] ([Id], [IdProduct], [IdColor]) VALUES (26, 8, 1)
INSERT [dbo].[ProductColors] ([Id], [IdProduct], [IdColor]) VALUES (27, 8, 4)
INSERT [dbo].[ProductColors] ([Id], [IdProduct], [IdColor]) VALUES (28, 9, 2)
INSERT [dbo].[ProductColors] ([Id], [IdProduct], [IdColor]) VALUES (29, 9, 1)
INSERT [dbo].[ProductColors] ([Id], [IdProduct], [IdColor]) VALUES (30, 10, 3)
INSERT [dbo].[ProductColors] ([Id], [IdProduct], [IdColor]) VALUES (31, 10, 4)
INSERT [dbo].[ProductColors] ([Id], [IdProduct], [IdColor]) VALUES (32, 11, 4)
INSERT [dbo].[ProductColors] ([Id], [IdProduct], [IdColor]) VALUES (33, 12, 2)
INSERT [dbo].[ProductColors] ([Id], [IdProduct], [IdColor]) VALUES (34, 12, 4)
SET IDENTITY_INSERT [dbo].[ProductColors] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductImages] ON 

INSERT [dbo].[ProductImages] ([Id], [Path], [Title], [IdProduct]) VALUES (14, N'0abbf6f4-e93f-4fc1-a890-9117d79c1be3.jpg', NULL, 7)
INSERT [dbo].[ProductImages] ([Id], [Path], [Title], [IdProduct]) VALUES (15, N'1a2df847-f494-4c39-a17b-1b621970b9d7.jpg', NULL, 7)
INSERT [dbo].[ProductImages] ([Id], [Path], [Title], [IdProduct]) VALUES (16, N'ebe79250-f3af-4111-b572-e91cafd6f1fa.jpg', NULL, 8)
INSERT [dbo].[ProductImages] ([Id], [Path], [Title], [IdProduct]) VALUES (17, N'5a4ecbfd-569c-446c-8433-2303583458eb.jpg', NULL, 8)
INSERT [dbo].[ProductImages] ([Id], [Path], [Title], [IdProduct]) VALUES (18, N'59e67435-a3fd-4e16-be95-d5ec1862ecdb.jpg', NULL, 9)
INSERT [dbo].[ProductImages] ([Id], [Path], [Title], [IdProduct]) VALUES (19, N'401d5477-a1cd-432b-8e58-2a43786c292a.jpg', NULL, 9)
INSERT [dbo].[ProductImages] ([Id], [Path], [Title], [IdProduct]) VALUES (20, N'69cd4353-4ceb-4996-a8a1-a36cb15330ce.jpg', NULL, 10)
INSERT [dbo].[ProductImages] ([Id], [Path], [Title], [IdProduct]) VALUES (21, N'803ba8f6-0181-482d-baad-2f262f4945a6.jpg', NULL, 10)
INSERT [dbo].[ProductImages] ([Id], [Path], [Title], [IdProduct]) VALUES (22, N'48681778-d0a7-46f3-acfb-2d517c72132e.jpg', NULL, 11)
INSERT [dbo].[ProductImages] ([Id], [Path], [Title], [IdProduct]) VALUES (23, N'b2c84eab-33f6-4cc3-b770-9791313a0ae3.jpg', NULL, 11)
INSERT [dbo].[ProductImages] ([Id], [Path], [Title], [IdProduct]) VALUES (24, N'70168599-64c5-4df2-9e8b-dbaa72f8b402.jpg', NULL, 12)
INSERT [dbo].[ProductImages] ([Id], [Path], [Title], [IdProduct]) VALUES (25, N'1d1acba4-0849-4f16-be81-ccb7a5f0219e.jpg', NULL, 12)
SET IDENTITY_INSERT [dbo].[ProductImages] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [IdCategory], [Quantity]) VALUES (7, N'Polo Nam Recycle Cleann', N'Áo polo nam', 299000, 1, 0)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [IdCategory], [Quantity]) VALUES (8, N'Áo Polo Bo', N'Áo polo nam', 299000, 1, 0)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [IdCategory], [Quantity]) VALUES (9, N'Áo Polo Nam loại 03', N'Áo nam', 169000, 1, 0)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [IdCategory], [Quantity]) VALUES (10, N'Áo ngắn nữ', N'Áo nữ', 249000, 2, 0)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [IdCategory], [Quantity]) VALUES (11, N'Áo ngắn nữ loại 02', N'Áo nữ', 219000, 2, 0)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [IdCategory], [Quantity]) VALUES (12, N'Áo thun nữ loại 3', N'Áo cho nữ', 149000, 2, 0)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductSizes] ON 

INSERT [dbo].[ProductSizes] ([Id], [IdProduct], [IdSize]) VALUES (26, 7, 4)
INSERT [dbo].[ProductSizes] ([Id], [IdProduct], [IdSize]) VALUES (27, 7, 3)
INSERT [dbo].[ProductSizes] ([Id], [IdProduct], [IdSize]) VALUES (28, 8, 4)
INSERT [dbo].[ProductSizes] ([Id], [IdProduct], [IdSize]) VALUES (29, 8, 3)
INSERT [dbo].[ProductSizes] ([Id], [IdProduct], [IdSize]) VALUES (30, 9, 3)
INSERT [dbo].[ProductSizes] ([Id], [IdProduct], [IdSize]) VALUES (31, 9, 4)
INSERT [dbo].[ProductSizes] ([Id], [IdProduct], [IdSize]) VALUES (32, 10, 2)
INSERT [dbo].[ProductSizes] ([Id], [IdProduct], [IdSize]) VALUES (33, 10, 3)
INSERT [dbo].[ProductSizes] ([Id], [IdProduct], [IdSize]) VALUES (34, 10, 1)
INSERT [dbo].[ProductSizes] ([Id], [IdProduct], [IdSize]) VALUES (35, 11, 2)
INSERT [dbo].[ProductSizes] ([Id], [IdProduct], [IdSize]) VALUES (36, 11, 1)
INSERT [dbo].[ProductSizes] ([Id], [IdProduct], [IdSize]) VALUES (37, 11, 3)
INSERT [dbo].[ProductSizes] ([Id], [IdProduct], [IdSize]) VALUES (38, 11, 4)
INSERT [dbo].[ProductSizes] ([Id], [IdProduct], [IdSize]) VALUES (39, 12, 3)
INSERT [dbo].[ProductSizes] ([Id], [IdProduct], [IdSize]) VALUES (40, 12, 2)
INSERT [dbo].[ProductSizes] ([Id], [IdProduct], [IdSize]) VALUES (41, 12, 1)
SET IDENTITY_INSERT [dbo].[ProductSizes] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [Name], [Description]) VALUES (1, N'khachhang', N'khachhang')
INSERT [dbo].[Roles] ([Id], [Name], [Description]) VALUES (2, N'admin', N'adm')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Sizes] ON 

INSERT [dbo].[Sizes] ([Id], [Name], [Description]) VALUES (1, N'M', N'nhỏ')
INSERT [dbo].[Sizes] ([Id], [Name], [Description]) VALUES (2, N'S', N'Siêu nhỏ')
INSERT [dbo].[Sizes] ([Id], [Name], [Description]) VALUES (3, N'L', N'tb')
INSERT [dbo].[Sizes] ([Id], [Name], [Description]) VALUES (4, N'XL', N'big')
INSERT [dbo].[Sizes] ([Id], [Name], [Description]) VALUES (5, N'XXL', N'Very big')
SET IDENTITY_INSERT [dbo].[Sizes] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Username], [Password], [Email], [Fullname], [Address], [Phone], [IdRole], [Status]) VALUES (2, N'admin', N'admin', N'', NULL, NULL, NULL, 2, 2)
INSERT [dbo].[Users] ([Id], [Username], [Password], [Email], [Fullname], [Address], [Phone], [IdRole], [Status]) VALUES (3, N'abc123', N'Khongdoi123.', N'abc@gmail.com', N'Nguyễn Văn A', N'HN', N'1234567890', 1, 2)
INSERT [dbo].[Users] ([Id], [Username], [Password], [Email], [Fullname], [Address], [Phone], [IdRole], [Status]) VALUES (4, N'thinhanh012', N'Khongdoi123.', N'thinhanhnguyen2002@gmail.com', N'Nguyen Thinh Anh', N'Ha Noi', N'0867742090', 1, 2)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  Index [IX_OrderDetails_IdColor]    Script Date: 9/2/2024 9:40:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetails_IdColor] ON [dbo].[OrderDetails]
(
	[IdColor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderDetails_IdOrder]    Script Date: 9/2/2024 9:40:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetails_IdOrder] ON [dbo].[OrderDetails]
(
	[IdOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderDetails_IdProduct]    Script Date: 9/2/2024 9:40:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetails_IdProduct] ON [dbo].[OrderDetails]
(
	[IdProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderDetails_IdSize]    Script Date: 9/2/2024 9:40:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetails_IdSize] ON [dbo].[OrderDetails]
(
	[IdSize] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_IdUser]    Script Date: 9/2/2024 9:40:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_Orders_IdUser] ON [dbo].[Orders]
(
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductColors_IdColor]    Script Date: 9/2/2024 9:40:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_ProductColors_IdColor] ON [dbo].[ProductColors]
(
	[IdColor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductColors_IdProduct]    Script Date: 9/2/2024 9:40:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_ProductColors_IdProduct] ON [dbo].[ProductColors]
(
	[IdProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductImages_IdProduct]    Script Date: 9/2/2024 9:40:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_ProductImages_IdProduct] ON [dbo].[ProductImages]
(
	[IdProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_IdCategory]    Script Date: 9/2/2024 9:40:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_Products_IdCategory] ON [dbo].[Products]
(
	[IdCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductSizes_IdProduct]    Script Date: 9/2/2024 9:40:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_ProductSizes_IdProduct] ON [dbo].[ProductSizes]
(
	[IdProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductSizes_IdSize]    Script Date: 9/2/2024 9:40:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_ProductSizes_IdSize] ON [dbo].[ProductSizes]
(
	[IdSize] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Users_IdRole]    Script Date: 9/2/2024 9:40:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_Users_IdRole] ON [dbo].[Users]
(
	[IdRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Colors_IdColor] FOREIGN KEY([IdColor])
REFERENCES [dbo].[Colors] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Colors_IdColor]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders_IdOrder] FOREIGN KEY([IdOrder])
REFERENCES [dbo].[Orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders_IdOrder]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products_IdProduct] FOREIGN KEY([IdProduct])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products_IdProduct]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Sizes_IdSize] FOREIGN KEY([IdSize])
REFERENCES [dbo].[Sizes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Sizes_IdSize]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users_IdUser] FOREIGN KEY([IdUser])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users_IdUser]
GO
ALTER TABLE [dbo].[ProductColors]  WITH CHECK ADD  CONSTRAINT [FK_ProductColors_Colors_IdColor] FOREIGN KEY([IdColor])
REFERENCES [dbo].[Colors] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductColors] CHECK CONSTRAINT [FK_ProductColors_Colors_IdColor]
GO
ALTER TABLE [dbo].[ProductColors]  WITH CHECK ADD  CONSTRAINT [FK_ProductColors_Products_IdProduct] FOREIGN KEY([IdProduct])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductColors] CHECK CONSTRAINT [FK_ProductColors_Products_IdProduct]
GO
ALTER TABLE [dbo].[ProductImages]  WITH CHECK ADD  CONSTRAINT [FK_ProductImages_Products_IdProduct] FOREIGN KEY([IdProduct])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductImages] CHECK CONSTRAINT [FK_ProductImages_Products_IdProduct]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categorys_IdCategory] FOREIGN KEY([IdCategory])
REFERENCES [dbo].[Categorys] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categorys_IdCategory]
GO
ALTER TABLE [dbo].[ProductSizes]  WITH CHECK ADD  CONSTRAINT [FK_ProductSizes_Products_IdProduct] FOREIGN KEY([IdProduct])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductSizes] CHECK CONSTRAINT [FK_ProductSizes_Products_IdProduct]
GO
ALTER TABLE [dbo].[ProductSizes]  WITH CHECK ADD  CONSTRAINT [FK_ProductSizes_Sizes_IdSize] FOREIGN KEY([IdSize])
REFERENCES [dbo].[Sizes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductSizes] CHECK CONSTRAINT [FK_ProductSizes_Sizes_IdSize]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles_IdRole] FOREIGN KEY([IdRole])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles_IdRole]
GO
USE [master]
GO
ALTER DATABASE [YoloEcommerce] SET  READ_WRITE 
GO
