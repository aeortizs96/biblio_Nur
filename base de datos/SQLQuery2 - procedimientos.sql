USE [BiblioNur]


-- =============================================
-- Author:		<Marcelo Castaño>
-- Create date: <10/04/2017>
-- Description:	<Inserta Usuarios>
-- =============================================
alter proc usp_Seguridad_insRegistro
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

-- =============================================
-- Author:		<Marcelo Castaño>
-- Create date: <15/04/2017>
-- Description:	<Inserta Usuarios>
-- =============================================


Create procedure usp_Seguridad_validarLogin  
@nombreUsuario varchar(20),@contrasena varchar(100), @usuarioId int output
as
select @usuarioId= usuarioId from tbl_Usuario where contrasena= @contrasena and nombreUsuario=@nombreUsuario;
return