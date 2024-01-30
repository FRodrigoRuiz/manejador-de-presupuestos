USE [master]
GO
/****** Object:  Database [ManejoPresupuesto]    Script Date: 1/30/2024 4:01:44 PM ******/
CREATE DATABASE [ManejoPresupuesto]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ManejoPresupuesto', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLAS2022\MSSQL\DATA\ManejoPresupuesto.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ManejoPresupuesto_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLAS2022\MSSQL\DATA\ManejoPresupuesto_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ManejoPresupuesto] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ManejoPresupuesto].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ManejoPresupuesto] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ManejoPresupuesto] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ManejoPresupuesto] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ManejoPresupuesto] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ManejoPresupuesto] SET ARITHABORT OFF 
GO
ALTER DATABASE [ManejoPresupuesto] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ManejoPresupuesto] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ManejoPresupuesto] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ManejoPresupuesto] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ManejoPresupuesto] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ManejoPresupuesto] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ManejoPresupuesto] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ManejoPresupuesto] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ManejoPresupuesto] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ManejoPresupuesto] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ManejoPresupuesto] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ManejoPresupuesto] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ManejoPresupuesto] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ManejoPresupuesto] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ManejoPresupuesto] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ManejoPresupuesto] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ManejoPresupuesto] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ManejoPresupuesto] SET RECOVERY FULL 
GO
ALTER DATABASE [ManejoPresupuesto] SET  MULTI_USER 
GO
ALTER DATABASE [ManejoPresupuesto] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ManejoPresupuesto] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ManejoPresupuesto] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ManejoPresupuesto] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ManejoPresupuesto] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ManejoPresupuesto] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ManejoPresupuesto', N'ON'
GO
ALTER DATABASE [ManejoPresupuesto] SET QUERY_STORE = OFF
GO
USE [ManejoPresupuesto]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 1/30/2024 4:01:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[TipoOperacionId] [int] NOT NULL,
	[UsuarioId] [int] NOT NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cuentas]    Script Date: 1/30/2024 4:01:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cuentas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[TipoCuentaId] [int] NOT NULL,
	[Balance] [decimal](18, 2) NOT NULL,
	[Descripcion] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Cuentas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposCuentas]    Script Date: 1/30/2024 4:01:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposCuentas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[UsuarioId] [int] NOT NULL,
	[Orden] [int] NOT NULL,
 CONSTRAINT [PK_TiposCuentas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposOperaciones]    Script Date: 1/30/2024 4:01:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposOperaciones](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TiposOperaciones] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transacciones]    Script Date: 1/30/2024 4:01:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transacciones](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioId] [int] NOT NULL,
	[FechaTransaccion] [datetime] NOT NULL,
	[Monto] [decimal](18, 2) NOT NULL,
	[Nota] [nvarchar](1000) NULL,
	[CuentaId] [int] NOT NULL,
	[CategoriaId] [int] NOT NULL,
 CONSTRAINT [PK_Transacciones] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 1/30/2024 4:01:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[EmailNormalizado] [nvarchar](256) NOT NULL,
	[PasswordHash] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categorias] ON 

INSERT [dbo].[Categorias] ([Id], [Nombre], [TipoOperacionId], [UsuarioId]) VALUES (1, N'Libros ', 2, 1)
INSERT [dbo].[Categorias] ([Id], [Nombre], [TipoOperacionId], [UsuarioId]) VALUES (2, N'Salario', 1, 1)
INSERT [dbo].[Categorias] ([Id], [Nombre], [TipoOperacionId], [UsuarioId]) VALUES (5, N'Comida', 2, 1)
INSERT [dbo].[Categorias] ([Id], [Nombre], [TipoOperacionId], [UsuarioId]) VALUES (6, N'Dividendos', 1, 1)
INSERT [dbo].[Categorias] ([Id], [Nombre], [TipoOperacionId], [UsuarioId]) VALUES (7, N'Libros', 2, 6)
INSERT [dbo].[Categorias] ([Id], [Nombre], [TipoOperacionId], [UsuarioId]) VALUES (8, N'Salario', 1, 6)
INSERT [dbo].[Categorias] ([Id], [Nombre], [TipoOperacionId], [UsuarioId]) VALUES (9, N'Mesada', 1, 6)
INSERT [dbo].[Categorias] ([Id], [Nombre], [TipoOperacionId], [UsuarioId]) VALUES (10, N'Comida', 2, 6)
INSERT [dbo].[Categorias] ([Id], [Nombre], [TipoOperacionId], [UsuarioId]) VALUES (11, N'Transporte', 2, 6)
INSERT [dbo].[Categorias] ([Id], [Nombre], [TipoOperacionId], [UsuarioId]) VALUES (12, N'Renta', 2, 6)
INSERT [dbo].[Categorias] ([Id], [Nombre], [TipoOperacionId], [UsuarioId]) VALUES (13, N'Dividendo', 1, 6)
INSERT [dbo].[Categorias] ([Id], [Nombre], [TipoOperacionId], [UsuarioId]) VALUES (14, N'Emprendimiento', 1, 6)
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[Cuentas] ON 

