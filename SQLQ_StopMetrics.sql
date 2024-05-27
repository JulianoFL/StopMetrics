
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StopMetrics].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StopMetrics] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StopMetrics] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StopMetrics] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StopMetrics] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StopMetrics] SET ARITHABORT OFF 
GO
ALTER DATABASE [StopMetrics] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [StopMetrics] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StopMetrics] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StopMetrics] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StopMetrics] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StopMetrics] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StopMetrics] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StopMetrics] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StopMetrics] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StopMetrics] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StopMetrics] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StopMetrics] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StopMetrics] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StopMetrics] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StopMetrics] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StopMetrics] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StopMetrics] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StopMetrics] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StopMetrics] SET  MULTI_USER 
GO
ALTER DATABASE [StopMetrics] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StopMetrics] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StopMetrics] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StopMetrics] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StopMetrics] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [StopMetrics] SET QUERY_STORE = OFF
GO
USE [StopMetrics]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 22/11/2019 10:00:17 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[b3_accounts]    Script Date: 22/11/2019 10:00:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[b3_accounts](
	[id] [int] NOT NULL,
	[description] [nvarchar](100) NULL,
	[user_id] [int] NOT NULL,
 CONSTRAINT [pk_b3_accounts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[b3_brokerages]    Script Date: 22/11/2019 10:00:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[b3_brokerages](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[brokerage] [float] NOT NULL,
	[b3_cost] [float] NOT NULL,
	[symbol_type_id] [int] NOT NULL,
	[broker_account_id] [int] NOT NULL,
 CONSTRAINT [pk_b3_brokerages] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[b3_closing_data]    Script Date: 22/11/2019 10:00:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[b3_closing_data](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NOT NULL,
	[openning] [decimal](8, 2) NOT NULL,
	[closing] [decimal](8, 2) NOT NULL,
	[maximum] [decimal](8, 2) NOT NULL,
	[minimum] [decimal](8, 2) NOT NULL,
	[contracts_negociated] [bigint] NOT NULL,
	[volume] [bigint] NOT NULL,
	[average_price] [decimal](8, 2) NOT NULL,
	[ajuste] [decimal](8, 2) NULL,
	[negociated_number] [bigint] NOT NULL,
	[symbol] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_b3_closing_data] PRIMARY KEY CLUSTERED 
(
	[symbol] ASC,
	[date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[b3_operations]    Script Date: 22/11/2019 10:00:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[b3_operations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[symbol] [nvarchar](30) NULL,
	[openning] [datetime2](7) NOT NULL,
	[closing] [datetime2](7) NOT NULL,
	[buy_price] [money] NOT NULL,
	[sell_price] [money] NOT NULL,
	[quantity] [int] NOT NULL,
	[position] [nvarchar](max) NULL,
	[target] [money] NULL,
	[stop] [money] NULL,
	[result] [money] NOT NULL,
	[mae] [money] NOT NULL,
	[mfe] [money] NOT NULL,
	[cost] [money] NULL,
	[net_cost] [money] NULL,
	[strategy_id] [int] NULL,
	[symbol_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[b3_brokerage_id] [int] NOT NULL,
 CONSTRAINT [pk_b3_operations] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[b3_significant_points]    Script Date: 22/11/2019 10:00:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[b3_significant_points](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[symbol] [nvarchar](100) NOT NULL,
	[start_date] [date] NOT NULL,
	[price] [decimal](8, 2) NOT NULL,
	[position] [nvarchar](50) NOT NULL,
	[strength] [nvarchar](50) NOT NULL,
	[annotation] [nvarchar](max) NULL,
	[user_id] [int] NOT NULL,
	[end_date] [date] NULL,
 CONSTRAINT [pk_b3_significant_points] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[b3_symbols]    Script Date: 22/11/2019 10:00:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[b3_symbols](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](30) NOT NULL,
	[description] [nvarchar](100) NULL,
	[tick_value] [float] NOT NULL,
	[tick_step] [float] NOT NULL,
	[lot_size] [int] NOT NULL,
	[symbol_type_id] [int] NOT NULL,
 CONSTRAINT [pk_b3_symbols] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cme_accouns]    Script Date: 22/11/2019 10:00:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cme_accouns](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](100) NULL,
	[user_id] [int] NOT NULL,
 CONSTRAINT [pk_cme_accouns] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cme_brokerages]    Script Date: 22/11/2019 10:00:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cme_brokerages](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[brokerage] [float] NOT NULL,
	[symbol_id] [int] NOT NULL,
	[broker_acc_id] [int] NOT NULL,
 CONSTRAINT [pk_cme_brokerages] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cme_operations]    Script Date: 22/11/2019 10:00:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cme_operations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[symbol] [nvarchar](30) NULL,
	[openning] [datetime2](7) NOT NULL,
	[closing] [datetime2](7) NOT NULL,
	[buy_price] [money] NOT NULL,
	[sell_price] [money] NOT NULL,
	[quantity] [int] NOT NULL,
	[position] [nvarchar](max) NULL,
	[target] [money] NULL,
	[stop] [money] NULL,
	[result] [money] NOT NULL,
	[mae] [money] NOT NULL,
	[mfe] [money] NOT NULL,
	[cost] [money] NULL,
	[net_cost] [money] NULL,
	[strategy_id] [int] NULL,
	[symbol_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[cmebrokerage_id] [int] NOT NULL,
 CONSTRAINT [pk_cme_operations] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cme_symbols]    Script Date: 22/11/2019 10:00:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cme_symbols](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](100) NULL,
	[tick_value] [float] NOT NULL,
	[tick_step] [float] NOT NULL,
	[lot_size] [int] NOT NULL,
	[symbol_type_id] [int] NOT NULL,
	[name] [nvarchar](30) NOT NULL,
 CONSTRAINT [pk_cme_symbols] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[login_users]    Script Date: 22/11/2019 10:00:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[login_users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[firebase_id] [nvarchar](100) NULL,
	[name] [nvarchar](100) NULL,
	[email] [nvarchar](100) NULL,
	[register_date] [datetime2](7) NOT NULL,
 CONSTRAINT [pk_login_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[market_quotes]    Script Date: 22/11/2019 10:00:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[market_quotes](
	[symbol] [nvarchar](450) NOT NULL,
	[historical_name] [nvarchar](30) NULL,
	[description] [nvarchar](100) NULL,
	[closing] [float] NOT NULL,
	[openning] [float] NOT NULL,
	[last] [float] NOT NULL,
	[timestamp] [datetime2](7) NOT NULL,
	[net_change] [decimal](2, 2) NOT NULL,
	[net_change_m3] [money] NULL,
	[net_change_m5] [money] NULL,
	[net_change_m10] [money] NULL,
 CONSTRAINT [pk_market_quotes] PRIMARY KEY CLUSTERED 
(
	[symbol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[session_control]    Script Date: 22/11/2019 10:00:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[session_control](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[refresh_token] [nvarchar](max) NULL,
	[valid_por] [bigint] NOT NULL,
	[user_id] [int] NOT NULL,
 CONSTRAINT [pk_session_control] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[strategies]    Script Date: 22/11/2019 10:00:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[strategies](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](30) NULL,
	[description] [nvarchar](100) NULL,
	[user_id] [int] NOT NULL,
 CONSTRAINT [pk_strategies] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[symbol_types]    Script Date: 22/11/2019 10:00:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[symbol_types](
	[id] [int] NOT NULL,
	[name] [nvarchar](30) NULL,
	[description] [nvarchar](100) NULL,
 CONSTRAINT [pk_symbol_types] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20191021135323_Initial', N'3.0.0')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20191028192608_Accs', N'3.0.0')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20191114133520_ClosingData', N'3.0.0')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20191114133759_ClosingData1', N'3.0.0')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20191114134347_ClosingData2', N'3.0.0')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20191114135539_SignificantPoints', N'3.0.0')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20191114154249_MSymbols', N'3.0.0')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20191114163414_UserSigPoint', N'3.0.0')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20191118130829_sigDate', N'3.0.0')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20191118150908_ClosingKey', N'3.0.0')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20191119211533_Enddate', N'3.0.0')
GO
INSERT [dbo].[b3_accounts] ([id], [description], [user_id]) VALUES (11653, N'Simulador Profit', 1)
GO
SET IDENTITY_INSERT [dbo].[b3_brokerages] ON 
GO
INSERT [dbo].[b3_brokerages] ([id], [brokerage], [b3_cost], [symbol_type_id], [broker_account_id]) VALUES (5, 0.11, 0.003, 2, 11653)
GO
INSERT [dbo].[b3_brokerages] ([id], [brokerage], [b3_cost], [symbol_type_id], [broker_account_id]) VALUES (6, 0.11, 0.003, 1, 11653)
GO
INSERT [dbo].[b3_brokerages] ([id], [brokerage], [b3_cost], [symbol_type_id], [broker_account_id]) VALUES (7, 0.11, 0.003, 4, 11653)
GO
INSERT [dbo].[b3_brokerages] ([id], [brokerage], [b3_cost], [symbol_type_id], [broker_account_id]) VALUES (8, 0.11, 0.003, 3, 11653)
GO
SET IDENTITY_INSERT [dbo].[b3_brokerages] OFF
GO
SET IDENTITY_INSERT [dbo].[b3_closing_data] ON 
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (459, CAST(N'2017-11-30' AS Date), CAST(3252.00 AS Decimal(8, 2)), CAST(3282.00 AS Decimal(8, 2)), CAST(3298.00 AS Decimal(8, 2)), CAST(3246.50 AS Decimal(8, 2)), 470330, 77011424375, CAST(3274.00 AS Decimal(8, 2)), CAST(3288.45 AS Decimal(8, 2)), 49736, N'DOLF18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (458, CAST(N'2017-12-01' AS Date), CAST(3288.00 AS Decimal(8, 2)), CAST(3267.50 AS Decimal(8, 2)), CAST(3294.50 AS Decimal(8, 2)), CAST(3258.00 AS Decimal(8, 2)), 357060, 58382861250, CAST(3270.00 AS Decimal(8, 2)), CAST(3262.27 AS Decimal(8, 2)), 41241, N'DOLF18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (457, CAST(N'2017-12-04' AS Date), CAST(3268.50 AS Decimal(8, 2)), CAST(3252.50 AS Decimal(8, 2)), CAST(3271.00 AS Decimal(8, 2)), CAST(3250.00 AS Decimal(8, 2)), 240655, 39199821625, CAST(3257.00 AS Decimal(8, 2)), CAST(3251.55 AS Decimal(8, 2)), 25874, N'DOLF18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (456, CAST(N'2017-12-05' AS Date), CAST(3253.50 AS Decimal(8, 2)), CAST(3249.50 AS Decimal(8, 2)), CAST(3254.50 AS Decimal(8, 2)), CAST(3228.50 AS Decimal(8, 2)), 333425, 54023534875, CAST(3240.00 AS Decimal(8, 2)), CAST(3242.07 AS Decimal(8, 2)), 34508, N'DOLF18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (455, CAST(N'2017-12-06' AS Date), CAST(3253.00 AS Decimal(8, 2)), CAST(3243.50 AS Decimal(8, 2)), CAST(3257.00 AS Decimal(8, 2)), CAST(3233.50 AS Decimal(8, 2)), 272735, 44235661000, CAST(3243.00 AS Decimal(8, 2)), CAST(3250.85 AS Decimal(8, 2)), 28863, N'DOLF18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (454, CAST(N'2017-12-07' AS Date), CAST(3256.50 AS Decimal(8, 2)), CAST(3298.50 AS Decimal(8, 2)), CAST(3326.50 AS Decimal(8, 2)), CAST(3255.00 AS Decimal(8, 2)), 461395, 76071042000, CAST(3297.00 AS Decimal(8, 2)), CAST(3300.16 AS Decimal(8, 2)), 49089, N'DOLF18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (453, CAST(N'2017-12-08' AS Date), CAST(3283.50 AS Decimal(8, 2)), CAST(3299.00 AS Decimal(8, 2)), CAST(3318.50 AS Decimal(8, 2)), CAST(3273.00 AS Decimal(8, 2)), 329050, 54218913250, CAST(3295.00 AS Decimal(8, 2)), CAST(3305.57 AS Decimal(8, 2)), 37204, N'DOLF18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (452, CAST(N'2017-12-11' AS Date), CAST(3294.00 AS Decimal(8, 2)), CAST(3311.50 AS Decimal(8, 2)), CAST(3313.00 AS Decimal(8, 2)), CAST(3279.50 AS Decimal(8, 2)), 209325, 34494832125, CAST(3295.00 AS Decimal(8, 2)), CAST(3305.87 AS Decimal(8, 2)), 23297, N'DOLF18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (451, CAST(N'2017-12-12' AS Date), CAST(3308.00 AS Decimal(8, 2)), CAST(3312.50 AS Decimal(8, 2)), CAST(3340.00 AS Decimal(8, 2)), CAST(3304.00 AS Decimal(8, 2)), 363770, 60503013375, CAST(3326.00 AS Decimal(8, 2)), CAST(3335.73 AS Decimal(8, 2)), 33295, N'DOLF18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (450, CAST(N'2017-12-13' AS Date), CAST(3298.00 AS Decimal(8, 2)), CAST(3315.00 AS Decimal(8, 2)), CAST(3337.50 AS Decimal(8, 2)), CAST(3293.00 AS Decimal(8, 2)), 457035, 75714605875, CAST(3313.00 AS Decimal(8, 2)), CAST(3318.86 AS Decimal(8, 2)), 44144, N'DOLF18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (449, CAST(N'2017-12-14' AS Date), CAST(3325.00 AS Decimal(8, 2)), CAST(3346.50 AS Decimal(8, 2)), CAST(3351.50 AS Decimal(8, 2)), CAST(3315.00 AS Decimal(8, 2)), 352880, 58915099125, CAST(3339.00 AS Decimal(8, 2)), CAST(3343.38 AS Decimal(8, 2)), 37728, N'DOLF18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (448, CAST(N'2017-12-15' AS Date), CAST(3340.50 AS Decimal(8, 2)), CAST(3298.50 AS Decimal(8, 2)), CAST(3341.50 AS Decimal(8, 2)), CAST(3298.50 AS Decimal(8, 2)), 317170, 52655183000, CAST(3320.00 AS Decimal(8, 2)), CAST(3314.26 AS Decimal(8, 2)), 30894, N'DOLF18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (447, CAST(N'2017-12-18' AS Date), CAST(3302.00 AS Decimal(8, 2)), CAST(3295.50 AS Decimal(8, 2)), CAST(3304.50 AS Decimal(8, 2)), CAST(3282.00 AS Decimal(8, 2)), 300820, 49513034875, CAST(3291.00 AS Decimal(8, 2)), CAST(3297.03 AS Decimal(8, 2)), 27406, N'DOLF18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (446, CAST(N'2017-12-19' AS Date), CAST(3301.50 AS Decimal(8, 2)), CAST(3293.00 AS Decimal(8, 2)), CAST(3310.50 AS Decimal(8, 2)), CAST(3286.00 AS Decimal(8, 2)), 316330, 52151923875, CAST(3297.00 AS Decimal(8, 2)), CAST(3301.19 AS Decimal(8, 2)), 27981, N'DOLF18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (445, CAST(N'2017-12-20' AS Date), CAST(3290.00 AS Decimal(8, 2)), CAST(3300.00 AS Decimal(8, 2)), CAST(3302.00 AS Decimal(8, 2)), CAST(3283.50 AS Decimal(8, 2)), 265645, 43733420250, CAST(3292.00 AS Decimal(8, 2)), CAST(3290.50 AS Decimal(8, 2)), 24388, N'DOLF18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (444, CAST(N'2017-12-21' AS Date), CAST(3295.00 AS Decimal(8, 2)), CAST(3310.50 AS Decimal(8, 2)), CAST(3319.00 AS Decimal(8, 2)), CAST(3293.50 AS Decimal(8, 2)), 353970, 58538273625, CAST(3307.00 AS Decimal(8, 2)), CAST(3310.93 AS Decimal(8, 2)), 32278, N'DOLF18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (443, CAST(N'2017-12-22' AS Date), CAST(3307.00 AS Decimal(8, 2)), CAST(3337.00 AS Decimal(8, 2)), CAST(3340.00 AS Decimal(8, 2)), CAST(3304.50 AS Decimal(8, 2)), 312815, 51956627625, CAST(3321.00 AS Decimal(8, 2)), CAST(3334.79 AS Decimal(8, 2)), 25419, N'DOLF18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (442, CAST(N'2017-12-26' AS Date), CAST(3329.50 AS Decimal(8, 2)), CAST(3310.50 AS Decimal(8, 2)), CAST(3332.50 AS Decimal(8, 2)), CAST(3306.50 AS Decimal(8, 2)), 190310, 31579655500, CAST(3318.00 AS Decimal(8, 2)), CAST(3319.69 AS Decimal(8, 2)), 16203, N'DOLF18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (441, CAST(N'2017-12-27' AS Date), CAST(3305.00 AS Decimal(8, 2)), CAST(3315.00 AS Decimal(8, 2)), CAST(3322.00 AS Decimal(8, 2)), CAST(3294.00 AS Decimal(8, 2)), 232560, 38425243250, CAST(3304.00 AS Decimal(8, 2)), CAST(3310.00 AS Decimal(8, 2)), 20416, N'DOLF18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (239, CAST(N'2018-11-30' AS Date), CAST(3865.00 AS Decimal(8, 2)), CAST(3864.00 AS Decimal(8, 2)), CAST(3893.00 AS Decimal(8, 2)), CAST(3843.00 AS Decimal(8, 2)), 457240, 88411545625, CAST(3867.00 AS Decimal(8, 2)), CAST(3871.41 AS Decimal(8, 2)), 47072, N'DOLF19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (238, CAST(N'2018-12-03' AS Date), CAST(3826.00 AS Decimal(8, 2)), CAST(3844.00 AS Decimal(8, 2)), CAST(3849.50 AS Decimal(8, 2)), CAST(3819.00 AS Decimal(8, 2)), 303170, 58108954250, CAST(3833.00 AS Decimal(8, 2)), CAST(3826.78 AS Decimal(8, 2)), 33614, N'DOLF19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (237, CAST(N'2018-12-04' AS Date), CAST(3831.00 AS Decimal(8, 2)), CAST(3855.00 AS Decimal(8, 2)), CAST(3871.00 AS Decimal(8, 2)), CAST(3821.50 AS Decimal(8, 2)), 350305, 67288401500, CAST(3841.00 AS Decimal(8, 2)), CAST(3856.63 AS Decimal(8, 2)), 37638, N'DOLF19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (236, CAST(N'2018-12-05' AS Date), CAST(3850.00 AS Decimal(8, 2)), CAST(3872.50 AS Decimal(8, 2)), CAST(3887.00 AS Decimal(8, 2)), CAST(3838.50 AS Decimal(8, 2)), 256570, 49561347750, CAST(3863.00 AS Decimal(8, 2)), CAST(3868.24 AS Decimal(8, 2)), 28550, N'DOLF19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (235, CAST(N'2018-12-06' AS Date), CAST(3897.00 AS Decimal(8, 2)), CAST(3882.50 AS Decimal(8, 2)), CAST(3946.50 AS Decimal(8, 2)), CAST(3876.00 AS Decimal(8, 2)), 458580, 89697626375, CAST(3911.00 AS Decimal(8, 2)), CAST(3891.90 AS Decimal(8, 2)), 50882, N'DOLF19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (234, CAST(N'2018-12-07' AS Date), CAST(3883.50 AS Decimal(8, 2)), CAST(3910.00 AS Decimal(8, 2)), CAST(3928.00 AS Decimal(8, 2)), CAST(3860.50 AS Decimal(8, 2)), 364930, 70985397625, CAST(3890.00 AS Decimal(8, 2)), CAST(3880.25 AS Decimal(8, 2)), 40671, N'DOLF19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (233, CAST(N'2018-12-10' AS Date), CAST(3906.50 AS Decimal(8, 2)), CAST(3920.50 AS Decimal(8, 2)), CAST(3948.00 AS Decimal(8, 2)), CAST(3894.00 AS Decimal(8, 2)), 322190, 63178750875, CAST(3921.00 AS Decimal(8, 2)), CAST(3928.73 AS Decimal(8, 2)), 35434, N'DOLF19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (232, CAST(N'2018-12-11' AS Date), CAST(3906.00 AS Decimal(8, 2)), CAST(3907.00 AS Decimal(8, 2)), CAST(3926.50 AS Decimal(8, 2)), CAST(3891.50 AS Decimal(8, 2)), 298515, 58352280875, CAST(3909.00 AS Decimal(8, 2)), CAST(3916.92 AS Decimal(8, 2)), 30387, N'DOLF19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (231, CAST(N'2018-12-12' AS Date), CAST(3898.00 AS Decimal(8, 2)), CAST(3857.00 AS Decimal(8, 2)), CAST(3901.50 AS Decimal(8, 2)), CAST(3839.00 AS Decimal(8, 2)), 380140, 73410836250, CAST(3862.00 AS Decimal(8, 2)), CAST(3849.65 AS Decimal(8, 2)), 38688, N'DOLF19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (230, CAST(N'2018-12-13' AS Date), CAST(3859.50 AS Decimal(8, 2)), CAST(3893.00 AS Decimal(8, 2)), CAST(3900.00 AS Decimal(8, 2)), CAST(3854.00 AS Decimal(8, 2)), 293550, 56980898750, CAST(3882.00 AS Decimal(8, 2)), CAST(3881.71 AS Decimal(8, 2)), 32387, N'DOLF19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (229, CAST(N'2018-12-14' AS Date), CAST(3913.50 AS Decimal(8, 2)), CAST(3918.50 AS Decimal(8, 2)), CAST(3922.50 AS Decimal(8, 2)), CAST(3891.00 AS Decimal(8, 2)), 269625, 52647951750, CAST(3905.00 AS Decimal(8, 2)), CAST(3899.35 AS Decimal(8, 2)), 29252, N'DOLF19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (228, CAST(N'2018-12-17' AS Date), CAST(3909.50 AS Decimal(8, 2)), CAST(3900.00 AS Decimal(8, 2)), CAST(3929.50 AS Decimal(8, 2)), CAST(3880.00 AS Decimal(8, 2)), 288070, 56259205875, CAST(3905.00 AS Decimal(8, 2)), CAST(3888.63 AS Decimal(8, 2)), 29698, N'DOLF19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (227, CAST(N'2018-12-18' AS Date), CAST(3899.00 AS Decimal(8, 2)), CAST(3913.00 AS Decimal(8, 2)), CAST(3918.00 AS Decimal(8, 2)), CAST(3885.00 AS Decimal(8, 2)), 373710, 72903481500, CAST(3901.00 AS Decimal(8, 2)), CAST(3901.95 AS Decimal(8, 2)), 32613, N'DOLF19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (226, CAST(N'2018-12-19' AS Date), CAST(3901.50 AS Decimal(8, 2)), CAST(3897.00 AS Decimal(8, 2)), CAST(3913.50 AS Decimal(8, 2)), CAST(3864.50 AS Decimal(8, 2)), 364265, 70759859875, CAST(3885.00 AS Decimal(8, 2)), CAST(3876.12 AS Decimal(8, 2)), 34659, N'DOLF19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (225, CAST(N'2018-12-20' AS Date), CAST(3868.50 AS Decimal(8, 2)), CAST(3842.00 AS Decimal(8, 2)), CAST(3876.00 AS Decimal(8, 2)), CAST(3833.50 AS Decimal(8, 2)), 336275, 64725160750, CAST(3849.00 AS Decimal(8, 2)), CAST(3851.40 AS Decimal(8, 2)), 34045, N'DOLF19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (224, CAST(N'2018-12-21' AS Date), CAST(3856.00 AS Decimal(8, 2)), CAST(3902.00 AS Decimal(8, 2)), CAST(3905.00 AS Decimal(8, 2)), CAST(3844.50 AS Decimal(8, 2)), 337770, 65369889000, CAST(3870.00 AS Decimal(8, 2)), CAST(3887.46 AS Decimal(8, 2)), 31618, N'DOLF19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (223, CAST(N'2018-12-26' AS Date), CAST(3900.00 AS Decimal(8, 2)), CAST(3919.00 AS Decimal(8, 2)), CAST(3937.50 AS Decimal(8, 2)), CAST(3892.50 AS Decimal(8, 2)), 278190, 54513843750, CAST(3919.00 AS Decimal(8, 2)), CAST(3918.66 AS Decimal(8, 2)), 25869, N'DOLF19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (222, CAST(N'2018-12-27' AS Date), CAST(3924.00 AS Decimal(8, 2)), CAST(3874.00 AS Decimal(8, 2)), CAST(3940.00 AS Decimal(8, 2)), CAST(3869.50 AS Decimal(8, 2)), 285395, 55822588375, CAST(3911.00 AS Decimal(8, 2)), CAST(3889.73 AS Decimal(8, 2)), 29953, N'DOLF19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (685, CAST(N'2017-01-02' AS Date), CAST(3285.00 AS Decimal(8, 2)), CAST(3314.50 AS Decimal(8, 2)), CAST(3316.00 AS Decimal(8, 2)), CAST(3284.00 AS Decimal(8, 2)), 130105, 21481745875, CAST(3302.00 AS Decimal(8, 2)), CAST(3308.27 AS Decimal(8, 2)), 8821, N'DOLG17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (684, CAST(N'2017-01-03' AS Date), CAST(3313.00 AS Decimal(8, 2)), CAST(3289.00 AS Decimal(8, 2)), CAST(3318.50 AS Decimal(8, 2)), CAST(3275.00 AS Decimal(8, 2)), 211475, 34782290000, CAST(3289.00 AS Decimal(8, 2)), CAST(3280.37 AS Decimal(8, 2)), 19633, N'DOLG17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (683, CAST(N'2017-01-04' AS Date), CAST(3279.50 AS Decimal(8, 2)), CAST(3241.50 AS Decimal(8, 2)), CAST(3280.00 AS Decimal(8, 2)), CAST(3235.50 AS Decimal(8, 2)), 247555, 40264334750, CAST(3252.00 AS Decimal(8, 2)), CAST(3247.40 AS Decimal(8, 2)), 20764, N'DOLG17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (682, CAST(N'2017-01-05' AS Date), CAST(3247.00 AS Decimal(8, 2)), CAST(3224.00 AS Decimal(8, 2)), CAST(3253.00 AS Decimal(8, 2)), CAST(3217.00 AS Decimal(8, 2)), 284175, 45936575500, CAST(3232.00 AS Decimal(8, 2)), CAST(3223.05 AS Decimal(8, 2)), 28077, N'DOLG17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (681, CAST(N'2017-01-06' AS Date), CAST(3231.00 AS Decimal(8, 2)), CAST(3246.50 AS Decimal(8, 2)), CAST(3246.50 AS Decimal(8, 2)), CAST(3210.00 AS Decimal(8, 2)), 227230, 36706454750, CAST(3230.00 AS Decimal(8, 2)), CAST(3244.50 AS Decimal(8, 2)), 22581, N'DOLG17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (680, CAST(N'2017-01-09' AS Date), CAST(3248.50 AS Decimal(8, 2)), CAST(3219.00 AS Decimal(8, 2)), CAST(3254.50 AS Decimal(8, 2)), CAST(3212.00 AS Decimal(8, 2)), 162370, 26193940000, CAST(3226.00 AS Decimal(8, 2)), CAST(3218.05 AS Decimal(8, 2)), 16095, N'DOLG17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (679, CAST(N'2017-01-10' AS Date), CAST(3216.00 AS Decimal(8, 2)), CAST(3213.50 AS Decimal(8, 2)), CAST(3222.00 AS Decimal(8, 2)), CAST(3201.00 AS Decimal(8, 2)), 177920, 28578723125, CAST(3212.00 AS Decimal(8, 2)), CAST(3217.81 AS Decimal(8, 2)), 16911, N'DOLG17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (678, CAST(N'2017-01-11' AS Date), CAST(3215.00 AS Decimal(8, 2)), CAST(3220.00 AS Decimal(8, 2)), CAST(3249.00 AS Decimal(8, 2)), CAST(3198.50 AS Decimal(8, 2)), 276155, 44554314625, CAST(3226.00 AS Decimal(8, 2)), CAST(3213.37 AS Decimal(8, 2)), 31896, N'DOLG17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (677, CAST(N'2017-01-12' AS Date), CAST(3190.50 AS Decimal(8, 2)), CAST(3203.00 AS Decimal(8, 2)), CAST(3208.50 AS Decimal(8, 2)), CAST(3169.50 AS Decimal(8, 2)), 335370, 53476668250, CAST(3189.00 AS Decimal(8, 2)), CAST(3191.04 AS Decimal(8, 2)), 29970, N'DOLG17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (676, CAST(N'2017-01-13' AS Date), CAST(3202.00 AS Decimal(8, 2)), CAST(3237.50 AS Decimal(8, 2)), CAST(3239.00 AS Decimal(8, 2)), CAST(3196.00 AS Decimal(8, 2)), 260125, 41878816250, CAST(3219.00 AS Decimal(8, 2)), CAST(3225.27 AS Decimal(8, 2)), 25431, N'DOLG17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (675, CAST(N'2017-01-16' AS Date), CAST(3239.00 AS Decimal(8, 2)), CAST(3258.50 AS Decimal(8, 2)), CAST(3260.00 AS Decimal(8, 2)), CAST(3232.50 AS Decimal(8, 2)), 102305, 16590418750, CAST(3243.00 AS Decimal(8, 2)), CAST(3246.15 AS Decimal(8, 2)), 11354, N'DOLG17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (674, CAST(N'2017-01-17' AS Date), CAST(3221.00 AS Decimal(8, 2)), CAST(3225.00 AS Decimal(8, 2)), CAST(3235.00 AS Decimal(8, 2)), CAST(3210.50 AS Decimal(8, 2)), 219950, 35452264375, CAST(3223.00 AS Decimal(8, 2)), CAST(3226.36 AS Decimal(8, 2)), 22336, N'DOLG17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (673, CAST(N'2017-01-18' AS Date), CAST(3235.50 AS Decimal(8, 2)), CAST(3244.50 AS Decimal(8, 2)), CAST(3244.50 AS Decimal(8, 2)), CAST(3226.00 AS Decimal(8, 2)), 167040, 27005195375, CAST(3233.00 AS Decimal(8, 2)), CAST(3234.45 AS Decimal(8, 2)), 18287, N'DOLG17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (672, CAST(N'2017-01-19' AS Date), CAST(3237.00 AS Decimal(8, 2)), CAST(3207.00 AS Decimal(8, 2)), CAST(3243.50 AS Decimal(8, 2)), CAST(3204.50 AS Decimal(8, 2)), 237755, 38260879250, CAST(3218.00 AS Decimal(8, 2)), CAST(3207.93 AS Decimal(8, 2)), 26677, N'DOLG17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (671, CAST(N'2017-01-20' AS Date), CAST(3211.50 AS Decimal(8, 2)), CAST(3179.00 AS Decimal(8, 2)), CAST(3214.00 AS Decimal(8, 2)), CAST(3179.00 AS Decimal(8, 2)), 196190, 31363972875, CAST(3197.00 AS Decimal(8, 2)), CAST(3185.44 AS Decimal(8, 2)), 21914, N'DOLG17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (670, CAST(N'2017-01-23' AS Date), CAST(3170.00 AS Decimal(8, 2)), CAST(3171.50 AS Decimal(8, 2)), CAST(3191.50 AS Decimal(8, 2)), CAST(3160.00 AS Decimal(8, 2)), 222455, 35298271250, CAST(3173.00 AS Decimal(8, 2)), CAST(3181.49 AS Decimal(8, 2)), 23390, N'DOLG17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (669, CAST(N'2017-01-24' AS Date), CAST(3175.00 AS Decimal(8, 2)), CAST(3177.00 AS Decimal(8, 2)), CAST(3182.00 AS Decimal(8, 2)), CAST(3165.50 AS Decimal(8, 2)), 162435, 25774633250, CAST(3173.00 AS Decimal(8, 2)), CAST(3173.10 AS Decimal(8, 2)), 17351, N'DOLG17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (668, CAST(N'2017-01-26' AS Date), CAST(3165.50 AS Decimal(8, 2)), CAST(3182.00 AS Decimal(8, 2)), CAST(3198.50 AS Decimal(8, 2)), CAST(3164.00 AS Decimal(8, 2)), 265365, 42265704000, CAST(3185.00 AS Decimal(8, 2)), CAST(3186.54 AS Decimal(8, 2)), 26826, N'DOLG17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (667, CAST(N'2017-01-27' AS Date), CAST(3181.50 AS Decimal(8, 2)), CAST(3144.50 AS Decimal(8, 2)), CAST(3186.50 AS Decimal(8, 2)), CAST(3141.50 AS Decimal(8, 2)), 250215, 39546998000, CAST(3161.00 AS Decimal(8, 2)), CAST(3153.68 AS Decimal(8, 2)), 24112, N'DOLG17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (666, CAST(N'2017-01-30' AS Date), CAST(3141.00 AS Decimal(8, 2)), CAST(3126.50 AS Decimal(8, 2)), CAST(3154.00 AS Decimal(8, 2)), CAST(3114.00 AS Decimal(8, 2)), 260875, 40793174000, CAST(3127.00 AS Decimal(8, 2)), CAST(3117.13 AS Decimal(8, 2)), 25289, N'DOLG17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (440, CAST(N'2017-12-28' AS Date), CAST(3321.00 AS Decimal(8, 2)), CAST(3330.00 AS Decimal(8, 2)), CAST(3336.50 AS Decimal(8, 2)), CAST(3307.50 AS Decimal(8, 2)), 265425, 44039365750, CAST(3318.00 AS Decimal(8, 2)), CAST(3315.73 AS Decimal(8, 2)), 22952, N'DOLG18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (439, CAST(N'2018-01-02' AS Date), CAST(3307.50 AS Decimal(8, 2)), CAST(3271.00 AS Decimal(8, 2)), CAST(3308.00 AS Decimal(8, 2)), CAST(3268.50 AS Decimal(8, 2)), 321435, 52714186375, CAST(3279.00 AS Decimal(8, 2)), CAST(3270.39 AS Decimal(8, 2)), 27200, N'DOLG18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (438, CAST(N'2018-01-03' AS Date), CAST(3261.00 AS Decimal(8, 2)), CAST(3248.00 AS Decimal(8, 2)), CAST(3277.50 AS Decimal(8, 2)), CAST(3244.00 AS Decimal(8, 2)), 325345, 53055331625, CAST(3261.00 AS Decimal(8, 2)), CAST(3253.38 AS Decimal(8, 2)), 31323, N'DOLG18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (437, CAST(N'2018-01-04' AS Date), CAST(3244.00 AS Decimal(8, 2)), CAST(3246.00 AS Decimal(8, 2)), CAST(3254.00 AS Decimal(8, 2)), CAST(3233.00 AS Decimal(8, 2)), 286155, 46393894000, CAST(3242.00 AS Decimal(8, 2)), CAST(3239.13 AS Decimal(8, 2)), 27259, N'DOLG18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (436, CAST(N'2018-01-05' AS Date), CAST(3246.50 AS Decimal(8, 2)), CAST(3239.50 AS Decimal(8, 2)), CAST(3259.50 AS Decimal(8, 2)), CAST(3236.50 AS Decimal(8, 2)), 274765, 44612131750, CAST(3247.00 AS Decimal(8, 2)), CAST(3242.38 AS Decimal(8, 2)), 29902, N'DOLG18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (435, CAST(N'2018-01-08' AS Date), CAST(3241.00 AS Decimal(8, 2)), CAST(3251.00 AS Decimal(8, 2)), CAST(3255.00 AS Decimal(8, 2)), CAST(3234.50 AS Decimal(8, 2)), 244320, 39644116125, CAST(3245.00 AS Decimal(8, 2)), CAST(3244.03 AS Decimal(8, 2)), 25387, N'DOLG18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (434, CAST(N'2018-01-09' AS Date), CAST(3252.00 AS Decimal(8, 2)), CAST(3258.00 AS Decimal(8, 2)), CAST(3265.50 AS Decimal(8, 2)), CAST(3239.50 AS Decimal(8, 2)), 302680, 49245526500, CAST(3253.00 AS Decimal(8, 2)), CAST(3259.64 AS Decimal(8, 2)), 33835, N'DOLG18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (433, CAST(N'2018-01-10' AS Date), CAST(3263.00 AS Decimal(8, 2)), CAST(3237.50 AS Decimal(8, 2)), CAST(3265.50 AS Decimal(8, 2)), CAST(3236.00 AS Decimal(8, 2)), 329775, 53623388375, CAST(3252.00 AS Decimal(8, 2)), CAST(3242.12 AS Decimal(8, 2)), 32794, N'DOLG18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (432, CAST(N'2018-01-11' AS Date), CAST(3241.50 AS Decimal(8, 2)), CAST(3223.50 AS Decimal(8, 2)), CAST(3245.50 AS Decimal(8, 2)), CAST(3220.00 AS Decimal(8, 2)), 320310, 51806345625, CAST(3234.00 AS Decimal(8, 2)), CAST(3232.40 AS Decimal(8, 2)), 30595, N'DOLG18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (431, CAST(N'2018-01-12' AS Date), CAST(3227.00 AS Decimal(8, 2)), CAST(3213.50 AS Decimal(8, 2)), CAST(3236.50 AS Decimal(8, 2)), CAST(3206.50 AS Decimal(8, 2)), 350475, 56478752875, CAST(3222.00 AS Decimal(8, 2)), CAST(3218.18 AS Decimal(8, 2)), 37079, N'DOLG18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (430, CAST(N'2018-01-15' AS Date), CAST(3204.50 AS Decimal(8, 2)), CAST(3223.50 AS Decimal(8, 2)), CAST(3225.00 AS Decimal(8, 2)), CAST(3199.00 AS Decimal(8, 2)), 180575, 28958669625, CAST(3207.00 AS Decimal(8, 2)), CAST(3210.52 AS Decimal(8, 2)), 18418, N'DOLG18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (429, CAST(N'2018-01-16' AS Date), CAST(3222.00 AS Decimal(8, 2)), CAST(3231.00 AS Decimal(8, 2)), CAST(3244.00 AS Decimal(8, 2)), CAST(3219.00 AS Decimal(8, 2)), 308815, 49888925500, CAST(3230.00 AS Decimal(8, 2)), CAST(3233.34 AS Decimal(8, 2)), 34878, N'DOLG18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (428, CAST(N'2018-01-17' AS Date), CAST(3236.00 AS Decimal(8, 2)), CAST(3230.00 AS Decimal(8, 2)), CAST(3245.00 AS Decimal(8, 2)), CAST(3218.50 AS Decimal(8, 2)), 307440, 49697837125, CAST(3233.00 AS Decimal(8, 2)), CAST(3223.67 AS Decimal(8, 2)), 29288, N'DOLG18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (427, CAST(N'2018-01-18' AS Date), CAST(3225.50 AS Decimal(8, 2)), CAST(3212.50 AS Decimal(8, 2)), CAST(3231.00 AS Decimal(8, 2)), CAST(3208.00 AS Decimal(8, 2)), 351020, 56493008125, CAST(3218.00 AS Decimal(8, 2)), CAST(3218.18 AS Decimal(8, 2)), 34399, N'DOLG18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (426, CAST(N'2018-01-19' AS Date), CAST(3213.00 AS Decimal(8, 2)), CAST(3202.00 AS Decimal(8, 2)), CAST(3219.50 AS Decimal(8, 2)), CAST(3200.00 AS Decimal(8, 2)), 265160, 42582334375, CAST(3211.00 AS Decimal(8, 2)), CAST(3205.94 AS Decimal(8, 2)), 26495, N'DOLG18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (425, CAST(N'2018-01-22' AS Date), CAST(3199.00 AS Decimal(8, 2)), CAST(3207.00 AS Decimal(8, 2)), CAST(3216.00 AS Decimal(8, 2)), CAST(3188.50 AS Decimal(8, 2)), 296330, 47451034875, CAST(3202.00 AS Decimal(8, 2)), CAST(3206.51 AS Decimal(8, 2)), 30463, N'DOLG18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (424, CAST(N'2018-01-23' AS Date), CAST(3215.00 AS Decimal(8, 2)), CAST(3241.00 AS Decimal(8, 2)), CAST(3248.00 AS Decimal(8, 2)), CAST(3213.00 AS Decimal(8, 2)), 388245, 62750576125, CAST(3232.00 AS Decimal(8, 2)), CAST(3243.88 AS Decimal(8, 2)), 39206, N'DOLG18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (423, CAST(N'2018-01-24' AS Date), CAST(3227.50 AS Decimal(8, 2)), CAST(3150.00 AS Decimal(8, 2)), CAST(3235.00 AS Decimal(8, 2)), CAST(3138.00 AS Decimal(8, 2)), 503755, 80257078750, CAST(3186.00 AS Decimal(8, 2)), CAST(3184.85 AS Decimal(8, 2)), 52267, N'DOLG18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (422, CAST(N'2018-01-26' AS Date), CAST(3135.00 AS Decimal(8, 2)), CAST(3154.50 AS Decimal(8, 2)), CAST(3158.00 AS Decimal(8, 2)), CAST(3123.00 AS Decimal(8, 2)), 499980, 78662562250, CAST(3146.00 AS Decimal(8, 2)), CAST(3150.26 AS Decimal(8, 2)), 49205, N'DOLG18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (421, CAST(N'2018-01-29' AS Date), CAST(3161.50 AS Decimal(8, 2)), CAST(3156.50 AS Decimal(8, 2)), CAST(3173.50 AS Decimal(8, 2)), CAST(3156.00 AS Decimal(8, 2)), 337095, 53381319125, CAST(3167.00 AS Decimal(8, 2)), CAST(3171.36 AS Decimal(8, 2)), 36889, N'DOLG18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (420, CAST(N'2018-01-30' AS Date), CAST(3155.00 AS Decimal(8, 2)), CAST(3182.00 AS Decimal(8, 2)), CAST(3196.00 AS Decimal(8, 2)), CAST(3149.00 AS Decimal(8, 2)), 431675, 68470467875, CAST(3172.00 AS Decimal(8, 2)), CAST(3181.06 AS Decimal(8, 2)), 39034, N'DOLG18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (221, CAST(N'2018-12-28' AS Date), CAST(3883.00 AS Decimal(8, 2)), CAST(3893.50 AS Decimal(8, 2)), CAST(3901.00 AS Decimal(8, 2)), CAST(3836.00 AS Decimal(8, 2)), 371090, 71973852375, CAST(3879.00 AS Decimal(8, 2)), CAST(3878.58 AS Decimal(8, 2)), 32860, N'DOLG19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (220, CAST(N'2019-01-02' AS Date), CAST(3888.00 AS Decimal(8, 2)), CAST(3790.50 AS Decimal(8, 2)), CAST(3904.00 AS Decimal(8, 2)), CAST(3790.00 AS Decimal(8, 2)), 363175, 69742107750, CAST(3840.00 AS Decimal(8, 2)), CAST(3819.04 AS Decimal(8, 2)), 38817, N'DOLG19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (219, CAST(N'2019-01-03' AS Date), CAST(3804.00 AS Decimal(8, 2)), CAST(3763.00 AS Decimal(8, 2)), CAST(3815.00 AS Decimal(8, 2)), CAST(3745.00 AS Decimal(8, 2)), 379740, 71632283875, CAST(3772.00 AS Decimal(8, 2)), CAST(3758.78 AS Decimal(8, 2)), 38959, N'DOLG19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (218, CAST(N'2019-01-04' AS Date), CAST(3750.00 AS Decimal(8, 2)), CAST(3721.50 AS Decimal(8, 2)), CAST(3791.00 AS Decimal(8, 2)), CAST(3715.50 AS Decimal(8, 2)), 424040, 79455831875, CAST(3747.00 AS Decimal(8, 2)), CAST(3720.32 AS Decimal(8, 2)), 44405, N'DOLG19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (217, CAST(N'2019-01-07' AS Date), CAST(3722.00 AS Decimal(8, 2)), CAST(3741.50 AS Decimal(8, 2)), CAST(3743.50 AS Decimal(8, 2)), CAST(3695.50 AS Decimal(8, 2)), 365160, 67881591875, CAST(3717.00 AS Decimal(8, 2)), CAST(3733.22 AS Decimal(8, 2)), 38030, N'DOLG19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (216, CAST(N'2019-01-08' AS Date), CAST(3745.00 AS Decimal(8, 2)), CAST(3718.00 AS Decimal(8, 2)), CAST(3748.00 AS Decimal(8, 2)), CAST(3709.00 AS Decimal(8, 2)), 294680, 54883365250, CAST(3724.00 AS Decimal(8, 2)), CAST(3720.04 AS Decimal(8, 2)), 31927, N'DOLG19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (215, CAST(N'2019-01-09' AS Date), CAST(3712.00 AS Decimal(8, 2)), CAST(3685.50 AS Decimal(8, 2)), CAST(3716.00 AS Decimal(8, 2)), CAST(3680.00 AS Decimal(8, 2)), 347475, 64177674875, CAST(3693.00 AS Decimal(8, 2)), CAST(3695.37 AS Decimal(8, 2)), 35608, N'DOLG19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (214, CAST(N'2019-01-10' AS Date), CAST(3696.50 AS Decimal(8, 2)), CAST(3715.50 AS Decimal(8, 2)), CAST(3730.00 AS Decimal(8, 2)), CAST(3680.00 AS Decimal(8, 2)), 382305, 70768874000, CAST(3702.00 AS Decimal(8, 2)), CAST(3715.33 AS Decimal(8, 2)), 37543, N'DOLG19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (213, CAST(N'2019-01-11' AS Date), CAST(3699.00 AS Decimal(8, 2)), CAST(3715.00 AS Decimal(8, 2)), CAST(3733.50 AS Decimal(8, 2)), CAST(3696.00 AS Decimal(8, 2)), 288235, 53557621375, CAST(3716.00 AS Decimal(8, 2)), CAST(3714.81 AS Decimal(8, 2)), 31380, N'DOLG19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (212, CAST(N'2019-01-14' AS Date), CAST(3722.00 AS Decimal(8, 2)), CAST(3701.50 AS Decimal(8, 2)), CAST(3738.00 AS Decimal(8, 2)), CAST(3687.50 AS Decimal(8, 2)), 292830, 54424217375, CAST(3717.00 AS Decimal(8, 2)), CAST(3695.91 AS Decimal(8, 2)), 32481, N'DOLG19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (211, CAST(N'2019-01-15' AS Date), CAST(3707.00 AS Decimal(8, 2)), CAST(3719.50 AS Decimal(8, 2)), CAST(3735.00 AS Decimal(8, 2)), CAST(3697.50 AS Decimal(8, 2)), 320170, 59485243625, CAST(3715.00 AS Decimal(8, 2)), CAST(3726.71 AS Decimal(8, 2)), 33842, N'DOLG19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (210, CAST(N'2019-01-16' AS Date), CAST(3718.00 AS Decimal(8, 2)), CAST(3738.50 AS Decimal(8, 2)), CAST(3740.00 AS Decimal(8, 2)), CAST(3711.00 AS Decimal(8, 2)), 288420, 53750980750, CAST(3727.00 AS Decimal(8, 2)), CAST(3728.00 AS Decimal(8, 2)), 33021, N'DOLG19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (209, CAST(N'2019-01-17' AS Date), CAST(3737.00 AS Decimal(8, 2)), CAST(3752.00 AS Decimal(8, 2)), CAST(3776.00 AS Decimal(8, 2)), CAST(3729.00 AS Decimal(8, 2)), 412590, 77533462625, CAST(3758.00 AS Decimal(8, 2)), CAST(3753.77 AS Decimal(8, 2)), 42757, N'DOLG19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (208, CAST(N'2019-01-18' AS Date), CAST(3748.50 AS Decimal(8, 2)), CAST(3754.50 AS Decimal(8, 2)), CAST(3775.00 AS Decimal(8, 2)), CAST(3729.00 AS Decimal(8, 2)), 311730, 58478043000, CAST(3751.00 AS Decimal(8, 2)), CAST(3769.21 AS Decimal(8, 2)), 35536, N'DOLG19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (207, CAST(N'2019-01-21' AS Date), CAST(3761.00 AS Decimal(8, 2)), CAST(3755.50 AS Decimal(8, 2)), CAST(3782.00 AS Decimal(8, 2)), CAST(3755.50 AS Decimal(8, 2)), 135935, 25618281250, CAST(3769.00 AS Decimal(8, 2)), CAST(3761.10 AS Decimal(8, 2)), 14562, N'DOLG19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (206, CAST(N'2019-01-22' AS Date), CAST(3768.00 AS Decimal(8, 2)), CAST(3819.50 AS Decimal(8, 2)), CAST(3819.50 AS Decimal(8, 2)), CAST(3747.50 AS Decimal(8, 2)), 359595, 67953400250, CAST(3779.00 AS Decimal(8, 2)), CAST(3784.35 AS Decimal(8, 2)), 41735, N'DOLG19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (205, CAST(N'2019-01-23' AS Date), CAST(3800.50 AS Decimal(8, 2)), CAST(3767.50 AS Decimal(8, 2)), CAST(3813.50 AS Decimal(8, 2)), CAST(3757.50 AS Decimal(8, 2)), 358025, 67884836875, CAST(3792.00 AS Decimal(8, 2)), CAST(3772.39 AS Decimal(8, 2)), 38789, N'DOLG19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (204, CAST(N'2019-01-24' AS Date), CAST(3774.50 AS Decimal(8, 2)), CAST(3773.00 AS Decimal(8, 2)), CAST(3796.00 AS Decimal(8, 2)), CAST(3739.50 AS Decimal(8, 2)), 391890, 73896046875, CAST(3771.00 AS Decimal(8, 2)), CAST(3769.67 AS Decimal(8, 2)), 42221, N'DOLG19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (203, CAST(N'2019-01-28' AS Date), CAST(3778.00 AS Decimal(8, 2)), CAST(3761.50 AS Decimal(8, 2)), CAST(3787.50 AS Decimal(8, 2)), CAST(3751.50 AS Decimal(8, 2)), 354920, 66856348000, CAST(3767.00 AS Decimal(8, 2)), CAST(3768.20 AS Decimal(8, 2)), 32974, N'DOLG19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (202, CAST(N'2019-01-29' AS Date), CAST(3764.50 AS Decimal(8, 2)), CAST(3720.00 AS Decimal(8, 2)), CAST(3765.50 AS Decimal(8, 2)), CAST(3715.50 AS Decimal(8, 2)), 361100, 67427417000, CAST(3734.00 AS Decimal(8, 2)), CAST(3727.00 AS Decimal(8, 2)), 32935, N'DOLG19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (201, CAST(N'2019-01-30' AS Date), CAST(3715.00 AS Decimal(8, 2)), CAST(3684.50 AS Decimal(8, 2)), CAST(3732.00 AS Decimal(8, 2)), CAST(3674.00 AS Decimal(8, 2)), 406840, 75465258000, CAST(3709.00 AS Decimal(8, 2)), CAST(3723.39 AS Decimal(8, 2)), 40753, N'DOLG19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (665, CAST(N'2017-01-31' AS Date), CAST(3152.00 AS Decimal(8, 2)), CAST(3170.00 AS Decimal(8, 2)), CAST(3179.00 AS Decimal(8, 2)), CAST(3125.00 AS Decimal(8, 2)), 354005, 55816392875, CAST(3153.00 AS Decimal(8, 2)), CAST(3176.76 AS Decimal(8, 2)), 36013, N'DOLH17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (664, CAST(N'2017-02-01' AS Date), CAST(3164.50 AS Decimal(8, 2)), CAST(3150.00 AS Decimal(8, 2)), CAST(3184.00 AS Decimal(8, 2)), CAST(3148.00 AS Decimal(8, 2)), 260255, 41230280625, CAST(3168.00 AS Decimal(8, 2)), CAST(3173.45 AS Decimal(8, 2)), 26232, N'DOLH17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (663, CAST(N'2017-02-02' AS Date), CAST(3135.00 AS Decimal(8, 2)), CAST(3144.00 AS Decimal(8, 2)), CAST(3150.00 AS Decimal(8, 2)), CAST(3128.00 AS Decimal(8, 2)), 243070, 38159998250, CAST(3139.00 AS Decimal(8, 2)), CAST(3140.22 AS Decimal(8, 2)), 25688, N'DOLH17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (662, CAST(N'2017-02-03' AS Date), CAST(3148.00 AS Decimal(8, 2)), CAST(3136.50 AS Decimal(8, 2)), CAST(3157.50 AS Decimal(8, 2)), CAST(3123.50 AS Decimal(8, 2)), 231205, 36291471500, CAST(3139.00 AS Decimal(8, 2)), CAST(3131.89 AS Decimal(8, 2)), 23556, N'DOLH17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (661, CAST(N'2017-02-06' AS Date), CAST(3136.50 AS Decimal(8, 2)), CAST(3134.00 AS Decimal(8, 2)), CAST(3145.00 AS Decimal(8, 2)), CAST(3125.00 AS Decimal(8, 2)), 168985, 26506496250, CAST(3137.00 AS Decimal(8, 2)), CAST(3139.90 AS Decimal(8, 2)), 16978, N'DOLH17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (660, CAST(N'2017-02-07' AS Date), CAST(3148.50 AS Decimal(8, 2)), CAST(3137.00 AS Decimal(8, 2)), CAST(3153.50 AS Decimal(8, 2)), CAST(3134.00 AS Decimal(8, 2)), 193090, 30357296625, CAST(3144.00 AS Decimal(8, 2)), CAST(3139.58 AS Decimal(8, 2)), 20827, N'DOLH17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (659, CAST(N'2017-02-08' AS Date), CAST(3136.50 AS Decimal(8, 2)), CAST(3133.00 AS Decimal(8, 2)), CAST(3145.00 AS Decimal(8, 2)), CAST(3128.00 AS Decimal(8, 2)), 209875, 32914231625, CAST(3136.00 AS Decimal(8, 2)), CAST(3129.68 AS Decimal(8, 2)), 21580, N'DOLH17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (658, CAST(N'2017-02-09' AS Date), CAST(3136.50 AS Decimal(8, 2)), CAST(3145.00 AS Decimal(8, 2)), CAST(3147.50 AS Decimal(8, 2)), CAST(3127.50 AS Decimal(8, 2)), 220580, 34597748375, CAST(3136.00 AS Decimal(8, 2)), CAST(3140.33 AS Decimal(8, 2)), 22738, N'DOLH17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (657, CAST(N'2017-02-10' AS Date), CAST(3139.00 AS Decimal(8, 2)), CAST(3124.00 AS Decimal(8, 2)), CAST(3141.00 AS Decimal(8, 2)), CAST(3119.00 AS Decimal(8, 2)), 226320, 35386736750, CAST(3127.00 AS Decimal(8, 2)), CAST(3123.67 AS Decimal(8, 2)), 24560, N'DOLH17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (656, CAST(N'2017-02-13' AS Date), CAST(3123.00 AS Decimal(8, 2)), CAST(3123.50 AS Decimal(8, 2)), CAST(3135.00 AS Decimal(8, 2)), CAST(3119.00 AS Decimal(8, 2)), 181845, 28425049125, CAST(3126.00 AS Decimal(8, 2)), CAST(3124.17 AS Decimal(8, 2)), 19734, N'DOLH17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (655, CAST(N'2017-02-14' AS Date), CAST(3130.00 AS Decimal(8, 2)), CAST(3095.50 AS Decimal(8, 2)), CAST(3137.50 AS Decimal(8, 2)), CAST(3092.50 AS Decimal(8, 2)), 372870, 58055013750, CAST(3113.00 AS Decimal(8, 2)), CAST(3108.90 AS Decimal(8, 2)), 38061, N'DOLH17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (654, CAST(N'2017-02-15' AS Date), CAST(3096.50 AS Decimal(8, 2)), CAST(3065.00 AS Decimal(8, 2)), CAST(3103.50 AS Decimal(8, 2)), CAST(3062.50 AS Decimal(8, 2)), 337310, 51969138125, CAST(3081.00 AS Decimal(8, 2)), CAST(3069.28 AS Decimal(8, 2)), 35833, N'DOLH17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (653, CAST(N'2017-02-16' AS Date), CAST(3064.00 AS Decimal(8, 2)), CAST(3095.00 AS Decimal(8, 2)), CAST(3096.50 AS Decimal(8, 2)), CAST(3047.00 AS Decimal(8, 2)), 325165, 49892241875, CAST(3068.00 AS Decimal(8, 2)), CAST(3084.52 AS Decimal(8, 2)), 34819, N'DOLH17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (652, CAST(N'2017-02-17' AS Date), CAST(3102.50 AS Decimal(8, 2)), CAST(3107.00 AS Decimal(8, 2)), CAST(3113.50 AS Decimal(8, 2)), CAST(3085.00 AS Decimal(8, 2)), 267070, 41415141500, CAST(3101.00 AS Decimal(8, 2)), CAST(3098.97 AS Decimal(8, 2)), 28461, N'DOLH17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (651, CAST(N'2017-02-20' AS Date), CAST(3106.00 AS Decimal(8, 2)), CAST(3093.00 AS Decimal(8, 2)), CAST(3111.00 AS Decimal(8, 2)), CAST(3088.00 AS Decimal(8, 2)), 111070, 17191525875, CAST(3095.00 AS Decimal(8, 2)), CAST(3093.35 AS Decimal(8, 2)), 10918, N'DOLH17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (650, CAST(N'2017-02-21' AS Date), CAST(3102.00 AS Decimal(8, 2)), CAST(3100.00 AS Decimal(8, 2)), CAST(3111.50 AS Decimal(8, 2)), CAST(3090.50 AS Decimal(8, 2)), 272320, 42210663000, CAST(3100.00 AS Decimal(8, 2)), CAST(3097.68 AS Decimal(8, 2)), 28126, N'DOLH17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (649, CAST(N'2017-02-22' AS Date), CAST(3100.00 AS Decimal(8, 2)), CAST(3068.50 AS Decimal(8, 2)), CAST(3100.50 AS Decimal(8, 2)), CAST(3064.50 AS Decimal(8, 2)), 290985, 44831389000, CAST(3081.00 AS Decimal(8, 2)), CAST(3080.94 AS Decimal(8, 2)), 28305, N'DOLH17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (648, CAST(N'2017-02-23' AS Date), CAST(3070.00 AS Decimal(8, 2)), CAST(3063.00 AS Decimal(8, 2)), CAST(3080.50 AS Decimal(8, 2)), CAST(3054.00 AS Decimal(8, 2)), 312100, 47837433625, CAST(3065.00 AS Decimal(8, 2)), CAST(3060.82 AS Decimal(8, 2)), 31439, N'DOLH17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (419, CAST(N'2018-01-31' AS Date), CAST(3176.00 AS Decimal(8, 2)), CAST(3195.50 AS Decimal(8, 2)), CAST(3205.00 AS Decimal(8, 2)), CAST(3155.50 AS Decimal(8, 2)), 557545, 88608013000, CAST(3178.00 AS Decimal(8, 2)), CAST(3196.97 AS Decimal(8, 2)), 53475, N'DOLH18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (418, CAST(N'2018-02-01' AS Date), CAST(3203.50 AS Decimal(8, 2)), CAST(3176.50 AS Decimal(8, 2)), CAST(3206.50 AS Decimal(8, 2)), CAST(3171.50 AS Decimal(8, 2)), 353490, 56247207000, CAST(3182.00 AS Decimal(8, 2)), CAST(3182.38 AS Decimal(8, 2)), 38349, N'DOLH18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (417, CAST(N'2018-02-02' AS Date), CAST(3199.00 AS Decimal(8, 2)), CAST(3227.50 AS Decimal(8, 2)), CAST(3233.00 AS Decimal(8, 2)), CAST(3192.50 AS Decimal(8, 2)), 392180, 63118361375, CAST(3218.00 AS Decimal(8, 2)), CAST(3227.36 AS Decimal(8, 2)), 42641, N'DOLH18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (416, CAST(N'2018-02-05' AS Date), CAST(3225.00 AS Decimal(8, 2)), CAST(3271.50 AS Decimal(8, 2)), CAST(3283.00 AS Decimal(8, 2)), CAST(3223.00 AS Decimal(8, 2)), 410850, 66713227000, CAST(3247.00 AS Decimal(8, 2)), CAST(3249.79 AS Decimal(8, 2)), 43920, N'DOLH18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (415, CAST(N'2018-02-06' AS Date), CAST(3267.00 AS Decimal(8, 2)), CAST(3243.50 AS Decimal(8, 2)), CAST(3287.00 AS Decimal(8, 2)), CAST(3241.00 AS Decimal(8, 2)), 593955, 96987722875, CAST(3265.00 AS Decimal(8, 2)), CAST(3251.48 AS Decimal(8, 2)), 65066, N'DOLH18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (414, CAST(N'2018-02-07' AS Date), CAST(3259.00 AS Decimal(8, 2)), CAST(3279.50 AS Decimal(8, 2)), CAST(3292.00 AS Decimal(8, 2)), CAST(3246.00 AS Decimal(8, 2)), 435695, 71138613000, CAST(3265.00 AS Decimal(8, 2)), CAST(3280.45 AS Decimal(8, 2)), 48443, N'DOLH18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (413, CAST(N'2018-02-08' AS Date), CAST(3285.50 AS Decimal(8, 2)), CAST(3293.50 AS Decimal(8, 2)), CAST(3310.50 AS Decimal(8, 2)), CAST(3264.00 AS Decimal(8, 2)), 536155, 88121845875, CAST(3287.00 AS Decimal(8, 2)), CAST(3306.86 AS Decimal(8, 2)), 61216, N'DOLH18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (412, CAST(N'2018-02-09' AS Date), CAST(3282.50 AS Decimal(8, 2)), CAST(3301.00 AS Decimal(8, 2)), CAST(3326.00 AS Decimal(8, 2)), CAST(3275.00 AS Decimal(8, 2)), 531665, 87719491375, CAST(3299.00 AS Decimal(8, 2)), CAST(3320.96 AS Decimal(8, 2)), 58201, N'DOLH18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (411, CAST(N'2018-02-14' AS Date), CAST(3297.50 AS Decimal(8, 2)), CAST(3227.50 AS Decimal(8, 2)), CAST(3304.00 AS Decimal(8, 2)), CAST(3222.50 AS Decimal(8, 2)), 304035, 49514478750, CAST(3257.00 AS Decimal(8, 2)), CAST(3250.62 AS Decimal(8, 2)), 32989, N'DOLH18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (410, CAST(N'2018-02-15' AS Date), CAST(3211.00 AS Decimal(8, 2)), CAST(3238.00 AS Decimal(8, 2)), CAST(3246.50 AS Decimal(8, 2)), CAST(3204.50 AS Decimal(8, 2)), 366945, 59277018375, CAST(3230.00 AS Decimal(8, 2)), CAST(3242.68 AS Decimal(8, 2)), 38801, N'DOLH18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (409, CAST(N'2018-02-16' AS Date), CAST(3245.00 AS Decimal(8, 2)), CAST(3235.00 AS Decimal(8, 2)), CAST(3252.00 AS Decimal(8, 2)), CAST(3207.00 AS Decimal(8, 2)), 347270, 56123972250, CAST(3232.00 AS Decimal(8, 2)), CAST(3214.56 AS Decimal(8, 2)), 39647, N'DOLH18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (408, CAST(N'2018-02-19' AS Date), CAST(3231.50 AS Decimal(8, 2)), CAST(3242.00 AS Decimal(8, 2)), CAST(3242.00 AS Decimal(8, 2)), CAST(3226.50 AS Decimal(8, 2)), 122010, 19744118000, CAST(3236.00 AS Decimal(8, 2)), CAST(3238.15 AS Decimal(8, 2)), 13388, N'DOLH18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (407, CAST(N'2018-02-20' AS Date), CAST(3251.00 AS Decimal(8, 2)), CAST(3259.00 AS Decimal(8, 2)), CAST(3265.00 AS Decimal(8, 2)), CAST(3243.50 AS Decimal(8, 2)), 313690, 51029083125, CAST(3253.00 AS Decimal(8, 2)), CAST(3253.71 AS Decimal(8, 2)), 33855, N'DOLH18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (406, CAST(N'2018-02-21' AS Date), CAST(3261.00 AS Decimal(8, 2)), CAST(3275.00 AS Decimal(8, 2)), CAST(3275.50 AS Decimal(8, 2)), CAST(3245.50 AS Decimal(8, 2)), 338085, 55080370375, CAST(3258.00 AS Decimal(8, 2)), CAST(3255.31 AS Decimal(8, 2)), 36474, N'DOLH18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (405, CAST(N'2018-02-22' AS Date), CAST(3268.00 AS Decimal(8, 2)), CAST(3251.00 AS Decimal(8, 2)), CAST(3276.00 AS Decimal(8, 2)), CAST(3244.50 AS Decimal(8, 2)), 391040, 63731539875, CAST(3259.00 AS Decimal(8, 2)), CAST(3248.80 AS Decimal(8, 2)), 38701, N'DOLH18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (404, CAST(N'2018-02-23' AS Date), CAST(3247.00 AS Decimal(8, 2)), CAST(3241.00 AS Decimal(8, 2)), CAST(3252.50 AS Decimal(8, 2)), CAST(3234.00 AS Decimal(8, 2)), 280560, 45494234250, CAST(3243.00 AS Decimal(8, 2)), CAST(3241.49 AS Decimal(8, 2)), 27048, N'DOLH18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (403, CAST(N'2018-02-26' AS Date), CAST(3237.00 AS Decimal(8, 2)), CAST(3225.00 AS Decimal(8, 2)), CAST(3243.00 AS Decimal(8, 2)), CAST(3223.50 AS Decimal(8, 2)), 251270, 40655653000, CAST(3236.00 AS Decimal(8, 2)), CAST(3240.67 AS Decimal(8, 2)), 25428, N'DOLH18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (402, CAST(N'2018-02-27' AS Date), CAST(3226.50 AS Decimal(8, 2)), CAST(3254.00 AS Decimal(8, 2)), CAST(3256.00 AS Decimal(8, 2)), CAST(3223.00 AS Decimal(8, 2)), 383705, 62170223000, CAST(3240.00 AS Decimal(8, 2)), CAST(3245.51 AS Decimal(8, 2)), 37795, N'DOLH18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (200, CAST(N'2019-01-31' AS Date), CAST(3677.00 AS Decimal(8, 2)), CAST(3650.50 AS Decimal(8, 2)), CAST(3688.00 AS Decimal(8, 2)), CAST(3643.00 AS Decimal(8, 2)), 566305, 103595985125, CAST(3658.00 AS Decimal(8, 2)), CAST(3652.18 AS Decimal(8, 2)), 50412, N'DOLH19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (199, CAST(N'2019-02-01' AS Date), CAST(3658.00 AS Decimal(8, 2)), CAST(3665.00 AS Decimal(8, 2)), CAST(3687.50 AS Decimal(8, 2)), CAST(3639.50 AS Decimal(8, 2)), 381110, 69878502625, CAST(3667.00 AS Decimal(8, 2)), CAST(3661.47 AS Decimal(8, 2)), 37353, N'DOLH19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (198, CAST(N'2019-02-04' AS Date), CAST(3672.00 AS Decimal(8, 2)), CAST(3674.00 AS Decimal(8, 2)), CAST(3693.50 AS Decimal(8, 2)), CAST(3665.50 AS Decimal(8, 2)), 258030, 47449747875, CAST(3677.00 AS Decimal(8, 2)), CAST(3671.74 AS Decimal(8, 2)), 28460, N'DOLH19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (197, CAST(N'2019-02-05' AS Date), CAST(3670.00 AS Decimal(8, 2)), CAST(3673.50 AS Decimal(8, 2)), CAST(3689.50 AS Decimal(8, 2)), CAST(3666.50 AS Decimal(8, 2)), 282385, 51934094250, CAST(3678.00 AS Decimal(8, 2)), CAST(3674.90 AS Decimal(8, 2)), 25770, N'DOLH19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (196, CAST(N'2019-02-06' AS Date), CAST(3686.50 AS Decimal(8, 2)), CAST(3703.00 AS Decimal(8, 2)), CAST(3720.50 AS Decimal(8, 2)), CAST(3686.50 AS Decimal(8, 2)), 331745, 61453969500, CAST(3704.00 AS Decimal(8, 2)), CAST(3702.86 AS Decimal(8, 2)), 34554, N'DOLH19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (195, CAST(N'2019-02-07' AS Date), CAST(3709.50 AS Decimal(8, 2)), CAST(3722.50 AS Decimal(8, 2)), CAST(3742.50 AS Decimal(8, 2)), CAST(3705.50 AS Decimal(8, 2)), 435590, 81083378000, CAST(3722.00 AS Decimal(8, 2)), CAST(3718.12 AS Decimal(8, 2)), 43975, N'DOLH19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (194, CAST(N'2019-02-08' AS Date), CAST(3719.00 AS Decimal(8, 2)), CAST(3735.00 AS Decimal(8, 2)), CAST(3753.50 AS Decimal(8, 2)), CAST(3708.00 AS Decimal(8, 2)), 383905, 71578981250, CAST(3728.00 AS Decimal(8, 2)), CAST(3737.59 AS Decimal(8, 2)), 35640, N'DOLH19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (193, CAST(N'2019-02-11' AS Date), CAST(3741.00 AS Decimal(8, 2)), CAST(3763.00 AS Decimal(8, 2)), CAST(3780.00 AS Decimal(8, 2)), CAST(3733.00 AS Decimal(8, 2)), 358250, 67282071875, CAST(3756.00 AS Decimal(8, 2)), CAST(3764.42 AS Decimal(8, 2)), 34370, N'DOLH19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (192, CAST(N'2019-02-12' AS Date), CAST(3750.50 AS Decimal(8, 2)), CAST(3714.00 AS Decimal(8, 2)), CAST(3752.00 AS Decimal(8, 2)), CAST(3707.00 AS Decimal(8, 2)), 392530, 73131614250, CAST(3726.00 AS Decimal(8, 2)), CAST(3716.12 AS Decimal(8, 2)), 37724, N'DOLH19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (191, CAST(N'2019-02-13' AS Date), CAST(3719.00 AS Decimal(8, 2)), CAST(3758.50 AS Decimal(8, 2)), CAST(3766.00 AS Decimal(8, 2)), CAST(3717.00 AS Decimal(8, 2)), 411185, 76960837750, CAST(3743.00 AS Decimal(8, 2)), CAST(3753.14 AS Decimal(8, 2)), 35190, N'DOLH19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (190, CAST(N'2019-02-14' AS Date), CAST(3754.00 AS Decimal(8, 2)), CAST(3727.00 AS Decimal(8, 2)), CAST(3799.00 AS Decimal(8, 2)), CAST(3718.00 AS Decimal(8, 2)), 553505, 104188264125, CAST(3764.00 AS Decimal(8, 2)), CAST(3740.62 AS Decimal(8, 2)), 50822, N'DOLH19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (189, CAST(N'2019-02-15' AS Date), CAST(3725.50 AS Decimal(8, 2)), CAST(3703.50 AS Decimal(8, 2)), CAST(3729.50 AS Decimal(8, 2)), CAST(3702.50 AS Decimal(8, 2)), 314640, 58467347125, CAST(3716.00 AS Decimal(8, 2)), CAST(3713.96 AS Decimal(8, 2)), 34771, N'DOLH19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (188, CAST(N'2019-02-18' AS Date), CAST(3723.00 AS Decimal(8, 2)), CAST(3736.00 AS Decimal(8, 2)), CAST(3745.00 AS Decimal(8, 2)), CAST(3714.00 AS Decimal(8, 2)), 173315, 32348623250, CAST(3732.00 AS Decimal(8, 2)), CAST(3733.81 AS Decimal(8, 2)), 17904, N'DOLH19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (187, CAST(N'2019-02-19' AS Date), CAST(3740.00 AS Decimal(8, 2)), CAST(3726.00 AS Decimal(8, 2)), CAST(3747.00 AS Decimal(8, 2)), CAST(3706.00 AS Decimal(8, 2)), 307855, 57248902000, CAST(3719.00 AS Decimal(8, 2)), CAST(3708.95 AS Decimal(8, 2)), 30296, N'DOLH19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (186, CAST(N'2019-02-20' AS Date), CAST(3722.00 AS Decimal(8, 2)), CAST(3727.00 AS Decimal(8, 2)), CAST(3739.00 AS Decimal(8, 2)), CAST(3692.00 AS Decimal(8, 2)), 387510, 72034160375, CAST(3717.00 AS Decimal(8, 2)), CAST(3715.98 AS Decimal(8, 2)), 41417, N'DOLH19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (185, CAST(N'2019-02-21' AS Date), CAST(3722.50 AS Decimal(8, 2)), CAST(3770.00 AS Decimal(8, 2)), CAST(3773.50 AS Decimal(8, 2)), CAST(3716.00 AS Decimal(8, 2)), 418215, 78567195125, CAST(3757.00 AS Decimal(8, 2)), CAST(3753.24 AS Decimal(8, 2)), 44378, N'DOLH19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (184, CAST(N'2019-02-22' AS Date), CAST(3759.50 AS Decimal(8, 2)), CAST(3749.00 AS Decimal(8, 2)), CAST(3766.50 AS Decimal(8, 2)), CAST(3727.50 AS Decimal(8, 2)), 312325, 58445877250, CAST(3742.00 AS Decimal(8, 2)), CAST(3735.32 AS Decimal(8, 2)), 33829, N'DOLH19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (183, CAST(N'2019-02-25' AS Date), CAST(3735.00 AS Decimal(8, 2)), CAST(3752.00 AS Decimal(8, 2)), CAST(3752.00 AS Decimal(8, 2)), CAST(3720.00 AS Decimal(8, 2)), 273760, 51098432625, CAST(3733.00 AS Decimal(8, 2)), CAST(3739.71 AS Decimal(8, 2)), 28253, N'DOLH19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (182, CAST(N'2019-02-26' AS Date), CAST(3754.00 AS Decimal(8, 2)), CAST(3744.00 AS Decimal(8, 2)), CAST(3766.50 AS Decimal(8, 2)), CAST(3739.00 AS Decimal(8, 2)), 381165, 71545700375, CAST(3754.00 AS Decimal(8, 2)), CAST(3750.86 AS Decimal(8, 2)), 41192, N'DOLH19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (181, CAST(N'2019-02-27' AS Date), CAST(3745.00 AS Decimal(8, 2)), CAST(3728.50 AS Decimal(8, 2)), CAST(3747.00 AS Decimal(8, 2)), CAST(3721.50 AS Decimal(8, 2)), 385760, 72005355125, CAST(3733.00 AS Decimal(8, 2)), CAST(3725.38 AS Decimal(8, 2)), 37544, N'DOLH19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (647, CAST(N'2017-02-24' AS Date), CAST(3105.00 AS Decimal(8, 2)), CAST(3135.00 AS Decimal(8, 2)), CAST(3145.00 AS Decimal(8, 2)), CAST(3097.50 AS Decimal(8, 2)), 452350, 70694306500, CAST(3125.00 AS Decimal(8, 2)), CAST(3136.53 AS Decimal(8, 2)), 43211, N'DOLJ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (646, CAST(N'2017-03-01' AS Date), CAST(3147.00 AS Decimal(8, 2)), CAST(3117.50 AS Decimal(8, 2)), CAST(3148.50 AS Decimal(8, 2)), CAST(3115.00 AS Decimal(8, 2)), 180200, 28193227875, CAST(3129.00 AS Decimal(8, 2)), CAST(3121.42 AS Decimal(8, 2)), 17318, N'DOLJ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (645, CAST(N'2017-03-02' AS Date), CAST(3124.50 AS Decimal(8, 2)), CAST(3182.50 AS Decimal(8, 2)), CAST(3183.50 AS Decimal(8, 2)), CAST(3121.50 AS Decimal(8, 2)), 341050, 53746318875, CAST(3151.00 AS Decimal(8, 2)), CAST(3167.13 AS Decimal(8, 2)), 37722, N'DOLJ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (644, CAST(N'2017-03-03' AS Date), CAST(3179.50 AS Decimal(8, 2)), CAST(3141.50 AS Decimal(8, 2)), CAST(3186.50 AS Decimal(8, 2)), CAST(3135.50 AS Decimal(8, 2)), 339150, 53551147500, CAST(3157.00 AS Decimal(8, 2)), CAST(3142.03 AS Decimal(8, 2)), 38769, N'DOLJ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (643, CAST(N'2017-03-06' AS Date), CAST(3146.50 AS Decimal(8, 2)), CAST(3161.00 AS Decimal(8, 2)), CAST(3163.00 AS Decimal(8, 2)), CAST(3123.50 AS Decimal(8, 2)), 216030, 33923986875, CAST(3140.00 AS Decimal(8, 2)), CAST(3144.79 AS Decimal(8, 2)), 24606, N'DOLJ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (642, CAST(N'2017-03-07' AS Date), CAST(3150.00 AS Decimal(8, 2)), CAST(3142.00 AS Decimal(8, 2)), CAST(3154.00 AS Decimal(8, 2)), CAST(3134.00 AS Decimal(8, 2)), 215395, 33835953375, CAST(3141.00 AS Decimal(8, 2)), CAST(3138.90 AS Decimal(8, 2)), 23836, N'DOLJ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (641, CAST(N'2017-03-08' AS Date), CAST(3153.50 AS Decimal(8, 2)), CAST(3183.50 AS Decimal(8, 2)), CAST(3202.50 AS Decimal(8, 2)), CAST(3145.50 AS Decimal(8, 2)), 368215, 58476627000, CAST(3176.00 AS Decimal(8, 2)), CAST(3180.29 AS Decimal(8, 2)), 42428, N'DOLJ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (640, CAST(N'2017-03-09' AS Date), CAST(3195.00 AS Decimal(8, 2)), CAST(3213.50 AS Decimal(8, 2)), CAST(3219.00 AS Decimal(8, 2)), CAST(3180.50 AS Decimal(8, 2)), 313945, 50212202750, CAST(3198.00 AS Decimal(8, 2)), CAST(3208.36 AS Decimal(8, 2)), 37843, N'DOLJ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (639, CAST(N'2017-03-10' AS Date), CAST(3200.00 AS Decimal(8, 2)), CAST(3159.50 AS Decimal(8, 2)), CAST(3206.00 AS Decimal(8, 2)), CAST(3156.00 AS Decimal(8, 2)), 350215, 55660548875, CAST(3178.00 AS Decimal(8, 2)), CAST(3164.17 AS Decimal(8, 2)), 40034, N'DOLJ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (638, CAST(N'2017-03-13' AS Date), CAST(3152.00 AS Decimal(8, 2)), CAST(3171.00 AS Decimal(8, 2)), CAST(3178.00 AS Decimal(8, 2)), CAST(3148.00 AS Decimal(8, 2)), 247430, 39212191875, CAST(3169.00 AS Decimal(8, 2)), CAST(3168.69 AS Decimal(8, 2)), 28270, N'DOLJ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (637, CAST(N'2017-03-14' AS Date), CAST(3179.00 AS Decimal(8, 2)), CAST(3185.00 AS Decimal(8, 2)), CAST(3199.00 AS Decimal(8, 2)), CAST(3174.50 AS Decimal(8, 2)), 282660, 45005547000, CAST(3184.00 AS Decimal(8, 2)), CAST(3197.46 AS Decimal(8, 2)), 32972, N'DOLJ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (636, CAST(N'2017-03-15' AS Date), CAST(3180.50 AS Decimal(8, 2)), CAST(3120.00 AS Decimal(8, 2)), CAST(3193.50 AS Decimal(8, 2)), CAST(3113.00 AS Decimal(8, 2)), 421550, 66573830500, CAST(3158.00 AS Decimal(8, 2)), CAST(3125.84 AS Decimal(8, 2)), 46650, N'DOLJ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (635, CAST(N'2017-03-16' AS Date), CAST(3133.00 AS Decimal(8, 2)), CAST(3134.50 AS Decimal(8, 2)), CAST(3137.00 AS Decimal(8, 2)), CAST(3106.00 AS Decimal(8, 2)), 346645, 54128893875, CAST(3123.00 AS Decimal(8, 2)), CAST(3126.29 AS Decimal(8, 2)), 36013, N'DOLJ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (634, CAST(N'2017-03-17' AS Date), CAST(3123.00 AS Decimal(8, 2)), CAST(3104.00 AS Decimal(8, 2)), CAST(3139.50 AS Decimal(8, 2)), CAST(3099.50 AS Decimal(8, 2)), 277670, 43276827875, CAST(3117.00 AS Decimal(8, 2)), CAST(3113.98 AS Decimal(8, 2)), 32881, N'DOLJ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (633, CAST(N'2017-03-20' AS Date), CAST(3110.00 AS Decimal(8, 2)), CAST(3084.00 AS Decimal(8, 2)), CAST(3127.00 AS Decimal(8, 2)), CAST(3078.50 AS Decimal(8, 2)), 278660, 43143022250, CAST(3096.00 AS Decimal(8, 2)), CAST(3085.91 AS Decimal(8, 2)), 31220, N'DOLJ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (632, CAST(N'2017-03-21' AS Date), CAST(3082.00 AS Decimal(8, 2)), CAST(3098.50 AS Decimal(8, 2)), CAST(3104.50 AS Decimal(8, 2)), CAST(3070.50 AS Decimal(8, 2)), 350695, 54158020250, CAST(3088.00 AS Decimal(8, 2)), CAST(3096.00 AS Decimal(8, 2)), 40226, N'DOLJ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (631, CAST(N'2017-03-22' AS Date), CAST(3112.00 AS Decimal(8, 2)), CAST(3095.50 AS Decimal(8, 2)), CAST(3119.00 AS Decimal(8, 2)), CAST(3090.50 AS Decimal(8, 2)), 311270, 48296345875, CAST(3103.00 AS Decimal(8, 2)), CAST(3100.18 AS Decimal(8, 2)), 35086, N'DOLJ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (630, CAST(N'2017-03-23' AS Date), CAST(3105.50 AS Decimal(8, 2)), CAST(3148.00 AS Decimal(8, 2)), CAST(3152.50 AS Decimal(8, 2)), CAST(3104.50 AS Decimal(8, 2)), 344810, 54036491750, CAST(3134.00 AS Decimal(8, 2)), CAST(3135.24 AS Decimal(8, 2)), 39585, N'DOLJ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (629, CAST(N'2017-03-24' AS Date), CAST(3144.00 AS Decimal(8, 2)), CAST(3114.00 AS Decimal(8, 2)), CAST(3157.00 AS Decimal(8, 2)), CAST(3110.50 AS Decimal(8, 2)), 321860, 50383067375, CAST(3130.00 AS Decimal(8, 2)), CAST(3116.16 AS Decimal(8, 2)), 37585, N'DOLJ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (628, CAST(N'2017-03-27' AS Date), CAST(3123.00 AS Decimal(8, 2)), CAST(3132.00 AS Decimal(8, 2)), CAST(3144.50 AS Decimal(8, 2)), CAST(3117.00 AS Decimal(8, 2)), 299870, 46991998375, CAST(3134.00 AS Decimal(8, 2)), CAST(3140.61 AS Decimal(8, 2)), 34355, N'DOLJ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (627, CAST(N'2017-03-28' AS Date), CAST(3135.00 AS Decimal(8, 2)), CAST(3143.50 AS Decimal(8, 2)), CAST(3148.50 AS Decimal(8, 2)), CAST(3126.00 AS Decimal(8, 2)), 295645, 46376197250, CAST(3137.00 AS Decimal(8, 2)), CAST(3140.56 AS Decimal(8, 2)), 31922, N'DOLJ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (626, CAST(N'2017-03-29' AS Date), CAST(3135.00 AS Decimal(8, 2)), CAST(3123.00 AS Decimal(8, 2)), CAST(3140.50 AS Decimal(8, 2)), CAST(3115.00 AS Decimal(8, 2)), 275530, 43044976375, CAST(3124.00 AS Decimal(8, 2)), CAST(3123.65 AS Decimal(8, 2)), 30998, N'DOLJ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (625, CAST(N'2017-03-30' AS Date), CAST(3123.00 AS Decimal(8, 2)), CAST(3151.00 AS Decimal(8, 2)), CAST(3154.00 AS Decimal(8, 2)), CAST(3120.50 AS Decimal(8, 2)), 361890, 56673160375, CAST(3132.00 AS Decimal(8, 2)), CAST(3137.12 AS Decimal(8, 2)), 31446, N'DOLJ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (401, CAST(N'2018-02-28' AS Date), CAST(3257.50 AS Decimal(8, 2)), CAST(3258.50 AS Decimal(8, 2)), CAST(3263.00 AS Decimal(8, 2)), CAST(3246.50 AS Decimal(8, 2)), 409190, 66594326875, CAST(3254.00 AS Decimal(8, 2)), CAST(3250.85 AS Decimal(8, 2)), 36001, N'DOLJ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (400, CAST(N'2018-03-01' AS Date), CAST(3265.00 AS Decimal(8, 2)), CAST(3261.50 AS Decimal(8, 2)), CAST(3282.50 AS Decimal(8, 2)), CAST(3249.50 AS Decimal(8, 2)), 475830, 77749872500, CAST(3267.00 AS Decimal(8, 2)), CAST(3274.41 AS Decimal(8, 2)), 56426, N'DOLJ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (399, CAST(N'2018-03-02' AS Date), CAST(3269.50 AS Decimal(8, 2)), CAST(3261.50 AS Decimal(8, 2)), CAST(3277.00 AS Decimal(8, 2)), CAST(3258.00 AS Decimal(8, 2)), 312740, 51093237125, CAST(3267.00 AS Decimal(8, 2)), CAST(3265.89 AS Decimal(8, 2)), 32406, N'DOLJ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (398, CAST(N'2018-03-05' AS Date), CAST(3267.00 AS Decimal(8, 2)), CAST(3251.50 AS Decimal(8, 2)), CAST(3272.00 AS Decimal(8, 2)), CAST(3250.00 AS Decimal(8, 2)), 206865, 33747760125, CAST(3262.00 AS Decimal(8, 2)), CAST(3256.60 AS Decimal(8, 2)), 20944, N'DOLJ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (397, CAST(N'2018-03-06' AS Date), CAST(3238.00 AS Decimal(8, 2)), CAST(3217.50 AS Decimal(8, 2)), CAST(3239.50 AS Decimal(8, 2)), CAST(3214.00 AS Decimal(8, 2)), 334875, 54058012375, CAST(3228.00 AS Decimal(8, 2)), CAST(3220.94 AS Decimal(8, 2)), 33678, N'DOLJ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (396, CAST(N'2018-03-07' AS Date), CAST(3233.00 AS Decimal(8, 2)), CAST(3252.00 AS Decimal(8, 2)), CAST(3255.50 AS Decimal(8, 2)), CAST(3228.00 AS Decimal(8, 2)), 336675, 54578779250, CAST(3242.00 AS Decimal(8, 2)), CAST(3249.28 AS Decimal(8, 2)), 33230, N'DOLJ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (395, CAST(N'2018-03-08' AS Date), CAST(3257.00 AS Decimal(8, 2)), CAST(3275.00 AS Decimal(8, 2)), CAST(3277.00 AS Decimal(8, 2)), CAST(3247.00 AS Decimal(8, 2)), 302665, 49374633500, CAST(3262.00 AS Decimal(8, 2)), CAST(3268.77 AS Decimal(8, 2)), 32770, N'DOLJ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (394, CAST(N'2018-03-09' AS Date), CAST(3268.50 AS Decimal(8, 2)), CAST(3264.00 AS Decimal(8, 2)), CAST(3278.50 AS Decimal(8, 2)), CAST(3246.00 AS Decimal(8, 2)), 286780, 46713395375, CAST(3257.00 AS Decimal(8, 2)), CAST(3258.06 AS Decimal(8, 2)), 31982, N'DOLJ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (393, CAST(N'2018-03-12' AS Date), CAST(3259.00 AS Decimal(8, 2)), CAST(3267.00 AS Decimal(8, 2)), CAST(3272.00 AS Decimal(8, 2)), CAST(3256.50 AS Decimal(8, 2)), 229585, 37482747875, CAST(3265.00 AS Decimal(8, 2)), CAST(3263.87 AS Decimal(8, 2)), 21304, N'DOLJ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (392, CAST(N'2018-03-13' AS Date), CAST(3268.50 AS Decimal(8, 2)), CAST(3264.00 AS Decimal(8, 2)), CAST(3270.00 AS Decimal(8, 2)), CAST(3242.50 AS Decimal(8, 2)), 402385, 65521057625, CAST(3256.00 AS Decimal(8, 2)), CAST(3262.84 AS Decimal(8, 2)), 39150, N'DOLJ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (391, CAST(N'2018-03-14' AS Date), CAST(3253.50 AS Decimal(8, 2)), CAST(3263.50 AS Decimal(8, 2)), CAST(3270.50 AS Decimal(8, 2)), CAST(3250.00 AS Decimal(8, 2)), 269155, 43904455625, CAST(3262.00 AS Decimal(8, 2)), CAST(3265.59 AS Decimal(8, 2)), 27473, N'DOLJ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (390, CAST(N'2018-03-15' AS Date), CAST(3272.50 AS Decimal(8, 2)), CAST(3289.00 AS Decimal(8, 2)), CAST(3300.50 AS Decimal(8, 2)), CAST(3272.00 AS Decimal(8, 2)), 386155, 63520035500, CAST(3289.00 AS Decimal(8, 2)), CAST(3295.33 AS Decimal(8, 2)), 38776, N'DOLJ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (389, CAST(N'2018-03-16' AS Date), CAST(3298.00 AS Decimal(8, 2)), CAST(3284.00 AS Decimal(8, 2)), CAST(3303.00 AS Decimal(8, 2)), CAST(3275.50 AS Decimal(8, 2)), 317745, 52275210750, CAST(3290.00 AS Decimal(8, 2)), CAST(3282.50 AS Decimal(8, 2)), 32738, N'DOLJ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (388, CAST(N'2018-03-19' AS Date), CAST(3299.00 AS Decimal(8, 2)), CAST(3288.00 AS Decimal(8, 2)), CAST(3299.00 AS Decimal(8, 2)), CAST(3285.50 AS Decimal(8, 2)), 296060, 48730286750, CAST(3291.00 AS Decimal(8, 2)), CAST(3287.78 AS Decimal(8, 2)), 31328, N'DOLJ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (387, CAST(N'2018-03-20' AS Date), CAST(3285.00 AS Decimal(8, 2)), CAST(3314.00 AS Decimal(8, 2)), CAST(3314.50 AS Decimal(8, 2)), CAST(3281.50 AS Decimal(8, 2)), 354730, 58545515625, CAST(3300.00 AS Decimal(8, 2)), CAST(3307.18 AS Decimal(8, 2)), 36169, N'DOLJ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (386, CAST(N'2018-03-21' AS Date), CAST(3302.00 AS Decimal(8, 2)), CAST(3275.50 AS Decimal(8, 2)), CAST(3309.50 AS Decimal(8, 2)), CAST(3266.00 AS Decimal(8, 2)), 404950, 66541768375, CAST(3286.00 AS Decimal(8, 2)), CAST(3279.15 AS Decimal(8, 2)), 40761, N'DOLJ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (385, CAST(N'2018-03-22' AS Date), CAST(3285.00 AS Decimal(8, 2)), CAST(3317.00 AS Decimal(8, 2)), CAST(3319.00 AS Decimal(8, 2)), CAST(3280.50 AS Decimal(8, 2)), 390370, 64457376625, CAST(3302.00 AS Decimal(8, 2)), CAST(3302.76 AS Decimal(8, 2)), 41752, N'DOLJ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (384, CAST(N'2018-03-23' AS Date), CAST(3318.00 AS Decimal(8, 2)), CAST(3313.00 AS Decimal(8, 2)), CAST(3320.00 AS Decimal(8, 2)), CAST(3295.00 AS Decimal(8, 2)), 428305, 70828008125, CAST(3307.00 AS Decimal(8, 2)), CAST(3310.49 AS Decimal(8, 2)), 42977, N'DOLJ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (383, CAST(N'2018-03-26' AS Date), CAST(3297.00 AS Decimal(8, 2)), CAST(3311.50 AS Decimal(8, 2)), CAST(3314.00 AS Decimal(8, 2)), CAST(3293.50 AS Decimal(8, 2)), 386175, 63774655750, CAST(3302.00 AS Decimal(8, 2)), CAST(3301.66 AS Decimal(8, 2)), 31843, N'DOLJ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (382, CAST(N'2018-03-27' AS Date), CAST(3309.50 AS Decimal(8, 2)), CAST(3324.50 AS Decimal(8, 2)), CAST(3334.50 AS Decimal(8, 2)), CAST(3309.00 AS Decimal(8, 2)), 423730, 70451418000, CAST(3325.00 AS Decimal(8, 2)), CAST(3327.70 AS Decimal(8, 2)), 42423, N'DOLJ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (381, CAST(N'2018-03-28' AS Date), CAST(3324.50 AS Decimal(8, 2)), CAST(3321.00 AS Decimal(8, 2)), CAST(3344.50 AS Decimal(8, 2)), CAST(3319.50 AS Decimal(8, 2)), 510775, 85190734750, CAST(3335.00 AS Decimal(8, 2)), CAST(3336.85 AS Decimal(8, 2)), 44135, N'DOLJ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (180, CAST(N'2019-02-28' AS Date), CAST(3742.00 AS Decimal(8, 2)), CAST(3758.00 AS Decimal(8, 2)), CAST(3765.00 AS Decimal(8, 2)), CAST(3723.50 AS Decimal(8, 2)), 532410, 99766372375, CAST(3747.00 AS Decimal(8, 2)), CAST(3748.74 AS Decimal(8, 2)), 51573, N'DOLJ19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (179, CAST(N'2019-03-01' AS Date), CAST(3756.00 AS Decimal(8, 2)), CAST(3780.50 AS Decimal(8, 2)), CAST(3802.00 AS Decimal(8, 2)), CAST(3752.00 AS Decimal(8, 2)), 391845, 74186425375, CAST(3786.00 AS Decimal(8, 2)), CAST(3782.44 AS Decimal(8, 2)), 42049, N'DOLJ19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (178, CAST(N'2019-03-06' AS Date), CAST(3803.00 AS Decimal(8, 2)), CAST(3846.00 AS Decimal(8, 2)), CAST(3851.00 AS Decimal(8, 2)), CAST(3787.00 AS Decimal(8, 2)), 281565, 53860920000, CAST(3825.00 AS Decimal(8, 2)), CAST(3837.17 AS Decimal(8, 2)), 29817, N'DOLJ19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (177, CAST(N'2019-03-07' AS Date), CAST(3845.00 AS Decimal(8, 2)), CAST(3877.00 AS Decimal(8, 2)), CAST(3909.00 AS Decimal(8, 2)), CAST(3822.50 AS Decimal(8, 2)), 550915, 106578972375, CAST(3869.00 AS Decimal(8, 2)), CAST(3890.30 AS Decimal(8, 2)), 58093, N'DOLJ19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (176, CAST(N'2019-03-08' AS Date), CAST(3873.00 AS Decimal(8, 2)), CAST(3872.50 AS Decimal(8, 2)), CAST(3909.00 AS Decimal(8, 2)), CAST(3855.50 AS Decimal(8, 2)), 386340, 74859898375, CAST(3875.00 AS Decimal(8, 2)), CAST(3872.22 AS Decimal(8, 2)), 42779, N'DOLJ19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (175, CAST(N'2019-03-11' AS Date), CAST(3859.00 AS Decimal(8, 2)), CAST(3843.50 AS Decimal(8, 2)), CAST(3865.00 AS Decimal(8, 2)), CAST(3839.00 AS Decimal(8, 2)), 305170, 58736594625, CAST(3849.00 AS Decimal(8, 2)), CAST(3845.58 AS Decimal(8, 2)), 31688, N'DOLJ19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (174, CAST(N'2019-03-12' AS Date), CAST(3846.50 AS Decimal(8, 2)), CAST(3816.50 AS Decimal(8, 2)), CAST(3849.00 AS Decimal(8, 2)), CAST(3807.00 AS Decimal(8, 2)), 318410, 60801014375, CAST(3819.00 AS Decimal(8, 2)), CAST(3815.70 AS Decimal(8, 2)), 35440, N'DOLJ19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (173, CAST(N'2019-03-13' AS Date), CAST(3804.00 AS Decimal(8, 2)), CAST(3818.50 AS Decimal(8, 2)), CAST(3839.00 AS Decimal(8, 2)), CAST(3803.50 AS Decimal(8, 2)), 390070, 74593539125, CAST(3824.00 AS Decimal(8, 2)), CAST(3816.33 AS Decimal(8, 2)), 40623, N'DOLJ19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (172, CAST(N'2019-03-14' AS Date), CAST(3826.00 AS Decimal(8, 2)), CAST(3846.00 AS Decimal(8, 2)), CAST(3858.50 AS Decimal(8, 2)), CAST(3821.00 AS Decimal(8, 2)), 341015, 65497578000, CAST(3841.00 AS Decimal(8, 2)), CAST(3849.13 AS Decimal(8, 2)), 35126, N'DOLJ19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (171, CAST(N'2019-03-15' AS Date), CAST(3840.00 AS Decimal(8, 2)), CAST(3815.50 AS Decimal(8, 2)), CAST(3874.50 AS Decimal(8, 2)), CAST(3810.50 AS Decimal(8, 2)), 388895, 74563384250, CAST(3834.00 AS Decimal(8, 2)), CAST(3820.24 AS Decimal(8, 2)), 40629, N'DOLJ19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (170, CAST(N'2019-03-18' AS Date), CAST(3808.00 AS Decimal(8, 2)), CAST(3795.00 AS Decimal(8, 2)), CAST(3830.00 AS Decimal(8, 2)), CAST(3786.50 AS Decimal(8, 2)), 276005, 52545765875, CAST(3807.00 AS Decimal(8, 2)), CAST(3794.23 AS Decimal(8, 2)), 30940, N'DOLJ19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (169, CAST(N'2019-03-19' AS Date), CAST(3786.50 AS Decimal(8, 2)), CAST(3790.50 AS Decimal(8, 2)), CAST(3801.50 AS Decimal(8, 2)), CAST(3767.00 AS Decimal(8, 2)), 341815, 64620639625, CAST(3781.00 AS Decimal(8, 2)), CAST(3781.55 AS Decimal(8, 2)), 35470, N'DOLJ19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (168, CAST(N'2019-03-20' AS Date), CAST(3785.00 AS Decimal(8, 2)), CAST(3776.50 AS Decimal(8, 2)), CAST(3800.50 AS Decimal(8, 2)), CAST(3740.00 AS Decimal(8, 2)), 454965, 85857386000, CAST(3774.00 AS Decimal(8, 2)), CAST(3744.76 AS Decimal(8, 2)), 47144, N'DOLJ19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (167, CAST(N'2019-03-21' AS Date), CAST(3784.00 AS Decimal(8, 2)), CAST(3793.50 AS Decimal(8, 2)), CAST(3839.00 AS Decimal(8, 2)), CAST(3765.50 AS Decimal(8, 2)), 531780, 101118968000, CAST(3803.00 AS Decimal(8, 2)), CAST(3798.75 AS Decimal(8, 2)), 60595, N'DOLJ19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (166, CAST(N'2019-03-22' AS Date), CAST(3870.00 AS Decimal(8, 2)), CAST(3908.00 AS Decimal(8, 2)), CAST(3917.50 AS Decimal(8, 2)), CAST(3855.00 AS Decimal(8, 2)), 585275, 113684093125, CAST(3884.00 AS Decimal(8, 2)), CAST(3888.96 AS Decimal(8, 2)), 70064, N'DOLJ19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (165, CAST(N'2019-03-25' AS Date), CAST(3937.00 AS Decimal(8, 2)), CAST(3852.00 AS Decimal(8, 2)), CAST(3938.00 AS Decimal(8, 2)), CAST(3845.00 AS Decimal(8, 2)), 489380, 94978588000, CAST(3881.00 AS Decimal(8, 2)), CAST(3864.89 AS Decimal(8, 2)), 53052, N'DOLJ19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (164, CAST(N'2019-03-26' AS Date), CAST(3850.00 AS Decimal(8, 2)), CAST(3877.50 AS Decimal(8, 2)), CAST(3880.00 AS Decimal(8, 2)), CAST(3835.00 AS Decimal(8, 2)), 390550, 75459726875, CAST(3864.00 AS Decimal(8, 2)), CAST(3865.36 AS Decimal(8, 2)), 44155, N'DOLJ19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (163, CAST(N'2019-03-27' AS Date), CAST(3914.00 AS Decimal(8, 2)), CAST(3993.50 AS Decimal(8, 2)), CAST(4001.50 AS Decimal(8, 2)), CAST(3905.00 AS Decimal(8, 2)), 648010, 127663035875, CAST(3940.00 AS Decimal(8, 2)), CAST(3950.55 AS Decimal(8, 2)), 69327, N'DOLJ19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (162, CAST(N'2019-03-28' AS Date), CAST(3992.50 AS Decimal(8, 2)), CAST(3901.50 AS Decimal(8, 2)), CAST(4017.50 AS Decimal(8, 2)), CAST(3898.50 AS Decimal(8, 2)), 582260, 115040379250, CAST(3951.00 AS Decimal(8, 2)), CAST(3908.61 AS Decimal(8, 2)), 61086, N'DOLJ19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (624, CAST(N'2017-03-31' AS Date), CAST(3175.00 AS Decimal(8, 2)), CAST(3141.50 AS Decimal(8, 2)), CAST(3197.50 AS Decimal(8, 2)), CAST(3141.50 AS Decimal(8, 2)), 465470, 73864152625, CAST(3173.00 AS Decimal(8, 2)), CAST(3149.56 AS Decimal(8, 2)), 47202, N'DOLK17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (623, CAST(N'2017-04-03' AS Date), CAST(3151.50 AS Decimal(8, 2)), CAST(3134.00 AS Decimal(8, 2)), CAST(3153.50 AS Decimal(8, 2)), CAST(3129.00 AS Decimal(8, 2)), 273265, 42841120125, CAST(3135.00 AS Decimal(8, 2)), CAST(3132.21 AS Decimal(8, 2)), 27603, N'DOLK17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (622, CAST(N'2017-04-04' AS Date), CAST(3153.50 AS Decimal(8, 2)), CAST(3110.00 AS Decimal(8, 2)), CAST(3155.00 AS Decimal(8, 2)), CAST(3110.00 AS Decimal(8, 2)), 292555, 45845942125, CAST(3134.00 AS Decimal(8, 2)), CAST(3117.01 AS Decimal(8, 2)), 31366, N'DOLK17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (621, CAST(N'2017-04-05' AS Date), CAST(3105.00 AS Decimal(8, 2)), CAST(3137.50 AS Decimal(8, 2)), CAST(3141.00 AS Decimal(8, 2)), CAST(3098.00 AS Decimal(8, 2)), 338535, 52674311375, CAST(3111.00 AS Decimal(8, 2)), CAST(3107.75 AS Decimal(8, 2)), 37529, N'DOLK17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (620, CAST(N'2017-04-06' AS Date), CAST(3140.00 AS Decimal(8, 2)), CAST(3159.00 AS Decimal(8, 2)), CAST(3167.00 AS Decimal(8, 2)), CAST(3124.00 AS Decimal(8, 2)), 355075, 55767271875, CAST(3141.00 AS Decimal(8, 2)), CAST(3154.87 AS Decimal(8, 2)), 38979, N'DOLK17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (619, CAST(N'2017-04-07' AS Date), CAST(3158.00 AS Decimal(8, 2)), CAST(3162.50 AS Decimal(8, 2)), CAST(3174.00 AS Decimal(8, 2)), CAST(3133.50 AS Decimal(8, 2)), 340710, 53654961375, CAST(3149.00 AS Decimal(8, 2)), CAST(3166.06 AS Decimal(8, 2)), 39106, N'DOLK17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (618, CAST(N'2017-04-10' AS Date), CAST(3163.00 AS Decimal(8, 2)), CAST(3145.00 AS Decimal(8, 2)), CAST(3164.00 AS Decimal(8, 2)), CAST(3143.50 AS Decimal(8, 2)), 256110, 40388422375, CAST(3153.00 AS Decimal(8, 2)), CAST(3149.83 AS Decimal(8, 2)), 26446, N'DOLK17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (617, CAST(N'2017-04-11' AS Date), CAST(3145.00 AS Decimal(8, 2)), CAST(3150.50 AS Decimal(8, 2)), CAST(3167.50 AS Decimal(8, 2)), CAST(3137.50 AS Decimal(8, 2)), 365600, 57646155125, CAST(3153.00 AS Decimal(8, 2)), CAST(3145.66 AS Decimal(8, 2)), 39127, N'DOLK17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (616, CAST(N'2017-04-12' AS Date), CAST(3158.00 AS Decimal(8, 2)), CAST(3137.00 AS Decimal(8, 2)), CAST(3169.00 AS Decimal(8, 2)), CAST(3132.00 AS Decimal(8, 2)), 361590, 57083048125, CAST(3157.00 AS Decimal(8, 2)), CAST(3166.72 AS Decimal(8, 2)), 35926, N'DOLK17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (615, CAST(N'2017-04-13' AS Date), CAST(3147.50 AS Decimal(8, 2)), CAST(3154.50 AS Decimal(8, 2)), CAST(3159.50 AS Decimal(8, 2)), CAST(3126.50 AS Decimal(8, 2)), 310890, 48850672375, CAST(3142.00 AS Decimal(8, 2)), CAST(3152.91 AS Decimal(8, 2)), 34057, N'DOLK17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (614, CAST(N'2017-04-17' AS Date), CAST(3110.50 AS Decimal(8, 2)), CAST(3106.50 AS Decimal(8, 2)), CAST(3123.50 AS Decimal(8, 2)), CAST(3102.50 AS Decimal(8, 2)), 245495, 38212036625, CAST(3113.00 AS Decimal(8, 2)), CAST(3110.26 AS Decimal(8, 2)), 27861, N'DOLK17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (613, CAST(N'2017-04-18' AS Date), CAST(3117.00 AS Decimal(8, 2)), CAST(3115.00 AS Decimal(8, 2)), CAST(3131.00 AS Decimal(8, 2)), CAST(3095.50 AS Decimal(8, 2)), 292780, 45526031750, CAST(3109.00 AS Decimal(8, 2)), CAST(3118.35 AS Decimal(8, 2)), 32575, N'DOLK17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (612, CAST(N'2017-04-19' AS Date), CAST(3120.50 AS Decimal(8, 2)), CAST(3157.00 AS Decimal(8, 2)), CAST(3161.50 AS Decimal(8, 2)), CAST(3117.00 AS Decimal(8, 2)), 306760, 48168417125, CAST(3140.00 AS Decimal(8, 2)), CAST(3145.91 AS Decimal(8, 2)), 34083, N'DOLK17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (611, CAST(N'2017-04-20' AS Date), CAST(3146.50 AS Decimal(8, 2)), CAST(3154.50 AS Decimal(8, 2)), CAST(3176.50 AS Decimal(8, 2)), CAST(3139.00 AS Decimal(8, 2)), 296260, 46755321000, CAST(3156.00 AS Decimal(8, 2)), CAST(3161.30 AS Decimal(8, 2)), 33690, N'DOLK17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (610, CAST(N'2017-04-24' AS Date), CAST(3127.50 AS Decimal(8, 2)), CAST(3133.00 AS Decimal(8, 2)), CAST(3139.50 AS Decimal(8, 2)), CAST(3123.00 AS Decimal(8, 2)), 261515, 40953060000, CAST(3131.00 AS Decimal(8, 2)), CAST(3135.04 AS Decimal(8, 2)), 25263, N'DOLK17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (609, CAST(N'2017-04-25' AS Date), CAST(3145.00 AS Decimal(8, 2)), CAST(3150.00 AS Decimal(8, 2)), CAST(3173.00 AS Decimal(8, 2)), CAST(3145.00 AS Decimal(8, 2)), 328425, 51890396000, CAST(3159.00 AS Decimal(8, 2)), CAST(3156.96 AS Decimal(8, 2)), 36062, N'DOLK17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (608, CAST(N'2017-04-26' AS Date), CAST(3163.00 AS Decimal(8, 2)), CAST(3175.00 AS Decimal(8, 2)), CAST(3209.50 AS Decimal(8, 2)), CAST(3160.50 AS Decimal(8, 2)), 443875, 70716472125, CAST(3186.00 AS Decimal(8, 2)), CAST(3184.90 AS Decimal(8, 2)), 48117, N'DOLK17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (607, CAST(N'2017-04-27' AS Date), CAST(3160.00 AS Decimal(8, 2)), CAST(3183.50 AS Decimal(8, 2)), CAST(3190.00 AS Decimal(8, 2)), CAST(3157.00 AS Decimal(8, 2)), 317255, 50358996000, CAST(3174.00 AS Decimal(8, 2)), CAST(3177.85 AS Decimal(8, 2)), 31643, N'DOLK17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (380, CAST(N'2018-03-29' AS Date), CAST(3330.00 AS Decimal(8, 2)), CAST(3313.00 AS Decimal(8, 2)), CAST(3337.00 AS Decimal(8, 2)), CAST(3300.50 AS Decimal(8, 2)), 463140, 76935175625, CAST(3322.00 AS Decimal(8, 2)), CAST(3302.47 AS Decimal(8, 2)), 43013, N'DOLK18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (161, CAST(N'2019-03-29' AS Date), CAST(3890.00 AS Decimal(8, 2)), CAST(3928.00 AS Decimal(8, 2)), CAST(3941.00 AS Decimal(8, 2)), CAST(3875.00 AS Decimal(8, 2)), 444335, 86727050375, CAST(3903.00 AS Decimal(8, 2)), CAST(3916.49 AS Decimal(8, 2)), 48157, N'DOLK19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (160, CAST(N'2019-04-01' AS Date), CAST(3900.00 AS Decimal(8, 2)), CAST(3859.50 AS Decimal(8, 2)), CAST(3900.50 AS Decimal(8, 2)), CAST(3856.50 AS Decimal(8, 2)), 318225, 61716980625, CAST(3878.00 AS Decimal(8, 2)), CAST(3879.49 AS Decimal(8, 2)), 31385, N'DOLK19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (159, CAST(N'2019-04-02' AS Date), CAST(3859.50 AS Decimal(8, 2)), CAST(3860.50 AS Decimal(8, 2)), CAST(3886.50 AS Decimal(8, 2)), CAST(3856.00 AS Decimal(8, 2)), 356390, 68970038750, CAST(3870.00 AS Decimal(8, 2)), CAST(3863.22 AS Decimal(8, 2)), 33926, N'DOLK19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (158, CAST(N'2019-04-03' AS Date), CAST(3841.00 AS Decimal(8, 2)), CAST(3876.00 AS Decimal(8, 2)), CAST(3889.00 AS Decimal(8, 2)), CAST(3840.00 AS Decimal(8, 2)), 335025, 64670913000, CAST(3860.00 AS Decimal(8, 2)), CAST(3877.43 AS Decimal(8, 2)), 35533, N'DOLK19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (157, CAST(N'2019-04-04' AS Date), CAST(3878.00 AS Decimal(8, 2)), CAST(3859.00 AS Decimal(8, 2)), CAST(3895.00 AS Decimal(8, 2)), CAST(3855.00 AS Decimal(8, 2)), 327280, 63380323125, CAST(3873.00 AS Decimal(8, 2)), CAST(3858.71 AS Decimal(8, 2)), 35567, N'DOLK19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (156, CAST(N'2019-04-05' AS Date), CAST(3862.50 AS Decimal(8, 2)), CAST(3879.00 AS Decimal(8, 2)), CAST(3884.00 AS Decimal(8, 2)), CAST(3849.50 AS Decimal(8, 2)), 268450, 51932494000, CAST(3869.00 AS Decimal(8, 2)), CAST(3871.46 AS Decimal(8, 2)), 31765, N'DOLK19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (155, CAST(N'2019-04-08' AS Date), CAST(3873.50 AS Decimal(8, 2)), CAST(3855.50 AS Decimal(8, 2)), CAST(3883.00 AS Decimal(8, 2)), CAST(3848.50 AS Decimal(8, 2)), 262805, 50800431875, CAST(3866.00 AS Decimal(8, 2)), CAST(3852.00 AS Decimal(8, 2)), 29277, N'DOLK19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (154, CAST(N'2019-04-09' AS Date), CAST(3857.00 AS Decimal(8, 2)), CAST(3855.50 AS Decimal(8, 2)), CAST(3870.00 AS Decimal(8, 2)), CAST(3852.00 AS Decimal(8, 2)), 289175, 55831018500, CAST(3861.00 AS Decimal(8, 2)), CAST(3859.99 AS Decimal(8, 2)), 29690, N'DOLK19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (153, CAST(N'2019-04-10' AS Date), CAST(3841.00 AS Decimal(8, 2)), CAST(3830.50 AS Decimal(8, 2)), CAST(3853.50 AS Decimal(8, 2)), CAST(3820.00 AS Decimal(8, 2)), 334090, 64063945125, CAST(3835.00 AS Decimal(8, 2)), CAST(3821.76 AS Decimal(8, 2)), 35406, N'DOLK19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (152, CAST(N'2019-04-11' AS Date), CAST(3842.00 AS Decimal(8, 2)), CAST(3862.00 AS Decimal(8, 2)), CAST(3868.00 AS Decimal(8, 2)), CAST(3836.00 AS Decimal(8, 2)), 304725, 58688153625, CAST(3851.00 AS Decimal(8, 2)), CAST(3863.63 AS Decimal(8, 2)), 33082, N'DOLK19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (151, CAST(N'2019-04-12' AS Date), CAST(3888.00 AS Decimal(8, 2)), CAST(3885.00 AS Decimal(8, 2)), CAST(3912.00 AS Decimal(8, 2)), CAST(3864.00 AS Decimal(8, 2)), 401780, 77980419250, CAST(3881.00 AS Decimal(8, 2)), CAST(3885.34 AS Decimal(8, 2)), 44114, N'DOLK19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (150, CAST(N'2019-04-15' AS Date), CAST(3886.00 AS Decimal(8, 2)), CAST(3875.50 AS Decimal(8, 2)), CAST(3894.50 AS Decimal(8, 2)), CAST(3863.00 AS Decimal(8, 2)), 321625, 62334390000, CAST(3876.00 AS Decimal(8, 2)), CAST(3872.61 AS Decimal(8, 2)), 34749, N'DOLK19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (149, CAST(N'2019-04-16' AS Date), CAST(3880.00 AS Decimal(8, 2)), CAST(3907.00 AS Decimal(8, 2)), CAST(3911.00 AS Decimal(8, 2)), CAST(3878.00 AS Decimal(8, 2)), 317465, 61839413500, CAST(3895.00 AS Decimal(8, 2)), CAST(3900.35 AS Decimal(8, 2)), 33594, N'DOLK19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (148, CAST(N'2019-04-17' AS Date), CAST(3893.00 AS Decimal(8, 2)), CAST(3938.50 AS Decimal(8, 2)), CAST(3951.00 AS Decimal(8, 2)), CAST(3889.50 AS Decimal(8, 2)), 390990, 76766589500, CAST(3926.00 AS Decimal(8, 2)), CAST(3935.64 AS Decimal(8, 2)), 44326, N'DOLK19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (147, CAST(N'2019-04-18' AS Date), CAST(3926.00 AS Decimal(8, 2)), CAST(3920.50 AS Decimal(8, 2)), CAST(3955.00 AS Decimal(8, 2)), CAST(3907.50 AS Decimal(8, 2)), 371700, 73143779375, CAST(3935.00 AS Decimal(8, 2)), CAST(3921.17 AS Decimal(8, 2)), 36812, N'DOLK19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (146, CAST(N'2019-04-22' AS Date), CAST(3928.00 AS Decimal(8, 2)), CAST(3938.00 AS Decimal(8, 2)), CAST(3941.50 AS Decimal(8, 2)), CAST(3916.00 AS Decimal(8, 2)), 199725, 39233416250, CAST(3928.00 AS Decimal(8, 2)), CAST(3935.62 AS Decimal(8, 2)), 21858, N'DOLK19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (145, CAST(N'2019-04-23' AS Date), CAST(3934.00 AS Decimal(8, 2)), CAST(3922.00 AS Decimal(8, 2)), CAST(3966.00 AS Decimal(8, 2)), CAST(3914.50 AS Decimal(8, 2)), 383450, 75584450625, CAST(3942.00 AS Decimal(8, 2)), CAST(3922.42 AS Decimal(8, 2)), 41951, N'DOLK19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (144, CAST(N'2019-04-24' AS Date), CAST(3921.00 AS Decimal(8, 2)), CAST(3993.50 AS Decimal(8, 2)), CAST(3995.50 AS Decimal(8, 2)), CAST(3920.50 AS Decimal(8, 2)), 493055, 97883484500, CAST(3970.00 AS Decimal(8, 2)), CAST(3990.93 AS Decimal(8, 2)), 52208, N'DOLK19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (143, CAST(N'2019-04-25' AS Date), CAST(4004.50 AS Decimal(8, 2)), CAST(3952.00 AS Decimal(8, 2)), CAST(4008.50 AS Decimal(8, 2)), CAST(3948.00 AS Decimal(8, 2)), 388465, 77175131125, CAST(3973.00 AS Decimal(8, 2)), CAST(3957.18 AS Decimal(8, 2)), 43264, N'DOLK19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (142, CAST(N'2019-04-26' AS Date), CAST(3958.50 AS Decimal(8, 2)), CAST(3930.00 AS Decimal(8, 2)), CAST(3976.50 AS Decimal(8, 2)), CAST(3921.00 AS Decimal(8, 2)), 430100, 84662113125, CAST(3936.00 AS Decimal(8, 2)), CAST(3932.97 AS Decimal(8, 2)), 41082, N'DOLK19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (141, CAST(N'2019-04-29' AS Date), CAST(3927.50 AS Decimal(8, 2)), CAST(3947.50 AS Decimal(8, 2)), CAST(3947.50 AS Decimal(8, 2)), CAST(3921.00 AS Decimal(8, 2)), 287595, 56595424625, CAST(3935.00 AS Decimal(8, 2)), CAST(3938.20 AS Decimal(8, 2)), 28628, N'DOLK19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (606, CAST(N'2017-04-28' AS Date), CAST(3207.50 AS Decimal(8, 2)), CAST(3200.50 AS Decimal(8, 2)), CAST(3240.00 AS Decimal(8, 2)), CAST(3195.50 AS Decimal(8, 2)), 389200, 62610450750, CAST(3217.00 AS Decimal(8, 2)), CAST(3201.96 AS Decimal(8, 2)), 41596, N'DOLM17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (605, CAST(N'2017-05-02' AS Date), CAST(3193.00 AS Decimal(8, 2)), CAST(3176.50 AS Decimal(8, 2)), CAST(3219.50 AS Decimal(8, 2)), CAST(3170.50 AS Decimal(8, 2)), 286185, 45663299625, CAST(3191.00 AS Decimal(8, 2)), CAST(3173.82 AS Decimal(8, 2)), 34305, N'DOLM17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (604, CAST(N'2017-05-03' AS Date), CAST(3185.00 AS Decimal(8, 2)), CAST(3187.00 AS Decimal(8, 2)), CAST(3190.50 AS Decimal(8, 2)), CAST(3164.00 AS Decimal(8, 2)), 305625, 48507833750, CAST(3174.00 AS Decimal(8, 2)), CAST(3172.27 AS Decimal(8, 2)), 35890, N'DOLM17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (603, CAST(N'2017-05-04' AS Date), CAST(3200.00 AS Decimal(8, 2)), CAST(3210.50 AS Decimal(8, 2)), CAST(3217.00 AS Decimal(8, 2)), CAST(3192.00 AS Decimal(8, 2)), 329350, 52772944875, CAST(3204.00 AS Decimal(8, 2)), CAST(3208.51 AS Decimal(8, 2)), 37503, N'DOLM17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (602, CAST(N'2017-05-05' AS Date), CAST(3211.00 AS Decimal(8, 2)), CAST(3196.00 AS Decimal(8, 2)), CAST(3217.50 AS Decimal(8, 2)), CAST(3189.50 AS Decimal(8, 2)), 316175, 50566210500, CAST(3198.00 AS Decimal(8, 2)), CAST(3196.85 AS Decimal(8, 2)), 35112, N'DOLM17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (601, CAST(N'2017-05-08' AS Date), CAST(3207.00 AS Decimal(8, 2)), CAST(3217.50 AS Decimal(8, 2)), CAST(3225.50 AS Decimal(8, 2)), CAST(3202.50 AS Decimal(8, 2)), 203315, 32672881500, CAST(3214.00 AS Decimal(8, 2)), CAST(3215.99 AS Decimal(8, 2)), 23566, N'DOLM17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (600, CAST(N'2017-05-09' AS Date), CAST(3218.00 AS Decimal(8, 2)), CAST(3210.00 AS Decimal(8, 2)), CAST(3218.50 AS Decimal(8, 2)), CAST(3197.50 AS Decimal(8, 2)), 261310, 41881448500, CAST(3205.00 AS Decimal(8, 2)), CAST(3204.15 AS Decimal(8, 2)), 28465, N'DOLM17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (599, CAST(N'2017-05-10' AS Date), CAST(3190.00 AS Decimal(8, 2)), CAST(3184.50 AS Decimal(8, 2)), CAST(3192.00 AS Decimal(8, 2)), CAST(3170.00 AS Decimal(8, 2)), 284380, 45204671000, CAST(3179.00 AS Decimal(8, 2)), CAST(3178.06 AS Decimal(8, 2)), 31162, N'DOLM17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (598, CAST(N'2017-05-11' AS Date), CAST(3176.00 AS Decimal(8, 2)), CAST(3156.50 AS Decimal(8, 2)), CAST(3184.50 AS Decimal(8, 2)), CAST(3155.50 AS Decimal(8, 2)), 310855, 49272194250, CAST(3170.00 AS Decimal(8, 2)), CAST(3167.13 AS Decimal(8, 2)), 33028, N'DOLM17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (597, CAST(N'2017-05-12' AS Date), CAST(3164.50 AS Decimal(8, 2)), CAST(3136.50 AS Decimal(8, 2)), CAST(3165.50 AS Decimal(8, 2)), CAST(3131.00 AS Decimal(8, 2)), 303160, 47660274875, CAST(3144.00 AS Decimal(8, 2)), CAST(3137.36 AS Decimal(8, 2)), 35361, N'DOLM17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (596, CAST(N'2017-05-15' AS Date), CAST(3120.00 AS Decimal(8, 2)), CAST(3125.00 AS Decimal(8, 2)), CAST(3125.50 AS Decimal(8, 2)), CAST(3109.00 AS Decimal(8, 2)), 298590, 46532113000, CAST(3116.00 AS Decimal(8, 2)), CAST(3115.17 AS Decimal(8, 2)), 31275, N'DOLM17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (595, CAST(N'2017-05-16' AS Date), CAST(3111.00 AS Decimal(8, 2)), CAST(3107.50 AS Decimal(8, 2)), CAST(3119.00 AS Decimal(8, 2)), CAST(3100.00 AS Decimal(8, 2)), 289300, 44935959750, CAST(3106.00 AS Decimal(8, 2)), CAST(3109.34 AS Decimal(8, 2)), 31456, N'DOLM17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (594, CAST(N'2017-05-17' AS Date), CAST(3112.00 AS Decimal(8, 2)), CAST(3146.50 AS Decimal(8, 2)), CAST(3151.50 AS Decimal(8, 2)), CAST(3107.00 AS Decimal(8, 2)), 432020, 67461792000, CAST(3123.00 AS Decimal(8, 2)), CAST(3135.43 AS Decimal(8, 2)), 47465, N'DOLM17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (593, CAST(N'2017-05-18' AS Date), CAST(3323.50 AS Decimal(8, 2)), CAST(3380.00 AS Decimal(8, 2)), CAST(3417.50 AS Decimal(8, 2)), CAST(3323.50 AS Decimal(8, 2)), 623485, 105171699125, CAST(3373.00 AS Decimal(8, 2)), CAST(3345.96 AS Decimal(8, 2)), 47814, N'DOLM17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (592, CAST(N'2017-05-19' AS Date), CAST(3301.00 AS Decimal(8, 2)), CAST(3263.50 AS Decimal(8, 2)), CAST(3355.00 AS Decimal(8, 2)), CAST(3252.50 AS Decimal(8, 2)), 610290, 100655545125, CAST(3298.00 AS Decimal(8, 2)), CAST(3269.74 AS Decimal(8, 2)), 63740, N'DOLM17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (591, CAST(N'2017-05-22' AS Date), CAST(3286.00 AS Decimal(8, 2)), CAST(3277.00 AS Decimal(8, 2)), CAST(3328.50 AS Decimal(8, 2)), CAST(3269.00 AS Decimal(8, 2)), 443405, 73072566125, CAST(3295.00 AS Decimal(8, 2)), CAST(3290.99 AS Decimal(8, 2)), 49968, N'DOLM17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (590, CAST(N'2017-05-23' AS Date), CAST(3285.00 AS Decimal(8, 2)), CAST(3277.50 AS Decimal(8, 2)), CAST(3295.00 AS Decimal(8, 2)), CAST(3264.00 AS Decimal(8, 2)), 367210, 60156802250, CAST(3276.00 AS Decimal(8, 2)), CAST(3273.46 AS Decimal(8, 2)), 39575, N'DOLM17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (589, CAST(N'2017-05-24' AS Date), CAST(3279.00 AS Decimal(8, 2)), CAST(3282.00 AS Decimal(8, 2)), CAST(3294.50 AS Decimal(8, 2)), CAST(3255.00 AS Decimal(8, 2)), 405385, 66318394000, CAST(3271.00 AS Decimal(8, 2)), CAST(3273.48 AS Decimal(8, 2)), 45833, N'DOLM17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (588, CAST(N'2017-05-25' AS Date), CAST(3283.00 AS Decimal(8, 2)), CAST(3279.50 AS Decimal(8, 2)), CAST(3302.00 AS Decimal(8, 2)), CAST(3267.50 AS Decimal(8, 2)), 305430, 50209311000, CAST(3287.00 AS Decimal(8, 2)), CAST(3292.90 AS Decimal(8, 2)), 31963, N'DOLM17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (587, CAST(N'2017-05-26' AS Date), CAST(3278.50 AS Decimal(8, 2)), CAST(3262.50 AS Decimal(8, 2)), CAST(3278.50 AS Decimal(8, 2)), CAST(3255.50 AS Decimal(8, 2)), 310095, 50638986875, CAST(3266.00 AS Decimal(8, 2)), CAST(3260.07 AS Decimal(8, 2)), 33261, N'DOLM17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (586, CAST(N'2017-05-29' AS Date), CAST(3264.50 AS Decimal(8, 2)), CAST(3259.00 AS Decimal(8, 2)), CAST(3279.50 AS Decimal(8, 2)), CAST(3259.00 AS Decimal(8, 2)), 126820, 20750293125, CAST(3272.00 AS Decimal(8, 2)), CAST(3272.23 AS Decimal(8, 2)), 11062, N'DOLM17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (585, CAST(N'2017-05-30' AS Date), CAST(3271.00 AS Decimal(8, 2)), CAST(3260.00 AS Decimal(8, 2)), CAST(3273.50 AS Decimal(8, 2)), CAST(3257.00 AS Decimal(8, 2)), 308755, 50417114750, CAST(3265.00 AS Decimal(8, 2)), CAST(3261.55 AS Decimal(8, 2)), 26104, N'DOLM17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (379, CAST(N'2018-05-10' AS Date), CAST(3587.00 AS Decimal(8, 2)), CAST(3558.00 AS Decimal(8, 2)), CAST(3591.00 AS Decimal(8, 2)), CAST(3550.00 AS Decimal(8, 2)), 381885, 68044513625, CAST(3563.00 AS Decimal(8, 2)), CAST(3552.89 AS Decimal(8, 2)), 39816, N'DOLM18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (378, CAST(N'2018-05-11' AS Date), CAST(3556.00 AS Decimal(8, 2)), CAST(3607.50 AS Decimal(8, 2)), CAST(3618.50 AS Decimal(8, 2)), CAST(3551.00 AS Decimal(8, 2)), 378635, 67891765375, CAST(3586.00 AS Decimal(8, 2)), CAST(3605.54 AS Decimal(8, 2)), 43347, N'DOLM18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (377, CAST(N'2018-05-14' AS Date), CAST(3585.00 AS Decimal(8, 2)), CAST(3629.00 AS Decimal(8, 2)), CAST(3646.00 AS Decimal(8, 2)), CAST(3579.00 AS Decimal(8, 2)), 364505, 65915067625, CAST(3616.00 AS Decimal(8, 2)), CAST(3628.04 AS Decimal(8, 2)), 41999, N'DOLM18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (376, CAST(N'2018-05-15' AS Date), CAST(3657.00 AS Decimal(8, 2)), CAST(3658.00 AS Decimal(8, 2)), CAST(3698.00 AS Decimal(8, 2)), CAST(3647.50 AS Decimal(8, 2)), 522300, 95846687500, CAST(3670.00 AS Decimal(8, 2)), CAST(3659.86 AS Decimal(8, 2)), 59527, N'DOLM18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (375, CAST(N'2018-05-16' AS Date), CAST(3669.00 AS Decimal(8, 2)), CAST(3680.50 AS Decimal(8, 2)), CAST(3700.00 AS Decimal(8, 2)), CAST(3666.50 AS Decimal(8, 2)), 383755, 70693181500, CAST(3684.00 AS Decimal(8, 2)), CAST(3690.11 AS Decimal(8, 2)), 45432, N'DOLM18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (374, CAST(N'2018-05-17' AS Date), CAST(3653.00 AS Decimal(8, 2)), CAST(3700.50 AS Decimal(8, 2)), CAST(3717.00 AS Decimal(8, 2)), CAST(3653.00 AS Decimal(8, 2)), 448880, 82848957500, CAST(3691.00 AS Decimal(8, 2)), CAST(3707.38 AS Decimal(8, 2)), 50764, N'DOLM18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (373, CAST(N'2018-05-18' AS Date), CAST(3715.00 AS Decimal(8, 2)), CAST(3741.00 AS Decimal(8, 2)), CAST(3780.50 AS Decimal(8, 2)), CAST(3715.00 AS Decimal(8, 2)), 469525, 87930413375, CAST(3745.00 AS Decimal(8, 2)), CAST(3742.03 AS Decimal(8, 2)), 56243, N'DOLM18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (372, CAST(N'2018-05-21' AS Date), CAST(3703.00 AS Decimal(8, 2)), CAST(3680.50 AS Decimal(8, 2)), CAST(3730.50 AS Decimal(8, 2)), CAST(3676.50 AS Decimal(8, 2)), 399690, 74076091000, CAST(3706.00 AS Decimal(8, 2)), CAST(3690.34 AS Decimal(8, 2)), 43406, N'DOLM18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (371, CAST(N'2018-05-22' AS Date), CAST(3665.50 AS Decimal(8, 2)), CAST(3650.00 AS Decimal(8, 2)), CAST(3667.00 AS Decimal(8, 2)), CAST(3632.00 AS Decimal(8, 2)), 406320, 74162331625, CAST(3650.00 AS Decimal(8, 2)), CAST(3634.32 AS Decimal(8, 2)), 44591, N'DOLM18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (370, CAST(N'2018-05-23' AS Date), CAST(3675.00 AS Decimal(8, 2)), CAST(3629.50 AS Decimal(8, 2)), CAST(3681.00 AS Decimal(8, 2)), CAST(3619.50 AS Decimal(8, 2)), 454890, 82916864125, CAST(3645.00 AS Decimal(8, 2)), CAST(3626.02 AS Decimal(8, 2)), 50711, N'DOLM18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (369, CAST(N'2018-05-24' AS Date), CAST(3656.00 AS Decimal(8, 2)), CAST(3646.50 AS Decimal(8, 2)), CAST(3657.00 AS Decimal(8, 2)), CAST(3631.50 AS Decimal(8, 2)), 355470, 64801112000, CAST(3645.00 AS Decimal(8, 2)), CAST(3650.53 AS Decimal(8, 2)), 38353, N'DOLM18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (368, CAST(N'2018-05-25' AS Date), CAST(3660.00 AS Decimal(8, 2)), CAST(3651.50 AS Decimal(8, 2)), CAST(3679.00 AS Decimal(8, 2)), CAST(3642.00 AS Decimal(8, 2)), 401925, 73596239125, CAST(3662.00 AS Decimal(8, 2)), CAST(3670.61 AS Decimal(8, 2)), 39724, N'DOLM18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (367, CAST(N'2018-05-28' AS Date), CAST(3664.00 AS Decimal(8, 2)), CAST(3736.50 AS Decimal(8, 2)), CAST(3746.00 AS Decimal(8, 2)), CAST(3662.00 AS Decimal(8, 2)), 269510, 50012256750, CAST(3711.00 AS Decimal(8, 2)), CAST(3725.65 AS Decimal(8, 2)), 26710, N'DOLM18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (366, CAST(N'2018-05-29' AS Date), CAST(3762.00 AS Decimal(8, 2)), CAST(3726.50 AS Decimal(8, 2)), CAST(3771.00 AS Decimal(8, 2)), CAST(3713.00 AS Decimal(8, 2)), 491730, 91835730625, CAST(3735.00 AS Decimal(8, 2)), CAST(3744.18 AS Decimal(8, 2)), 49391, N'DOLM18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (140, CAST(N'2019-04-30' AS Date), CAST(3940.50 AS Decimal(8, 2)), CAST(3927.50 AS Decimal(8, 2)), CAST(3967.50 AS Decimal(8, 2)), CAST(3923.00 AS Decimal(8, 2)), 391500, 77220360875, CAST(3944.00 AS Decimal(8, 2)), CAST(3931.82 AS Decimal(8, 2)), 40727, N'DOLM19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (139, CAST(N'2019-05-02' AS Date), CAST(3944.00 AS Decimal(8, 2)), CAST(3978.00 AS Decimal(8, 2)), CAST(3981.50 AS Decimal(8, 2)), CAST(3936.00 AS Decimal(8, 2)), 384560, 76323874375, CAST(3969.00 AS Decimal(8, 2)), CAST(3974.34 AS Decimal(8, 2)), 39209, N'DOLM19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (138, CAST(N'2019-05-03' AS Date), CAST(3973.50 AS Decimal(8, 2)), CAST(3948.00 AS Decimal(8, 2)), CAST(3977.50 AS Decimal(8, 2)), CAST(3940.50 AS Decimal(8, 2)), 302280, 59726378625, CAST(3951.00 AS Decimal(8, 2)), CAST(3948.45 AS Decimal(8, 2)), 35144, N'DOLM19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (137, CAST(N'2019-05-06' AS Date), CAST(3973.50 AS Decimal(8, 2)), CAST(3975.00 AS Decimal(8, 2)), CAST(3984.00 AS Decimal(8, 2)), CAST(3957.00 AS Decimal(8, 2)), 307470, 61050275500, CAST(3971.00 AS Decimal(8, 2)), CAST(3962.81 AS Decimal(8, 2)), 31557, N'DOLM19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (136, CAST(N'2019-05-07' AS Date), CAST(3973.50 AS Decimal(8, 2)), CAST(3980.00 AS Decimal(8, 2)), CAST(4009.00 AS Decimal(8, 2)), CAST(3973.00 AS Decimal(8, 2)), 424370, 84691147875, CAST(3991.00 AS Decimal(8, 2)), CAST(3987.19 AS Decimal(8, 2)), 49567, N'DOLM19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (135, CAST(N'2019-05-08' AS Date), CAST(3987.00 AS Decimal(8, 2)), CAST(3936.50 AS Decimal(8, 2)), CAST(3987.50 AS Decimal(8, 2)), CAST(3933.50 AS Decimal(8, 2)), 431755, 85183050750, CAST(3945.00 AS Decimal(8, 2)), CAST(3938.41 AS Decimal(8, 2)), 50095, N'DOLM19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (134, CAST(N'2019-05-09' AS Date), CAST(3953.00 AS Decimal(8, 2)), CAST(3955.00 AS Decimal(8, 2)), CAST(3989.00 AS Decimal(8, 2)), CAST(3940.00 AS Decimal(8, 2)), 452845, 89832028750, CAST(3967.00 AS Decimal(8, 2)), CAST(3954.18 AS Decimal(8, 2)), 54116, N'DOLM19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (133, CAST(N'2019-05-10' AS Date), CAST(3952.00 AS Decimal(8, 2)), CAST(3958.00 AS Decimal(8, 2)), CAST(3981.00 AS Decimal(8, 2)), CAST(3944.00 AS Decimal(8, 2)), 446035, 88357337375, CAST(3961.00 AS Decimal(8, 2)), CAST(3959.01 AS Decimal(8, 2)), 48154, N'DOLM19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (132, CAST(N'2019-05-13' AS Date), CAST(3981.00 AS Decimal(8, 2)), CAST(4004.00 AS Decimal(8, 2)), CAST(4012.00 AS Decimal(8, 2)), CAST(3980.00 AS Decimal(8, 2)), 478075, 95486024500, CAST(3994.00 AS Decimal(8, 2)), CAST(3983.96 AS Decimal(8, 2)), 58718, N'DOLM19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (131, CAST(N'2019-05-14' AS Date), CAST(4000.00 AS Decimal(8, 2)), CAST(3983.50 AS Decimal(8, 2)), CAST(4002.00 AS Decimal(8, 2)), CAST(3973.00 AS Decimal(8, 2)), 401245, 79947731375, CAST(3984.00 AS Decimal(8, 2)), CAST(3985.54 AS Decimal(8, 2)), 42426, N'DOLM19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (130, CAST(N'2019-05-15' AS Date), CAST(4010.00 AS Decimal(8, 2)), CAST(4008.50 AS Decimal(8, 2)), CAST(4028.00 AS Decimal(8, 2)), CAST(3980.00 AS Decimal(8, 2)), 454515, 91027499250, CAST(4005.00 AS Decimal(8, 2)), CAST(3993.64 AS Decimal(8, 2)), 53655, N'DOLM19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (129, CAST(N'2019-05-16' AS Date), CAST(4008.50 AS Decimal(8, 2)), CAST(4054.50 AS Decimal(8, 2)), CAST(4060.50 AS Decimal(8, 2)), CAST(4000.50 AS Decimal(8, 2)), 424255, 85400426375, CAST(4025.00 AS Decimal(8, 2)), CAST(4041.50 AS Decimal(8, 2)), 49483, N'DOLM19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (128, CAST(N'2019-05-17' AS Date), CAST(4064.00 AS Decimal(8, 2)), CAST(4106.50 AS Decimal(8, 2)), CAST(4118.50 AS Decimal(8, 2)), CAST(4053.50 AS Decimal(8, 2)), 557395, 114042822250, CAST(4091.00 AS Decimal(8, 2)), CAST(4106.98 AS Decimal(8, 2)), 62571, N'DOLM19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (127, CAST(N'2019-05-20' AS Date), CAST(4093.00 AS Decimal(8, 2)), CAST(4101.50 AS Decimal(8, 2)), CAST(4127.00 AS Decimal(8, 2)), CAST(4083.00 AS Decimal(8, 2)), 404810, 83068890875, CAST(4104.00 AS Decimal(8, 2)), CAST(4106.29 AS Decimal(8, 2)), 46152, N'DOLM19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (126, CAST(N'2019-05-21' AS Date), CAST(4096.50 AS Decimal(8, 2)), CAST(4043.50 AS Decimal(8, 2)), CAST(4117.50 AS Decimal(8, 2)), CAST(4037.50 AS Decimal(8, 2)), 473910, 96550656750, CAST(4074.00 AS Decimal(8, 2)), CAST(4055.30 AS Decimal(8, 2)), 51210, N'DOLM19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (125, CAST(N'2019-05-22' AS Date), CAST(4043.50 AS Decimal(8, 2)), CAST(4044.00 AS Decimal(8, 2)), CAST(4055.00 AS Decimal(8, 2)), CAST(4010.50 AS Decimal(8, 2)), 450390, 90807037750, CAST(4032.00 AS Decimal(8, 2)), CAST(4043.15 AS Decimal(8, 2)), 48324, N'DOLM19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (124, CAST(N'2019-05-23' AS Date), CAST(4060.00 AS Decimal(8, 2)), CAST(4044.50 AS Decimal(8, 2)), CAST(4074.00 AS Decimal(8, 2)), CAST(4028.50 AS Decimal(8, 2)), 403990, 81836176750, CAST(4051.00 AS Decimal(8, 2)), CAST(4051.82 AS Decimal(8, 2)), 46398, N'DOLM19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (123, CAST(N'2019-05-24' AS Date), CAST(4042.00 AS Decimal(8, 2)), CAST(4026.00 AS Decimal(8, 2)), CAST(4050.00 AS Decimal(8, 2)), CAST(4011.00 AS Decimal(8, 2)), 343595, 69238904500, CAST(4030.00 AS Decimal(8, 2)), CAST(4016.54 AS Decimal(8, 2)), 37976, N'DOLM19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (122, CAST(N'2019-05-27' AS Date), CAST(4016.00 AS Decimal(8, 2)), CAST(4045.00 AS Decimal(8, 2)), CAST(4045.00 AS Decimal(8, 2)), CAST(4006.50 AS Decimal(8, 2)), 170965, 34428047625, CAST(4027.00 AS Decimal(8, 2)), CAST(4037.50 AS Decimal(8, 2)), 17492, N'DOLM19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (121, CAST(N'2019-05-28' AS Date), CAST(4045.00 AS Decimal(8, 2)), CAST(4026.50 AS Decimal(8, 2)), CAST(4055.00 AS Decimal(8, 2)), CAST(4012.00 AS Decimal(8, 2)), 376125, 75747387125, CAST(4027.00 AS Decimal(8, 2)), CAST(4017.95 AS Decimal(8, 2)), 43769, N'DOLM19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (120, CAST(N'2019-05-29' AS Date), CAST(4040.00 AS Decimal(8, 2)), CAST(3975.00 AS Decimal(8, 2)), CAST(4041.50 AS Decimal(8, 2)), CAST(3969.00 AS Decimal(8, 2)), 444730, 88810327875, CAST(3993.00 AS Decimal(8, 2)), CAST(3983.50 AS Decimal(8, 2)), 45716, N'DOLM19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (119, CAST(N'2019-05-30' AS Date), CAST(3971.00 AS Decimal(8, 2)), CAST(3982.00 AS Decimal(8, 2)), CAST(3994.00 AS Decimal(8, 2)), CAST(3955.00 AS Decimal(8, 2)), 443915, 88128256875, CAST(3970.00 AS Decimal(8, 2)), CAST(3967.43 AS Decimal(8, 2)), 46057, N'DOLM19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (584, CAST(N'2017-05-31' AS Date), CAST(3280.00 AS Decimal(8, 2)), CAST(3249.50 AS Decimal(8, 2)), CAST(3281.50 AS Decimal(8, 2)), CAST(3248.50 AS Decimal(8, 2)), 376745, 61528717625, CAST(3266.00 AS Decimal(8, 2)), CAST(3261.05 AS Decimal(8, 2)), 37564, N'DOLN17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (583, CAST(N'2017-06-01' AS Date), CAST(3255.00 AS Decimal(8, 2)), CAST(3273.50 AS Decimal(8, 2)), CAST(3277.00 AS Decimal(8, 2)), CAST(3237.50 AS Decimal(8, 2)), 294950, 48057216250, CAST(3258.00 AS Decimal(8, 2)), CAST(3272.01 AS Decimal(8, 2)), 33542, N'DOLN17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (582, CAST(N'2017-06-02' AS Date), CAST(3270.00 AS Decimal(8, 2)), CAST(3267.50 AS Decimal(8, 2)), CAST(3280.00 AS Decimal(8, 2)), CAST(3242.50 AS Decimal(8, 2)), 246200, 40170348000, CAST(3263.00 AS Decimal(8, 2)), CAST(3272.72 AS Decimal(8, 2)), 29377, N'DOLN17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (581, CAST(N'2017-06-05' AS Date), CAST(3273.50 AS Decimal(8, 2)), CAST(3318.00 AS Decimal(8, 2)), CAST(3318.00 AS Decimal(8, 2)), CAST(3268.50 AS Decimal(8, 2)), 256465, 42326929500, CAST(3300.00 AS Decimal(8, 2)), CAST(3312.50 AS Decimal(8, 2)), 29503, N'DOLN17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (580, CAST(N'2017-06-06' AS Date), CAST(3320.00 AS Decimal(8, 2)), CAST(3297.00 AS Decimal(8, 2)), CAST(3321.50 AS Decimal(8, 2)), CAST(3292.00 AS Decimal(8, 2)), 239955, 39617477250, CAST(3302.00 AS Decimal(8, 2)), CAST(3293.94 AS Decimal(8, 2)), 28025, N'DOLN17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (579, CAST(N'2017-06-07' AS Date), CAST(3300.00 AS Decimal(8, 2)), CAST(3287.00 AS Decimal(8, 2)), CAST(3304.50 AS Decimal(8, 2)), CAST(3283.00 AS Decimal(8, 2)), 223705, 36839409000, CAST(3293.00 AS Decimal(8, 2)), CAST(3294.16 AS Decimal(8, 2)), 26674, N'DOLN17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (578, CAST(N'2017-06-08' AS Date), CAST(3294.00 AS Decimal(8, 2)), CAST(3278.00 AS Decimal(8, 2)), CAST(3306.00 AS Decimal(8, 2)), CAST(3278.00 AS Decimal(8, 2)), 217395, 35829793250, CAST(3296.00 AS Decimal(8, 2)), CAST(3284.76 AS Decimal(8, 2)), 24191, N'DOLN17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (577, CAST(N'2017-06-09' AS Date), CAST(3278.50 AS Decimal(8, 2)), CAST(3310.50 AS Decimal(8, 2)), CAST(3313.50 AS Decimal(8, 2)), CAST(3272.00 AS Decimal(8, 2)), 256150, 42162575875, CAST(3292.00 AS Decimal(8, 2)), CAST(3301.23 AS Decimal(8, 2)), 28735, N'DOLN17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (576, CAST(N'2017-06-12' AS Date), CAST(3303.50 AS Decimal(8, 2)), CAST(3331.50 AS Decimal(8, 2)), CAST(3342.00 AS Decimal(8, 2)), CAST(3291.50 AS Decimal(8, 2)), 275395, 45714409750, CAST(3319.00 AS Decimal(8, 2)), CAST(3331.48 AS Decimal(8, 2)), 33540, N'DOLN17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (575, CAST(N'2017-06-13' AS Date), CAST(3325.00 AS Decimal(8, 2)), CAST(3329.50 AS Decimal(8, 2)), CAST(3347.50 AS Decimal(8, 2)), CAST(3313.50 AS Decimal(8, 2)), 294460, 49011062375, CAST(3328.00 AS Decimal(8, 2)), CAST(3321.81 AS Decimal(8, 2)), 36210, N'DOLN17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (574, CAST(N'2017-06-14' AS Date), CAST(3322.00 AS Decimal(8, 2)), CAST(3287.00 AS Decimal(8, 2)), CAST(3326.50 AS Decimal(8, 2)), CAST(3277.00 AS Decimal(8, 2)), 337030, 55553994000, CAST(3296.00 AS Decimal(8, 2)), CAST(3294.50 AS Decimal(8, 2)), 43487, N'DOLN17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (573, CAST(N'2017-06-16' AS Date), CAST(3300.00 AS Decimal(8, 2)), CAST(3305.00 AS Decimal(8, 2)), CAST(3308.00 AS Decimal(8, 2)), CAST(3291.50 AS Decimal(8, 2)), 208845, 34449912750, CAST(3299.00 AS Decimal(8, 2)), CAST(3296.71 AS Decimal(8, 2)), 23898, N'DOLN17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (572, CAST(N'2017-06-19' AS Date), CAST(3304.00 AS Decimal(8, 2)), CAST(3292.50 AS Decimal(8, 2)), CAST(3325.00 AS Decimal(8, 2)), CAST(3292.00 AS Decimal(8, 2)), 236825, 39151865500, CAST(3306.00 AS Decimal(8, 2)), CAST(3299.10 AS Decimal(8, 2)), 28435, N'DOLN17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (571, CAST(N'2017-06-20' AS Date), CAST(3305.50 AS Decimal(8, 2)), CAST(3335.00 AS Decimal(8, 2)), CAST(3352.00 AS Decimal(8, 2)), CAST(3304.00 AS Decimal(8, 2)), 340995, 56736241875, CAST(3327.00 AS Decimal(8, 2)), CAST(3339.92 AS Decimal(8, 2)), 43326, N'DOLN17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (570, CAST(N'2017-06-21' AS Date), CAST(3328.50 AS Decimal(8, 2)), CAST(3343.50 AS Decimal(8, 2)), CAST(3345.00 AS Decimal(8, 2)), CAST(3322.50 AS Decimal(8, 2)), 270985, 45178658500, CAST(3334.00 AS Decimal(8, 2)), CAST(3336.63 AS Decimal(8, 2)), 31491, N'DOLN17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (569, CAST(N'2017-06-22' AS Date), CAST(3334.00 AS Decimal(8, 2)), CAST(3347.00 AS Decimal(8, 2)), CAST(3356.00 AS Decimal(8, 2)), CAST(3329.00 AS Decimal(8, 2)), 311400, 52027861375, CAST(3341.00 AS Decimal(8, 2)), CAST(3336.88 AS Decimal(8, 2)), 35906, N'DOLN17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (568, CAST(N'2017-06-23' AS Date), CAST(3347.50 AS Decimal(8, 2)), CAST(3348.00 AS Decimal(8, 2)), CAST(3350.00 AS Decimal(8, 2)), CAST(3332.00 AS Decimal(8, 2)), 241090, 40280715625, CAST(3341.00 AS Decimal(8, 2)), CAST(3344.67 AS Decimal(8, 2)), 26300, N'DOLN17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (567, CAST(N'2017-06-26' AS Date), CAST(3340.00 AS Decimal(8, 2)), CAST(3301.00 AS Decimal(8, 2)), CAST(3341.50 AS Decimal(8, 2)), CAST(3300.00 AS Decimal(8, 2)), 242615, 40225974875, CAST(3316.00 AS Decimal(8, 2)), CAST(3304.80 AS Decimal(8, 2)), 28272, N'DOLN17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (566, CAST(N'2017-06-27' AS Date), CAST(3311.00 AS Decimal(8, 2)), CAST(3317.00 AS Decimal(8, 2)), CAST(3338.00 AS Decimal(8, 2)), CAST(3301.50 AS Decimal(8, 2)), 344575, 57263232500, CAST(3323.00 AS Decimal(8, 2)), CAST(3329.34 AS Decimal(8, 2)), 41220, N'DOLN17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (565, CAST(N'2017-06-28' AS Date), CAST(3315.50 AS Decimal(8, 2)), CAST(3283.00 AS Decimal(8, 2)), CAST(3316.50 AS Decimal(8, 2)), CAST(3281.00 AS Decimal(8, 2)), 298320, 49256130125, CAST(3302.00 AS Decimal(8, 2)), CAST(3290.67 AS Decimal(8, 2)), 35541, N'DOLN17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (564, CAST(N'2017-06-29' AS Date), CAST(3275.00 AS Decimal(8, 2)), CAST(3306.50 AS Decimal(8, 2)), CAST(3316.50 AS Decimal(8, 2)), CAST(3272.50 AS Decimal(8, 2)), 349850, 57710358750, CAST(3299.00 AS Decimal(8, 2)), CAST(3304.89 AS Decimal(8, 2)), 36397, N'DOLN17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (365, CAST(N'2018-05-30' AS Date), CAST(3706.00 AS Decimal(8, 2)), CAST(3735.50 AS Decimal(8, 2)), CAST(3779.50 AS Decimal(8, 2)), CAST(3702.50 AS Decimal(8, 2)), 592730, 110991538750, CAST(3745.00 AS Decimal(8, 2)), CAST(3746.83 AS Decimal(8, 2)), 52585, N'DOLN18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (364, CAST(N'2018-06-01' AS Date), CAST(3755.00 AS Decimal(8, 2)), CAST(3775.00 AS Decimal(8, 2)), CAST(3781.50 AS Decimal(8, 2)), CAST(3732.50 AS Decimal(8, 2)), 371700, 69874477625, CAST(3759.00 AS Decimal(8, 2)), CAST(3777.19 AS Decimal(8, 2)), 39990, N'DOLN18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (363, CAST(N'2018-06-04' AS Date), CAST(3758.50 AS Decimal(8, 2)), CAST(3756.50 AS Decimal(8, 2)), CAST(3765.00 AS Decimal(8, 2)), CAST(3737.00 AS Decimal(8, 2)), 272916, 51189361275, CAST(3751.00 AS Decimal(8, 2)), CAST(3745.96 AS Decimal(8, 2)), 28411, N'DOLN18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (362, CAST(N'2018-06-05' AS Date), CAST(3774.50 AS Decimal(8, 2)), CAST(3816.50 AS Decimal(8, 2)), CAST(3828.00 AS Decimal(8, 2)), CAST(3768.00 AS Decimal(8, 2)), 521770, 98912322250, CAST(3791.00 AS Decimal(8, 2)), CAST(3806.41 AS Decimal(8, 2)), 54748, N'DOLN18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (361, CAST(N'2018-06-06' AS Date), CAST(3820.00 AS Decimal(8, 2)), CAST(3856.50 AS Decimal(8, 2)), CAST(3865.00 AS Decimal(8, 2)), CAST(3814.00 AS Decimal(8, 2)), 404970, 77656753250, CAST(3835.00 AS Decimal(8, 2)), CAST(3830.65 AS Decimal(8, 2)), 45415, N'DOLN18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (360, CAST(N'2018-06-07' AS Date), CAST(3870.00 AS Decimal(8, 2)), CAST(3912.00 AS Decimal(8, 2)), CAST(3977.00 AS Decimal(8, 2)), CAST(3858.50 AS Decimal(8, 2)), 576010, 112809342375, CAST(3916.00 AS Decimal(8, 2)), CAST(3916.27 AS Decimal(8, 2)), 57751, N'DOLN18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (359, CAST(N'2018-06-08' AS Date), CAST(3855.00 AS Decimal(8, 2)), CAST(3718.00 AS Decimal(8, 2)), CAST(3867.00 AS Decimal(8, 2)), CAST(3703.50 AS Decimal(8, 2)), 713705, 134997273625, CAST(3783.00 AS Decimal(8, 2)), CAST(3712.93 AS Decimal(8, 2)), 72315, N'DOLN18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (358, CAST(N'2018-06-09' AS Date), CAST(3855.00 AS Decimal(8, 2)), CAST(3718.00 AS Decimal(8, 2)), CAST(3867.00 AS Decimal(8, 2)), CAST(3703.50 AS Decimal(8, 2)), 713705, 134997273625, CAST(3783.00 AS Decimal(8, 2)), CAST(3712.93 AS Decimal(8, 2)), 72315, N'DOLN18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (357, CAST(N'2018-06-11' AS Date), CAST(3723.50 AS Decimal(8, 2)), CAST(3718.50 AS Decimal(8, 2)), CAST(3738.00 AS Decimal(8, 2)), CAST(3681.00 AS Decimal(8, 2)), 442560, 82123720375, CAST(3711.00 AS Decimal(8, 2)), CAST(3732.59 AS Decimal(8, 2)), 42952, N'DOLN18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (356, CAST(N'2018-06-12' AS Date), CAST(3723.00 AS Decimal(8, 2)), CAST(3724.00 AS Decimal(8, 2)), CAST(3736.50 AS Decimal(8, 2)), CAST(3678.00 AS Decimal(8, 2)), 370995, 68853898500, CAST(3711.00 AS Decimal(8, 2)), CAST(3723.51 AS Decimal(8, 2)), 35355, N'DOLN18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (355, CAST(N'2018-06-13' AS Date), CAST(3714.00 AS Decimal(8, 2)), CAST(3726.00 AS Decimal(8, 2)), CAST(3743.50 AS Decimal(8, 2)), CAST(3691.00 AS Decimal(8, 2)), 426110, 79151483500, CAST(3715.00 AS Decimal(8, 2)), CAST(3722.92 AS Decimal(8, 2)), 39240, N'DOLN18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (354, CAST(N'2018-06-14' AS Date), CAST(3707.00 AS Decimal(8, 2)), CAST(3810.50 AS Decimal(8, 2)), CAST(3821.00 AS Decimal(8, 2)), CAST(3691.50 AS Decimal(8, 2)), 506300, 94733175625, CAST(3742.00 AS Decimal(8, 2)), CAST(3793.58 AS Decimal(8, 2)), 48060, N'DOLN18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (353, CAST(N'2018-06-15' AS Date), CAST(3770.00 AS Decimal(8, 2)), CAST(3735.50 AS Decimal(8, 2)), CAST(3810.00 AS Decimal(8, 2)), CAST(3721.00 AS Decimal(8, 2)), 468055, 88125715125, CAST(3765.00 AS Decimal(8, 2)), CAST(3729.72 AS Decimal(8, 2)), 44320, N'DOLN18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (352, CAST(N'2018-06-18' AS Date), CAST(3750.00 AS Decimal(8, 2)), CAST(3752.50 AS Decimal(8, 2)), CAST(3770.00 AS Decimal(8, 2)), CAST(3735.00 AS Decimal(8, 2)), 270335, 50742345750, CAST(3754.00 AS Decimal(8, 2)), CAST(3755.17 AS Decimal(8, 2)), 26676, N'DOLN18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (351, CAST(N'2018-06-19' AS Date), CAST(3788.00 AS Decimal(8, 2)), CAST(3751.50 AS Decimal(8, 2)), CAST(3790.00 AS Decimal(8, 2)), CAST(3722.00 AS Decimal(8, 2)), 299230, 56163248250, CAST(3753.00 AS Decimal(8, 2)), CAST(3742.44 AS Decimal(8, 2)), 30231, N'DOLN18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (350, CAST(N'2018-06-20' AS Date), CAST(3749.00 AS Decimal(8, 2)), CAST(3774.00 AS Decimal(8, 2)), CAST(3790.00 AS Decimal(8, 2)), CAST(3709.50 AS Decimal(8, 2)), 361675, 67778005375, CAST(3748.00 AS Decimal(8, 2)), CAST(3771.95 AS Decimal(8, 2)), 36298, N'DOLN18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (349, CAST(N'2018-06-21' AS Date), CAST(3795.00 AS Decimal(8, 2)), CAST(3772.50 AS Decimal(8, 2)), CAST(3806.50 AS Decimal(8, 2)), CAST(3755.00 AS Decimal(8, 2)), 362390, 68525568625, CAST(3781.00 AS Decimal(8, 2)), CAST(3761.33 AS Decimal(8, 2)), 37600, N'DOLN18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (348, CAST(N'2018-06-22' AS Date), CAST(3758.50 AS Decimal(8, 2)), CAST(3786.00 AS Decimal(8, 2)), CAST(3791.00 AS Decimal(8, 2)), CAST(3739.00 AS Decimal(8, 2)), 256970, 48405062500, CAST(3767.00 AS Decimal(8, 2)), CAST(3770.20 AS Decimal(8, 2)), 25374, N'DOLN18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (347, CAST(N'2018-06-25' AS Date), CAST(3779.50 AS Decimal(8, 2)), CAST(3777.00 AS Decimal(8, 2)), CAST(3788.50 AS Decimal(8, 2)), CAST(3763.00 AS Decimal(8, 2)), 251275, 47456217250, CAST(3777.00 AS Decimal(8, 2)), CAST(3773.11 AS Decimal(8, 2)), 22415, N'DOLN18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (346, CAST(N'2018-06-26' AS Date), CAST(3786.00 AS Decimal(8, 2)), CAST(3799.00 AS Decimal(8, 2)), CAST(3804.50 AS Decimal(8, 2)), CAST(3763.00 AS Decimal(8, 2)), 294655, 55700680000, CAST(3780.00 AS Decimal(8, 2)), CAST(3792.29 AS Decimal(8, 2)), 25125, N'DOLN18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (345, CAST(N'2018-06-27' AS Date), CAST(3794.00 AS Decimal(8, 2)), CAST(3861.00 AS Decimal(8, 2)), CAST(3879.00 AS Decimal(8, 2)), CAST(3791.50 AS Decimal(8, 2)), 349495, 67133933000, CAST(3841.00 AS Decimal(8, 2)), CAST(3869.98 AS Decimal(8, 2)), 32581, N'DOLN18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (344, CAST(N'2018-06-28' AS Date), CAST(3850.00 AS Decimal(8, 2)), CAST(3866.00 AS Decimal(8, 2)), CAST(3878.50 AS Decimal(8, 2)), CAST(3835.00 AS Decimal(8, 2)), 385805, 74333814000, CAST(3853.00 AS Decimal(8, 2)), CAST(3855.72 AS Decimal(8, 2)), 35090, N'DOLN18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (118, CAST(N'2019-05-31' AS Date), CAST(4006.50 AS Decimal(8, 2)), CAST(3935.00 AS Decimal(8, 2)), CAST(4008.00 AS Decimal(8, 2)), CAST(3918.50 AS Decimal(8, 2)), 604485, 119401787500, CAST(3950.00 AS Decimal(8, 2)), CAST(3932.39 AS Decimal(8, 2)), 65599, N'DOLN19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (117, CAST(N'2019-06-03' AS Date), CAST(3940.00 AS Decimal(8, 2)), CAST(3894.00 AS Decimal(8, 2)), CAST(3943.00 AS Decimal(8, 2)), CAST(3891.00 AS Decimal(8, 2)), 371930, 72685915125, CAST(3908.00 AS Decimal(8, 2)), CAST(3907.83 AS Decimal(8, 2)), 43646, N'DOLN19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (116, CAST(N'2019-06-04' AS Date), CAST(3896.00 AS Decimal(8, 2)), CAST(3862.50 AS Decimal(8, 2)), CAST(3897.00 AS Decimal(8, 2)), CAST(3857.00 AS Decimal(8, 2)), 380960, 73812400875, CAST(3875.00 AS Decimal(8, 2)), CAST(3862.75 AS Decimal(8, 2)), 44803, N'DOLN19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (115, CAST(N'2019-06-05' AS Date), CAST(3864.50 AS Decimal(8, 2)), CAST(3887.50 AS Decimal(8, 2)), CAST(3910.00 AS Decimal(8, 2)), CAST(3845.00 AS Decimal(8, 2)), 497840, 96457623625, CAST(3875.00 AS Decimal(8, 2)), CAST(3887.82 AS Decimal(8, 2)), 54140, N'DOLN19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (114, CAST(N'2019-06-06' AS Date), CAST(3880.50 AS Decimal(8, 2)), CAST(3886.50 AS Decimal(8, 2)), CAST(3894.50 AS Decimal(8, 2)), CAST(3863.50 AS Decimal(8, 2)), 337665, 65526621875, CAST(3881.00 AS Decimal(8, 2)), CAST(3883.94 AS Decimal(8, 2)), 40022, N'DOLN19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (113, CAST(N'2019-06-07' AS Date), CAST(3887.50 AS Decimal(8, 2)), CAST(3883.50 AS Decimal(8, 2)), CAST(3892.50 AS Decimal(8, 2)), CAST(3856.00 AS Decimal(8, 2)), 312715, 60514492125, CAST(3870.00 AS Decimal(8, 2)), CAST(3874.78 AS Decimal(8, 2)), 37158, N'DOLN19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (112, CAST(N'2019-06-10' AS Date), CAST(3900.00 AS Decimal(8, 2)), CAST(3891.50 AS Decimal(8, 2)), CAST(3905.00 AS Decimal(8, 2)), CAST(3873.00 AS Decimal(8, 2)), 258390, 50225800125, CAST(3887.00 AS Decimal(8, 2)), CAST(3881.91 AS Decimal(8, 2)), 29546, N'DOLN19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (111, CAST(N'2019-06-11' AS Date), CAST(3886.00 AS Decimal(8, 2)), CAST(3861.50 AS Decimal(8, 2)), CAST(3890.00 AS Decimal(8, 2)), CAST(3847.50 AS Decimal(8, 2)), 296950, 57386047875, CAST(3865.00 AS Decimal(8, 2)), CAST(3853.15 AS Decimal(8, 2)), 33485, N'DOLN19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (110, CAST(N'2019-06-12' AS Date), CAST(3863.00 AS Decimal(8, 2)), CAST(3871.50 AS Decimal(8, 2)), CAST(3876.00 AS Decimal(8, 2)), CAST(3834.00 AS Decimal(8, 2)), 395200, 76121818000, CAST(3852.00 AS Decimal(8, 2)), CAST(3856.63 AS Decimal(8, 2)), 43886, N'DOLN19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (109, CAST(N'2019-06-13' AS Date), CAST(3855.00 AS Decimal(8, 2)), CAST(3853.50 AS Decimal(8, 2)), CAST(3869.00 AS Decimal(8, 2)), CAST(3839.00 AS Decimal(8, 2)), 376630, 72515831750, CAST(3850.00 AS Decimal(8, 2)), CAST(3859.87 AS Decimal(8, 2)), 38232, N'DOLN19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (108, CAST(N'2019-06-14' AS Date), CAST(3860.00 AS Decimal(8, 2)), CAST(3899.50 AS Decimal(8, 2)), CAST(3917.00 AS Decimal(8, 2)), CAST(3851.50 AS Decimal(8, 2)), 403815, 78551520125, CAST(3890.00 AS Decimal(8, 2)), CAST(3898.60 AS Decimal(8, 2)), 48427, N'DOLN19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (107, CAST(N'2019-06-17' AS Date), CAST(3898.00 AS Decimal(8, 2)), CAST(3891.00 AS Decimal(8, 2)), CAST(3927.00 AS Decimal(8, 2)), CAST(3883.50 AS Decimal(8, 2)), 327170, 63765651500, CAST(3898.00 AS Decimal(8, 2)), CAST(3905.51 AS Decimal(8, 2)), 35566, N'DOLN19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (106, CAST(N'2019-06-18' AS Date), CAST(3878.00 AS Decimal(8, 2)), CAST(3863.50 AS Decimal(8, 2)), CAST(3880.50 AS Decimal(8, 2)), CAST(3851.50 AS Decimal(8, 2)), 314855, 60822543500, CAST(3863.00 AS Decimal(8, 2)), CAST(3861.81 AS Decimal(8, 2)), 36446, N'DOLN19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (105, CAST(N'2019-06-19' AS Date), CAST(3866.00 AS Decimal(8, 2)), CAST(3841.50 AS Decimal(8, 2)), CAST(3886.50 AS Decimal(8, 2)), CAST(3841.00 AS Decimal(8, 2)), 411970, 79601865875, CAST(3864.00 AS Decimal(8, 2)), CAST(3846.53 AS Decimal(8, 2)), 42006, N'DOLN19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (104, CAST(N'2019-06-21' AS Date), CAST(3833.00 AS Decimal(8, 2)), CAST(3825.00 AS Decimal(8, 2)), CAST(3847.50 AS Decimal(8, 2)), CAST(3815.50 AS Decimal(8, 2)), 316145, 60506225250, CAST(3827.00 AS Decimal(8, 2)), CAST(3831.83 AS Decimal(8, 2)), 34312, N'DOLN19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (103, CAST(N'2019-06-24' AS Date), CAST(3821.50 AS Decimal(8, 2)), CAST(3825.00 AS Decimal(8, 2)), CAST(3839.00 AS Decimal(8, 2)), CAST(3809.00 AS Decimal(8, 2)), 330375, 63178430750, CAST(3824.00 AS Decimal(8, 2)), CAST(3828.38 AS Decimal(8, 2)), 33641, N'DOLN19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (102, CAST(N'2019-06-25' AS Date), CAST(3829.00 AS Decimal(8, 2)), CAST(3846.50 AS Decimal(8, 2)), CAST(3858.00 AS Decimal(8, 2)), CAST(3820.00 AS Decimal(8, 2)), 424710, 81494966375, CAST(3837.00 AS Decimal(8, 2)), CAST(3847.22 AS Decimal(8, 2)), 44472, N'DOLN19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (101, CAST(N'2019-06-26' AS Date), CAST(3835.00 AS Decimal(8, 2)), CAST(3843.00 AS Decimal(8, 2)), CAST(3857.00 AS Decimal(8, 2)), CAST(3832.00 AS Decimal(8, 2)), 381155, 73268615125, CAST(3844.00 AS Decimal(8, 2)), CAST(3852.35 AS Decimal(8, 2)), 39735, N'DOLN19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (100, CAST(N'2019-06-27' AS Date), CAST(3860.50 AS Decimal(8, 2)), CAST(3819.50 AS Decimal(8, 2)), CAST(3872.50 AS Decimal(8, 2)), CAST(3819.00 AS Decimal(8, 2)), 382980, 73778728000, CAST(3852.00 AS Decimal(8, 2)), CAST(3835.30 AS Decimal(8, 2)), 39570, N'DOLN19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (563, CAST(N'2017-06-30' AS Date), CAST(3321.00 AS Decimal(8, 2)), CAST(3327.50 AS Decimal(8, 2)), CAST(3336.50 AS Decimal(8, 2)), CAST(3306.50 AS Decimal(8, 2)), 319855, 53205202125, CAST(3326.00 AS Decimal(8, 2)), CAST(3326.94 AS Decimal(8, 2)), 33084, N'DOLQ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (562, CAST(N'2017-07-03' AS Date), CAST(3336.50 AS Decimal(8, 2)), CAST(3321.00 AS Decimal(8, 2)), CAST(3342.50 AS Decimal(8, 2)), CAST(3312.00 AS Decimal(8, 2)), 265710, 44131380875, CAST(3321.00 AS Decimal(8, 2)), CAST(3317.23 AS Decimal(8, 2)), 24862, N'DOLQ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (561, CAST(N'2017-07-04' AS Date), CAST(3322.50 AS Decimal(8, 2)), CAST(3328.50 AS Decimal(8, 2)), CAST(3330.00 AS Decimal(8, 2)), CAST(3318.00 AS Decimal(8, 2)), 94055, 15634709000, CAST(3324.00 AS Decimal(8, 2)), CAST(3328.08 AS Decimal(8, 2)), 10858, N'DOLQ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (560, CAST(N'2017-07-05' AS Date), CAST(3333.50 AS Decimal(8, 2)), CAST(3307.00 AS Decimal(8, 2)), CAST(3349.00 AS Decimal(8, 2)), CAST(3307.00 AS Decimal(8, 2)), 297290, 49487176375, CAST(3329.00 AS Decimal(8, 2)), CAST(3314.69 AS Decimal(8, 2)), 36757, N'DOLQ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (559, CAST(N'2017-07-06' AS Date), CAST(3318.50 AS Decimal(8, 2)), CAST(3316.50 AS Decimal(8, 2)), CAST(3339.00 AS Decimal(8, 2)), CAST(3314.00 AS Decimal(8, 2)), 309985, 51525223125, CAST(3324.00 AS Decimal(8, 2)), CAST(3318.13 AS Decimal(8, 2)), 37074, N'DOLQ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (558, CAST(N'2017-07-07' AS Date), CAST(3307.00 AS Decimal(8, 2)), CAST(3299.00 AS Decimal(8, 2)), CAST(3324.00 AS Decimal(8, 2)), CAST(3287.00 AS Decimal(8, 2)), 297290, 49082925875, CAST(3302.00 AS Decimal(8, 2)), CAST(3296.64 AS Decimal(8, 2)), 37120, N'DOLQ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (557, CAST(N'2017-07-10' AS Date), CAST(3295.00 AS Decimal(8, 2)), CAST(3271.50 AS Decimal(8, 2)), CAST(3296.00 AS Decimal(8, 2)), CAST(3270.00 AS Decimal(8, 2)), 212945, 34913796750, CAST(3279.00 AS Decimal(8, 2)), CAST(3278.08 AS Decimal(8, 2)), 23197, N'DOLQ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (556, CAST(N'2017-07-11' AS Date), CAST(3278.50 AS Decimal(8, 2)), CAST(3269.00 AS Decimal(8, 2)), CAST(3284.00 AS Decimal(8, 2)), CAST(3261.00 AS Decimal(8, 2)), 213590, 34900751875, CAST(3268.00 AS Decimal(8, 2)), CAST(3266.26 AS Decimal(8, 2)), 26122, N'DOLQ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (555, CAST(N'2017-07-12' AS Date), CAST(3252.50 AS Decimal(8, 2)), CAST(3221.00 AS Decimal(8, 2)), CAST(3254.50 AS Decimal(8, 2)), CAST(3217.50 AS Decimal(8, 2)), 350020, 56597764625, CAST(3233.00 AS Decimal(8, 2)), CAST(3225.63 AS Decimal(8, 2)), 39627, N'DOLQ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (554, CAST(N'2017-07-13' AS Date), CAST(3225.00 AS Decimal(8, 2)), CAST(3223.00 AS Decimal(8, 2)), CAST(3233.50 AS Decimal(8, 2)), CAST(3214.00 AS Decimal(8, 2)), 226565, 36502507375, CAST(3222.00 AS Decimal(8, 2)), CAST(3221.22 AS Decimal(8, 2)), 23827, N'DOLQ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (553, CAST(N'2017-07-14' AS Date), CAST(3216.50 AS Decimal(8, 2)), CAST(3189.50 AS Decimal(8, 2)), CAST(3221.50 AS Decimal(8, 2)), CAST(3189.00 AS Decimal(8, 2)), 259635, 41542280875, CAST(3200.00 AS Decimal(8, 2)), CAST(3192.02 AS Decimal(8, 2)), 28173, N'DOLQ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (552, CAST(N'2017-07-17' AS Date), CAST(3190.00 AS Decimal(8, 2)), CAST(3192.00 AS Decimal(8, 2)), CAST(3196.00 AS Decimal(8, 2)), CAST(3185.50 AS Decimal(8, 2)), 188885, 30131893625, CAST(3190.00 AS Decimal(8, 2)), CAST(3190.16 AS Decimal(8, 2)), 19487, N'DOLQ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (551, CAST(N'2017-07-18' AS Date), CAST(3182.00 AS Decimal(8, 2)), CAST(3163.50 AS Decimal(8, 2)), CAST(3184.50 AS Decimal(8, 2)), CAST(3162.00 AS Decimal(8, 2)), 237995, 37758930125, CAST(3173.00 AS Decimal(8, 2)), CAST(3167.05 AS Decimal(8, 2)), 27476, N'DOLQ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (550, CAST(N'2017-07-19' AS Date), CAST(3168.00 AS Decimal(8, 2)), CAST(3156.00 AS Decimal(8, 2)), CAST(3171.00 AS Decimal(8, 2)), CAST(3151.50 AS Decimal(8, 2)), 233175, 36835828875, CAST(3159.00 AS Decimal(8, 2)), CAST(3155.63 AS Decimal(8, 2)), 25495, N'DOLQ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (549, CAST(N'2017-07-20' AS Date), CAST(3158.50 AS Decimal(8, 2)), CAST(3127.50 AS Decimal(8, 2)), CAST(3162.50 AS Decimal(8, 2)), CAST(3125.00 AS Decimal(8, 2)), 253880, 39910953000, CAST(3144.00 AS Decimal(8, 2)), CAST(3137.17 AS Decimal(8, 2)), 30425, N'DOLQ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (548, CAST(N'2017-07-21' AS Date), CAST(3124.00 AS Decimal(8, 2)), CAST(3148.00 AS Decimal(8, 2)), CAST(3150.50 AS Decimal(8, 2)), CAST(3117.00 AS Decimal(8, 2)), 255720, 40055224000, CAST(3132.00 AS Decimal(8, 2)), CAST(3144.02 AS Decimal(8, 2)), 29568, N'DOLQ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (547, CAST(N'2017-07-24' AS Date), CAST(3145.00 AS Decimal(8, 2)), CAST(3150.00 AS Decimal(8, 2)), CAST(3156.50 AS Decimal(8, 2)), CAST(3138.50 AS Decimal(8, 2)), 200345, 31553613125, CAST(3149.00 AS Decimal(8, 2)), CAST(3150.56 AS Decimal(8, 2)), 22648, N'DOLQ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (546, CAST(N'2017-07-25' AS Date), CAST(3148.50 AS Decimal(8, 2)), CAST(3175.50 AS Decimal(8, 2)), CAST(3175.50 AS Decimal(8, 2)), CAST(3141.50 AS Decimal(8, 2)), 311610, 49240019375, CAST(3160.00 AS Decimal(8, 2)), CAST(3169.69 AS Decimal(8, 2)), 36767, N'DOLQ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (545, CAST(N'2017-07-26' AS Date), CAST(3167.00 AS Decimal(8, 2)), CAST(3140.50 AS Decimal(8, 2)), CAST(3179.00 AS Decimal(8, 2)), CAST(3137.50 AS Decimal(8, 2)), 304750, 48161307500, CAST(3160.00 AS Decimal(8, 2)), CAST(3150.32 AS Decimal(8, 2)), 33629, N'DOLQ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (544, CAST(N'2017-07-27' AS Date), CAST(3144.50 AS Decimal(8, 2)), CAST(3155.00 AS Decimal(8, 2)), CAST(3161.00 AS Decimal(8, 2)), CAST(3138.50 AS Decimal(8, 2)), 289930, 45715681625, CAST(3153.00 AS Decimal(8, 2)), CAST(3157.60 AS Decimal(8, 2)), 34472, N'DOLQ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (543, CAST(N'2017-07-28' AS Date), CAST(3158.50 AS Decimal(8, 2)), CAST(3133.50 AS Decimal(8, 2)), CAST(3161.00 AS Decimal(8, 2)), CAST(3130.00 AS Decimal(8, 2)), 257965, 40574024750, CAST(3145.00 AS Decimal(8, 2)), CAST(3139.93 AS Decimal(8, 2)), 26290, N'DOLQ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (343, CAST(N'2018-06-29' AS Date), CAST(3856.00 AS Decimal(8, 2)), CAST(3889.50 AS Decimal(8, 2)), CAST(3892.00 AS Decimal(8, 2)), CAST(3841.00 AS Decimal(8, 2)), 356200, 68956620625, CAST(3871.00 AS Decimal(8, 2)), CAST(3884.89 AS Decimal(8, 2)), 33342, N'DOLQ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (342, CAST(N'2018-07-02' AS Date), CAST(3904.50 AS Decimal(8, 2)), CAST(3925.00 AS Decimal(8, 2)), CAST(3930.50 AS Decimal(8, 2)), CAST(3892.00 AS Decimal(8, 2)), 261370, 51178045625, CAST(3916.00 AS Decimal(8, 2)), CAST(3923.94 AS Decimal(8, 2)), 24644, N'DOLQ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (341, CAST(N'2018-07-03' AS Date), CAST(3895.00 AS Decimal(8, 2)), CAST(3908.50 AS Decimal(8, 2)), CAST(3912.50 AS Decimal(8, 2)), CAST(3883.50 AS Decimal(8, 2)), 229095, 44688002250, CAST(3901.00 AS Decimal(8, 2)), CAST(3905.43 AS Decimal(8, 2)), 23022, N'DOLQ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (340, CAST(N'2018-07-04' AS Date), CAST(3910.50 AS Decimal(8, 2)), CAST(3923.50 AS Decimal(8, 2)), CAST(3930.00 AS Decimal(8, 2)), CAST(3896.50 AS Decimal(8, 2)), 119425, 23385931750, CAST(3916.00 AS Decimal(8, 2)), CAST(3918.50 AS Decimal(8, 2)), 13697, N'DOLQ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (339, CAST(N'2018-07-05' AS Date), CAST(3907.00 AS Decimal(8, 2)), CAST(3943.00 AS Decimal(8, 2)), CAST(3952.50 AS Decimal(8, 2)), CAST(3896.50 AS Decimal(8, 2)), 281415, 55301593750, CAST(3930.00 AS Decimal(8, 2)), CAST(3947.30 AS Decimal(8, 2)), 27796, N'DOLQ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (338, CAST(N'2018-07-06' AS Date), CAST(3953.00 AS Decimal(8, 2)), CAST(3873.50 AS Decimal(8, 2)), CAST(3963.00 AS Decimal(8, 2)), CAST(3870.00 AS Decimal(8, 2)), 295260, 57975513125, CAST(3927.00 AS Decimal(8, 2)), CAST(3875.55 AS Decimal(8, 2)), 32498, N'DOLQ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (337, CAST(N'2018-07-10' AS Date), CAST(3894.00 AS Decimal(8, 2)), CAST(3826.00 AS Decimal(8, 2)), CAST(3895.50 AS Decimal(8, 2)), CAST(3802.50 AS Decimal(8, 2)), 380240, 73078106125, CAST(3843.00 AS Decimal(8, 2)), CAST(3815.50 AS Decimal(8, 2)), 37199, N'DOLQ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (336, CAST(N'2018-07-11' AS Date), CAST(3849.00 AS Decimal(8, 2)), CAST(3886.00 AS Decimal(8, 2)), CAST(3894.00 AS Decimal(8, 2)), CAST(3822.50 AS Decimal(8, 2)), 344215, 66409823500, CAST(3858.00 AS Decimal(8, 2)), CAST(3882.97 AS Decimal(8, 2)), 37165, N'DOLQ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (335, CAST(N'2018-07-12' AS Date), CAST(3865.00 AS Decimal(8, 2)), CAST(3891.00 AS Decimal(8, 2)), CAST(3911.00 AS Decimal(8, 2)), CAST(3844.50 AS Decimal(8, 2)), 363030, 70303160250, CAST(3873.00 AS Decimal(8, 2)), CAST(3905.30 AS Decimal(8, 2)), 36395, N'DOLQ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (334, CAST(N'2018-07-13' AS Date), CAST(3894.50 AS Decimal(8, 2)), CAST(3858.00 AS Decimal(8, 2)), CAST(3908.50 AS Decimal(8, 2)), CAST(3852.00 AS Decimal(8, 2)), 302360, 58610927250, CAST(3876.00 AS Decimal(8, 2)), CAST(3871.17 AS Decimal(8, 2)), 32508, N'DOLQ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (333, CAST(N'2018-07-16' AS Date), CAST(3847.00 AS Decimal(8, 2)), CAST(3866.50 AS Decimal(8, 2)), CAST(3879.50 AS Decimal(8, 2)), CAST(3842.00 AS Decimal(8, 2)), 241225, 46625377250, CAST(3865.00 AS Decimal(8, 2)), CAST(3870.23 AS Decimal(8, 2)), 26571, N'DOLQ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (332, CAST(N'2018-07-17' AS Date), CAST(3878.00 AS Decimal(8, 2)), CAST(3844.50 AS Decimal(8, 2)), CAST(3885.50 AS Decimal(8, 2)), CAST(3844.50 AS Decimal(8, 2)), 264155, 51063632625, CAST(3866.00 AS Decimal(8, 2)), CAST(3849.41 AS Decimal(8, 2)), 28557, N'DOLQ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (331, CAST(N'2018-07-18' AS Date), CAST(3859.00 AS Decimal(8, 2)), CAST(3857.00 AS Decimal(8, 2)), CAST(3869.50 AS Decimal(8, 2)), CAST(3825.00 AS Decimal(8, 2)), 289940, 55796915750, CAST(3848.00 AS Decimal(8, 2)), CAST(3838.85 AS Decimal(8, 2)), 30244, N'DOLQ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (330, CAST(N'2018-07-19' AS Date), CAST(3875.00 AS Decimal(8, 2)), CAST(3835.50 AS Decimal(8, 2)), CAST(3898.00 AS Decimal(8, 2)), CAST(3828.00 AS Decimal(8, 2)), 364275, 70567977000, CAST(3874.00 AS Decimal(8, 2)), CAST(3864.38 AS Decimal(8, 2)), 40102, N'DOLQ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (329, CAST(N'2018-07-20' AS Date), CAST(3816.50 AS Decimal(8, 2)), CAST(3773.50 AS Decimal(8, 2)), CAST(3820.00 AS Decimal(8, 2)), CAST(3763.50 AS Decimal(8, 2)), 359270, 68009895250, CAST(3786.00 AS Decimal(8, 2)), CAST(3777.11 AS Decimal(8, 2)), 37330, N'DOLQ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (328, CAST(N'2018-07-23' AS Date), CAST(3779.50 AS Decimal(8, 2)), CAST(3786.00 AS Decimal(8, 2)), CAST(3806.50 AS Decimal(8, 2)), CAST(3776.00 AS Decimal(8, 2)), 235945, 44751959875, CAST(3793.00 AS Decimal(8, 2)), CAST(3790.35 AS Decimal(8, 2)), 24312, N'DOLQ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (327, CAST(N'2018-07-24' AS Date), CAST(3776.00 AS Decimal(8, 2)), CAST(3751.00 AS Decimal(8, 2)), CAST(3780.00 AS Decimal(8, 2)), CAST(3735.00 AS Decimal(8, 2)), 314905, 59087689500, CAST(3752.00 AS Decimal(8, 2)), CAST(3745.95 AS Decimal(8, 2)), 32668, N'DOLQ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (326, CAST(N'2018-07-25' AS Date), CAST(3736.50 AS Decimal(8, 2)), CAST(3690.50 AS Decimal(8, 2)), CAST(3737.00 AS Decimal(8, 2)), CAST(3690.50 AS Decimal(8, 2)), 325800, 60483840000, CAST(3712.00 AS Decimal(8, 2)), CAST(3710.05 AS Decimal(8, 2)), 33433, N'DOLQ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (325, CAST(N'2018-07-26' AS Date), CAST(3705.00 AS Decimal(8, 2)), CAST(3747.50 AS Decimal(8, 2)), CAST(3750.00 AS Decimal(8, 2)), CAST(3701.00 AS Decimal(8, 2)), 306255, 57071930875, CAST(3727.00 AS Decimal(8, 2)), CAST(3744.16 AS Decimal(8, 2)), 30117, N'DOLQ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (324, CAST(N'2018-07-27' AS Date), CAST(3743.00 AS Decimal(8, 2)), CAST(3710.00 AS Decimal(8, 2)), CAST(3745.00 AS Decimal(8, 2)), CAST(3707.50 AS Decimal(8, 2)), 297500, 55374194375, CAST(3722.00 AS Decimal(8, 2)), CAST(3718.51 AS Decimal(8, 2)), 28141, N'DOLQ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (323, CAST(N'2018-07-30' AS Date), CAST(3697.00 AS Decimal(8, 2)), CAST(3730.00 AS Decimal(8, 2)), CAST(3732.50 AS Decimal(8, 2)), CAST(3696.50 AS Decimal(8, 2)), 268805, 49990947125, CAST(3719.00 AS Decimal(8, 2)), CAST(3728.98 AS Decimal(8, 2)), 24191, N'DOLQ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (99, CAST(N'2019-06-28' AS Date), CAST(3835.50 AS Decimal(8, 2)), CAST(3861.00 AS Decimal(8, 2)), CAST(3862.00 AS Decimal(8, 2)), CAST(3825.00 AS Decimal(8, 2)), 352445, 67720625625, CAST(3842.00 AS Decimal(8, 2)), CAST(3847.85 AS Decimal(8, 2)), 36217, N'DOLQ19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (98, CAST(N'2019-07-01' AS Date), CAST(3843.50 AS Decimal(8, 2)), CAST(3852.00 AS Decimal(8, 2)), CAST(3859.00 AS Decimal(8, 2)), CAST(3820.00 AS Decimal(8, 2)), 350200, 67181969000, CAST(3836.00 AS Decimal(8, 2)), CAST(3847.00 AS Decimal(8, 2)), 36052, N'DOLQ19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (97, CAST(N'2019-07-02' AS Date), CAST(3851.50 AS Decimal(8, 2)), CAST(3854.00 AS Decimal(8, 2)), CAST(3890.00 AS Decimal(8, 2)), CAST(3828.00 AS Decimal(8, 2)), 483660, 93319061625, CAST(3858.00 AS Decimal(8, 2)), CAST(3855.24 AS Decimal(8, 2)), 56927, N'DOLQ19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (96, CAST(N'2019-07-03' AS Date), CAST(3870.00 AS Decimal(8, 2)), CAST(3834.50 AS Decimal(8, 2)), CAST(3884.00 AS Decimal(8, 2)), CAST(3825.00 AS Decimal(8, 2)), 363130, 69960094750, CAST(3853.00 AS Decimal(8, 2)), CAST(3841.13 AS Decimal(8, 2)), 40813, N'DOLQ19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (95, CAST(N'2019-07-04' AS Date), CAST(3814.50 AS Decimal(8, 2)), CAST(3809.50 AS Decimal(8, 2)), CAST(3818.00 AS Decimal(8, 2)), CAST(3792.50 AS Decimal(8, 2)), 245200, 46630041750, CAST(3803.00 AS Decimal(8, 2)), CAST(3801.16 AS Decimal(8, 2)), 25231, N'DOLQ19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (94, CAST(N'2019-07-05' AS Date), CAST(3810.00 AS Decimal(8, 2)), CAST(3829.00 AS Decimal(8, 2)), CAST(3845.50 AS Decimal(8, 2)), CAST(3805.00 AS Decimal(8, 2)), 291995, 55874685125, CAST(3827.00 AS Decimal(8, 2)), CAST(3825.46 AS Decimal(8, 2)), 33476, N'DOLQ19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (93, CAST(N'2019-07-08' AS Date), CAST(3822.50 AS Decimal(8, 2)), CAST(3809.50 AS Decimal(8, 2)), CAST(3824.50 AS Decimal(8, 2)), CAST(3806.50 AS Decimal(8, 2)), 181870, 34682000875, CAST(3813.00 AS Decimal(8, 2)), CAST(3812.35 AS Decimal(8, 2)), 20515, N'DOLQ19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (92, CAST(N'2019-07-10' AS Date), CAST(3793.00 AS Decimal(8, 2)), CAST(3759.50 AS Decimal(8, 2)), CAST(3797.50 AS Decimal(8, 2)), CAST(3757.00 AS Decimal(8, 2)), 439580, 82882029500, CAST(3770.00 AS Decimal(8, 2)), CAST(3763.18 AS Decimal(8, 2)), 44114, N'DOLQ19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (91, CAST(N'2019-07-11' AS Date), CAST(3746.00 AS Decimal(8, 2)), CAST(3762.00 AS Decimal(8, 2)), CAST(3772.00 AS Decimal(8, 2)), CAST(3739.50 AS Decimal(8, 2)), 367200, 68991839750, CAST(3757.00 AS Decimal(8, 2)), CAST(3759.42 AS Decimal(8, 2)), 37966, N'DOLQ19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (90, CAST(N'2019-07-12' AS Date), CAST(3765.00 AS Decimal(8, 2)), CAST(3741.50 AS Decimal(8, 2)), CAST(3769.00 AS Decimal(8, 2)), CAST(3735.50 AS Decimal(8, 2)), 297205, 55706617000, CAST(3748.00 AS Decimal(8, 2)), CAST(3747.87 AS Decimal(8, 2)), 33370, N'DOLQ19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (89, CAST(N'2019-07-15' AS Date), CAST(3734.00 AS Decimal(8, 2)), CAST(3761.00 AS Decimal(8, 2)), CAST(3764.00 AS Decimal(8, 2)), CAST(3733.00 AS Decimal(8, 2)), 208670, 39163401125, CAST(3753.00 AS Decimal(8, 2)), CAST(3761.58 AS Decimal(8, 2)), 22044, N'DOLQ19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (88, CAST(N'2019-07-16' AS Date), CAST(3757.50 AS Decimal(8, 2)), CAST(3773.00 AS Decimal(8, 2)), CAST(3776.00 AS Decimal(8, 2)), CAST(3757.50 AS Decimal(8, 2)), 275520, 51895540625, CAST(3767.00 AS Decimal(8, 2)), CAST(3768.92 AS Decimal(8, 2)), 26199, N'DOLQ19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (87, CAST(N'2019-07-17' AS Date), CAST(3772.00 AS Decimal(8, 2)), CAST(3767.00 AS Decimal(8, 2)), CAST(3772.00 AS Decimal(8, 2)), CAST(3759.00 AS Decimal(8, 2)), 254485, 47907710875, CAST(3765.00 AS Decimal(8, 2)), CAST(3764.42 AS Decimal(8, 2)), 22173, N'DOLQ19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (86, CAST(N'2019-07-18' AS Date), CAST(3764.00 AS Decimal(8, 2)), CAST(3722.00 AS Decimal(8, 2)), CAST(3767.00 AS Decimal(8, 2)), CAST(3721.50 AS Decimal(8, 2)), 311375, 58309073375, CAST(3745.00 AS Decimal(8, 2)), CAST(3733.44 AS Decimal(8, 2)), 29441, N'DOLQ19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (85, CAST(N'2019-07-19' AS Date), CAST(3731.00 AS Decimal(8, 2)), CAST(3750.00 AS Decimal(8, 2)), CAST(3757.00 AS Decimal(8, 2)), CAST(3730.50 AS Decimal(8, 2)), 293890, 55026255000, CAST(3744.00 AS Decimal(8, 2)), CAST(3749.55 AS Decimal(8, 2)), 30698, N'DOLQ19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (84, CAST(N'2019-07-22' AS Date), CAST(3746.50 AS Decimal(8, 2)), CAST(3744.00 AS Decimal(8, 2)), CAST(3750.50 AS Decimal(8, 2)), CAST(3732.50 AS Decimal(8, 2)), 204500, 38250903500, CAST(3740.00 AS Decimal(8, 2)), CAST(3737.37 AS Decimal(8, 2)), 20571, N'DOLQ19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (83, CAST(N'2019-07-23' AS Date), CAST(3745.00 AS Decimal(8, 2)), CAST(3775.00 AS Decimal(8, 2)), CAST(3782.00 AS Decimal(8, 2)), CAST(3743.00 AS Decimal(8, 2)), 313840, 59121712875, CAST(3767.00 AS Decimal(8, 2)), CAST(3772.97 AS Decimal(8, 2)), 33586, N'DOLQ19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (82, CAST(N'2019-07-24' AS Date), CAST(3767.50 AS Decimal(8, 2)), CAST(3773.50 AS Decimal(8, 2)), CAST(3779.50 AS Decimal(8, 2)), CAST(3754.00 AS Decimal(8, 2)), 269620, 50725252625, CAST(3762.00 AS Decimal(8, 2)), CAST(3769.86 AS Decimal(8, 2)), 26137, N'DOLQ19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (81, CAST(N'2019-07-25' AS Date), CAST(3768.00 AS Decimal(8, 2)), CAST(3779.50 AS Decimal(8, 2)), CAST(3807.00 AS Decimal(8, 2)), CAST(3757.00 AS Decimal(8, 2)), 381060, 72105906125, CAST(3784.00 AS Decimal(8, 2)), CAST(3782.83 AS Decimal(8, 2)), 41651, N'DOLQ19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (80, CAST(N'2019-07-26' AS Date), CAST(3780.00 AS Decimal(8, 2)), CAST(3776.00 AS Decimal(8, 2)), CAST(3795.50 AS Decimal(8, 2)), CAST(3761.00 AS Decimal(8, 2)), 309480, 58414828000, CAST(3775.00 AS Decimal(8, 2)), CAST(3770.25 AS Decimal(8, 2)), 32128, N'DOLQ19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (79, CAST(N'2019-07-29' AS Date), CAST(3785.00 AS Decimal(8, 2)), CAST(3782.00 AS Decimal(8, 2)), CAST(3801.50 AS Decimal(8, 2)), CAST(3777.50 AS Decimal(8, 2)), 226625, 42939771125, CAST(3789.00 AS Decimal(8, 2)), CAST(3784.80 AS Decimal(8, 2)), 27192, N'DOLQ19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (78, CAST(N'2019-07-30' AS Date), CAST(3784.50 AS Decimal(8, 2)), CAST(3790.50 AS Decimal(8, 2)), CAST(3799.50 AS Decimal(8, 2)), CAST(3776.00 AS Decimal(8, 2)), 288175, 54601312500, CAST(3789.00 AS Decimal(8, 2)), CAST(3789.72 AS Decimal(8, 2)), 28711, N'DOLQ19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (542, CAST(N'2017-07-31' AS Date), CAST(3164.50 AS Decimal(8, 2)), CAST(3147.00 AS Decimal(8, 2)), CAST(3164.50 AS Decimal(8, 2)), CAST(3134.50 AS Decimal(8, 2)), 292975, 46111924000, CAST(3147.00 AS Decimal(8, 2)), CAST(3136.66 AS Decimal(8, 2)), 34188, N'DOLU17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (541, CAST(N'2017-08-01' AS Date), CAST(3143.00 AS Decimal(8, 2)), CAST(3145.00 AS Decimal(8, 2)), CAST(3149.00 AS Decimal(8, 2)), CAST(3126.50 AS Decimal(8, 2)), 245480, 38502185250, CAST(3136.00 AS Decimal(8, 2)), CAST(3137.05 AS Decimal(8, 2)), 28817, N'DOLU17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (540, CAST(N'2017-08-02' AS Date), CAST(3150.50 AS Decimal(8, 2)), CAST(3131.50 AS Decimal(8, 2)), CAST(3156.00 AS Decimal(8, 2)), CAST(3131.00 AS Decimal(8, 2)), 261580, 41091277375, CAST(3141.00 AS Decimal(8, 2)), CAST(3134.86 AS Decimal(8, 2)), 30898, N'DOLU17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (539, CAST(N'2017-08-03' AS Date), CAST(3134.50 AS Decimal(8, 2)), CAST(3130.00 AS Decimal(8, 2)), CAST(3144.00 AS Decimal(8, 2)), CAST(3128.00 AS Decimal(8, 2)), 234350, 36743903000, CAST(3135.00 AS Decimal(8, 2)), CAST(3136.92 AS Decimal(8, 2)), 26944, N'DOLU17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (538, CAST(N'2017-08-04' AS Date), CAST(3126.00 AS Decimal(8, 2)), CAST(3147.00 AS Decimal(8, 2)), CAST(3149.50 AS Decimal(8, 2)), CAST(3125.00 AS Decimal(8, 2)), 260465, 40862468000, CAST(3137.00 AS Decimal(8, 2)), CAST(3141.36 AS Decimal(8, 2)), 29523, N'DOLU17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (537, CAST(N'2017-08-07' AS Date), CAST(3147.00 AS Decimal(8, 2)), CAST(3141.00 AS Decimal(8, 2)), CAST(3149.50 AS Decimal(8, 2)), CAST(3135.50 AS Decimal(8, 2)), 165205, 25954682000, CAST(3142.00 AS Decimal(8, 2)), CAST(3137.06 AS Decimal(8, 2)), 20116, N'DOLU17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (536, CAST(N'2017-08-08' AS Date), CAST(3137.50 AS Decimal(8, 2)), CAST(3141.50 AS Decimal(8, 2)), CAST(3151.50 AS Decimal(8, 2)), CAST(3134.00 AS Decimal(8, 2)), 237965, 37397119500, CAST(3143.00 AS Decimal(8, 2)), CAST(3136.51 AS Decimal(8, 2)), 26665, N'DOLU17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (535, CAST(N'2017-08-09' AS Date), CAST(3152.50 AS Decimal(8, 2)), CAST(3169.00 AS Decimal(8, 2)), CAST(3172.00 AS Decimal(8, 2)), CAST(3148.50 AS Decimal(8, 2)), 285175, 45059600375, CAST(3160.00 AS Decimal(8, 2)), CAST(3163.58 AS Decimal(8, 2)), 33360, N'DOLU17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (534, CAST(N'2017-08-10' AS Date), CAST(3173.00 AS Decimal(8, 2)), CAST(3188.50 AS Decimal(8, 2)), CAST(3192.00 AS Decimal(8, 2)), CAST(3160.50 AS Decimal(8, 2)), 308765, 48969067000, CAST(3171.00 AS Decimal(8, 2)), CAST(3177.16 AS Decimal(8, 2)), 35417, N'DOLU17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (533, CAST(N'2017-08-11' AS Date), CAST(3185.00 AS Decimal(8, 2)), CAST(3205.50 AS Decimal(8, 2)), CAST(3231.50 AS Decimal(8, 2)), CAST(3168.00 AS Decimal(8, 2)), 349960, 55705314750, CAST(3183.00 AS Decimal(8, 2)), CAST(3177.86 AS Decimal(8, 2)), 39178, N'DOLU17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (532, CAST(N'2017-08-14' AS Date), CAST(3187.00 AS Decimal(8, 2)), CAST(3201.50 AS Decimal(8, 2)), CAST(3218.00 AS Decimal(8, 2)), CAST(3186.00 AS Decimal(8, 2)), 305045, 48814990375, CAST(3200.00 AS Decimal(8, 2)), CAST(3196.82 AS Decimal(8, 2)), 39306, N'DOLU17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (531, CAST(N'2017-08-15' AS Date), CAST(3208.00 AS Decimal(8, 2)), CAST(3180.50 AS Decimal(8, 2)), CAST(3217.50 AS Decimal(8, 2)), CAST(3177.00 AS Decimal(8, 2)), 253305, 40572646250, CAST(3203.00 AS Decimal(8, 2)), CAST(3200.45 AS Decimal(8, 2)), 31839, N'DOLU17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (530, CAST(N'2017-08-16' AS Date), CAST(3177.00 AS Decimal(8, 2)), CAST(3163.00 AS Decimal(8, 2)), CAST(3188.00 AS Decimal(8, 2)), CAST(3155.50 AS Decimal(8, 2)), 277505, 44046708875, CAST(3174.00 AS Decimal(8, 2)), CAST(3164.05 AS Decimal(8, 2)), 32348, N'DOLU17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (529, CAST(N'2017-08-17' AS Date), CAST(3169.00 AS Decimal(8, 2)), CAST(3184.50 AS Decimal(8, 2)), CAST(3191.50 AS Decimal(8, 2)), CAST(3166.00 AS Decimal(8, 2)), 287725, 45692311250, CAST(3176.00 AS Decimal(8, 2)), CAST(3183.39 AS Decimal(8, 2)), 33109, N'DOLU17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (528, CAST(N'2017-08-18' AS Date), CAST(3180.00 AS Decimal(8, 2)), CAST(3155.50 AS Decimal(8, 2)), CAST(3184.00 AS Decimal(8, 2)), CAST(3151.00 AS Decimal(8, 2)), 258305, 40921647375, CAST(3168.00 AS Decimal(8, 2)), CAST(3154.50 AS Decimal(8, 2)), 31063, N'DOLU17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (527, CAST(N'2017-08-21' AS Date), CAST(3156.50 AS Decimal(8, 2)), CAST(3171.50 AS Decimal(8, 2)), CAST(3180.00 AS Decimal(8, 2)), CAST(3144.00 AS Decimal(8, 2)), 238705, 37711327625, CAST(3159.00 AS Decimal(8, 2)), CAST(3173.49 AS Decimal(8, 2)), 29279, N'DOLU17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (526, CAST(N'2017-08-22' AS Date), CAST(3161.50 AS Decimal(8, 2)), CAST(3168.50 AS Decimal(8, 2)), CAST(3197.00 AS Decimal(8, 2)), CAST(3152.50 AS Decimal(8, 2)), 270185, 42776326250, CAST(3166.00 AS Decimal(8, 2)), CAST(3169.40 AS Decimal(8, 2)), 32106, N'DOLU17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (525, CAST(N'2017-08-23' AS Date), CAST(3174.50 AS Decimal(8, 2)), CAST(3146.00 AS Decimal(8, 2)), CAST(3176.00 AS Decimal(8, 2)), CAST(3139.00 AS Decimal(8, 2)), 232060, 36624171750, CAST(3156.00 AS Decimal(8, 2)), CAST(3143.61 AS Decimal(8, 2)), 27302, N'DOLU17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (524, CAST(N'2017-08-24' AS Date), CAST(3147.50 AS Decimal(8, 2)), CAST(3152.00 AS Decimal(8, 2)), CAST(3154.00 AS Decimal(8, 2)), CAST(3137.00 AS Decimal(8, 2)), 225320, 35437719375, CAST(3145.00 AS Decimal(8, 2)), CAST(3147.43 AS Decimal(8, 2)), 25387, N'DOLU17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (523, CAST(N'2017-08-25' AS Date), CAST(3143.50 AS Decimal(8, 2)), CAST(3164.00 AS Decimal(8, 2)), CAST(3166.00 AS Decimal(8, 2)), CAST(3139.50 AS Decimal(8, 2)), 305755, 48187267875, CAST(3152.00 AS Decimal(8, 2)), CAST(3157.25 AS Decimal(8, 2)), 33621, N'DOLU17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (522, CAST(N'2017-08-28' AS Date), CAST(3157.50 AS Decimal(8, 2)), CAST(3170.00 AS Decimal(8, 2)), CAST(3170.00 AS Decimal(8, 2)), CAST(3151.50 AS Decimal(8, 2)), 187050, 29553334875, CAST(3159.00 AS Decimal(8, 2)), CAST(3159.95 AS Decimal(8, 2)), 21237, N'DOLU17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (521, CAST(N'2017-08-29' AS Date), CAST(3162.50 AS Decimal(8, 2)), CAST(3166.50 AS Decimal(8, 2)), CAST(3178.00 AS Decimal(8, 2)), CAST(3160.00 AS Decimal(8, 2)), 252140, 39955344500, CAST(3169.00 AS Decimal(8, 2)), CAST(3165.13 AS Decimal(8, 2)), 27934, N'DOLU17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (520, CAST(N'2017-08-30' AS Date), CAST(3169.00 AS Decimal(8, 2)), CAST(3162.00 AS Decimal(8, 2)), CAST(3175.50 AS Decimal(8, 2)), CAST(3157.00 AS Decimal(8, 2)), 283800, 44923228000, CAST(3165.00 AS Decimal(8, 2)), CAST(3161.81 AS Decimal(8, 2)), 29865, N'DOLU17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (322, CAST(N'2018-07-31' AS Date), CAST(3738.50 AS Decimal(8, 2)), CAST(3768.00 AS Decimal(8, 2)), CAST(3777.00 AS Decimal(8, 2)), CAST(3737.00 AS Decimal(8, 2)), 351950, 66268777500, CAST(3765.00 AS Decimal(8, 2)), CAST(3768.85 AS Decimal(8, 2)), 37867, N'DOLU18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (321, CAST(N'2018-08-01' AS Date), CAST(3767.00 AS Decimal(8, 2)), CAST(3762.00 AS Decimal(8, 2)), CAST(3782.50 AS Decimal(8, 2)), CAST(3743.50 AS Decimal(8, 2)), 290080, 54579298625, CAST(3763.00 AS Decimal(8, 2)), CAST(3765.45 AS Decimal(8, 2)), 29609, N'DOLU18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (320, CAST(N'2018-08-02' AS Date), CAST(3789.00 AS Decimal(8, 2)), CAST(3763.00 AS Decimal(8, 2)), CAST(3794.50 AS Decimal(8, 2)), CAST(3762.00 AS Decimal(8, 2)), 247465, 46742806500, CAST(3777.00 AS Decimal(8, 2)), CAST(3772.66 AS Decimal(8, 2)), 27192, N'DOLU18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (319, CAST(N'2018-08-03' AS Date), CAST(3757.00 AS Decimal(8, 2)), CAST(3719.00 AS Decimal(8, 2)), CAST(3762.50 AS Decimal(8, 2)), CAST(3712.00 AS Decimal(8, 2)), 332630, 62085332875, CAST(3733.00 AS Decimal(8, 2)), CAST(3719.38 AS Decimal(8, 2)), 33906, N'DOLU18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (318, CAST(N'2018-08-06' AS Date), CAST(3711.50 AS Decimal(8, 2)), CAST(3748.50 AS Decimal(8, 2)), CAST(3748.50 AS Decimal(8, 2)), CAST(3702.50 AS Decimal(8, 2)), 205680, 38386226125, CAST(3732.00 AS Decimal(8, 2)), CAST(3739.76 AS Decimal(8, 2)), 22933, N'DOLU18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (317, CAST(N'2018-08-07' AS Date), CAST(3727.50 AS Decimal(8, 2)), CAST(3762.50 AS Decimal(8, 2)), CAST(3782.50 AS Decimal(8, 2)), CAST(3713.50 AS Decimal(8, 2)), 374075, 70035454000, CAST(3744.00 AS Decimal(8, 2)), CAST(3771.13 AS Decimal(8, 2)), 39418, N'DOLU18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (316, CAST(N'2018-08-08' AS Date), CAST(3770.00 AS Decimal(8, 2)), CAST(3781.50 AS Decimal(8, 2)), CAST(3783.00 AS Decimal(8, 2)), CAST(3745.00 AS Decimal(8, 2)), 308270, 58041386000, CAST(3765.00 AS Decimal(8, 2)), CAST(3775.06 AS Decimal(8, 2)), 33829, N'DOLU18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (315, CAST(N'2018-08-09' AS Date), CAST(3799.50 AS Decimal(8, 2)), CAST(3811.00 AS Decimal(8, 2)), CAST(3830.00 AS Decimal(8, 2)), CAST(3786.50 AS Decimal(8, 2)), 352375, 67129453750, CAST(3810.00 AS Decimal(8, 2)), CAST(3811.15 AS Decimal(8, 2)), 38975, N'DOLU18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (314, CAST(N'2018-08-10' AS Date), CAST(3844.50 AS Decimal(8, 2)), CAST(3868.00 AS Decimal(8, 2)), CAST(3883.00 AS Decimal(8, 2)), CAST(3834.00 AS Decimal(8, 2)), 411900, 79558889625, CAST(3863.00 AS Decimal(8, 2)), CAST(3879.46 AS Decimal(8, 2)), 46976, N'DOLU18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (313, CAST(N'2018-08-13' AS Date), CAST(3901.50 AS Decimal(8, 2)), CAST(3892.50 AS Decimal(8, 2)), CAST(3938.00 AS Decimal(8, 2)), CAST(3887.00 AS Decimal(8, 2)), 452735, 88532191500, CAST(3910.00 AS Decimal(8, 2)), CAST(3922.88 AS Decimal(8, 2)), 51992, N'DOLU18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (312, CAST(N'2018-08-14' AS Date), CAST(3869.00 AS Decimal(8, 2)), CAST(3874.50 AS Decimal(8, 2)), CAST(3911.00 AS Decimal(8, 2)), CAST(3867.00 AS Decimal(8, 2)), 391210, 76008758375, CAST(3885.00 AS Decimal(8, 2)), CAST(3878.66 AS Decimal(8, 2)), 45403, N'DOLU18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (311, CAST(N'2018-08-15' AS Date), CAST(3907.00 AS Decimal(8, 2)), CAST(3910.00 AS Decimal(8, 2)), CAST(3935.00 AS Decimal(8, 2)), CAST(3886.50 AS Decimal(8, 2)), 471720, 92275566500, CAST(3912.00 AS Decimal(8, 2)), CAST(3906.25 AS Decimal(8, 2)), 51356, N'DOLU18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (310, CAST(N'2018-08-16' AS Date), CAST(3893.50 AS Decimal(8, 2)), CAST(3913.50 AS Decimal(8, 2)), CAST(3933.00 AS Decimal(8, 2)), CAST(3874.50 AS Decimal(8, 2)), 407975, 79526723500, CAST(3898.00 AS Decimal(8, 2)), CAST(3911.21 AS Decimal(8, 2)), 44383, N'DOLU18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (309, CAST(N'2018-08-17' AS Date), CAST(3938.00 AS Decimal(8, 2)), CAST(3919.00 AS Decimal(8, 2)), CAST(3959.50 AS Decimal(8, 2)), CAST(3915.50 AS Decimal(8, 2)), 403000, 79427276000, CAST(3941.00 AS Decimal(8, 2)), CAST(3929.97 AS Decimal(8, 2)), 44319, N'DOLU18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (308, CAST(N'2018-08-20' AS Date), CAST(3923.50 AS Decimal(8, 2)), CAST(3973.50 AS Decimal(8, 2)), CAST(3977.50 AS Decimal(8, 2)), CAST(3920.00 AS Decimal(8, 2)), 299075, 59140829125, CAST(3954.00 AS Decimal(8, 2)), CAST(3966.51 AS Decimal(8, 2)), 34916, N'DOLU18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (307, CAST(N'2018-08-21' AS Date), CAST(3963.00 AS Decimal(8, 2)), CAST(4055.00 AS Decimal(8, 2)), CAST(4057.50 AS Decimal(8, 2)), CAST(3960.50 AS Decimal(8, 2)), 482260, 96479605375, CAST(4001.00 AS Decimal(8, 2)), CAST(4026.74 AS Decimal(8, 2)), 53765, N'DOLU18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (306, CAST(N'2018-08-22' AS Date), CAST(4050.00 AS Decimal(8, 2)), CAST(4045.00 AS Decimal(8, 2)), CAST(4095.00 AS Decimal(8, 2)), CAST(4036.00 AS Decimal(8, 2)), 496030, 100994149375, CAST(4072.00 AS Decimal(8, 2)), CAST(4065.50 AS Decimal(8, 2)), 57111, N'DOLU18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (305, CAST(N'2018-08-23' AS Date), CAST(4069.50 AS Decimal(8, 2)), CAST(4118.00 AS Decimal(8, 2)), CAST(4132.00 AS Decimal(8, 2)), CAST(4044.50 AS Decimal(8, 2)), 430325, 88010134500, CAST(4090.00 AS Decimal(8, 2)), CAST(4119.78 AS Decimal(8, 2)), 50929, N'DOLU18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (304, CAST(N'2018-08-24' AS Date), CAST(4097.00 AS Decimal(8, 2)), CAST(4107.50 AS Decimal(8, 2)), CAST(4136.50 AS Decimal(8, 2)), CAST(4077.00 AS Decimal(8, 2)), 418575, 85798352125, CAST(4099.00 AS Decimal(8, 2)), CAST(4110.45 AS Decimal(8, 2)), 46308, N'DOLU18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (303, CAST(N'2018-08-27' AS Date), CAST(4111.50 AS Decimal(8, 2)), CAST(4083.50 AS Decimal(8, 2)), CAST(4119.50 AS Decimal(8, 2)), CAST(4052.50 AS Decimal(8, 2)), 299895, 61184983875, CAST(4080.00 AS Decimal(8, 2)), CAST(4082.34 AS Decimal(8, 2)), 35180, N'DOLU18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (302, CAST(N'2018-08-28' AS Date), CAST(4075.00 AS Decimal(8, 2)), CAST(4142.50 AS Decimal(8, 2)), CAST(4150.00 AS Decimal(8, 2)), CAST(4066.50 AS Decimal(8, 2)), 389940, 80389758000, CAST(4123.00 AS Decimal(8, 2)), CAST(4136.68 AS Decimal(8, 2)), 45877, N'DOLU18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (301, CAST(N'2018-08-29' AS Date), CAST(4166.00 AS Decimal(8, 2)), CAST(4110.00 AS Decimal(8, 2)), CAST(4167.00 AS Decimal(8, 2)), CAST(4106.50 AS Decimal(8, 2)), 411405, 85080153750, CAST(4136.00 AS Decimal(8, 2)), CAST(4128.25 AS Decimal(8, 2)), 47014, N'DOLU18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (300, CAST(N'2018-08-30' AS Date), CAST(4123.50 AS Decimal(8, 2)), CAST(4150.00 AS Decimal(8, 2)), CAST(4215.50 AS Decimal(8, 2)), CAST(4120.50 AS Decimal(8, 2)), 566850, 118037238750, CAST(4164.00 AS Decimal(8, 2)), CAST(4171.66 AS Decimal(8, 2)), 63258, N'DOLU18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (77, CAST(N'2019-07-31' AS Date), CAST(3791.00 AS Decimal(8, 2)), CAST(3821.50 AS Decimal(8, 2)), CAST(3832.00 AS Decimal(8, 2)), CAST(3757.00 AS Decimal(8, 2)), 754215, 142689456875, CAST(3783.00 AS Decimal(8, 2)), CAST(3814.61 AS Decimal(8, 2)), 74747, N'DOLU19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (76, CAST(N'2019-08-01' AS Date), CAST(3834.00 AS Decimal(8, 2)), CAST(3847.50 AS Decimal(8, 2)), CAST(3870.00 AS Decimal(8, 2)), CAST(3820.00 AS Decimal(8, 2)), 498170, 95685763000, CAST(3841.00 AS Decimal(8, 2)), CAST(3852.05 AS Decimal(8, 2)), 55094, N'DOLU19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (75, CAST(N'2019-08-02' AS Date), CAST(3860.00 AS Decimal(8, 2)), CAST(3894.00 AS Decimal(8, 2)), CAST(3901.50 AS Decimal(8, 2)), CAST(3857.00 AS Decimal(8, 2)), 461685, 89684088375, CAST(3885.00 AS Decimal(8, 2)), CAST(3893.03 AS Decimal(8, 2)), 50650, N'DOLU19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (74, CAST(N'2019-08-05' AS Date), CAST(3935.00 AS Decimal(8, 2)), CAST(3983.00 AS Decimal(8, 2)), CAST(3987.00 AS Decimal(8, 2)), CAST(3922.00 AS Decimal(8, 2)), 502130, 99235498250, CAST(3952.00 AS Decimal(8, 2)), CAST(3967.38 AS Decimal(8, 2)), 57802, N'DOLU19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (73, CAST(N'2019-08-06' AS Date), CAST(3950.50 AS Decimal(8, 2)), CAST(3968.00 AS Decimal(8, 2)), CAST(3994.00 AS Decimal(8, 2)), CAST(3945.00 AS Decimal(8, 2)), 419700, 83316565250, CAST(3970.00 AS Decimal(8, 2)), CAST(3969.80 AS Decimal(8, 2)), 50020, N'DOLU19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (72, CAST(N'2019-08-07' AS Date), CAST(3952.00 AS Decimal(8, 2)), CAST(3976.00 AS Decimal(8, 2)), CAST(4000.00 AS Decimal(8, 2)), CAST(3952.00 AS Decimal(8, 2)), 465365, 92765577250, CAST(3986.00 AS Decimal(8, 2)), CAST(3986.28 AS Decimal(8, 2)), 54088, N'DOLU19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (71, CAST(N'2019-08-08' AS Date), CAST(3969.50 AS Decimal(8, 2)), CAST(3927.00 AS Decimal(8, 2)), CAST(3975.00 AS Decimal(8, 2)), CAST(3926.00 AS Decimal(8, 2)), 373265, 73646786375, CAST(3946.00 AS Decimal(8, 2)), CAST(3933.34 AS Decimal(8, 2)), 46539, N'DOLU19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (70, CAST(N'2019-08-09' AS Date), CAST(3939.00 AS Decimal(8, 2)), CAST(3948.00 AS Decimal(8, 2)), CAST(3957.50 AS Decimal(8, 2)), CAST(3930.00 AS Decimal(8, 2)), 381470, 75246893500, CAST(3945.00 AS Decimal(8, 2)), CAST(3950.29 AS Decimal(8, 2)), 42269, N'DOLU19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (69, CAST(N'2019-08-12' AS Date), CAST(4006.00 AS Decimal(8, 2)), CAST(3992.00 AS Decimal(8, 2)), CAST(4020.00 AS Decimal(8, 2)), CAST(3981.00 AS Decimal(8, 2)), 419280, 83831646625, CAST(3998.00 AS Decimal(8, 2)), CAST(3988.26 AS Decimal(8, 2)), 47531, N'DOLU19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (68, CAST(N'2019-08-13' AS Date), CAST(3995.00 AS Decimal(8, 2)), CAST(3967.50 AS Decimal(8, 2)), CAST(4019.00 AS Decimal(8, 2)), CAST(3952.00 AS Decimal(8, 2)), 530805, 105564150125, CAST(3977.00 AS Decimal(8, 2)), CAST(3966.33 AS Decimal(8, 2)), 64258, N'DOLU19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (67, CAST(N'2019-08-14' AS Date), CAST(4000.00 AS Decimal(8, 2)), CAST(4058.00 AS Decimal(8, 2)), CAST(4059.50 AS Decimal(8, 2)), CAST(3993.00 AS Decimal(8, 2)), 506155, 101801550250, CAST(4022.00 AS Decimal(8, 2)), CAST(4044.23 AS Decimal(8, 2)), 58616, N'DOLU19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (66, CAST(N'2019-08-15' AS Date), CAST(4022.00 AS Decimal(8, 2)), CAST(3997.50 AS Decimal(8, 2)), CAST(4050.00 AS Decimal(8, 2)), CAST(3986.00 AS Decimal(8, 2)), 566000, 113770563250, CAST(4020.00 AS Decimal(8, 2)), CAST(3997.92 AS Decimal(8, 2)), 66870, N'DOLU19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (65, CAST(N'2019-08-16' AS Date), CAST(3985.00 AS Decimal(8, 2)), CAST(4011.00 AS Decimal(8, 2)), CAST(4013.00 AS Decimal(8, 2)), CAST(3981.00 AS Decimal(8, 2)), 326010, 65180401375, CAST(3998.00 AS Decimal(8, 2)), CAST(4004.09 AS Decimal(8, 2)), 40147, N'DOLU19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (64, CAST(N'2019-08-19' AS Date), CAST(4001.50 AS Decimal(8, 2)), CAST(4079.00 AS Decimal(8, 2)), CAST(4080.00 AS Decimal(8, 2)), CAST(3995.50 AS Decimal(8, 2)), 393135, 79496477750, CAST(4044.00 AS Decimal(8, 2)), CAST(4070.13 AS Decimal(8, 2)), 51156, N'DOLU19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (63, CAST(N'2019-08-20' AS Date), CAST(4070.00 AS Decimal(8, 2)), CAST(4056.50 AS Decimal(8, 2)), CAST(4078.00 AS Decimal(8, 2)), CAST(4030.00 AS Decimal(8, 2)), 439905, 89087640875, CAST(4050.00 AS Decimal(8, 2)), CAST(4044.83 AS Decimal(8, 2)), 55499, N'DOLU19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (62, CAST(N'2019-08-21' AS Date), CAST(4031.00 AS Decimal(8, 2)), CAST(4028.50 AS Decimal(8, 2)), CAST(4042.00 AS Decimal(8, 2)), CAST(4017.50 AS Decimal(8, 2)), 377595, 76069433000, CAST(4029.00 AS Decimal(8, 2)), CAST(4029.28 AS Decimal(8, 2)), 45890, N'DOLU19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (61, CAST(N'2019-08-22' AS Date), CAST(4035.00 AS Decimal(8, 2)), CAST(4072.00 AS Decimal(8, 2)), CAST(4084.00 AS Decimal(8, 2)), CAST(4020.00 AS Decimal(8, 2)), 429315, 87018294125, CAST(4053.00 AS Decimal(8, 2)), CAST(4070.60 AS Decimal(8, 2)), 49530, N'DOLU19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (60, CAST(N'2019-08-23' AS Date), CAST(4080.50 AS Decimal(8, 2)), CAST(4123.00 AS Decimal(8, 2)), CAST(4133.00 AS Decimal(8, 2)), CAST(4052.00 AS Decimal(8, 2)), 631285, 129296734375, CAST(4096.00 AS Decimal(8, 2)), CAST(4117.38 AS Decimal(8, 2)), 74322, N'DOLU19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (59, CAST(N'2019-08-26' AS Date), CAST(4108.00 AS Decimal(8, 2)), CAST(4155.50 AS Decimal(8, 2)), CAST(4170.00 AS Decimal(8, 2)), CAST(4102.50 AS Decimal(8, 2)), 443230, 91773309500, CAST(4141.00 AS Decimal(8, 2)), CAST(4151.19 AS Decimal(8, 2)), 52777, N'DOLU19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (58, CAST(N'2019-08-27' AS Date), CAST(4151.00 AS Decimal(8, 2)), CAST(4127.50 AS Decimal(8, 2)), CAST(4195.00 AS Decimal(8, 2)), CAST(4121.50 AS Decimal(8, 2)), 610930, 126778918000, CAST(4150.00 AS Decimal(8, 2)), CAST(4146.95 AS Decimal(8, 2)), 67997, N'DOLU19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (57, CAST(N'2019-08-28' AS Date), CAST(4145.00 AS Decimal(8, 2)), CAST(4169.50 AS Decimal(8, 2)), CAST(4169.50 AS Decimal(8, 2)), CAST(4130.50 AS Decimal(8, 2)), 357275, 74221780500, CAST(4154.00 AS Decimal(8, 2)), CAST(4160.61 AS Decimal(8, 2)), 39625, N'DOLU19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (56, CAST(N'2019-08-29' AS Date), CAST(4158.50 AS Decimal(8, 2)), CAST(4169.50 AS Decimal(8, 2)), CAST(4177.50 AS Decimal(8, 2)), CAST(4143.50 AS Decimal(8, 2)), 453130, 94289916500, CAST(4161.00 AS Decimal(8, 2)), CAST(4159.60 AS Decimal(8, 2)), 48978, N'DOLU19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (519, CAST(N'2017-08-31' AS Date), CAST(3182.00 AS Decimal(8, 2)), CAST(3160.50 AS Decimal(8, 2)), CAST(3183.50 AS Decimal(8, 2)), CAST(3151.00 AS Decimal(8, 2)), 376000, 59453999250, CAST(3162.00 AS Decimal(8, 2)), CAST(3161.17 AS Decimal(8, 2)), 40078, N'DOLV17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (518, CAST(N'2017-09-01' AS Date), CAST(3153.00 AS Decimal(8, 2)), CAST(3153.50 AS Decimal(8, 2)), CAST(3159.00 AS Decimal(8, 2)), CAST(3134.00 AS Decimal(8, 2)), 286725, 45102908000, CAST(3146.00 AS Decimal(8, 2)), CAST(3153.64 AS Decimal(8, 2)), 32880, N'DOLV17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (517, CAST(N'2017-09-04' AS Date), CAST(3155.00 AS Decimal(8, 2)), CAST(3152.50 AS Decimal(8, 2)), CAST(3156.50 AS Decimal(8, 2)), CAST(3144.00 AS Decimal(8, 2)), 114255, 17990900000, CAST(3149.00 AS Decimal(8, 2)), CAST(3146.13 AS Decimal(8, 2)), 10796, N'DOLV17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (516, CAST(N'2017-09-05' AS Date), CAST(3127.50 AS Decimal(8, 2)), CAST(3127.50 AS Decimal(8, 2)), CAST(3138.00 AS Decimal(8, 2)), CAST(3122.50 AS Decimal(8, 2)), 310230, 48552423875, CAST(3130.00 AS Decimal(8, 2)), CAST(3129.88 AS Decimal(8, 2)), 33047, N'DOLV17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (515, CAST(N'2017-09-06' AS Date), CAST(3124.00 AS Decimal(8, 2)), CAST(3108.50 AS Decimal(8, 2)), CAST(3128.50 AS Decimal(8, 2)), CAST(3108.00 AS Decimal(8, 2)), 289040, 45091517125, CAST(3120.00 AS Decimal(8, 2)), CAST(3112.15 AS Decimal(8, 2)), 30847, N'DOLV17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (514, CAST(N'2017-09-08' AS Date), CAST(3094.00 AS Decimal(8, 2)), CAST(3096.00 AS Decimal(8, 2)), CAST(3108.00 AS Decimal(8, 2)), CAST(3090.50 AS Decimal(8, 2)), 238720, 36983567000, CAST(3098.00 AS Decimal(8, 2)), CAST(3098.17 AS Decimal(8, 2)), 24214, N'DOLV17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (513, CAST(N'2017-09-11' AS Date), CAST(3098.50 AS Decimal(8, 2)), CAST(3110.00 AS Decimal(8, 2)), CAST(3115.00 AS Decimal(8, 2)), CAST(3086.50 AS Decimal(8, 2)), 278920, 43191016500, CAST(3097.00 AS Decimal(8, 2)), CAST(3106.09 AS Decimal(8, 2)), 29696, N'DOLV17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (512, CAST(N'2017-09-12' AS Date), CAST(3114.00 AS Decimal(8, 2)), CAST(3131.50 AS Decimal(8, 2)), CAST(3143.50 AS Decimal(8, 2)), CAST(3111.50 AS Decimal(8, 2)), 329165, 51440944125, CAST(3125.00 AS Decimal(8, 2)), CAST(3140.62 AS Decimal(8, 2)), 37982, N'DOLV17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (511, CAST(N'2017-09-13' AS Date), CAST(3133.00 AS Decimal(8, 2)), CAST(3141.50 AS Decimal(8, 2)), CAST(3149.00 AS Decimal(8, 2)), CAST(3128.50 AS Decimal(8, 2)), 281280, 44157103375, CAST(3139.00 AS Decimal(8, 2)), CAST(3141.39 AS Decimal(8, 2)), 31361, N'DOLV17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (510, CAST(N'2017-09-14' AS Date), CAST(3146.00 AS Decimal(8, 2)), CAST(3126.00 AS Decimal(8, 2)), CAST(3156.50 AS Decimal(8, 2)), CAST(3119.50 AS Decimal(8, 2)), 381185, 59817728250, CAST(3138.00 AS Decimal(8, 2)), CAST(3128.56 AS Decimal(8, 2)), 39250, N'DOLV17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (509, CAST(N'2017-09-15' AS Date), CAST(3136.00 AS Decimal(8, 2)), CAST(3118.50 AS Decimal(8, 2)), CAST(3139.00 AS Decimal(8, 2)), CAST(3117.50 AS Decimal(8, 2)), 338440, 52964732750, CAST(3129.00 AS Decimal(8, 2)), CAST(3124.12 AS Decimal(8, 2)), 33005, N'DOLV17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (508, CAST(N'2017-09-18' AS Date), CAST(3117.00 AS Decimal(8, 2)), CAST(3143.00 AS Decimal(8, 2)), CAST(3145.00 AS Decimal(8, 2)), CAST(3115.50 AS Decimal(8, 2)), 256685, 40195411250, CAST(3131.00 AS Decimal(8, 2)), CAST(3138.75 AS Decimal(8, 2)), 26628, N'DOLV17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (507, CAST(N'2017-09-19' AS Date), CAST(3137.00 AS Decimal(8, 2)), CAST(3140.50 AS Decimal(8, 2)), CAST(3145.50 AS Decimal(8, 2)), CAST(3131.00 AS Decimal(8, 2)), 223735, 35106134375, CAST(3138.00 AS Decimal(8, 2)), CAST(3139.65 AS Decimal(8, 2)), 25349, N'DOLV17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (506, CAST(N'2017-09-20' AS Date), CAST(3132.00 AS Decimal(8, 2)), CAST(3137.00 AS Decimal(8, 2)), CAST(3144.00 AS Decimal(8, 2)), CAST(3119.00 AS Decimal(8, 2)), 376080, 58904212750, CAST(3132.00 AS Decimal(8, 2)), CAST(3136.26 AS Decimal(8, 2)), 39805, N'DOLV17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (505, CAST(N'2017-09-21' AS Date), CAST(3146.00 AS Decimal(8, 2)), CAST(3142.00 AS Decimal(8, 2)), CAST(3151.00 AS Decimal(8, 2)), CAST(3130.00 AS Decimal(8, 2)), 321880, 50549160250, CAST(3140.00 AS Decimal(8, 2)), CAST(3147.13 AS Decimal(8, 2)), 33647, N'DOLV17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (504, CAST(N'2017-09-22' AS Date), CAST(3135.00 AS Decimal(8, 2)), CAST(3128.00 AS Decimal(8, 2)), CAST(3140.50 AS Decimal(8, 2)), CAST(3125.00 AS Decimal(8, 2)), 234965, 36788782500, CAST(3131.00 AS Decimal(8, 2)), CAST(3129.41 AS Decimal(8, 2)), 24206, N'DOLV17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (503, CAST(N'2017-09-25' AS Date), CAST(3135.50 AS Decimal(8, 2)), CAST(3161.00 AS Decimal(8, 2)), CAST(3163.50 AS Decimal(8, 2)), CAST(3128.50 AS Decimal(8, 2)), 310720, 48902952375, CAST(3147.00 AS Decimal(8, 2)), CAST(3154.57 AS Decimal(8, 2)), 36405, N'DOLV17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (502, CAST(N'2017-09-26' AS Date), CAST(3167.00 AS Decimal(8, 2)), CAST(3168.50 AS Decimal(8, 2)), CAST(3176.00 AS Decimal(8, 2)), CAST(3154.00 AS Decimal(8, 2)), 359930, 56998818625, CAST(3167.00 AS Decimal(8, 2)), CAST(3170.03 AS Decimal(8, 2)), 38512, N'DOLV17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (501, CAST(N'2017-09-27' AS Date), CAST(3187.00 AS Decimal(8, 2)), CAST(3193.50 AS Decimal(8, 2)), CAST(3199.50 AS Decimal(8, 2)), CAST(3180.50 AS Decimal(8, 2)), 389740, 62188213500, CAST(3191.00 AS Decimal(8, 2)), CAST(3189.63 AS Decimal(8, 2)), 43762, N'DOLV17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (500, CAST(N'2017-09-28' AS Date), CAST(3189.00 AS Decimal(8, 2)), CAST(3183.00 AS Decimal(8, 2)), CAST(3201.00 AS Decimal(8, 2)), CAST(3178.00 AS Decimal(8, 2)), 374630, 59699993625, CAST(3187.00 AS Decimal(8, 2)), CAST(3182.16 AS Decimal(8, 2)), 36536, N'DOLV17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (299, CAST(N'2018-08-31' AS Date), CAST(4180.00 AS Decimal(8, 2)), CAST(4063.50 AS Decimal(8, 2)), CAST(4188.00 AS Decimal(8, 2)), CAST(4063.50 AS Decimal(8, 2)), 511620, 105598245250, CAST(4128.00 AS Decimal(8, 2)), CAST(4075.79 AS Decimal(8, 2)), 57904, N'DOLV18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (298, CAST(N'2018-09-03' AS Date), CAST(4106.50 AS Decimal(8, 2)), CAST(4167.50 AS Decimal(8, 2)), CAST(4171.50 AS Decimal(8, 2)), CAST(4095.00 AS Decimal(8, 2)), 208525, 43163406250, CAST(4139.00 AS Decimal(8, 2)), CAST(4155.14 AS Decimal(8, 2)), 22735, N'DOLV18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (297, CAST(N'2018-09-04' AS Date), CAST(4201.00 AS Decimal(8, 2)), CAST(4171.00 AS Decimal(8, 2)), CAST(4204.50 AS Decimal(8, 2)), CAST(4148.00 AS Decimal(8, 2)), 420075, 87675995375, CAST(4174.00 AS Decimal(8, 2)), CAST(4167.12 AS Decimal(8, 2)), 49970, N'DOLV18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (296, CAST(N'2018-09-05' AS Date), CAST(4189.50 AS Decimal(8, 2)), CAST(4154.50 AS Decimal(8, 2)), CAST(4196.00 AS Decimal(8, 2)), CAST(4122.00 AS Decimal(8, 2)), 367845, 76542314125, CAST(4161.00 AS Decimal(8, 2)), CAST(4140.62 AS Decimal(8, 2)), 42874, N'DOLV18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (295, CAST(N'2018-09-06' AS Date), CAST(4144.00 AS Decimal(8, 2)), CAST(4069.00 AS Decimal(8, 2)), CAST(4174.00 AS Decimal(8, 2)), CAST(4045.50 AS Decimal(8, 2)), 419235, 86590446625, CAST(4130.00 AS Decimal(8, 2)), CAST(4128.01 AS Decimal(8, 2)), 48897, N'DOLV18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (294, CAST(N'2018-09-10' AS Date), CAST(4073.00 AS Decimal(8, 2)), CAST(4094.50 AS Decimal(8, 2)), CAST(4135.50 AS Decimal(8, 2)), CAST(4061.50 AS Decimal(8, 2)), 317205, 65095390625, CAST(4104.00 AS Decimal(8, 2)), CAST(4094.15 AS Decimal(8, 2)), 38727, N'DOLV18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (293, CAST(N'2018-09-11' AS Date), CAST(4144.50 AS Decimal(8, 2)), CAST(4159.00 AS Decimal(8, 2)), CAST(4185.50 AS Decimal(8, 2)), CAST(4140.00 AS Decimal(8, 2)), 344355, 71711135375, CAST(4164.00 AS Decimal(8, 2)), CAST(4164.32 AS Decimal(8, 2)), 39448, N'DOLV18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (292, CAST(N'2018-09-12' AS Date), CAST(4130.00 AS Decimal(8, 2)), CAST(4169.00 AS Decimal(8, 2)), CAST(4173.00 AS Decimal(8, 2)), CAST(4116.50 AS Decimal(8, 2)), 333350, 68951916000, CAST(4136.00 AS Decimal(8, 2)), CAST(4136.84 AS Decimal(8, 2)), 38183, N'DOLV18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (291, CAST(N'2018-09-13' AS Date), CAST(4151.00 AS Decimal(8, 2)), CAST(4214.00 AS Decimal(8, 2)), CAST(4215.50 AS Decimal(8, 2)), CAST(4132.00 AS Decimal(8, 2)), 389355, 81264154375, CAST(4174.00 AS Decimal(8, 2)), CAST(4196.52 AS Decimal(8, 2)), 43169, N'DOLV18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (290, CAST(N'2018-09-14' AS Date), CAST(4212.50 AS Decimal(8, 2)), CAST(4179.50 AS Decimal(8, 2)), CAST(4217.00 AS Decimal(8, 2)), CAST(4164.50 AS Decimal(8, 2)), 308055, 64477129250, CAST(4186.00 AS Decimal(8, 2)), CAST(4169.95 AS Decimal(8, 2)), 35584, N'DOLV18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (289, CAST(N'2018-09-17' AS Date), CAST(4191.00 AS Decimal(8, 2)), CAST(4139.50 AS Decimal(8, 2)), CAST(4208.50 AS Decimal(8, 2)), CAST(4121.50 AS Decimal(8, 2)), 318990, 66411259625, CAST(4163.00 AS Decimal(8, 2)), CAST(4141.21 AS Decimal(8, 2)), 36486, N'DOLV18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (288, CAST(N'2018-09-18' AS Date), CAST(4133.00 AS Decimal(8, 2)), CAST(4167.00 AS Decimal(8, 2)), CAST(4169.00 AS Decimal(8, 2)), CAST(4123.50 AS Decimal(8, 2)), 294445, 60955646625, CAST(4140.00 AS Decimal(8, 2)), CAST(4133.42 AS Decimal(8, 2)), 35038, N'DOLV18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (287, CAST(N'2018-09-19' AS Date), CAST(4177.00 AS Decimal(8, 2)), CAST(4130.00 AS Decimal(8, 2)), CAST(4180.00 AS Decimal(8, 2)), CAST(4103.00 AS Decimal(8, 2)), 308245, 63727172875, CAST(4134.00 AS Decimal(8, 2)), CAST(4130.70 AS Decimal(8, 2)), 35212, N'DOLV18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (286, CAST(N'2018-09-20' AS Date), CAST(4115.00 AS Decimal(8, 2)), CAST(4079.00 AS Decimal(8, 2)), CAST(4125.00 AS Decimal(8, 2)), CAST(4073.00 AS Decimal(8, 2)), 364420, 74657909750, CAST(4097.00 AS Decimal(8, 2)), CAST(4080.27 AS Decimal(8, 2)), 37575, N'DOLV18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (285, CAST(N'2018-09-21' AS Date), CAST(4085.00 AS Decimal(8, 2)), CAST(4054.00 AS Decimal(8, 2)), CAST(4098.00 AS Decimal(8, 2)), CAST(4030.50 AS Decimal(8, 2)), 387650, 78769541000, CAST(4063.00 AS Decimal(8, 2)), CAST(4044.10 AS Decimal(8, 2)), 40058, N'DOLV18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (284, CAST(N'2018-09-24' AS Date), CAST(4062.00 AS Decimal(8, 2)), CAST(4093.50 AS Decimal(8, 2)), CAST(4098.00 AS Decimal(8, 2)), CAST(4038.00 AS Decimal(8, 2)), 311470, 63379995875, CAST(4069.00 AS Decimal(8, 2)), CAST(4094.48 AS Decimal(8, 2)), 34209, N'DOLV18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (283, CAST(N'2018-09-25' AS Date), CAST(4126.00 AS Decimal(8, 2)), CAST(4077.00 AS Decimal(8, 2)), CAST(4142.50 AS Decimal(8, 2)), CAST(4068.50 AS Decimal(8, 2)), 400915, 82480130625, CAST(4114.00 AS Decimal(8, 2)), CAST(4082.90 AS Decimal(8, 2)), 40232, N'DOLV18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (282, CAST(N'2018-09-26' AS Date), CAST(4079.50 AS Decimal(8, 2)), CAST(4035.00 AS Decimal(8, 2)), CAST(4094.00 AS Decimal(8, 2)), CAST(4009.50 AS Decimal(8, 2)), 456230, 92349002625, CAST(4048.00 AS Decimal(8, 2)), CAST(4031.81 AS Decimal(8, 2)), 47011, N'DOLV18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (281, CAST(N'2018-09-27' AS Date), CAST(4040.00 AS Decimal(8, 2)), CAST(4014.50 AS Decimal(8, 2)), CAST(4055.00 AS Decimal(8, 2)), CAST(3966.50 AS Decimal(8, 2)), 585090, 117146814125, CAST(4004.00 AS Decimal(8, 2)), CAST(3993.94 AS Decimal(8, 2)), 46779, N'DOLV18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (55, CAST(N'2019-08-30' AS Date), CAST(4157.00 AS Decimal(8, 2)), CAST(4147.50 AS Decimal(8, 2)), CAST(4171.50 AS Decimal(8, 2)), CAST(4129.00 AS Decimal(8, 2)), 530860, 110096799375, CAST(4147.00 AS Decimal(8, 2)), CAST(4133.39 AS Decimal(8, 2)), 51673, N'DOLV19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (54, CAST(N'2019-09-02' AS Date), CAST(4151.00 AS Decimal(8, 2)), CAST(4193.00 AS Decimal(8, 2)), CAST(4196.00 AS Decimal(8, 2)), CAST(4148.00 AS Decimal(8, 2)), 164515, 34320723625, CAST(4172.00 AS Decimal(8, 2)), CAST(4187.54 AS Decimal(8, 2)), 18959, N'DOLV19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (53, CAST(N'2019-09-03' AS Date), CAST(4185.00 AS Decimal(8, 2)), CAST(4174.00 AS Decimal(8, 2)), CAST(4193.00 AS Decimal(8, 2)), CAST(4158.00 AS Decimal(8, 2)), 376690, 78682067000, CAST(4177.00 AS Decimal(8, 2)), CAST(4187.07 AS Decimal(8, 2)), 41848, N'DOLV19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (52, CAST(N'2019-09-04' AS Date), CAST(4142.50 AS Decimal(8, 2)), CAST(4101.00 AS Decimal(8, 2)), CAST(4159.50 AS Decimal(8, 2)), CAST(4096.00 AS Decimal(8, 2)), 367125, 75749357250, CAST(4126.00 AS Decimal(8, 2)), CAST(4108.34 AS Decimal(8, 2)), 41458, N'DOLV19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (51, CAST(N'2019-09-05' AS Date), CAST(4090.00 AS Decimal(8, 2)), CAST(4114.00 AS Decimal(8, 2)), CAST(4121.00 AS Decimal(8, 2)), CAST(4076.00 AS Decimal(8, 2)), 374555, 76679976250, CAST(4094.00 AS Decimal(8, 2)), CAST(4103.74 AS Decimal(8, 2)), 39880, N'DOLV19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (50, CAST(N'2019-09-06' AS Date), CAST(4102.00 AS Decimal(8, 2)), CAST(4068.50 AS Decimal(8, 2)), CAST(4103.50 AS Decimal(8, 2)), CAST(4060.50 AS Decimal(8, 2)), 343500, 69976394000, CAST(4074.00 AS Decimal(8, 2)), CAST(4080.88 AS Decimal(8, 2)), 36849, N'DOLV19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (49, CAST(N'2019-09-09' AS Date), CAST(4053.00 AS Decimal(8, 2)), CAST(4100.50 AS Decimal(8, 2)), CAST(4110.00 AS Decimal(8, 2)), CAST(4053.00 AS Decimal(8, 2)), 304050, 62128588750, CAST(4086.00 AS Decimal(8, 2)), CAST(4103.61 AS Decimal(8, 2)), 35405, N'DOLV19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (48, CAST(N'2019-09-10' AS Date), CAST(4099.00 AS Decimal(8, 2)), CAST(4086.50 AS Decimal(8, 2)), CAST(4135.00 AS Decimal(8, 2)), CAST(4084.50 AS Decimal(8, 2)), 396385, 81470021625, CAST(4110.00 AS Decimal(8, 2)), CAST(4101.65 AS Decimal(8, 2)), 45618, N'DOLV19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (47, CAST(N'2019-09-11' AS Date), CAST(4095.00 AS Decimal(8, 2)), CAST(4073.50 AS Decimal(8, 2)), CAST(4098.00 AS Decimal(8, 2)), CAST(4057.00 AS Decimal(8, 2)), 363505, 73968137625, CAST(4069.00 AS Decimal(8, 2)), CAST(4073.25 AS Decimal(8, 2)), 40739, N'DOLV19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (46, CAST(N'2019-09-12' AS Date), CAST(4049.50 AS Decimal(8, 2)), CAST(4063.50 AS Decimal(8, 2)), CAST(4075.00 AS Decimal(8, 2)), CAST(4031.50 AS Decimal(8, 2)), 478785, 97042773500, CAST(4053.00 AS Decimal(8, 2)), CAST(4062.24 AS Decimal(8, 2)), 50254, N'DOLV19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (45, CAST(N'2019-09-13' AS Date), CAST(4051.00 AS Decimal(8, 2)), CAST(4087.50 AS Decimal(8, 2)), CAST(4099.00 AS Decimal(8, 2)), CAST(4046.50 AS Decimal(8, 2)), 390990, 79580424000, CAST(4070.00 AS Decimal(8, 2)), CAST(4088.39 AS Decimal(8, 2)), 40371, N'DOLV19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (44, CAST(N'2019-09-16' AS Date), CAST(4095.00 AS Decimal(8, 2)), CAST(4084.50 AS Decimal(8, 2)), CAST(4109.00 AS Decimal(8, 2)), CAST(4078.50 AS Decimal(8, 2)), 248530, 50854695500, CAST(4092.00 AS Decimal(8, 2)), CAST(4094.01 AS Decimal(8, 2)), 29550, N'DOLV19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (43, CAST(N'2019-09-17' AS Date), CAST(4096.50 AS Decimal(8, 2)), CAST(4079.50 AS Decimal(8, 2)), CAST(4119.50 AS Decimal(8, 2)), CAST(4075.50 AS Decimal(8, 2)), 375970, 77029152375, CAST(4097.00 AS Decimal(8, 2)), CAST(4083.35 AS Decimal(8, 2)), 41336, N'DOLV19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (42, CAST(N'2019-09-18' AS Date), CAST(4080.00 AS Decimal(8, 2)), CAST(4114.00 AS Decimal(8, 2)), CAST(4117.00 AS Decimal(8, 2)), CAST(4075.00 AS Decimal(8, 2)), 356805, 73094876375, CAST(4097.00 AS Decimal(8, 2)), CAST(4102.94 AS Decimal(8, 2)), 40612, N'DOLV19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (41, CAST(N'2019-09-19' AS Date), CAST(4135.00 AS Decimal(8, 2)), CAST(4170.50 AS Decimal(8, 2)), CAST(4170.50 AS Decimal(8, 2)), CAST(4127.50 AS Decimal(8, 2)), 406630, 84251836125, CAST(4143.00 AS Decimal(8, 2)), CAST(4153.10 AS Decimal(8, 2)), 44627, N'DOLV19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (40, CAST(N'2019-09-20' AS Date), CAST(4163.00 AS Decimal(8, 2)), CAST(4151.00 AS Decimal(8, 2)), CAST(4186.00 AS Decimal(8, 2)), CAST(4147.50 AS Decimal(8, 2)), 406420, 84706500750, CAST(4168.00 AS Decimal(8, 2)), CAST(4161.54 AS Decimal(8, 2)), 43975, N'DOLV19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (39, CAST(N'2019-09-23' AS Date), CAST(4150.00 AS Decimal(8, 2)), CAST(4165.00 AS Decimal(8, 2)), CAST(4186.50 AS Decimal(8, 2)), CAST(4146.00 AS Decimal(8, 2)), 306495, 63955481750, CAST(4173.00 AS Decimal(8, 2)), CAST(4172.86 AS Decimal(8, 2)), 29792, N'DOLV19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (38, CAST(N'2019-09-24' AS Date), CAST(4155.50 AS Decimal(8, 2)), CAST(4164.00 AS Decimal(8, 2)), CAST(4185.50 AS Decimal(8, 2)), CAST(4153.50 AS Decimal(8, 2)), 314750, 65672958000, CAST(4173.00 AS Decimal(8, 2)), CAST(4170.70 AS Decimal(8, 2)), 36379, N'DOLV19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (37, CAST(N'2019-09-25' AS Date), CAST(4189.00 AS Decimal(8, 2)), CAST(4150.50 AS Decimal(8, 2)), CAST(4195.00 AS Decimal(8, 2)), CAST(4145.00 AS Decimal(8, 2)), 394455, 82386890500, CAST(4177.00 AS Decimal(8, 2)), CAST(4158.53 AS Decimal(8, 2)), 42076, N'DOLV19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (36, CAST(N'2019-09-26' AS Date), CAST(4148.00 AS Decimal(8, 2)), CAST(4170.50 AS Decimal(8, 2)), CAST(4173.00 AS Decimal(8, 2)), CAST(4122.50 AS Decimal(8, 2)), 390890, 81051277625, CAST(4147.00 AS Decimal(8, 2)), CAST(4164.12 AS Decimal(8, 2)), 43291, N'DOLV19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (35, CAST(N'2019-09-27' AS Date), CAST(4164.00 AS Decimal(8, 2)), CAST(4155.00 AS Decimal(8, 2)), CAST(4168.00 AS Decimal(8, 2)), CAST(4145.50 AS Decimal(8, 2)), 303445, 63080729375, CAST(4157.00 AS Decimal(8, 2)), CAST(4157.48 AS Decimal(8, 2)), 33249, N'DOLV19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (499, CAST(N'2017-09-29' AS Date), CAST(3195.50 AS Decimal(8, 2)), CAST(3177.00 AS Decimal(8, 2)), CAST(3203.50 AS Decimal(8, 2)), CAST(3169.50 AS Decimal(8, 2)), 465870, 74076573500, CAST(3180.00 AS Decimal(8, 2)), CAST(3177.97 AS Decimal(8, 2)), 46620, N'DOLX17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (498, CAST(N'2017-10-02' AS Date), CAST(3185.00 AS Decimal(8, 2)), CAST(3168.00 AS Decimal(8, 2)), CAST(3191.50 AS Decimal(8, 2)), CAST(3164.50 AS Decimal(8, 2)), 262255, 41633871125, CAST(3175.00 AS Decimal(8, 2)), CAST(3166.69 AS Decimal(8, 2)), 28370, N'DOLX17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (497, CAST(N'2017-10-03' AS Date), CAST(3170.00 AS Decimal(8, 2)), CAST(3155.50 AS Decimal(8, 2)), CAST(3178.50 AS Decimal(8, 2)), CAST(3154.50 AS Decimal(8, 2)), 248180, 39247727375, CAST(3162.00 AS Decimal(8, 2)), CAST(3158.11 AS Decimal(8, 2)), 27120, N'DOLX17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (496, CAST(N'2017-10-04' AS Date), CAST(3143.50 AS Decimal(8, 2)), CAST(3147.00 AS Decimal(8, 2)), CAST(3151.50 AS Decimal(8, 2)), CAST(3134.50 AS Decimal(8, 2)), 318795, 50096061875, CAST(3142.00 AS Decimal(8, 2)), CAST(3138.69 AS Decimal(8, 2)), 32556, N'DOLX17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (495, CAST(N'2017-10-05' AS Date), CAST(3144.50 AS Decimal(8, 2)), CAST(3164.50 AS Decimal(8, 2)), CAST(3166.50 AS Decimal(8, 2)), CAST(3136.50 AS Decimal(8, 2)), 328775, 51780619750, CAST(3149.00 AS Decimal(8, 2)), CAST(3162.69 AS Decimal(8, 2)), 38100, N'DOLX17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (494, CAST(N'2017-10-06' AS Date), CAST(3164.00 AS Decimal(8, 2)), CAST(3165.50 AS Decimal(8, 2)), CAST(3188.50 AS Decimal(8, 2)), CAST(3161.00 AS Decimal(8, 2)), 369035, 58574071875, CAST(3174.00 AS Decimal(8, 2)), CAST(3168.72 AS Decimal(8, 2)), 44722, N'DOLX17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (493, CAST(N'2017-10-09' AS Date), CAST(3168.00 AS Decimal(8, 2)), CAST(3198.50 AS Decimal(8, 2)), CAST(3200.00 AS Decimal(8, 2)), CAST(3167.00 AS Decimal(8, 2)), 235380, 37535485875, CAST(3189.00 AS Decimal(8, 2)), CAST(3192.89 AS Decimal(8, 2)), 28479, N'DOLX17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (492, CAST(N'2017-10-10' AS Date), CAST(3184.00 AS Decimal(8, 2)), CAST(3189.00 AS Decimal(8, 2)), CAST(3195.00 AS Decimal(8, 2)), CAST(3171.50 AS Decimal(8, 2)), 313300, 49834049000, CAST(3181.00 AS Decimal(8, 2)), CAST(3187.15 AS Decimal(8, 2)), 35004, N'DOLX17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (491, CAST(N'2017-10-11' AS Date), CAST(3180.00 AS Decimal(8, 2)), CAST(3180.50 AS Decimal(8, 2)), CAST(3186.50 AS Decimal(8, 2)), CAST(3169.00 AS Decimal(8, 2)), 309285, 49111556250, CAST(3175.00 AS Decimal(8, 2)), CAST(3175.30 AS Decimal(8, 2)), 34071, N'DOLX17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (490, CAST(N'2017-10-13' AS Date), CAST(3178.00 AS Decimal(8, 2)), CAST(3153.00 AS Decimal(8, 2)), CAST(3188.00 AS Decimal(8, 2)), CAST(3152.00 AS Decimal(8, 2)), 295600, 46793770875, CAST(3166.00 AS Decimal(8, 2)), CAST(3157.93 AS Decimal(8, 2)), 35485, N'DOLX17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (489, CAST(N'2017-10-16' AS Date), CAST(3168.00 AS Decimal(8, 2)), CAST(3179.00 AS Decimal(8, 2)), CAST(3181.00 AS Decimal(8, 2)), CAST(3160.50 AS Decimal(8, 2)), 271365, 43014698250, CAST(3170.00 AS Decimal(8, 2)), CAST(3173.05 AS Decimal(8, 2)), 32426, N'DOLX17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (488, CAST(N'2017-10-17' AS Date), CAST(3177.00 AS Decimal(8, 2)), CAST(3164.50 AS Decimal(8, 2)), CAST(3190.50 AS Decimal(8, 2)), CAST(3164.50 AS Decimal(8, 2)), 289195, 45989389000, CAST(3180.00 AS Decimal(8, 2)), CAST(3177.15 AS Decimal(8, 2)), 33441, N'DOLX17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (487, CAST(N'2017-10-18' AS Date), CAST(3170.00 AS Decimal(8, 2)), CAST(3177.50 AS Decimal(8, 2)), CAST(3187.50 AS Decimal(8, 2)), CAST(3161.50 AS Decimal(8, 2)), 291985, 46346063375, CAST(3174.00 AS Decimal(8, 2)), CAST(3173.80 AS Decimal(8, 2)), 33159, N'DOLX17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (486, CAST(N'2017-10-19' AS Date), CAST(3168.00 AS Decimal(8, 2)), CAST(3172.00 AS Decimal(8, 2)), CAST(3184.50 AS Decimal(8, 2)), CAST(3168.00 AS Decimal(8, 2)), 239875, 38124022750, CAST(3178.00 AS Decimal(8, 2)), CAST(3179.93 AS Decimal(8, 2)), 26200, N'DOLX17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (485, CAST(N'2017-10-20' AS Date), CAST(3187.00 AS Decimal(8, 2)), CAST(3197.00 AS Decimal(8, 2)), CAST(3202.50 AS Decimal(8, 2)), CAST(3176.50 AS Decimal(8, 2)), 341085, 54404407875, CAST(3190.00 AS Decimal(8, 2)), CAST(3192.04 AS Decimal(8, 2)), 37850, N'DOLX17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (484, CAST(N'2017-10-23' AS Date), CAST(3198.50 AS Decimal(8, 2)), CAST(3242.00 AS Decimal(8, 2)), CAST(3243.50 AS Decimal(8, 2)), CAST(3193.50 AS Decimal(8, 2)), 362605, 58293875000, CAST(3215.00 AS Decimal(8, 2)), CAST(3219.27 AS Decimal(8, 2)), 40122, N'DOLX17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (483, CAST(N'2017-10-24' AS Date), CAST(3236.00 AS Decimal(8, 2)), CAST(3247.50 AS Decimal(8, 2)), CAST(3270.50 AS Decimal(8, 2)), CAST(3228.00 AS Decimal(8, 2)), 503630, 81883090000, CAST(3251.00 AS Decimal(8, 2)), CAST(3260.05 AS Decimal(8, 2)), 56617, N'DOLX17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (482, CAST(N'2017-10-25' AS Date), CAST(3245.00 AS Decimal(8, 2)), CAST(3235.50 AS Decimal(8, 2)), CAST(3262.00 AS Decimal(8, 2)), CAST(3231.00 AS Decimal(8, 2)), 510200, 82779926125, CAST(3245.00 AS Decimal(8, 2)), CAST(3250.33 AS Decimal(8, 2)), 57879, N'DOLX17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (481, CAST(N'2017-10-26' AS Date), CAST(3230.00 AS Decimal(8, 2)), CAST(3292.00 AS Decimal(8, 2)), CAST(3300.00 AS Decimal(8, 2)), CAST(3230.00 AS Decimal(8, 2)), 468345, 76386869000, CAST(3261.00 AS Decimal(8, 2)), CAST(3282.94 AS Decimal(8, 2)), 54348, N'DOLX17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (480, CAST(N'2017-10-27' AS Date), CAST(3291.50 AS Decimal(8, 2)), CAST(3238.00 AS Decimal(8, 2)), CAST(3304.00 AS Decimal(8, 2)), CAST(3235.50 AS Decimal(8, 2)), 491355, 80472490000, CAST(3275.00 AS Decimal(8, 2)), CAST(3253.63 AS Decimal(8, 2)), 61679, N'DOLX17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (479, CAST(N'2017-10-30' AS Date), CAST(3241.00 AS Decimal(8, 2)), CAST(3289.50 AS Decimal(8, 2)), CAST(3290.00 AS Decimal(8, 2)), CAST(3235.50 AS Decimal(8, 2)), 373845, 60934858375, CAST(3259.00 AS Decimal(8, 2)), CAST(3272.97 AS Decimal(8, 2)), 38875, N'DOLX17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (280, CAST(N'2018-09-28' AS Date), CAST(4047.00 AS Decimal(8, 2)), CAST(4056.50 AS Decimal(8, 2)), CAST(4066.00 AS Decimal(8, 2)), CAST(3997.50 AS Decimal(8, 2)), 482495, 97112983625, CAST(4025.00 AS Decimal(8, 2)), CAST(4048.37 AS Decimal(8, 2)), 50454, N'DOLX18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (279, CAST(N'2018-10-01' AS Date), CAST(4051.00 AS Decimal(8, 2)), CAST(4027.00 AS Decimal(8, 2)), CAST(4071.50 AS Decimal(8, 2)), CAST(4013.00 AS Decimal(8, 2)), 350505, 70722714375, CAST(4035.00 AS Decimal(8, 2)), CAST(4022.20 AS Decimal(8, 2)), 34729, N'DOLX18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (278, CAST(N'2018-10-02' AS Date), CAST(3995.00 AS Decimal(8, 2)), CAST(3950.50 AS Decimal(8, 2)), CAST(4006.50 AS Decimal(8, 2)), CAST(3914.00 AS Decimal(8, 2)), 475160, 93966297625, CAST(3955.00 AS Decimal(8, 2)), CAST(3931.15 AS Decimal(8, 2)), 51927, N'DOLX18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (277, CAST(N'2018-10-03' AS Date), CAST(3863.00 AS Decimal(8, 2)), CAST(3909.50 AS Decimal(8, 2)), CAST(3929.50 AS Decimal(8, 2)), CAST(3830.50 AS Decimal(8, 2)), 578755, 112143976000, CAST(3875.00 AS Decimal(8, 2)), CAST(3908.39 AS Decimal(8, 2)), 64630, N'DOLX18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (276, CAST(N'2018-10-04' AS Date), CAST(3930.00 AS Decimal(8, 2)), CAST(3882.00 AS Decimal(8, 2)), CAST(3943.00 AS Decimal(8, 2)), CAST(3881.00 AS Decimal(8, 2)), 435550, 85267966250, CAST(3915.00 AS Decimal(8, 2)), CAST(3907.03 AS Decimal(8, 2)), 47524, N'DOLX18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (275, CAST(N'2018-10-05' AS Date), CAST(3850.00 AS Decimal(8, 2)), CAST(3844.50 AS Decimal(8, 2)), CAST(3902.50 AS Decimal(8, 2)), CAST(3844.50 AS Decimal(8, 2)), 381040, 73810758000, CAST(3874.00 AS Decimal(8, 2)), CAST(3873.48 AS Decimal(8, 2)), 40256, N'DOLX18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (274, CAST(N'2018-10-08' AS Date), CAST(3735.00 AS Decimal(8, 2)), CAST(3782.00 AS Decimal(8, 2)), CAST(3790.00 AS Decimal(8, 2)), CAST(3716.50 AS Decimal(8, 2)), 443095, 83256724875, CAST(3757.00 AS Decimal(8, 2)), CAST(3761.45 AS Decimal(8, 2)), 46001, N'DOLX18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (273, CAST(N'2018-10-09' AS Date), CAST(3790.00 AS Decimal(8, 2)), CAST(3722.00 AS Decimal(8, 2)), CAST(3797.50 AS Decimal(8, 2)), CAST(3707.50 AS Decimal(8, 2)), 425900, 79635341250, CAST(3739.00 AS Decimal(8, 2)), CAST(3710.34 AS Decimal(8, 2)), 45921, N'DOLX18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (272, CAST(N'2018-10-10' AS Date), CAST(3742.00 AS Decimal(8, 2)), CAST(3762.00 AS Decimal(8, 2)), CAST(3775.00 AS Decimal(8, 2)), CAST(3730.00 AS Decimal(8, 2)), 405485, 76150599875, CAST(3756.00 AS Decimal(8, 2)), CAST(3760.58 AS Decimal(8, 2)), 44313, N'DOLX18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (271, CAST(N'2018-10-11' AS Date), CAST(3723.50 AS Decimal(8, 2)), CAST(3789.50 AS Decimal(8, 2)), CAST(3792.50 AS Decimal(8, 2)), CAST(3720.00 AS Decimal(8, 2)), 409775, 76995008375, CAST(3757.00 AS Decimal(8, 2)), CAST(3778.10 AS Decimal(8, 2)), 47347, N'DOLX18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (270, CAST(N'2018-10-15' AS Date), CAST(3762.50 AS Decimal(8, 2)), CAST(3740.50 AS Decimal(8, 2)), CAST(3770.00 AS Decimal(8, 2)), CAST(3718.00 AS Decimal(8, 2)), 274590, 51336543250, CAST(3739.00 AS Decimal(8, 2)), CAST(3735.81 AS Decimal(8, 2)), 31283, N'DOLX18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (269, CAST(N'2018-10-16' AS Date), CAST(3728.00 AS Decimal(8, 2)), CAST(3730.00 AS Decimal(8, 2)), CAST(3735.00 AS Decimal(8, 2)), CAST(3695.00 AS Decimal(8, 2)), 323290, 60065639500, CAST(3715.00 AS Decimal(8, 2)), CAST(3731.33 AS Decimal(8, 2)), 35345, N'DOLX18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (268, CAST(N'2018-10-17' AS Date), CAST(3745.00 AS Decimal(8, 2)), CAST(3691.00 AS Decimal(8, 2)), CAST(3750.00 AS Decimal(8, 2)), CAST(3668.00 AS Decimal(8, 2)), 365655, 67595241000, CAST(3697.00 AS Decimal(8, 2)), CAST(3682.82 AS Decimal(8, 2)), 38703, N'DOLX18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (267, CAST(N'2018-10-18' AS Date), CAST(3696.50 AS Decimal(8, 2)), CAST(3725.00 AS Decimal(8, 2)), CAST(3735.00 AS Decimal(8, 2)), CAST(3676.50 AS Decimal(8, 2)), 353495, 65490006125, CAST(3705.00 AS Decimal(8, 2)), CAST(3712.49 AS Decimal(8, 2)), 41153, N'DOLX18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (266, CAST(N'2018-10-19' AS Date), CAST(3708.00 AS Decimal(8, 2)), CAST(3717.50 AS Decimal(8, 2)), CAST(3729.50 AS Decimal(8, 2)), CAST(3690.50 AS Decimal(8, 2)), 307890, 57130480000, CAST(3711.00 AS Decimal(8, 2)), CAST(3707.95 AS Decimal(8, 2)), 33329, N'DOLX18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (265, CAST(N'2018-10-22' AS Date), CAST(3698.50 AS Decimal(8, 2)), CAST(3690.00 AS Decimal(8, 2)), CAST(3722.50 AS Decimal(8, 2)), CAST(3672.00 AS Decimal(8, 2)), 297090, 54828285625, CAST(3691.00 AS Decimal(8, 2)), CAST(3688.71 AS Decimal(8, 2)), 30481, N'DOLX18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (264, CAST(N'2018-10-23' AS Date), CAST(3695.00 AS Decimal(8, 2)), CAST(3695.00 AS Decimal(8, 2)), CAST(3724.50 AS Decimal(8, 2)), CAST(3688.50 AS Decimal(8, 2)), 326835, 60548930500, CAST(3705.00 AS Decimal(8, 2)), CAST(3697.62 AS Decimal(8, 2)), 36030, N'DOLX18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (263, CAST(N'2018-10-24' AS Date), CAST(3700.00 AS Decimal(8, 2)), CAST(3734.00 AS Decimal(8, 2)), CAST(3747.50 AS Decimal(8, 2)), CAST(3683.50 AS Decimal(8, 2)), 378955, 70463266125, CAST(3718.00 AS Decimal(8, 2)), CAST(3725.99 AS Decimal(8, 2)), 40526, N'DOLX18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (262, CAST(N'2018-10-25' AS Date), CAST(3717.50 AS Decimal(8, 2)), CAST(3708.00 AS Decimal(8, 2)), CAST(3734.00 AS Decimal(8, 2)), CAST(3683.50 AS Decimal(8, 2)), 395000, 73195621625, CAST(3706.00 AS Decimal(8, 2)), CAST(3700.64 AS Decimal(8, 2)), 38861, N'DOLX18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (261, CAST(N'2018-10-26' AS Date), CAST(3725.00 AS Decimal(8, 2)), CAST(3644.00 AS Decimal(8, 2)), CAST(3731.00 AS Decimal(8, 2)), CAST(3641.00 AS Decimal(8, 2)), 415805, 76413571875, CAST(3675.00 AS Decimal(8, 2)), CAST(3652.22 AS Decimal(8, 2)), 45591, N'DOLX18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (260, CAST(N'2018-10-29' AS Date), CAST(3586.00 AS Decimal(8, 2)), CAST(3718.00 AS Decimal(8, 2)), CAST(3723.00 AS Decimal(8, 2)), CAST(3582.50 AS Decimal(8, 2)), 587290, 107408163250, CAST(3657.00 AS Decimal(8, 2)), CAST(3699.92 AS Decimal(8, 2)), 63111, N'DOLX18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (259, CAST(N'2018-10-30' AS Date), CAST(3691.00 AS Decimal(8, 2)), CAST(3696.50 AS Decimal(8, 2)), CAST(3736.50 AS Decimal(8, 2)), CAST(3677.50 AS Decimal(8, 2)), 542855, 100608179625, CAST(3706.00 AS Decimal(8, 2)), CAST(3711.93 AS Decimal(8, 2)), 53192, N'DOLX18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (34, CAST(N'2019-09-30' AS Date), CAST(4166.50 AS Decimal(8, 2)), CAST(4161.00 AS Decimal(8, 2)), CAST(4180.50 AS Decimal(8, 2)), CAST(4151.50 AS Decimal(8, 2)), 294645, 61413057125, CAST(4168.00 AS Decimal(8, 2)), CAST(4158.40 AS Decimal(8, 2)), 31148, N'DOLX19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (33, CAST(N'2019-10-01' AS Date), CAST(4175.50 AS Decimal(8, 2)), CAST(4166.50 AS Decimal(8, 2)), CAST(4193.50 AS Decimal(8, 2)), CAST(4162.00 AS Decimal(8, 2)), 345830, 72236121125, CAST(4177.00 AS Decimal(8, 2)), CAST(4169.38 AS Decimal(8, 2)), 37751, N'DOLX19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (32, CAST(N'2019-10-02' AS Date), CAST(4187.00 AS Decimal(8, 2)), CAST(4137.00 AS Decimal(8, 2)), CAST(4191.00 AS Decimal(8, 2)), CAST(4136.50 AS Decimal(8, 2)), 380175, 79069929750, CAST(4159.00 AS Decimal(8, 2)), CAST(4150.97 AS Decimal(8, 2)), 42901, N'DOLX19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (31, CAST(N'2019-10-03' AS Date), CAST(4131.00 AS Decimal(8, 2)), CAST(4093.00 AS Decimal(8, 2)), CAST(4138.00 AS Decimal(8, 2)), CAST(4082.50 AS Decimal(8, 2)), 392870, 80703615875, CAST(4108.00 AS Decimal(8, 2)), CAST(4090.79 AS Decimal(8, 2)), 44969, N'DOLX19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (30, CAST(N'2019-10-04' AS Date), CAST(4088.00 AS Decimal(8, 2)), CAST(4064.00 AS Decimal(8, 2)), CAST(4095.50 AS Decimal(8, 2)), CAST(4058.00 AS Decimal(8, 2)), 357830, 72875181000, CAST(4073.00 AS Decimal(8, 2)), CAST(4070.77 AS Decimal(8, 2)), 36951, N'DOLX19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (29, CAST(N'2019-10-07' AS Date), CAST(4076.00 AS Decimal(8, 2)), CAST(4113.50 AS Decimal(8, 2)), CAST(4117.00 AS Decimal(8, 2)), CAST(4065.50 AS Decimal(8, 2)), 348615, 71314359125, CAST(4091.00 AS Decimal(8, 2)), CAST(4103.51 AS Decimal(8, 2)), 39138, N'DOLX19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (28, CAST(N'2019-10-08' AS Date), CAST(4118.50 AS Decimal(8, 2)), CAST(4101.00 AS Decimal(8, 2)), CAST(4119.00 AS Decimal(8, 2)), CAST(4080.00 AS Decimal(8, 2)), 398505, 81598288500, CAST(4095.00 AS Decimal(8, 2)), CAST(4090.82 AS Decimal(8, 2)), 42435, N'DOLX19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (27, CAST(N'2019-10-09' AS Date), CAST(4085.00 AS Decimal(8, 2)), CAST(4115.50 AS Decimal(8, 2)), CAST(4117.00 AS Decimal(8, 2)), CAST(4077.00 AS Decimal(8, 2)), 291450, 59773007750, CAST(4101.00 AS Decimal(8, 2)), CAST(4101.80 AS Decimal(8, 2)), 34079, N'DOLX19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (26, CAST(N'2019-10-10' AS Date), CAST(4108.50 AS Decimal(8, 2)), CAST(4116.00 AS Decimal(8, 2)), CAST(4143.50 AS Decimal(8, 2)), CAST(4095.50 AS Decimal(8, 2)), 437875, 90228648750, CAST(4121.00 AS Decimal(8, 2)), CAST(4133.74 AS Decimal(8, 2)), 52449, N'DOLX19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (25, CAST(N'2019-10-11' AS Date), CAST(4096.00 AS Decimal(8, 2)), CAST(4112.00 AS Decimal(8, 2)), CAST(4132.00 AS Decimal(8, 2)), CAST(4086.00 AS Decimal(8, 2)), 454280, 93304708750, CAST(4107.00 AS Decimal(8, 2)), CAST(4100.08 AS Decimal(8, 2)), 50571, N'DOLX19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (24, CAST(N'2019-10-14' AS Date), CAST(4115.00 AS Decimal(8, 2)), CAST(4130.50 AS Decimal(8, 2)), CAST(4143.00 AS Decimal(8, 2)), CAST(4112.00 AS Decimal(8, 2)), 209600, 43296126625, CAST(4131.00 AS Decimal(8, 2)), CAST(4136.92 AS Decimal(8, 2)), 25596, N'DOLX19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (23, CAST(N'2019-10-15' AS Date), CAST(4129.50 AS Decimal(8, 2)), CAST(4185.00 AS Decimal(8, 2)), CAST(4187.00 AS Decimal(8, 2)), CAST(4126.00 AS Decimal(8, 2)), 339280, 70500149250, CAST(4155.00 AS Decimal(8, 2)), CAST(4164.67 AS Decimal(8, 2)), 38447, N'DOLX19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (22, CAST(N'2019-10-16' AS Date), CAST(4180.00 AS Decimal(8, 2)), CAST(4155.00 AS Decimal(8, 2)), CAST(4191.50 AS Decimal(8, 2)), CAST(4152.00 AS Decimal(8, 2)), 328520, 68549911250, CAST(4173.00 AS Decimal(8, 2)), CAST(4165.83 AS Decimal(8, 2)), 38436, N'DOLX19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (21, CAST(N'2019-10-17' AS Date), CAST(4148.00 AS Decimal(8, 2)), CAST(4167.50 AS Decimal(8, 2)), CAST(4186.50 AS Decimal(8, 2)), CAST(4132.00 AS Decimal(8, 2)), 399360, 83021181750, CAST(4157.00 AS Decimal(8, 2)), CAST(4167.13 AS Decimal(8, 2)), 47431, N'DOLX19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (20, CAST(N'2019-10-18' AS Date), CAST(4161.50 AS Decimal(8, 2)), CAST(4117.00 AS Decimal(8, 2)), CAST(4167.50 AS Decimal(8, 2)), CAST(4115.00 AS Decimal(8, 2)), 313345, 64819025250, CAST(4137.00 AS Decimal(8, 2)), CAST(4117.41 AS Decimal(8, 2)), 37044, N'DOLX19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (19, CAST(N'2019-10-21' AS Date), CAST(4124.50 AS Decimal(8, 2)), CAST(4132.50 AS Decimal(8, 2)), CAST(4156.00 AS Decimal(8, 2)), CAST(4121.00 AS Decimal(8, 2)), 269045, 55681976625, CAST(4139.00 AS Decimal(8, 2)), CAST(4140.11 AS Decimal(8, 2)), 30126, N'DOLX19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (18, CAST(N'2019-10-22' AS Date), CAST(4129.50 AS Decimal(8, 2)), CAST(4083.00 AS Decimal(8, 2)), CAST(4129.50 AS Decimal(8, 2)), CAST(4065.00 AS Decimal(8, 2)), 402075, 82179676875, CAST(4087.00 AS Decimal(8, 2)), CAST(4077.06 AS Decimal(8, 2)), 43113, N'DOLX19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (17, CAST(N'2019-10-23' AS Date), CAST(4087.00 AS Decimal(8, 2)), CAST(4036.00 AS Decimal(8, 2)), CAST(4095.00 AS Decimal(8, 2)), CAST(4031.50 AS Decimal(8, 2)), 406945, 82629290250, CAST(4060.00 AS Decimal(8, 2)), CAST(4036.52 AS Decimal(8, 2)), 43022, N'DOLX19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (16, CAST(N'2019-10-24' AS Date), CAST(4030.00 AS Decimal(8, 2)), CAST(4041.00 AS Decimal(8, 2)), CAST(4047.50 AS Decimal(8, 2)), CAST(4001.00 AS Decimal(8, 2)), 451630, 90806115250, CAST(4021.00 AS Decimal(8, 2)), CAST(4037.13 AS Decimal(8, 2)), 46579, N'DOLX19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (15, CAST(N'2019-10-25' AS Date), CAST(4025.00 AS Decimal(8, 2)), CAST(4006.00 AS Decimal(8, 2)), CAST(4034.50 AS Decimal(8, 2)), CAST(3992.00 AS Decimal(8, 2)), 349300, 70084604500, CAST(4012.00 AS Decimal(8, 2)), CAST(4007.93 AS Decimal(8, 2)), 39254, N'DOLX19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (14, CAST(N'2019-10-28' AS Date), CAST(4007.00 AS Decimal(8, 2)), CAST(3991.50 AS Decimal(8, 2)), CAST(4010.50 AS Decimal(8, 2)), CAST(3974.00 AS Decimal(8, 2)), 337820, 67336672625, CAST(3986.00 AS Decimal(8, 2)), CAST(3987.93 AS Decimal(8, 2)), 34676, N'DOLX19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (13, CAST(N'2019-10-29' AS Date), CAST(3993.50 AS Decimal(8, 2)), CAST(3999.00 AS Decimal(8, 2)), CAST(4006.00 AS Decimal(8, 2)), CAST(3984.50 AS Decimal(8, 2)), 364050, 72744719875, CAST(3996.00 AS Decimal(8, 2)), CAST(4000.11 AS Decimal(8, 2)), 38675, N'DOLX19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (12, CAST(N'2019-10-30' AS Date), CAST(4007.00 AS Decimal(8, 2)), CAST(3988.00 AS Decimal(8, 2)), CAST(4032.00 AS Decimal(8, 2)), CAST(3982.00 AS Decimal(8, 2)), 457615, 91844288750, CAST(4014.00 AS Decimal(8, 2)), CAST(4008.56 AS Decimal(8, 2)), 53423, N'DOLX19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (478, CAST(N'2017-10-31' AS Date), CAST(3301.00 AS Decimal(8, 2)), CAST(3284.00 AS Decimal(8, 2)), CAST(3315.00 AS Decimal(8, 2)), CAST(3277.50 AS Decimal(8, 2)), 462735, 76114954750, CAST(3289.00 AS Decimal(8, 2)), CAST(3293.30 AS Decimal(8, 2)), 47716, N'DOLZ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (477, CAST(N'2017-11-01' AS Date), CAST(3282.00 AS Decimal(8, 2)), CAST(3280.00 AS Decimal(8, 2)), CAST(3305.00 AS Decimal(8, 2)), CAST(3269.00 AS Decimal(8, 2)), 371535, 61011200000, CAST(3284.00 AS Decimal(8, 2)), CAST(3279.15 AS Decimal(8, 2)), 43072, N'DOLZ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (476, CAST(N'2017-11-03' AS Date), CAST(3278.00 AS Decimal(8, 2)), CAST(3327.00 AS Decimal(8, 2)), CAST(3346.00 AS Decimal(8, 2)), CAST(3262.50 AS Decimal(8, 2)), 474245, 78335009250, CAST(3303.00 AS Decimal(8, 2)), CAST(3318.16 AS Decimal(8, 2)), 54588, N'DOLZ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (475, CAST(N'2017-11-06' AS Date), CAST(3314.00 AS Decimal(8, 2)), CAST(3260.00 AS Decimal(8, 2)), CAST(3315.00 AS Decimal(8, 2)), CAST(3258.50 AS Decimal(8, 2)), 312990, 51482127875, CAST(3289.00 AS Decimal(8, 2)), CAST(3275.35 AS Decimal(8, 2)), 35262, N'DOLZ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (474, CAST(N'2017-11-07' AS Date), CAST(3275.00 AS Decimal(8, 2)), CAST(3281.00 AS Decimal(8, 2)), CAST(3297.50 AS Decimal(8, 2)), CAST(3264.00 AS Decimal(8, 2)), 379580, 62313003750, CAST(3283.00 AS Decimal(8, 2)), CAST(3287.64 AS Decimal(8, 2)), 44383, N'DOLZ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (473, CAST(N'2017-11-08' AS Date), CAST(3275.00 AS Decimal(8, 2)), CAST(3263.00 AS Decimal(8, 2)), CAST(3277.00 AS Decimal(8, 2)), CAST(3249.50 AS Decimal(8, 2)), 308660, 50342123625, CAST(3261.00 AS Decimal(8, 2)), CAST(3260.66 AS Decimal(8, 2)), 33635, N'DOLZ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (472, CAST(N'2017-11-09' AS Date), CAST(3259.00 AS Decimal(8, 2)), CAST(3260.00 AS Decimal(8, 2)), CAST(3274.00 AS Decimal(8, 2)), CAST(3244.00 AS Decimal(8, 2)), 371805, 60625829250, CAST(3261.00 AS Decimal(8, 2)), CAST(3267.32 AS Decimal(8, 2)), 41176, N'DOLZ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (471, CAST(N'2017-11-10' AS Date), CAST(3261.50 AS Decimal(8, 2)), CAST(3285.00 AS Decimal(8, 2)), CAST(3292.00 AS Decimal(8, 2)), CAST(3258.50 AS Decimal(8, 2)), 282875, 46333988625, CAST(3275.00 AS Decimal(8, 2)), CAST(3283.58 AS Decimal(8, 2)), 32040, N'DOLZ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (470, CAST(N'2017-11-13' AS Date), CAST(3290.00 AS Decimal(8, 2)), CAST(3286.00 AS Decimal(8, 2)), CAST(3307.50 AS Decimal(8, 2)), CAST(3283.00 AS Decimal(8, 2)), 283740, 46766169625, CAST(3296.00 AS Decimal(8, 2)), CAST(3302.82 AS Decimal(8, 2)), 30533, N'DOLZ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (469, CAST(N'2017-11-14' AS Date), CAST(3282.00 AS Decimal(8, 2)), CAST(3319.00 AS Decimal(8, 2)), CAST(3322.50 AS Decimal(8, 2)), CAST(3273.50 AS Decimal(8, 2)), 389455, 64228550500, CAST(3298.00 AS Decimal(8, 2)), CAST(3310.26 AS Decimal(8, 2)), 41816, N'DOLZ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (468, CAST(N'2017-11-16' AS Date), CAST(3311.50 AS Decimal(8, 2)), CAST(3280.00 AS Decimal(8, 2)), CAST(3316.00 AS Decimal(8, 2)), CAST(3274.50 AS Decimal(8, 2)), 409115, 67258451750, CAST(3288.00 AS Decimal(8, 2)), CAST(3283.39 AS Decimal(8, 2)), 42657, N'DOLZ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (467, CAST(N'2017-11-17' AS Date), CAST(3280.00 AS Decimal(8, 2)), CAST(3262.00 AS Decimal(8, 2)), CAST(3293.00 AS Decimal(8, 2)), CAST(3261.00 AS Decimal(8, 2)), 321160, 52636272750, CAST(3277.00 AS Decimal(8, 2)), CAST(3262.64 AS Decimal(8, 2)), 34759, N'DOLZ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (466, CAST(N'2017-11-21' AS Date), CAST(3258.00 AS Decimal(8, 2)), CAST(3261.50 AS Decimal(8, 2)), CAST(3269.00 AS Decimal(8, 2)), CAST(3243.50 AS Decimal(8, 2)), 365880, 59603457375, CAST(3258.00 AS Decimal(8, 2)), CAST(3247.51 AS Decimal(8, 2)), 37567, N'DOLZ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (465, CAST(N'2017-11-22' AS Date), CAST(3254.50 AS Decimal(8, 2)), CAST(3227.00 AS Decimal(8, 2)), CAST(3267.50 AS Decimal(8, 2)), CAST(3224.00 AS Decimal(8, 2)), 320915, 52116970375, CAST(3248.00 AS Decimal(8, 2)), CAST(3238.89 AS Decimal(8, 2)), 36834, N'DOLZ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (464, CAST(N'2017-11-23' AS Date), CAST(3230.00 AS Decimal(8, 2)), CAST(3224.50 AS Decimal(8, 2)), CAST(3245.50 AS Decimal(8, 2)), CAST(3222.00 AS Decimal(8, 2)), 187975, 30394935875, CAST(3233.00 AS Decimal(8, 2)), CAST(3224.99 AS Decimal(8, 2)), 18682, N'DOLZ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (463, CAST(N'2017-11-24' AS Date), CAST(3233.00 AS Decimal(8, 2)), CAST(3235.00 AS Decimal(8, 2)), CAST(3238.00 AS Decimal(8, 2)), CAST(3223.50 AS Decimal(8, 2)), 213445, 34480371000, CAST(3230.00 AS Decimal(8, 2)), CAST(3226.59 AS Decimal(8, 2)), 21068, N'DOLZ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (462, CAST(N'2017-11-27' AS Date), CAST(3222.00 AS Decimal(8, 2)), CAST(3229.00 AS Decimal(8, 2)), CAST(3234.00 AS Decimal(8, 2)), CAST(3215.50 AS Decimal(8, 2)), 301240, 48540501625, CAST(3222.00 AS Decimal(8, 2)), CAST(3223.69 AS Decimal(8, 2)), 31129, N'DOLZ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (461, CAST(N'2017-11-28' AS Date), CAST(3234.00 AS Decimal(8, 2)), CAST(3214.00 AS Decimal(8, 2)), CAST(3234.00 AS Decimal(8, 2)), CAST(3203.00 AS Decimal(8, 2)), 314870, 50654533000, CAST(3217.00 AS Decimal(8, 2)), CAST(3209.78 AS Decimal(8, 2)), 34683, N'DOLZ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (460, CAST(N'2017-11-29' AS Date), CAST(3216.00 AS Decimal(8, 2)), CAST(3245.00 AS Decimal(8, 2)), CAST(3247.50 AS Decimal(8, 2)), CAST(3202.00 AS Decimal(8, 2)), 419030, 67473070500, CAST(3220.00 AS Decimal(8, 2)), CAST(3238.44 AS Decimal(8, 2)), 44081, N'DOLZ17 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (258, CAST(N'2018-10-31' AS Date), CAST(3694.00 AS Decimal(8, 2)), CAST(3731.50 AS Decimal(8, 2)), CAST(3755.00 AS Decimal(8, 2)), CAST(3693.50 AS Decimal(8, 2)), 492710, 91844163875, CAST(3728.00 AS Decimal(8, 2)), CAST(3721.84 AS Decimal(8, 2)), 49940, N'DOLZ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (257, CAST(N'2018-11-01' AS Date), CAST(3706.50 AS Decimal(8, 2)), CAST(3705.00 AS Decimal(8, 2)), CAST(3721.50 AS Decimal(8, 2)), CAST(3688.00 AS Decimal(8, 2)), 345570, 63991506875, CAST(3703.00 AS Decimal(8, 2)), CAST(3697.65 AS Decimal(8, 2)), 37888, N'DOLZ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (256, CAST(N'2018-11-05' AS Date), CAST(3701.00 AS Decimal(8, 2)), CAST(3733.50 AS Decimal(8, 2)), CAST(3740.00 AS Decimal(8, 2)), CAST(3698.50 AS Decimal(8, 2)), 289620, 53817581500, CAST(3716.00 AS Decimal(8, 2)), CAST(3726.94 AS Decimal(8, 2)), 31259, N'DOLZ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (255, CAST(N'2018-11-06' AS Date), CAST(3734.50 AS Decimal(8, 2)), CAST(3768.00 AS Decimal(8, 2)), CAST(3777.00 AS Decimal(8, 2)), CAST(3734.50 AS Decimal(8, 2)), 330855, 62160141500, CAST(3757.00 AS Decimal(8, 2)), CAST(3752.71 AS Decimal(8, 2)), 37970, N'DOLZ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (254, CAST(N'2018-11-07' AS Date), CAST(3740.00 AS Decimal(8, 2)), CAST(3738.00 AS Decimal(8, 2)), CAST(3794.00 AS Decimal(8, 2)), CAST(3729.00 AS Decimal(8, 2)), 407795, 76679323625, CAST(3760.00 AS Decimal(8, 2)), CAST(3753.05 AS Decimal(8, 2)), 41968, N'DOLZ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (253, CAST(N'2018-11-08' AS Date), CAST(3746.00 AS Decimal(8, 2)), CAST(3765.50 AS Decimal(8, 2)), CAST(3769.00 AS Decimal(8, 2)), CAST(3722.50 AS Decimal(8, 2)), 353680, 66299308750, CAST(3749.00 AS Decimal(8, 2)), CAST(3764.87 AS Decimal(8, 2)), 36826, N'DOLZ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (252, CAST(N'2018-11-09' AS Date), CAST(3775.00 AS Decimal(8, 2)), CAST(3738.00 AS Decimal(8, 2)), CAST(3780.50 AS Decimal(8, 2)), CAST(3731.00 AS Decimal(8, 2)), 337060, 63265733125, CAST(3753.00 AS Decimal(8, 2)), CAST(3747.40 AS Decimal(8, 2)), 36516, N'DOLZ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (251, CAST(N'2018-11-12' AS Date), CAST(3753.00 AS Decimal(8, 2)), CAST(3772.00 AS Decimal(8, 2)), CAST(3774.50 AS Decimal(8, 2)), CAST(3741.50 AS Decimal(8, 2)), 214675, 40317736875, CAST(3756.00 AS Decimal(8, 2)), CAST(3754.74 AS Decimal(8, 2)), 24003, N'DOLZ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (250, CAST(N'2018-11-13' AS Date), CAST(3763.00 AS Decimal(8, 2)), CAST(3807.50 AS Decimal(8, 2)), CAST(3837.00 AS Decimal(8, 2)), CAST(3759.00 AS Decimal(8, 2)), 487720, 92638924625, CAST(3798.00 AS Decimal(8, 2)), CAST(3815.88 AS Decimal(8, 2)), 49389, N'DOLZ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (249, CAST(N'2018-11-14' AS Date), CAST(3801.00 AS Decimal(8, 2)), CAST(3788.00 AS Decimal(8, 2)), CAST(3824.00 AS Decimal(8, 2)), CAST(3771.00 AS Decimal(8, 2)), 498480, 94567001375, CAST(3794.00 AS Decimal(8, 2)), CAST(3794.10 AS Decimal(8, 2)), 50707, N'DOLZ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (248, CAST(N'2018-11-16' AS Date), CAST(3777.50 AS Decimal(8, 2)), CAST(3746.50 AS Decimal(8, 2)), CAST(3786.00 AS Decimal(8, 2)), CAST(3733.50 AS Decimal(8, 2)), 308970, 57985462125, CAST(3753.00 AS Decimal(8, 2)), CAST(3744.97 AS Decimal(8, 2)), 36823, N'DOLZ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (247, CAST(N'2018-11-19' AS Date), CAST(3748.50 AS Decimal(8, 2)), CAST(3759.00 AS Decimal(8, 2)), CAST(3774.50 AS Decimal(8, 2)), CAST(3745.00 AS Decimal(8, 2)), 263840, 49607926250, CAST(3760.00 AS Decimal(8, 2)), CAST(3765.48 AS Decimal(8, 2)), 25886, N'DOLZ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (246, CAST(N'2018-11-21' AS Date), CAST(3773.00 AS Decimal(8, 2)), CAST(3798.50 AS Decimal(8, 2)), CAST(3804.50 AS Decimal(8, 2)), CAST(3769.00 AS Decimal(8, 2)), 349800, 66226995875, CAST(3786.00 AS Decimal(8, 2)), CAST(3786.43 AS Decimal(8, 2)), 35382, N'DOLZ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (245, CAST(N'2018-11-22' AS Date), CAST(3790.50 AS Decimal(8, 2)), CAST(3801.50 AS Decimal(8, 2)), CAST(3826.50 AS Decimal(8, 2)), CAST(3790.50 AS Decimal(8, 2)), 194735, 37105304125, CAST(3810.00 AS Decimal(8, 2)), CAST(3811.41 AS Decimal(8, 2)), 20953, N'DOLZ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (244, CAST(N'2018-11-23' AS Date), CAST(3816.00 AS Decimal(8, 2)), CAST(3828.00 AS Decimal(8, 2)), CAST(3831.50 AS Decimal(8, 2)), CAST(3796.00 AS Decimal(8, 2)), 234400, 44704071000, CAST(3814.00 AS Decimal(8, 2)), CAST(3819.08 AS Decimal(8, 2)), 24520, N'DOLZ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (243, CAST(N'2018-11-26' AS Date), CAST(3820.00 AS Decimal(8, 2)), CAST(3938.50 AS Decimal(8, 2)), CAST(3946.50 AS Decimal(8, 2)), CAST(3818.00 AS Decimal(8, 2)), 456170, 88512485875, CAST(3880.00 AS Decimal(8, 2)), CAST(3906.64 AS Decimal(8, 2)), 49677, N'DOLZ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (242, CAST(N'2018-11-27' AS Date), CAST(3923.50 AS Decimal(8, 2)), CAST(3875.00 AS Decimal(8, 2)), CAST(3924.50 AS Decimal(8, 2)), CAST(3863.00 AS Decimal(8, 2)), 359635, 69988686250, CAST(3892.00 AS Decimal(8, 2)), CAST(3894.37 AS Decimal(8, 2)), 40460, N'DOLZ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (241, CAST(N'2018-11-28' AS Date), CAST(3881.00 AS Decimal(8, 2)), CAST(3849.00 AS Decimal(8, 2)), CAST(3887.50 AS Decimal(8, 2)), CAST(3831.00 AS Decimal(8, 2)), 416990, 80436425625, CAST(3857.00 AS Decimal(8, 2)), CAST(3840.37 AS Decimal(8, 2)), 43515, N'DOLZ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (240, CAST(N'2018-11-29' AS Date), CAST(3842.00 AS Decimal(8, 2)), CAST(3850.50 AS Decimal(8, 2)), CAST(3874.00 AS Decimal(8, 2)), CAST(3832.50 AS Decimal(8, 2)), 419615, 80845014750, CAST(3853.00 AS Decimal(8, 2)), CAST(3860.51 AS Decimal(8, 2)), 37125, N'DOLZ18 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (11, CAST(N'2019-10-31' AS Date), CAST(3983.50 AS Decimal(8, 2)), CAST(4024.50 AS Decimal(8, 2)), CAST(4044.50 AS Decimal(8, 2)), CAST(3972.00 AS Decimal(8, 2)), 565410, 113510465750, CAST(4015.00 AS Decimal(8, 2)), CAST(4028.71 AS Decimal(8, 2)), 58455, N'DOLZ19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (10, CAST(N'2019-11-01' AS Date), CAST(4012.50 AS Decimal(8, 2)), CAST(3996.50 AS Decimal(8, 2)), CAST(4017.50 AS Decimal(8, 2)), CAST(3976.50 AS Decimal(8, 2)), 411870, 82226541375, CAST(3992.00 AS Decimal(8, 2)), CAST(4000.10 AS Decimal(8, 2)), 45821, N'DOLZ19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1399, CAST(N'2019-11-04' AS Date), CAST(3987.50 AS Decimal(8, 2)), CAST(4018.50 AS Decimal(8, 2)), CAST(4026.50 AS Decimal(8, 2)), CAST(3982.00 AS Decimal(8, 2)), 312730, 62609592875, CAST(4004.07 AS Decimal(8, 2)), CAST(4015.22 AS Decimal(8, 2)), 33798, N'DOLZ19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1400, CAST(N'2019-11-05' AS Date), CAST(4008.00 AS Decimal(8, 2)), CAST(4000.50 AS Decimal(8, 2)), CAST(4030.00 AS Decimal(8, 2)), CAST(3990.00 AS Decimal(8, 2)), 367100, 73540455375, CAST(4006.56 AS Decimal(8, 2)), CAST(3992.93 AS Decimal(8, 2)), 41123, N'DOLZ19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1401, CAST(N'2019-11-06' AS Date), CAST(4000.00 AS Decimal(8, 2)), CAST(4084.00 AS Decimal(8, 2)), CAST(4095.00 AS Decimal(8, 2)), CAST(3982.50 AS Decimal(8, 2)), 490060, 99322732375, CAST(4053.49 AS Decimal(8, 2)), CAST(4084.76 AS Decimal(8, 2)), 54958, N'DOLZ19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1402, CAST(N'2019-11-07' AS Date), CAST(4059.00 AS Decimal(8, 2)), CAST(4103.50 AS Decimal(8, 2)), CAST(4109.00 AS Decimal(8, 2)), CAST(4048.00 AS Decimal(8, 2)), 456480, 93366289125, CAST(4090.71 AS Decimal(8, 2)), CAST(4092.25 AS Decimal(8, 2)), 53556, N'DOLZ19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1403, CAST(N'2019-11-08' AS Date), CAST(4121.00 AS Decimal(8, 2)), CAST(4168.50 AS Decimal(8, 2)), CAST(4176.00 AS Decimal(8, 2)), CAST(4114.00 AS Decimal(8, 2)), 398430, 82616928625, CAST(4147.12 AS Decimal(8, 2)), CAST(4151.94 AS Decimal(8, 2)), 48883, N'DOLZ19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1404, CAST(N'2019-11-11' AS Date), CAST(4173.00 AS Decimal(8, 2)), CAST(4158.00 AS Decimal(8, 2)), CAST(4176.50 AS Decimal(8, 2)), CAST(4141.00 AS Decimal(8, 2)), 229120, 47613217375, CAST(4156.18 AS Decimal(8, 2)), CAST(4143.84 AS Decimal(8, 2)), 27532, N'DOLZ19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1405, CAST(N'2019-11-12' AS Date), CAST(4150.50 AS Decimal(8, 2)), CAST(4174.00 AS Decimal(8, 2)), CAST(4193.00 AS Decimal(8, 2)), CAST(4148.00 AS Decimal(8, 2)), 444485, 92753824625, CAST(4173.54 AS Decimal(8, 2)), CAST(4168.81 AS Decimal(8, 2)), 48103, N'DOLZ19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1406, CAST(N'2019-11-13' AS Date), CAST(4183.50 AS Decimal(8, 2)), CAST(4174.50 AS Decimal(8, 2)), CAST(4195.00 AS Decimal(8, 2)), CAST(4169.00 AS Decimal(8, 2)), 411300, 86021489250, CAST(4182.91 AS Decimal(8, 2)), CAST(4188.62 AS Decimal(8, 2)), 46143, N'DOLZ19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1407, CAST(N'2019-11-14' AS Date), CAST(4182.00 AS Decimal(8, 2)), CAST(4200.00 AS Decimal(8, 2)), CAST(4203.00 AS Decimal(8, 2)), CAST(4168.00 AS Decimal(8, 2)), 339500, 71123277000, CAST(4189.88 AS Decimal(8, 2)), CAST(4192.95 AS Decimal(8, 2)), 39893, N'DOLZ19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (2387, CAST(N'2019-11-18' AS Date), CAST(4179.00 AS Decimal(8, 2)), CAST(4218.50 AS Decimal(8, 2)), CAST(4225.00 AS Decimal(8, 2)), CAST(4173.50 AS Decimal(8, 2)), 328470, 68893855125, CAST(4194.83 AS Decimal(8, 2)), CAST(4199.88 AS Decimal(8, 2)), 35312, N'DOLZ19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (2389, CAST(N'2019-11-19' AS Date), CAST(4209.00 AS Decimal(8, 2)), CAST(4197.00 AS Decimal(8, 2)), CAST(4223.00 AS Decimal(8, 2)), CAST(4190.00 AS Decimal(8, 2)), 392765, 82643284250, CAST(4208.28 AS Decimal(8, 2)), CAST(4200.85 AS Decimal(8, 2)), 46531, N'DOLZ19 ')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1371, CAST(N'2017-01-02' AS Date), CAST(27.70 AS Decimal(8, 2)), CAST(27.80 AS Decimal(8, 2)), CAST(28.20 AS Decimal(8, 2)), CAST(27.60 AS Decimal(8, 2)), 12135, 2002750200, CAST(27.00 AS Decimal(8, 2)), NULL, 97, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1370, CAST(N'2017-01-03' AS Date), CAST(26.10 AS Decimal(8, 2)), CAST(26.00 AS Decimal(8, 2)), CAST(26.70 AS Decimal(8, 2)), CAST(26.00 AS Decimal(8, 2)), 11110, 1827225425, CAST(26.00 AS Decimal(8, 2)), NULL, 66, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1369, CAST(N'2017-01-04' AS Date), CAST(25.30 AS Decimal(8, 2)), CAST(25.40 AS Decimal(8, 2)), CAST(25.60 AS Decimal(8, 2)), CAST(25.30 AS Decimal(8, 2)), 17390, 2833388500, CAST(25.00 AS Decimal(8, 2)), NULL, 108, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1368, CAST(N'2017-01-05' AS Date), CAST(23.50 AS Decimal(8, 2)), CAST(20.00 AS Decimal(8, 2)), CAST(24.10 AS Decimal(8, 2)), CAST(20.00 AS Decimal(8, 2)), 13405, 2169307150, CAST(23.00 AS Decimal(8, 2)), NULL, 105, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1367, CAST(N'2017-01-06' AS Date), CAST(22.40 AS Decimal(8, 2)), CAST(22.40 AS Decimal(8, 2)), CAST(22.60 AS Decimal(8, 2)), CAST(22.40 AS Decimal(8, 2)), 12770, 2061186825, CAST(22.00 AS Decimal(8, 2)), NULL, 80, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1366, CAST(N'2017-01-09' AS Date), CAST(21.50 AS Decimal(8, 2)), CAST(21.40 AS Decimal(8, 2)), CAST(21.60 AS Decimal(8, 2)), CAST(21.40 AS Decimal(8, 2)), 14580, 2355524325, CAST(21.00 AS Decimal(8, 2)), NULL, 83, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1365, CAST(N'2017-01-10' AS Date), CAST(19.80 AS Decimal(8, 2)), CAST(19.70 AS Decimal(8, 2)), CAST(20.00 AS Decimal(8, 2)), CAST(19.70 AS Decimal(8, 2)), 15035, 2414337650, CAST(19.00 AS Decimal(8, 2)), NULL, 93, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1364, CAST(N'2017-01-11' AS Date), CAST(19.00 AS Decimal(8, 2)), CAST(18.90 AS Decimal(8, 2)), CAST(20.50 AS Decimal(8, 2)), CAST(18.90 AS Decimal(8, 2)), 20435, 3304819750, CAST(19.00 AS Decimal(8, 2)), NULL, 93, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1363, CAST(N'2017-01-12' AS Date), CAST(16.60 AS Decimal(8, 2)), CAST(17.00 AS Decimal(8, 2)), CAST(17.00 AS Decimal(8, 2)), CAST(16.20 AS Decimal(8, 2)), 57670, 9176967225, CAST(16.00 AS Decimal(8, 2)), NULL, 162, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1362, CAST(N'2017-01-13' AS Date), CAST(15.10 AS Decimal(8, 2)), CAST(16.00 AS Decimal(8, 2)), CAST(16.00 AS Decimal(8, 2)), CAST(15.00 AS Decimal(8, 2)), 46870, 7542863000, CAST(15.00 AS Decimal(8, 2)), NULL, 137, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1361, CAST(N'2017-01-16' AS Date), CAST(14.90 AS Decimal(8, 2)), CAST(15.10 AS Decimal(8, 2)), CAST(15.40 AS Decimal(8, 2)), CAST(14.90 AS Decimal(8, 2)), 8305, 1344779025, CAST(15.00 AS Decimal(8, 2)), NULL, 81, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1360, CAST(N'2017-01-17' AS Date), CAST(13.70 AS Decimal(8, 2)), CAST(15.30 AS Decimal(8, 2)), CAST(15.30 AS Decimal(8, 2)), CAST(13.60 AS Decimal(8, 2)), 22885, 3688792675, CAST(13.00 AS Decimal(8, 2)), NULL, 112, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1359, CAST(N'2017-01-18' AS Date), CAST(12.10 AS Decimal(8, 2)), CAST(11.00 AS Decimal(8, 2)), CAST(12.20 AS Decimal(8, 2)), CAST(11.00 AS Decimal(8, 2)), 10395, 1680453200, CAST(12.00 AS Decimal(8, 2)), NULL, 73, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1358, CAST(N'2017-01-19' AS Date), CAST(11.10 AS Decimal(8, 2)), CAST(11.30 AS Decimal(8, 2)), CAST(11.40 AS Decimal(8, 2)), CAST(11.10 AS Decimal(8, 2)), 16220, 2613420925, CAST(11.00 AS Decimal(8, 2)), NULL, 110, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1357, CAST(N'2017-01-20' AS Date), CAST(9.50 AS Decimal(8, 2)), CAST(9.80 AS Decimal(8, 2)), CAST(9.80 AS Decimal(8, 2)), CAST(9.40 AS Decimal(8, 2)), 26785, 4287632375, CAST(9.00 AS Decimal(8, 2)), NULL, 95, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1356, CAST(N'2017-01-23' AS Date), CAST(7.90 AS Decimal(8, 2)), CAST(7.80 AS Decimal(8, 2)), CAST(8.00 AS Decimal(8, 2)), CAST(7.80 AS Decimal(8, 2)), 14655, 2321941950, CAST(7.00 AS Decimal(8, 2)), NULL, 66, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1355, CAST(N'2017-01-24' AS Date), CAST(6.50 AS Decimal(8, 2)), CAST(5.50 AS Decimal(8, 2)), CAST(6.80 AS Decimal(8, 2)), CAST(5.50 AS Decimal(8, 2)), 15645, 2480935100, CAST(6.00 AS Decimal(8, 2)), NULL, 85, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1354, CAST(N'2017-01-26' AS Date), CAST(3.80 AS Decimal(8, 2)), CAST(3.90 AS Decimal(8, 2)), CAST(3.90 AS Decimal(8, 2)), CAST(3.70 AS Decimal(8, 2)), 21350, 3399110500, CAST(3.00 AS Decimal(8, 2)), NULL, 106, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1353, CAST(N'2017-01-27' AS Date), CAST(2.70 AS Decimal(8, 2)), CAST(2.50 AS Decimal(8, 2)), CAST(2.70 AS Decimal(8, 2)), CAST(2.40 AS Decimal(8, 2)), 16545, 2615859475, CAST(2.00 AS Decimal(8, 2)), NULL, 122, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1352, CAST(N'2017-01-30' AS Date), CAST(24.20 AS Decimal(8, 2)), CAST(24.00 AS Decimal(8, 2)), CAST(24.30 AS Decimal(8, 2)), CAST(23.90 AS Decimal(8, 2)), 12450, 1964432500, CAST(24.00 AS Decimal(8, 2)), NULL, 93, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1351, CAST(N'2017-01-31' AS Date), CAST(22.90 AS Decimal(8, 2)), CAST(26.00 AS Decimal(8, 2)), CAST(26.00 AS Decimal(8, 2)), CAST(22.50 AS Decimal(8, 2)), 64260, 10120609950, CAST(22.00 AS Decimal(8, 2)), NULL, 248, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1350, CAST(N'2017-02-01' AS Date), CAST(21.10 AS Decimal(8, 2)), CAST(20.80 AS Decimal(8, 2)), CAST(21.10 AS Decimal(8, 2)), CAST(20.70 AS Decimal(8, 2)), 9295, 1472692825, CAST(20.00 AS Decimal(8, 2)), NULL, 70, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1349, CAST(N'2017-02-02' AS Date), CAST(19.90 AS Decimal(8, 2)), CAST(19.80 AS Decimal(8, 2)), CAST(19.90 AS Decimal(8, 2)), CAST(19.80 AS Decimal(8, 2)), 7850, 1232234650, CAST(19.00 AS Decimal(8, 2)), NULL, 75, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1348, CAST(N'2017-02-03' AS Date), CAST(18.70 AS Decimal(8, 2)), CAST(19.30 AS Decimal(8, 2)), CAST(19.30 AS Decimal(8, 2)), CAST(18.60 AS Decimal(8, 2)), 12370, 1943862325, CAST(18.00 AS Decimal(8, 2)), NULL, 88, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1347, CAST(N'2017-02-06' AS Date), CAST(17.60 AS Decimal(8, 2)), CAST(18.80 AS Decimal(8, 2)), CAST(18.80 AS Decimal(8, 2)), CAST(17.50 AS Decimal(8, 2)), 11080, 1737053725, CAST(17.00 AS Decimal(8, 2)), NULL, 66, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1346, CAST(N'2017-02-07' AS Date), CAST(16.40 AS Decimal(8, 2)), CAST(16.40 AS Decimal(8, 2)), CAST(16.50 AS Decimal(8, 2)), CAST(16.30 AS Decimal(8, 2)), 18040, 2838424975, CAST(16.00 AS Decimal(8, 2)), NULL, 108, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1345, CAST(N'2017-02-08' AS Date), CAST(15.20 AS Decimal(8, 2)), CAST(15.20 AS Decimal(8, 2)), CAST(15.40 AS Decimal(8, 2)), CAST(15.20 AS Decimal(8, 2)), 14895, 2339058600, CAST(15.00 AS Decimal(8, 2)), NULL, 90, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1344, CAST(N'2017-02-09' AS Date), CAST(14.00 AS Decimal(8, 2)), CAST(15.50 AS Decimal(8, 2)), CAST(15.50 AS Decimal(8, 2)), CAST(13.70 AS Decimal(8, 2)), 27070, 4239641950, CAST(13.00 AS Decimal(8, 2)), NULL, 134, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1343, CAST(N'2017-02-10' AS Date), CAST(12.60 AS Decimal(8, 2)), CAST(11.50 AS Decimal(8, 2)), CAST(12.60 AS Decimal(8, 2)), CAST(11.50 AS Decimal(8, 2)), 19430, 3038860325, CAST(12.00 AS Decimal(8, 2)), NULL, 138, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1342, CAST(N'2017-02-13' AS Date), CAST(11.30 AS Decimal(8, 2)), CAST(11.80 AS Decimal(8, 2)), CAST(11.80 AS Decimal(8, 2)), CAST(11.00 AS Decimal(8, 2)), 30505, 4772049675, CAST(11.00 AS Decimal(8, 2)), NULL, 118, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1341, CAST(N'2017-02-14' AS Date), CAST(9.80 AS Decimal(8, 2)), CAST(10.00 AS Decimal(8, 2)), CAST(10.10 AS Decimal(8, 2)), CAST(9.60 AS Decimal(8, 2)), 57735, 8978372775, CAST(9.00 AS Decimal(8, 2)), NULL, 207, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1340, CAST(N'2017-02-15' AS Date), CAST(8.40 AS Decimal(8, 2)), CAST(9.50 AS Decimal(8, 2)), CAST(9.50 AS Decimal(8, 2)), CAST(8.10 AS Decimal(8, 2)), 20460, 3157216675, CAST(8.00 AS Decimal(8, 2)), NULL, 106, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1339, CAST(N'2017-02-16' AS Date), CAST(5.80 AS Decimal(8, 2)), CAST(6.00 AS Decimal(8, 2)), CAST(6.50 AS Decimal(8, 2)), CAST(5.70 AS Decimal(8, 2)), 19010, 2905495725, CAST(5.00 AS Decimal(8, 2)), NULL, 121, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1338, CAST(N'2017-02-17' AS Date), CAST(4.60 AS Decimal(8, 2)), CAST(6.90 AS Decimal(8, 2)), CAST(6.90 AS Decimal(8, 2)), CAST(4.30 AS Decimal(8, 2)), 14070, 2180527525, CAST(4.00 AS Decimal(8, 2)), NULL, 95, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1337, CAST(N'2017-02-20' AS Date), CAST(5.10 AS Decimal(8, 2)), CAST(4.80 AS Decimal(8, 2)), CAST(5.10 AS Decimal(8, 2)), CAST(4.80 AS Decimal(8, 2)), 4390, 679742600, CAST(4.00 AS Decimal(8, 2)), NULL, 56, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1336, CAST(N'2017-02-21' AS Date), CAST(3.10 AS Decimal(8, 2)), CAST(3.30 AS Decimal(8, 2)), CAST(3.30 AS Decimal(8, 2)), CAST(2.00 AS Decimal(8, 2)), 51420, 7969971225, CAST(2.00 AS Decimal(8, 2)), NULL, 188, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1335, CAST(N'2017-02-22' AS Date), CAST(1.70 AS Decimal(8, 2)), CAST(1.90 AS Decimal(8, 2)), CAST(1.90 AS Decimal(8, 2)), CAST(1.50 AS Decimal(8, 2)), 31480, 4854349275, CAST(1.00 AS Decimal(8, 2)), NULL, 146, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1334, CAST(N'2017-02-23' AS Date), CAST(27.50 AS Decimal(8, 2)), CAST(27.50 AS Decimal(8, 2)), CAST(27.50 AS Decimal(8, 2)), CAST(27.10 AS Decimal(8, 2)), 17365, 2683810275, CAST(27.00 AS Decimal(8, 2)), NULL, 108, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1333, CAST(N'2017-02-24' AS Date), CAST(25.60 AS Decimal(8, 2)), CAST(26.30 AS Decimal(8, 2)), CAST(26.60 AS Decimal(8, 2)), CAST(25.00 AS Decimal(8, 2)), 56500, 8829085825, CAST(26.00 AS Decimal(8, 2)), NULL, 208, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1332, CAST(N'2017-03-01' AS Date), CAST(24.90 AS Decimal(8, 2)), CAST(24.70 AS Decimal(8, 2)), CAST(24.90 AS Decimal(8, 2)), CAST(24.40 AS Decimal(8, 2)), 9060, 1414393200, CAST(24.00 AS Decimal(8, 2)), NULL, 61, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1331, CAST(N'2017-03-02' AS Date), CAST(24.20 AS Decimal(8, 2)), CAST(26.30 AS Decimal(8, 2)), CAST(26.30 AS Decimal(8, 2)), CAST(24.10 AS Decimal(8, 2)), 16700, 2620270300, CAST(24.00 AS Decimal(8, 2)), NULL, 103, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1330, CAST(N'2017-03-03' AS Date), CAST(23.90 AS Decimal(8, 2)), CAST(26.50 AS Decimal(8, 2)), CAST(26.50 AS Decimal(8, 2)), CAST(23.30 AS Decimal(8, 2)), 6700, 1058706275, CAST(23.00 AS Decimal(8, 2)), NULL, 69, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1329, CAST(N'2017-03-06' AS Date), CAST(22.90 AS Decimal(8, 2)), CAST(24.80 AS Decimal(8, 2)), CAST(24.80 AS Decimal(8, 2)), CAST(21.00 AS Decimal(8, 2)), 11690, 1831902650, CAST(23.00 AS Decimal(8, 2)), NULL, 104, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1328, CAST(N'2017-03-07' AS Date), CAST(21.90 AS Decimal(8, 2)), CAST(24.10 AS Decimal(8, 2)), CAST(24.10 AS Decimal(8, 2)), CAST(21.60 AS Decimal(8, 2)), 16830, 2642720375, CAST(21.00 AS Decimal(8, 2)), NULL, 114, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1327, CAST(N'2017-03-08' AS Date), CAST(20.80 AS Decimal(8, 2)), CAST(20.60 AS Decimal(8, 2)), CAST(20.80 AS Decimal(8, 2)), CAST(20.60 AS Decimal(8, 2)), 11975, 1897094800, CAST(20.00 AS Decimal(8, 2)), NULL, 84, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1326, CAST(N'2017-03-09' AS Date), CAST(20.20 AS Decimal(8, 2)), CAST(18.40 AS Decimal(8, 2)), CAST(20.20 AS Decimal(8, 2)), CAST(18.40 AS Decimal(8, 2)), 18320, 2925342175, CAST(20.00 AS Decimal(8, 2)), NULL, 123, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1325, CAST(N'2017-03-10' AS Date), CAST(19.10 AS Decimal(8, 2)), CAST(18.80 AS Decimal(8, 2)), CAST(19.10 AS Decimal(8, 2)), CAST(18.80 AS Decimal(8, 2)), 10135, 1612116950, CAST(18.00 AS Decimal(8, 2)), NULL, 75, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1324, CAST(N'2017-03-13' AS Date), CAST(17.70 AS Decimal(8, 2)), CAST(17.70 AS Decimal(8, 2)), CAST(17.80 AS Decimal(8, 2)), CAST(17.50 AS Decimal(8, 2)), 18880, 2994164725, CAST(17.00 AS Decimal(8, 2)), NULL, 92, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1323, CAST(N'2017-03-14' AS Date), CAST(16.10 AS Decimal(8, 2)), CAST(15.80 AS Decimal(8, 2)), CAST(16.50 AS Decimal(8, 2)), CAST(14.00 AS Decimal(8, 2)), 24265, 3858157450, CAST(16.00 AS Decimal(8, 2)), NULL, 141, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1322, CAST(N'2017-03-15' AS Date), CAST(15.20 AS Decimal(8, 2)), CAST(15.20 AS Decimal(8, 2)), CAST(15.30 AS Decimal(8, 2)), CAST(14.50 AS Decimal(8, 2)), 18420, 2927014700, CAST(15.00 AS Decimal(8, 2)), NULL, 100, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1321, CAST(N'2017-03-16' AS Date), CAST(13.50 AS Decimal(8, 2)), CAST(15.80 AS Decimal(8, 2)), CAST(15.80 AS Decimal(8, 2)), CAST(13.00 AS Decimal(8, 2)), 15200, 2372178900, CAST(13.00 AS Decimal(8, 2)), NULL, 101, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1320, CAST(N'2017-03-17' AS Date), CAST(11.70 AS Decimal(8, 2)), CAST(12.00 AS Decimal(8, 2)), CAST(12.00 AS Decimal(8, 2)), CAST(11.50 AS Decimal(8, 2)), 15445, 2408865125, CAST(11.00 AS Decimal(8, 2)), NULL, 101, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1319, CAST(N'2017-03-20' AS Date), CAST(10.70 AS Decimal(8, 2)), CAST(10.70 AS Decimal(8, 2)), CAST(10.90 AS Decimal(8, 2)), CAST(10.60 AS Decimal(8, 2)), 19585, 3036179925, CAST(10.00 AS Decimal(8, 2)), NULL, 91, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1318, CAST(N'2017-03-21' AS Date), CAST(9.80 AS Decimal(8, 2)), CAST(18.00 AS Decimal(8, 2)), CAST(18.00 AS Decimal(8, 2)), CAST(8.70 AS Decimal(8, 2)), 13695, 2113511625, CAST(10.00 AS Decimal(8, 2)), NULL, 91, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1317, CAST(N'2017-03-22' AS Date), CAST(8.90 AS Decimal(8, 2)), CAST(8.80 AS Decimal(8, 2)), CAST(8.90 AS Decimal(8, 2)), CAST(8.60 AS Decimal(8, 2)), 19680, 3053039825, CAST(8.00 AS Decimal(8, 2)), NULL, 101, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1316, CAST(N'2017-03-23' AS Date), CAST(7.80 AS Decimal(8, 2)), CAST(9.00 AS Decimal(8, 2)), CAST(10.30 AS Decimal(8, 2)), CAST(7.60 AS Decimal(8, 2)), 15410, 2413725300, CAST(7.00 AS Decimal(8, 2)), NULL, 106, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1315, CAST(N'2017-03-24' AS Date), CAST(6.10 AS Decimal(8, 2)), CAST(2.90 AS Decimal(8, 2)), CAST(6.30 AS Decimal(8, 2)), CAST(2.90 AS Decimal(8, 2)), 34730, 5442670075, CAST(6.00 AS Decimal(8, 2)), NULL, 155, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1314, CAST(N'2017-03-27' AS Date), CAST(4.90 AS Decimal(8, 2)), CAST(7.50 AS Decimal(8, 2)), CAST(7.50 AS Decimal(8, 2)), CAST(4.80 AS Decimal(8, 2)), 7280, 1139546600, CAST(5.00 AS Decimal(8, 2)), NULL, 73, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1313, CAST(N'2017-03-28' AS Date), CAST(3.30 AS Decimal(8, 2)), CAST(3.40 AS Decimal(8, 2)), CAST(3.40 AS Decimal(8, 2)), CAST(3.20 AS Decimal(8, 2)), 15055, 2358794400, CAST(3.00 AS Decimal(8, 2)), NULL, 92, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1312, CAST(N'2017-03-29' AS Date), CAST(2.00 AS Decimal(8, 2)), CAST(2.00 AS Decimal(8, 2)), CAST(2.10 AS Decimal(8, 2)), CAST(1.90 AS Decimal(8, 2)), 18735, 2927218625, CAST(1.00 AS Decimal(8, 2)), NULL, 99, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1311, CAST(N'2017-03-30' AS Date), CAST(19.20 AS Decimal(8, 2)), CAST(18.00 AS Decimal(8, 2)), CAST(19.30 AS Decimal(8, 2)), CAST(18.00 AS Decimal(8, 2)), 27545, 4329909750, CAST(19.00 AS Decimal(8, 2)), NULL, 165, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1310, CAST(N'2017-03-31' AS Date), CAST(18.10 AS Decimal(8, 2)), CAST(18.00 AS Decimal(8, 2)), CAST(18.40 AS Decimal(8, 2)), CAST(17.50 AS Decimal(8, 2)), 49120, 7826018075, CAST(18.00 AS Decimal(8, 2)), NULL, 290, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1309, CAST(N'2017-04-03' AS Date), CAST(18.60 AS Decimal(8, 2)), CAST(18.50 AS Decimal(8, 2)), CAST(18.80 AS Decimal(8, 2)), CAST(18.50 AS Decimal(8, 2)), 23420, 3671444700, CAST(18.00 AS Decimal(8, 2)), NULL, 81, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1308, CAST(N'2017-04-04' AS Date), CAST(17.30 AS Decimal(8, 2)), CAST(17.30 AS Decimal(8, 2)), CAST(17.50 AS Decimal(8, 2)), CAST(17.30 AS Decimal(8, 2)), 13205, 2073497250, CAST(17.00 AS Decimal(8, 2)), NULL, 76, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1307, CAST(N'2017-04-05' AS Date), CAST(16.00 AS Decimal(8, 2)), CAST(15.70 AS Decimal(8, 2)), CAST(16.00 AS Decimal(8, 2)), CAST(15.70 AS Decimal(8, 2)), 16720, 2598434625, CAST(15.00 AS Decimal(8, 2)), NULL, 90, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1306, CAST(N'2017-04-06' AS Date), CAST(15.00 AS Decimal(8, 2)), CAST(17.50 AS Decimal(8, 2)), CAST(17.50 AS Decimal(8, 2)), CAST(15.00 AS Decimal(8, 2)), 14570, 2281057350, CAST(15.00 AS Decimal(8, 2)), NULL, 132, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1305, CAST(N'2017-04-07' AS Date), CAST(14.70 AS Decimal(8, 2)), CAST(14.50 AS Decimal(8, 2)), CAST(14.90 AS Decimal(8, 2)), CAST(14.50 AS Decimal(8, 2)), 18030, 2835200750, CAST(14.00 AS Decimal(8, 2)), NULL, 94, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1304, CAST(N'2017-04-10' AS Date), CAST(13.50 AS Decimal(8, 2)), CAST(13.40 AS Decimal(8, 2)), CAST(14.00 AS Decimal(8, 2)), CAST(13.40 AS Decimal(8, 2)), 18175, 2866602725, CAST(13.00 AS Decimal(8, 2)), NULL, 80, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1303, CAST(N'2017-04-11' AS Date), CAST(12.40 AS Decimal(8, 2)), CAST(12.30 AS Decimal(8, 2)), CAST(12.60 AS Decimal(8, 2)), CAST(12.30 AS Decimal(8, 2)), 18340, 2893008125, CAST(12.00 AS Decimal(8, 2)), NULL, 93, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1302, CAST(N'2017-04-12' AS Date), CAST(11.50 AS Decimal(8, 2)), CAST(11.60 AS Decimal(8, 2)), CAST(12.00 AS Decimal(8, 2)), CAST(11.20 AS Decimal(8, 2)), 21300, 3363061275, CAST(11.00 AS Decimal(8, 2)), NULL, 112, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1301, CAST(N'2017-04-13' AS Date), CAST(10.50 AS Decimal(8, 2)), CAST(10.80 AS Decimal(8, 2)), CAST(10.80 AS Decimal(8, 2)), CAST(10.40 AS Decimal(8, 2)), 42760, 6707932475, CAST(10.00 AS Decimal(8, 2)), NULL, 210, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1300, CAST(N'2017-04-17' AS Date), CAST(9.30 AS Decimal(8, 2)), CAST(9.10 AS Decimal(8, 2)), CAST(9.50 AS Decimal(8, 2)), CAST(9.00 AS Decimal(8, 2)), 20715, 3224175025, CAST(9.00 AS Decimal(8, 2)), NULL, 129, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1299, CAST(N'2017-04-18' AS Date), CAST(7.70 AS Decimal(8, 2)), CAST(7.70 AS Decimal(8, 2)), CAST(7.70 AS Decimal(8, 2)), CAST(7.50 AS Decimal(8, 2)), 15555, 2413718100, CAST(7.00 AS Decimal(8, 2)), NULL, 72, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1298, CAST(N'2017-04-19' AS Date), CAST(6.70 AS Decimal(8, 2)), CAST(6.70 AS Decimal(8, 2)), CAST(8.50 AS Decimal(8, 2)), CAST(6.60 AS Decimal(8, 2)), 18445, 2892234925, CAST(6.00 AS Decimal(8, 2)), NULL, 115, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1297, CAST(N'2017-04-20' AS Date), CAST(5.50 AS Decimal(8, 2)), CAST(4.50 AS Decimal(8, 2)), CAST(7.00 AS Decimal(8, 2)), CAST(4.50 AS Decimal(8, 2)), 26875, 4234026750, CAST(5.00 AS Decimal(8, 2)), NULL, 139, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1296, CAST(N'2017-04-24' AS Date), CAST(4.40 AS Decimal(8, 2)), CAST(4.10 AS Decimal(8, 2)), CAST(5.00 AS Decimal(8, 2)), CAST(4.10 AS Decimal(8, 2)), 24210, 3788169600, CAST(4.00 AS Decimal(8, 2)), NULL, 108, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1295, CAST(N'2017-04-25' AS Date), CAST(3.20 AS Decimal(8, 2)), CAST(5.10 AS Decimal(8, 2)), CAST(5.10 AS Decimal(8, 2)), CAST(3.10 AS Decimal(8, 2)), 13735, 2170744300, CAST(3.00 AS Decimal(8, 2)), NULL, 105, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1294, CAST(N'2017-04-26' AS Date), CAST(2.10 AS Decimal(8, 2)), CAST(2.00 AS Decimal(8, 2)), CAST(2.30 AS Decimal(8, 2)), CAST(2.00 AS Decimal(8, 2)), 28910, 4606698625, CAST(2.00 AS Decimal(8, 2)), NULL, 165, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1293, CAST(N'2017-04-27' AS Date), CAST(26.50 AS Decimal(8, 2)), CAST(26.70 AS Decimal(8, 2)), CAST(26.70 AS Decimal(8, 2)), CAST(26.00 AS Decimal(8, 2)), 15920, 2549452475, CAST(26.00 AS Decimal(8, 2)), NULL, 115, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1292, CAST(N'2017-04-28' AS Date), CAST(25.80 AS Decimal(8, 2)), CAST(25.90 AS Decimal(8, 2)), CAST(26.00 AS Decimal(8, 2)), CAST(25.40 AS Decimal(8, 2)), 57625, 9289266075, CAST(25.00 AS Decimal(8, 2)), NULL, 226, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1291, CAST(N'2017-05-02' AS Date), CAST(24.00 AS Decimal(8, 2)), CAST(24.20 AS Decimal(8, 2)), CAST(24.20 AS Decimal(8, 2)), CAST(23.90 AS Decimal(8, 2)), 7565, 1209054025, CAST(24.00 AS Decimal(8, 2)), NULL, 73, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1290, CAST(N'2017-05-03' AS Date), CAST(22.80 AS Decimal(8, 2)), CAST(22.70 AS Decimal(8, 2)), CAST(22.90 AS Decimal(8, 2)), CAST(22.70 AS Decimal(8, 2)), 5250, 832573050, CAST(22.00 AS Decimal(8, 2)), NULL, 53, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1289, CAST(N'2017-05-04' AS Date), CAST(21.50 AS Decimal(8, 2)), CAST(21.40 AS Decimal(8, 2)), CAST(21.60 AS Decimal(8, 2)), CAST(21.30 AS Decimal(8, 2)), 16160, 2585131125, CAST(21.00 AS Decimal(8, 2)), NULL, 81, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1288, CAST(N'2017-05-05' AS Date), CAST(20.70 AS Decimal(8, 2)), CAST(20.00 AS Decimal(8, 2)), CAST(20.70 AS Decimal(8, 2)), CAST(20.00 AS Decimal(8, 2)), 9665, 1544923425, CAST(20.00 AS Decimal(8, 2)), NULL, 63, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1287, CAST(N'2017-05-08' AS Date), CAST(19.90 AS Decimal(8, 2)), CAST(19.80 AS Decimal(8, 2)), CAST(20.10 AS Decimal(8, 2)), CAST(19.70 AS Decimal(8, 2)), 15995, 2570161250, CAST(19.00 AS Decimal(8, 2)), NULL, 69, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1286, CAST(N'2017-05-09' AS Date), CAST(18.60 AS Decimal(8, 2)), CAST(16.80 AS Decimal(8, 2)), CAST(19.00 AS Decimal(8, 2)), CAST(16.70 AS Decimal(8, 2)), 12455, 1995487950, CAST(18.00 AS Decimal(8, 2)), NULL, 101, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1285, CAST(N'2017-05-10' AS Date), CAST(17.60 AS Decimal(8, 2)), CAST(17.60 AS Decimal(8, 2)), CAST(17.60 AS Decimal(8, 2)), CAST(17.50 AS Decimal(8, 2)), 14145, 2247743200, CAST(17.00 AS Decimal(8, 2)), NULL, 84, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1284, CAST(N'2017-05-11' AS Date), CAST(16.00 AS Decimal(8, 2)), CAST(14.00 AS Decimal(8, 2)), CAST(16.10 AS Decimal(8, 2)), CAST(14.00 AS Decimal(8, 2)), 13355, 2118042450, CAST(16.00 AS Decimal(8, 2)), NULL, 97, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1283, CAST(N'2017-05-12' AS Date), CAST(14.70 AS Decimal(8, 2)), CAST(13.10 AS Decimal(8, 2)), CAST(15.00 AS Decimal(8, 2)), CAST(13.10 AS Decimal(8, 2)), 20475, 3218259750, CAST(14.00 AS Decimal(8, 2)), NULL, 123, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1282, CAST(N'2017-05-15' AS Date), CAST(13.00 AS Decimal(8, 2)), CAST(13.20 AS Decimal(8, 2)), CAST(13.30 AS Decimal(8, 2)), CAST(12.90 AS Decimal(8, 2)), 16225, 2526352750, CAST(13.00 AS Decimal(8, 2)), NULL, 94, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1281, CAST(N'2017-05-16' AS Date), CAST(11.90 AS Decimal(8, 2)), CAST(13.90 AS Decimal(8, 2)), CAST(13.90 AS Decimal(8, 2)), CAST(11.90 AS Decimal(8, 2)), 10705, 1661614375, CAST(11.00 AS Decimal(8, 2)), NULL, 72, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1280, CAST(N'2017-05-17' AS Date), CAST(10.60 AS Decimal(8, 2)), CAST(10.30 AS Decimal(8, 2)), CAST(10.70 AS Decimal(8, 2)), CAST(10.30 AS Decimal(8, 2)), 16660, 2597467850, CAST(10.00 AS Decimal(8, 2)), NULL, 74, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1279, CAST(N'2017-05-18' AS Date), CAST(18.40 AS Decimal(8, 2)), CAST(11.00 AS Decimal(8, 2)), CAST(18.40 AS Decimal(8, 2)), CAST(11.00 AS Decimal(8, 2)), 1880, 319017150, CAST(13.00 AS Decimal(8, 2)), NULL, 11, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1278, CAST(N'2017-05-19' AS Date), CAST(11.00 AS Decimal(8, 2)), CAST(10.10 AS Decimal(8, 2)), CAST(11.50 AS Decimal(8, 2)), CAST(10.10 AS Decimal(8, 2)), 8775, 1447268075, CAST(10.00 AS Decimal(8, 2)), NULL, 89, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1277, CAST(N'2017-05-22' AS Date), CAST(10.20 AS Decimal(8, 2)), CAST(8.00 AS Decimal(8, 2)), CAST(10.80 AS Decimal(8, 2)), CAST(8.00 AS Decimal(8, 2)), 25325, 4173385550, CAST(9.00 AS Decimal(8, 2)), NULL, 154, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1276, CAST(N'2017-05-23' AS Date), CAST(8.80 AS Decimal(8, 2)), CAST(8.90 AS Decimal(8, 2)), CAST(9.20 AS Decimal(8, 2)), CAST(7.50 AS Decimal(8, 2)), 36670, 6002742425, CAST(8.00 AS Decimal(8, 2)), NULL, 153, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1275, CAST(N'2017-05-24' AS Date), CAST(6.20 AS Decimal(8, 2)), CAST(8.10 AS Decimal(8, 2)), CAST(8.10 AS Decimal(8, 2)), CAST(6.10 AS Decimal(8, 2)), 23950, 3914809575, CAST(6.00 AS Decimal(8, 2)), NULL, 109, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1274, CAST(N'2017-05-25' AS Date), CAST(3.50 AS Decimal(8, 2)), CAST(3.80 AS Decimal(8, 2)), CAST(3.80 AS Decimal(8, 2)), CAST(3.40 AS Decimal(8, 2)), 18290, 3004967575, CAST(3.00 AS Decimal(8, 2)), NULL, 123, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1273, CAST(N'2017-05-26' AS Date), CAST(2.50 AS Decimal(8, 2)), CAST(2.50 AS Decimal(8, 2)), CAST(2.90 AS Decimal(8, 2)), CAST(1.50 AS Decimal(8, 2)), 24155, 3941961050, CAST(2.00 AS Decimal(8, 2)), NULL, 107, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1272, CAST(N'2017-05-29' AS Date), CAST(2.60 AS Decimal(8, 2)), CAST(1.50 AS Decimal(8, 2)), CAST(2.80 AS Decimal(8, 2)), CAST(1.50 AS Decimal(8, 2)), 8180, 1338846400, CAST(2.00 AS Decimal(8, 2)), NULL, 90, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1271, CAST(N'2017-05-30' AS Date), CAST(25.30 AS Decimal(8, 2)), CAST(25.00 AS Decimal(8, 2)), CAST(25.50 AS Decimal(8, 2)), CAST(24.70 AS Decimal(8, 2)), 16250, 2674078850, CAST(25.00 AS Decimal(8, 2)), NULL, 78, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1270, CAST(N'2017-05-31' AS Date), CAST(23.90 AS Decimal(8, 2)), CAST(23.60 AS Decimal(8, 2)), CAST(24.10 AS Decimal(8, 2)), CAST(23.60 AS Decimal(8, 2)), 61280, 10011967800, CAST(23.00 AS Decimal(8, 2)), NULL, 250, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1269, CAST(N'2017-06-01' AS Date), CAST(22.40 AS Decimal(8, 2)), CAST(22.80 AS Decimal(8, 2)), CAST(22.80 AS Decimal(8, 2)), CAST(22.30 AS Decimal(8, 2)), 22235, 3616726300, CAST(22.00 AS Decimal(8, 2)), NULL, 147, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1268, CAST(N'2017-06-02' AS Date), CAST(21.20 AS Decimal(8, 2)), CAST(20.00 AS Decimal(8, 2)), CAST(21.40 AS Decimal(8, 2)), CAST(20.00 AS Decimal(8, 2)), 12545, 2045667800, CAST(21.00 AS Decimal(8, 2)), NULL, 82, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1267, CAST(N'2017-06-05' AS Date), CAST(20.40 AS Decimal(8, 2)), CAST(19.70 AS Decimal(8, 2)), CAST(20.50 AS Decimal(8, 2)), CAST(19.70 AS Decimal(8, 2)), 23160, 3824147575, CAST(20.00 AS Decimal(8, 2)), NULL, 108, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1266, CAST(N'2017-06-06' AS Date), CAST(19.40 AS Decimal(8, 2)), CAST(20.60 AS Decimal(8, 2)), CAST(20.60 AS Decimal(8, 2)), CAST(19.30 AS Decimal(8, 2)), 11080, 1828807425, CAST(19.00 AS Decimal(8, 2)), NULL, 79, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1265, CAST(N'2017-06-07' AS Date), CAST(18.10 AS Decimal(8, 2)), CAST(18.00 AS Decimal(8, 2)), CAST(18.20 AS Decimal(8, 2)), CAST(18.00 AS Decimal(8, 2)), 12465, 2052238600, CAST(18.00 AS Decimal(8, 2)), NULL, 76, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1264, CAST(N'2017-06-08' AS Date), CAST(16.70 AS Decimal(8, 2)), CAST(16.90 AS Decimal(8, 2)), CAST(17.00 AS Decimal(8, 2)), CAST(16.70 AS Decimal(8, 2)), 19675, 3246943950, CAST(16.00 AS Decimal(8, 2)), NULL, 107, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1263, CAST(N'2017-06-09' AS Date), CAST(15.50 AS Decimal(8, 2)), CAST(15.60 AS Decimal(8, 2)), CAST(15.60 AS Decimal(8, 2)), CAST(15.30 AS Decimal(8, 2)), 11275, 1854404125, CAST(15.00 AS Decimal(8, 2)), NULL, 81, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1262, CAST(N'2017-06-12' AS Date), CAST(14.40 AS Decimal(8, 2)), CAST(14.00 AS Decimal(8, 2)), CAST(16.00 AS Decimal(8, 2)), CAST(14.00 AS Decimal(8, 2)), 15340, 2541121825, CAST(14.00 AS Decimal(8, 2)), NULL, 86, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1261, CAST(N'2017-06-13' AS Date), CAST(13.30 AS Decimal(8, 2)), CAST(13.40 AS Decimal(8, 2)), CAST(13.50 AS Decimal(8, 2)), CAST(13.20 AS Decimal(8, 2)), 28050, 4676156700, CAST(13.00 AS Decimal(8, 2)), NULL, 118, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1260, CAST(N'2017-06-14' AS Date), CAST(12.60 AS Decimal(8, 2)), CAST(12.70 AS Decimal(8, 2)), CAST(14.00 AS Decimal(8, 2)), CAST(12.50 AS Decimal(8, 2)), 14885, 2453303925, CAST(12.00 AS Decimal(8, 2)), NULL, 112, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1259, CAST(N'2017-06-16' AS Date), CAST(11.40 AS Decimal(8, 2)), CAST(11.20 AS Decimal(8, 2)), CAST(11.50 AS Decimal(8, 2)), CAST(11.20 AS Decimal(8, 2)), 6920, 1142001450, CAST(11.00 AS Decimal(8, 2)), NULL, 67, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1258, CAST(N'2017-06-19' AS Date), CAST(9.90 AS Decimal(8, 2)), CAST(9.70 AS Decimal(8, 2)), CAST(10.00 AS Decimal(8, 2)), CAST(9.70 AS Decimal(8, 2)), 16980, 2808033175, CAST(9.00 AS Decimal(8, 2)), NULL, 91, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1257, CAST(N'2017-06-20' AS Date), CAST(8.50 AS Decimal(8, 2)), CAST(8.50 AS Decimal(8, 2)), CAST(8.50 AS Decimal(8, 2)), CAST(8.40 AS Decimal(8, 2)), 14040, 2332723100, CAST(8.00 AS Decimal(8, 2)), NULL, 69, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1256, CAST(N'2017-06-21' AS Date), CAST(7.30 AS Decimal(8, 2)), CAST(9.50 AS Decimal(8, 2)), CAST(9.50 AS Decimal(8, 2)), CAST(7.10 AS Decimal(8, 2)), 11125, 1853405050, CAST(7.00 AS Decimal(8, 2)), NULL, 77, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1255, CAST(N'2017-06-22' AS Date), CAST(6.70 AS Decimal(8, 2)), CAST(8.50 AS Decimal(8, 2)), CAST(8.50 AS Decimal(8, 2)), CAST(6.60 AS Decimal(8, 2)), 22995, 3843549125, CAST(6.00 AS Decimal(8, 2)), NULL, 105, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1254, CAST(N'2017-06-23' AS Date), CAST(5.30 AS Decimal(8, 2)), CAST(5.30 AS Decimal(8, 2)), CAST(5.40 AS Decimal(8, 2)), CAST(5.00 AS Decimal(8, 2)), 36915, 6163864400, CAST(5.00 AS Decimal(8, 2)), NULL, 133, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1253, CAST(N'2017-06-26' AS Date), CAST(4.30 AS Decimal(8, 2)), CAST(4.50 AS Decimal(8, 2)), CAST(4.70 AS Decimal(8, 2)), CAST(4.20 AS Decimal(8, 2)), 9300, 1542436300, CAST(4.00 AS Decimal(8, 2)), NULL, 60, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1252, CAST(N'2017-06-27' AS Date), CAST(3.20 AS Decimal(8, 2)), CAST(3.30 AS Decimal(8, 2)), CAST(6.00 AS Decimal(8, 2)), CAST(3.10 AS Decimal(8, 2)), 18175, 3017417400, CAST(3.00 AS Decimal(8, 2)), NULL, 98, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1251, CAST(N'2017-06-28' AS Date), CAST(2.30 AS Decimal(8, 2)), CAST(4.20 AS Decimal(8, 2)), CAST(4.20 AS Decimal(8, 2)), CAST(2.10 AS Decimal(8, 2)), 23990, 3964626550, CAST(2.00 AS Decimal(8, 2)), NULL, 117, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1250, CAST(N'2017-06-29' AS Date), CAST(21.80 AS Decimal(8, 2)), CAST(21.00 AS Decimal(8, 2)), CAST(22.40 AS Decimal(8, 2)), CAST(20.00 AS Decimal(8, 2)), 36295, 6019737125, CAST(21.00 AS Decimal(8, 2)), NULL, 176, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1249, CAST(N'2017-06-30' AS Date), CAST(20.10 AS Decimal(8, 2)), CAST(20.00 AS Decimal(8, 2)), CAST(20.50 AS Decimal(8, 2)), CAST(19.70 AS Decimal(8, 2)), 60355, 10044267400, CAST(20.00 AS Decimal(8, 2)), NULL, 215, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1248, CAST(N'2017-07-03' AS Date), CAST(18.70 AS Decimal(8, 2)), CAST(18.90 AS Decimal(8, 2)), CAST(19.00 AS Decimal(8, 2)), CAST(18.70 AS Decimal(8, 2)), 13340, 2214576775, CAST(18.00 AS Decimal(8, 2)), NULL, 75, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1247, CAST(N'2017-07-04' AS Date), CAST(19.30 AS Decimal(8, 2)), CAST(18.20 AS Decimal(8, 2)), CAST(19.40 AS Decimal(8, 2)), CAST(18.20 AS Decimal(8, 2)), 3230, 536862300, CAST(19.00 AS Decimal(8, 2)), NULL, 47, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1246, CAST(N'2017-07-05' AS Date), CAST(17.90 AS Decimal(8, 2)), CAST(18.10 AS Decimal(8, 2)), CAST(18.10 AS Decimal(8, 2)), CAST(17.80 AS Decimal(8, 2)), 15575, 2598806225, CAST(17.00 AS Decimal(8, 2)), NULL, 66, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1245, CAST(N'2017-07-06' AS Date), CAST(17.30 AS Decimal(8, 2)), CAST(17.30 AS Decimal(8, 2)), CAST(17.60 AS Decimal(8, 2)), CAST(17.30 AS Decimal(8, 2)), 21940, 3646214200, CAST(17.00 AS Decimal(8, 2)), NULL, 112, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1244, CAST(N'2017-07-07' AS Date), CAST(16.30 AS Decimal(8, 2)), CAST(16.30 AS Decimal(8, 2)), CAST(16.40 AS Decimal(8, 2)), CAST(16.00 AS Decimal(8, 2)), 15090, 2494203050, CAST(16.00 AS Decimal(8, 2)), NULL, 71, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1243, CAST(N'2017-07-10' AS Date), CAST(15.20 AS Decimal(8, 2)), CAST(15.00 AS Decimal(8, 2)), CAST(15.30 AS Decimal(8, 2)), CAST(14.90 AS Decimal(8, 2)), 18350, 3009504050, CAST(15.00 AS Decimal(8, 2)), NULL, 95, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1242, CAST(N'2017-07-11' AS Date), CAST(14.10 AS Decimal(8, 2)), CAST(14.10 AS Decimal(8, 2)), CAST(14.20 AS Decimal(8, 2)), CAST(12.90 AS Decimal(8, 2)), 12705, 2074866200, CAST(14.00 AS Decimal(8, 2)), NULL, 76, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1241, CAST(N'2017-07-12' AS Date), CAST(12.80 AS Decimal(8, 2)), CAST(12.40 AS Decimal(8, 2)), CAST(13.00 AS Decimal(8, 2)), CAST(12.40 AS Decimal(8, 2)), 26465, 4286342825, CAST(12.00 AS Decimal(8, 2)), NULL, 106, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1240, CAST(N'2017-07-13' AS Date), CAST(11.50 AS Decimal(8, 2)), CAST(11.60 AS Decimal(8, 2)), CAST(11.70 AS Decimal(8, 2)), CAST(11.40 AS Decimal(8, 2)), 29930, 4822274875, CAST(11.00 AS Decimal(8, 2)), NULL, 104, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1239, CAST(N'2017-07-14' AS Date), CAST(10.20 AS Decimal(8, 2)), CAST(10.30 AS Decimal(8, 2)), CAST(10.40 AS Decimal(8, 2)), CAST(10.10 AS Decimal(8, 2)), 21320, 3411356850, CAST(10.00 AS Decimal(8, 2)), NULL, 111, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1238, CAST(N'2017-07-17' AS Date), CAST(8.50 AS Decimal(8, 2)), CAST(8.40 AS Decimal(8, 2)), CAST(8.70 AS Decimal(8, 2)), CAST(8.40 AS Decimal(8, 2)), 19540, 3117302175, CAST(8.00 AS Decimal(8, 2)), NULL, 72, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1237, CAST(N'2017-07-18' AS Date), CAST(7.80 AS Decimal(8, 2)), CAST(9.30 AS Decimal(8, 2)), CAST(9.30 AS Decimal(8, 2)), CAST(7.60 AS Decimal(8, 2)), 18020, 2860241950, CAST(7.00 AS Decimal(8, 2)), NULL, 87, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1236, CAST(N'2017-07-19' AS Date), CAST(6.60 AS Decimal(8, 2)), CAST(6.70 AS Decimal(8, 2)), CAST(6.80 AS Decimal(8, 2)), CAST(6.60 AS Decimal(8, 2)), 13335, 2106922600, CAST(6.00 AS Decimal(8, 2)), NULL, 64, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1235, CAST(N'2017-07-20' AS Date), CAST(6.10 AS Decimal(8, 2)), CAST(6.10 AS Decimal(8, 2)), CAST(6.10 AS Decimal(8, 2)), CAST(5.80 AS Decimal(8, 2)), 31920, 5021287775, CAST(5.00 AS Decimal(8, 2)), NULL, 136, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1234, CAST(N'2017-07-21' AS Date), CAST(5.20 AS Decimal(8, 2)), CAST(5.50 AS Decimal(8, 2)), CAST(5.50 AS Decimal(8, 2)), CAST(5.10 AS Decimal(8, 2)), 20165, 3156649050, CAST(5.00 AS Decimal(8, 2)), NULL, 92, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1233, CAST(N'2017-07-24' AS Date), CAST(4.00 AS Decimal(8, 2)), CAST(4.00 AS Decimal(8, 2)), CAST(4.10 AS Decimal(8, 2)), CAST(3.80 AS Decimal(8, 2)), 17875, 2815202425, CAST(3.00 AS Decimal(8, 2)), NULL, 99, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1232, CAST(N'2017-07-25' AS Date), CAST(2.70 AS Decimal(8, 2)), CAST(2.70 AS Decimal(8, 2)), CAST(3.90 AS Decimal(8, 2)), CAST(2.50 AS Decimal(8, 2)), 19935, 3148020225, CAST(2.00 AS Decimal(8, 2)), NULL, 98, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1231, CAST(N'2017-07-26' AS Date), CAST(1.50 AS Decimal(8, 2)), CAST(2.50 AS Decimal(8, 2)), CAST(2.50 AS Decimal(8, 2)), CAST(1.30 AS Decimal(8, 2)), 20985, 3323111900, CAST(1.00 AS Decimal(8, 2)), NULL, 134, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1230, CAST(N'2017-07-27' AS Date), CAST(1.20 AS Decimal(8, 2)), CAST(1.60 AS Decimal(8, 2)), CAST(1.60 AS Decimal(8, 2)), CAST(1.20 AS Decimal(8, 2)), 26735, 4214192025, CAST(1.00 AS Decimal(8, 2)), NULL, 130, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1229, CAST(N'2017-07-28' AS Date), CAST(20.50 AS Decimal(8, 2)), CAST(20.60 AS Decimal(8, 2)), CAST(20.70 AS Decimal(8, 2)), CAST(20.30 AS Decimal(8, 2)), 13070, 2069146450, CAST(20.00 AS Decimal(8, 2)), NULL, 117, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1228, CAST(N'2017-07-31' AS Date), CAST(19.80 AS Decimal(8, 2)), CAST(19.80 AS Decimal(8, 2)), CAST(19.90 AS Decimal(8, 2)), CAST(19.60 AS Decimal(8, 2)), 50175, 7903840625, CAST(19.00 AS Decimal(8, 2)), NULL, 138, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1227, CAST(N'2017-08-01' AS Date), CAST(18.70 AS Decimal(8, 2)), CAST(18.70 AS Decimal(8, 2)), CAST(18.70 AS Decimal(8, 2)), CAST(18.50 AS Decimal(8, 2)), 8860, 1388689975, CAST(18.00 AS Decimal(8, 2)), NULL, 55, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1226, CAST(N'2017-08-02' AS Date), CAST(17.60 AS Decimal(8, 2)), CAST(16.30 AS Decimal(8, 2)), CAST(17.70 AS Decimal(8, 2)), CAST(16.30 AS Decimal(8, 2)), 8435, 1326130550, CAST(17.00 AS Decimal(8, 2)), NULL, 55, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1225, CAST(N'2017-08-03' AS Date), CAST(17.00 AS Decimal(8, 2)), CAST(17.10 AS Decimal(8, 2)), CAST(17.10 AS Decimal(8, 2)), CAST(16.80 AS Decimal(8, 2)), 11355, 1780673200, CAST(16.00 AS Decimal(8, 2)), NULL, 77, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1224, CAST(N'2017-08-04' AS Date), CAST(16.00 AS Decimal(8, 2)), CAST(17.90 AS Decimal(8, 2)), CAST(17.90 AS Decimal(8, 2)), CAST(15.80 AS Decimal(8, 2)), 12130, 1903437600, CAST(16.00 AS Decimal(8, 2)), NULL, 71, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1223, CAST(N'2017-08-07' AS Date), CAST(14.90 AS Decimal(8, 2)), CAST(16.50 AS Decimal(8, 2)), CAST(16.50 AS Decimal(8, 2)), CAST(14.70 AS Decimal(8, 2)), 13045, 2049048775, CAST(14.00 AS Decimal(8, 2)), NULL, 54, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1222, CAST(N'2017-08-08' AS Date), CAST(13.70 AS Decimal(8, 2)), CAST(14.00 AS Decimal(8, 2)), CAST(14.00 AS Decimal(8, 2)), CAST(13.40 AS Decimal(8, 2)), 13190, 2074555175, CAST(13.00 AS Decimal(8, 2)), NULL, 91, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1221, CAST(N'2017-08-09' AS Date), CAST(12.80 AS Decimal(8, 2)), CAST(12.90 AS Decimal(8, 2)), CAST(13.50 AS Decimal(8, 2)), CAST(12.70 AS Decimal(8, 2)), 15010, 2370999500, CAST(12.00 AS Decimal(8, 2)), NULL, 89, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1220, CAST(N'2017-08-10' AS Date), CAST(12.80 AS Decimal(8, 2)), CAST(12.80 AS Decimal(8, 2)), CAST(13.30 AS Decimal(8, 2)), CAST(12.80 AS Decimal(8, 2)), 23610, 3738999050, CAST(13.00 AS Decimal(8, 2)), NULL, 119, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1219, CAST(N'2017-08-11' AS Date), CAST(12.40 AS Decimal(8, 2)), CAST(12.40 AS Decimal(8, 2)), CAST(12.70 AS Decimal(8, 2)), CAST(12.40 AS Decimal(8, 2)), 10875, 1730201925, CAST(12.00 AS Decimal(8, 2)), NULL, 80, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1218, CAST(N'2017-08-14' AS Date), CAST(11.70 AS Decimal(8, 2)), CAST(12.00 AS Decimal(8, 2)), CAST(12.10 AS Decimal(8, 2)), CAST(11.70 AS Decimal(8, 2)), 20205, 3233477075, CAST(11.00 AS Decimal(8, 2)), NULL, 118, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1217, CAST(N'2017-08-15' AS Date), CAST(11.00 AS Decimal(8, 2)), CAST(10.90 AS Decimal(8, 2)), CAST(11.10 AS Decimal(8, 2)), CAST(10.80 AS Decimal(8, 2)), 15830, 2539625675, CAST(11.00 AS Decimal(8, 2)), NULL, 80, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1216, CAST(N'2017-08-16' AS Date), CAST(9.60 AS Decimal(8, 2)), CAST(9.70 AS Decimal(8, 2)), CAST(10.00 AS Decimal(8, 2)), CAST(9.60 AS Decimal(8, 2)), 13215, 2099014650, CAST(9.00 AS Decimal(8, 2)), NULL, 77, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1215, CAST(N'2017-08-17' AS Date), CAST(9.30 AS Decimal(8, 2)), CAST(10.80 AS Decimal(8, 2)), CAST(10.80 AS Decimal(8, 2)), CAST(9.30 AS Decimal(8, 2)), 16535, 2620531250, CAST(9.00 AS Decimal(8, 2)), NULL, 104, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1214, CAST(N'2017-08-18' AS Date), CAST(8.40 AS Decimal(8, 2)), CAST(8.70 AS Decimal(8, 2)), CAST(8.70 AS Decimal(8, 2)), CAST(8.30 AS Decimal(8, 2)), 12840, 2037582800, CAST(8.00 AS Decimal(8, 2)), NULL, 84, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1213, CAST(N'2017-08-21' AS Date), CAST(7.40 AS Decimal(8, 2)), CAST(7.30 AS Decimal(8, 2)), CAST(7.40 AS Decimal(8, 2)), CAST(7.20 AS Decimal(8, 2)), 16445, 2591391675, CAST(7.00 AS Decimal(8, 2)), NULL, 82, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1212, CAST(N'2017-08-22' AS Date), CAST(6.10 AS Decimal(8, 2)), CAST(6.10 AS Decimal(8, 2)), CAST(6.40 AS Decimal(8, 2)), CAST(6.10 AS Decimal(8, 2)), 18015, 2846419575, CAST(6.00 AS Decimal(8, 2)), NULL, 87, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1211, CAST(N'2017-08-23' AS Date), CAST(5.00 AS Decimal(8, 2)), CAST(5.20 AS Decimal(8, 2)), CAST(5.20 AS Decimal(8, 2)), CAST(4.90 AS Decimal(8, 2)), 28725, 4541307900, CAST(5.00 AS Decimal(8, 2)), NULL, 108, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1210, CAST(N'2017-08-24' AS Date), CAST(4.60 AS Decimal(8, 2)), CAST(6.00 AS Decimal(8, 2)), CAST(6.00 AS Decimal(8, 2)), CAST(4.30 AS Decimal(8, 2)), 16505, 2595317225, CAST(4.00 AS Decimal(8, 2)), NULL, 100, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1209, CAST(N'2017-08-25' AS Date), CAST(3.40 AS Decimal(8, 2)), CAST(3.70 AS Decimal(8, 2)), CAST(3.70 AS Decimal(8, 2)), CAST(3.30 AS Decimal(8, 2)), 10590, 1667708575, CAST(3.00 AS Decimal(8, 2)), NULL, 70, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1208, CAST(N'2017-08-28' AS Date), CAST(2.40 AS Decimal(8, 2)), CAST(2.60 AS Decimal(8, 2)), CAST(2.60 AS Decimal(8, 2)), CAST(2.30 AS Decimal(8, 2)), 11305, 1785443525, CAST(2.00 AS Decimal(8, 2)), NULL, 75, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1207, CAST(N'2017-08-29' AS Date), CAST(1.40 AS Decimal(8, 2)), CAST(1.50 AS Decimal(8, 2)), CAST(1.50 AS Decimal(8, 2)), CAST(1.30 AS Decimal(8, 2)), 12075, 1914452675, CAST(1.00 AS Decimal(8, 2)), NULL, 100, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1206, CAST(N'2017-08-30' AS Date), CAST(14.90 AS Decimal(8, 2)), CAST(13.90 AS Decimal(8, 2)), CAST(14.90 AS Decimal(8, 2)), CAST(13.90 AS Decimal(8, 2)), 15455, 2455652425, CAST(14.00 AS Decimal(8, 2)), NULL, 102, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1205, CAST(N'2017-08-31' AS Date), CAST(13.90 AS Decimal(8, 2)), CAST(14.00 AS Decimal(8, 2)), CAST(14.00 AS Decimal(8, 2)), CAST(11.80 AS Decimal(8, 2)), 62110, 9814883750, CAST(13.00 AS Decimal(8, 2)), NULL, 213, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1204, CAST(N'2017-09-01' AS Date), CAST(11.80 AS Decimal(8, 2)), CAST(11.90 AS Decimal(8, 2)), CAST(12.00 AS Decimal(8, 2)), CAST(11.60 AS Decimal(8, 2)), 14105, 2218115750, CAST(11.00 AS Decimal(8, 2)), NULL, 108, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1203, CAST(N'2017-09-04' AS Date), CAST(11.30 AS Decimal(8, 2)), CAST(11.80 AS Decimal(8, 2)), CAST(11.80 AS Decimal(8, 2)), CAST(10.50 AS Decimal(8, 2)), 6280, 989107875, CAST(11.00 AS Decimal(8, 2)), NULL, 46, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1202, CAST(N'2017-09-05' AS Date), CAST(10.30 AS Decimal(8, 2)), CAST(10.30 AS Decimal(8, 2)), CAST(10.30 AS Decimal(8, 2)), CAST(10.00 AS Decimal(8, 2)), 9755, 1526872275, CAST(10.00 AS Decimal(8, 2)), NULL, 69, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1201, CAST(N'2017-09-06' AS Date), CAST(9.60 AS Decimal(8, 2)), CAST(10.50 AS Decimal(8, 2)), CAST(10.50 AS Decimal(8, 2)), CAST(9.30 AS Decimal(8, 2)), 13550, 2115637975, CAST(9.00 AS Decimal(8, 2)), NULL, 96, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1200, CAST(N'2017-09-08' AS Date), CAST(8.10 AS Decimal(8, 2)), CAST(8.00 AS Decimal(8, 2)), CAST(8.40 AS Decimal(8, 2)), CAST(7.60 AS Decimal(8, 2)), 11950, 1851498625, CAST(7.00 AS Decimal(8, 2)), NULL, 150, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1199, CAST(N'2017-09-11' AS Date), CAST(7.40 AS Decimal(8, 2)), CAST(7.50 AS Decimal(8, 2)), CAST(7.60 AS Decimal(8, 2)), CAST(6.20 AS Decimal(8, 2)), 36920, 5709103675, CAST(7.00 AS Decimal(8, 2)), NULL, 110, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1198, CAST(N'2017-09-12' AS Date), CAST(6.40 AS Decimal(8, 2)), CAST(6.50 AS Decimal(8, 2)), CAST(6.50 AS Decimal(8, 2)), CAST(5.20 AS Decimal(8, 2)), 15540, 2424794375, CAST(6.00 AS Decimal(8, 2)), NULL, 91, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1197, CAST(N'2017-09-13' AS Date), CAST(5.60 AS Decimal(8, 2)), CAST(5.50 AS Decimal(8, 2)), CAST(5.70 AS Decimal(8, 2)), CAST(5.40 AS Decimal(8, 2)), 10385, 1630354300, CAST(5.00 AS Decimal(8, 2)), NULL, 87, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1196, CAST(N'2017-09-14' AS Date), CAST(6.20 AS Decimal(8, 2)), CAST(7.50 AS Decimal(8, 2)), CAST(7.50 AS Decimal(8, 2)), CAST(6.10 AS Decimal(8, 2)), 18795, 2952433900, CAST(6.00 AS Decimal(8, 2)), NULL, 119, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1195, CAST(N'2017-09-15' AS Date), CAST(6.20 AS Decimal(8, 2)), CAST(5.90 AS Decimal(8, 2)), CAST(6.80 AS Decimal(8, 2)), CAST(5.90 AS Decimal(8, 2)), 31840, 4985791900, CAST(6.00 AS Decimal(8, 2)), NULL, 106, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1194, CAST(N'2017-09-18' AS Date), CAST(6.50 AS Decimal(8, 2)), CAST(6.60 AS Decimal(8, 2)), CAST(6.70 AS Decimal(8, 2)), CAST(6.30 AS Decimal(8, 2)), 36230, 5670840375, CAST(6.00 AS Decimal(8, 2)), NULL, 111, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1193, CAST(N'2017-09-19' AS Date), CAST(5.80 AS Decimal(8, 2)), CAST(5.70 AS Decimal(8, 2)), CAST(5.90 AS Decimal(8, 2)), CAST(5.60 AS Decimal(8, 2)), 25175, 3950085850, CAST(5.00 AS Decimal(8, 2)), NULL, 94, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1192, CAST(N'2017-09-20' AS Date), CAST(4.60 AS Decimal(8, 2)), CAST(3.20 AS Decimal(8, 2)), CAST(4.60 AS Decimal(8, 2)), CAST(3.20 AS Decimal(8, 2)), 6935, 1086224600, CAST(4.00 AS Decimal(8, 2)), NULL, 70, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1191, CAST(N'2017-09-21' AS Date), CAST(4.00 AS Decimal(8, 2)), CAST(5.70 AS Decimal(8, 2)), CAST(5.70 AS Decimal(8, 2)), CAST(4.00 AS Decimal(8, 2)), 9225, 1447755800, CAST(4.00 AS Decimal(8, 2)), NULL, 80, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1190, CAST(N'2017-09-22' AS Date), CAST(2.90 AS Decimal(8, 2)), CAST(2.80 AS Decimal(8, 2)), CAST(3.20 AS Decimal(8, 2)), CAST(2.70 AS Decimal(8, 2)), 13905, 2177184825, CAST(3.00 AS Decimal(8, 2)), NULL, 95, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1189, CAST(N'2017-09-25' AS Date), CAST(2.10 AS Decimal(8, 2)), CAST(3.70 AS Decimal(8, 2)), CAST(3.70 AS Decimal(8, 2)), CAST(2.00 AS Decimal(8, 2)), 17760, 2791197850, CAST(2.00 AS Decimal(8, 2)), NULL, 106, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1188, CAST(N'2017-09-26' AS Date), CAST(1.30 AS Decimal(8, 2)), CAST(0.90 AS Decimal(8, 2)), CAST(1.30 AS Decimal(8, 2)), CAST(0.90 AS Decimal(8, 2)), 14955, 2369257975, CAST(1.00 AS Decimal(8, 2)), NULL, 80, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1187, CAST(N'2017-09-27' AS Date), CAST(0.40 AS Decimal(8, 2)), CAST(0.30 AS Decimal(8, 2)), CAST(0.60 AS Decimal(8, 2)), CAST(0.30 AS Decimal(8, 2)), 12840, 2050308675, CAST(0.00 AS Decimal(8, 2)), NULL, 75, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1186, CAST(N'2017-09-28' AS Date), CAST(13.40 AS Decimal(8, 2)), CAST(13.10 AS Decimal(8, 2)), CAST(13.70 AS Decimal(8, 2)), CAST(13.00 AS Decimal(8, 2)), 28320, 4531705800, CAST(13.00 AS Decimal(8, 2)), NULL, 129, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1185, CAST(N'2017-09-29' AS Date), CAST(12.70 AS Decimal(8, 2)), CAST(12.90 AS Decimal(8, 2)), CAST(12.90 AS Decimal(8, 2)), CAST(12.10 AS Decimal(8, 2)), 56040, 8911573425, CAST(12.00 AS Decimal(8, 2)), NULL, 213, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1184, CAST(N'2017-10-02' AS Date), CAST(12.80 AS Decimal(8, 2)), CAST(13.30 AS Decimal(8, 2)), CAST(13.40 AS Decimal(8, 2)), CAST(12.70 AS Decimal(8, 2)), 16985, 2698230300, CAST(12.00 AS Decimal(8, 2)), NULL, 100, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1183, CAST(N'2017-10-03' AS Date), CAST(12.50 AS Decimal(8, 2)), CAST(12.40 AS Decimal(8, 2)), CAST(12.60 AS Decimal(8, 2)), CAST(12.40 AS Decimal(8, 2)), 11855, 1874702325, CAST(12.00 AS Decimal(8, 2)), NULL, 73, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1182, CAST(N'2017-10-04' AS Date), CAST(11.60 AS Decimal(8, 2)), CAST(12.50 AS Decimal(8, 2)), CAST(12.50 AS Decimal(8, 2)), CAST(11.40 AS Decimal(8, 2)), 32060, 5038572700, CAST(11.00 AS Decimal(8, 2)), NULL, 95, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1181, CAST(N'2017-10-05' AS Date), CAST(10.40 AS Decimal(8, 2)), CAST(10.20 AS Decimal(8, 2)), CAST(10.40 AS Decimal(8, 2)), CAST(10.20 AS Decimal(8, 2)), 21750, 3420130275, CAST(10.00 AS Decimal(8, 2)), NULL, 101, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1180, CAST(N'2017-10-06' AS Date), CAST(9.40 AS Decimal(8, 2)), CAST(9.50 AS Decimal(8, 2)), CAST(9.50 AS Decimal(8, 2)), CAST(9.30 AS Decimal(8, 2)), 11160, 1771221050, CAST(9.00 AS Decimal(8, 2)), NULL, 83, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1179, CAST(N'2017-10-09' AS Date), CAST(10.20 AS Decimal(8, 2)), CAST(10.00 AS Decimal(8, 2)), CAST(10.30 AS Decimal(8, 2)), CAST(9.80 AS Decimal(8, 2)), 5280, 841366325, CAST(9.00 AS Decimal(8, 2)), NULL, 65, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1178, CAST(N'2017-10-10' AS Date), CAST(9.60 AS Decimal(8, 2)), CAST(8.00 AS Decimal(8, 2)), CAST(9.70 AS Decimal(8, 2)), CAST(8.00 AS Decimal(8, 2)), 22000, 3496215300, CAST(9.00 AS Decimal(8, 2)), NULL, 91, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1177, CAST(N'2017-10-11' AS Date), CAST(8.80 AS Decimal(8, 2)), CAST(8.90 AS Decimal(8, 2)), CAST(9.00 AS Decimal(8, 2)), CAST(8.50 AS Decimal(8, 2)), 26040, 4130767925, CAST(8.00 AS Decimal(8, 2)), NULL, 102, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1176, CAST(N'2017-10-13' AS Date), CAST(7.80 AS Decimal(8, 2)), CAST(7.90 AS Decimal(8, 2)), CAST(8.00 AS Decimal(8, 2)), CAST(7.70 AS Decimal(8, 2)), 20810, 3293260750, CAST(7.00 AS Decimal(8, 2)), NULL, 128, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1175, CAST(N'2017-10-16' AS Date), CAST(6.90 AS Decimal(8, 2)), CAST(7.10 AS Decimal(8, 2)), CAST(7.10 AS Decimal(8, 2)), CAST(6.80 AS Decimal(8, 2)), 19945, 3158979475, CAST(6.00 AS Decimal(8, 2)), NULL, 85, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1174, CAST(N'2017-10-17' AS Date), CAST(6.40 AS Decimal(8, 2)), CAST(6.50 AS Decimal(8, 2)), CAST(6.60 AS Decimal(8, 2)), CAST(6.30 AS Decimal(8, 2)), 12545, 1996755725, CAST(6.00 AS Decimal(8, 2)), NULL, 81, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1173, CAST(N'2017-10-18' AS Date), CAST(5.60 AS Decimal(8, 2)), CAST(6.00 AS Decimal(8, 2)), CAST(7.40 AS Decimal(8, 2)), CAST(5.60 AS Decimal(8, 2)), 15325, 2431393350, CAST(5.00 AS Decimal(8, 2)), NULL, 87, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1172, CAST(N'2017-10-19' AS Date), CAST(5.40 AS Decimal(8, 2)), CAST(5.10 AS Decimal(8, 2)), CAST(5.50 AS Decimal(8, 2)), CAST(5.10 AS Decimal(8, 2)), 17210, 2735180225, CAST(5.00 AS Decimal(8, 2)), NULL, 84, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1171, CAST(N'2017-10-20' AS Date), CAST(4.40 AS Decimal(8, 2)), CAST(5.70 AS Decimal(8, 2)), CAST(5.70 AS Decimal(8, 2)), CAST(4.00 AS Decimal(8, 2)), 9775, 1557933650, CAST(4.00 AS Decimal(8, 2)), NULL, 65, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1170, CAST(N'2017-10-23' AS Date), CAST(3.90 AS Decimal(8, 2)), CAST(4.30 AS Decimal(8, 2)), CAST(4.30 AS Decimal(8, 2)), CAST(3.80 AS Decimal(8, 2)), 18575, 2976102125, CAST(4.00 AS Decimal(8, 2)), NULL, 74, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1169, CAST(N'2017-10-24' AS Date), CAST(3.30 AS Decimal(8, 2)), CAST(3.50 AS Decimal(8, 2)), CAST(3.50 AS Decimal(8, 2)), CAST(2.20 AS Decimal(8, 2)), 17950, 2917072350, CAST(3.00 AS Decimal(8, 2)), NULL, 100, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1168, CAST(N'2017-10-25' AS Date), CAST(2.20 AS Decimal(8, 2)), CAST(2.20 AS Decimal(8, 2)), CAST(2.30 AS Decimal(8, 2)), CAST(2.00 AS Decimal(8, 2)), 11350, 1839208475, CAST(2.00 AS Decimal(8, 2)), NULL, 95, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1167, CAST(N'2017-10-26' AS Date), CAST(1.80 AS Decimal(8, 2)), CAST(1.80 AS Decimal(8, 2)), CAST(2.00 AS Decimal(8, 2)), CAST(1.70 AS Decimal(8, 2)), 16055, 2605908225, CAST(1.00 AS Decimal(8, 2)), NULL, 84, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1166, CAST(N'2017-10-27' AS Date), CAST(1.00 AS Decimal(8, 2)), CAST(1.00 AS Decimal(8, 2)), CAST(1.10 AS Decimal(8, 2)), CAST(0.70 AS Decimal(8, 2)), 16145, 2648658200, CAST(0.00 AS Decimal(8, 2)), NULL, 101, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1165, CAST(N'2017-10-30' AS Date), CAST(13.10 AS Decimal(8, 2)), CAST(16.80 AS Decimal(8, 2)), CAST(16.80 AS Decimal(8, 2)), CAST(13.00 AS Decimal(8, 2)), 14155, 2312832550, CAST(13.00 AS Decimal(8, 2)), NULL, 100, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1164, CAST(N'2017-10-31' AS Date), CAST(12.90 AS Decimal(8, 2)), CAST(12.00 AS Decimal(8, 2)), CAST(13.20 AS Decimal(8, 2)), CAST(11.00 AS Decimal(8, 2)), 79185, 13024554525, CAST(12.00 AS Decimal(8, 2)), NULL, 207, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1163, CAST(N'2017-11-01' AS Date), CAST(12.40 AS Decimal(8, 2)), CAST(13.50 AS Decimal(8, 2)), CAST(13.50 AS Decimal(8, 2)), CAST(12.00 AS Decimal(8, 2)), 14955, 2457053725, CAST(12.00 AS Decimal(8, 2)), NULL, 100, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1162, CAST(N'2017-11-03' AS Date), CAST(11.60 AS Decimal(8, 2)), CAST(8.00 AS Decimal(8, 2)), CAST(11.70 AS Decimal(8, 2)), CAST(8.00 AS Decimal(8, 2)), 7855, 1297422200, CAST(11.00 AS Decimal(8, 2)), NULL, 82, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1161, CAST(N'2017-11-06' AS Date), CAST(10.10 AS Decimal(8, 2)), CAST(10.00 AS Decimal(8, 2)), CAST(10.30 AS Decimal(8, 2)), CAST(9.80 AS Decimal(8, 2)), 7960, 1311449600, CAST(10.00 AS Decimal(8, 2)), NULL, 63, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1160, CAST(N'2017-11-07' AS Date), CAST(9.20 AS Decimal(8, 2)), CAST(9.40 AS Decimal(8, 2)), CAST(9.40 AS Decimal(8, 2)), CAST(9.20 AS Decimal(8, 2)), 10240, 1680694700, CAST(9.00 AS Decimal(8, 2)), NULL, 76, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1159, CAST(N'2017-11-08' AS Date), CAST(8.50 AS Decimal(8, 2)), CAST(8.40 AS Decimal(8, 2)), CAST(8.60 AS Decimal(8, 2)), CAST(8.30 AS Decimal(8, 2)), 11940, 1945856975, CAST(8.00 AS Decimal(8, 2)), NULL, 76, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1158, CAST(N'2017-11-09' AS Date), CAST(7.60 AS Decimal(8, 2)), CAST(8.60 AS Decimal(8, 2)), CAST(8.60 AS Decimal(8, 2)), CAST(6.00 AS Decimal(8, 2)), 18265, 2976310400, CAST(7.00 AS Decimal(8, 2)), NULL, 96, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1157, CAST(N'2017-11-10' AS Date), CAST(6.70 AS Decimal(8, 2)), CAST(6.50 AS Decimal(8, 2)), CAST(6.90 AS Decimal(8, 2)), CAST(6.40 AS Decimal(8, 2)), 20230, 3310395950, CAST(6.00 AS Decimal(8, 2)), NULL, 106, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1156, CAST(N'2017-11-13' AS Date), CAST(6.30 AS Decimal(8, 2)), CAST(6.10 AS Decimal(8, 2)), CAST(6.50 AS Decimal(8, 2)), CAST(6.10 AS Decimal(8, 2)), 9485, 1561999325, CAST(6.00 AS Decimal(8, 2)), NULL, 80, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1155, CAST(N'2017-11-14' AS Date), CAST(5.40 AS Decimal(8, 2)), CAST(6.90 AS Decimal(8, 2)), CAST(6.90 AS Decimal(8, 2)), CAST(5.30 AS Decimal(8, 2)), 22395, 3682675700, CAST(5.00 AS Decimal(8, 2)), NULL, 124, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1154, CAST(N'2017-11-16' AS Date), CAST(5.70 AS Decimal(8, 2)), CAST(5.50 AS Decimal(8, 2)), CAST(5.80 AS Decimal(8, 2)), CAST(5.50 AS Decimal(8, 2)), 28945, 4756342175, CAST(5.00 AS Decimal(8, 2)), NULL, 120, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1153, CAST(N'2017-11-17' AS Date), CAST(4.70 AS Decimal(8, 2)), CAST(4.70 AS Decimal(8, 2)), CAST(4.70 AS Decimal(8, 2)), CAST(4.30 AS Decimal(8, 2)), 17155, 2816327400, CAST(4.00 AS Decimal(8, 2)), NULL, 85, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1152, CAST(N'2017-11-21' AS Date), CAST(2.50 AS Decimal(8, 2)), CAST(2.50 AS Decimal(8, 2)), CAST(3.00 AS Decimal(8, 2)), CAST(2.10 AS Decimal(8, 2)), 16555, 2699638900, CAST(2.00 AS Decimal(8, 2)), NULL, 96, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1151, CAST(N'2017-11-22' AS Date), CAST(2.40 AS Decimal(8, 2)), CAST(2.50 AS Decimal(8, 2)), CAST(2.50 AS Decimal(8, 2)), CAST(2.20 AS Decimal(8, 2)), 7905, 1287915100, CAST(2.00 AS Decimal(8, 2)), NULL, 59, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1150, CAST(N'2017-11-23' AS Date), CAST(2.30 AS Decimal(8, 2)), CAST(2.70 AS Decimal(8, 2)), CAST(2.70 AS Decimal(8, 2)), CAST(2.10 AS Decimal(8, 2)), 6645, 1076317675, CAST(2.00 AS Decimal(8, 2)), NULL, 49, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1149, CAST(N'2017-11-24' AS Date), CAST(1.70 AS Decimal(8, 2)), CAST(1.80 AS Decimal(8, 2)), CAST(1.80 AS Decimal(8, 2)), CAST(1.50 AS Decimal(8, 2)), 23025, 3720467025, CAST(1.00 AS Decimal(8, 2)), NULL, 109, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1148, CAST(N'2017-11-27' AS Date), CAST(1.00 AS Decimal(8, 2)), CAST(0.80 AS Decimal(8, 2)), CAST(1.00 AS Decimal(8, 2)), CAST(0.80 AS Decimal(8, 2)), 12285, 1979525900, CAST(0.00 AS Decimal(8, 2)), NULL, 94, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1147, CAST(N'2017-11-28' AS Date), CAST(0.60 AS Decimal(8, 2)), CAST(0.60 AS Decimal(8, 2)), CAST(0.70 AS Decimal(8, 2)), CAST(0.30 AS Decimal(8, 2)), 25375, 4090138850, CAST(0.00 AS Decimal(8, 2)), NULL, 117, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1146, CAST(N'2017-11-29' AS Date), CAST(10.60 AS Decimal(8, 2)), CAST(10.50 AS Decimal(8, 2)), CAST(10.70 AS Decimal(8, 2)), CAST(10.30 AS Decimal(8, 2)), 17450, 2812982250, CAST(10.00 AS Decimal(8, 2)), NULL, 112, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1145, CAST(N'2017-11-30' AS Date), CAST(10.50 AS Decimal(8, 2)), CAST(10.00 AS Decimal(8, 2)), CAST(10.70 AS Decimal(8, 2)), CAST(9.00 AS Decimal(8, 2)), 82120, 13434093200, CAST(10.00 AS Decimal(8, 2)), NULL, 253, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1144, CAST(N'2017-12-01' AS Date), CAST(9.20 AS Decimal(8, 2)), CAST(9.20 AS Decimal(8, 2)), CAST(9.20 AS Decimal(8, 2)), CAST(9.00 AS Decimal(8, 2)), 13545, 2216484075, CAST(9.00 AS Decimal(8, 2)), NULL, 81, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1143, CAST(N'2017-12-04' AS Date), CAST(8.20 AS Decimal(8, 2)), CAST(7.90 AS Decimal(8, 2)), CAST(8.20 AS Decimal(8, 2)), CAST(7.90 AS Decimal(8, 2)), 12675, 2065201025, CAST(8.00 AS Decimal(8, 2)), NULL, 72, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1142, CAST(N'2017-12-05' AS Date), CAST(7.70 AS Decimal(8, 2)), CAST(7.00 AS Decimal(8, 2)), CAST(7.80 AS Decimal(8, 2)), CAST(7.00 AS Decimal(8, 2)), 27435, 4444125150, CAST(7.00 AS Decimal(8, 2)), NULL, 150, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1141, CAST(N'2017-12-06' AS Date), CAST(7.10 AS Decimal(8, 2)), CAST(7.10 AS Decimal(8, 2)), CAST(7.40 AS Decimal(8, 2)), CAST(6.90 AS Decimal(8, 2)), 19455, 3154157800, CAST(7.00 AS Decimal(8, 2)), NULL, 75, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1140, CAST(N'2017-12-07' AS Date), CAST(7.60 AS Decimal(8, 2)), CAST(8.50 AS Decimal(8, 2)), CAST(8.50 AS Decimal(8, 2)), CAST(7.50 AS Decimal(8, 2)), 22710, 3743488300, CAST(7.00 AS Decimal(8, 2)), NULL, 124, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1139, CAST(N'2017-12-08' AS Date), CAST(6.70 AS Decimal(8, 2)), CAST(7.10 AS Decimal(8, 2)), CAST(7.10 AS Decimal(8, 2)), CAST(6.70 AS Decimal(8, 2)), 16675, 2741388700, CAST(6.00 AS Decimal(8, 2)), NULL, 98, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1138, CAST(N'2017-12-11' AS Date), CAST(6.20 AS Decimal(8, 2)), CAST(9.30 AS Decimal(8, 2)), CAST(9.30 AS Decimal(8, 2)), CAST(6.00 AS Decimal(8, 2)), 17355, 2855504675, CAST(6.00 AS Decimal(8, 2)), NULL, 87, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1137, CAST(N'2017-12-12' AS Date), CAST(5.90 AS Decimal(8, 2)), CAST(6.10 AS Decimal(8, 2)), CAST(6.10 AS Decimal(8, 2)), CAST(5.80 AS Decimal(8, 2)), 15200, 2523880250, CAST(6.00 AS Decimal(8, 2)), NULL, 115, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1136, CAST(N'2017-12-13' AS Date), CAST(5.10 AS Decimal(8, 2)), CAST(5.20 AS Decimal(8, 2)), CAST(5.20 AS Decimal(8, 2)), CAST(4.50 AS Decimal(8, 2)), 32425, 5364046300, CAST(4.00 AS Decimal(8, 2)), NULL, 99, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1135, CAST(N'2017-12-14' AS Date), CAST(4.60 AS Decimal(8, 2)), CAST(4.50 AS Decimal(8, 2)), CAST(6.30 AS Decimal(8, 2)), CAST(4.30 AS Decimal(8, 2)), 41430, 6914102650, CAST(4.00 AS Decimal(8, 2)), NULL, 179, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1134, CAST(N'2017-12-15' AS Date), CAST(3.40 AS Decimal(8, 2)), CAST(3.50 AS Decimal(8, 2)), CAST(3.80 AS Decimal(8, 2)), CAST(3.30 AS Decimal(8, 2)), 15535, 2580142550, CAST(3.00 AS Decimal(8, 2)), NULL, 81, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1133, CAST(N'2017-12-18' AS Date), CAST(2.80 AS Decimal(8, 2)), CAST(4.00 AS Decimal(8, 2)), CAST(4.00 AS Decimal(8, 2)), CAST(2.40 AS Decimal(8, 2)), 25485, 4193230250, CAST(2.00 AS Decimal(8, 2)), NULL, 101, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1132, CAST(N'2017-12-19' AS Date), CAST(2.80 AS Decimal(8, 2)), CAST(2.60 AS Decimal(8, 2)), CAST(3.00 AS Decimal(8, 2)), CAST(2.30 AS Decimal(8, 2)), 36395, 5988839975, CAST(2.00 AS Decimal(8, 2)), NULL, 133, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1131, CAST(N'2017-12-20' AS Date), CAST(2.00 AS Decimal(8, 2)), CAST(1.70 AS Decimal(8, 2)), CAST(2.10 AS Decimal(8, 2)), CAST(1.60 AS Decimal(8, 2)), 10105, 1663718975, CAST(1.00 AS Decimal(8, 2)), NULL, 78, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1130, CAST(N'2017-12-21' AS Date), CAST(1.80 AS Decimal(8, 2)), CAST(1.90 AS Decimal(8, 2)), CAST(1.90 AS Decimal(8, 2)), CAST(1.60 AS Decimal(8, 2)), 16890, 2792097400, CAST(1.00 AS Decimal(8, 2)), NULL, 99, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1129, CAST(N'2017-12-22' AS Date), CAST(0.20 AS Decimal(8, 2)), CAST(0.60 AS Decimal(8, 2)), CAST(0.60 AS Decimal(8, 2)), CAST(-0.20 AS Decimal(8, 2)), 21685, 3600678300, CAST(0.00 AS Decimal(8, 2)), NULL, 129, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1128, CAST(N'2017-12-26' AS Date), CAST(-0.40 AS Decimal(8, 2)), CAST(-0.50 AS Decimal(8, 2)), CAST(-0.10 AS Decimal(8, 2)), CAST(-0.50 AS Decimal(8, 2)), 31335, 5201118550, CAST(0.00 AS Decimal(8, 2)), NULL, 104, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1127, CAST(N'2017-12-27' AS Date), CAST(12.10 AS Decimal(8, 2)), CAST(12.70 AS Decimal(8, 2)), CAST(12.70 AS Decimal(8, 2)), CAST(11.70 AS Decimal(8, 2)), 24155, 4003830850, CAST(12.00 AS Decimal(8, 2)), NULL, 122, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1126, CAST(N'2017-12-28' AS Date), CAST(12.60 AS Decimal(8, 2)), CAST(12.30 AS Decimal(8, 2)), CAST(12.70 AS Decimal(8, 2)), CAST(11.40 AS Decimal(8, 2)), 77320, 12836595800, CAST(12.00 AS Decimal(8, 2)), NULL, 310, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1125, CAST(N'2018-01-02' AS Date), CAST(10.80 AS Decimal(8, 2)), CAST(10.90 AS Decimal(8, 2)), CAST(10.90 AS Decimal(8, 2)), CAST(10.20 AS Decimal(8, 2)), 12305, 2018258875, CAST(10.00 AS Decimal(8, 2)), NULL, 84, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1124, CAST(N'2018-01-03' AS Date), CAST(10.50 AS Decimal(8, 2)), CAST(10.80 AS Decimal(8, 2)), CAST(10.80 AS Decimal(8, 2)), CAST(10.40 AS Decimal(8, 2)), 16605, 2709900700, CAST(10.00 AS Decimal(8, 2)), NULL, 77, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1123, CAST(N'2018-01-04' AS Date), CAST(10.60 AS Decimal(8, 2)), CAST(11.10 AS Decimal(8, 2)), CAST(11.10 AS Decimal(8, 2)), CAST(10.60 AS Decimal(8, 2)), 12285, 1991667500, CAST(10.00 AS Decimal(8, 2)), NULL, 76, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1122, CAST(N'2018-01-05' AS Date), CAST(10.00 AS Decimal(8, 2)), CAST(10.10 AS Decimal(8, 2)), CAST(10.20 AS Decimal(8, 2)), CAST(9.90 AS Decimal(8, 2)), 8240, 1339360200, CAST(9.00 AS Decimal(8, 2)), NULL, 81, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1121, CAST(N'2018-01-08' AS Date), CAST(9.20 AS Decimal(8, 2)), CAST(11.30 AS Decimal(8, 2)), CAST(11.30 AS Decimal(8, 2)), CAST(9.20 AS Decimal(8, 2)), 23880, 3874841975, CAST(9.00 AS Decimal(8, 2)), NULL, 98, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1120, CAST(N'2018-01-09' AS Date), CAST(9.40 AS Decimal(8, 2)), CAST(12.10 AS Decimal(8, 2)), CAST(12.10 AS Decimal(8, 2)), CAST(9.20 AS Decimal(8, 2)), 22485, 3652904500, CAST(9.00 AS Decimal(8, 2)), NULL, 89, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1119, CAST(N'2018-01-10' AS Date), CAST(9.10 AS Decimal(8, 2)), CAST(11.30 AS Decimal(8, 2)), CAST(11.30 AS Decimal(8, 2)), CAST(8.70 AS Decimal(8, 2)), 15705, 2556666675, CAST(9.00 AS Decimal(8, 2)), NULL, 90, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1118, CAST(N'2018-01-11' AS Date), CAST(8.10 AS Decimal(8, 2)), CAST(10.90 AS Decimal(8, 2)), CAST(10.90 AS Decimal(8, 2)), CAST(7.90 AS Decimal(8, 2)), 14870, 2407536200, CAST(8.00 AS Decimal(8, 2)), NULL, 88, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1117, CAST(N'2018-01-12' AS Date), CAST(7.10 AS Decimal(8, 2)), CAST(4.90 AS Decimal(8, 2)), CAST(7.50 AS Decimal(8, 2)), CAST(4.90 AS Decimal(8, 2)), 15165, 2446789775, CAST(7.00 AS Decimal(8, 2)), NULL, 96, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1116, CAST(N'2018-01-15' AS Date), CAST(6.90 AS Decimal(8, 2)), CAST(7.10 AS Decimal(8, 2)), CAST(7.10 AS Decimal(8, 2)), CAST(6.60 AS Decimal(8, 2)), 8200, 1313262975, CAST(6.00 AS Decimal(8, 2)), NULL, 70, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1115, CAST(N'2018-01-16' AS Date), CAST(6.40 AS Decimal(8, 2)), CAST(6.40 AS Decimal(8, 2)), CAST(6.60 AS Decimal(8, 2)), CAST(6.40 AS Decimal(8, 2)), 16885, 2725544850, CAST(6.00 AS Decimal(8, 2)), NULL, 99, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1114, CAST(N'2018-01-17' AS Date), CAST(5.70 AS Decimal(8, 2)), CAST(6.00 AS Decimal(8, 2)), CAST(6.00 AS Decimal(8, 2)), CAST(5.70 AS Decimal(8, 2)), 8455, 1368971500, CAST(5.00 AS Decimal(8, 2)), NULL, 62, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1113, CAST(N'2018-01-18' AS Date), CAST(5.70 AS Decimal(8, 2)), CAST(5.70 AS Decimal(8, 2)), CAST(6.00 AS Decimal(8, 2)), CAST(5.60 AS Decimal(8, 2)), 17380, 2797040700, CAST(5.00 AS Decimal(8, 2)), NULL, 105, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1112, CAST(N'2018-01-19' AS Date), CAST(5.40 AS Decimal(8, 2)), CAST(5.20 AS Decimal(8, 2)), CAST(5.50 AS Decimal(8, 2)), CAST(5.20 AS Decimal(8, 2)), 9765, 1569271150, CAST(5.00 AS Decimal(8, 2)), NULL, 72, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1111, CAST(N'2018-01-22' AS Date), CAST(4.60 AS Decimal(8, 2)), CAST(4.90 AS Decimal(8, 2)), CAST(5.00 AS Decimal(8, 2)), CAST(4.50 AS Decimal(8, 2)), 28800, 4605200475, CAST(4.00 AS Decimal(8, 2)), NULL, 91, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1110, CAST(N'2018-01-23' AS Date), CAST(3.70 AS Decimal(8, 2)), CAST(3.80 AS Decimal(8, 2)), CAST(3.90 AS Decimal(8, 2)), CAST(3.70 AS Decimal(8, 2)), 7855, 1268055650, CAST(3.00 AS Decimal(8, 2)), NULL, 72, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1109, CAST(N'2018-01-24' AS Date), CAST(3.20 AS Decimal(8, 2)), CAST(2.50 AS Decimal(8, 2)), CAST(3.30 AS Decimal(8, 2)), CAST(2.50 AS Decimal(8, 2)), 20970, 3355431125, CAST(3.00 AS Decimal(8, 2)), NULL, 111, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1108, CAST(N'2018-01-26' AS Date), CAST(1.70 AS Decimal(8, 2)), CAST(2.10 AS Decimal(8, 2)), CAST(2.10 AS Decimal(8, 2)), CAST(1.60 AS Decimal(8, 2)), 12400, 1950990575, CAST(1.00 AS Decimal(8, 2)), NULL, 84, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1107, CAST(N'2018-01-29' AS Date), CAST(1.10 AS Decimal(8, 2)), CAST(0.90 AS Decimal(8, 2)), CAST(1.20 AS Decimal(8, 2)), CAST(0.90 AS Decimal(8, 2)), 15860, 2511086225, CAST(1.00 AS Decimal(8, 2)), NULL, 103, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1106, CAST(N'2018-01-30' AS Date), CAST(9.50 AS Decimal(8, 2)), CAST(9.40 AS Decimal(8, 2)), CAST(9.50 AS Decimal(8, 2)), CAST(9.20 AS Decimal(8, 2)), 17020, 2702312600, CAST(9.00 AS Decimal(8, 2)), NULL, 108, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1105, CAST(N'2018-01-31' AS Date), CAST(9.30 AS Decimal(8, 2)), CAST(11.30 AS Decimal(8, 2)), CAST(11.30 AS Decimal(8, 2)), CAST(9.00 AS Decimal(8, 2)), 67840, 10758436200, CAST(9.00 AS Decimal(8, 2)), NULL, 234, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1104, CAST(N'2018-02-01' AS Date), CAST(9.50 AS Decimal(8, 2)), CAST(9.40 AS Decimal(8, 2)), CAST(9.50 AS Decimal(8, 2)), CAST(9.20 AS Decimal(8, 2)), 21590, 3435315400, CAST(9.00 AS Decimal(8, 2)), NULL, 79, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1103, CAST(N'2018-02-02' AS Date), CAST(9.30 AS Decimal(8, 2)), CAST(9.00 AS Decimal(8, 2)), CAST(9.30 AS Decimal(8, 2)), CAST(9.00 AS Decimal(8, 2)), 6335, 1018391325, CAST(9.00 AS Decimal(8, 2)), NULL, 62, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1102, CAST(N'2018-02-05' AS Date), CAST(8.60 AS Decimal(8, 2)), CAST(8.70 AS Decimal(8, 2)), CAST(8.90 AS Decimal(8, 2)), CAST(8.60 AS Decimal(8, 2)), 24930, 4043941950, CAST(8.00 AS Decimal(8, 2)), NULL, 116, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1101, CAST(N'2018-02-06' AS Date), CAST(8.30 AS Decimal(8, 2)), CAST(8.40 AS Decimal(8, 2)), CAST(8.40 AS Decimal(8, 2)), CAST(8.30 AS Decimal(8, 2)), 11950, 1953608650, CAST(8.00 AS Decimal(8, 2)), NULL, 68, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1100, CAST(N'2018-02-07' AS Date), CAST(7.80 AS Decimal(8, 2)), CAST(8.40 AS Decimal(8, 2)), CAST(8.40 AS Decimal(8, 2)), CAST(7.70 AS Decimal(8, 2)), 7585, 1234281500, CAST(7.00 AS Decimal(8, 2)), NULL, 62, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1099, CAST(N'2018-02-08' AS Date), CAST(7.40 AS Decimal(8, 2)), CAST(10.50 AS Decimal(8, 2)), CAST(10.50 AS Decimal(8, 2)), CAST(7.40 AS Decimal(8, 2)), 14525, 2379738950, CAST(7.00 AS Decimal(8, 2)), NULL, 115, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1098, CAST(N'2018-02-09' AS Date), CAST(6.50 AS Decimal(8, 2)), CAST(6.70 AS Decimal(8, 2)), CAST(6.90 AS Decimal(8, 2)), CAST(6.50 AS Decimal(8, 2)), 15175, 2495331400, CAST(6.00 AS Decimal(8, 2)), NULL, 86, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1097, CAST(N'2018-02-14' AS Date), CAST(6.20 AS Decimal(8, 2)), CAST(6.10 AS Decimal(8, 2)), CAST(6.60 AS Decimal(8, 2)), CAST(6.10 AS Decimal(8, 2)), 10365, 1689455025, CAST(6.00 AS Decimal(8, 2)), NULL, 70, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1096, CAST(N'2018-02-15' AS Date), CAST(5.10 AS Decimal(8, 2)), CAST(5.30 AS Decimal(8, 2)), CAST(5.30 AS Decimal(8, 2)), CAST(5.00 AS Decimal(8, 2)), 21860, 3525908425, CAST(5.00 AS Decimal(8, 2)), NULL, 115, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1095, CAST(N'2018-02-16' AS Date), CAST(4.10 AS Decimal(8, 2)), CAST(4.00 AS Decimal(8, 2)), CAST(4.40 AS Decimal(8, 2)), CAST(4.00 AS Decimal(8, 2)), 9280, 1504444750, CAST(4.00 AS Decimal(8, 2)), NULL, 69, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1094, CAST(N'2018-02-19' AS Date), CAST(4.20 AS Decimal(8, 2)), CAST(4.00 AS Decimal(8, 2)), CAST(4.40 AS Decimal(8, 2)), CAST(4.00 AS Decimal(8, 2)), 9265, 1500444775, CAST(4.00 AS Decimal(8, 2)), NULL, 78, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1093, CAST(N'2018-02-20' AS Date), CAST(3.40 AS Decimal(8, 2)), CAST(3.30 AS Decimal(8, 2)), CAST(3.60 AS Decimal(8, 2)), CAST(3.30 AS Decimal(8, 2)), 20975, 3412780900, CAST(3.00 AS Decimal(8, 2)), NULL, 104, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1092, CAST(N'2018-02-21' AS Date), CAST(2.80 AS Decimal(8, 2)), CAST(2.90 AS Decimal(8, 2)), CAST(2.90 AS Decimal(8, 2)), CAST(2.70 AS Decimal(8, 2)), 12730, 2073885925, CAST(2.00 AS Decimal(8, 2)), NULL, 78, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1091, CAST(N'2018-02-22' AS Date), CAST(2.20 AS Decimal(8, 2)), CAST(2.40 AS Decimal(8, 2)), CAST(2.40 AS Decimal(8, 2)), CAST(1.70 AS Decimal(8, 2)), 57140, 9319252075, CAST(2.00 AS Decimal(8, 2)), NULL, 131, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1090, CAST(N'2018-02-23' AS Date), CAST(1.50 AS Decimal(8, 2)), CAST(1.50 AS Decimal(8, 2)), CAST(1.70 AS Decimal(8, 2)), CAST(1.20 AS Decimal(8, 2)), 21985, 3565056300, CAST(1.00 AS Decimal(8, 2)), NULL, 105, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1089, CAST(N'2018-02-26' AS Date), CAST(0.80 AS Decimal(8, 2)), CAST(1.00 AS Decimal(8, 2)), CAST(1.00 AS Decimal(8, 2)), CAST(0.70 AS Decimal(8, 2)), 18435, 2982725850, CAST(0.00 AS Decimal(8, 2)), NULL, 97, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1088, CAST(N'2018-02-27' AS Date), CAST(11.00 AS Decimal(8, 2)), CAST(11.10 AS Decimal(8, 2)), CAST(11.20 AS Decimal(8, 2)), CAST(10.70 AS Decimal(8, 2)), 13730, 2230684800, CAST(11.00 AS Decimal(8, 2)), NULL, 104, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1087, CAST(N'2018-02-28' AS Date), CAST(10.60 AS Decimal(8, 2)), CAST(13.80 AS Decimal(8, 2)), CAST(13.80 AS Decimal(8, 2)), CAST(10.00 AS Decimal(8, 2)), 65355, 10638846450, CAST(10.00 AS Decimal(8, 2)), NULL, 208, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1086, CAST(N'2018-03-01' AS Date), CAST(10.60 AS Decimal(8, 2)), CAST(10.50 AS Decimal(8, 2)), CAST(10.80 AS Decimal(8, 2)), CAST(10.50 AS Decimal(8, 2)), 14320, 2343237125, CAST(10.00 AS Decimal(8, 2)), NULL, 87, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1085, CAST(N'2018-03-02' AS Date), CAST(9.90 AS Decimal(8, 2)), CAST(10.00 AS Decimal(8, 2)), CAST(10.00 AS Decimal(8, 2)), CAST(9.70 AS Decimal(8, 2)), 7480, 1223452325, CAST(9.00 AS Decimal(8, 2)), NULL, 67, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1084, CAST(N'2018-03-05' AS Date), CAST(8.60 AS Decimal(8, 2)), CAST(9.80 AS Decimal(8, 2)), CAST(9.80 AS Decimal(8, 2)), CAST(8.40 AS Decimal(8, 2)), 8535, 1394123875, CAST(8.00 AS Decimal(8, 2)), NULL, 84, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1083, CAST(N'2018-03-06' AS Date), CAST(7.80 AS Decimal(8, 2)), CAST(8.70 AS Decimal(8, 2)), CAST(8.70 AS Decimal(8, 2)), CAST(7.70 AS Decimal(8, 2)), 13005, 2101926400, CAST(7.00 AS Decimal(8, 2)), NULL, 98, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1082, CAST(N'2018-03-07' AS Date), CAST(7.40 AS Decimal(8, 2)), CAST(8.40 AS Decimal(8, 2)), CAST(8.40 AS Decimal(8, 2)), CAST(7.10 AS Decimal(8, 2)), 13065, 2115925475, CAST(7.00 AS Decimal(8, 2)), NULL, 70, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1081, CAST(N'2018-03-08' AS Date), CAST(7.10 AS Decimal(8, 2)), CAST(7.20 AS Decimal(8, 2)), CAST(7.70 AS Decimal(8, 2)), CAST(7.10 AS Decimal(8, 2)), 20710, 3374641175, CAST(7.00 AS Decimal(8, 2)), NULL, 110, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1080, CAST(N'2018-03-09' AS Date), CAST(6.20 AS Decimal(8, 2)), CAST(6.10 AS Decimal(8, 2)), CAST(7.30 AS Decimal(8, 2)), CAST(6.10 AS Decimal(8, 2)), 11740, 1911174775, CAST(6.00 AS Decimal(8, 2)), NULL, 78, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1079, CAST(N'2018-03-12' AS Date), CAST(5.60 AS Decimal(8, 2)), CAST(6.30 AS Decimal(8, 2)), CAST(6.30 AS Decimal(8, 2)), CAST(5.40 AS Decimal(8, 2)), 9750, 1592304475, CAST(5.00 AS Decimal(8, 2)), NULL, 65, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1078, CAST(N'2018-03-13' AS Date), CAST(4.50 AS Decimal(8, 2)), CAST(5.00 AS Decimal(8, 2)), CAST(5.00 AS Decimal(8, 2)), CAST(4.20 AS Decimal(8, 2)), 23850, 3879969350, CAST(4.00 AS Decimal(8, 2)), NULL, 98, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1077, CAST(N'2018-03-14' AS Date), CAST(3.50 AS Decimal(8, 2)), CAST(5.20 AS Decimal(8, 2)), CAST(5.20 AS Decimal(8, 2)), CAST(3.20 AS Decimal(8, 2)), 11830, 1929393225, CAST(3.00 AS Decimal(8, 2)), NULL, 105, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1076, CAST(N'2018-03-15' AS Date), CAST(3.40 AS Decimal(8, 2)), CAST(3.30 AS Decimal(8, 2)), CAST(4.00 AS Decimal(8, 2)), CAST(3.20 AS Decimal(8, 2)), 19445, 3197992800, CAST(3.00 AS Decimal(8, 2)), NULL, 91, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1075, CAST(N'2018-03-16' AS Date), CAST(3.30 AS Decimal(8, 2)), CAST(4.00 AS Decimal(8, 2)), CAST(4.00 AS Decimal(8, 2)), CAST(3.10 AS Decimal(8, 2)), 11225, 1848574550, CAST(3.00 AS Decimal(8, 2)), NULL, 88, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1074, CAST(N'2018-03-19' AS Date), CAST(2.60 AS Decimal(8, 2)), CAST(2.40 AS Decimal(8, 2)), CAST(3.00 AS Decimal(8, 2)), CAST(2.30 AS Decimal(8, 2)), 18015, 2966821850, CAST(2.00 AS Decimal(8, 2)), NULL, 99, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1073, CAST(N'2018-03-20' AS Date), CAST(1.70 AS Decimal(8, 2)), CAST(1.80 AS Decimal(8, 2)), CAST(1.80 AS Decimal(8, 2)), CAST(1.40 AS Decimal(8, 2)), 12075, 1992228125, CAST(1.00 AS Decimal(8, 2)), NULL, 78, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1072, CAST(N'2018-03-21' AS Date), CAST(1.30 AS Decimal(8, 2)), CAST(1.20 AS Decimal(8, 2)), CAST(1.40 AS Decimal(8, 2)), CAST(1.20 AS Decimal(8, 2)), 13080, 2153848100, CAST(1.00 AS Decimal(8, 2)), NULL, 81, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1071, CAST(N'2018-03-22' AS Date), CAST(1.30 AS Decimal(8, 2)), CAST(1.20 AS Decimal(8, 2)), CAST(1.40 AS Decimal(8, 2)), CAST(1.20 AS Decimal(8, 2)), 15595, 2576757625, CAST(1.00 AS Decimal(8, 2)), NULL, 87, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1070, CAST(N'2018-03-23' AS Date), CAST(0.70 AS Decimal(8, 2)), CAST(0.50 AS Decimal(8, 2)), CAST(0.80 AS Decimal(8, 2)), CAST(0.30 AS Decimal(8, 2)), 14740, 2435544450, CAST(0.00 AS Decimal(8, 2)), NULL, 86, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1069, CAST(N'2018-03-26' AS Date), CAST(0.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), CAST(-0.60 AS Decimal(8, 2)), 10800, 1783777275, CAST(0.00 AS Decimal(8, 2)), NULL, 60, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1068, CAST(N'2018-03-27' AS Date), CAST(-0.90 AS Decimal(8, 2)), CAST(-1.00 AS Decimal(8, 2)), CAST(-0.80 AS Decimal(8, 2)), CAST(-1.70 AS Decimal(8, 2)), 18810, 3126721650, CAST(0.00 AS Decimal(8, 2)), NULL, 91, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1067, CAST(N'2018-03-28' AS Date), CAST(9.80 AS Decimal(8, 2)), CAST(10.00 AS Decimal(8, 2)), CAST(11.00 AS Decimal(8, 2)), CAST(8.60 AS Decimal(8, 2)), 40780, 6826555250, CAST(9.00 AS Decimal(8, 2)), NULL, 164, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1066, CAST(N'2018-03-29' AS Date), CAST(8.20 AS Decimal(8, 2)), CAST(8.80 AS Decimal(8, 2)), CAST(8.80 AS Decimal(8, 2)), CAST(7.40 AS Decimal(8, 2)), 72755, 12120025325, CAST(7.00 AS Decimal(8, 2)), NULL, 316, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1065, CAST(N'2018-05-10' AS Date), CAST(7.10 AS Decimal(8, 2)), CAST(7.00 AS Decimal(8, 2)), CAST(7.20 AS Decimal(8, 2)), CAST(7.00 AS Decimal(8, 2)), 13090, 2332425675, CAST(7.00 AS Decimal(8, 2)), NULL, 85, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1064, CAST(N'2018-05-11' AS Date), CAST(6.50 AS Decimal(8, 2)), CAST(6.80 AS Decimal(8, 2)), CAST(6.80 AS Decimal(8, 2)), CAST(6.20 AS Decimal(8, 2)), 16025, 2866784325, CAST(6.00 AS Decimal(8, 2)), NULL, 93, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1063, CAST(N'2018-05-14' AS Date), CAST(5.80 AS Decimal(8, 2)), CAST(6.00 AS Decimal(8, 2)), CAST(6.20 AS Decimal(8, 2)), CAST(5.60 AS Decimal(8, 2)), 21745, 3931101725, CAST(5.00 AS Decimal(8, 2)), NULL, 87, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1062, CAST(N'2018-05-15' AS Date), CAST(5.10 AS Decimal(8, 2)), CAST(4.90 AS Decimal(8, 2)), CAST(5.20 AS Decimal(8, 2)), CAST(4.80 AS Decimal(8, 2)), 13305, 2448313425, CAST(4.00 AS Decimal(8, 2)), NULL, 91, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1061, CAST(N'2018-05-16' AS Date), CAST(4.00 AS Decimal(8, 2)), CAST(1.20 AS Decimal(8, 2)), CAST(4.20 AS Decimal(8, 2)), CAST(1.20 AS Decimal(8, 2)), 17095, 3149160400, CAST(4.00 AS Decimal(8, 2)), NULL, 86, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1060, CAST(N'2018-05-17' AS Date), CAST(4.10 AS Decimal(8, 2)), CAST(9.50 AS Decimal(8, 2)), CAST(9.50 AS Decimal(8, 2)), CAST(3.80 AS Decimal(8, 2)), 13935, 2572086325, CAST(4.00 AS Decimal(8, 2)), NULL, 104, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1059, CAST(N'2018-05-18' AS Date), CAST(3.40 AS Decimal(8, 2)), CAST(3.30 AS Decimal(8, 2)), CAST(3.70 AS Decimal(8, 2)), CAST(3.30 AS Decimal(8, 2)), 13560, 2545032125, CAST(3.00 AS Decimal(8, 2)), NULL, 94, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1058, CAST(N'2018-05-21' AS Date), CAST(3.40 AS Decimal(8, 2)), CAST(3.40 AS Decimal(8, 2)), CAST(3.60 AS Decimal(8, 2)), CAST(3.20 AS Decimal(8, 2)), 8865, 1644742750, CAST(3.00 AS Decimal(8, 2)), NULL, 74, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1057, CAST(N'2018-05-22' AS Date), CAST(2.70 AS Decimal(8, 2)), CAST(2.40 AS Decimal(8, 2)), CAST(2.70 AS Decimal(8, 2)), CAST(2.40 AS Decimal(8, 2)), 15240, 2783420975, CAST(2.00 AS Decimal(8, 2)), NULL, 69, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1056, CAST(N'2018-05-23' AS Date), CAST(2.00 AS Decimal(8, 2)), CAST(1.90 AS Decimal(8, 2)), CAST(2.30 AS Decimal(8, 2)), CAST(1.80 AS Decimal(8, 2)), 25840, 4719238200, CAST(1.00 AS Decimal(8, 2)), NULL, 108, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1055, CAST(N'2018-05-24' AS Date), CAST(1.10 AS Decimal(8, 2)), CAST(0.90 AS Decimal(8, 2)), CAST(1.10 AS Decimal(8, 2)), CAST(0.70 AS Decimal(8, 2)), 18915, 3446808850, CAST(0.00 AS Decimal(8, 2)), NULL, 101, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1054, CAST(N'2018-05-25' AS Date), CAST(0.20 AS Decimal(8, 2)), CAST(0.20 AS Decimal(8, 2)), CAST(0.30 AS Decimal(8, 2)), CAST(-0.60 AS Decimal(8, 2)), 19585, 3582913300, CAST(0.00 AS Decimal(8, 2)), NULL, 92, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1053, CAST(N'2018-05-28' AS Date), CAST(0.40 AS Decimal(8, 2)), CAST(2.50 AS Decimal(8, 2)), CAST(2.50 AS Decimal(8, 2)), CAST(0.30 AS Decimal(8, 2)), 11605, 2152581700, CAST(0.00 AS Decimal(8, 2)), NULL, 91, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1052, CAST(N'2018-05-29' AS Date), CAST(11.10 AS Decimal(8, 2)), CAST(11.20 AS Decimal(8, 2)), CAST(11.30 AS Decimal(8, 2)), CAST(11.00 AS Decimal(8, 2)), 2695, 503962700, CAST(11.00 AS Decimal(8, 2)), NULL, 24, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1051, CAST(N'2018-05-30' AS Date), CAST(11.10 AS Decimal(8, 2)), CAST(11.20 AS Decimal(8, 2)), CAST(11.20 AS Decimal(8, 2)), CAST(11.10 AS Decimal(8, 2)), 3195, 598773925, CAST(11.00 AS Decimal(8, 2)), NULL, 16, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1050, CAST(N'2018-06-01' AS Date), CAST(10.60 AS Decimal(8, 2)), CAST(10.50 AS Decimal(8, 2)), CAST(11.40 AS Decimal(8, 2)), CAST(10.50 AS Decimal(8, 2)), 17025, 3194024950, CAST(10.00 AS Decimal(8, 2)), NULL, 80, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1049, CAST(N'2018-06-04' AS Date), CAST(10.60 AS Decimal(8, 2)), CAST(10.60 AS Decimal(8, 2)), CAST(10.80 AS Decimal(8, 2)), CAST(10.40 AS Decimal(8, 2)), 10135, 1901829550, CAST(10.00 AS Decimal(8, 2)), NULL, 88, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1048, CAST(N'2018-06-05' AS Date), CAST(10.50 AS Decimal(8, 2)), CAST(10.60 AS Decimal(8, 2)), CAST(10.60 AS Decimal(8, 2)), CAST(10.30 AS Decimal(8, 2)), 11880, 2248679700, CAST(10.00 AS Decimal(8, 2)), NULL, 92, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1047, CAST(N'2018-06-06' AS Date), CAST(9.90 AS Decimal(8, 2)), CAST(10.00 AS Decimal(8, 2)), CAST(10.00 AS Decimal(8, 2)), CAST(9.30 AS Decimal(8, 2)), 14780, 2829556950, CAST(9.00 AS Decimal(8, 2)), NULL, 86, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1046, CAST(N'2018-06-07' AS Date), CAST(9.60 AS Decimal(8, 2)), CAST(18.00 AS Decimal(8, 2)), CAST(18.00 AS Decimal(8, 2)), CAST(9.40 AS Decimal(8, 2)), 15600, 3049962950, CAST(10.00 AS Decimal(8, 2)), NULL, 144, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1045, CAST(N'2018-06-08' AS Date), CAST(9.80 AS Decimal(8, 2)), CAST(9.30 AS Decimal(8, 2)), CAST(10.00 AS Decimal(8, 2)), CAST(9.30 AS Decimal(8, 2)), 21310, 4165707750, CAST(9.00 AS Decimal(8, 2)), NULL, 141, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1044, CAST(N'2018-06-09' AS Date), CAST(9.80 AS Decimal(8, 2)), CAST(9.30 AS Decimal(8, 2)), CAST(10.00 AS Decimal(8, 2)), CAST(9.30 AS Decimal(8, 2)), 21310, 4165707750, CAST(9.00 AS Decimal(8, 2)), NULL, 141, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1043, CAST(N'2018-06-11' AS Date), CAST(8.50 AS Decimal(8, 2)), CAST(8.40 AS Decimal(8, 2)), CAST(9.00 AS Decimal(8, 2)), CAST(8.40 AS Decimal(8, 2)), 23650, 4375314700, CAST(8.00 AS Decimal(8, 2)), NULL, 125, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1042, CAST(N'2018-06-12' AS Date), CAST(8.00 AS Decimal(8, 2)), CAST(7.80 AS Decimal(8, 2)), CAST(8.50 AS Decimal(8, 2)), CAST(7.40 AS Decimal(8, 2)), 19060, 3537943400, CAST(8.00 AS Decimal(8, 2)), NULL, 126, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1041, CAST(N'2018-06-13' AS Date), CAST(7.00 AS Decimal(8, 2)), CAST(8.30 AS Decimal(8, 2)), CAST(8.30 AS Decimal(8, 2)), CAST(5.60 AS Decimal(8, 2)), 20515, 3806979000, CAST(6.00 AS Decimal(8, 2)), NULL, 121, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1040, CAST(N'2018-06-14' AS Date), CAST(5.70 AS Decimal(8, 2)), CAST(5.50 AS Decimal(8, 2)), CAST(5.90 AS Decimal(8, 2)), CAST(5.20 AS Decimal(8, 2)), 9230, 1712708200, CAST(5.00 AS Decimal(8, 2)), NULL, 98, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1039, CAST(N'2018-06-15' AS Date), CAST(5.50 AS Decimal(8, 2)), CAST(5.40 AS Decimal(8, 2)), CAST(6.10 AS Decimal(8, 2)), CAST(5.30 AS Decimal(8, 2)), 27405, 5178753550, CAST(5.00 AS Decimal(8, 2)), NULL, 152, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1038, CAST(N'2018-06-18' AS Date), CAST(4.90 AS Decimal(8, 2)), CAST(5.20 AS Decimal(8, 2)), CAST(5.20 AS Decimal(8, 2)), CAST(4.60 AS Decimal(8, 2)), 9440, 1774320975, CAST(4.00 AS Decimal(8, 2)), NULL, 79, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1037, CAST(N'2018-06-19' AS Date), CAST(4.30 AS Decimal(8, 2)), CAST(4.00 AS Decimal(8, 2)), CAST(4.40 AS Decimal(8, 2)), CAST(4.00 AS Decimal(8, 2)), 8595, 1616214175, CAST(4.00 AS Decimal(8, 2)), NULL, 92, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1036, CAST(N'2018-06-20' AS Date), CAST(3.30 AS Decimal(8, 2)), CAST(3.30 AS Decimal(8, 2)), CAST(3.30 AS Decimal(8, 2)), CAST(2.70 AS Decimal(8, 2)), 6765, 1263879250, CAST(3.00 AS Decimal(8, 2)), NULL, 75, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1035, CAST(N'2018-06-21' AS Date), CAST(2.90 AS Decimal(8, 2)), CAST(4.50 AS Decimal(8, 2)), CAST(4.50 AS Decimal(8, 2)), CAST(2.80 AS Decimal(8, 2)), 19850, 3764142325, CAST(3.00 AS Decimal(8, 2)), NULL, 135, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1034, CAST(N'2018-06-22' AS Date), CAST(1.90 AS Decimal(8, 2)), CAST(1.70 AS Decimal(8, 2)), CAST(2.30 AS Decimal(8, 2)), CAST(1.70 AS Decimal(8, 2)), 20150, 3796513375, CAST(1.00 AS Decimal(8, 2)), NULL, 81, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1033, CAST(N'2018-06-25' AS Date), CAST(2.00 AS Decimal(8, 2)), CAST(1.80 AS Decimal(8, 2)), CAST(2.00 AS Decimal(8, 2)), CAST(1.60 AS Decimal(8, 2)), 19300, 3645524950, CAST(1.00 AS Decimal(8, 2)), NULL, 101, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1032, CAST(N'2018-06-26' AS Date), CAST(1.30 AS Decimal(8, 2)), CAST(1.30 AS Decimal(8, 2)), CAST(1.40 AS Decimal(8, 2)), CAST(1.10 AS Decimal(8, 2)), 15745, 2970560050, CAST(1.00 AS Decimal(8, 2)), NULL, 84, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1031, CAST(N'2018-06-27' AS Date), CAST(0.70 AS Decimal(8, 2)), CAST(0.90 AS Decimal(8, 2)), CAST(1.00 AS Decimal(8, 2)), CAST(0.60 AS Decimal(8, 2)), 13900, 2666420375, CAST(0.00 AS Decimal(8, 2)), NULL, 103, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1030, CAST(N'2018-06-28' AS Date), CAST(12.00 AS Decimal(8, 2)), CAST(11.80 AS Decimal(8, 2)), CAST(12.20 AS Decimal(8, 2)), CAST(11.80 AS Decimal(8, 2)), 5120, 989241050, CAST(12.00 AS Decimal(8, 2)), NULL, 22, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1029, CAST(N'2018-06-29' AS Date), CAST(11.40 AS Decimal(8, 2)), CAST(12.00 AS Decimal(8, 2)), CAST(15.00 AS Decimal(8, 2)), CAST(11.40 AS Decimal(8, 2)), 27390, 5296542725, CAST(11.00 AS Decimal(8, 2)), NULL, 105, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1028, CAST(N'2018-07-02' AS Date), CAST(11.00 AS Decimal(8, 2)), CAST(10.90 AS Decimal(8, 2)), CAST(11.30 AS Decimal(8, 2)), CAST(10.60 AS Decimal(8, 2)), 13360, 2616307175, CAST(11.00 AS Decimal(8, 2)), NULL, 104, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1027, CAST(N'2018-07-03' AS Date), CAST(10.30 AS Decimal(8, 2)), CAST(10.70 AS Decimal(8, 2)), CAST(10.70 AS Decimal(8, 2)), CAST(10.10 AS Decimal(8, 2)), 7815, 1524859775, CAST(10.00 AS Decimal(8, 2)), NULL, 74, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1026, CAST(N'2018-07-04' AS Date), CAST(10.20 AS Decimal(8, 2)), CAST(10.30 AS Decimal(8, 2)), CAST(10.30 AS Decimal(8, 2)), CAST(10.00 AS Decimal(8, 2)), 5015, 981932325, CAST(10.00 AS Decimal(8, 2)), NULL, 74, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1025, CAST(N'2018-07-05' AS Date), CAST(10.20 AS Decimal(8, 2)), CAST(10.10 AS Decimal(8, 2)), CAST(10.30 AS Decimal(8, 2)), CAST(9.90 AS Decimal(8, 2)), 8885, 1745641050, CAST(10.00 AS Decimal(8, 2)), NULL, 70, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1024, CAST(N'2018-07-06' AS Date), CAST(9.70 AS Decimal(8, 2)), CAST(9.70 AS Decimal(8, 2)), CAST(9.80 AS Decimal(8, 2)), CAST(9.50 AS Decimal(8, 2)), 9950, 1958167150, CAST(9.00 AS Decimal(8, 2)), NULL, 67, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1023, CAST(N'2018-07-10' AS Date), CAST(8.80 AS Decimal(8, 2)), CAST(9.00 AS Decimal(8, 2)), CAST(9.10 AS Decimal(8, 2)), CAST(8.40 AS Decimal(8, 2)), 20015, 3856753400, CAST(8.00 AS Decimal(8, 2)), NULL, 113, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1022, CAST(N'2018-07-11' AS Date), CAST(8.10 AS Decimal(8, 2)), CAST(12.00 AS Decimal(8, 2)), CAST(12.00 AS Decimal(8, 2)), CAST(8.10 AS Decimal(8, 2)), 16320, 3141562925, CAST(8.00 AS Decimal(8, 2)), NULL, 112, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1021, CAST(N'2018-07-12' AS Date), CAST(8.20 AS Decimal(8, 2)), CAST(8.20 AS Decimal(8, 2)), CAST(8.30 AS Decimal(8, 2)), CAST(8.10 AS Decimal(8, 2)), 17370, 3356385575, CAST(8.00 AS Decimal(8, 2)), NULL, 109, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1020, CAST(N'2018-07-13' AS Date), CAST(7.50 AS Decimal(8, 2)), CAST(7.30 AS Decimal(8, 2)), CAST(7.60 AS Decimal(8, 2)), CAST(7.30 AS Decimal(8, 2)), 15290, 2967765700, CAST(7.00 AS Decimal(8, 2)), NULL, 101, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1019, CAST(N'2018-07-16' AS Date), CAST(6.90 AS Decimal(8, 2)), CAST(6.90 AS Decimal(8, 2)), CAST(7.10 AS Decimal(8, 2)), CAST(6.50 AS Decimal(8, 2)), 13805, 2667579750, CAST(6.00 AS Decimal(8, 2)), NULL, 84, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1018, CAST(N'2018-07-17' AS Date), CAST(6.40 AS Decimal(8, 2)), CAST(6.90 AS Decimal(8, 2)), CAST(6.90 AS Decimal(8, 2)), CAST(6.30 AS Decimal(8, 2)), 14040, 2719231300, CAST(6.00 AS Decimal(8, 2)), NULL, 96, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1017, CAST(N'2018-07-18' AS Date), CAST(5.60 AS Decimal(8, 2)), CAST(5.80 AS Decimal(8, 2)), CAST(6.00 AS Decimal(8, 2)), CAST(5.60 AS Decimal(8, 2)), 9645, 1858201550, CAST(5.00 AS Decimal(8, 2)), NULL, 71, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1016, CAST(N'2018-07-19' AS Date), CAST(5.40 AS Decimal(8, 2)), CAST(5.40 AS Decimal(8, 2)), CAST(5.70 AS Decimal(8, 2)), CAST(5.40 AS Decimal(8, 2)), 16415, 3192900325, CAST(5.00 AS Decimal(8, 2)), NULL, 103, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1015, CAST(N'2018-07-20' AS Date), CAST(4.90 AS Decimal(8, 2)), CAST(4.40 AS Decimal(8, 2)), CAST(5.20 AS Decimal(8, 2)), CAST(4.40 AS Decimal(8, 2)), 15930, 3014143850, CAST(4.00 AS Decimal(8, 2)), NULL, 120, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1014, CAST(N'2018-07-23' AS Date), CAST(3.80 AS Decimal(8, 2)), CAST(3.90 AS Decimal(8, 2)), CAST(3.90 AS Decimal(8, 2)), CAST(3.60 AS Decimal(8, 2)), 13925, 2642418750, CAST(3.00 AS Decimal(8, 2)), NULL, 92, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1013, CAST(N'2018-07-24' AS Date), CAST(3.20 AS Decimal(8, 2)), CAST(3.00 AS Decimal(8, 2)), CAST(3.50 AS Decimal(8, 2)), CAST(2.90 AS Decimal(8, 2)), 26585, 4983361325, CAST(3.00 AS Decimal(8, 2)), NULL, 124, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1012, CAST(N'2018-07-25' AS Date), CAST(2.10 AS Decimal(8, 2)), CAST(2.20 AS Decimal(8, 2)), CAST(2.40 AS Decimal(8, 2)), CAST(2.00 AS Decimal(8, 2)), 15215, 2825512550, CAST(2.00 AS Decimal(8, 2)), NULL, 89, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1011, CAST(N'2018-07-26' AS Date), CAST(1.70 AS Decimal(8, 2)), CAST(2.30 AS Decimal(8, 2)), CAST(2.30 AS Decimal(8, 2)), CAST(1.50 AS Decimal(8, 2)), 22265, 4147996175, CAST(1.00 AS Decimal(8, 2)), NULL, 119, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1010, CAST(N'2018-07-27' AS Date), CAST(1.10 AS Decimal(8, 2)), CAST(1.10 AS Decimal(8, 2)), CAST(1.30 AS Decimal(8, 2)), CAST(1.00 AS Decimal(8, 2)), 8405, 1562273725, CAST(1.00 AS Decimal(8, 2)), NULL, 55, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1008, CAST(N'2018-07-31' AS Date), CAST(14.10 AS Decimal(8, 2)), CAST(13.50 AS Decimal(8, 2)), CAST(14.10 AS Decimal(8, 2)), CAST(13.50 AS Decimal(8, 2)), 6870, 1294536050, CAST(13.00 AS Decimal(8, 2)), NULL, 28, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1007, CAST(N'2018-08-01' AS Date), CAST(12.80 AS Decimal(8, 2)), CAST(12.70 AS Decimal(8, 2)), CAST(12.80 AS Decimal(8, 2)), CAST(12.70 AS Decimal(8, 2)), 10805, 2032351175, CAST(12.00 AS Decimal(8, 2)), NULL, 80, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1006, CAST(N'2018-08-02' AS Date), CAST(12.70 AS Decimal(8, 2)), CAST(12.50 AS Decimal(8, 2)), CAST(13.10 AS Decimal(8, 2)), CAST(12.50 AS Decimal(8, 2)), 15920, 3006626325, CAST(12.00 AS Decimal(8, 2)), NULL, 99, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1005, CAST(N'2018-08-03' AS Date), CAST(12.30 AS Decimal(8, 2)), CAST(12.30 AS Decimal(8, 2)), CAST(12.60 AS Decimal(8, 2)), CAST(12.30 AS Decimal(8, 2)), 10795, 2014607850, CAST(12.00 AS Decimal(8, 2)), NULL, 88, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1004, CAST(N'2018-08-06' AS Date), CAST(11.10 AS Decimal(8, 2)), CAST(11.10 AS Decimal(8, 2)), CAST(11.40 AS Decimal(8, 2)), CAST(11.00 AS Decimal(8, 2)), 9825, 1833627675, CAST(11.00 AS Decimal(8, 2)), NULL, 73, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1003, CAST(N'2018-08-07' AS Date), CAST(10.30 AS Decimal(8, 2)), CAST(10.40 AS Decimal(8, 2)), CAST(10.40 AS Decimal(8, 2)), CAST(9.80 AS Decimal(8, 2)), 10960, 2039701900, CAST(10.00 AS Decimal(8, 2)), NULL, 87, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1002, CAST(N'2018-08-08' AS Date), CAST(9.30 AS Decimal(8, 2)), CAST(9.40 AS Decimal(8, 2)), CAST(9.40 AS Decimal(8, 2)), CAST(9.30 AS Decimal(8, 2)), 10685, 2009432900, CAST(9.00 AS Decimal(8, 2)), NULL, 67, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1001, CAST(N'2018-08-09' AS Date), CAST(9.40 AS Decimal(8, 2)), CAST(9.50 AS Decimal(8, 2)), CAST(9.70 AS Decimal(8, 2)), CAST(9.00 AS Decimal(8, 2)), 11235, 2141640375, CAST(9.00 AS Decimal(8, 2)), NULL, 100, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1000, CAST(N'2018-08-10' AS Date), CAST(9.40 AS Decimal(8, 2)), CAST(9.30 AS Decimal(8, 2)), CAST(9.40 AS Decimal(8, 2)), CAST(9.20 AS Decimal(8, 2)), 11075, 2135517875, CAST(9.00 AS Decimal(8, 2)), NULL, 75, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (999, CAST(N'2018-08-13' AS Date), CAST(8.90 AS Decimal(8, 2)), CAST(14.50 AS Decimal(8, 2)), CAST(14.50 AS Decimal(8, 2)), CAST(8.30 AS Decimal(8, 2)), 16115, 3148621725, CAST(8.00 AS Decimal(8, 2)), NULL, 102, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (998, CAST(N'2018-08-14' AS Date), CAST(8.00 AS Decimal(8, 2)), CAST(8.00 AS Decimal(8, 2)), CAST(8.10 AS Decimal(8, 2)), CAST(7.80 AS Decimal(8, 2)), 21095, 4102127175, CAST(7.00 AS Decimal(8, 2)), NULL, 123, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (997, CAST(N'2018-08-15' AS Date), CAST(7.20 AS Decimal(8, 2)), CAST(7.40 AS Decimal(8, 2)), CAST(7.60 AS Decimal(8, 2)), CAST(7.10 AS Decimal(8, 2)), 25315, 4962507125, CAST(7.00 AS Decimal(8, 2)), NULL, 127, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (996, CAST(N'2018-08-16' AS Date), CAST(6.90 AS Decimal(8, 2)), CAST(6.90 AS Decimal(8, 2)), CAST(7.50 AS Decimal(8, 2)), CAST(6.90 AS Decimal(8, 2)), 19745, 3838482250, CAST(7.00 AS Decimal(8, 2)), NULL, 100, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (995, CAST(N'2018-08-17' AS Date), CAST(6.60 AS Decimal(8, 2)), CAST(6.10 AS Decimal(8, 2)), CAST(7.10 AS Decimal(8, 2)), CAST(6.10 AS Decimal(8, 2)), 17020, 3357599675, CAST(6.00 AS Decimal(8, 2)), NULL, 114, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (994, CAST(N'2018-08-20' AS Date), CAST(5.50 AS Decimal(8, 2)), CAST(5.60 AS Decimal(8, 2)), CAST(6.10 AS Decimal(8, 2)), CAST(5.30 AS Decimal(8, 2)), 9520, 1879488700, CAST(5.00 AS Decimal(8, 2)), NULL, 84, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (993, CAST(N'2018-08-21' AS Date), CAST(4.80 AS Decimal(8, 2)), CAST(4.90 AS Decimal(8, 2)), CAST(5.50 AS Decimal(8, 2)), CAST(4.80 AS Decimal(8, 2)), 14635, 2921296200, CAST(4.00 AS Decimal(8, 2)), NULL, 87, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (992, CAST(N'2018-08-22' AS Date), CAST(4.30 AS Decimal(8, 2)), CAST(4.20 AS Decimal(8, 2)), CAST(4.60 AS Decimal(8, 2)), CAST(4.20 AS Decimal(8, 2)), 13835, 2821239375, CAST(4.00 AS Decimal(8, 2)), NULL, 104, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (991, CAST(N'2018-08-23' AS Date), CAST(3.80 AS Decimal(8, 2)), CAST(3.90 AS Decimal(8, 2)), CAST(4.50 AS Decimal(8, 2)), CAST(3.70 AS Decimal(8, 2)), 23425, 4774755575, CAST(3.00 AS Decimal(8, 2)), NULL, 113, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (990, CAST(N'2018-08-24' AS Date), CAST(3.50 AS Decimal(8, 2)), CAST(3.50 AS Decimal(8, 2)), CAST(3.60 AS Decimal(8, 2)), CAST(3.30 AS Decimal(8, 2)), 17150, 3506219175, CAST(3.00 AS Decimal(8, 2)), NULL, 85, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (989, CAST(N'2018-08-27' AS Date), CAST(2.90 AS Decimal(8, 2)), CAST(3.10 AS Decimal(8, 2)), CAST(3.20 AS Decimal(8, 2)), CAST(2.70 AS Decimal(8, 2)), 7305, 1487171025, CAST(2.00 AS Decimal(8, 2)), NULL, 76, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (988, CAST(N'2018-08-28' AS Date), CAST(2.40 AS Decimal(8, 2)), CAST(2.40 AS Decimal(8, 2)), CAST(2.60 AS Decimal(8, 2)), CAST(2.30 AS Decimal(8, 2)), 8360, 1722825325, CAST(2.00 AS Decimal(8, 2)), NULL, 72, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (987, CAST(N'2018-08-29' AS Date), CAST(2.10 AS Decimal(8, 2)), CAST(1.90 AS Decimal(8, 2)), CAST(2.20 AS Decimal(8, 2)), CAST(1.60 AS Decimal(8, 2)), 7015, 1451187400, CAST(2.00 AS Decimal(8, 2)), NULL, 62, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (986, CAST(N'2018-08-30' AS Date), CAST(11.10 AS Decimal(8, 2)), CAST(11.70 AS Decimal(8, 2)), CAST(11.80 AS Decimal(8, 2)), CAST(11.00 AS Decimal(8, 2)), 22800, 4727274450, CAST(11.00 AS Decimal(8, 2)), NULL, 148, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (985, CAST(N'2018-08-31' AS Date), CAST(10.70 AS Decimal(8, 2)), CAST(10.50 AS Decimal(8, 2)), CAST(11.00 AS Decimal(8, 2)), CAST(10.50 AS Decimal(8, 2)), 14305, 2965500400, CAST(10.00 AS Decimal(8, 2)), NULL, 82, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (984, CAST(N'2018-09-03' AS Date), CAST(10.50 AS Decimal(8, 2)), CAST(10.30 AS Decimal(8, 2)), CAST(10.80 AS Decimal(8, 2)), CAST(10.30 AS Decimal(8, 2)), 4510, 933237625, CAST(10.00 AS Decimal(8, 2)), NULL, 73, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (983, CAST(N'2018-09-04' AS Date), CAST(10.00 AS Decimal(8, 2)), CAST(10.20 AS Decimal(8, 2)), CAST(10.30 AS Decimal(8, 2)), CAST(10.00 AS Decimal(8, 2)), 10830, 2260943750, CAST(10.00 AS Decimal(8, 2)), NULL, 95, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (982, CAST(N'2018-09-05' AS Date), CAST(9.80 AS Decimal(8, 2)), CAST(10.10 AS Decimal(8, 2)), CAST(10.10 AS Decimal(8, 2)), CAST(9.60 AS Decimal(8, 2)), 11460, 2389859650, CAST(9.00 AS Decimal(8, 2)), NULL, 78, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (981, CAST(N'2018-09-06' AS Date), CAST(8.60 AS Decimal(8, 2)), CAST(8.50 AS Decimal(8, 2)), CAST(8.90 AS Decimal(8, 2)), CAST(8.50 AS Decimal(8, 2)), 7935, 1648380775, CAST(8.00 AS Decimal(8, 2)), NULL, 78, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (980, CAST(N'2018-09-10' AS Date), CAST(7.90 AS Decimal(8, 2)), CAST(12.50 AS Decimal(8, 2)), CAST(12.50 AS Decimal(8, 2)), CAST(7.90 AS Decimal(8, 2)), 13990, 2874144650, CAST(8.00 AS Decimal(8, 2)), NULL, 96, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (979, CAST(N'2018-09-11' AS Date), CAST(7.00 AS Decimal(8, 2)), CAST(7.00 AS Decimal(8, 2)), CAST(7.20 AS Decimal(8, 2)), CAST(6.80 AS Decimal(8, 2)), 12035, 2509999000, CAST(7.00 AS Decimal(8, 2)), NULL, 74, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (978, CAST(N'2018-09-12' AS Date), CAST(6.10 AS Decimal(8, 2)), CAST(6.00 AS Decimal(8, 2)), CAST(6.20 AS Decimal(8, 2)), CAST(5.90 AS Decimal(8, 2)), 15130, 3125834850, CAST(6.00 AS Decimal(8, 2)), NULL, 74, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (977, CAST(N'2018-09-13' AS Date), CAST(6.00 AS Decimal(8, 2)), CAST(20.00 AS Decimal(8, 2)), CAST(20.00 AS Decimal(8, 2)), CAST(5.90 AS Decimal(8, 2)), 19670, 4101019725, CAST(6.00 AS Decimal(8, 2)), NULL, 108, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (976, CAST(N'2018-09-14' AS Date), CAST(5.50 AS Decimal(8, 2)), CAST(5.20 AS Decimal(8, 2)), CAST(5.60 AS Decimal(8, 2)), CAST(5.20 AS Decimal(8, 2)), 15765, 3305381925, CAST(5.00 AS Decimal(8, 2)), NULL, 116, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (975, CAST(N'2018-09-17' AS Date), CAST(4.80 AS Decimal(8, 2)), CAST(4.80 AS Decimal(8, 2)), CAST(5.10 AS Decimal(8, 2)), CAST(4.60 AS Decimal(8, 2)), 27645, 5770135025, CAST(4.00 AS Decimal(8, 2)), NULL, 99, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (974, CAST(N'2018-09-18' AS Date), CAST(3.60 AS Decimal(8, 2)), CAST(3.40 AS Decimal(8, 2)), CAST(3.70 AS Decimal(8, 2)), CAST(3.30 AS Decimal(8, 2)), 19115, 3957162850, CAST(3.00 AS Decimal(8, 2)), NULL, 104, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (973, CAST(N'2018-09-19' AS Date), CAST(3.10 AS Decimal(8, 2)), CAST(3.00 AS Decimal(8, 2)), CAST(3.10 AS Decimal(8, 2)), CAST(2.90 AS Decimal(8, 2)), 18565, 3841210050, CAST(3.00 AS Decimal(8, 2)), NULL, 115, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (972, CAST(N'2018-09-20' AS Date), CAST(3.00 AS Decimal(8, 2)), CAST(2.80 AS Decimal(8, 2)), CAST(3.10 AS Decimal(8, 2)), CAST(2.50 AS Decimal(8, 2)), 23530, 4826659975, CAST(2.00 AS Decimal(8, 2)), NULL, 113, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (971, CAST(N'2018-09-21' AS Date), CAST(2.00 AS Decimal(8, 2)), CAST(2.20 AS Decimal(8, 2)), CAST(2.60 AS Decimal(8, 2)), CAST(1.80 AS Decimal(8, 2)), 13870, 2825940675, CAST(2.00 AS Decimal(8, 2)), NULL, 106, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (970, CAST(N'2018-09-24' AS Date), CAST(2.00 AS Decimal(8, 2)), CAST(1.70 AS Decimal(8, 2)), CAST(2.00 AS Decimal(8, 2)), CAST(1.50 AS Decimal(8, 2)), 20705, 4204427250, CAST(1.00 AS Decimal(8, 2)), NULL, 90, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (969, CAST(N'2018-09-25' AS Date), CAST(1.00 AS Decimal(8, 2)), CAST(0.60 AS Decimal(8, 2)), CAST(1.00 AS Decimal(8, 2)), CAST(0.60 AS Decimal(8, 2)), 17240, 3559602600, CAST(0.00 AS Decimal(8, 2)), NULL, 116, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (968, CAST(N'2018-09-26' AS Date), CAST(-0.10 AS Decimal(8, 2)), CAST(-0.10 AS Decimal(8, 2)), CAST(-0.10 AS Decimal(8, 2)), CAST(-0.10 AS Decimal(8, 2)), 2035, 412792875, CAST(0.00 AS Decimal(8, 2)), NULL, 47, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (967, CAST(N'2018-09-27' AS Date), CAST(9.60 AS Decimal(8, 2)), CAST(9.50 AS Decimal(8, 2)), CAST(9.60 AS Decimal(8, 2)), CAST(9.50 AS Decimal(8, 2)), 2800, 562623300, CAST(9.00 AS Decimal(8, 2)), NULL, 16, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (966, CAST(N'2018-09-28' AS Date), CAST(7.60 AS Decimal(8, 2)), CAST(7.00 AS Decimal(8, 2)), CAST(7.80 AS Decimal(8, 2)), CAST(7.00 AS Decimal(8, 2)), 32990, 6616873450, CAST(7.00 AS Decimal(8, 2)), NULL, 63, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (965, CAST(N'2018-10-01' AS Date), CAST(7.80 AS Decimal(8, 2)), CAST(8.30 AS Decimal(8, 2)), CAST(8.50 AS Decimal(8, 2)), CAST(7.80 AS Decimal(8, 2)), 17110, 3452178050, CAST(7.00 AS Decimal(8, 2)), NULL, 103, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (964, CAST(N'2018-10-02' AS Date), CAST(8.40 AS Decimal(8, 2)), CAST(7.50 AS Decimal(8, 2)), CAST(8.60 AS Decimal(8, 2)), CAST(7.50 AS Decimal(8, 2)), 11820, 2339689850, CAST(8.00 AS Decimal(8, 2)), NULL, 96, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (963, CAST(N'2018-10-03' AS Date), CAST(7.60 AS Decimal(8, 2)), CAST(7.70 AS Decimal(8, 2)), CAST(7.90 AS Decimal(8, 2)), CAST(7.30 AS Decimal(8, 2)), 75480, 14574400650, CAST(7.00 AS Decimal(8, 2)), NULL, 121, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (962, CAST(N'2018-10-04' AS Date), CAST(7.20 AS Decimal(8, 2)), CAST(7.50 AS Decimal(8, 2)), CAST(7.70 AS Decimal(8, 2)), CAST(7.20 AS Decimal(8, 2)), 11025, 2156521375, CAST(7.00 AS Decimal(8, 2)), NULL, 105, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (961, CAST(N'2018-10-05' AS Date), CAST(7.10 AS Decimal(8, 2)), CAST(7.60 AS Decimal(8, 2)), CAST(7.60 AS Decimal(8, 2)), CAST(6.90 AS Decimal(8, 2)), 9795, 1898736725, CAST(7.00 AS Decimal(8, 2)), NULL, 94, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (960, CAST(N'2018-10-08' AS Date), CAST(6.90 AS Decimal(8, 2)), CAST(7.00 AS Decimal(8, 2)), CAST(7.40 AS Decimal(8, 2)), CAST(6.00 AS Decimal(8, 2)), 7595, 1429811200, CAST(6.00 AS Decimal(8, 2)), NULL, 78, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (959, CAST(N'2018-10-09' AS Date), CAST(5.60 AS Decimal(8, 2)), CAST(5.90 AS Decimal(8, 2)), CAST(6.10 AS Decimal(8, 2)), CAST(5.30 AS Decimal(8, 2)), 13490, 2525747550, CAST(5.00 AS Decimal(8, 2)), NULL, 107, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (958, CAST(N'2018-10-10' AS Date), CAST(6.00 AS Decimal(8, 2)), CAST(6.00 AS Decimal(8, 2)), CAST(6.40 AS Decimal(8, 2)), CAST(6.00 AS Decimal(8, 2)), 28690, 5389621825, CAST(6.00 AS Decimal(8, 2)), NULL, 136, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (957, CAST(N'2018-10-11' AS Date), CAST(5.90 AS Decimal(8, 2)), CAST(6.00 AS Decimal(8, 2)), CAST(6.50 AS Decimal(8, 2)), CAST(5.40 AS Decimal(8, 2)), 25115, 4711296375, CAST(5.00 AS Decimal(8, 2)), NULL, 159, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (956, CAST(N'2018-10-15' AS Date), CAST(5.20 AS Decimal(8, 2)), CAST(5.00 AS Decimal(8, 2)), CAST(5.40 AS Decimal(8, 2)), CAST(5.00 AS Decimal(8, 2)), 7400, 1383174825, CAST(5.00 AS Decimal(8, 2)), NULL, 93, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (955, CAST(N'2018-10-16' AS Date), CAST(3.90 AS Decimal(8, 2)), CAST(4.20 AS Decimal(8, 2)), CAST(4.20 AS Decimal(8, 2)), CAST(3.00 AS Decimal(8, 2)), 9920, 1841015825, CAST(3.00 AS Decimal(8, 2)), NULL, 92, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (954, CAST(N'2018-10-17' AS Date), CAST(3.30 AS Decimal(8, 2)), CAST(3.40 AS Decimal(8, 2)), CAST(3.40 AS Decimal(8, 2)), CAST(3.20 AS Decimal(8, 2)), 16825, 3116054900, CAST(3.00 AS Decimal(8, 2)), NULL, 98, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (953, CAST(N'2018-10-18' AS Date), CAST(3.30 AS Decimal(8, 2)), CAST(12.00 AS Decimal(8, 2)), CAST(12.00 AS Decimal(8, 2)), CAST(3.20 AS Decimal(8, 2)), 7225, 1336616050, CAST(3.00 AS Decimal(8, 2)), NULL, 84, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (952, CAST(N'2018-10-19' AS Date), CAST(2.90 AS Decimal(8, 2)), CAST(2.70 AS Decimal(8, 2)), CAST(3.20 AS Decimal(8, 2)), CAST(2.70 AS Decimal(8, 2)), 9010, 1671737725, CAST(2.00 AS Decimal(8, 2)), NULL, 87, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (951, CAST(N'2018-10-22' AS Date), CAST(2.00 AS Decimal(8, 2)), CAST(0.30 AS Decimal(8, 2)), CAST(2.40 AS Decimal(8, 2)), CAST(-0.10 AS Decimal(8, 2)), 11170, 2062156725, CAST(2.00 AS Decimal(8, 2)), NULL, 72, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (950, CAST(N'2018-10-23' AS Date), CAST(1.80 AS Decimal(8, 2)), CAST(1.90 AS Decimal(8, 2)), CAST(2.00 AS Decimal(8, 2)), CAST(1.30 AS Decimal(8, 2)), 21290, 3948945375, CAST(1.00 AS Decimal(8, 2)), NULL, 101, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (949, CAST(N'2018-10-24' AS Date), CAST(1.00 AS Decimal(8, 2)), CAST(0.90 AS Decimal(8, 2)), CAST(1.40 AS Decimal(8, 2)), CAST(0.60 AS Decimal(8, 2)), 14390, 2667059550, CAST(0.00 AS Decimal(8, 2)), NULL, 82, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (948, CAST(N'2018-10-25' AS Date), CAST(1.20 AS Decimal(8, 2)), CAST(1.10 AS Decimal(8, 2)), CAST(1.50 AS Decimal(8, 2)), CAST(1.00 AS Decimal(8, 2)), 14140, 2617747950, CAST(1.00 AS Decimal(8, 2)), NULL, 105, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (947, CAST(N'2018-10-26' AS Date), CAST(0.80 AS Decimal(8, 2)), CAST(0.70 AS Decimal(8, 2)), CAST(0.90 AS Decimal(8, 2)), CAST(0.70 AS Decimal(8, 2)), 13625, 2504345300, CAST(0.00 AS Decimal(8, 2)), NULL, 95, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (946, CAST(N'2018-10-29' AS Date), CAST(0.20 AS Decimal(8, 2)), CAST(0.40 AS Decimal(8, 2)), CAST(0.40 AS Decimal(8, 2)), CAST(0.20 AS Decimal(8, 2)), 3470, 631034075, CAST(0.00 AS Decimal(8, 2)), NULL, 22, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (945, CAST(N'2018-10-30' AS Date), CAST(9.00 AS Decimal(8, 2)), CAST(9.80 AS Decimal(8, 2)), CAST(9.80 AS Decimal(8, 2)), CAST(9.00 AS Decimal(8, 2)), 60, 11133500, CAST(9.00 AS Decimal(8, 2)), NULL, 2, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (944, CAST(N'2018-10-31' AS Date), CAST(9.80 AS Decimal(8, 2)), CAST(9.60 AS Decimal(8, 2)), CAST(9.80 AS Decimal(8, 2)), CAST(9.20 AS Decimal(8, 2)), 27165, 5062688150, CAST(9.00 AS Decimal(8, 2)), NULL, 75, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (943, CAST(N'2018-11-01' AS Date), CAST(8.40 AS Decimal(8, 2)), CAST(8.60 AS Decimal(8, 2)), CAST(8.60 AS Decimal(8, 2)), CAST(8.30 AS Decimal(8, 2)), 14640, 2712602150, CAST(8.00 AS Decimal(8, 2)), NULL, 99, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (942, CAST(N'2018-11-05' AS Date), CAST(6.80 AS Decimal(8, 2)), CAST(6.60 AS Decimal(8, 2)), CAST(7.00 AS Decimal(8, 2)), CAST(6.60 AS Decimal(8, 2)), 8510, 1579260925, CAST(6.00 AS Decimal(8, 2)), NULL, 71, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (941, CAST(N'2018-11-06' AS Date), CAST(6.40 AS Decimal(8, 2)), CAST(6.30 AS Decimal(8, 2)), CAST(6.40 AS Decimal(8, 2)), CAST(6.20 AS Decimal(8, 2)), 8010, 1504072825, CAST(6.00 AS Decimal(8, 2)), NULL, 72, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (940, CAST(N'2018-11-07' AS Date), CAST(5.90 AS Decimal(8, 2)), CAST(5.80 AS Decimal(8, 2)), CAST(6.10 AS Decimal(8, 2)), CAST(5.70 AS Decimal(8, 2)), 8575, 1614307650, CAST(5.00 AS Decimal(8, 2)), NULL, 84, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (939, CAST(N'2018-11-08' AS Date), CAST(5.50 AS Decimal(8, 2)), CAST(8.20 AS Decimal(8, 2)), CAST(8.60 AS Decimal(8, 2)), CAST(5.30 AS Decimal(8, 2)), 13045, 2442411200, CAST(5.00 AS Decimal(8, 2)), NULL, 89, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (938, CAST(N'2018-11-09' AS Date), CAST(4.40 AS Decimal(8, 2)), CAST(4.60 AS Decimal(8, 2)), CAST(4.60 AS Decimal(8, 2)), CAST(4.10 AS Decimal(8, 2)), 9145, 1716970450, CAST(4.00 AS Decimal(8, 2)), NULL, 105, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (937, CAST(N'2018-11-12' AS Date), CAST(4.50 AS Decimal(8, 2)), CAST(4.80 AS Decimal(8, 2)), CAST(4.80 AS Decimal(8, 2)), CAST(4.20 AS Decimal(8, 2)), 11780, 2210121350, CAST(4.00 AS Decimal(8, 2)), NULL, 90, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (936, CAST(N'2018-11-13' AS Date), CAST(4.30 AS Decimal(8, 2)), CAST(8.00 AS Decimal(8, 2)), CAST(8.00 AS Decimal(8, 2)), CAST(3.80 AS Decimal(8, 2)), 24810, 4693590525, CAST(4.00 AS Decimal(8, 2)), NULL, 148, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (935, CAST(N'2018-11-14' AS Date), CAST(4.30 AS Decimal(8, 2)), CAST(4.40 AS Decimal(8, 2)), CAST(4.50 AS Decimal(8, 2)), CAST(4.10 AS Decimal(8, 2)), 27520, 5224453075, CAST(4.00 AS Decimal(8, 2)), NULL, 111, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (934, CAST(N'2018-11-16' AS Date), CAST(3.10 AS Decimal(8, 2)), CAST(3.40 AS Decimal(8, 2)), CAST(3.40 AS Decimal(8, 2)), CAST(3.00 AS Decimal(8, 2)), 9885, 1856226650, CAST(3.00 AS Decimal(8, 2)), NULL, 95, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (933, CAST(N'2018-11-19' AS Date), CAST(2.10 AS Decimal(8, 2)), CAST(2.20 AS Decimal(8, 2)), CAST(2.20 AS Decimal(8, 2)), CAST(1.70 AS Decimal(8, 2)), 13935, 2617888275, CAST(1.00 AS Decimal(8, 2)), NULL, 107, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (932, CAST(N'2018-11-21' AS Date), CAST(1.40 AS Decimal(8, 2)), CAST(0.80 AS Decimal(8, 2)), CAST(1.70 AS Decimal(8, 2)), CAST(0.40 AS Decimal(8, 2)), 15000, 2841287750, CAST(1.00 AS Decimal(8, 2)), NULL, 90, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (931, CAST(N'2018-11-22' AS Date), CAST(0.70 AS Decimal(8, 2)), CAST(0.80 AS Decimal(8, 2)), CAST(0.80 AS Decimal(8, 2)), CAST(0.40 AS Decimal(8, 2)), 6365, 1212827175, CAST(0.00 AS Decimal(8, 2)), NULL, 71, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (930, CAST(N'2018-11-23' AS Date), CAST(0.20 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), CAST(1.10 AS Decimal(8, 2)), CAST(-0.10 AS Decimal(8, 2)), 22625, 4308070850, CAST(0.00 AS Decimal(8, 2)), NULL, 107, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (929, CAST(N'2018-11-26' AS Date), CAST(0.20 AS Decimal(8, 2)), CAST(0.50 AS Decimal(8, 2)), CAST(0.50 AS Decimal(8, 2)), CAST(0.10 AS Decimal(8, 2)), 17275, 3338984975, CAST(0.00 AS Decimal(8, 2)), NULL, 95, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (928, CAST(N'2018-11-27' AS Date), CAST(0.20 AS Decimal(8, 2)), CAST(0.20 AS Decimal(8, 2)), CAST(0.30 AS Decimal(8, 2)), CAST(-0.20 AS Decimal(8, 2)), 9820, 1911277825, CAST(0.00 AS Decimal(8, 2)), NULL, 74, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (927, CAST(N'2018-11-28' AS Date), CAST(-0.50 AS Decimal(8, 2)), CAST(-0.80 AS Decimal(8, 2)), CAST(-0.40 AS Decimal(8, 2)), CAST(-0.80 AS Decimal(8, 2)), 8430, 1628041525, CAST(0.00 AS Decimal(8, 2)), NULL, 44, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (926, CAST(N'2018-11-29' AS Date), CAST(6.70 AS Decimal(8, 2)), CAST(5.80 AS Decimal(8, 2)), CAST(6.70 AS Decimal(8, 2)), CAST(5.80 AS Decimal(8, 2)), 975, 188334675, CAST(6.00 AS Decimal(8, 2)), NULL, 6, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (925, CAST(N'2018-11-30' AS Date), CAST(5.80 AS Decimal(8, 2)), CAST(5.50 AS Decimal(8, 2)), CAST(5.80 AS Decimal(8, 2)), CAST(5.20 AS Decimal(8, 2)), 17840, 3451043800, CAST(5.00 AS Decimal(8, 2)), NULL, 73, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (924, CAST(N'2018-12-03' AS Date), CAST(3.80 AS Decimal(8, 2)), CAST(4.20 AS Decimal(8, 2)), CAST(4.30 AS Decimal(8, 2)), CAST(3.70 AS Decimal(8, 2)), 9960, 1908536025, CAST(3.00 AS Decimal(8, 2)), NULL, 86, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (923, CAST(N'2018-12-04' AS Date), CAST(2.20 AS Decimal(8, 2)), CAST(2.30 AS Decimal(8, 2)), CAST(2.70 AS Decimal(8, 2)), CAST(2.20 AS Decimal(8, 2)), 15890, 3045848375, CAST(2.00 AS Decimal(8, 2)), NULL, 104, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (922, CAST(N'2018-12-05' AS Date), CAST(3.30 AS Decimal(8, 2)), CAST(3.70 AS Decimal(8, 2)), CAST(3.70 AS Decimal(8, 2)), CAST(3.10 AS Decimal(8, 2)), 12360, 2385060250, CAST(3.00 AS Decimal(8, 2)), NULL, 77, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (921, CAST(N'2018-12-06' AS Date), CAST(3.60 AS Decimal(8, 2)), CAST(5.20 AS Decimal(8, 2)), CAST(5.20 AS Decimal(8, 2)), CAST(3.00 AS Decimal(8, 2)), 17645, 3459593875, CAST(3.00 AS Decimal(8, 2)), NULL, 105, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (920, CAST(N'2018-12-07' AS Date), CAST(2.80 AS Decimal(8, 2)), CAST(3.30 AS Decimal(8, 2)), CAST(3.30 AS Decimal(8, 2)), CAST(2.60 AS Decimal(8, 2)), 7410, 1444646225, CAST(2.00 AS Decimal(8, 2)), NULL, 80, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (919, CAST(N'2018-12-10' AS Date), CAST(1.40 AS Decimal(8, 2)), CAST(1.60 AS Decimal(8, 2)), CAST(1.80 AS Decimal(8, 2)), CAST(1.00 AS Decimal(8, 2)), 15825, 3095554600, CAST(1.00 AS Decimal(8, 2)), NULL, 83, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (918, CAST(N'2018-12-11' AS Date), CAST(2.00 AS Decimal(8, 2)), CAST(2.80 AS Decimal(8, 2)), CAST(2.80 AS Decimal(8, 2)), CAST(2.00 AS Decimal(8, 2)), 26135, 5100838625, CAST(2.00 AS Decimal(8, 2)), NULL, 121, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (917, CAST(N'2018-12-12' AS Date), CAST(1.90 AS Decimal(8, 2)), CAST(1.80 AS Decimal(8, 2)), CAST(1.90 AS Decimal(8, 2)), CAST(1.00 AS Decimal(8, 2)), 29020, 5607083300, CAST(1.00 AS Decimal(8, 2)), NULL, 121, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (916, CAST(N'2018-12-13' AS Date), CAST(1.60 AS Decimal(8, 2)), CAST(3.50 AS Decimal(8, 2)), CAST(3.50 AS Decimal(8, 2)), CAST(1.60 AS Decimal(8, 2)), 17930, 3479330650, CAST(2.00 AS Decimal(8, 2)), NULL, 126, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (915, CAST(N'2018-12-14' AS Date), CAST(1.30 AS Decimal(8, 2)), CAST(1.30 AS Decimal(8, 2)), CAST(1.40 AS Decimal(8, 2)), CAST(1.10 AS Decimal(8, 2)), 19110, 3736273475, CAST(1.00 AS Decimal(8, 2)), NULL, 123, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (914, CAST(N'2018-12-17' AS Date), CAST(0.50 AS Decimal(8, 2)), CAST(0.50 AS Decimal(8, 2)), CAST(0.60 AS Decimal(8, 2)), CAST(0.20 AS Decimal(8, 2)), 16270, 3182833250, CAST(0.00 AS Decimal(8, 2)), NULL, 101, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (913, CAST(N'2018-12-18' AS Date), CAST(0.30 AS Decimal(8, 2)), CAST(0.10 AS Decimal(8, 2)), CAST(0.60 AS Decimal(8, 2)), CAST(0.10 AS Decimal(8, 2)), 31385, 6120327775, CAST(0.00 AS Decimal(8, 2)), NULL, 123, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (912, CAST(N'2018-12-19' AS Date), CAST(-0.30 AS Decimal(8, 2)), CAST(0.10 AS Decimal(8, 2)), CAST(0.10 AS Decimal(8, 2)), CAST(-0.80 AS Decimal(8, 2)), 28125, 5470727375, CAST(0.00 AS Decimal(8, 2)), NULL, 163, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (911, CAST(N'2018-12-20' AS Date), CAST(-0.20 AS Decimal(8, 2)), CAST(0.20 AS Decimal(8, 2)), CAST(0.20 AS Decimal(8, 2)), CAST(-0.50 AS Decimal(8, 2)), 9985, 1919125675, CAST(0.00 AS Decimal(8, 2)), NULL, 93, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (910, CAST(N'2018-12-21' AS Date), CAST(-0.20 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), CAST(0.10 AS Decimal(8, 2)), CAST(-0.40 AS Decimal(8, 2)), 6940, 1341804875, CAST(0.00 AS Decimal(8, 2)), NULL, 64, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (909, CAST(N'2018-12-26' AS Date), CAST(-2.70 AS Decimal(8, 2)), CAST(-2.90 AS Decimal(8, 2)), CAST(-2.20 AS Decimal(8, 2)), CAST(-3.00 AS Decimal(8, 2)), 5160, 1012144575, CAST(-2.00 AS Decimal(8, 2)), NULL, 35, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (908, CAST(N'2018-12-27' AS Date), CAST(2.30 AS Decimal(8, 2)), CAST(4.40 AS Decimal(8, 2)), CAST(4.40 AS Decimal(8, 2)), CAST(1.70 AS Decimal(8, 2)), 12760, 2510925775, CAST(2.00 AS Decimal(8, 2)), NULL, 78, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (907, CAST(N'2018-12-28' AS Date), CAST(4.90 AS Decimal(8, 2)), CAST(4.00 AS Decimal(8, 2)), CAST(8.00 AS Decimal(8, 2)), CAST(4.00 AS Decimal(8, 2)), 21425, 4156154175, CAST(4.00 AS Decimal(8, 2)), NULL, 82, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (906, CAST(N'2019-01-02' AS Date), CAST(5.90 AS Decimal(8, 2)), CAST(6.90 AS Decimal(8, 2)), CAST(6.90 AS Decimal(8, 2)), CAST(5.80 AS Decimal(8, 2)), 15210, 2939728775, CAST(6.00 AS Decimal(8, 2)), NULL, 98, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (905, CAST(N'2019-01-03' AS Date), CAST(6.70 AS Decimal(8, 2)), CAST(6.80 AS Decimal(8, 2)), CAST(6.90 AS Decimal(8, 2)), CAST(6.50 AS Decimal(8, 2)), 15025, 2836006700, CAST(6.00 AS Decimal(8, 2)), NULL, 73, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (904, CAST(N'2019-01-04' AS Date), CAST(5.80 AS Decimal(8, 2)), CAST(6.20 AS Decimal(8, 2)), CAST(6.20 AS Decimal(8, 2)), CAST(5.60 AS Decimal(8, 2)), 11490, 2165023800, CAST(5.00 AS Decimal(8, 2)), NULL, 82, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (903, CAST(N'2019-01-07' AS Date), CAST(5.30 AS Decimal(8, 2)), CAST(5.40 AS Decimal(8, 2)), CAST(5.40 AS Decimal(8, 2)), CAST(5.10 AS Decimal(8, 2)), 6770, 1256321600, CAST(5.00 AS Decimal(8, 2)), NULL, 56, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (902, CAST(N'2019-01-08' AS Date), CAST(4.50 AS Decimal(8, 2)), CAST(4.50 AS Decimal(8, 2)), CAST(4.80 AS Decimal(8, 2)), CAST(4.40 AS Decimal(8, 2)), 7845, 1461271500, CAST(4.00 AS Decimal(8, 2)), NULL, 69, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (901, CAST(N'2019-01-09' AS Date), CAST(3.90 AS Decimal(8, 2)), CAST(4.00 AS Decimal(8, 2)), CAST(4.30 AS Decimal(8, 2)), CAST(3.70 AS Decimal(8, 2)), 8355, 1544445525, CAST(3.00 AS Decimal(8, 2)), NULL, 84, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (900, CAST(N'2019-01-10' AS Date), CAST(4.80 AS Decimal(8, 2)), CAST(4.70 AS Decimal(8, 2)), CAST(5.00 AS Decimal(8, 2)), CAST(4.70 AS Decimal(8, 2)), 18305, 3378807500, CAST(4.00 AS Decimal(8, 2)), NULL, 102, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (899, CAST(N'2019-01-11' AS Date), CAST(3.80 AS Decimal(8, 2)), CAST(3.70 AS Decimal(8, 2)), CAST(3.90 AS Decimal(8, 2)), CAST(3.60 AS Decimal(8, 2)), 7505, 1395128925, CAST(3.00 AS Decimal(8, 2)), NULL, 70, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (898, CAST(N'2019-01-14' AS Date), CAST(2.90 AS Decimal(8, 2)), CAST(3.10 AS Decimal(8, 2)), CAST(3.10 AS Decimal(8, 2)), CAST(2.60 AS Decimal(8, 2)), 18960, 3534925275, CAST(2.00 AS Decimal(8, 2)), NULL, 97, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (897, CAST(N'2019-01-15' AS Date), CAST(2.70 AS Decimal(8, 2)), CAST(2.30 AS Decimal(8, 2)), CAST(2.90 AS Decimal(8, 2)), CAST(2.30 AS Decimal(8, 2)), 16205, 3003891425, CAST(2.00 AS Decimal(8, 2)), NULL, 92, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (896, CAST(N'2019-01-16' AS Date), CAST(2.10 AS Decimal(8, 2)), CAST(2.20 AS Decimal(8, 2)), CAST(2.20 AS Decimal(8, 2)), CAST(1.90 AS Decimal(8, 2)), 11565, 2152088650, CAST(2.00 AS Decimal(8, 2)), NULL, 82, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (895, CAST(N'2019-01-17' AS Date), CAST(1.70 AS Decimal(8, 2)), CAST(1.80 AS Decimal(8, 2)), CAST(2.00 AS Decimal(8, 2)), CAST(1.70 AS Decimal(8, 2)), 19470, 3661333675, CAST(1.00 AS Decimal(8, 2)), NULL, 137, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (894, CAST(N'2019-01-18' AS Date), CAST(1.10 AS Decimal(8, 2)), CAST(1.00 AS Decimal(8, 2)), CAST(1.30 AS Decimal(8, 2)), CAST(1.00 AS Decimal(8, 2)), 10275, 1926447175, CAST(1.00 AS Decimal(8, 2)), NULL, 80, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (893, CAST(N'2019-01-21' AS Date), CAST(1.80 AS Decimal(8, 2)), CAST(1.50 AS Decimal(8, 2)), CAST(1.80 AS Decimal(8, 2)), CAST(1.50 AS Decimal(8, 2)), 4405, 830818575, CAST(1.00 AS Decimal(8, 2)), NULL, 51, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (892, CAST(N'2019-01-22' AS Date), CAST(1.30 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), CAST(2.00 AS Decimal(8, 2)), CAST(1.50 AS Decimal(8, 2)), 18125, 3410173400, CAST(1.00 AS Decimal(8, 2)), NULL, 111, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (891, CAST(N'2019-01-23' AS Date), CAST(1.50 AS Decimal(8, 2)), CAST(1.60 AS Decimal(8, 2)), CAST(1.70 AS Decimal(8, 2)), CAST(1.30 AS Decimal(8, 2)), 15065, 2863012875, CAST(1.00 AS Decimal(8, 2)), NULL, 101, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (890, CAST(N'2019-01-24' AS Date), CAST(1.70 AS Decimal(8, 2)), CAST(1.90 AS Decimal(8, 2)), CAST(1.90 AS Decimal(8, 2)), CAST(1.50 AS Decimal(8, 2)), 22325, 4222922575, CAST(1.00 AS Decimal(8, 2)), NULL, 118, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (889, CAST(N'2019-01-28' AS Date), CAST(0.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), CAST(0.10 AS Decimal(8, 2)), CAST(-1.00 AS Decimal(8, 2)), 17070, 3215398825, CAST(0.00 AS Decimal(8, 2)), NULL, 105, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (888, CAST(N'2019-01-29' AS Date), CAST(-0.40 AS Decimal(8, 2)), CAST(-0.30 AS Decimal(8, 2)), CAST(-0.30 AS Decimal(8, 2)), CAST(-0.60 AS Decimal(8, 2)), 15020, 2806206425, CAST(0.00 AS Decimal(8, 2)), NULL, 71, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (887, CAST(N'2019-01-30' AS Date), CAST(6.80 AS Decimal(8, 2)), CAST(6.90 AS Decimal(8, 2)), CAST(6.90 AS Decimal(8, 2)), CAST(6.80 AS Decimal(8, 2)), 1710, 318225450, CAST(6.00 AS Decimal(8, 2)), NULL, 6, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (886, CAST(N'2019-01-31' AS Date), CAST(6.40 AS Decimal(8, 2)), CAST(6.10 AS Decimal(8, 2)), CAST(6.50 AS Decimal(8, 2)), CAST(6.00 AS Decimal(8, 2)), 9135, 1670874475, CAST(6.00 AS Decimal(8, 2)), NULL, 21, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (885, CAST(N'2019-02-01' AS Date), CAST(5.40 AS Decimal(8, 2)), CAST(5.70 AS Decimal(8, 2)), CAST(5.70 AS Decimal(8, 2)), CAST(3.90 AS Decimal(8, 2)), 10705, 1966896625, CAST(5.00 AS Decimal(8, 2)), NULL, 85, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (884, CAST(N'2019-02-04' AS Date), CAST(5.30 AS Decimal(8, 2)), CAST(4.60 AS Decimal(8, 2)), CAST(5.30 AS Decimal(8, 2)), CAST(4.60 AS Decimal(8, 2)), 11335, 2086048425, CAST(5.00 AS Decimal(8, 2)), NULL, 76, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (883, CAST(N'2019-02-05' AS Date), CAST(4.90 AS Decimal(8, 2)), CAST(5.80 AS Decimal(8, 2)), CAST(5.80 AS Decimal(8, 2)), CAST(4.60 AS Decimal(8, 2)), 9510, 1749307100, CAST(4.00 AS Decimal(8, 2)), NULL, 66, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (882, CAST(N'2019-02-06' AS Date), CAST(4.10 AS Decimal(8, 2)), CAST(4.50 AS Decimal(8, 2)), CAST(4.50 AS Decimal(8, 2)), CAST(3.60 AS Decimal(8, 2)), 8005, 1483271600, CAST(3.00 AS Decimal(8, 2)), NULL, 79, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (881, CAST(N'2019-02-07' AS Date), CAST(4.40 AS Decimal(8, 2)), CAST(5.40 AS Decimal(8, 2)), CAST(5.40 AS Decimal(8, 2)), CAST(4.40 AS Decimal(8, 2)), 18635, 3469722875, CAST(4.00 AS Decimal(8, 2)), NULL, 117, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (880, CAST(N'2019-02-08' AS Date), CAST(4.90 AS Decimal(8, 2)), CAST(5.00 AS Decimal(8, 2)), CAST(5.10 AS Decimal(8, 2)), CAST(4.80 AS Decimal(8, 2)), 8145, 1516323925, CAST(4.00 AS Decimal(8, 2)), NULL, 78, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (879, CAST(N'2019-02-11' AS Date), CAST(4.70 AS Decimal(8, 2)), CAST(4.50 AS Decimal(8, 2)), CAST(4.90 AS Decimal(8, 2)), CAST(4.40 AS Decimal(8, 2)), 10305, 1929017000, CAST(4.00 AS Decimal(8, 2)), NULL, 76, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (878, CAST(N'2019-02-12' AS Date), CAST(4.30 AS Decimal(8, 2)), CAST(4.60 AS Decimal(8, 2)), CAST(4.60 AS Decimal(8, 2)), CAST(4.10 AS Decimal(8, 2)), 8720, 1627974350, CAST(4.00 AS Decimal(8, 2)), NULL, 83, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (877, CAST(N'2019-02-13' AS Date), CAST(3.50 AS Decimal(8, 2)), CAST(3.00 AS Decimal(8, 2)), CAST(4.00 AS Decimal(8, 2)), CAST(3.00 AS Decimal(8, 2)), 13010, 2427165375, CAST(3.00 AS Decimal(8, 2)), NULL, 83, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (876, CAST(N'2019-02-14' AS Date), CAST(3.20 AS Decimal(8, 2)), CAST(3.30 AS Decimal(8, 2)), CAST(3.50 AS Decimal(8, 2)), CAST(3.20 AS Decimal(8, 2)), 21815, 4121811775, CAST(3.00 AS Decimal(8, 2)), NULL, 129, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (875, CAST(N'2019-02-15' AS Date), CAST(2.70 AS Decimal(8, 2)), CAST(2.70 AS Decimal(8, 2)), CAST(2.70 AS Decimal(8, 2)), CAST(2.50 AS Decimal(8, 2)), 9905, 1841422625, CAST(2.00 AS Decimal(8, 2)), NULL, 86, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (874, CAST(N'2019-02-18' AS Date), CAST(2.80 AS Decimal(8, 2)), CAST(3.30 AS Decimal(8, 2)), CAST(3.40 AS Decimal(8, 2)), CAST(2.70 AS Decimal(8, 2)), 9295, 1735582275, CAST(2.00 AS Decimal(8, 2)), NULL, 101, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (873, CAST(N'2019-02-19' AS Date), CAST(1.80 AS Decimal(8, 2)), CAST(1.90 AS Decimal(8, 2)), CAST(2.00 AS Decimal(8, 2)), CAST(1.70 AS Decimal(8, 2)), 19030, 3541896625, CAST(1.00 AS Decimal(8, 2)), NULL, 108, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (872, CAST(N'2019-02-20' AS Date), CAST(1.30 AS Decimal(8, 2)), CAST(6.90 AS Decimal(8, 2)), CAST(6.90 AS Decimal(8, 2)), CAST(1.00 AS Decimal(8, 2)), 16035, 2975460000, CAST(1.00 AS Decimal(8, 2)), NULL, 114, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (871, CAST(N'2019-02-21' AS Date), CAST(1.60 AS Decimal(8, 2)), CAST(1.60 AS Decimal(8, 2)), CAST(1.70 AS Decimal(8, 2)), CAST(1.50 AS Decimal(8, 2)), 14520, 2730531850, CAST(1.00 AS Decimal(8, 2)), NULL, 111, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (870, CAST(N'2019-02-22' AS Date), CAST(0.60 AS Decimal(8, 2)), CAST(0.80 AS Decimal(8, 2)), CAST(0.90 AS Decimal(8, 2)), CAST(0.40 AS Decimal(8, 2)), 52855, 9893341925, CAST(0.00 AS Decimal(8, 2)), NULL, 137, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (869, CAST(N'2019-02-25' AS Date), CAST(0.10 AS Decimal(8, 2)), CAST(-0.10 AS Decimal(8, 2)), CAST(0.10 AS Decimal(8, 2)), CAST(-0.20 AS Decimal(8, 2)), 10185, 1898738100, CAST(0.00 AS Decimal(8, 2)), NULL, 84, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (868, CAST(N'2019-02-26' AS Date), CAST(-0.40 AS Decimal(8, 2)), CAST(-0.20 AS Decimal(8, 2)), CAST(-0.20 AS Decimal(8, 2)), CAST(-0.50 AS Decimal(8, 2)), 9035, 1698159875, CAST(0.00 AS Decimal(8, 2)), NULL, 61, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (867, CAST(N'2019-02-27' AS Date), CAST(6.20 AS Decimal(8, 2)), CAST(6.90 AS Decimal(8, 2)), CAST(6.90 AS Decimal(8, 2)), CAST(6.10 AS Decimal(8, 2)), 2135, 399381100, CAST(6.00 AS Decimal(8, 2)), NULL, 18, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (866, CAST(N'2019-02-28' AS Date), CAST(5.50 AS Decimal(8, 2)), CAST(7.40 AS Decimal(8, 2)), CAST(7.40 AS Decimal(8, 2)), CAST(5.40 AS Decimal(8, 2)), 6165, 1154156425, CAST(5.00 AS Decimal(8, 2)), NULL, 33, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (865, CAST(N'2019-03-01' AS Date), CAST(6.30 AS Decimal(8, 2)), CAST(8.10 AS Decimal(8, 2)), CAST(9.00 AS Decimal(8, 2)), CAST(6.00 AS Decimal(8, 2)), 17430, 3302438800, CAST(6.00 AS Decimal(8, 2)), NULL, 126, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (864, CAST(N'2019-03-06' AS Date), CAST(5.80 AS Decimal(8, 2)), CAST(5.70 AS Decimal(8, 2)), CAST(5.80 AS Decimal(8, 2)), CAST(5.40 AS Decimal(8, 2)), 3540, 678962800, CAST(5.00 AS Decimal(8, 2)), NULL, 57, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (863, CAST(N'2019-03-07' AS Date), CAST(6.10 AS Decimal(8, 2)), CAST(6.00 AS Decimal(8, 2)), CAST(6.10 AS Decimal(8, 2)), CAST(5.50 AS Decimal(8, 2)), 10925, 2105611200, CAST(5.00 AS Decimal(8, 2)), NULL, 91, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (862, CAST(N'2019-03-08' AS Date), CAST(5.40 AS Decimal(8, 2)), CAST(5.40 AS Decimal(8, 2)), CAST(5.90 AS Decimal(8, 2)), CAST(5.30 AS Decimal(8, 2)), 16695, 3233374850, CAST(5.00 AS Decimal(8, 2)), NULL, 105, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (861, CAST(N'2019-03-11' AS Date), CAST(4.70 AS Decimal(8, 2)), CAST(4.80 AS Decimal(8, 2)), CAST(4.80 AS Decimal(8, 2)), CAST(4.50 AS Decimal(8, 2)), 9030, 1738629925, CAST(4.00 AS Decimal(8, 2)), NULL, 71, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (860, CAST(N'2019-03-12' AS Date), CAST(4.30 AS Decimal(8, 2)), CAST(4.70 AS Decimal(8, 2)), CAST(4.70 AS Decimal(8, 2)), CAST(4.20 AS Decimal(8, 2)), 17600, 3359146275, CAST(4.00 AS Decimal(8, 2)), NULL, 118, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (859, CAST(N'2019-03-13' AS Date), CAST(3.60 AS Decimal(8, 2)), CAST(3.70 AS Decimal(8, 2)), CAST(3.70 AS Decimal(8, 2)), CAST(3.20 AS Decimal(8, 2)), 17715, 3392400500, CAST(3.00 AS Decimal(8, 2)), NULL, 84, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (858, CAST(N'2019-03-14' AS Date), CAST(3.80 AS Decimal(8, 2)), CAST(4.00 AS Decimal(8, 2)), CAST(4.00 AS Decimal(8, 2)), CAST(3.50 AS Decimal(8, 2)), 14430, 2767954000, CAST(3.00 AS Decimal(8, 2)), NULL, 112, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (857, CAST(N'2019-03-15' AS Date), CAST(2.60 AS Decimal(8, 2)), CAST(2.90 AS Decimal(8, 2)), CAST(3.00 AS Decimal(8, 2)), CAST(2.40 AS Decimal(8, 2)), 14730, 2825898275, CAST(2.00 AS Decimal(8, 2)), NULL, 131, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (856, CAST(N'2019-03-18' AS Date), CAST(2.10 AS Decimal(8, 2)), CAST(2.30 AS Decimal(8, 2)), CAST(2.40 AS Decimal(8, 2)), CAST(2.10 AS Decimal(8, 2)), 5680, 1082991100, CAST(2.00 AS Decimal(8, 2)), NULL, 85, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (855, CAST(N'2019-03-19' AS Date), CAST(1.80 AS Decimal(8, 2)), CAST(2.10 AS Decimal(8, 2)), CAST(2.20 AS Decimal(8, 2)), CAST(1.50 AS Decimal(8, 2)), 15720, 2969452575, CAST(1.00 AS Decimal(8, 2)), NULL, 101, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (854, CAST(N'2019-03-20' AS Date), CAST(1.20 AS Decimal(8, 2)), CAST(1.00 AS Decimal(8, 2)), CAST(1.40 AS Decimal(8, 2)), CAST(1.00 AS Decimal(8, 2)), 13380, 2536063800, CAST(1.00 AS Decimal(8, 2)), NULL, 88, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (853, CAST(N'2019-03-21' AS Date), CAST(1.40 AS Decimal(8, 2)), CAST(0.70 AS Decimal(8, 2)), CAST(1.70 AS Decimal(8, 2)), CAST(0.70 AS Decimal(8, 2)), 13005, 2469727525, CAST(1.00 AS Decimal(8, 2)), NULL, 106, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (852, CAST(N'2019-03-22' AS Date), CAST(0.60 AS Decimal(8, 2)), CAST(0.40 AS Decimal(8, 2)), CAST(1.10 AS Decimal(8, 2)), CAST(0.40 AS Decimal(8, 2)), 11315, 2196292225, CAST(0.00 AS Decimal(8, 2)), NULL, 112, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (851, CAST(N'2019-03-25' AS Date), CAST(0.60 AS Decimal(8, 2)), CAST(0.40 AS Decimal(8, 2)), CAST(0.80 AS Decimal(8, 2)), CAST(0.40 AS Decimal(8, 2)), 11875, 2302346475, CAST(0.00 AS Decimal(8, 2)), NULL, 95, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (850, CAST(N'2019-03-26' AS Date), CAST(0.50 AS Decimal(8, 2)), CAST(0.50 AS Decimal(8, 2)), CAST(0.50 AS Decimal(8, 2)), CAST(0.10 AS Decimal(8, 2)), 11930, 2305451425, CAST(0.00 AS Decimal(8, 2)), NULL, 83, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (849, CAST(N'2019-03-27' AS Date), CAST(0.00 AS Decimal(8, 2)), CAST(0.20 AS Decimal(8, 2)), CAST(0.20 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), 2840, 559330700, CAST(0.00 AS Decimal(8, 2)), NULL, 28, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (848, CAST(N'2019-03-28' AS Date), CAST(8.30 AS Decimal(8, 2)), CAST(8.40 AS Decimal(8, 2)), CAST(8.50 AS Decimal(8, 2)), CAST(8.30 AS Decimal(8, 2)), 3310, 658121625, CAST(8.00 AS Decimal(8, 2)), NULL, 21, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (847, CAST(N'2019-03-29' AS Date), CAST(7.60 AS Decimal(8, 2)), CAST(7.40 AS Decimal(8, 2)), CAST(8.00 AS Decimal(8, 2)), CAST(7.10 AS Decimal(8, 2)), 31645, 6177370550, CAST(7.00 AS Decimal(8, 2)), NULL, 86, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (846, CAST(N'2019-04-01' AS Date), CAST(7.30 AS Decimal(8, 2)), CAST(7.30 AS Decimal(8, 2)), CAST(7.40 AS Decimal(8, 2)), CAST(7.20 AS Decimal(8, 2)), 7135, 1382575125, CAST(7.00 AS Decimal(8, 2)), NULL, 88, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (845, CAST(N'2019-04-02' AS Date), CAST(6.90 AS Decimal(8, 2)), CAST(7.40 AS Decimal(8, 2)), CAST(7.40 AS Decimal(8, 2)), CAST(6.60 AS Decimal(8, 2)), 14485, 2804935200, CAST(6.00 AS Decimal(8, 2)), NULL, 82, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (844, CAST(N'2019-04-03' AS Date), CAST(6.70 AS Decimal(8, 2)), CAST(6.40 AS Decimal(8, 2)), CAST(6.80 AS Decimal(8, 2)), CAST(6.40 AS Decimal(8, 2)), 14615, 2813484925, CAST(6.00 AS Decimal(8, 2)), NULL, 96, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (843, CAST(N'2019-04-04' AS Date), CAST(6.80 AS Decimal(8, 2)), CAST(7.20 AS Decimal(8, 2)), CAST(7.20 AS Decimal(8, 2)), CAST(6.50 AS Decimal(8, 2)), 15035, 2915296300, CAST(6.00 AS Decimal(8, 2)), NULL, 95, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (842, CAST(N'2019-04-05' AS Date), CAST(6.50 AS Decimal(8, 2)), CAST(6.40 AS Decimal(8, 2)), CAST(7.00 AS Decimal(8, 2)), CAST(6.40 AS Decimal(8, 2)), 8730, 1688704375, CAST(6.00 AS Decimal(8, 2)), NULL, 101, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (841, CAST(N'2019-04-08' AS Date), CAST(6.20 AS Decimal(8, 2)), CAST(6.20 AS Decimal(8, 2)), CAST(6.50 AS Decimal(8, 2)), CAST(6.20 AS Decimal(8, 2)), 11565, 2239033850, CAST(6.00 AS Decimal(8, 2)), NULL, 93, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (840, CAST(N'2019-04-09' AS Date), CAST(5.80 AS Decimal(8, 2)), CAST(6.20 AS Decimal(8, 2)), CAST(6.20 AS Decimal(8, 2)), CAST(5.40 AS Decimal(8, 2)), 12940, 2498669225, CAST(5.00 AS Decimal(8, 2)), NULL, 102, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (839, CAST(N'2019-04-10' AS Date), CAST(4.90 AS Decimal(8, 2)), CAST(4.90 AS Decimal(8, 2)), CAST(4.90 AS Decimal(8, 2)), CAST(4.70 AS Decimal(8, 2)), 15020, 2883348425, CAST(4.00 AS Decimal(8, 2)), NULL, 106, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (838, CAST(N'2019-04-11' AS Date), CAST(4.90 AS Decimal(8, 2)), CAST(4.80 AS Decimal(8, 2)), CAST(5.00 AS Decimal(8, 2)), CAST(4.70 AS Decimal(8, 2)), 20585, 3957211600, CAST(4.00 AS Decimal(8, 2)), NULL, 119, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (837, CAST(N'2019-04-12' AS Date), CAST(4.10 AS Decimal(8, 2)), CAST(4.10 AS Decimal(8, 2)), CAST(4.20 AS Decimal(8, 2)), CAST(3.80 AS Decimal(8, 2)), 16055, 3108703000, CAST(4.00 AS Decimal(8, 2)), NULL, 119, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (836, CAST(N'2019-04-15' AS Date), CAST(3.50 AS Decimal(8, 2)), CAST(3.60 AS Decimal(8, 2)), CAST(3.60 AS Decimal(8, 2)), CAST(2.70 AS Decimal(8, 2)), 16005, 3101905250, CAST(3.00 AS Decimal(8, 2)), NULL, 90, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (835, CAST(N'2019-04-16' AS Date), CAST(2.50 AS Decimal(8, 2)), CAST(2.40 AS Decimal(8, 2)), CAST(3.10 AS Decimal(8, 2)), CAST(2.30 AS Decimal(8, 2)), 16155, 3145184950, CAST(2.00 AS Decimal(8, 2)), NULL, 122, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (834, CAST(N'2019-04-17' AS Date), CAST(3.30 AS Decimal(8, 2)), CAST(3.30 AS Decimal(8, 2)), CAST(3.80 AS Decimal(8, 2)), CAST(3.10 AS Decimal(8, 2)), 24395, 4788478225, CAST(3.00 AS Decimal(8, 2)), NULL, 121, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (833, CAST(N'2019-04-18' AS Date), CAST(3.30 AS Decimal(8, 2)), CAST(9.00 AS Decimal(8, 2)), CAST(9.00 AS Decimal(8, 2)), CAST(3.00 AS Decimal(8, 2)), 12050, 2374058475, CAST(3.00 AS Decimal(8, 2)), NULL, 124, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (832, CAST(N'2019-04-22' AS Date), CAST(2.20 AS Decimal(8, 2)), CAST(2.20 AS Decimal(8, 2)), CAST(2.40 AS Decimal(8, 2)), CAST(2.10 AS Decimal(8, 2)), 18620, 3654365075, CAST(2.00 AS Decimal(8, 2)), NULL, 118, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (831, CAST(N'2019-04-23' AS Date), CAST(1.70 AS Decimal(8, 2)), CAST(2.20 AS Decimal(8, 2)), CAST(2.20 AS Decimal(8, 2)), CAST(1.70 AS Decimal(8, 2)), 12165, 2399780400, CAST(1.00 AS Decimal(8, 2)), NULL, 117, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (830, CAST(N'2019-04-24' AS Date), CAST(1.20 AS Decimal(8, 2)), CAST(1.50 AS Decimal(8, 2)), CAST(1.50 AS Decimal(8, 2)), CAST(1.00 AS Decimal(8, 2)), 21120, 4186195700, CAST(1.00 AS Decimal(8, 2)), NULL, 141, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (829, CAST(N'2019-04-25' AS Date), CAST(1.50 AS Decimal(8, 2)), CAST(1.40 AS Decimal(8, 2)), CAST(1.50 AS Decimal(8, 2)), CAST(1.30 AS Decimal(8, 2)), 13540, 2690354575, CAST(1.00 AS Decimal(8, 2)), NULL, 95, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (828, CAST(N'2019-04-26' AS Date), CAST(0.80 AS Decimal(8, 2)), CAST(0.60 AS Decimal(8, 2)), CAST(0.90 AS Decimal(8, 2)), CAST(0.60 AS Decimal(8, 2)), 12425, 2445255625, CAST(0.00 AS Decimal(8, 2)), NULL, 62, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (827, CAST(N'2019-04-29' AS Date), CAST(10.60 AS Decimal(8, 2)), CAST(10.70 AS Decimal(8, 2)), CAST(10.70 AS Decimal(8, 2)), CAST(10.60 AS Decimal(8, 2)), 2585, 510151350, CAST(10.00 AS Decimal(8, 2)), NULL, 21, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (826, CAST(N'2019-04-30' AS Date), CAST(10.00 AS Decimal(8, 2)), CAST(10.00 AS Decimal(8, 2)), CAST(10.40 AS Decimal(8, 2)), CAST(9.80 AS Decimal(8, 2)), 13995, 2767763050, CAST(10.00 AS Decimal(8, 2)), NULL, 46, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (825, CAST(N'2019-05-02' AS Date), CAST(10.00 AS Decimal(8, 2)), CAST(9.90 AS Decimal(8, 2)), CAST(10.50 AS Decimal(8, 2)), CAST(9.80 AS Decimal(8, 2)), 32340, 6427846675, CAST(10.00 AS Decimal(8, 2)), NULL, 119, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (824, CAST(N'2019-05-03' AS Date), CAST(9.70 AS Decimal(8, 2)), CAST(9.70 AS Decimal(8, 2)), CAST(9.80 AS Decimal(8, 2)), CAST(9.50 AS Decimal(8, 2)), 8160, 1610967800, CAST(9.00 AS Decimal(8, 2)), NULL, 99, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (823, CAST(N'2019-05-06' AS Date), CAST(9.30 AS Decimal(8, 2)), CAST(9.20 AS Decimal(8, 2)), CAST(9.40 AS Decimal(8, 2)), CAST(9.00 AS Decimal(8, 2)), 18625, 3698544500, CAST(9.00 AS Decimal(8, 2)), NULL, 91, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (822, CAST(N'2019-05-07' AS Date), CAST(8.80 AS Decimal(8, 2)), CAST(8.50 AS Decimal(8, 2)), CAST(8.80 AS Decimal(8, 2)), CAST(8.50 AS Decimal(8, 2)), 16115, 3220297100, CAST(8.00 AS Decimal(8, 2)), NULL, 93, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (821, CAST(N'2019-05-08' AS Date), CAST(8.20 AS Decimal(8, 2)), CAST(8.10 AS Decimal(8, 2)), CAST(8.40 AS Decimal(8, 2)), CAST(8.10 AS Decimal(8, 2)), 16530, 3258571175, CAST(8.00 AS Decimal(8, 2)), NULL, 133, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (820, CAST(N'2019-05-09' AS Date), CAST(8.10 AS Decimal(8, 2)), CAST(8.40 AS Decimal(8, 2)), CAST(8.40 AS Decimal(8, 2)), CAST(7.90 AS Decimal(8, 2)), 13530, 2689329500, CAST(8.00 AS Decimal(8, 2)), NULL, 88, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (819, CAST(N'2019-05-10' AS Date), CAST(7.20 AS Decimal(8, 2)), CAST(7.10 AS Decimal(8, 2)), CAST(7.20 AS Decimal(8, 2)), CAST(7.00 AS Decimal(8, 2)), 14270, 2828977350, CAST(7.00 AS Decimal(8, 2)), NULL, 95, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (818, CAST(N'2019-05-13' AS Date), CAST(6.80 AS Decimal(8, 2)), CAST(6.80 AS Decimal(8, 2)), CAST(6.80 AS Decimal(8, 2)), CAST(6.50 AS Decimal(8, 2)), 10965, 2190661100, CAST(6.00 AS Decimal(8, 2)), NULL, 80, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (817, CAST(N'2019-05-14' AS Date), CAST(6.50 AS Decimal(8, 2)), CAST(6.40 AS Decimal(8, 2)), CAST(6.70 AS Decimal(8, 2)), CAST(6.30 AS Decimal(8, 2)), 25165, 5014498425, CAST(6.00 AS Decimal(8, 2)), NULL, 204, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (816, CAST(N'2019-05-15' AS Date), CAST(5.90 AS Decimal(8, 2)), CAST(5.90 AS Decimal(8, 2)), CAST(6.30 AS Decimal(8, 2)), CAST(5.80 AS Decimal(8, 2)), 11785, 2362346550, CAST(5.00 AS Decimal(8, 2)), NULL, 97, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (815, CAST(N'2019-05-16' AS Date), CAST(6.10 AS Decimal(8, 2)), CAST(6.10 AS Decimal(8, 2)), CAST(6.20 AS Decimal(8, 2)), CAST(6.00 AS Decimal(8, 2)), 9360, 1881330875, CAST(6.00 AS Decimal(8, 2)), NULL, 78, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (814, CAST(N'2019-05-17' AS Date), CAST(5.50 AS Decimal(8, 2)), CAST(5.80 AS Decimal(8, 2)), CAST(5.80 AS Decimal(8, 2)), CAST(5.50 AS Decimal(8, 2)), 13090, 2676901850, CAST(5.00 AS Decimal(8, 2)), NULL, 107, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (813, CAST(N'2019-05-20' AS Date), CAST(5.60 AS Decimal(8, 2)), CAST(5.10 AS Decimal(8, 2)), CAST(5.80 AS Decimal(8, 2)), CAST(5.10 AS Decimal(8, 2)), 15840, 3256050850, CAST(5.00 AS Decimal(8, 2)), NULL, 101, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (812, CAST(N'2019-05-21' AS Date), CAST(4.30 AS Decimal(8, 2)), CAST(4.50 AS Decimal(8, 2)), CAST(4.50 AS Decimal(8, 2)), CAST(4.20 AS Decimal(8, 2)), 9170, 1873155325, CAST(4.00 AS Decimal(8, 2)), NULL, 83, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (811, CAST(N'2019-05-22' AS Date), CAST(3.20 AS Decimal(8, 2)), CAST(3.20 AS Decimal(8, 2)), CAST(3.30 AS Decimal(8, 2)), CAST(2.90 AS Decimal(8, 2)), 25775, 5188389400, CAST(3.00 AS Decimal(8, 2)), NULL, 153, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (810, CAST(N'2019-05-23' AS Date), CAST(2.20 AS Decimal(8, 2)), CAST(2.30 AS Decimal(8, 2)), CAST(2.60 AS Decimal(8, 2)), CAST(2.20 AS Decimal(8, 2)), 13130, 2661232525, CAST(2.00 AS Decimal(8, 2)), NULL, 96, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (809, CAST(N'2019-05-24' AS Date), CAST(1.90 AS Decimal(8, 2)), CAST(2.10 AS Decimal(8, 2)), CAST(2.10 AS Decimal(8, 2)), CAST(1.70 AS Decimal(8, 2)), 17115, 3452296450, CAST(2.00 AS Decimal(8, 2)), NULL, 85, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (808, CAST(N'2019-05-27' AS Date), CAST(1.90 AS Decimal(8, 2)), CAST(2.10 AS Decimal(8, 2)), CAST(2.20 AS Decimal(8, 2)), CAST(1.90 AS Decimal(8, 2)), 6290, 1265227825, CAST(1.00 AS Decimal(8, 2)), NULL, 52, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (807, CAST(N'2019-05-28' AS Date), CAST(1.30 AS Decimal(8, 2)), CAST(1.20 AS Decimal(8, 2)), CAST(1.50 AS Decimal(8, 2)), CAST(1.20 AS Decimal(8, 2)), 10865, 2188673750, CAST(1.00 AS Decimal(8, 2)), NULL, 67, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (806, CAST(N'2019-05-29' AS Date), CAST(0.50 AS Decimal(8, 2)), CAST(0.80 AS Decimal(8, 2)), CAST(0.90 AS Decimal(8, 2)), CAST(0.50 AS Decimal(8, 2)), 3220, 643549050, CAST(0.00 AS Decimal(8, 2)), NULL, 22, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (805, CAST(N'2019-05-30' AS Date), CAST(10.60 AS Decimal(8, 2)), CAST(10.50 AS Decimal(8, 2)), CAST(10.60 AS Decimal(8, 2)), CAST(10.50 AS Decimal(8, 2)), 4430, 882136750, CAST(10.00 AS Decimal(8, 2)), NULL, 12, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (804, CAST(N'2019-05-31' AS Date), CAST(9.50 AS Decimal(8, 2)), CAST(9.30 AS Decimal(8, 2)), CAST(9.50 AS Decimal(8, 2)), CAST(9.30 AS Decimal(8, 2)), 1435, 283417850, CAST(9.00 AS Decimal(8, 2)), NULL, 13, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (803, CAST(N'2019-06-03' AS Date), CAST(8.40 AS Decimal(8, 2)), CAST(8.30 AS Decimal(8, 2)), CAST(8.50 AS Decimal(8, 2)), CAST(8.20 AS Decimal(8, 2)), 10110, 1975809100, CAST(8.00 AS Decimal(8, 2)), NULL, 88, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (802, CAST(N'2019-06-04' AS Date), CAST(7.30 AS Decimal(8, 2)), CAST(7.20 AS Decimal(8, 2)), CAST(7.50 AS Decimal(8, 2)), CAST(7.00 AS Decimal(8, 2)), 11470, 2224184125, CAST(7.00 AS Decimal(8, 2)), NULL, 115, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (801, CAST(N'2019-06-05' AS Date), CAST(6.40 AS Decimal(8, 2)), CAST(6.30 AS Decimal(8, 2)), CAST(6.40 AS Decimal(8, 2)), CAST(5.90 AS Decimal(8, 2)), 11165, 2158926350, CAST(6.00 AS Decimal(8, 2)), NULL, 83, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (800, CAST(N'2019-06-06' AS Date), CAST(6.40 AS Decimal(8, 2)), CAST(6.40 AS Decimal(8, 2)), CAST(6.60 AS Decimal(8, 2)), CAST(6.20 AS Decimal(8, 2)), 11995, 2326417975, CAST(6.00 AS Decimal(8, 2)), NULL, 86, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (799, CAST(N'2019-06-07' AS Date), CAST(5.50 AS Decimal(8, 2)), CAST(5.50 AS Decimal(8, 2)), CAST(5.80 AS Decimal(8, 2)), CAST(5.40 AS Decimal(8, 2)), 29625, 5721508950, CAST(5.00 AS Decimal(8, 2)), NULL, 127, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (798, CAST(N'2019-06-10' AS Date), CAST(5.20 AS Decimal(8, 2)), CAST(5.20 AS Decimal(8, 2)), CAST(5.40 AS Decimal(8, 2)), CAST(5.20 AS Decimal(8, 2)), 62850, 12206139900, CAST(5.00 AS Decimal(8, 2)), NULL, 120, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (797, CAST(N'2019-06-11' AS Date), CAST(4.60 AS Decimal(8, 2)), CAST(4.40 AS Decimal(8, 2)), CAST(4.90 AS Decimal(8, 2)), CAST(4.40 AS Decimal(8, 2)), 9670, 1871689400, CAST(4.00 AS Decimal(8, 2)), NULL, 82, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (796, CAST(N'2019-06-12' AS Date), CAST(4.20 AS Decimal(8, 2)), CAST(4.30 AS Decimal(8, 2)), CAST(4.50 AS Decimal(8, 2)), CAST(4.00 AS Decimal(8, 2)), 22950, 4415466550, CAST(4.00 AS Decimal(8, 2)), NULL, 119, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (795, CAST(N'2019-06-13' AS Date), CAST(3.80 AS Decimal(8, 2)), CAST(4.30 AS Decimal(8, 2)), CAST(4.30 AS Decimal(8, 2)), CAST(3.50 AS Decimal(8, 2)), 29005, 5578650200, CAST(3.00 AS Decimal(8, 2)), NULL, 149, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (794, CAST(N'2019-06-14' AS Date), CAST(3.40 AS Decimal(8, 2)), CAST(3.50 AS Decimal(8, 2)), CAST(3.70 AS Decimal(8, 2)), CAST(3.20 AS Decimal(8, 2)), 24755, 4808287525, CAST(3.00 AS Decimal(8, 2)), NULL, 114, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (793, CAST(N'2019-06-17' AS Date), CAST(2.50 AS Decimal(8, 2)), CAST(2.60 AS Decimal(8, 2)), CAST(2.80 AS Decimal(8, 2)), CAST(2.30 AS Decimal(8, 2)), 18485, 3597226800, CAST(2.00 AS Decimal(8, 2)), NULL, 113, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (792, CAST(N'2019-06-18' AS Date), CAST(2.30 AS Decimal(8, 2)), CAST(2.40 AS Decimal(8, 2)), CAST(2.60 AS Decimal(8, 2)), CAST(2.20 AS Decimal(8, 2)), 18625, 3597545175, CAST(2.00 AS Decimal(8, 2)), NULL, 114, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (791, CAST(N'2019-06-19' AS Date), CAST(2.40 AS Decimal(8, 2)), CAST(2.10 AS Decimal(8, 2)), CAST(2.50 AS Decimal(8, 2)), CAST(2.10 AS Decimal(8, 2)), 12920, 2502972800, CAST(2.00 AS Decimal(8, 2)), NULL, 112, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (790, CAST(N'2019-06-21' AS Date), CAST(1.70 AS Decimal(8, 2)), CAST(1.90 AS Decimal(8, 2)), CAST(1.90 AS Decimal(8, 2)), CAST(1.40 AS Decimal(8, 2)), 13435, 2570855325, CAST(1.00 AS Decimal(8, 2)), NULL, 73, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (789, CAST(N'2019-06-24' AS Date), CAST(1.10 AS Decimal(8, 2)), CAST(1.00 AS Decimal(8, 2)), CAST(1.40 AS Decimal(8, 2)), CAST(0.70 AS Decimal(8, 2)), 19245, 3679956425, CAST(0.00 AS Decimal(8, 2)), NULL, 113, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (788, CAST(N'2019-06-25' AS Date), CAST(-0.50 AS Decimal(8, 2)), CAST(-0.40 AS Decimal(8, 2)), CAST(-0.30 AS Decimal(8, 2)), CAST(-1.10 AS Decimal(8, 2)), 10830, 2073700625, CAST(0.00 AS Decimal(8, 2)), NULL, 85, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (787, CAST(N'2019-06-26' AS Date), CAST(-0.90 AS Decimal(8, 2)), CAST(-1.10 AS Decimal(8, 2)), CAST(-0.40 AS Decimal(8, 2)), CAST(-1.10 AS Decimal(8, 2)), 6970, 1339414500, CAST(0.00 AS Decimal(8, 2)), NULL, 44, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (786, CAST(N'2019-06-27' AS Date), CAST(10.90 AS Decimal(8, 2)), CAST(11.10 AS Decimal(8, 2)), CAST(11.10 AS Decimal(8, 2)), CAST(10.80 AS Decimal(8, 2)), 5965, 1155752075, CAST(10.00 AS Decimal(8, 2)), NULL, 34, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (785, CAST(N'2019-06-28' AS Date), CAST(10.80 AS Decimal(8, 2)), CAST(10.20 AS Decimal(8, 2)), CAST(11.10 AS Decimal(8, 2)), CAST(9.50 AS Decimal(8, 2)), 31315, 6017207100, CAST(10.00 AS Decimal(8, 2)), NULL, 102, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (784, CAST(N'2019-07-01' AS Date), CAST(10.00 AS Decimal(8, 2)), CAST(10.20 AS Decimal(8, 2)), CAST(10.50 AS Decimal(8, 2)), CAST(9.80 AS Decimal(8, 2)), 33335, 6382865375, CAST(10.00 AS Decimal(8, 2)), NULL, 145, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (783, CAST(N'2019-07-02' AS Date), CAST(8.80 AS Decimal(8, 2)), CAST(8.50 AS Decimal(8, 2)), CAST(9.10 AS Decimal(8, 2)), CAST(8.50 AS Decimal(8, 2)), 19830, 3832258150, CAST(8.00 AS Decimal(8, 2)), NULL, 124, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (782, CAST(N'2019-07-03' AS Date), CAST(8.90 AS Decimal(8, 2)), CAST(9.20 AS Decimal(8, 2)), CAST(9.20 AS Decimal(8, 2)), CAST(8.60 AS Decimal(8, 2)), 12510, 2412029550, CAST(8.00 AS Decimal(8, 2)), NULL, 118, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (781, CAST(N'2019-07-04' AS Date), CAST(8.30 AS Decimal(8, 2)), CAST(8.00 AS Decimal(8, 2)), CAST(8.70 AS Decimal(8, 2)), CAST(7.80 AS Decimal(8, 2)), 6660, 1266147925, CAST(8.00 AS Decimal(8, 2)), NULL, 92, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (780, CAST(N'2019-07-05' AS Date), CAST(6.80 AS Decimal(8, 2)), CAST(7.10 AS Decimal(8, 2)), CAST(7.20 AS Decimal(8, 2)), CAST(6.40 AS Decimal(8, 2)), 12210, 2336382450, CAST(6.00 AS Decimal(8, 2)), NULL, 96, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (779, CAST(N'2019-07-08' AS Date), CAST(6.80 AS Decimal(8, 2)), CAST(6.90 AS Decimal(8, 2)), CAST(6.90 AS Decimal(8, 2)), CAST(6.40 AS Decimal(8, 2)), 7795, 1486168625, CAST(6.00 AS Decimal(8, 2)), NULL, 79, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (778, CAST(N'2019-07-10' AS Date), CAST(5.80 AS Decimal(8, 2)), CAST(6.40 AS Decimal(8, 2)), CAST(6.40 AS Decimal(8, 2)), CAST(5.00 AS Decimal(8, 2)), 12420, 2344487225, CAST(5.00 AS Decimal(8, 2)), NULL, 102, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (777, CAST(N'2019-07-11' AS Date), CAST(5.50 AS Decimal(8, 2)), CAST(5.90 AS Decimal(8, 2)), CAST(5.90 AS Decimal(8, 2)), CAST(5.00 AS Decimal(8, 2)), 17485, 3286123200, CAST(5.00 AS Decimal(8, 2)), NULL, 121, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (776, CAST(N'2019-07-12' AS Date), CAST(5.20 AS Decimal(8, 2)), CAST(4.80 AS Decimal(8, 2)), CAST(5.60 AS Decimal(8, 2)), CAST(4.80 AS Decimal(8, 2)), 12740, 2389084800, CAST(5.00 AS Decimal(8, 2)), NULL, 122, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (775, CAST(N'2019-07-15' AS Date), CAST(5.10 AS Decimal(8, 2)), CAST(4.90 AS Decimal(8, 2)), CAST(5.40 AS Decimal(8, 2)), CAST(4.90 AS Decimal(8, 2)), 19425, 3643516600, CAST(5.00 AS Decimal(8, 2)), NULL, 94, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (774, CAST(N'2019-07-16' AS Date), CAST(4.90 AS Decimal(8, 2)), CAST(4.70 AS Decimal(8, 2)), CAST(5.40 AS Decimal(8, 2)), CAST(4.60 AS Decimal(8, 2)), 14270, 2687864025, CAST(4.00 AS Decimal(8, 2)), NULL, 115, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (773, CAST(N'2019-07-17' AS Date), CAST(3.90 AS Decimal(8, 2)), CAST(4.00 AS Decimal(8, 2)), CAST(4.00 AS Decimal(8, 2)), CAST(3.40 AS Decimal(8, 2)), 9545, 1797163925, CAST(3.00 AS Decimal(8, 2)), NULL, 102, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (772, CAST(N'2019-07-18' AS Date), CAST(3.60 AS Decimal(8, 2)), CAST(3.50 AS Decimal(8, 2)), CAST(3.80 AS Decimal(8, 2)), CAST(3.40 AS Decimal(8, 2)), 30695, 5759102925, CAST(3.00 AS Decimal(8, 2)), NULL, 141, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (771, CAST(N'2019-07-19' AS Date), CAST(2.80 AS Decimal(8, 2)), CAST(3.00 AS Decimal(8, 2)), CAST(3.00 AS Decimal(8, 2)), CAST(2.20 AS Decimal(8, 2)), 8585, 1606832950, CAST(2.00 AS Decimal(8, 2)), NULL, 78, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (770, CAST(N'2019-07-22' AS Date), CAST(2.10 AS Decimal(8, 2)), CAST(2.20 AS Decimal(8, 2)), CAST(2.20 AS Decimal(8, 2)), CAST(2.00 AS Decimal(8, 2)), 8145, 1523951000, CAST(2.00 AS Decimal(8, 2)), NULL, 75, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (769, CAST(N'2019-07-23' AS Date), CAST(1.80 AS Decimal(8, 2)), CAST(2.30 AS Decimal(8, 2)), CAST(2.30 AS Decimal(8, 2)), CAST(1.80 AS Decimal(8, 2)), 9725, 1830265200, CAST(1.00 AS Decimal(8, 2)), NULL, 79, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (768, CAST(N'2019-07-24' AS Date), CAST(1.10 AS Decimal(8, 2)), CAST(1.00 AS Decimal(8, 2)), CAST(1.20 AS Decimal(8, 2)), CAST(0.60 AS Decimal(8, 2)), 19410, 3649582825, CAST(0.00 AS Decimal(8, 2)), NULL, 110, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (767, CAST(N'2019-07-25' AS Date), CAST(1.20 AS Decimal(8, 2)), CAST(1.30 AS Decimal(8, 2)), CAST(1.30 AS Decimal(8, 2)), CAST(0.80 AS Decimal(8, 2)), 13600, 2574463050, CAST(1.00 AS Decimal(8, 2)), NULL, 124, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (766, CAST(N'2019-07-26' AS Date), CAST(0.70 AS Decimal(8, 2)), CAST(0.90 AS Decimal(8, 2)), CAST(0.90 AS Decimal(8, 2)), CAST(0.30 AS Decimal(8, 2)), 8710, 1643896875, CAST(0.00 AS Decimal(8, 2)), NULL, 80, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (765, CAST(N'2019-07-29' AS Date), CAST(0.30 AS Decimal(8, 2)), CAST(0.20 AS Decimal(8, 2)), CAST(0.40 AS Decimal(8, 2)), CAST(0.20 AS Decimal(8, 2)), 133, 4131498625, CAST(0.00 AS Decimal(8, 2)), NULL, 21795, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (764, CAST(N'2019-07-30' AS Date), CAST(8.30 AS Decimal(8, 2)), CAST(8.70 AS Decimal(8, 2)), CAST(8.70 AS Decimal(8, 2)), CAST(7.70 AS Decimal(8, 2)), 3865, 733994500, CAST(8.00 AS Decimal(8, 2)), NULL, 29, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (763, CAST(N'2019-07-31' AS Date), CAST(8.10 AS Decimal(8, 2)), CAST(8.30 AS Decimal(8, 2)), CAST(8.40 AS Decimal(8, 2)), CAST(8.10 AS Decimal(8, 2)), 5120, 965894225, CAST(8.00 AS Decimal(8, 2)), NULL, 9, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (762, CAST(N'2019-08-01' AS Date), CAST(8.30 AS Decimal(8, 2)), CAST(8.20 AS Decimal(8, 2)), CAST(8.50 AS Decimal(8, 2)), CAST(8.10 AS Decimal(8, 2)), 15775, 3027122025, CAST(8.00 AS Decimal(8, 2)), NULL, 91, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (761, CAST(N'2019-08-02' AS Date), CAST(8.10 AS Decimal(8, 2)), CAST(8.30 AS Decimal(8, 2)), CAST(8.40 AS Decimal(8, 2)), CAST(8.00 AS Decimal(8, 2)), 12120, 2352507250, CAST(8.00 AS Decimal(8, 2)), NULL, 91, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (760, CAST(N'2019-08-05' AS Date), CAST(8.30 AS Decimal(8, 2)), CAST(8.30 AS Decimal(8, 2)), CAST(8.30 AS Decimal(8, 2)), CAST(7.60 AS Decimal(8, 2)), 24160, 4769663100, CAST(7.00 AS Decimal(8, 2)), NULL, 114, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (759, CAST(N'2019-08-06' AS Date), CAST(7.50 AS Decimal(8, 2)), CAST(7.50 AS Decimal(8, 2)), CAST(7.60 AS Decimal(8, 2)), CAST(7.10 AS Decimal(8, 2)), 7215, 1432804150, CAST(7.00 AS Decimal(8, 2)), NULL, 76, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (758, CAST(N'2019-08-07' AS Date), CAST(7.10 AS Decimal(8, 2)), CAST(7.00 AS Decimal(8, 2)), CAST(7.20 AS Decimal(8, 2)), CAST(7.00 AS Decimal(8, 2)), 9655, 1927192425, CAST(7.00 AS Decimal(8, 2)), NULL, 110, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (757, CAST(N'2019-08-08' AS Date), CAST(7.50 AS Decimal(8, 2)), CAST(7.70 AS Decimal(8, 2)), CAST(7.90 AS Decimal(8, 2)), CAST(7.40 AS Decimal(8, 2)), 10110, 1995987225, CAST(7.00 AS Decimal(8, 2)), NULL, 86, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (756, CAST(N'2019-08-09' AS Date), CAST(7.00 AS Decimal(8, 2)), CAST(7.00 AS Decimal(8, 2)), CAST(7.50 AS Decimal(8, 2)), CAST(6.90 AS Decimal(8, 2)), 12060, 2377877100, CAST(7.00 AS Decimal(8, 2)), NULL, 101, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (755, CAST(N'2019-08-12' AS Date), CAST(6.80 AS Decimal(8, 2)), CAST(7.00 AS Decimal(8, 2)), CAST(7.00 AS Decimal(8, 2)), CAST(6.70 AS Decimal(8, 2)), 8125, 1626389450, CAST(6.00 AS Decimal(8, 2)), NULL, 83, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (754, CAST(N'2019-08-13' AS Date), CAST(6.30 AS Decimal(8, 2)), CAST(6.40 AS Decimal(8, 2)), CAST(6.40 AS Decimal(8, 2)), CAST(6.10 AS Decimal(8, 2)), 12805, 2548096500, CAST(6.00 AS Decimal(8, 2)), NULL, 106, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (753, CAST(N'2019-08-14' AS Date), CAST(5.00 AS Decimal(8, 2)), CAST(5.10 AS Decimal(8, 2)), CAST(5.10 AS Decimal(8, 2)), CAST(4.50 AS Decimal(8, 2)), 15945, 3198786650, CAST(4.00 AS Decimal(8, 2)), NULL, 176, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (752, CAST(N'2019-08-15' AS Date), CAST(6.00 AS Decimal(8, 2)), CAST(6.10 AS Decimal(8, 2)), CAST(6.30 AS Decimal(8, 2)), CAST(5.60 AS Decimal(8, 2)), 15385, 3096074625, CAST(5.00 AS Decimal(8, 2)), NULL, 130, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (751, CAST(N'2019-08-16' AS Date), CAST(4.70 AS Decimal(8, 2)), CAST(4.70 AS Decimal(8, 2)), CAST(4.70 AS Decimal(8, 2)), CAST(4.40 AS Decimal(8, 2)), 5555, 1110414775, CAST(4.00 AS Decimal(8, 2)), NULL, 69, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (750, CAST(N'2019-08-19' AS Date), CAST(4.30 AS Decimal(8, 2)), CAST(3.90 AS Decimal(8, 2)), CAST(4.70 AS Decimal(8, 2)), CAST(3.90 AS Decimal(8, 2)), 16925, 3411836975, CAST(4.00 AS Decimal(8, 2)), NULL, 122, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (749, CAST(N'2019-08-20' AS Date), CAST(3.50 AS Decimal(8, 2)), CAST(3.40 AS Decimal(8, 2)), CAST(3.50 AS Decimal(8, 2)), CAST(3.20 AS Decimal(8, 2)), 20605, 4168314300, CAST(3.00 AS Decimal(8, 2)), NULL, 115, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (748, CAST(N'2019-08-21' AS Date), CAST(2.70 AS Decimal(8, 2)), CAST(2.70 AS Decimal(8, 2)), CAST(2.90 AS Decimal(8, 2)), CAST(2.50 AS Decimal(8, 2)), 13075, 2633384850, CAST(2.00 AS Decimal(8, 2)), NULL, 104, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (747, CAST(N'2019-08-22' AS Date), CAST(2.50 AS Decimal(8, 2)), CAST(2.70 AS Decimal(8, 2)), CAST(2.70 AS Decimal(8, 2)), CAST(2.20 AS Decimal(8, 2)), 28235, 5713172025, CAST(2.00 AS Decimal(8, 2)), NULL, 112, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (746, CAST(N'2019-08-23' AS Date), CAST(1.70 AS Decimal(8, 2)), CAST(1.50 AS Decimal(8, 2)), CAST(2.30 AS Decimal(8, 2)), CAST(1.50 AS Decimal(8, 2)), 18635, 3807943650, CAST(1.00 AS Decimal(8, 2)), NULL, 132, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (745, CAST(N'2019-08-26' AS Date), CAST(0.80 AS Decimal(8, 2)), CAST(0.30 AS Decimal(8, 2)), CAST(1.00 AS Decimal(8, 2)), CAST(0.30 AS Decimal(8, 2)), 11545, 2388361125, CAST(0.00 AS Decimal(8, 2)), NULL, 105, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (744, CAST(N'2019-08-27' AS Date), CAST(-0.10 AS Decimal(8, 2)), CAST(-0.10 AS Decimal(8, 2)), CAST(-0.10 AS Decimal(8, 2)), CAST(-0.20 AS Decimal(8, 2)), 1440, 299200425, CAST(0.00 AS Decimal(8, 2)), NULL, 19, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (743, CAST(N'2019-08-28' AS Date), CAST(0.60 AS Decimal(8, 2)), CAST(0.70 AS Decimal(8, 2)), CAST(0.70 AS Decimal(8, 2)), CAST(0.60 AS Decimal(8, 2)), 870, 180808600, CAST(0.00 AS Decimal(8, 2)), NULL, 4, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (742, CAST(N'2019-08-29' AS Date), CAST(8.90 AS Decimal(8, 2)), CAST(9.20 AS Decimal(8, 2)), CAST(9.20 AS Decimal(8, 2)), CAST(8.00 AS Decimal(8, 2)), 4765, 995166000, CAST(8.00 AS Decimal(8, 2)), NULL, 25, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (741, CAST(N'2019-08-30' AS Date), CAST(7.50 AS Decimal(8, 2)), CAST(7.50 AS Decimal(8, 2)), CAST(7.60 AS Decimal(8, 2)), CAST(7.10 AS Decimal(8, 2)), 6945, 1439669275, CAST(7.00 AS Decimal(8, 2)), NULL, 37, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (740, CAST(N'2019-09-02' AS Date), CAST(7.20 AS Decimal(8, 2)), CAST(7.10 AS Decimal(8, 2)), CAST(7.20 AS Decimal(8, 2)), CAST(6.60 AS Decimal(8, 2)), 7205, 1500505425, CAST(7.00 AS Decimal(8, 2)), NULL, 75, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (739, CAST(N'2019-09-03' AS Date), CAST(6.40 AS Decimal(8, 2)), CAST(6.50 AS Decimal(8, 2)), CAST(6.80 AS Decimal(8, 2)), CAST(6.30 AS Decimal(8, 2)), 9230, 1925473275, CAST(6.00 AS Decimal(8, 2)), NULL, 72, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (738, CAST(N'2019-09-04' AS Date), CAST(6.40 AS Decimal(8, 2)), CAST(6.30 AS Decimal(8, 2)), CAST(6.60 AS Decimal(8, 2)), CAST(6.20 AS Decimal(8, 2)), 14235, 2940500475, CAST(6.00 AS Decimal(8, 2)), NULL, 107, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (737, CAST(N'2019-09-05' AS Date), CAST(6.30 AS Decimal(8, 2)), CAST(6.90 AS Decimal(8, 2)), CAST(6.90 AS Decimal(8, 2)), CAST(6.20 AS Decimal(8, 2)), 13140, 2688615975, CAST(6.00 AS Decimal(8, 2)), NULL, 104, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (736, CAST(N'2019-09-06' AS Date), CAST(5.70 AS Decimal(8, 2)), CAST(5.60 AS Decimal(8, 2)), CAST(5.90 AS Decimal(8, 2)), CAST(5.40 AS Decimal(8, 2)), 17425, 3546510475, CAST(5.00 AS Decimal(8, 2)), NULL, 104, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (735, CAST(N'2019-09-09' AS Date), CAST(5.20 AS Decimal(8, 2)), CAST(5.20 AS Decimal(8, 2)), CAST(5.70 AS Decimal(8, 2)), CAST(5.10 AS Decimal(8, 2)), 18535, 3782961875, CAST(5.00 AS Decimal(8, 2)), NULL, 151, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (734, CAST(N'2019-09-10' AS Date), CAST(5.10 AS Decimal(8, 2)), CAST(5.40 AS Decimal(8, 2)), CAST(5.50 AS Decimal(8, 2)), CAST(5.00 AS Decimal(8, 2)), 12820, 2638319500, CAST(5.00 AS Decimal(8, 2)), NULL, 92, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (733, CAST(N'2019-09-11' AS Date), CAST(4.70 AS Decimal(8, 2)), CAST(5.00 AS Decimal(8, 2)), CAST(5.00 AS Decimal(8, 2)), CAST(4.40 AS Decimal(8, 2)), 16610, 3378242175, CAST(4.00 AS Decimal(8, 2)), NULL, 99, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (732, CAST(N'2019-09-12' AS Date), CAST(4.50 AS Decimal(8, 2)), CAST(5.30 AS Decimal(8, 2)), CAST(5.30 AS Decimal(8, 2)), CAST(4.40 AS Decimal(8, 2)), 15640, 3170183675, CAST(4.00 AS Decimal(8, 2)), NULL, 107, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (731, CAST(N'2019-09-13' AS Date), CAST(3.70 AS Decimal(8, 2)), CAST(3.70 AS Decimal(8, 2)), CAST(4.00 AS Decimal(8, 2)), CAST(3.50 AS Decimal(8, 2)), 32865, 6680374900, CAST(3.00 AS Decimal(8, 2)), NULL, 164, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (730, CAST(N'2019-09-16' AS Date), CAST(2.80 AS Decimal(8, 2)), CAST(3.00 AS Decimal(8, 2)), CAST(3.00 AS Decimal(8, 2)), CAST(2.50 AS Decimal(8, 2)), 20300, 4151322825, CAST(2.00 AS Decimal(8, 2)), NULL, 116, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (729, CAST(N'2019-09-17' AS Date), CAST(2.00 AS Decimal(8, 2)), CAST(1.90 AS Decimal(8, 2)), CAST(2.50 AS Decimal(8, 2)), CAST(1.50 AS Decimal(8, 2)), 19705, 4041155200, CAST(1.00 AS Decimal(8, 2)), NULL, 140, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (728, CAST(N'2019-09-18' AS Date), CAST(1.70 AS Decimal(8, 2)), CAST(2.00 AS Decimal(8, 2)), CAST(2.00 AS Decimal(8, 2)), CAST(1.50 AS Decimal(8, 2)), 21300, 4365336875, CAST(1.00 AS Decimal(8, 2)), NULL, 113, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (727, CAST(N'2019-09-19' AS Date), CAST(2.30 AS Decimal(8, 2)), CAST(2.30 AS Decimal(8, 2)), CAST(2.50 AS Decimal(8, 2)), CAST(1.90 AS Decimal(8, 2)), 38340, 7939374425, CAST(2.00 AS Decimal(8, 2)), NULL, 175, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (726, CAST(N'2019-09-20' AS Date), CAST(1.60 AS Decimal(8, 2)), CAST(1.20 AS Decimal(8, 2)), CAST(1.60 AS Decimal(8, 2)), CAST(1.20 AS Decimal(8, 2)), 19940, 4157659900, CAST(1.00 AS Decimal(8, 2)), NULL, 140, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (725, CAST(N'2019-09-23' AS Date), CAST(1.70 AS Decimal(8, 2)), CAST(1.80 AS Decimal(8, 2)), CAST(2.00 AS Decimal(8, 2)), CAST(1.50 AS Decimal(8, 2)), 20355, 4249221475, CAST(1.00 AS Decimal(8, 2)), NULL, 120, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (724, CAST(N'2019-09-24' AS Date), CAST(1.30 AS Decimal(8, 2)), CAST(2.00 AS Decimal(8, 2)), CAST(2.00 AS Decimal(8, 2)), CAST(1.20 AS Decimal(8, 2)), 19090, 3983529475, CAST(1.00 AS Decimal(8, 2)), NULL, 109, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (723, CAST(N'2019-09-25' AS Date), CAST(0.20 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), CAST(0.30 AS Decimal(8, 2)), CAST(-0.10 AS Decimal(8, 2)), 13770, 2879879200, CAST(0.00 AS Decimal(8, 2)), NULL, 110, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (722, CAST(N'2019-09-26' AS Date), CAST(0.40 AS Decimal(8, 2)), CAST(0.20 AS Decimal(8, 2)), CAST(0.40 AS Decimal(8, 2)), CAST(-0.20 AS Decimal(8, 2)), 29650, 6148008850, CAST(0.00 AS Decimal(8, 2)), NULL, 165, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (721, CAST(N'2019-09-27' AS Date), CAST(8.00 AS Decimal(8, 2)), CAST(7.80 AS Decimal(8, 2)), CAST(8.00 AS Decimal(8, 2)), CAST(7.50 AS Decimal(8, 2)), 30790, 6414128850, CAST(7.00 AS Decimal(8, 2)), NULL, 178, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (720, CAST(N'2019-09-30' AS Date), CAST(8.20 AS Decimal(8, 2)), CAST(8.20 AS Decimal(8, 2)), CAST(9.00 AS Decimal(8, 2)), CAST(7.90 AS Decimal(8, 2)), 51975, 10843770100, CAST(8.00 AS Decimal(8, 2)), NULL, 209, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (719, CAST(N'2019-10-01' AS Date), CAST(8.30 AS Decimal(8, 2)), CAST(8.20 AS Decimal(8, 2)), CAST(8.60 AS Decimal(8, 2)), CAST(8.20 AS Decimal(8, 2)), 20115, 4206464200, CAST(8.00 AS Decimal(8, 2)), NULL, 125, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (718, CAST(N'2019-10-02' AS Date), CAST(8.10 AS Decimal(8, 2)), CAST(8.50 AS Decimal(8, 2)), CAST(8.50 AS Decimal(8, 2)), CAST(8.00 AS Decimal(8, 2)), 24345, 5067019850, CAST(8.00 AS Decimal(8, 2)), NULL, 115, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (717, CAST(N'2019-10-03' AS Date), CAST(8.00 AS Decimal(8, 2)), CAST(8.10 AS Decimal(8, 2)), CAST(8.10 AS Decimal(8, 2)), CAST(7.80 AS Decimal(8, 2)), 27665, 5684019325, CAST(7.00 AS Decimal(8, 2)), NULL, 140, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (716, CAST(N'2019-10-04' AS Date), CAST(7.70 AS Decimal(8, 2)), CAST(7.40 AS Decimal(8, 2)), CAST(8.20 AS Decimal(8, 2)), CAST(7.40 AS Decimal(8, 2)), 18700, 3804244700, CAST(7.00 AS Decimal(8, 2)), NULL, 122, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (715, CAST(N'2019-10-07' AS Date), CAST(6.60 AS Decimal(8, 2)), CAST(7.00 AS Decimal(8, 2)), CAST(7.00 AS Decimal(8, 2)), CAST(6.50 AS Decimal(8, 2)), 33045, 6733712700, CAST(6.00 AS Decimal(8, 2)), NULL, 131, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (714, CAST(N'2019-10-08' AS Date), CAST(6.40 AS Decimal(8, 2)), CAST(6.30 AS Decimal(8, 2)), CAST(6.50 AS Decimal(8, 2)), CAST(5.90 AS Decimal(8, 2)), 30070, 6153893375, CAST(6.00 AS Decimal(8, 2)), NULL, 117, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (713, CAST(N'2019-10-09' AS Date), CAST(5.60 AS Decimal(8, 2)), CAST(5.90 AS Decimal(8, 2)), CAST(5.90 AS Decimal(8, 2)), CAST(5.50 AS Decimal(8, 2)), 15720, 3223456275, CAST(5.00 AS Decimal(8, 2)), NULL, 85, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (712, CAST(N'2019-10-10' AS Date), CAST(5.40 AS Decimal(8, 2)), CAST(5.50 AS Decimal(8, 2)), CAST(5.50 AS Decimal(8, 2)), CAST(5.20 AS Decimal(8, 2)), 26180, 5392890300, CAST(5.00 AS Decimal(8, 2)), NULL, 122, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (711, CAST(N'2019-10-11' AS Date), CAST(5.20 AS Decimal(8, 2)), CAST(5.40 AS Decimal(8, 2)), CAST(5.40 AS Decimal(8, 2)), CAST(5.10 AS Decimal(8, 2)), 20100, 4131792525, CAST(5.00 AS Decimal(8, 2)), NULL, 105, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (710, CAST(N'2019-10-14' AS Date), CAST(4.80 AS Decimal(8, 2)), CAST(4.90 AS Decimal(8, 2)), CAST(5.40 AS Decimal(8, 2)), CAST(4.80 AS Decimal(8, 2)), 22355, 4617853350, CAST(5.00 AS Decimal(8, 2)), NULL, 184, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (709, CAST(N'2019-10-15' AS Date), CAST(4.80 AS Decimal(8, 2)), CAST(5.10 AS Decimal(8, 2)), CAST(5.10 AS Decimal(8, 2)), CAST(4.80 AS Decimal(8, 2)), 13945, 2896135250, CAST(4.00 AS Decimal(8, 2)), NULL, 108, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (708, CAST(N'2019-10-16' AS Date), CAST(4.60 AS Decimal(8, 2)), CAST(4.80 AS Decimal(8, 2)), CAST(4.80 AS Decimal(8, 2)), CAST(4.50 AS Decimal(8, 2)), 22395, 4676139975, CAST(4.00 AS Decimal(8, 2)), NULL, 104, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (707, CAST(N'2019-10-17' AS Date), CAST(4.50 AS Decimal(8, 2)), CAST(4.60 AS Decimal(8, 2)), CAST(5.00 AS Decimal(8, 2)), CAST(4.40 AS Decimal(8, 2)), 14015, 2908337825, CAST(4.00 AS Decimal(8, 2)), NULL, 107, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (706, CAST(N'2019-10-18' AS Date), CAST(4.00 AS Decimal(8, 2)), CAST(4.20 AS Decimal(8, 2)), CAST(4.20 AS Decimal(8, 2)), CAST(3.90 AS Decimal(8, 2)), 22310, 4620053275, CAST(4.00 AS Decimal(8, 2)), NULL, 124, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (705, CAST(N'2019-10-21' AS Date), CAST(3.50 AS Decimal(8, 2)), CAST(3.60 AS Decimal(8, 2)), CAST(3.60 AS Decimal(8, 2)), CAST(3.10 AS Decimal(8, 2)), 17695, 3658761275, CAST(3.00 AS Decimal(8, 2)), NULL, 90, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (704, CAST(N'2019-10-22' AS Date), CAST(3.20 AS Decimal(8, 2)), CAST(3.00 AS Decimal(8, 2)), CAST(3.40 AS Decimal(8, 2)), CAST(3.00 AS Decimal(8, 2)), 30650, 6266361975, CAST(3.00 AS Decimal(8, 2)), NULL, 119, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (703, CAST(N'2019-10-23' AS Date), CAST(2.20 AS Decimal(8, 2)), CAST(2.10 AS Decimal(8, 2)), CAST(2.40 AS Decimal(8, 2)), CAST(1.80 AS Decimal(8, 2)), 21595, 4399080950, CAST(2.00 AS Decimal(8, 2)), NULL, 116, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (702, CAST(N'2019-10-24' AS Date), CAST(2.00 AS Decimal(8, 2)), CAST(2.00 AS Decimal(8, 2)), CAST(2.00 AS Decimal(8, 2)), CAST(1.50 AS Decimal(8, 2)), 12850, 2576850850, CAST(1.00 AS Decimal(8, 2)), NULL, 86, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (701, CAST(N'2019-10-25' AS Date), CAST(1.30 AS Decimal(8, 2)), CAST(1.40 AS Decimal(8, 2)), CAST(1.40 AS Decimal(8, 2)), CAST(1.10 AS Decimal(8, 2)), 14695, 2949684750, CAST(1.00 AS Decimal(8, 2)), NULL, 96, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (700, CAST(N'2019-10-28' AS Date), CAST(0.60 AS Decimal(8, 2)), CAST(0.90 AS Decimal(8, 2)), CAST(1.00 AS Decimal(8, 2)), CAST(0.40 AS Decimal(8, 2)), 29795, 5929149625, CAST(0.00 AS Decimal(8, 2)), NULL, 111, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (699, CAST(N'2019-10-29' AS Date), CAST(0.20 AS Decimal(8, 2)), CAST(0.10 AS Decimal(8, 2)), CAST(0.70 AS Decimal(8, 2)), CAST(0.10 AS Decimal(8, 2)), 8995, 1796721875, CAST(0.00 AS Decimal(8, 2)), NULL, 64, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (698, CAST(N'2019-10-30' AS Date), CAST(7.80 AS Decimal(8, 2)), CAST(7.40 AS Decimal(8, 2)), CAST(8.00 AS Decimal(8, 2)), CAST(7.40 AS Decimal(8, 2)), 13190, 2639506375, CAST(7.00 AS Decimal(8, 2)), NULL, 109, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (697, CAST(N'2019-10-31' AS Date), CAST(7.70 AS Decimal(8, 2)), CAST(7.70 AS Decimal(8, 2)), CAST(8.00 AS Decimal(8, 2)), CAST(7.70 AS Decimal(8, 2)), 4110, 824455075, CAST(7.00 AS Decimal(8, 2)), NULL, 24, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (696, CAST(N'2019-11-01' AS Date), CAST(6.50 AS Decimal(8, 2)), CAST(6.80 AS Decimal(8, 2)), CAST(7.20 AS Decimal(8, 2)), CAST(6.30 AS Decimal(8, 2)), 15590, 3106444800, CAST(6.00 AS Decimal(8, 2)), NULL, 106, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1408, CAST(N'2019-11-04' AS Date), CAST(5.80 AS Decimal(8, 2)), CAST(6.20 AS Decimal(8, 2)), CAST(6.20 AS Decimal(8, 2)), CAST(5.70 AS Decimal(8, 2)), 10825, 2163972025, CAST(5.90 AS Decimal(8, 2)), NULL, 91, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1409, CAST(N'2019-11-05' AS Date), CAST(5.50 AS Decimal(8, 2)), CAST(5.90 AS Decimal(8, 2)), CAST(6.10 AS Decimal(8, 2)), CAST(5.50 AS Decimal(8, 2)), 27615, 5536866875, CAST(5.74 AS Decimal(8, 2)), NULL, 125, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1410, CAST(N'2019-11-06' AS Date), CAST(6.10 AS Decimal(8, 2)), CAST(6.20 AS Decimal(8, 2)), CAST(6.40 AS Decimal(8, 2)), CAST(5.90 AS Decimal(8, 2)), 11515, 2326735875, CAST(6.12 AS Decimal(8, 2)), NULL, 98, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1411, CAST(N'2019-11-07' AS Date), CAST(5.40 AS Decimal(8, 2)), CAST(6.00 AS Decimal(8, 2)), CAST(6.00 AS Decimal(8, 2)), CAST(5.20 AS Decimal(8, 2)), 19190, 3932092300, CAST(5.36 AS Decimal(8, 2)), NULL, 124, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1412, CAST(N'2019-11-08' AS Date), CAST(5.00 AS Decimal(8, 2)), CAST(5.30 AS Decimal(8, 2)), CAST(5.30 AS Decimal(8, 2)), CAST(4.90 AS Decimal(8, 2)), 16040, 3321577575, CAST(5.11 AS Decimal(8, 2)), NULL, 120, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1413, CAST(N'2019-11-11' AS Date), CAST(4.80 AS Decimal(8, 2)), CAST(4.60 AS Decimal(8, 2)), CAST(4.80 AS Decimal(8, 2)), CAST(4.30 AS Decimal(8, 2)), 7015, 1459284725, CAST(4.56 AS Decimal(8, 2)), NULL, 70, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1414, CAST(N'2019-11-12' AS Date), CAST(4.80 AS Decimal(8, 2)), CAST(4.90 AS Decimal(8, 2)), CAST(4.90 AS Decimal(8, 2)), CAST(4.60 AS Decimal(8, 2)), 20395, 4262937225, CAST(4.77 AS Decimal(8, 2)), NULL, 140, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1415, CAST(N'2019-11-13' AS Date), CAST(4.50 AS Decimal(8, 2)), CAST(4.70 AS Decimal(8, 2)), CAST(4.70 AS Decimal(8, 2)), CAST(4.10 AS Decimal(8, 2)), 44030, 9204810350, CAST(4.45 AS Decimal(8, 2)), NULL, 207, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1416, CAST(N'2019-11-14' AS Date), CAST(4.00 AS Decimal(8, 2)), CAST(4.10 AS Decimal(8, 2)), CAST(4.50 AS Decimal(8, 2)), CAST(4.00 AS Decimal(8, 2)), 26295, 5505334850, CAST(4.26 AS Decimal(8, 2)), NULL, 130, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (2388, CAST(N'2019-11-18' AS Date), CAST(3.50 AS Decimal(8, 2)), CAST(3.70 AS Decimal(8, 2)), CAST(3.70 AS Decimal(8, 2)), CAST(3.40 AS Decimal(8, 2)), 12240, 2561981450, CAST(3.54 AS Decimal(8, 2)), NULL, 107, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (2390, CAST(N'2019-11-19' AS Date), CAST(3.20 AS Decimal(8, 2)), CAST(3.10 AS Decimal(8, 2)), CAST(3.30 AS Decimal(8, 2)), CAST(3.00 AS Decimal(8, 2)), 13955, 2938591750, CAST(3.12 AS Decimal(8, 2)), NULL, 112, N'FRP0')
GO
INSERT [dbo].[b3_closing_data] ([id], [date], [openning], [closing], [maximum], [minimum], [contracts_negociated], [volume], [average_price], [ajuste], [negociated_number], [symbol]) VALUES (1009, CAST(N'2018-07-30' AS Date), CAST(14.00 AS Decimal(8, 2)), CAST(14.00 AS Decimal(8, 2)), CAST(14.00 AS Decimal(8, 2)), CAST(14.00 AS Decimal(8, 2)), 60, 11188500, CAST(14.00 AS Decimal(8, 2)), NULL, 3, N'FRP1')
GO
SET IDENTITY_INSERT [dbo].[b3_closing_data] OFF
GO
SET IDENTITY_INSERT [dbo].[b3_significant_points] ON 
GO
INSERT [dbo].[b3_significant_points] ([id], [symbol], [start_date], [price], [position], [strength], [annotation], [user_id], [end_date]) VALUES (8, N'DOLFUT', CAST(N'2019-11-18' AS Date), CAST(4225.00 AS Decimal(8, 2)), N'Buy', N'Strong', NULL, 1, NULL)
GO
INSERT [dbo].[b3_significant_points] ([id], [symbol], [start_date], [price], [position], [strength], [annotation], [user_id], [end_date]) VALUES (9, N'DOLFUT', CAST(N'2019-11-18' AS Date), CAST(4222.50 AS Decimal(8, 2)), N'Buy', N'Medium', NULL, 1, NULL)
GO
INSERT [dbo].[b3_significant_points] ([id], [symbol], [start_date], [price], [position], [strength], [annotation], [user_id], [end_date]) VALUES (10, N'DOLFUT', CAST(N'2019-11-18' AS Date), CAST(4220.00 AS Decimal(8, 2)), N'Buy', N'Weak', NULL, 1, NULL)
GO
INSERT [dbo].[b3_significant_points] ([id], [symbol], [start_date], [price], [position], [strength], [annotation], [user_id], [end_date]) VALUES (11, N'DOLFUT', CAST(N'2019-11-19' AS Date), CAST(4224.50 AS Decimal(8, 2)), N'Buy', N'Strong', NULL, 1, CAST(N'1970-01-01' AS Date))
GO
INSERT [dbo].[b3_significant_points] ([id], [symbol], [start_date], [price], [position], [strength], [annotation], [user_id], [end_date]) VALUES (12, N'DOLFUT', CAST(N'2019-11-19' AS Date), CAST(4222.00 AS Decimal(8, 2)), N'Buy', N'Strong', NULL, 1, CAST(N'1970-01-01' AS Date))
GO
SET IDENTITY_INSERT [dbo].[b3_significant_points] OFF
GO
SET IDENTITY_INSERT [dbo].[b3_symbols] ON 
GO
INSERT [dbo].[b3_symbols] ([id], [name], [description], [tick_value], [tick_step], [lot_size], [symbol_type_id]) VALUES (2, N'DOL', N'Dólar cheio', 125, 0.5, 5, 1)
GO
INSERT [dbo].[b3_symbols] ([id], [name], [description], [tick_value], [tick_step], [lot_size], [symbol_type_id]) VALUES (3, N'IND', N'Indice cheio', 25, 5, 5, 1)
GO
INSERT [dbo].[b3_symbols] ([id], [name], [description], [tick_value], [tick_step], [lot_size], [symbol_type_id]) VALUES (4, N'WDO', N'Mini dólar', 5, 0.5, 1, 2)
GO
INSERT [dbo].[b3_symbols] ([id], [name], [description], [tick_value], [tick_step], [lot_size], [symbol_type_id]) VALUES (5, N'WIN', N'Mini índice', 1, 5, 1, 2)
GO
SET IDENTITY_INSERT [dbo].[b3_symbols] OFF
GO
SET IDENTITY_INSERT [dbo].[login_users] ON 
GO
INSERT [dbo].[login_users] ([id], [firebase_id], [name], [email], [register_date]) VALUES (1, N'PtJGUIFfCnO3CfBKITyECxAwvS22', N'Juliano Fernandes', N'juliano.ladislau@hotmail.com', CAST(N'2019-10-21T12:27:00.0000000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[login_users] OFF
GO
INSERT [dbo].[symbol_types] ([id], [name], [description]) VALUES (1, N'Contrato cheio', N'Contratos futuros cheio')
GO
INSERT [dbo].[symbol_types] ([id], [name], [description]) VALUES (2, N'Mini contratos futuros', N'Mini contratos futuros')
GO
INSERT [dbo].[symbol_types] ([id], [name], [description]) VALUES (3, N'Ações', N'Ações')
GO
INSERT [dbo].[symbol_types] ([id], [name], [description]) VALUES (4, N'Opções', N'Opções')
GO
/****** Object:  Index [ix_b3_accounts_user_id]    Script Date: 22/11/2019 10:00:17 ******/
CREATE NONCLUSTERED INDEX [ix_b3_accounts_user_id] ON [dbo].[b3_accounts]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ix_b3_brokerages_broker_account_id]    Script Date: 22/11/2019 10:00:17 ******/
CREATE NONCLUSTERED INDEX [ix_b3_brokerages_broker_account_id] ON [dbo].[b3_brokerages]
(
	[broker_account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ix_b3_brokerages_symbol_type_id]    Script Date: 22/11/2019 10:00:17 ******/
CREATE NONCLUSTERED INDEX [ix_b3_brokerages_symbol_type_id] ON [dbo].[b3_brokerages]
(
	[symbol_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ix_b3_operations_b3_brokerage_id]    Script Date: 22/11/2019 10:00:17 ******/
CREATE NONCLUSTERED INDEX [ix_b3_operations_b3_brokerage_id] ON [dbo].[b3_operations]
(
	[b3_brokerage_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ix_b3_operations_strategy_id]    Script Date: 22/11/2019 10:00:17 ******/
CREATE NONCLUSTERED INDEX [ix_b3_operations_strategy_id] ON [dbo].[b3_operations]
(
	[strategy_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ix_b3_operations_symbol_id]    Script Date: 22/11/2019 10:00:17 ******/
CREATE NONCLUSTERED INDEX [ix_b3_operations_symbol_id] ON [dbo].[b3_operations]
(
	[symbol_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ix_b3_operations_user_id]    Script Date: 22/11/2019 10:00:17 ******/
CREATE NONCLUSTERED INDEX [ix_b3_operations_user_id] ON [dbo].[b3_operations]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ix_b3_significant_points_user_id]    Script Date: 22/11/2019 10:00:17 ******/
CREATE NONCLUSTERED INDEX [ix_b3_significant_points_user_id] ON [dbo].[b3_significant_points]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ix_b3_symbols_symbol_type_id]    Script Date: 22/11/2019 10:00:17 ******/
CREATE NONCLUSTERED INDEX [ix_b3_symbols_symbol_type_id] ON [dbo].[b3_symbols]
(
	[symbol_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ix_cme_accouns_user_id]    Script Date: 22/11/2019 10:00:17 ******/
CREATE NONCLUSTERED INDEX [ix_cme_accouns_user_id] ON [dbo].[cme_accouns]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ix_cme_brokerages_broker_acc_id]    Script Date: 22/11/2019 10:00:17 ******/
CREATE NONCLUSTERED INDEX [ix_cme_brokerages_broker_acc_id] ON [dbo].[cme_brokerages]
(
	[broker_acc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ix_cme_brokerages_symbol_id]    Script Date: 22/11/2019 10:00:17 ******/
CREATE NONCLUSTERED INDEX [ix_cme_brokerages_symbol_id] ON [dbo].[cme_brokerages]
(
	[symbol_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ix_cme_operations_cmebrokerage_id]    Script Date: 22/11/2019 10:00:17 ******/
CREATE NONCLUSTERED INDEX [ix_cme_operations_cmebrokerage_id] ON [dbo].[cme_operations]
(
	[cmebrokerage_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ix_cme_operations_strategy_id]    Script Date: 22/11/2019 10:00:17 ******/
CREATE NONCLUSTERED INDEX [ix_cme_operations_strategy_id] ON [dbo].[cme_operations]
(
	[strategy_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ix_cme_operations_symbol_id]    Script Date: 22/11/2019 10:00:17 ******/
CREATE NONCLUSTERED INDEX [ix_cme_operations_symbol_id] ON [dbo].[cme_operations]
(
	[symbol_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ix_cme_operations_user_id]    Script Date: 22/11/2019 10:00:17 ******/
CREATE NONCLUSTERED INDEX [ix_cme_operations_user_id] ON [dbo].[cme_operations]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ix_cme_symbols_symbol_type_id]    Script Date: 22/11/2019 10:00:17 ******/
CREATE NONCLUSTERED INDEX [ix_cme_symbols_symbol_type_id] ON [dbo].[cme_symbols]
(
	[symbol_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ix_session_control_user_id]    Script Date: 22/11/2019 10:00:17 ******/
CREATE NONCLUSTERED INDEX [ix_session_control_user_id] ON [dbo].[session_control]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ix_strategies_user_id]    Script Date: 22/11/2019 10:00:17 ******/
CREATE NONCLUSTERED INDEX [ix_strategies_user_id] ON [dbo].[strategies]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[b3_closing_data] ADD  CONSTRAINT [DF__b3_closin__negoc__71D1E811]  DEFAULT (CONVERT([bigint],(0))) FOR [negociated_number]
GO
ALTER TABLE [dbo].[b3_significant_points] ADD  DEFAULT ((0)) FOR [user_id]
GO
ALTER TABLE [dbo].[b3_accounts]  WITH CHECK ADD  CONSTRAINT [fk_b3_accounts_login_users_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[login_users] ([id])
GO
ALTER TABLE [dbo].[b3_accounts] CHECK CONSTRAINT [fk_b3_accounts_login_users_user_id]
GO
ALTER TABLE [dbo].[b3_brokerages]  WITH CHECK ADD  CONSTRAINT [fk_b3_brokerages_b3_accounts_broker_account_id] FOREIGN KEY([broker_account_id])
REFERENCES [dbo].[b3_accounts] ([id])
GO
ALTER TABLE [dbo].[b3_brokerages] CHECK CONSTRAINT [fk_b3_brokerages_b3_accounts_broker_account_id]
GO
ALTER TABLE [dbo].[b3_brokerages]  WITH CHECK ADD  CONSTRAINT [fk_b3_brokerages_symbol_types_symbol_type_id] FOREIGN KEY([symbol_type_id])
REFERENCES [dbo].[symbol_types] ([id])
GO
ALTER TABLE [dbo].[b3_brokerages] CHECK CONSTRAINT [fk_b3_brokerages_symbol_types_symbol_type_id]
GO
ALTER TABLE [dbo].[b3_operations]  WITH CHECK ADD  CONSTRAINT [fk_b3_operations_b3_accounts_b3_brokerage_id] FOREIGN KEY([b3_brokerage_id])
REFERENCES [dbo].[b3_accounts] ([id])
GO
ALTER TABLE [dbo].[b3_operations] CHECK CONSTRAINT [fk_b3_operations_b3_accounts_b3_brokerage_id]
GO
ALTER TABLE [dbo].[b3_operations]  WITH CHECK ADD  CONSTRAINT [fk_b3_operations_b3_symbols_symbol_id] FOREIGN KEY([symbol_id])
REFERENCES [dbo].[b3_symbols] ([id])
GO
ALTER TABLE [dbo].[b3_operations] CHECK CONSTRAINT [fk_b3_operations_b3_symbols_symbol_id]
GO
ALTER TABLE [dbo].[b3_operations]  WITH CHECK ADD  CONSTRAINT [fk_b3_operations_login_users_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[login_users] ([id])
GO
ALTER TABLE [dbo].[b3_operations] CHECK CONSTRAINT [fk_b3_operations_login_users_user_id]
GO
ALTER TABLE [dbo].[b3_operations]  WITH CHECK ADD  CONSTRAINT [fk_b3_operations_strategies_strategy_id] FOREIGN KEY([strategy_id])
REFERENCES [dbo].[strategies] ([id])
GO
ALTER TABLE [dbo].[b3_operations] CHECK CONSTRAINT [fk_b3_operations_strategies_strategy_id]
GO
ALTER TABLE [dbo].[b3_significant_points]  WITH CHECK ADD  CONSTRAINT [fk_b3_significant_points_login_users_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[login_users] ([id])
GO
ALTER TABLE [dbo].[b3_significant_points] CHECK CONSTRAINT [fk_b3_significant_points_login_users_user_id]
GO
ALTER TABLE [dbo].[b3_symbols]  WITH CHECK ADD  CONSTRAINT [fk_b3_symbols_symbol_types_symbol_type_id] FOREIGN KEY([symbol_type_id])
REFERENCES [dbo].[symbol_types] ([id])
GO
ALTER TABLE [dbo].[b3_symbols] CHECK CONSTRAINT [fk_b3_symbols_symbol_types_symbol_type_id]
GO
ALTER TABLE [dbo].[cme_accouns]  WITH CHECK ADD  CONSTRAINT [fk_cme_accouns_login_users_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[login_users] ([id])
GO
ALTER TABLE [dbo].[cme_accouns] CHECK CONSTRAINT [fk_cme_accouns_login_users_user_id]
GO
ALTER TABLE [dbo].[cme_brokerages]  WITH CHECK ADD  CONSTRAINT [fk_cme_brokerages_cme_accouns_broker_acc_id] FOREIGN KEY([broker_acc_id])
REFERENCES [dbo].[cme_accouns] ([id])
GO
ALTER TABLE [dbo].[cme_brokerages] CHECK CONSTRAINT [fk_cme_brokerages_cme_accouns_broker_acc_id]
GO
ALTER TABLE [dbo].[cme_brokerages]  WITH CHECK ADD  CONSTRAINT [fk_cme_brokerages_cme_symbols_symbol_id] FOREIGN KEY([symbol_id])
REFERENCES [dbo].[cme_symbols] ([id])
GO
ALTER TABLE [dbo].[cme_brokerages] CHECK CONSTRAINT [fk_cme_brokerages_cme_symbols_symbol_id]
GO
ALTER TABLE [dbo].[cme_operations]  WITH CHECK ADD  CONSTRAINT [fk_cme_operations_cme_accouns_cmebrokerage_id] FOREIGN KEY([cmebrokerage_id])
REFERENCES [dbo].[cme_accouns] ([id])
GO
ALTER TABLE [dbo].[cme_operations] CHECK CONSTRAINT [fk_cme_operations_cme_accouns_cmebrokerage_id]
GO
ALTER TABLE [dbo].[cme_operations]  WITH CHECK ADD  CONSTRAINT [fk_cme_operations_cme_symbols_symbol_id] FOREIGN KEY([symbol_id])
REFERENCES [dbo].[cme_symbols] ([id])
GO
ALTER TABLE [dbo].[cme_operations] CHECK CONSTRAINT [fk_cme_operations_cme_symbols_symbol_id]
GO
ALTER TABLE [dbo].[cme_operations]  WITH CHECK ADD  CONSTRAINT [fk_cme_operations_login_users_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[login_users] ([id])
GO
ALTER TABLE [dbo].[cme_operations] CHECK CONSTRAINT [fk_cme_operations_login_users_user_id]
GO
ALTER TABLE [dbo].[cme_operations]  WITH CHECK ADD  CONSTRAINT [fk_cme_operations_strategies_strategy_id] FOREIGN KEY([strategy_id])
REFERENCES [dbo].[strategies] ([id])
GO
ALTER TABLE [dbo].[cme_operations] CHECK CONSTRAINT [fk_cme_operations_strategies_strategy_id]
GO
ALTER TABLE [dbo].[cme_symbols]  WITH CHECK ADD  CONSTRAINT [fk_cme_symbols_symbol_types_symbol_type_id] FOREIGN KEY([symbol_type_id])
REFERENCES [dbo].[symbol_types] ([id])
GO
ALTER TABLE [dbo].[cme_symbols] CHECK CONSTRAINT [fk_cme_symbols_symbol_types_symbol_type_id]
GO
ALTER TABLE [dbo].[session_control]  WITH CHECK ADD  CONSTRAINT [fk_session_control_login_users_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[login_users] ([id])
GO
ALTER TABLE [dbo].[session_control] CHECK CONSTRAINT [fk_session_control_login_users_user_id]
GO
ALTER TABLE [dbo].[strategies]  WITH CHECK ADD  CONSTRAINT [fk_strategies_login_users_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[login_users] ([id])
GO
ALTER TABLE [dbo].[strategies] CHECK CONSTRAINT [fk_strategies_login_users_user_id]
GO
USE [master]
GO
ALTER DATABASE [StopMetrics] SET  READ_WRITE 
GO
