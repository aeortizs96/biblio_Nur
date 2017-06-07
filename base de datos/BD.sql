USE [master]
GO
/****** Object:  Database [BiblioNur]    Script Date: 06/06/2017 20:39:56 ******/
CREATE DATABASE [BiblioNur] ON  PRIMARY 
( NAME = N'BiblioNur', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\BiblioNur.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BiblioNur_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\BiblioNur_log.LDF' , SIZE = 576KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BiblioNur] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BiblioNur].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BiblioNur] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [BiblioNur] SET ANSI_NULLS OFF
GO
ALTER DATABASE [BiblioNur] SET ANSI_PADDING OFF
GO
ALTER DATABASE [BiblioNur] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [BiblioNur] SET ARITHABORT OFF
GO
ALTER DATABASE [BiblioNur] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [BiblioNur] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [BiblioNur] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [BiblioNur] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [BiblioNur] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [BiblioNur] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [BiblioNur] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [BiblioNur] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [BiblioNur] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [BiblioNur] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [BiblioNur] SET  ENABLE_BROKER
GO
ALTER DATABASE [BiblioNur] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [BiblioNur] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [BiblioNur] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [BiblioNur] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [BiblioNur] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [BiblioNur] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [BiblioNur] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [BiblioNur] SET  READ_WRITE
GO
ALTER DATABASE [BiblioNur] SET RECOVERY FULL
GO
ALTER DATABASE [BiblioNur] SET  MULTI_USER
GO
ALTER DATABASE [BiblioNur] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [BiblioNur] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'BiblioNur', N'ON'
GO
USE [BiblioNur]
GO
/****** Object:  Table [dbo].[tbl_Permiso]    Script Date: 06/06/2017 20:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Permiso](
	[permisoId] [varchar](20) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[permisoId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Libros]    Script Date: 06/06/2017 20:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Libros](
	[mfn] [varchar](30) NOT NULL,
	[titulo] [varchar](25) NOT NULL,
	[autor] [int] NOT NULL,
	[editorial] [varchar](20) NOT NULL,
	[estados] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[mfn] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Autor]    Script Date: 06/06/2017 20:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Autor](
	[autorId] [int] NOT NULL,
	[autor_nombre] [varchar](70) NULL,
	[autor_Nacion] [varchar](60) NULL,
PRIMARY KEY CLUSTERED 
(
	[autorId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Usuario]    Script Date: 06/06/2017 20:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Usuario](
	[usuarioId] [int] IDENTITY(1,1) NOT NULL,
	[correo] [varchar](80) NOT NULL,
	[contrasena] [varchar](100) NOT NULL,
	[nombreCompleto] [varchar](100) NOT NULL,
	[nombreUsuario] [varchar](8) NOT NULL,
	[sexo] [varchar](12) NOT NULL,
	[tipo] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[usuarioId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Rol]    Script Date: 06/06/2017 20:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Rol](
	[rolId] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[rolId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Reservas]    Script Date: 06/06/2017 20:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Reservas](
	[reservaId] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [varchar](20) NULL,
	[mfnLibro] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[reservaId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_UsuarioRol]    Script Date: 06/06/2017 20:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_UsuarioRol](
	[rolId] [int] NOT NULL,
	[usuarioId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[rolId] ASC,
	[usuarioId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_UsuarioPermiso]    Script Date: 06/06/2017 20:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_UsuarioPermiso](
	[usuarioId] [int] NOT NULL,
	[permisoId] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[usuarioId] ASC,
	[permisoId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Prestamos]    Script Date: 06/06/2017 20:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Prestamos](
	[prestamoId] [int] IDENTITY(1,1) NOT NULL,
	[fechaInicio] [varchar](20) NULL,
	[fechaFin] [varchar](20) NULL,
	[libroMFN] [varchar](30) NULL,
	[usuarioId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[prestamoId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_PermisoRol]    Script Date: 06/06/2017 20:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_PermisoRol](
	[rolId] [int] NOT NULL,
	[permisoId] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[rolId] ASC,
	[permisoId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Seguridad_validarLogin]    Script Date: 06/06/2017 20:39:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[usp_Seguridad_validarLogin]  
@nombreUsuario varchar(20),@contrasena varchar(100), @usuarioId int output
as
select @usuarioId= usuarioId from tbl_Usuario where contrasena= @contrasena and nombreUsuario=@nombreUsuario;
return
GO
/****** Object:  StoredProcedure [dbo].[usp_Seguridad_seleccionaUsuario]    Script Date: 06/06/2017 20:39:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[usp_Seguridad_seleccionaUsuario]
(
@usuarioId int 
)
As 
Select * from tbl_Usuario where usuarioId = @usuarioId
return
GO
/****** Object:  StoredProcedure [dbo].[usp_Seguridad_listadoUsuarios]    Script Date: 06/06/2017 20:39:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[usp_Seguridad_listadoUsuarios]
As 
Select * from tbl_Usuario order by nombreCompleto
return
GO
/****** Object:  StoredProcedure [dbo].[usp_Seguridad_insRegistro]    Script Date: 06/06/2017 20:39:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[usp_Seguridad_insRegistro]
	@correo varchar(80),
	@contrasena varchar(100),
	@nombreCompleto varchar (100),
	@nombreUsuario varchar(20),
	@sexo varchar(12),
	@tipo varchar(15)
	
as
begin
  INSERT INTO tbl_Usuario (correo, contrasena, nombreCompleto, nombreUsuario, sexo, tipo ) 
   values(@correo,@contrasena,@nombreCompleto,@nombreUsuario,@sexo,@tipo )
end
GO
/****** Object:  StoredProcedure [dbo].[usp_Seguridad_abmUsuario]    Script Date: 06/06/2017 20:39:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[usp_Seguridad_abmUsuario]
(
@Accion					nvarchar(10),
@usuarioId				int,
@correo					varchar(80),
@contrasena				varchar(100),
@nombreCompleto			varchar (100) ,
@nombreUsuario			varchar(8),
@sexo					varchar(12),
@tipo					varchar(15)
)
AS
if @Accion = 'BORRAR'
BEGIN 
DELETE FROM tbl_Usuario where usuarioId = @usuarioId
end
if @Accion = 'MODIFICAR'
BEGIN 
UPDATE tbl_Usuario SET
correo = @correo, contrasena=@contrasena, nombreCompleto=@nombreCompleto, 
nombreUsuario=@nombreUsuario, sexo=@sexo, tipo=@tipo
WHERE usuarioId = @usuarioId
end

RETURN
GO
/****** Object:  StoredProcedure [dbo].[usp_Biblioteca_seleccionaLibro]    Script Date: 06/06/2017 20:39:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_Biblioteca_seleccionaLibro]
(
@mfn varchar(30) 
)
As 
Select * from tbl_Libros where mfn = @mfn
return
GO
/****** Object:  StoredProcedure [dbo].[usp_Biblioteca_listadoLibros]    Script Date: 06/06/2017 20:39:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[usp_Biblioteca_listadoLibros]
As 
Select * from tbl_Libros 
return
GO
/****** Object:  StoredProcedure [dbo].[usp_Biblioteca_abmReserva]    Script Date: 06/06/2017 20:39:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[usp_Biblioteca_abmReserva]
(
@Accion				nvarchar(10),
@reservaId			int,
@fecha				varchar(20),
@mfnLibro			varchar(30)
)
AS
if @Accion = 'AGREGAR'
BEGIN 
INSERT INTO tbl_Reservas(fecha, mfnLibro)values (@fecha, @mfnLibro)
end
if @Accion = 'BORRAR'
BEGIN 
DELETE FROM tbl_Reservas where reservaId = @reservaId	
end
if @Accion = 'MODIFICAR'
BEGIN 
UPDATE tbl_Reservas SET
fecha = @fecha, mfnLibro=@mfnLibro
WHERE reservaId = @reservaId
end

RETURN;
GO
/****** Object:  StoredProcedure [dbo].[usp_Biblioteca_abmPrestamo]    Script Date: 06/06/2017 20:39:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[usp_Biblioteca_abmPrestamo]
(
@Accion				nvarchar(10),
@fechaInicio		varchar(20),
@fechaFin			varchar(20),
@mfnLibro			varchar(30),
@usuarioId			varchar(30)
)
AS

if @Accion = 'AGREGAR'
BEGIN 
declare @usua int;
set @usua = (select usuarioId from tbl_Usuario where nombreUsuario = @usuarioId);
INSERT INTO tbl_Prestamos values (@fechaInicio,@fechaFin, @mfnLibro,@usua);
end
GO
/****** Object:  ForeignKey [FK__tbl_Usuar__rolId__239E4DCF]    Script Date: 06/06/2017 20:39:56 ******/
ALTER TABLE [dbo].[tbl_UsuarioRol]  WITH CHECK ADD FOREIGN KEY([rolId])
REFERENCES [dbo].[tbl_Rol] ([rolId])
GO
/****** Object:  ForeignKey [FK__tbl_Usuar__usuar__24927208]    Script Date: 06/06/2017 20:39:56 ******/
ALTER TABLE [dbo].[tbl_UsuarioRol]  WITH CHECK ADD FOREIGN KEY([usuarioId])
REFERENCES [dbo].[tbl_Usuario] ([usuarioId])
GO
/****** Object:  ForeignKey [FK__tbl_Usuar__permi__25869641]    Script Date: 06/06/2017 20:39:56 ******/
ALTER TABLE [dbo].[tbl_UsuarioPermiso]  WITH CHECK ADD FOREIGN KEY([permisoId])
REFERENCES [dbo].[tbl_Permiso] ([permisoId])
GO
/****** Object:  ForeignKey [FK__tbl_Usuar__usuar__267ABA7A]    Script Date: 06/06/2017 20:39:56 ******/
ALTER TABLE [dbo].[tbl_UsuarioPermiso]  WITH CHECK ADD FOREIGN KEY([usuarioId])
REFERENCES [dbo].[tbl_Usuario] ([usuarioId])
GO
/****** Object:  ForeignKey [FK__tbl_Prest__libro__398D8EEE]    Script Date: 06/06/2017 20:39:56 ******/
ALTER TABLE [dbo].[tbl_Prestamos]  WITH CHECK ADD FOREIGN KEY([libroMFN])
REFERENCES [dbo].[tbl_Libros] ([mfn])
GO
/****** Object:  ForeignKey [FK__tbl_Prest__usuar__3B75D760]    Script Date: 06/06/2017 20:39:56 ******/
ALTER TABLE [dbo].[tbl_Prestamos]  WITH CHECK ADD FOREIGN KEY([usuarioId])
REFERENCES [dbo].[tbl_Usuario] ([usuarioId])
GO
/****** Object:  ForeignKey [FK__tbl_Permi__permi__276EDEB3]    Script Date: 06/06/2017 20:39:56 ******/
ALTER TABLE [dbo].[tbl_PermisoRol]  WITH CHECK ADD FOREIGN KEY([permisoId])
REFERENCES [dbo].[tbl_Permiso] ([permisoId])
GO
/****** Object:  ForeignKey [FK__tbl_Permi__rolId__286302EC]    Script Date: 06/06/2017 20:39:56 ******/
ALTER TABLE [dbo].[tbl_PermisoRol]  WITH CHECK ADD FOREIGN KEY([rolId])
REFERENCES [dbo].[tbl_Rol] ([rolId])
GO
