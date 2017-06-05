package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Conexion {

	private static String url = "jdbc:mysql://localhost:3306/restaurantis6a";
	private static String user = "root";
	private static String password = "admin";

	// Metodo para obtener la conexion con la base de datos
	@SuppressWarnings("finally")
	private static synchronized Connection getConexion() {
		Connection cn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			cn = DriverManager.getConnection(url, user, password);
			
		} catch (Exception e) {
			cn = null;
		} finally {
			return cn;
		}
	}

	public static synchronized Object ejecutarConsulta(String consulta) {
		Connection cn = getConexion();
		Statement stmt = null;
		ResultSet rs = null;
		try {
			
			stmt = cn.createStatement();
			rs = stmt.executeQuery(consulta);
		} catch (SQLException e) {
			e.printStackTrace();
			cerrarStatement(stmt);
			cerrarConexion(cn);
		} catch (Exception e) {
			e.printStackTrace();
			cerrarStatement(stmt);
			cerrarConexion(cn);
		}
		return rs;
	}

	public static synchronized int ejecutarActualizacion(String consulta) {

		int NumeroAfectado = 0;
		Statement stmt = null;
		Connection cn = null;
		try {
			cn = getConexion();
			cn.setAutoCommit(false);
			stmt = cn.createStatement();
			NumeroAfectado = stmt.executeUpdate(consulta);
			if (NumeroAfectado > 0) {
				cn.commit();
			} else {
				deshacerCambios(cn);
			}
			Conexion.cerrarStatement(stmt);
			Conexion.cerrarConexion(cn);
		} catch (SQLException e) {
			e.printStackTrace();
			Conexion.deshacerCambios(cn);
			Conexion.cerrarStatement(stmt);
			Conexion.cerrarConexion(cn);
		} catch (Exception e) {
			e.printStackTrace();
			Conexion.deshacerCambios(cn);
			Conexion.cerrarStatement(stmt);
			Conexion.cerrarConexion(cn);
		}

		return NumeroAfectado;
	}

	// Metodo utilizado para cerrar el ResultSet
	public static synchronized void cerrarResultSet(ResultSet rs) {
		try {
			rs.close();
		} catch (Exception e) {
		}
	}

	// Metodo utilizado para cerrar el callablestatemente
	private static synchronized void cerrarStatement(Statement stmt) {
		try {
			stmt.close();
		} catch (Exception e) {
		}
	}

	// Metodo utilizado para cerrar el resulset de datos
	

	// Metodo utilizado para cerrar la conexion
	private static synchronized void cerrarConexion(Connection cn) {
		try {
			cn.close();
		} catch (Exception e) {
		}
	}

	// Metodo utilizado para deshacer los cambios en la base de datos
	private static synchronized void deshacerCambios(Connection cn) {
		try {
			cn.rollback();
		} catch (Exception e) {
		}
	}
}
