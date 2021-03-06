USE [master]
GO
/****** Object:  Database [CoffeeShops]    Script Date: 22.05.2022 20:54:39 ******/
CREATE DATABASE [CoffeeShops]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CoffeeShops', FILENAME = N'/var/opt/mssql/data/CoffeeShops.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CoffeeShops_log', FILENAME = N'/var/opt/mssql/data/CoffeeShops_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CoffeeShops] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CoffeeShops].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CoffeeShops] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CoffeeShops] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CoffeeShops] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CoffeeShops] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CoffeeShops] SET ARITHABORT OFF 
GO
ALTER DATABASE [CoffeeShops] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CoffeeShops] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CoffeeShops] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CoffeeShops] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CoffeeShops] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CoffeeShops] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CoffeeShops] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CoffeeShops] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CoffeeShops] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CoffeeShops] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CoffeeShops] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CoffeeShops] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CoffeeShops] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CoffeeShops] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CoffeeShops] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CoffeeShops] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CoffeeShops] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CoffeeShops] SET RECOVERY FULL 
GO
ALTER DATABASE [CoffeeShops] SET  MULTI_USER 
GO
ALTER DATABASE [CoffeeShops] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CoffeeShops] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CoffeeShops] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CoffeeShops] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CoffeeShops] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CoffeeShops] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CoffeeShops', N'ON'
GO
ALTER DATABASE [CoffeeShops] SET QUERY_STORE = OFF
GO
USE [CoffeeShops]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 22.05.2022 20:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 22.05.2022 20:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [uniqueidentifier] NOT NULL,
	[CompanyId] [uniqueidentifier] NOT NULL,
	[TableId] [uniqueidentifier] NOT NULL,
	[ProductId] [uniqueidentifier] NOT NULL,
	[ProductPrice] [decimal](18, 2) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[StatusId] [int] NULL,
	[PaymentTypeId] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 22.05.2022 20:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [uniqueidentifier] NOT NULL,
	[ProductName] [nvarchar](50) NULL,
	[UnitPrice] [decimal](18, 2) NULL,
	[CompanyId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table]    Script Date: 22.05.2022 20:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table](
	[Id] [uniqueidentifier] NOT NULL,
	[CompanyId] [uniqueidentifier] NOT NULL,
	[TableNo] [nvarchar](50) NULL,
 CONSTRAINT [PK_Table] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 22.05.2022 20:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [uniqueidentifier] NOT NULL,
	[CompanyId] [uniqueidentifier] NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[PasswordEncrypted] [nvarchar](50) NULL,
	[PasswordSalt] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Company] ([Id], [Name]) VALUES (N'5c8e3cc1-0c8e-4e17-8bcf-9b4f0ec77e90', N'Deniz Kahve Dünyası')
