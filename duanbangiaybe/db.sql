USE [master]
GO
/****** Object:  Database [datn]    Script Date: 29/11/2023 8:47:01 PM ******/
CREATE DATABASE [datn]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'datn', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\datn.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'datn_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\datn_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [datn] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [datn].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [datn] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [datn] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [datn] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [datn] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [datn] SET ARITHABORT OFF 
GO
ALTER DATABASE [datn] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [datn] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [datn] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [datn] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [datn] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [datn] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [datn] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [datn] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [datn] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [datn] SET  ENABLE_BROKER 
GO
ALTER DATABASE [datn] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [datn] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [datn] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [datn] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [datn] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [datn] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [datn] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [datn] SET RECOVERY FULL 
GO
ALTER DATABASE [datn] SET  MULTI_USER 
GO
ALTER DATABASE [datn] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [datn] SET DB_CHAINING OFF 
GO
ALTER DATABASE [datn] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [datn] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [datn] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [datn] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'datn', N'ON'
GO
ALTER DATABASE [datn] SET QUERY_STORE = ON
GO
ALTER DATABASE [datn] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [datn]
GO
/****** Object:  Table [dbo].[bill]    Script Date: 29/11/2023 8:47:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bill](
	[id] [uniqueidentifier] NOT NULL,
	[employeeid] [uniqueidentifier] NULL,
	[customerid] [uniqueidentifier] NULL,
	[create_date] [datetime] NULL,
	[type] [int] NOT NULL,
	[shipe_fee] [money] NULL,
	[phone_number] [nvarchar](20) NULL,
	[address] [nvarchar](max) NULL,
	[payment_amount] [money] NULL,
	[payment_time] [datetime] NULL,
	[payment_type] [int] NULL,
	[payment_employee] [uniqueidentifier] NULL,
	[note] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[billdetails]    Script Date: 29/11/2023 8:47:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[billdetails](
	[id] [uniqueidentifier] NOT NULL,
	[product_detailid] [uniqueidentifier] NULL,
	[billid] [uniqueidentifier] NULL,
	[price] [money] NULL,
	[quantity] [int] NULL,
	[type] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[brand]    Script Date: 29/11/2023 8:47:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[brand](
	[id] [uniqueidentifier] NOT NULL,
	[code] [nvarchar](10) NULL,
	[name] [nvarchar](255) NULL,
	[type] [int] NOT NULL,
	[create_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 29/11/2023 8:47:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id] [uniqueidentifier] NOT NULL,
	[code] [nvarchar](10) NULL,
	[category_name] [nvarchar](255) NULL,
	[type] [int] NOT NULL,
	[create_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[colors]    Script Date: 29/11/2023 8:47:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[colors](
	[id] [uniqueidentifier] NOT NULL,
	[code] [nvarchar](10) NULL,
	[color_name] [nvarchar](255) NULL,
	[type] [int] NOT NULL,
	[create_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customers]    Script Date: 29/11/2023 8:47:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers](
	[id] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](50) NULL,
	[gender] [bit] NULL,
	[dateof_birth] [date] NULL,
	[email] [nvarchar](255) NULL,
	[image] [image] NULL,
	[phone_number] [nvarchar](20) NULL,
	[type] [int] NOT NULL,
	[county] [nvarchar](50) NULL,
	[city] [nvarchar](50) NULL,
	[district] [nvarchar](50) NULL,
	[address] [nvarchar](max) NULL,
	[create_date] [datetime] NULL,
	[password] [nvarchar](max) NULL,
 CONSTRAINT [PK__Customer__3214EC07DB9DCFD7] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employees]    Script Date: 29/11/2023 8:47:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employees](
	[id] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](50) NULL,
	[gender] [bit] NULL,
	[dateof_birth] [date] NULL,
	[address] [nvarchar](max) NULL,
	[email] [nvarchar](255) NULL,
	[phone_number] [nvarchar](20) NULL,
	[roleid] [uniqueidentifier] NOT NULL,
	[user_name] [varchar](50) NULL,
	[image] [image] NULL,
	[type] [int] NOT NULL,
	[create_date] [datetime] NULL,
	[password] [nvarchar](max) NULL,
 CONSTRAINT [PK__employee__3214EC07FFE8C94C] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[evaluate]    Script Date: 29/11/2023 8:47:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[evaluate](
	[id] [uniqueidentifier] NOT NULL,
	[productDetailid] [uniqueidentifier] NULL,
	[customersid] [uniqueidentifier] NULL,
	[comment] [nvarchar](max) NULL,
	[type] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[images]    Script Date: 29/11/2023 8:47:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[images](
	[id] [uniqueidentifier] NOT NULL,
	[productid] [uniqueidentifier] NULL,
	[image] [image] NULL,
	[type] [int] NOT NULL,
 CONSTRAINT [PK_images] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 29/11/2023 8:47:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [uniqueidentifier] NOT NULL,
	[productname] [nvarchar](max) NULL,
	[type] [int] NOT NULL,
	[code] [nvarchar](50) NULL,
	[categoryid] [uniqueidentifier] NULL,
	[brandid] [uniqueidentifier] NULL,
	[soleid] [uniqueidentifier] NULL,
	[create_date] [datetime] NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productdetail]    Script Date: 29/11/2023 8:47:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productdetail](
	[id] [uniqueidentifier] NOT NULL,
	[colorid] [uniqueidentifier] NULL,
	[sizeid] [uniqueidentifier] NULL,
	[productid] [uniqueidentifier] NULL,
	[price] [money] NULL,
	[amount] [bigint] NULL,
	[type] [int] NOT NULL,
	[create_date] [datetime] NULL,
 CONSTRAINT [PK__productd__3214EC073F4E797C] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[promotion]    Script Date: 29/11/2023 8:47:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[promotion](
	[id] [uniqueidentifier] NOT NULL,
	[promotion_name] [nvarchar](255) NULL,
	[start_date] [datetime] NULL,
	[enddate] [datetime] NULL,
	[discount] [float] NULL,
	[description] [nvarchar](max) NULL,
	[minimum_price] [money] NULL,
	[type] [int] NOT NULL,
	[employee_id] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[promotionproduct]    Script Date: 29/11/2023 8:47:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[promotionproduct](
	[id] [uniqueidentifier] NOT NULL,
	[promotionid] [uniqueidentifier] NOT NULL,
	[productdetailid] [uniqueidentifier] NOT NULL,
	[type] [int] NOT NULL,
 CONSTRAINT [PK_promotionroduct] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 29/11/2023 8:47:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id] [uniqueidentifier] NOT NULL,
	[code] [nvarchar](10) NULL,
	[name] [nvarchar](100) NULL,
	[type] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[size]    Script Date: 29/11/2023 8:47:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[size](
	[id] [uniqueidentifier] NOT NULL,
	[code] [nvarchar](10) NULL,
	[size] [int] NULL,
	[type] [int] NOT NULL,
	[create_date] [datetime] NULL,
 CONSTRAINT [PK_size] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sole]    Script Date: 29/11/2023 8:47:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sole](
	[id] [uniqueidentifier] NOT NULL,
	[code] [nvarchar](10) NULL,
	[name] [nvarchar](255) NULL,
	[type] [int] NOT NULL,
	[create_date] [datetime] NULL,
 CONSTRAINT [PK_sole] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[bill] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[bill] ADD  DEFAULT ((1)) FOR [type]
GO
ALTER TABLE [dbo].[billdetails] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[billdetails] ADD  DEFAULT ((1)) FOR [type]
GO
ALTER TABLE [dbo].[brand] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[brand] ADD  DEFAULT ((1)) FOR [type]
GO
ALTER TABLE [dbo].[categories] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[categories] ADD  DEFAULT ((1)) FOR [type]
GO
ALTER TABLE [dbo].[colors] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[colors] ADD  DEFAULT ((1)) FOR [type]
GO
ALTER TABLE [dbo].[customers] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[customers] ADD  DEFAULT ((1)) FOR [type]
GO
ALTER TABLE [dbo].[employees] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[employees] ADD  DEFAULT ((1)) FOR [type]
GO
ALTER TABLE [dbo].[evaluate] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[images] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[images] ADD  DEFAULT ((1)) FOR [type]
GO
ALTER TABLE [dbo].[product] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[product] ADD  DEFAULT ((1)) FOR [type]
GO
ALTER TABLE [dbo].[productdetail] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[productdetail] ADD  DEFAULT ((1)) FOR [type]
GO
ALTER TABLE [dbo].[promotion] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[promotion] ADD  DEFAULT ((1)) FOR [type]
GO
ALTER TABLE [dbo].[promotionproduct] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[promotionproduct] ADD  DEFAULT ((1)) FOR [type]
GO
ALTER TABLE [dbo].[roles] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[roles] ADD  DEFAULT ((1)) FOR [type]
GO
ALTER TABLE [dbo].[size] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[size] ADD  DEFAULT ((1)) FOR [type]
GO
ALTER TABLE [dbo].[sole] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[sole] ADD  DEFAULT ((1)) FOR [type]
GO
ALTER TABLE [dbo].[bill]  WITH CHECK ADD  CONSTRAINT [FK__bill__Customerid__412EB0B6] FOREIGN KEY([customerid])
REFERENCES [dbo].[customers] ([id])
GO
ALTER TABLE [dbo].[bill] CHECK CONSTRAINT [FK__bill__Customerid__412EB0B6]
GO
ALTER TABLE [dbo].[bill]  WITH CHECK ADD  CONSTRAINT [FK__bill__employeeid__4222D4EF] FOREIGN KEY([employeeid])
REFERENCES [dbo].[employees] ([id])
GO
ALTER TABLE [dbo].[bill] CHECK CONSTRAINT [FK__bill__employeeid__4222D4EF]
GO
ALTER TABLE [dbo].[bill]  WITH CHECK ADD  CONSTRAINT [FK_bill_employees] FOREIGN KEY([payment_employee])
REFERENCES [dbo].[employees] ([id])
GO
ALTER TABLE [dbo].[bill] CHECK CONSTRAINT [FK_bill_employees]
GO
ALTER TABLE [dbo].[billdetails]  WITH CHECK ADD FOREIGN KEY([billid])
REFERENCES [dbo].[bill] ([id])
GO
ALTER TABLE [dbo].[billdetails]  WITH CHECK ADD  CONSTRAINT [FK__billdetai__produ__44FF419A] FOREIGN KEY([product_detailid])
REFERENCES [dbo].[productdetail] ([id])
GO
ALTER TABLE [dbo].[billdetails] CHECK CONSTRAINT [FK__billdetai__produ__44FF419A]
GO
ALTER TABLE [dbo].[employees]  WITH CHECK ADD  CONSTRAINT [FK__employees__rolei__45F365D3] FOREIGN KEY([roleid])
REFERENCES [dbo].[roles] ([id])
GO
ALTER TABLE [dbo].[employees] CHECK CONSTRAINT [FK__employees__rolei__45F365D3]
GO
ALTER TABLE [dbo].[evaluate]  WITH CHECK ADD FOREIGN KEY([customersid])
REFERENCES [dbo].[customers] ([id])
GO
ALTER TABLE [dbo].[evaluate]  WITH CHECK ADD FOREIGN KEY([productDetailid])
REFERENCES [dbo].[productdetail] ([id])
GO
ALTER TABLE [dbo].[images]  WITH CHECK ADD  CONSTRAINT [FK_images_product] FOREIGN KEY([productid])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[images] CHECK CONSTRAINT [FK_images_product]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_brand] FOREIGN KEY([brandid])
REFERENCES [dbo].[brand] ([id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_brand]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_categories] FOREIGN KEY([categoryid])
REFERENCES [dbo].[categories] ([id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_categories]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_sole] FOREIGN KEY([soleid])
REFERENCES [dbo].[sole] ([id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_sole]
GO
ALTER TABLE [dbo].[productdetail]  WITH CHECK ADD  CONSTRAINT [FK__productde__color__4BAC3F29] FOREIGN KEY([colorid])
REFERENCES [dbo].[colors] ([id])
GO
ALTER TABLE [dbo].[productdetail] CHECK CONSTRAINT [FK__productde__color__4BAC3F29]
GO
ALTER TABLE [dbo].[productdetail]  WITH CHECK ADD  CONSTRAINT [FK_productdetail_product] FOREIGN KEY([productid])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[productdetail] CHECK CONSTRAINT [FK_productdetail_product]
GO
ALTER TABLE [dbo].[productdetail]  WITH CHECK ADD  CONSTRAINT [FK_products_size] FOREIGN KEY([sizeid])
REFERENCES [dbo].[size] ([id])
GO
ALTER TABLE [dbo].[productdetail] CHECK CONSTRAINT [FK_products_size]
GO
ALTER TABLE [dbo].[promotion]  WITH CHECK ADD  CONSTRAINT [FK_promotion_employees] FOREIGN KEY([employee_id])
REFERENCES [dbo].[employees] ([id])
GO
ALTER TABLE [dbo].[promotion] CHECK CONSTRAINT [FK_promotion_employees]
GO
ALTER TABLE [dbo].[promotionproduct]  WITH CHECK ADD  CONSTRAINT [FK_promotionproduct_products] FOREIGN KEY([productdetailid])
REFERENCES [dbo].[productdetail] ([id])
GO
ALTER TABLE [dbo].[promotionproduct] CHECK CONSTRAINT [FK_promotionproduct_products]
GO
ALTER TABLE [dbo].[promotionproduct]  WITH CHECK ADD  CONSTRAINT [FK_promotionproduct_promotion] FOREIGN KEY([promotionid])
REFERENCES [dbo].[promotion] ([id])
GO
ALTER TABLE [dbo].[promotionproduct] CHECK CONSTRAINT [FK_promotionproduct_promotion]
GO
USE [master]
GO
ALTER DATABASE [datn] SET  READ_WRITE 
GO
