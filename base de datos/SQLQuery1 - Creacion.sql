Create database BiblioNur;
use BiblioNur;


Create table tbl_Usuario(
usuarioId int IDENTITY(1,1) PRIMARY KEY NOT NULL,
correo varchar(80) not null,
contrasena varchar(100) not null,
nombreCompleto varchar (100) not null,
nombreUsuario varchar(8)not null
);

Create table tbl_Rol(
rolId int IDENTITY(1,1) PRIMARY KEY not null,
nombre varchar(50) not null
);

Create table tbl_Permiso(
permisoId varchar(20) PRIMARY KEY not null,
descripcion varchar(50) not null
);

Create table tbl_UsuarioRol(
rolId int not null,
usuarioId int not null,
PRIMARY KEY (rolId,usuarioId)
);


Create table tbl_UsuarioPermiso(
usuarioId int not null,
permisoId varchar(20) not null,
PRIMARY KEY (usuarioId,permisoId)
);

Create table tbl_PermisoRol(
rolId int not null,
permisoId varchar(20) not null,
PRIMARY KEY(rolId,permisoId)
);
-- FORANEAS

ALTER TABLE tbl_UsuarioRol
ADD FOREIGN KEY (rolId) REFERENCES tbl_Rol(rolId);

ALTER TABLE tbl_UsuarioRol
ADD FOREIGN KEY (usuarioId) REFERENCES tbl_Usuario(usuarioId);

ALTER TABLE tbl_UsuarioPermiso
ADD FOREIGN KEY (permisoId) REFERENCES tbl_Permiso(permisoId);

ALTER TABLE tbl_UsuarioPermiso
ADD FOREIGN KEY (usuarioId) REFERENCES tbl_Usuario(usuarioId);

ALTER TABLE tbl_PermisoRol
ADD FOREIGN KEY (rolId) REFERENCES tbl_Rol(rolId);

ALTER TABLE tbl_PermisoRol
ADD FOREIGN KEY (permisoId) REFERENCES tbl_Permiso(permisoId);
