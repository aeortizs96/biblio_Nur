USE [BiblioNur]
GO
/****** Object:  Table [dbo].[tbl_Usuario]    Script Date: 06/16/2017 20:24:06 ******/
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
/****** Object:  Table [dbo].[tbl_Rol]    Script Date: 06/16/2017 20:24:06 ******/
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
/****** Object:  Table [dbo].[tbl_Reservas]    Script Date: 06/16/2017 20:24:06 ******/
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
/****** Object:  Table [dbo].[tbl_Autor]    Script Date: 06/16/2017 20:24:06 ******/
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
/****** Object:  Table [dbo].[tbl_Permiso]    Script Date: 06/16/2017 20:24:06 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Biblioteca_abmReserva]    Script Date: 06/16/2017 20:24:04 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Seguridad_validarLogin]    Script Date: 06/16/2017 20:24:04 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Seguridad_seleccionaUsuario]    Script Date: 06/16/2017 20:24:04 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Seguridad_listadoUsuarios]    Script Date: 06/16/2017 20:24:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[usp_Seguridad_listadoUsuarios]
As 
Select * from tbl_Usuario order by nombreCompleto
return
GO
/****** Object:  StoredProcedure [dbo].[usp_Seguridad_insRegistro]    Script Date: 06/16/2017 20:24:04 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Seguridad_abmUsuario]    Script Date: 06/16/2017 20:24:04 ******/
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
/****** Object:  Table [dbo].[tbl_Libros]    Script Date: 06/16/2017 20:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Libros](
	[mfn] [varchar](30) NOT NULL,
	[titulo] [varchar](25) NOT NULL,
	[editorial] [varchar](20) NOT NULL,
	[estados] [int] NOT NULL,
	[autorId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[mfn] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_UsuarioRol]    Script Date: 06/16/2017 20:24:06 ******/
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
/****** Object:  Table [dbo].[tbl_UsuarioPermiso]    Script Date: 06/16/2017 20:24:06 ******/
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
/****** Object:  Table [dbo].[tbl_PermisoRol]    Script Date: 06/16/2017 20:24:06 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Biblioteca_abmLibro]    Script Date: 06/16/2017 20:24:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_Biblioteca_abmLibro]
(
@Accion					varchar(10),
@nombre					varchar(80),
@mfn					varchar(30),
@titulo					varchar (25) ,
@editorial				varchar(20),
@estado					int
)
AS
if @Accion = 'AGREGAR'
BEGIN
declare @autor int = 0; 
set @autor = (select autorId from tbl_Autor where autor_nombre = @nombre); 
INSERT INTO tbl_Libros(mfn,titulo,editorial,estados,autorId)values (@mfn, @titulo,@editorial,@estado,@autor);
end
else if @Accion = 'BORRAR'
BEGIN 
DELETE FROM tbl_Libros where mfn = @mfn
end
else if @Accion = 'MODIFICAR'
BEGIN 
UPDATE tbl_Libros SET
titulo = @titulo, editorial=@editorial, estados=@estado 
WHERE mfn = @mfn
end

RETURN
GO
/****** Object:  Table [dbo].[tbl_Prestamos]    Script Date: 06/16/2017 20:24:06 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Biblioteca_seleccionaLibro]    Script Date: 06/16/2017 20:24:04 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Biblioteca_listadoLibros]    Script Date: 06/16/2017 20:24:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_Biblioteca_listadoLibros]
As 
SELECT      dbo.tbl_Libros.mfn,dbo.tbl_Autor.autor_nombre, dbo.tbl_Libros.titulo, dbo.tbl_Libros.editorial, dbo.tbl_Libros.estados
FROM         dbo.tbl_Autor INNER JOIN
                      dbo.tbl_Libros ON dbo.tbl_Autor.autorId = dbo.tbl_Libros.autorId AND dbo.tbl_Autor.autorId = dbo.tbl_Libros.autorId
GO
/****** Object:  StoredProcedure [dbo].[usp_Biblioteca_abmPrestamo]    Script Date: 06/16/2017 20:24:04 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_BIBLIOTECA_GetPrestamos]    Script Date: 06/16/2017 20:24:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Bruno Rocha
-- Create date: 16/06/2017
-- Description:	Obtiene los prestamos de libro
-- =============================================
CREATE PROCEDURE [dbo].[usp_BIBLIOTECA_GetPrestamos]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT p.[libroMFN], l.[titulo], l.[editorial], p.[fechaInicio], p.[fechaFin]
	FROM [dbo].[tbl_Libros] l INNER JOIN
	[dbo].[tbl_Prestamos] p ON l.[mfn] = p.[libroMFN] AND l.[mfn] = p.[libroMFN]
END
GO
/****** Object:  ForeignKey [FK__tbl_Libro__autor__2D27B809]    Script Date: 06/16/2017 20:24:06 ******/
ALTER TABLE [dbo].[tbl_Libros]  WITH CHECK ADD FOREIGN KEY([autorId])
REFERENCES [dbo].[tbl_Autor] ([autorId])
GO
/****** Object:  ForeignKey [FK__tbl_Libro__autor__2E1BDC42]    Script Date: 06/16/2017 20:24:06 ******/
ALTER TABLE [dbo].[tbl_Libros]  WITH CHECK ADD FOREIGN KEY([autorId])
REFERENCES [dbo].[tbl_Autor] ([autorId])
GO
/****** Object:  ForeignKey [FK__tbl_Permi__permi__2F10007B]    Script Date: 06/16/2017 20:24:06 ******/
ALTER TABLE [dbo].[tbl_PermisoRol]  WITH CHECK ADD FOREIGN KEY([permisoId])
REFERENCES [dbo].[tbl_Permiso] ([permisoId])
GO
/****** Object:  ForeignKey [FK__tbl_Permi__permi__300424B4]    Script Date: 06/16/2017 20:24:06 ******/
ALTER TABLE [dbo].[tbl_PermisoRol]  WITH CHECK ADD FOREIGN KEY([permisoId])
REFERENCES [dbo].[tbl_Permiso] ([permisoId])
GO
/****** Object:  ForeignKey [FK__tbl_Permi__rolId__30F848ED]    Script Date: 06/16/2017 20:24:06 ******/
ALTER TABLE [dbo].[tbl_PermisoRol]  WITH CHECK ADD FOREIGN KEY([rolId])
REFERENCES [dbo].[tbl_Rol] ([rolId])
GO
/****** Object:  ForeignKey [FK__tbl_Permi__rolId__31EC6D26]    Script Date: 06/16/2017 20:24:06 ******/
ALTER TABLE [dbo].[tbl_PermisoRol]  WITH CHECK ADD FOREIGN KEY([rolId])
REFERENCES [dbo].[tbl_Rol] ([rolId])
GO
/****** Object:  ForeignKey [FK__tbl_Prest__libro__32E0915F]    Script Date: 06/16/2017 20:24:06 ******/
ALTER TABLE [dbo].[tbl_Prestamos]  WITH CHECK ADD FOREIGN KEY([libroMFN])
REFERENCES [dbo].[tbl_Libros] ([mfn])
GO
/****** Object:  ForeignKey [FK__tbl_Prest__libro__33D4B598]    Script Date: 06/16/2017 20:24:06 ******/
ALTER TABLE [dbo].[tbl_Prestamos]  WITH CHECK ADD FOREIGN KEY([libroMFN])
REFERENCES [dbo].[tbl_Libros] ([mfn])
GO
/****** Object:  ForeignKey [FK__tbl_Prest__usuar__34C8D9D1]    Script Date: 06/16/2017 20:24:06 ******/
ALTER TABLE [dbo].[tbl_Prestamos]  WITH CHECK ADD FOREIGN KEY([usuarioId])
REFERENCES [dbo].[tbl_Usuario] ([usuarioId])
GO
/****** Object:  ForeignKey [FK__tbl_Prest__usuar__35BCFE0A]    Script Date: 06/16/2017 20:24:06 ******/
ALTER TABLE [dbo].[tbl_Prestamos]  WITH CHECK ADD FOREIGN KEY([usuarioId])
REFERENCES [dbo].[tbl_Usuario] ([usuarioId])
GO
/****** Object:  ForeignKey [FK__tbl_Usuar__permi__36B12243]    Script Date: 06/16/2017 20:24:06 ******/
ALTER TABLE [dbo].[tbl_UsuarioPermiso]  WITH CHECK ADD FOREIGN KEY([permisoId])
REFERENCES [dbo].[tbl_Permiso] ([permisoId])
GO
/****** Object:  ForeignKey [FK__tbl_Usuar__permi__37A5467C]    Script Date: 06/16/2017 20:24:06 ******/
ALTER TABLE [dbo].[tbl_UsuarioPermiso]  WITH CHECK ADD FOREIGN KEY([permisoId])
REFERENCES [dbo].[tbl_Permiso] ([permisoId])
GO
/****** Object:  ForeignKey [FK__tbl_Usuar__usuar__38996AB5]    Script Date: 06/16/2017 20:24:06 ******/
ALTER TABLE [dbo].[tbl_UsuarioPermiso]  WITH CHECK ADD FOREIGN KEY([usuarioId])
REFERENCES [dbo].[tbl_Usuario] ([usuarioId])
GO
/****** Object:  ForeignKey [FK__tbl_Usuar__usuar__398D8EEE]    Script Date: 06/16/2017 20:24:06 ******/
ALTER TABLE [dbo].[tbl_UsuarioPermiso]  WITH CHECK ADD FOREIGN KEY([usuarioId])
REFERENCES [dbo].[tbl_Usuario] ([usuarioId])
GO
/****** Object:  ForeignKey [FK__tbl_Usuar__rolId__3A81B327]    Script Date: 06/16/2017 20:24:06 ******/
ALTER TABLE [dbo].[tbl_UsuarioRol]  WITH CHECK ADD FOREIGN KEY([rolId])
REFERENCES [dbo].[tbl_Rol] ([rolId])
GO
/****** Object:  ForeignKey [FK__tbl_Usuar__rolId__3B75D760]    Script Date: 06/16/2017 20:24:06 ******/
ALTER TABLE [dbo].[tbl_UsuarioRol]  WITH CHECK ADD FOREIGN KEY([rolId])
REFERENCES [dbo].[tbl_Rol] ([rolId])
GO
/****** Object:  ForeignKey [FK__tbl_Usuar__usuar__3C69FB99]    Script Date: 06/16/2017 20:24:06 ******/
ALTER TABLE [dbo].[tbl_UsuarioRol]  WITH CHECK ADD FOREIGN KEY([usuarioId])
REFERENCES [dbo].[tbl_Usuario] ([usuarioId])
GO
/****** Object:  ForeignKey [FK__tbl_Usuar__usuar__3D5E1FD2]    Script Date: 06/16/2017 20:24:06 ******/
ALTER TABLE [dbo].[tbl_UsuarioRol]  WITH CHECK ADD FOREIGN KEY([usuarioId])
REFERENCES [dbo].[tbl_Usuario] ([usuarioId])
GO
