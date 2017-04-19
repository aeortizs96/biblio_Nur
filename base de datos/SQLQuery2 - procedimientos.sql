USE [BiblioNur]

create procedure [dbo].[usp-Seguridad-insRegistro]
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