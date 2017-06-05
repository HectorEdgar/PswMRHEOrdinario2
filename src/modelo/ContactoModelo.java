package modelo;

public class ContactoModelo {
	private int idContacto;
	private String nombre;
	private String email;
	public ContactoModelo() {
		
	}
	/**
	 * @param idContacto
	 * @param nombre
	 * @param email
	 */
	public ContactoModelo(int idContacto, String nombre, String email) {
		super();
		this.idContacto = idContacto;
		this.nombre = nombre;
		this.email = email;
	}
	public int getIdContacto() {
		return idContacto;
	}
	public void setIdContacto(int idContacto) {
		this.idContacto = idContacto;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
}
