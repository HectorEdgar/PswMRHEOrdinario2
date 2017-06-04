package dao;

import java.sql.ResultSet;
import java.util.ArrayList;


import modelo.CuentaModelo;

public class CuentaJdbc {

	
	
	public static synchronized ArrayList<CuentaModelo> seleccionarCuentas(){
		String query="select * from Cuenta;";
		return crearCuentasObject(Conexion.ejecutarConsulta(query));
	}
	public static synchronized CuentaModelo seleccionarCuenta(String usuario,String clave){
		String query="select * from Cuenta where "
				+ "usuario='"+usuario+"' && "
						+ "clave='"+clave+"';";
		ArrayList<CuentaModelo> cuentas = crearCuentasObject(Conexion.ejecutarConsulta(query));
		return cuentas.size()>0?cuentas.get(0):null;
	}
	public static synchronized CuentaModelo seleccionarCuenta(int idCuenta){
		String query="select * from Cuenta where "
				+ "idCuenta="+idCuenta+";" ;
		ArrayList<CuentaModelo> cuentas = crearCuentasObject(Conexion.ejecutarConsulta(query));
		return cuentas.size()>0?cuentas.get(0):null;
	}
	
	public static synchronized int insertarCuenta(CuentaModelo cuenta){
		String query="insert into Cuenta(idCuenta,usuario,clave,rol,nombre,apellidoPaterno,apellidoMaterno,email) "
				+ "values("
				+ ""+cuenta.getIdCuenta()+","
				+ "'"+cuenta.getUsuario()+"',"
				+ "'"+cuenta.getClave()+"',"
				+ "'"+cuenta.getRol()+"',"
				+ "'"+cuenta.getNombre()+"',"
				+ "'"+cuenta.getApellidoPaterno()+"',"
				+ "'"+cuenta.getApellidoMaterno()+"',"
				+ "'"+cuenta.getEmail()+"');";
		int columnasAfectadas=Conexion.ejecutarActualizacion(query);
		return columnasAfectadas;
		
	}
	public static synchronized int eliminarCuenta(CuentaModelo cuenta){
		String query="delete from Cuenta where idCuenta="+cuenta.getIdCuenta()+";";
		int columnasAfectadas=Conexion.ejecutarActualizacion(query);
		return columnasAfectadas;
	}
	
	public static synchronized int actualizarCuenta(CuentaModelo cuenta){
		String query="update Cuenta set "
				+ "usuario='"+cuenta.getUsuario()+"',"
				+ "clave='"+cuenta.getClave()+"',"
				+ "rol='"+cuenta.getRol()+"',"
				+ "nombre='"+cuenta.getNombre()+"',"
				+ "apellidoPaterno='"+cuenta.getApellidoPaterno()+"',"
				+ "apellidoMaterno='"+cuenta.getApellidoMaterno()+"',"
				+ "email='"+cuenta.getEmail()+"' "
				+ "where idCuenta="+cuenta.getIdCuenta()+";";
		int columnasAfectadas=Conexion.ejecutarActualizacion(query);
		return columnasAfectadas;
	}	
	
	private static ArrayList<CuentaModelo> crearCuentasObject(Object obj) {
		ResultSet rs=(ResultSet)obj;
		ArrayList<CuentaModelo> cuentas = new ArrayList<CuentaModelo>();
		try {
			while (rs.next()) {
				CuentaModelo cuenta = new CuentaModelo(
						rs.getInt("idCuenta"), 
						rs.getString("usuario"), 
						rs.getString("clave"), 
						rs.getString("rol"),
						rs.getString("nombre"), 
						rs.getString("apellidoPaterno"),
						rs.getString("apellidoMaterno"),
						rs.getString("email"));
				
				cuentas.add(cuenta);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally{
			Conexion.cerrarResultSet(rs);	
		}
		return cuentas;
	}

}