GO
INSERT [dbo].[Product] ([Id], [ProductName], [UnitPrice], [CompanyId]) VALUES (N'378ced23-4fe3-45ac-b90d-0958c470c356', N'Macchiato', CAST(13.00 AS Decimal(18, 2)), N'5c8e3cc1-0c8e-4e17-8bcf-9b4f0ec77e90')
GO
INSERT [dbo].[Product] ([Id], [ProductName], [UnitPrice], [CompanyId]) VALUES (N'5d1d6436-9b5b-4274-94e6-173ba3311867', N'Türk Kahvesi', CAST(8.00 AS Decimal(18, 2)), N'5c8e3cc1-0c8e-4e17-8bcf-9b4f0ec77e90')
GO
INSERT [dbo].[Product] ([Id], [ProductName], [UnitPrice], [CompanyId]) VALUES (N'3d49c150-1dcc-4546-825a-2b50fb95d9f2', N'Instant kahve', CAST(12.00 AS Decimal(18, 2)), N'5c8e3cc1-0c8e-4e17-8bcf-9b4f0ec77e90')
GO
INSERT [dbo].[Product] ([Id], [ProductName], [UnitPrice], [CompanyId]) VALUES (N'34e67641-ee58-421e-af5b-3791e883a485', N'Espresso', CAST(10.00 AS Decimal(18, 2)), N'5c8e3cc1-0c8e-4e17-8bcf-9b4f0ec77e90')
GO
INSERT [dbo].[Product] ([Id], [ProductName], [UnitPrice], [CompanyId]) VALUES (N'd6a7e41a-d55c-4fdd-992f-4addd05c3c88', N'Limonata', CAST(10.00 AS Decimal(18, 2)), N'5c8e3cc1-0c8e-4e17-8bcf-9b4f0ec77e90')
GO
INSERT [dbo].[Product] ([Id], [ProductName], [UnitPrice], [CompanyId]) VALUES (N'1aeaac7e-fb13-458c-a485-4ae84fb5c673', N'Mocha', CAST(15.00 AS Decimal(18, 2)), N'5c8e3cc1-0c8e-4e17-8bcf-9b4f0ec77e90')
GO
INSERT [dbo].[Product] ([Id], [ProductName], [UnitPrice], [CompanyId]) VALUES (N'a1ecea26-0164-47aa-9ff5-4b78b142efac', N'Cappuccino', CAST(16.00 AS Decimal(18, 2)), N'5c8e3cc1-0c8e-4e17-8bcf-9b4f0ec77e90')
GO
INSERT [dbo].[Product] ([Id], [ProductName], [UnitPrice], [CompanyId]) VALUES (N'a82421e0-ab81-43ad-8d03-5274bde8275d', N'Cafe Latte', CAST(15.00 AS Decimal(18, 2)), N'5c8e3cc1-0c8e-4e17-8bcf-9b4f0ec77e90')
GO
INSERT [dbo].[Product] ([Id], [ProductName], [UnitPrice], [CompanyId]) VALUES (N'26d2839d-755b-429d-b35e-614467aa5a77', N'Ihlamur', CAST(17.00 AS Decimal(18, 2)), N'5c8e3cc1-0c8e-4e17-8bcf-9b4f0ec77e90')
GO
INSERT [dbo].[Product] ([Id], [ProductName], [UnitPrice], [CompanyId]) VALUES (N'8fcd2a26-d11d-4d59-8eb2-714209788d57', N'Frappe', CAST(12.00 AS Decimal(18, 2)), N'5c8e3cc1-0c8e-4e17-8bcf-9b4f0ec77e90')
GO
INSERT [dbo].[Product] ([Id], [ProductName], [UnitPrice], [CompanyId]) VALUES (N'afb4ae74-b843-4b91-892d-740200c8fd3d', N'Filtre Kahve', CAST(13.00 AS Decimal(18, 2)), N'5c8e3cc1-0c8e-4e17-8bcf-9b4f0ec77e90')
GO
INSERT [dbo].[Product] ([Id], [ProductName], [UnitPrice], [CompanyId]) VALUES (N'228a84c6-3c2a-45e9-b1b8-83ee0088678b', N'Papatya Çayı', CAST(18.50 AS Decimal(18, 2)), N'5c8e3cc1-0c8e-4e17-8bcf-9b4f0ec77e90')
GO
INSERT [dbo].[Product] ([Id], [ProductName], [UnitPrice], [CompanyId]) VALUES (N'c979e0c3-ccae-4db3-ac67-8f8eb5aac0a3', N'Sütlü', CAST(12.00 AS Decimal(18, 2)), N'5c8e3cc1-0c8e-4e17-8bcf-9b4f0ec77e90')
GO
INSERT [dbo].[Product] ([Id], [ProductName], [UnitPrice], [CompanyId]) VALUES (N'1b22c9e1-1bdd-4b10-b2df-9a9182ff0931', N'Latte', CAST(15.00 AS Decimal(18, 2)), N'5c8e3cc1-0c8e-4e17-8bcf-9b4f0ec77e90')
GO
INSERT [dbo].[Product] ([Id], [ProductName], [UnitPrice], [CompanyId]) VALUES (N'0ab44246-4d99-4e6c-b2af-b90fa9f51f04', N'Arabic Coffee', CAST(12.00 AS Decimal(18, 2)), N'5c8e3cc1-0c8e-4e17-8bcf-9b4f0ec77e90')
GO
INSERT [dbo].[Product] ([Id], [ProductName], [UnitPrice], [CompanyId]) VALUES (N'f33253b7-53fd-44a0-a1de-b9c35634b1f7', N'Çay', CAST(5.00 AS Decimal(18, 2)), N'5c8e3cc1-0c8e-4e17-8bcf-9b4f0ec77e90')
GO
INSERT [dbo].[Product] ([Id], [ProductName], [UnitPrice], [CompanyId]) VALUES (N'fa7ad573-94a3-4c69-a9d9-be97897bdbf3', N'Sütlü Köpüklü ', CAST(8.00 AS Decimal(18, 2)), N'5c8e3cc1-0c8e-4e17-8bcf-9b4f0ec77e90')
GO
INSERT [dbo].[Product] ([Id], [ProductName], [UnitPrice], [CompanyId]) VALUES (N'ef43867b-40f6-4594-89ee-cc4bda31fdb8', N'Excelsa Kahve', CAST(14.00 AS Decimal(18, 2)), N'5c8e3cc1-0c8e-4e17-8bcf-9b4f0ec77e90')
GO
INSERT [dbo].[Product] ([Id], [ProductName], [UnitPrice], [CompanyId]) VALUES (N'2270ef23-4bee-44ea-af87-d3b4b67771d7', N'Nescafe', CAST(12.00 AS Decimal(18, 2)), N'5c8e3cc1-0c8e-4e17-8bcf-9b4f0ec77e90')
GO
INSERT [dbo].[Product] ([Id], [ProductName], [UnitPrice], [CompanyId]) VALUES (N'9120e3ab-abd8-42e3-89a4-dab45935abe8', N' Liberica Kahve', CAST(10.00 AS Decimal(18, 2)), N'5c8e3cc1-0c8e-4e17-8bcf-9b4f0ec77e90')
GO
INSERT [dbo].[Product] ([Id], [ProductName], [UnitPrice], [CompanyId]) VALUES (N'0a7b2f73-8e20-4677-9849-de8dbdd069f6', N'Flat White', CAST(14.00 AS Decimal(18, 2)), N'5c8e3cc1-0c8e-4e17-8bcf-9b4f0ec77e90')
GO
INSERT [dbo].[Product] ([Id], [ProductName], [UnitPrice], [CompanyId]) VALUES (N'9f49e72f-c8d4-4f7c-8822-e283f2686ac8', N'Cortado', CAST(18.00 AS Decimal(18, 2)), N'5c8e3cc1-0c8e-4e17-8bcf-9b4f0ec77e90')
GO
INSERT [dbo].[Product] ([Id], [ProductName], [UnitPrice], [CompanyId]) VALUES (N'2f2bd919-a513-4646-abce-ede76712f0ce', N'Americano Kahve', CAST(14.00 AS Decimal(18, 2)), N'5c8e3cc1-0c8e-4e17-8bcf-9b4f0ec77e90')
GO
INSERT [dbo].[Table] ([Id], [CompanyId], [TableNo]) VALUES (N'1d03a8ae-7747-4445-8fb8-010ec545b815', N'5c8e3cc1-0c8e-4e17-8bcf-9b4f0ec77e90', N'Masa 6')
GO
INSERT [dbo].[Table] ([Id], [CompanyId], [TableNo]) VALUES (N'6caabdc3-0cf9-4e44-b3d2-0ef1b9e38a66', N'5c8e3cc1-0c8e-4e17-8bcf-9b4f0ec77e90', N'Masa 4')
GO
INSERT [dbo].[Table] ([Id], [CompanyId], [TableNo]) VALUES (N'df6b9bb8-a5fb-4142-b1ba-3cb3bcea3c48', N'5c8e3cc1-0c8e-4e17-8bcf-9b4f0ec77e90', N'Masa 1')
GO
INSERT [dbo].[Table] ([Id], [CompanyId], [TableNo]) VALUES (N'a505c61e-6db6-49c8-adda-4ddb1a2889fb', N'5c8e3cc1-0c8e-4e17-8bcf-9b4f0ec77e90', N'Masa 5')
GO
INSERT [dbo].[Table] ([Id], [CompanyId], [TableNo]) VALUES (N'7e4065ab-9fce-4383-b766-69d45fe947e0', N'5c8e3cc1-0c8e-4e17-8bcf-9b4f0ec77e90', N'Masa 7')
GO
INSERT [dbo].[Table] ([Id], [CompanyId], [TableNo]) VALUES (N'17c632f0-4db7-4a1b-a38c-9b65693f55c9', N'5c8e3cc1-0c8e-4e17-8bcf-9b4f0ec77e90', N'Masa 2')
GO
INSERT [dbo].[Table] ([Id], [CompanyId], [TableNo]) VALUES (N'1d2f8871-1ac1-4b5d-b656-a8c587be5c57', N'5c8e3cc1-0c8e-4e17-8bcf-9b4f0ec77e90', N'Masa 3')
GO
INSERT [dbo].[Table] ([Id], [CompanyId], [TableNo]) VALUES (N'07e422cb-c166-4f68-9dfb-c0fb22081743', N'5c8e3cc1-0c8e-4e17-8bcf-9b4f0ec77e90', N'Masa 8')
GO
INSERT [dbo].[Table] ([Id], [CompanyId], [TableNo]) VALUES (N'3e297e37-f54b-41a0-80e5-c2bd6ccb9a0d', N'5c8e3cc1-0c8e-4e17-8bcf-9b4f0ec77e90', N'Masa 9')
GO
INSERT [dbo].[User] ([Id], [CompanyId], [FirstName], [LastName], [Email], [PasswordEncrypted], [PasswordSalt]) VALUES (N'521f59a8-f3b2-41f8-9b18-2660a9fec728', N'5c8e3cc1-0c8e-4e17-8bcf-9b4f0ec77e90', N'Deniz', N'Yılmaz', N'deniz@mail.com', N'�\�rf2O�!��', N'080bdc7e-491d-488b-bd4d-f99f2e26a3fe')
GO
USE [master]
GO
ALTER DATABASE [CoffeeShops] SET  READ_WRITE 
GO
