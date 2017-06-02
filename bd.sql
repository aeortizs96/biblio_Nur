USE [BiblioNur]
GO
/****** Object:  Table [dbo].[tbl_Permiso]    Script Date: 06/02/2017 16:10:34 ******/
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
/****** Object:  Table [dbo].[tbl_Libros]    Script Date: 06/02/2017 16:10:34 ******/
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
/****** Object:  Table [dbo].[tbl_Usuario]    Script Date: 06/02/2017 16:10:34 ******/
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
/****** Object:  Table [dbo].[tbl_Rol]    Script Date: 06/02/2017 16:10:34 ******/
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
/****** Object:  Table [dbo].[tbl_Reservas]    Script Date: 06/02/2017 16:10:34 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Seguridad_validarLogin]    Script Date: 06/02/2017 16:10:36 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Seguridad_seleccionaUsuario]    Script Date: 06/02/2017 16:10:36 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Seguridad_listadoUsuarios]    Script Date: 06/02/2017 16:10:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[usp_Seguridad_listadoUsuarios]
As 
Select * from tbl_Usuario order by nombreCompleto
return
GO
/****** Object:  StoredProcedure [dbo].[usp_Seguridad_insRegistro]    Script Date: 06/02/2017 16:10:36 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Seguridad_abmUsuario]    Script Date: 06/02/2017 16:10:36 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Biblioteca_seleccionaLibro]    Script Date: 06/02/2017 16:10:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[usp_Biblioteca_seleccionaLibro]
(
@mfn int 
)
As 
Select * from tbl_Libros where mfn = @mfn
return
GO
/****** Object:  StoredProcedure [dbo].[usp_Biblioteca_listadoLibros]    Script Date: 06/02/2017 16:10:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[usp_Biblioteca_listadoLibros]
As 
Select * from tbl_Libros 
return
GO
/****** Object:  StoredProcedure [dbo].[usp_Biblioteca_abmReserva]    Script Date: 06/02/2017 16:10:36 ******/
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
/****** Object:  Table [dbo].[tbl_UsuarioRol]    Script Date: 06/02/2017 16:10:36 ******/
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
/****** Object:  Table [dbo].[tbl_UsuarioPermiso]    Script Date: 06/02/2017 16:10:36 ******/
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
/****** Object:  Table [dbo].[tbl_PermisoRol]    Script Date: 06/02/2017 16:10:36 ******/
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
/****** Object:  ForeignKey [FK__tbl_Usuar__rolId__145C0A3F]    Script Date: 06/02/2017 16:10:36 ******/
ALTER TABLE [dbo].[tbl_UsuarioRol]  WITH CHECK ADD FOREIGN KEY([rolId])
REFERENCES [dbo].[tbl_Rol] ([rolId])
GO
/****** Object:  ForeignKey [FK__tbl_Usuar__usuar__15502E78]    Script Date: 06/02/2017 16:10:36 ******/
ALTER TABLE [dbo].[tbl_UsuarioRol]  WITH CHECK ADD FOREIGN KEY([usuarioId])
REFERENCES [dbo].[tbl_Usuario] ([usuarioId])
GO
/****** Object:  ForeignKey [FK__tbl_Usuar__permi__164452B1]    Script Date: 06/02/2017 16:10:36 ******/
ALTER TABLE [dbo].[tbl_UsuarioPermiso]  WITH CHECK ADD FOREIGN KEY([permisoId])
REFERENCES [dbo].[tbl_Permiso] ([permisoId])
GO
/****** Object:  ForeignKey [FK__tbl_Usuar__usuar__173876EA]    Script Date: 06/02/2017 16:10:36 ******/
ALTER TABLE [dbo].[tbl_UsuarioPermiso]  WITH CHECK ADD FOREIGN KEY([usuarioId])
REFERENCES [dbo].[tbl_Usuario] ([usuarioId])
GO
/****** Object:  ForeignKey [FK__tbl_Permi__permi__1920BF5C]    Script Date: 06/02/2017 16:10:36 ******/
ALTER TABLE [dbo].[tbl_PermisoRol]  WITH CHECK ADD FOREIGN KEY([permisoId])
REFERENCES [dbo].[tbl_Permiso] ([permisoId])
GO
/****** Object:  ForeignKey [FK__tbl_Permi__rolId__182C9B23]    Script Date: 06/02/2017 16:10:36 ******/
ALTER TABLE [dbo].[tbl_PermisoRol]  WITH CHECK ADD FOREIGN KEY([rolId])
REFERENCES [dbo].[tbl_Rol] ([rolId])
GO