INSERT [dbo].[Cuentas] ([Id], [Nombre], [TipoCuentaId], [Balance], [Descripcion]) VALUES (1, N'Tarjeta del Banco', 3, CAST(4500.00 AS Decimal(18, 2)), N'Esta tarjeta siempre la debo.')
INSERT [dbo].[Cuentas] ([Id], [Nombre], [TipoCuentaId], [Balance], [Descripcion]) VALUES (2, N'Efectivo', 1, CAST(3540.00 AS Decimal(18, 2)), N'Nuevo comentario.')
INSERT [dbo].[Cuentas] ([Id], [Nombre], [TipoCuentaId], [Balance], [Descripcion]) VALUES (3, N'Prestamo del auto', 5, CAST(-5000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Cuentas] ([Id], [Nombre], [TipoCuentaId], [Balance], [Descripcion]) VALUES (5, N'Efectivo', 8, CAST(2015.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Cuentas] ([Id], [Nombre], [TipoCuentaId], [Balance], [Descripcion]) VALUES (6, N'Cuentas de Banco', 9, CAST(0.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Cuentas] ([Id], [Nombre], [TipoCuentaId], [Balance], [Descripcion]) VALUES (7, N'Tarjetas', 10, CAST(0.00 AS Decimal(18, 2)), NULL)
SET IDENTITY_INSERT [dbo].[Cuentas] OFF
GO
SET IDENTITY_INSERT [dbo].[TiposCuentas] ON 

INSERT [dbo].[TiposCuentas] ([Id], [Nombre], [UsuarioId], [Orden]) VALUES (1, N'Efectivo', 1, 1)
INSERT [dbo].[TiposCuentas] ([Id], [Nombre], [UsuarioId], [Orden]) VALUES (2, N'Cuentas de Banco ', 1, 4)
INSERT [dbo].[TiposCuentas] ([Id], [Nombre], [UsuarioId], [Orden]) VALUES (3, N'Tarjetas', 1, 2)
INSERT [dbo].[TiposCuentas] ([Id], [Nombre], [UsuarioId], [Orden]) VALUES (5, N'Prestamos', 1, 3)
INSERT [dbo].[TiposCuentas] ([Id], [Nombre], [UsuarioId], [Orden]) VALUES (7, N'Efectivo', 3, 1)
INSERT [dbo].[TiposCuentas] ([Id], [Nombre], [UsuarioId], [Orden]) VALUES (8, N'Efectivo', 6, 1)
INSERT [dbo].[TiposCuentas] ([Id], [Nombre], [UsuarioId], [Orden]) VALUES (9, N'Cuentas de Banco', 6, 2)
INSERT [dbo].[TiposCuentas] ([Id], [Nombre], [UsuarioId], [Orden]) VALUES (10, N'Tarjetas', 6, 3)
SET IDENTITY_INSERT [dbo].[TiposCuentas] OFF
GO
SET IDENTITY_INSERT [dbo].[TiposOperaciones] ON 

INSERT [dbo].[TiposOperaciones] ([Id], [Descripcion]) VALUES (1, N'Ingresos')
INSERT [dbo].[TiposOperaciones] ([Id], [Descripcion]) VALUES (2, N'Gastos')
SET IDENTITY_INSERT [dbo].[TiposOperaciones] OFF
GO
SET IDENTITY_INSERT [dbo].[Transacciones] ON 

INSERT [dbo].[Transacciones] ([Id], [UsuarioId], [FechaTransaccion], [Monto], [Nota], [CuentaId], [CategoriaId]) VALUES (1, 1, CAST(N'2024-01-19T00:00:00.000' AS DateTime), CAST(11.00 AS Decimal(18, 2)), N'Ejemplo 2', 2, 2)
INSERT [dbo].[Transacciones] ([Id], [UsuarioId], [FechaTransaccion], [Monto], [Nota], [CuentaId], [CategoriaId]) VALUES (2, 1, CAST(N'2024-01-18T00:00:00.000' AS DateTime), CAST(10.00 AS Decimal(18, 2)), NULL, 2, 2)
INSERT [dbo].[Transacciones] ([Id], [UsuarioId], [FechaTransaccion], [Monto], [Nota], [CuentaId], [CategoriaId]) VALUES (3, 1, CAST(N'2024-01-18T00:00:00.000' AS DateTime), CAST(500.00 AS Decimal(18, 2)), NULL, 1, 1)
INSERT [dbo].[Transacciones] ([Id], [UsuarioId], [FechaTransaccion], [Monto], [Nota], [CuentaId], [CategoriaId]) VALUES (5, 1, CAST(N'2024-01-19T00:00:00.000' AS DateTime), CAST(7.00 AS Decimal(18, 2)), NULL, 2, 1)
INSERT [dbo].[Transacciones] ([Id], [UsuarioId], [FechaTransaccion], [Monto], [Nota], [CuentaId], [CategoriaId]) VALUES (6, 1, CAST(N'2024-01-19T00:00:00.000' AS DateTime), CAST(100.00 AS Decimal(18, 2)), NULL, 2, 2)
INSERT [dbo].[Transacciones] ([Id], [UsuarioId], [FechaTransaccion], [Monto], [Nota], [CuentaId], [CategoriaId]) VALUES (7, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(50.00 AS Decimal(18, 2)), NULL, 2, 5)
INSERT [dbo].[Transacciones] ([Id], [UsuarioId], [FechaTransaccion], [Monto], [Nota], [CuentaId], [CategoriaId]) VALUES (8, 1, CAST(N'2024-01-31T00:00:00.000' AS DateTime), CAST(500.00 AS Decimal(18, 2)), NULL, 2, 2)
INSERT [dbo].[Transacciones] ([Id], [UsuarioId], [FechaTransaccion], [Monto], [Nota], [CuentaId], [CategoriaId]) VALUES (1006, 1, CAST(N'2023-12-11T00:00:00.000' AS DateTime), CAST(500.00 AS Decimal(18, 2)), NULL, 2, 2)
INSERT [dbo].[Transacciones] ([Id], [UsuarioId], [FechaTransaccion], [Monto], [Nota], [CuentaId], [CategoriaId]) VALUES (1007, 1, CAST(N'2024-01-20T00:00:00.000' AS DateTime), CAST(25.00 AS Decimal(18, 2)), NULL, 2, 5)
INSERT [dbo].[Transacciones] ([Id], [UsuarioId], [FechaTransaccion], [Monto], [Nota], [CuentaId], [CategoriaId]) VALUES (1008, 6, CAST(N'2024-01-22T00:00:00.000' AS DateTime), CAST(2000.00 AS Decimal(18, 2)), NULL, 5, 8)
INSERT [dbo].[Transacciones] ([Id], [UsuarioId], [FechaTransaccion], [Monto], [Nota], [CuentaId], [CategoriaId]) VALUES (1009, 6, CAST(N'2024-01-22T00:00:00.000' AS DateTime), CAST(15.00 AS Decimal(18, 2)), NULL, 5, 9)
SET IDENTITY_INSERT [dbo].[Transacciones] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([Id], [Email], [EmailNormalizado], [PasswordHash]) VALUES (1, N'prueba@hotmail.com', N'PRUEBA@HOTMAIL.COM', N'abc')
INSERT [dbo].[Usuarios] ([Id], [Email], [EmailNormalizado], [PasswordHash]) VALUES (2, N'felipe@hotmail.com', N'FELIPE@HOTMAIL.COM', N'AQAAAAEAACcQAAAAEBy0zHn+xO/G28fAhM6xyCqh9Vv8EnwVXhJKYUuqLyDUApj5w9zuZq9cHIO4PIhkuA==')
INSERT [dbo].[Usuarios] ([Id], [Email], [EmailNormalizado], [PasswordHash]) VALUES (3, N'felipe2@hotmail.com', N'FELIPE2@HOTMAIL.COM', N'AQAAAAEAACcQAAAAEDrQ+xijYunkBl9ylghx/Qhc9fmnDLE/QsaoWwlVJo1WgDH0Ug3WCly3iVW7tQ4Abg==')
INSERT [dbo].[Usuarios] ([Id], [Email], [EmailNormalizado], [PasswordHash]) VALUES (4, N'felipe7@hotmail.com', N'FELIPE7@HOTMAIL.COM', N'AQAAAAEAACcQAAAAEHfR2SvX858wEOowRToDyxrNH0pdjmVNS6VGuvkmApDXpldKGHME98WH1cS90hR2HA==')
INSERT [dbo].[Usuarios] ([Id], [Email], [EmailNormalizado], [PasswordHash]) VALUES (5, N'felipe3@hotmail.com', N'FELIPE3@HOTMAIL.COM', N'AQAAAAEAACcQAAAAEFTSE2P5/iqFhGM+G/QxhalZUTZpu5xgXS8BbSZa+/rquss4Mk6DaFsd1d/IrBSdVw==')
INSERT [dbo].[Usuarios] ([Id], [Email], [EmailNormalizado], [PasswordHash]) VALUES (6, N'felipe4@hotmail.com', N'FELIPE4@HOTMAIL.COM', N'AQAAAAEAACcQAAAAEMSvqXESDGvt8NoAwMnNjXB9w4d73nHLTodakNdhU5N6nGfMdCDCAJp15fdR4WMJPA==')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[Categorias]  WITH CHECK ADD  CONSTRAINT [FK_Categorias_TiposOperaciones] FOREIGN KEY([TipoOperacionId])
REFERENCES [dbo].[TiposOperaciones] ([Id])
GO
ALTER TABLE [dbo].[Categorias] CHECK CONSTRAINT [FK_Categorias_TiposOperaciones]
GO
ALTER TABLE [dbo].[Categorias]  WITH CHECK ADD  CONSTRAINT [FK_Categorias_Usuarios] FOREIGN KEY([UsuarioId])
REFERENCES [dbo].[Usuarios] ([Id])
GO
ALTER TABLE [dbo].[Categorias] CHECK CONSTRAINT [FK_Categorias_Usuarios]
GO
ALTER TABLE [dbo].[Cuentas]  WITH CHECK ADD  CONSTRAINT [FK_Cuentas_TiposCuentas] FOREIGN KEY([TipoCuentaId])
REFERENCES [dbo].[TiposCuentas] ([Id])
GO
ALTER TABLE [dbo].[Cuentas] CHECK CONSTRAINT [FK_Cuentas_TiposCuentas]
GO
ALTER TABLE [dbo].[TiposCuentas]  WITH CHECK ADD  CONSTRAINT [FK_TiposCuentas_Usuarios] FOREIGN KEY([UsuarioId])
REFERENCES [dbo].[Usuarios] ([Id])
GO
ALTER TABLE [dbo].[TiposCuentas] CHECK CONSTRAINT [FK_TiposCuentas_Usuarios]
GO
ALTER TABLE [dbo].[Transacciones]  WITH CHECK ADD  CONSTRAINT [FK_Transacciones_Categorias] FOREIGN KEY([CategoriaId])
REFERENCES [dbo].[Categorias] ([Id])
GO
ALTER TABLE [dbo].[Transacciones] CHECK CONSTRAINT [FK_Transacciones_Categorias]
GO
ALTER TABLE [dbo].[Transacciones]  WITH CHECK ADD  CONSTRAINT [FK_Transacciones_Cuentas] FOREIGN KEY([CuentaId])
REFERENCES [dbo].[Cuentas] ([Id])
GO
ALTER TABLE [dbo].[Transacciones] CHECK CONSTRAINT [FK_Transacciones_Cuentas]
GO
ALTER TABLE [dbo].[Transacciones]  WITH CHECK ADD  CONSTRAINT [FK_Transacciones_Usuarios] FOREIGN KEY([UsuarioId])
REFERENCES [dbo].[Usuarios] ([Id])
GO
ALTER TABLE [dbo].[Transacciones] CHECK CONSTRAINT [FK_Transacciones_Usuarios]
GO
/****** Object:  StoredProcedure [dbo].[CrearDatosUsuarioNuevo]    Script Date: 1/30/2024 4:01:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CrearDatosUsuarioNuevo]
	@UsuarioId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	DECLARE @Efectivo nvarchar(50) = 'Efectivo';
	DECLARE @CuentasDeBanco nvarchar(50) = 'Cuentas de Banco';
	DECLARE @Tarjetas nvarchar(50) = 'Tarjetas';

	INSERT INTO TiposCuentas(Nombre, UsuarioId, Orden)
	VALUES (@Efectivo, @UsuarioId, 1),
	(@CuentasDeBanco, @UsuarioId, 2),
	(@Tarjetas, @UsuarioId, 3);

	INSERT INTO Cuentas (Nombre, Balance, TipoCuentaId)
	SELECT Nombre, 0, Id
	FROM TiposCuentas
	WHERE UsuarioId = @UsuarioId

	INSERT INTO Categorias(Nombre, TipoOperacionId, UsuarioId)
	VALUES
	('Libros', 2, @UsuarioId),
	('Salario', 1, @UsuarioId),
	('Mesada', 1, @UsuarioId),
	('Comida', 2, @UsuarioId)
END
GO
/****** Object:  StoredProcedure [dbo].[TiposCuentas_Insertar]    Script Date: 1/30/2024 4:01:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TiposCuentas_Insertar] 
	@Nombre nvarchar(50),
	@UsuarioId int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @Orden int;
	SELECT @Orden = COALESCE(MAX(Orden), 0)+1
	FROM TiposCuentas
	WHERE UsuarioId = @UsuarioId

	INSERT INTO TiposCuentas(Nombre, UsuarioId, Orden)
	VALUES (@Nombre, @UsuarioId, @Orden);

	SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[Transacciones_Actualizar]    Script Date: 1/30/2024 4:01:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Transacciones_Actualizar]
	-- Add the parameters for the stored procedure here
	@Id int,
	@FechaTransaccion datetime,
	@Monto decimal(18,2),
	@MontoAnterior decimal(18,2),
	@CuentaId int,
	@CuentaAnteriorId int,
	@CategoriaId int,
	@Nota nvarchar(1000) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Revertir transaccion anterior
	UPDATE Cuentas
	SET Balance -= @MontoAnterior
	WHERE Id = @CuentaAnteriorId;

	--Realizar nueva transaccion
	UPDATE Cuentas
	SET Balance += @Monto
	WHERE Id = @CuentaId;

	UPDATE Transacciones
	SET Monto = ABS(@Monto), FechaTransaccion = @FechaTransaccion,
	CategoriaId = @CategoriaId, CuentaId = @CuentaId, Nota = @Nota
	WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[Transacciones_Borrar]    Script Date: 1/30/2024 4:01:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Transacciones_Borrar]
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @Monto decimal(18,2);
	DECLARE @CuentaId int;
	DECLARE @TipoOperacionId int;

	SELECT @Monto = Monto, @CuentaId = CuentaId, @TipoOperacionId = cat.TipoOperacionId 
	FROM Transacciones
	inner join Categorias cat
	ON cat.Id = Transacciones.CategoriaId
	WHERE Transacciones.Id = @Id

	DECLARE @FactorMultiplicativo int = 1;

	IF(@TipoOperacionId = 2)
		SET @FactorMultiplicativo = -1

	SET @Monto = @Monto * @FactorMultiplicativo;

	UPDATE Cuentas
	SET Balance -= @Monto
	WHERE Id = @CuentaId

	DELETE Transacciones
	WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[Transacciones_Insertar]    Script Date: 1/30/2024 4:01:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Transacciones_Insertar]
	@UsuarioId int,
	@FechaTransaccion date,
	@Monto decimal(18,2),
	@CategoriaId int,
	@CuentaId int,
	@Nota nvarchar(1000) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Transacciones(UsuarioId, FechaTransaccion, Monto, CategoriaId, CuentaId, Nota)
	VALUES(@UsuarioId, @FechaTransaccion, ABS(@Monto), @CategoriaId, @CuentaId, @Nota)

	UPDATE Cuentas
	SET Balance += @Monto
	WHERE Id = @CuentaId;

	SELECT SCOPE_IDENTITY();
END
GO
USE [master]
GO
ALTER DATABASE [ManejoPresupuesto] SET  READ_WRITE 
GO
