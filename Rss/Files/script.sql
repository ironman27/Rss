USE [master]
GO
/****** Object:  Database [RssReader]    Script Date: 10/20/2019 5:01:56 PM ******/
CREATE DATABASE [RssReader]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RssReader', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\RssReader.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RssReader_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\RssReader_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [RssReader] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RssReader].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RssReader] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RssReader] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RssReader] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RssReader] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RssReader] SET ARITHABORT OFF 
GO
ALTER DATABASE [RssReader] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RssReader] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RssReader] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RssReader] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RssReader] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RssReader] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RssReader] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RssReader] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RssReader] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RssReader] SET  ENABLE_BROKER 
GO
ALTER DATABASE [RssReader] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RssReader] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RssReader] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RssReader] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RssReader] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RssReader] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [RssReader] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RssReader] SET RECOVERY FULL 
GO
ALTER DATABASE [RssReader] SET  MULTI_USER 
GO
ALTER DATABASE [RssReader] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RssReader] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RssReader] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RssReader] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RssReader] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'RssReader', N'ON'
GO
ALTER DATABASE [RssReader] SET QUERY_STORE = OFF
GO
USE [RssReader]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 10/20/2019 5:01:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RssItems]    Script Date: 10/20/2019 5:01:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RssItems](
	[RssItemId] [uniqueidentifier] NOT NULL,
	[Link] [nvarchar](max) NULL,
	[Title] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Date] [datetime] NOT NULL,
	[Host] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.RssItems] PRIMARY KEY CLUSTERED 
