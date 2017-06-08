package dao;

import java.sql.ResultSet;
import java.util.ArrayList;

import modelo.ArticuloModelo;


public class ArticuloJdbc {

	public static synchronized ArrayList<ArticuloModelo> seleccionarArticulos() {
		String query = "select * from Articulo;";
		return crearArticulosObject(Conexion.ejecutarConsulta(query));
	}
	public static synchronized ArrayList<ArticuloModelo> seleccionarArticulosComida() {
		String query = "select * from Articulo where tipo='Comida';";
		return crearArticulosObject(Conexion.ejecutarConsulta(query));
	}
	public static synchronized ArrayList<ArticuloModelo> seleccionarArticulosBebida() {
		String query = "select * from Articulo where tipo='Bebida';";
		return crearArticulosObject(Conexion.ejecutarConsulta(query));
	}
	public static synchronized ArrayList<ArticuloModelo> seleccionarArticulosComidaDisponible() {
		String query = "select * from Articulo where tipo='Comida' && estado='Disponible';";
		return crearArticulosObject(Conexion.ejecutarConsulta(query));
	}
	public static synchronized ArrayList<ArticuloModelo> seleccionarArticulosBebidaDisponible() {
		String query = "select * from Articulo where tipo='Bebida' && estado='Disponible';";
		return crearArticulosObject(Conexion.ejecutarConsulta(query));
	}

	public static synchronized ArticuloModelo seleccionarArticulo(int idArticulo) {
		String query = "select * from Articulo where " + "idArticulo=" + idArticulo + ";";
		ArrayList<ArticuloModelo> articulos = crearArticulosObject(Conexion.ejecutarConsulta(query));
		return articulos.size() > 0 ? articulos.get(0) : null;
	}

	public static synchronized int insertarArticulo(ArticuloModelo articulo) {
		String query = "insert into Articulo(idArticulo,idGaleria,descripcionCorta,descripcionLArga,costo,tipo,estado,nombre)values("
				+ ""+articulo.getIdArticulo()+","
				+ ""+articulo.getIdGaleria()+","
				+ "'"+articulo.getDescripcionCorta()+"',"
				+ "'"+articulo.getDescripcionLarga()+"',"
				+ ""+articulo.getCosto()+","
				+ "'"+articulo.getTipo()+"',"
				+ "'"+articulo.getEstado()+"',"
				+ "'"+articulo.getNombre()+"'"
						+ ");";
		
		int columnasAfectadas = Conexion.ejecutarActualizacion(query);
		return columnasAfectadas;

	}

	public static synchronized int eliminarArticulo(ArticuloModelo articulo) {
		String query = "delete from Articulo where idArticulo=" + articulo.getIdArticulo() + ";";
		int columnasAfectadas = Conexion.ejecutarActualizacion(query);
		return columnasAfectadas;
	}

	public static synchronized int actualizarArticulo(ArticuloModelo articulo) {
		String query = "update Articulo set "
				+ "idGaleria="+articulo.getIdGaleria()+","
				+ "descripcionCorta='"+articulo.getDescripcionCorta()+"',"
				+ "descripcionLarga='"+articulo.getDescripcionLarga()+"',"
				+ "costo="+articulo.getCosto()+","
				+ "tipo='"+articulo.getTipo()+"',"
				+ "estado='"+articulo.getEstado()+"',"
				+ "nombre='"+articulo.getNombre()+"'"
				+ "where idArticulo=" + articulo.getIdArticulo() + ";";
		int columnasAfectadas = Conexion.ejecutarActualizacion(query);
		return columnasAfectadas;
	}

	private static ArrayList<ArticuloModelo> crearArticulosObject(Object obj) {
		ResultSet rs = (ResultSet) obj;
		ArrayList<ArticuloModelo> articulos = new ArrayList<ArticuloModelo>();
		try {
			while (rs.next()) {
				ArticuloModelo articulo = new ArticuloModelo(
						rs.getInt("idArticulo"), 
						rs.getInt("idGaleria"),
						rs.getString("descripcionCorta"),
						rs.getString("descripcionLarga"),
						rs.getDouble("costo"),
						rs.getString("tipo"),
						rs.getString("estado"),
						rs.getString("nombre")
						);
				poblarObjeto(articulo);
				articulos.add(articulo);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			Conexion.cerrarResultSet(rs);
		}
		return articulos;
	}

	private static void poblarObjeto(ArticuloModelo articulo) {
		articulo.setGaleria(GaleriaJdbc.seleccionarGaleria(articulo.getIdGaleria()));		
	}
}
