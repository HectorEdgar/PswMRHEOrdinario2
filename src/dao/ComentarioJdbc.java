package dao;

import java.sql.ResultSet;
import java.util.ArrayList;

import modelo.ComentarioModelo;

public class ComentarioJdbc {

	public static synchronized ArrayList<ComentarioModelo> seleccionarComentarios() {
		String query = "select * from Comentario;";
		return crearComentariosObject(Conexion.ejecutarConsulta(query));
	}

	public static synchronized ComentarioModelo seleccionarComentario(int idComentario) {
		String query = "select * from Comentario where " + "idComentario=" + idComentario + ";";
		ArrayList<ComentarioModelo> comentarios = crearComentariosObject(Conexion.ejecutarConsulta(query));
		return comentarios.size() > 0 ? comentarios.get(0) : null;
	}

	public static synchronized int insertarComentario(ComentarioModelo comentario) {
		String query = "insert into Comentario(idComentario,idCuenta,comentario,fecha)values("
				+ ""+comentario.getIdComentario()+","
						+ ""+comentario.getIdCuenta()+","
								+ "'"+comentario.getComentario()+"',"
										+ "'"+comentario.getFecha()+"');";
		int columnasAfectadas = Conexion.ejecutarActualizacion(query);
		return columnasAfectadas;

	}

	public static synchronized int eliminarComentario(ComentarioModelo comentario) {
		String query = "delete from Comentario where idComentario=" + comentario.getIdComentario() + ";";
		int columnasAfectadas = Conexion.ejecutarActualizacion(query);
		return columnasAfectadas;
	}

	public static synchronized int actualizarComentario(ComentarioModelo comentario) {
		String query = "update Comentario set "
				+ "idCuenta="+comentario.getIdCuenta()+","
				+ "comentario='"+comentario.getComentario()+"',"
						+ "fecha='"+comentario.getFecha()+"' where idComentario=" + comentario.getIdComentario() + ";";
		int columnasAfectadas = Conexion.ejecutarActualizacion(query);
		return columnasAfectadas;
	}

	private static ArrayList<ComentarioModelo> crearComentariosObject(Object obj) {
		ResultSet rs = (ResultSet) obj;
		ArrayList<ComentarioModelo> comentarios = new ArrayList<ComentarioModelo>();
		try {
			while (rs.next()) {
				ComentarioModelo comentario = new ComentarioModelo(
						rs.getInt("idComentario"), 
						rs.getInt("idCuenta"),
						rs.getString("comentario"),
						rs.getDate("fecha")
						);
				poblarObjeto(comentario);
				comentarios.add(comentario);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			Conexion.cerrarResultSet(rs);
		}
		return comentarios;
	}

	private static void poblarObjeto(ComentarioModelo comentario) {
		comentario.setCuenta(CuentaJdbc.seleccionarCuenta(comentario.getIdCuenta()));
		
	}

}
