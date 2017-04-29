using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ModuloBLL
/// </summary>
public class ModuloBLL
{
    public ModuloBLL()
    { }

    public static int? InsertModulo(Modulo obj)
    {
        int? id = 0;
        ModuloDSTableAdapters.tbl_ModuloTableAdapter adapter = new ModuloDSTableAdapters.tbl_ModuloTableAdapter();
        adapter.InsertModulo(obj.AreaId, obj.Descripcion, ref id);
        return id;
    }

    public static void UpdateModulo(Modulo obj)
    {
        ModuloDSTableAdapters.tbl_ModuloTableAdapter adapter = new ModuloDSTableAdapters.tbl_ModuloTableAdapter();
        adapter.UpdateModulo(obj.ModuloId, obj.AreaId, obj.Descripcion);
    }

    public static void DeleteModulo(int id)
    {
        ModuloDSTableAdapters.tbl_ModuloTableAdapter adapter = new ModuloDSTableAdapters.tbl_ModuloTableAdapter();
        adapter.DeleteModulo(id);
    }

    public static List<Modulo> GetModulos()
    {
        ModuloDSTableAdapters.tbl_ModuloTableAdapter adapter = new ModuloDSTableAdapters.tbl_ModuloTableAdapter();
        ModuloDS.tbl_ModuloDataTable table = adapter.GetModulos();
        List<Modulo> lista = new List<Modulo>();
        foreach (ModuloDS.tbl_ModuloRow row in table)
        {
            lista.Add(rowToObjModulo(row));
        }
        return lista;
    }

    public static Modulo GetModuloById(int id)
    {
        List<Modulo> lista = GetModulos();
        for (int i = 0; i < lista.Count; i++)
        {
            if (lista[i].ModuloId == id)
                return lista[i];
        }
        return null;
    }

    private static Modulo rowToObjModulo(ModuloDS.tbl_ModuloRow row)
    {
        Modulo obj = new Modulo();
        obj.ModuloId = row.moduloId;
        obj.AreaId = row.areaId;
        obj.Descripcion = row.descripcion;
        return obj;
    }
}