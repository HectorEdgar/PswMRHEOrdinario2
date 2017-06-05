package dao;

import java.sql.ResultSet;
import java.util.ArrayList;

import modelo.ContactoModelo;


public class ContactoJdbc {
	public static synchronized ArrayList<ContactoModelo> seleccionarContactos(){
		String query="select * from Contacto;";
		return crearContactosObject(Conexion.ejecutarConsulta(query));
	}
	public static synchronized ContactoModelo seleccionarContacto(int idContacto){
		String query="select * from Contacto where "
				+ "idContacto="+idContacto+";" ;
		ArrayList<ContactoModelo> contactos = crearContactosObject(Conexion.ejecutarConsulta(query));
		return contactos.size()>0?contactos.get(0):null;
	}
	
	public static synchronized int insertarContacto(ContactoModelo contacto){
		String query="insert into Contacto(idContacto,nombre,email) "
				+ "values("
				+ ""+contacto.getIdContacto()+","
				+ "'"+contacto.getNombre()+"',"
				+ "'"+contacto.getEmail()+"');";
		int columnasAfectadas=Conexion.ejecutarActualizacion(query);
		return columnasAfectadas;
		
	}
	public static synchronized int eliminarContacto(ContactoModelo contacto){
		String query="delete from Contacto where idContacto="+contacto.getIdContacto()+";";
		int columnasAfectadas=Conexion.ejecutarActualizacion(query);
		return columnasAfectadas;
	}
	
	public static synchronized int actualizarContacto(ContactoModelo contacto){
		String query="update Contacto set "
				+ "nombre='"+contacto.getNombre()+"',"
				+ "email='"+contacto.getEmail()+"' "
				+ "where idContacto="+contacto.getIdContacto()+";";
		int columnasAfectadas=Conexion.ejecutarActualizacion(query);
		return columnasAfectadas;
	}	
	
	private static ArrayList<ContactoModelo> crearContactosObject(Object obj) {
		ResultSet rs=(ResultSet)obj;
		ArrayList<ContactoModelo> contactos = new ArrayList<ContactoModelo>();
		try {
			while (rs.next()) {
				ContactoModelo contacto = new ContactoModelo(
						rs.getInt("idContacto"), 
						rs.getString("nombre"), 
						rs.getString("email")
						);
				
				contactos.add(contacto);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally{
			Conexion.cerrarResultSet(rs);	
		}
		return contactos;
	}

}
