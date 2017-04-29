using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for AccesoBLL
/// </summary>
public class AccesoBLL
{
    public AccesoBLL()
    { }

    public static void InsertAcceso(Acceso obj)
    {
        AccesoDSTableAdapters.tbl_AccesoTableAdapter adapter = new AccesoDSTableAdapters.tbl_AccesoTableAdapter();
        adapter.InsertAcceso(obj.ModuloId, obj.UsuarioId);
    }

    public static void Deleteacceso(Acceso obj)
    {
        AccesoDSTableAdapters.tbl_AccesoTableAdapter adapter = new AccesoDSTableAdapters.tbl_AccesoTableAdapter();
        adapter.DeleteAcceso(obj.ModuloId, obj.UsuarioId);
    }

    public static List<Acceso> GetAccesos()
    {
        AccesoDSTableAdapters.tbl_AccesoTableAdapter adapter = new AccesoDSTableAdapters.tbl_AccesoTableAdapter();
        AccesoDS.tbl_AccesoDataTable table = adapter.GetAccesos();
        List<Acceso> lista = new List<Acceso>();
        foreach (AccesoDS.tbl_AccesoRow row in table)
        {
            lista.Add(rowToObjAcceso(row));
        }
        return lista;
    }

    public static List<Modulo> GetAccesoByUsuarioId(int id)
    {
        List<Acceso> listaTodos = GetAccesos();
        List<Modulo> lista = new List<Modulo>();
        for (int i = 0; i < listaTodos.Count; i++)
        {
            if (listaTodos[i].UsuarioId == id)
                lista.Add(ModuloBLL.GetModuloById(listaTodos[i].ModuloId));
        }
        return lista;
    }

    public static Acceso GetAccesoBy_ModuloId_UsuarioId(Acceso obj)
    {
        List<Acceso> lista = GetAccesos();
        for (int i = 0; i < lista.Count; i++)
        {
            if (lista[i].ModuloId == obj.ModuloId && lista[i].UsuarioId == obj.UsuarioId)
                return lista[i];
        }
        return null;
    }

    private static Acceso rowToObjAcceso(AccesoDS.tbl_AccesoRow row)
    {
        Acceso obj = new Acceso();
        obj.ModuloId = row.moduloId;
        obj.UsuarioId = row.usuarioId;
        return obj;
    }
}