package dao;

import java.sql.ResultSet;
import java.util.ArrayList;

import modelo.CarritoModelo;


public class CarritoJdbc {
	public static synchronized ArrayList<CarritoModelo> seleccionarCarritos() {
		String query = "select * from Carrito;";
		return crearCarritosObject(Conexion.ejecutarConsulta(query));
	}
	public static synchronized ArrayList<CarritoModelo> seleccionarCarritos(int idCuenta) {
		String query = "select * from Carrito where idCuenta="+idCuenta+";";
		return crearCarritosObject(Conexion.ejecutarConsulta(query));
	}
	public static synchronized ArrayList<CarritoModelo> seleccionarCarritosEnEspera(int idCuenta) {
		String query = "select * from Carrito where idCuenta="+idCuenta+" && estado='En espera';";
		return crearCarritosObject(Conexion.ejecutarConsulta(query));
	}
	public static synchronized ArrayList<CarritoModelo> seleccionarCarritosPreparando(int idCuenta) {
		String query = "select * from Carrito where idCuenta="+idCuenta+" && estado='Preparando';";
		return crearCarritosObject(Conexion.ejecutarConsulta(query));
	}
	public static synchronized ArrayList<CarritoModelo> seleccionarCarritosPreparado(int idCuenta) {
		String query = "select * from Carrito where idCuenta="+idCuenta+" && estado='Preparado';";
		return crearCarritosObject(Conexion.ejecutarConsulta(query));
	}
	public static synchronized ArrayList<CarritoModelo> seleccionarCarritosEnEspera() {
		String query = "select * from Carrito where estado='En espera';";
		return crearCarritosObject(Conexion.ejecutarConsulta(query));
	}
	public static synchronized ArrayList<CarritoModelo> seleccionarCarritosPreparando() {
		String query = "select * from Carrito where estado='Preparando';";
		return crearCarritosObject(Conexion.ejecutarConsulta(query));
	}
	public static synchronized ArrayList<CarritoModelo> seleccionarCarritosPreparado() {
		String query = "select * from Carrito where estado='Preparado';";
		return crearCarritosObject(Conexion.ejecutarConsulta(query));
	}

	public static synchronized CarritoModelo seleccionarCarrito(int idCarrito) {
		String query = "select * from Carrito where " + "idCarrito=" + idCarrito + ";";
		ArrayList<CarritoModelo> carritos = crearCarritosObject(Conexion.ejecutarConsulta(query));
		return carritos.size() > 0 ? carritos.get(0) : null;
	}

	public static synchronized int insertarCarrito(CarritoModelo carrito) {
		String query = "insert into Carrito(idCarrito,idCuenta,idArticulo,estado)values("
				+ ""+carrito.getIdCarrito()+","
				+ ""+carrito.getIdCuenta()+","
				+ ""+carrito.getIdArticulo()+","
				+ "'"+carrito.getEstado()+"');";
		int columnasAfectadas = Conexion.ejecutarActualizacion(query);
		return columnasAfectadas;

	}

	public static synchronized int eliminarCarrito(CarritoModelo carrito) {
		String query = "delete from Carrito where idCarrito=" + carrito.getIdCarrito() + ";";
		int columnasAfectadas = Conexion.ejecutarActualizacion(query);
		return columnasAfectadas;
	}

	public static synchronized int actualizarCarrito(CarritoModelo carrito) {
		String query = "update Carrito set "
				+ "idCuenta="+carrito.getIdCuenta()+","
				+ "idArticulo='"+carrito.getIdArticulo()+"',"
				+ "estado='"+carrito.getEstado()+"' where idCarrito=" + carrito.getIdCarrito() + ";";
		int columnasAfectadas = Conexion.ejecutarActualizacion(query);
		return columnasAfectadas;
	}

	private static ArrayList<CarritoModelo> crearCarritosObject(Object obj) {
		ResultSet rs = (ResultSet) obj;
		ArrayList<CarritoModelo> carritos = new ArrayList<CarritoModelo>();
		try {
			while (rs.next()) {
				CarritoModelo carrito = new CarritoModelo(
						rs.getInt("idCarrito"), 
						rs.getInt("idCuenta"),
						rs.getInt("idArticulo"),
						rs.getString("estado")
						);
				poblarObjeto(carrito);
				carritos.add(carrito);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			Conexion.cerrarResultSet(rs);
		}
		return carritos;
	}

	private static void poblarObjeto(CarritoModelo carrito) {
		carrito.setCuenta(CuentaJdbc.seleccionarCuenta(carrito.getIdCuenta()));
		carrito.setArticulo(ArticuloJdbc.seleccionarArticulo(carrito.getIdArticulo()));
		
	}

}
