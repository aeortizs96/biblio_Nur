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
-- Description:	<Valida Login de Usuarios>
-- =============================================


Create procedure usp_Seguridad_validarLogin  
@nombreUsuario varchar(20),@contrasena varchar(100), @usuarioId int output
as
select @usuarioId= usuarioId from tbl_Usuario where contrasena= @contrasena and nombreUsuario=@nombreUsuario;
return

-- =============================================
-- Author:		<Marcelo Castaño>
-- Create date: <24/04/2017>
-- Description:	<Modifica y elimina Usuarios>
-- =============================================

Create procedure usp_Seguridad_abmUsuario
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

exec 


-- =============================================
-- Author:		<Marcelo Castaño>
-- Create date: <24/04/2017>
-- Description:	<Procedimiento que muestra el listado de Usuarios>
-- =============================================

Create procedure usp_Seguridad_listadoUsuarios
As 
Select * from tbl_Usuario order by nombreCompleto
return

-- =============================================
-- Author:		<Marcelo Castaño>
-- Create date: <24/04/2017>
-- Description:	<Procedimiento que selecciona Usuario>
-- =============================================

Create procedure usp_Seguridad_seleccionaUsuario
(
@usuarioId int 
)
As 
Select * from tbl_Usuario where usuarioId = @usuarioId
return

