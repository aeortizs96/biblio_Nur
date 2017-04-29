using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for AreaBLL
/// </summary>
public class AreaBLL
{
    public AreaBLL()
    { }
    
    public static int? InsertArea(Area obj)
    {
        int? id = 0;
        AreaDSTableAdapters.tbl_AreaTableAdapter adapter = new AreaDSTableAdapters.tbl_AreaTableAdapter();
        adapter.InsertArea(obj.Descripcion, ref id);
        return id;
    }

    public static void UpdateArea(Area obj)
    {
        AreaDSTableAdapters.tbl_AreaTableAdapter adapter = new AreaDSTableAdapters.tbl_AreaTableAdapter();
        adapter.UpdateArea(obj.AreaId, obj.Descripcion);
    }

    public static void DeleteArea(int id)
    {
        AreaDSTableAdapters.tbl_AreaTableAdapter adapter = new AreaDSTableAdapters.tbl_AreaTableAdapter();
        adapter.DeleteArea(id);
    }

    public static List<Area> GetAreas()
    {
        AreaDSTableAdapters.tbl_AreaTableAdapter adapter = new AreaDSTableAdapters.tbl_AreaTableAdapter();
        AreaDS.tbl_AreaDataTable table = adapter.GetAreas();
        List<Area> lista = new List<Area>();
        foreach (AreaDS.tbl_AreaRow row in table)
        {
            lista.Add(rowToObjArea(row));
        }
        return lista;
    }

    public static Area GetAreaById(int id)
    {
        List<Area> lista = GetAreas();
        for (int i = 0; i < lista.Count; i++)
        {
            if (lista[i].AreaId == id)
                return lista[i];
        }
        return null;
    }

    private static Area rowToObjArea(AreaDS.tbl_AreaRow row)
    {
        Area obj = new Area();
        obj.AreaId = row.areaId;
        obj.Descripcion = row.descripcion;
        return obj;
    }
}