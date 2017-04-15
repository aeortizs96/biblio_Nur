USE [BiblioNur]

-- =============================================
-- Author:		<Andrea Ortiz>
-- Create date: <10/04/2017>
-- Description:	<Inserta Usuarios>
-- =============================================
Create proc [dbo].[usp-Seguridad-insRegistro]
	@correo varchar(80),
	@contrasena varchar(100),
	@nombreCompleto varchar (100),
	@nombreUsuario varchar(8)
as
begin
  INSERT INTO tbl_Usuario (correo, contrasena, nombreCompleto, nombreUsuario ) 
   values(@correo,@contrasena,@nombreCompleto,@nombreUsuario)
end