(
	[RssItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201910190956152_add__RssItem_table', N'DAL.Migrations.Configuration', 0x1F8B0800000000000400CD57CB6EDB3A10DD17E83F085CB58B9A4EBA6903B985EB2485D1380922A77B5A1A3B44295225A9C0FEB62EFA49F717EE50EF879FE92D707714393C73E64DFDF3EBB7FF791D0BEF19B4E14A8EC8D960483C90A18AB85C8D486A97EF3E90CF9F5EBFF2AFA278ED7D2FE5DE3B39BC29CD883C599B5C506AC227889919C43CD4CAA8A51D842AA62C52F47C38FC48CFCE282004412CCFF31F5269790CD9077E4E940C21B1291333158130C53E9E0419AA77CB6230090B61442EC737C41B0BCE50750062493C26A5B2CC22B18B470381D54AAE82043798986F1240B92513060AC217B5F8B1DC87E78E3BAD2FBEC876525995591C2702D68E5F66DC883C6A4E3CDA94B9421FD94D43E4C198A98516108A7D834D6B03B7EEB54A40DBCD032CDB57A7515B07CAD2EEFDEA76FFAAE332225F538EEBDB5408B6105079B71186C02A0D5F41826616A27B662D68F4F63482CCA41E878EC61B2E7F94CA309C988AC49BB1F50DC8957D1A115C12EF9AAF212A770A068F9263E6E225AB5338A464CEAD80BFAEE5124CA8799227CDDFD685CE2E95B8F51C2B6C4B9CF68364695810C5EA1A64DF7B317C5A276A3F7DB1B42DE3980905FE3849040FB3347147B0B69D74CEAF0560EBF40343BC5A4741AC2C86AD5C2AAD7527A1792B295B0EDDD173FC194B128C4FA307153B5E9037A0C9BBE0F4FA8F730C1A1AB2C7479526AC1FB682CE29AA46A6D75C1B8BE1650BE6223189E29ED8F13E2E15365DDD6D26B5E74B69B72E526E7C33D8DA959A8EBB465B62ACFCCC2CA874EFE867C5DD206482E9DDAD68A2441ACB03CD6D1F56DE649A30F9CEF10845076942145BC763B4FA4313A97570025ED6035A40D94E1FC1A79DF074E34E7B81EF0C8E6E16EDABC3AE48A5BDAAC74EDDF9450D1C7E10F48A2217211EBAE69947AE20828DC1FC18388141F0534C04477B6B8119937C09C6CED50FC031753E3C3BEF3C315E30EEA93191D852ECFFBF799E4AFE33059E0DE725074DBC83F3FBC4A1D21CE8F299E9F089E937315BBF6D229D3CB4FF0869CB60FE33BCC6F08D706D0F0FDFD30667BFF71F9C9BF97CDC3D39F34241BE0B85D4739EC5A179F15CEDD7AD4F9BCF7D1F3DCF5735847BFC4B085D206AD052662A97AA74349AD664548A74E23003CBD0FF6CAC31995968F1380463B217D777265214B98A17104DE55D6A93D48E71E6C50BD17A93FA74BFFEECF1D0E6ECDF65A964FE0B13902677297427BFA45C4415EFEB2D29B403C2254B51BFC80A5F9C08B7DA5448B74A1E0954B8EF121290AEFAE780FF2D0866EE64C09E6137B7C33E6C7BCCBFE46CA5596C0A8CFABEFBFBA4EEF7F3D3BFCE83470DB00E0000, N'6.0.0-20911')
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201910190959308_add_column_host_RssItem_table', N'DAL.Migrations.Configuration', 0x1F8B0800000000000400D557CD72D33010BE33C33B78748203515A2ED0716042DA4286A665EAC05DB137A906593292DC499E8D038FC42BB0F2FF4FD2242D1CB8C9D2EADB6F57FBE7DF3F7FF9EFD7B1F0EE411BAEE4889C0C86C40319AA88CBD588A476F9EA0D79FFEEF933FF228AD7DEB752EEB593C39BD28CC89DB5C919A526BC83989941CC43AD8C5ADA41A862CA22454F87C3B7F4E484024210C4F23CFF369596C7907DE0E744C910129B323153110853ECE34990A17AD72C0693B01046E47C7C45BCB1E00C55072096C463522ACB2C123BFB6A20B05AC95590E00613F34D0228B764C24041F8AC163F94FBF0D471A7F5C547D94E2AABD0AE0BB4DF6E1CBDCCB611B935666AA12584629F61D3DAC0AD2F5A25A0EDE61696EDABD38878B47D9D76EF57B7FB571D9711F998725C5FA742B08580CA730D17075669F8081234B3107D61D682464F4E23C84CEA71E868BCE2F27BA90C9F0AC38C7833B6BE02B9B27723824BE25DF23544E54EC1E0ABE4189578C9EA14F62999732BE09F6B3907136A9EE401F1AF75A1B34B256E3DC7ECD9F24E0F837C52C6FE65A63EAD23B91FDF98D796710C9582C03849040FB3387247B0B69D78CFAF0560EBF80443BC5A479EF383325BB672A9B4D66584E675A4AC377447C1F1672C49D02D8D0254EC78415E7D26AF82E3933FCE316868B6D4808A6DA509138CADA0738AAA91E925D7C6E2FBB305730F3389E29ED8E13E2E15365DDDAD36B5E74B69B72E62727C35D85AB69A8EBB445B622C0D995950E9DE51F08ABB41C804D3BB6BD5448934967BAADF435879156AC2E43B87231425A609516C1D8ED12A204DA4D6C1117859916801653B8723E415A28990EFF4117CDA79E06EE4D05EE8747A53370E1FCAE4AE48A5BDCAE84EE6FA4516ED9F277A69958B100F5D73CF239752C1C660840D9CC020F8212682A3BDB5C08C49BE0463E7EA3B60273C1D9E9C762694474C0BD49848FC1723432AF98F1478D6FF971C34F1F68E0847F6ADE6CC20EF990EEF987E11B3F5CB26D2D173C19390B6F4FEA7E135FA7B846BFBD4FE7E049BE37A78BF0DED6DE179ABDEDDC4F38C43C3170AE9E7348B43F3E816DF2F003E6DFE76F8F8847C5543B89F1009A17BD11AB49499CAA52A9D8DA6351995229DB7988165F8906CAC312B5868F1380463B299EB1B13298A5CC40B88A6F226B5496AC7D87EE38568CDCF3E7D587F36C7B439FB37594C9ABF6102D2E42E166FE487948BA8E27DD98FC55D102E588A4280AC70E644B8D5A642BA56F240A0C27DE790807465640E712210CCDCC880DDC36E6EFB7DD8F6987FCED94AB3D81418F57DF7174CDD6FF0BB3FFCB1A566380F0000, N'6.0.0-20911')
INSERT [dbo].[RssItems] ([RssItemId], [Link], [Title], [Description], [Date], [Host]) VALUES (N'c9397be5-41f3-e911-bb4e-c61e480a18e5', N'http://interfax.by/news/policy/v_mire/1266107/', N'В Брюсселе прошла встреча дипломатов из стран ЕС по Brexit', N'', CAST(N'2019-10-20T16:58:18.000' AS DateTime), N'interfax.by')
INSERT [dbo].[RssItems] ([RssItemId], [Link], [Title], [Description], [Date], [Host]) VALUES (N'ca397be5-41f3-e911-bb4e-c61e480a18e5', N'http://interfax.by/news/sports/raznoe/1266106/', N'Белорусский боксер Николай Веселов защитил чемпионский пояс WBA Continental  ', N'', CAST(N'2019-10-20T16:12:26.000' AS DateTime), N'interfax.by')
INSERT [dbo].[RssItems] ([RssItemId], [Link], [Title], [Description], [Date], [Host]) VALUES (N'cb397be5-41f3-e911-bb4e-c61e480a18e5', N'http://interfax.by/news/policy/v_mire/1266105/', N'В НАТО создан кризисный штаб по оценке турецкой операции в Сирии - газета', N'', CAST(N'2019-10-20T15:40:40.000' AS DateTime), N'interfax.by')
INSERT [dbo].[RssItems] ([RssItemId], [Link], [Title], [Description], [Date], [Host]) VALUES (N'cc397be5-41f3-e911-bb4e-c61e480a18e5', N'http://interfax.by/news/policy/v_mire/1266104/', N'В Красноярском крае установили, что на артели произошло разрушение пять дамб', N'', CAST(N'2019-10-20T14:44:20.000' AS DateTime), N'interfax.by')
INSERT [dbo].[RssItems] ([RssItemId], [Link], [Title], [Description], [Date], [Host]) VALUES (N'cd397be5-41f3-e911-bb4e-c61e480a18e5', N'http://interfax.by/news/obshchestvo/kultura/1266103/', N'У иудеев наступает самый веселый праздник в году', N'', CAST(N'2019-10-20T14:01:15.000' AS DateTime), N'interfax.by')
INSERT [dbo].[RssItems] ([RssItemId], [Link], [Title], [Description], [Date], [Host]) VALUES (N'ce397be5-41f3-e911-bb4e-c61e480a18e5', N'http://interfax.by/news/policy/v_mire/1266102/', N'Трамп отказался от идеи провести G7 на своем курорте в Майами в 2020 году', N'', CAST(N'2019-10-20T13:21:59.000' AS DateTime), N'interfax.by')
INSERT [dbo].[RssItems] ([RssItemId], [Link], [Title], [Description], [Date], [Host]) VALUES (N'cf397be5-41f3-e911-bb4e-c61e480a18e5', N'http://interfax.by/news/policy/v_mire/1266101/', N'Полиция Гонконга разгоняет демонстрантов с несанкционированной акции', N'', CAST(N'2019-10-20T12:01:48.000' AS DateTime), N'interfax.by')
INSERT [dbo].[RssItems] ([RssItemId], [Link], [Title], [Description], [Date], [Host]) VALUES (N'd0397be5-41f3-e911-bb4e-c61e480a18e5', N'http://interfax.by/news/tovary_i_uslugi/transport/1266100/', N'Авиакомпания Qantas совершила 19-часовой беспосадочный перелет из Нью-Йорка в Сидней', N'', CAST(N'2019-10-20T12:00:01.000' AS DateTime), N'interfax.by')
INSERT [dbo].[RssItems] ([RssItemId], [Link], [Title], [Description], [Date], [Host]) VALUES (N'd1397be5-41f3-e911-bb4e-c61e480a18e5', N'http://interfax.by/news/policy/v_mire/1266099/', N'Два сотрудника артели под Красноярском задержаны в рамках дела о прорыве дамбы', N'', CAST(N'2019-10-20T11:48:47.000' AS DateTime), N'interfax.by')
INSERT [dbo].[RssItems] ([RssItemId], [Link], [Title], [Description], [Date], [Host]) VALUES (N'd2397be5-41f3-e911-bb4e-c61e480a18e5', N'http://interfax.by/news/policy/v_mire/1266098/', N'Глава Пентагона заявил о планах перебросить военнослужащих США из Сирии на запад Ирака', N'', CAST(N'2019-10-20T10:54:36.000' AS DateTime), N'interfax.by')
INSERT [dbo].[RssItems] ([RssItemId], [Link], [Title], [Description], [Date], [Host]) VALUES (N'd3397be5-41f3-e911-bb4e-c61e480a18e5', N'http://interfax.by/news/biznes/rynki_i_prognozy/1266097/', N'МВФ намерен договориться о 16-м пересмотре квот до конца 2023г - коммюнике', N'', CAST(N'2019-10-20T10:11:20.000' AS DateTime), N'interfax.by')
INSERT [dbo].[RssItems] ([RssItemId], [Link], [Title], [Description], [Date], [Host]) VALUES (N'd4397be5-41f3-e911-bb4e-c61e480a18e5', N'http://interfax.by/news/policy/v_mire/1266096/', N'Трамп назвал Хиллари Клинтон сумасшедшей и заявил, что ему нравятся россияне', N'', CAST(N'2019-10-20T09:40:46.000' AS DateTime), N'interfax.by')
INSERT [dbo].[RssItems] ([RssItemId], [Link], [Title], [Description], [Date], [Host]) VALUES (N'd5397be5-41f3-e911-bb4e-c61e480a18e5', N'http://interfax.by/news/policy/vneshnyaya_politika/1266095/', N'Глава Минобороны выступит с докладом на Пекинском форуме по вопросам безопасности', N'', CAST(N'2019-10-20T09:16:47.000' AS DateTime), N'interfax.by')
INSERT [dbo].[RssItems] ([RssItemId], [Link], [Title], [Description], [Date], [Host]) VALUES (N'd6397be5-41f3-e911-bb4e-c61e480a18e5', N'http://interfax.by/news/obshchestvo/society-different/1266094/', N'РПЦ раскритикиовала мужчин, у которых главная радость - смотреть футбол', N'', CAST(N'2019-10-20T09:12:49.000' AS DateTime), N'interfax.by')
INSERT [dbo].[RssItems] ([RssItemId], [Link], [Title], [Description], [Date], [Host]) VALUES (N'd7397be5-41f3-e911-bb4e-c61e480a18e5', N'http://interfax.by/news/policy/v_mire/1266093/', N'Джонсон просит отсрочки у Брюсселя до 31 января 2020 года', N'', CAST(N'2019-10-20T09:01:00.000' AS DateTime), N'interfax.by')
INSERT [dbo].[RssItems] ([RssItemId], [Link], [Title], [Description], [Date], [Host]) VALUES (N'd8397be5-41f3-e911-bb4e-c61e480a18e5', N'http://interfax.by/news/obshchestvo/society-different/1266092/', N'В РПЦ считают отслеживание маньяков в соцсетях эффективнее введения смертной казни', N'В Русской православной церкви считают, что возврат к смертной казни не решит проблемы, а помочь обезопасить общество может отслеживание потенциальных преступников в социальных', CAST(N'2019-10-19T17:20:21.000' AS DateTime), N'interfax.by')
INSERT [dbo].[RssItems] ([RssItemId], [Link], [Title], [Description], [Date], [Host]) VALUES (N'd9397be5-41f3-e911-bb4e-c61e480a18e5', N'https://habr.com/ru/post/472242/?utm_source=habrahabr&utm_medium=rss&utm_campaign=472242', N'[Перевод] Мы ускорили планировщик Tokio в десять раз', N'Мы в поте лица готовим очередную мажорную версию Tokio, асинхронной среды выполнения для Rust. 13 октября для слияния в ветку оформлен <a href="https://github.com/tokio-rs/tokio/', CAST(N'2019-10-20T13:59:37.000' AS DateTime), N'habr.com')
INSERT [dbo].[RssItems] ([RssItemId], [Link], [Title], [Description], [Date], [Host]) VALUES (N'da397be5-41f3-e911-bb4e-c61e480a18e5', N'https://habr.com/ru/post/472262/?utm_source=habrahabr&utm_medium=rss&utm_campaign=472262', N'Дайджест интересных материалов для мобильного разработчика #318 (14— 20 октября)', N'Мы возвращаемся из отпуска с новым дайджестом в котором есть длинная история путеводителя, закрытие Daydream, самые красивые приложения Material Design Awards 2019, темные темы и', CAST(N'2019-10-20T13:26:34.000' AS DateTime), N'habr.com')
INSERT [dbo].[RssItems] ([RssItemId], [Link], [Title], [Description], [Date], [Host]) VALUES (N'db397be5-41f3-e911-bb4e-c61e480a18e5', N'https://habr.com/ru/post/445072/?utm_source=habrahabr&utm_medium=rss&utm_campaign=445072', N'Telegraff: Kotlin DSL для Telegram', N'<p><img src="https://habrastorage.org/webt/3v/da/0z/3vda0ztz83mtq8efycve_gfyrqa.png" alt="Лого"></p><br', CAST(N'2019-10-20T12:43:19.000' AS DateTime), N'habr.com')
INSERT [dbo].[RssItems] ([RssItemId], [Link], [Title], [Description], [Date], [Host]) VALUES (N'dc397be5-41f3-e911-bb4e-c61e480a18e5', N'https://habr.com/ru/post/472248/?utm_source=habrahabr&utm_medium=rss&utm_campaign=472248', N'Как мы слили финал IT-Планеты по программированию', N'Не мы плохие, а багов много. Разработка искусственного интеллекта для игры “Хоккей” за ~7 часов.<br', CAST(N'2019-10-20T12:30:27.000' AS DateTime), N'habr.com')
INSERT [dbo].[RssItems] ([RssItemId], [Link], [Title], [Description], [Date], [Host]) VALUES (N'dd397be5-41f3-e911-bb4e-c61e480a18e5', N'https://habr.com/ru/post/472230/?utm_source=habrahabr&utm_medium=rss&utm_campaign=472230', N'Чипы для ML — рассказываем о новинках', N'Говорим о новых архитектурах как крупных мировых производителей, так и стартапов — waferscale-чипах, тензорных процессорах и устройствах на базе графов. <br', CAST(N'2019-10-20T12:12:55.000' AS DateTime), N'habr.com')
INSERT [dbo].[RssItems] ([RssItemId], [Link], [Title], [Description], [Date], [Host]) VALUES (N'de397be5-41f3-e911-bb4e-c61e480a18e5', N'https://habr.com/ru/post/472240/?utm_source=habrahabr&utm_medium=rss&utm_campaign=472240', N'[Из песочницы] Про геймификацию. Что это, зачем, и как это делать? Взгляд разработчика', N'<img src="https://habrastorage.org/webt/wh/wd/7f/whwd7fdc3394aiuiid7uaw5vgai.jpeg"><br', CAST(N'2019-10-20T12:11:11.000' AS DateTime), N'habr.com')
INSERT [dbo].[RssItems] ([RssItemId], [Link], [Title], [Description], [Date], [Host]) VALUES (N'df397be5-41f3-e911-bb4e-c61e480a18e5', N'https://habr.com/ru/post/472222/?utm_source=habrahabr&utm_medium=rss&utm_campaign=472222', N'«Читай, если любишь слушать»: книги для тех, кто неравнодушен к музыке — от классики до хип-хопа', N'Это — подборка книг для тех, кто небезразличен к музыке. Мы собрали литературу, посвященную разным жанрам и эпохам: от истории андеграундного панк-рока до западноевропейской', CAST(N'2019-10-20T10:13:05.000' AS DateTime), N'habr.com')
INSERT [dbo].[RssItems] ([RssItemId], [Link], [Title], [Description], [Date], [Host]) VALUES (N'e0397be5-41f3-e911-bb4e-c61e480a18e5', N'https://habr.com/ru/post/472220/?utm_source=habrahabr&utm_medium=rss&utm_campaign=472220', N'[Из песочницы] Почему топовые физики не любят многомировую интерпретацию', N'<p>Последнее время из каждого утюга слышатся хвалебные высказывания о многомировой интерпретации квантовой механики и негативные в сторону Копенгагенской. Вот, например', CAST(N'2019-10-20T10:06:20.000' AS DateTime), N'habr.com')
INSERT [dbo].[RssItems] ([RssItemId], [Link], [Title], [Description], [Date], [Host]) VALUES (N'e1397be5-41f3-e911-bb4e-c61e480a18e5', N'https://habr.com/ru/post/467761/?utm_source=habrahabr&utm_medium=rss&utm_campaign=467761', N'Энергия, тепло и вода часть третья: выходим в радио', N'<h2>Вступление</h2><br', CAST(N'2019-10-20T10:00:41.000' AS DateTime), N'habr.com')
INSERT [dbo].[RssItems] ([RssItemId], [Link], [Title], [Description], [Date], [Host]) VALUES (N'e2397be5-41f3-e911-bb4e-c61e480a18e5', N'https://habr.com/ru/post/472212/?utm_source=habrahabr&utm_medium=rss&utm_campaign=472212', N'Как посадить Space Shuttle из космоса', N'В общем, небольшая оговорка: выступление будет всего 20 минут.<br', CAST(N'2019-10-20T08:51:59.000' AS DateTime), N'habr.com')
INSERT [dbo].[RssItems] ([RssItemId], [Link], [Title], [Description], [Date], [Host]) VALUES (N'e3397be5-41f3-e911-bb4e-c61e480a18e5', N'https://habr.com/ru/post/472208/?utm_source=habrahabr&utm_medium=rss&utm_campaign=472208', N'[Из песочницы] OLED-экраны смартфонов на Андроиде и как с ними бороться', N'<p><img src="https://habrastorage.org/webt/7q/uu/a2/7quua2q0dlo52ffkvn7twqdo5qg.jpeg" alt="Экран Google Pixel 4"></p><br', CAST(N'2019-10-20T07:26:18.000' AS DateTime), N'habr.com')
INSERT [dbo].[RssItems] ([RssItemId], [Link], [Title], [Description], [Date], [Host]) VALUES (N'e4397be5-41f3-e911-bb4e-c61e480a18e5', N'https://habr.com/ru/post/472204/?utm_source=habrahabr&utm_medium=rss&utm_campaign=472204', N'Простые эксперименты с микроконтроллером STM32F103 («Голубая таблетка»)', N'<img src="https://habrastorage.org/webt/kx/9h/1s/kx9h1synxem3k3qz1dixgibvyqu.jpeg" alt="image"><br', CAST(N'2019-10-20T06:05:44.000' AS DateTime), N'habr.com')
INSERT [dbo].[RssItems] ([RssItemId], [Link], [Title], [Description], [Date], [Host]) VALUES (N'e5397be5-41f3-e911-bb4e-c61e480a18e5', N'https://habr.com/ru/post/472188/?utm_source=habrahabr&utm_medium=rss&utm_campaign=472188', N'То, что нужно знать о проверке чека App Store (App Store receipt)', N'<p>В StackOverflow по-прежнему появляется много вопросов о валидации App Store чеков, поэтому мы решили написать статью на эту тему в формате вопросов и ответов.</p><br', CAST(N'2019-10-20T04:30:15.000' AS DateTime), N'habr.com')
INSERT [dbo].[RssItems] ([RssItemId], [Link], [Title], [Description], [Date], [Host]) VALUES (N'e6397be5-41f3-e911-bb4e-c61e480a18e5', N'https://habr.com/ru/post/472202/?utm_source=habrahabr&utm_medium=rss&utm_campaign=472202', N'Windows 10 + Python = VS Code + WSL', N'<img src="https://habrastorage.org/webt/m2/_c/ey/m2_ceykmjmgcdvt9mn0_6vok2r8.png" alt="image"><br', CAST(N'2019-10-20T02:22:28.000' AS DateTime), N'habr.com')
INSERT [dbo].[RssItems] ([RssItemId], [Link], [Title], [Description], [Date], [Host]) VALUES (N'e7397be5-41f3-e911-bb4e-c61e480a18e5', N'https://habr.com/ru/post/472200/?utm_source=habrahabr&utm_medium=rss&utm_campaign=472200', N'Модернизация класса информатики в российской школе на малинке: дёшево и сердито', N'<blockquote>Нет повести печальнее на свете, чем российское ит-образование в среднестатистической школе </blockquote><br', CAST(N'2019-10-20T00:08:21.000' AS DateTime), N'habr.com')
INSERT [dbo].[RssItems] ([RssItemId], [Link], [Title], [Description], [Date], [Host]) VALUES (N'e8397be5-41f3-e911-bb4e-c61e480a18e5', N'https://habr.com/ru/post/472198/?utm_source=habrahabr&utm_medium=rss&utm_campaign=472198', N'Локализация пуш-сообщений в мобильных приложениях', N'Получив на поддержку очередной проект бэкенда мобильного приложения, я, к сожалению, столкнулся с тем, что массовая рассылка пуш-сообщений в топики (topics) не локализована. В', CAST(N'2019-10-19T23:02:45.000' AS DateTime), N'habr.com')
INSERT [dbo].[RssItems] ([RssItemId], [Link], [Title], [Description], [Date], [Host]) VALUES (N'e9397be5-41f3-e911-bb4e-c61e480a18e5', N'https://habr.com/ru/post/472190/?utm_source=habrahabr&utm_medium=rss&utm_campaign=472190', N'Запускаем php скриптики через php-fpm без web сервера. Или свой FastCgi клиент (под капотом)', N'<p>Приветствую всех читателей "Хабра".</p><br', CAST(N'2019-10-19T21:32:17.000' AS DateTime), N'habr.com')
INSERT [dbo].[RssItems] ([RssItemId], [Link], [Title], [Description], [Date], [Host]) VALUES (N'ea397be5-41f3-e911-bb4e-c61e480a18e5', N'https://habr.com/ru/post/471862/?utm_source=habrahabr&utm_medium=rss&utm_campaign=471862', N'[Перевод] Реализация PEG парсера', N'<p>Вдохновленный лишь частичным пониманием PEG, я решил попробовать его реализовать. Результат может получиться и не самым лучшим среди парсеров PEG общего назначения — их уже', CAST(N'2019-10-19T19:08:25.000' AS DateTime), N'habr.com')
INSERT [dbo].[RssItems] ([RssItemId], [Link], [Title], [Description], [Date], [Host]) VALUES (N'eb397be5-41f3-e911-bb4e-c61e480a18e5', N'https://habr.com/ru/post/472186/?utm_source=habrahabr&utm_medium=rss&utm_campaign=472186', N'[Из песочницы] Принцип открытости-закрытости', N'<p>Привет, Хабр! Перед вами перевод статьи Роберта Мартина <a href="https://web.archive.org/web/20060822033314/http://www.objectmentor.com/resources/articles/ocp.pdf">Open-Closed', CAST(N'2019-10-19T18:48:06.000' AS DateTime), N'habr.com')
INSERT [dbo].[RssItems] ([RssItemId], [Link], [Title], [Description], [Date], [Host]) VALUES (N'ec397be5-41f3-e911-bb4e-c61e480a18e5', N'https://habr.com/ru/post/472178/?utm_source=habrahabr&utm_medium=rss&utm_campaign=472178', N'Холивар. История рунета. Часть 7. YouTube: комики, зашквары и Кремниевая долина', N'<a href="https://habr.com/ru/company/ua-hosting/blog/469341/">Холивар. История рунета. Часть 1. Начало: хиппи из Калифорнии, Носик и лихие 90-е</a><br', CAST(N'2019-10-19T17:33:45.000' AS DateTime), N'habr.com')
ALTER TABLE [dbo].[RssItems] ADD  DEFAULT (newsequentialid()) FOR [RssItemId]
GO
USE [master]
GO
ALTER DATABASE [RssReader] SET  READ_WRITE 
GO
