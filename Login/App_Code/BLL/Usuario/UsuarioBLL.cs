using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for UsuarioBLL
/// </summary>
public class UsuarioBLL
{
    public UsuarioBLL()
    { }

    public static int? InsertUsuario(Usuario obj)
    {
        int? id = 0;
        UsuarioDSTableAdapters.tbl_UsuarioTableAdapter adapter = new UsuarioDSTableAdapters.tbl_UsuarioTableAdapter();
        adapter.InsertUsuario(obj.NombreUsuario, obj.Contrasena, ref id);
        return id;
    }

    public static void UpdateUsuario(Usuario obj)
    {
        UsuarioDSTableAdapters.tbl_UsuarioTableAdapter adapter = new UsuarioDSTableAdapters.tbl_UsuarioTableAdapter();
        adapter.UpdateUsuario(obj.UsuarioId, obj.NombreUsuario, obj.Contrasena);
    }

    public static void DeleteUsuario(int id)
    {
        UsuarioDSTableAdapters.tbl_UsuarioTableAdapter adapter = new UsuarioDSTableAdapters.tbl_UsuarioTableAdapter();
        adapter.DeleteUsuario(id);
    }

    public static List<Usuario> GetUsuarios()
    {
        UsuarioDSTableAdapters.tbl_UsuarioTableAdapter adapter = new UsuarioDSTableAdapters.tbl_UsuarioTableAdapter();
        UsuarioDS.tbl_UsuarioDataTable table = adapter.GetUsuarios();
        List<Usuario> lista = new List<Usuario>();
        foreach (UsuarioDS.tbl_UsuarioRow row in table)
        {
            lista.Add(rowToObjUsuario(row));
        }
        return lista;
    }

    public static Usuario GetUsuarioById(int id)
    {
        List<Usuario> lista = GetUsuarios();
        for (int i = 0; i < lista.Count; i++)
        {
            if (lista[i].UsuarioId == id)
                return lista[i];
        }
        return null;
    }

    private static Usuario rowToObjUsuario(UsuarioDS.tbl_UsuarioRow row)
    {
        Usuario obj = new Usuario();
        obj.UsuarioId = row.usuarioId;
        obj.NombreUsuario = row.nombreUsuario;
        obj.Contrasena = row.contrasena;
        return obj;
    }
}