USE [BiblioNur]

<<<<<<< HEAD
-- =============================================
-- Author:		<Andrea Ortiz>
-- Create date: <10/04/2017>
-- Description:	<Inserta Usuarios>
-- =============================================
Create proc usp_Seguridad_insRegistro
=======
create procedure [dbo].[usp-Seguridad-insRegistro]
>>>>>>> a80d6fd267ddea15c345aded1e5b7858eab16b8b
	@correo varchar(80),
	@contrasena varchar(100),
	@nombreCompleto varchar (100),
	@nombreUsuario varchar(8)
as
begin
  INSERT INTO tbl_Usuario (correo, contrasena, nombreCompleto, nombreUsuario ) 
   values(@correo,@contrasena,@nombreCompleto,@nombreUsuario)
end

ALTER procedure [dbo].[usp-Seguridad-validarLogin] 
@nombreUsuario varchar(30),@contrasena varchar(20), @usuarioId int output
as
select @usuarioId= usuarioId from tbl_Usuario where contrasena= @contrasena and nombreUsuario=@nombreUsuario;
return