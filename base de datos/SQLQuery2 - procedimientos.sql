USE [BiblioNur]

create procedure [dbo].[insRegistro]
	@correo varchar(80),
	@contrasena varchar(100),
	@nombreCompleto varchar (100),
	@nombreUsuario varchar(8)
as
begin
  INSERT INTO tbl_Usuario (correo, contrasena, nombreCompleto, nombreUsuario ) 
   values(@correo,@contrasena,@nombreCompleto,@nombreUsuario)
end

create procedure [dbo].[usp-Seguridad-validarLogin] 
@nombreUsuario varchar(30),@contrasena varchar(20), @usuarioId int output
as
select @usuarioId= usuarioId from tbl_Usuario where contrasena= @contrasena and nombreUsuario=@nombreUsuario;
return

exec insRegistro 'pepito123@gmail.com','pepito','Pepito Perez','482121';
exec insRegistro 'aamador@gmail.com','ama','Amador Arlindo','512434';


