package dao;

import java.sql.ResultSet;
import java.util.ArrayList;

import modelo.GaleriaModelo;



public class GaleriaJdbc {
	public static synchronized ArrayList<GaleriaModelo> seleccionarGalerias(){
		String query="select * from Galeria;";
		return crearGaleriasObject(Conexion.ejecutarConsulta(query));
	}
	public static synchronized GaleriaModelo seleccionarGaleria(int idGaleria){
		String query="select * from Galeria where "
				+ "idGaleria="+idGaleria+";" ;
		ArrayList<GaleriaModelo> galerias = crearGaleriasObject(Conexion.ejecutarConsulta(query));
		return galerias.size()>0?galerias.get(0):null;
	}
	
	public static synchronized int insertarGaleria(GaleriaModelo galeria){
		String query="insert into Galeria(idGaleria,nombre,ubicacion) "
				+ "values("
				+ ""+galeria.getIdGaleria()+","
				+ "'"+galeria.getNombre()+"',"
				+ "'"+galeria.getUbicacion()+"');";
		int columnasAfectadas=Conexion.ejecutarActualizacion(query);
		return columnasAfectadas;
		
	}
	public static synchronized int eliminarGaleria(GaleriaModelo galeria){
		String query="delete from Galeria where idGaleria="+galeria.getIdGaleria()+";";
		int columnasAfectadas=Conexion.ejecutarActualizacion(query);
		return columnasAfectadas;
	}
	
	public static synchronized int actualizarGaleria(GaleriaModelo galeria){
		String query="update Galeria set "
				+ "nombre='"+galeria.getNombre()+"',"
				+ "ubicacion='"+galeria.getUbicacion()+"' "
				+ "where idGaleria="+galeria.getIdGaleria()+";";
		int columnasAfectadas=Conexion.ejecutarActualizacion(query);
		return columnasAfectadas;
	}	
	
	private static ArrayList<GaleriaModelo> crearGaleriasObject(Object obj) {
		ResultSet rs=(ResultSet)obj;
		ArrayList<GaleriaModelo> galerias = new ArrayList<GaleriaModelo>();
		try {
			while (rs.next()) {
				GaleriaModelo galeria = new GaleriaModelo(
						rs.getInt("idGaleria"), 
						rs.getString("nombre"), 
						rs.getString("ubicacion")
						);
				
				galerias.add(galeria);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally{
			Conexion.cerrarResultSet(rs);	
		}
		return galerias;
	}
}
