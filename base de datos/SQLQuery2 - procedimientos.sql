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

-- =============================================
-- Author:		<Marcelo Castaño Reyes>
-- Create date: <15/04/2017>
-- Description:	<Valida el login de usuario>
-- =============================================

create procedure [dbo].[usp-Seguridad-validarLogin] 
@nombreUsuario varchar(30),@contrasena varchar(20), @usuarioId int output
as
select @usuarioId= usuarioId from tbl_Usuario where contrasena= @contrasena and nombreUsuario=@nombreUsuario;
return

--declare @usuarioId int 
--exec [dbo].[usp-Seguridad-validarLogin] '482121','pepito',@usuarioId output;
--select @usuarioId as Usuario, nombreCompleto from tbl_Usuario where usuarioId=@usuarioId ;
