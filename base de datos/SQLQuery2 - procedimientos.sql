USE [BiblioNur]
GO
/****** Object:  StoredProcedure [dbo].[insPruebas]    Script Date: 08/30/2016 20:58:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Alter proc [dbo].[insRegistro]
	@correo varchar(80),
	@contrasena varchar(100),
	@nombreCompleto varchar (100),
	@nombreUsuario varchar(8)
as
begin
  INSERT INTO tbl_Usuario (correo, contrasena, nombreCompleto, nombreUsuario ) 
   values(@correo,@contrasena,@nombreCompleto,@nombreUsuario)
end


exec insRegistro 'pepito123@gmail.com','pepito','Pepito Perez','482121';
exec insRegistro 'aamador@gmail.com','ama','Amador Arlindo','512434';


