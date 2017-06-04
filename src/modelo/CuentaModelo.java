package modelo;

public class CuentaModelo {
	private int idCuenta;
	private String usuario;
	private String clave;
	private String rol;
	private String nombre;
	private String apellidoPaterno;
	private String apellidoMaterno;
	private String email;
	
	
	
	/**
	 * @param idCuenta
	 * @param usuario
	 * @param clave
	 * @param rol
	 * @param nombre
	 * @param apellidoPaterno
	 * @param apellidoMaterno
	 * @param email
	 */
	public CuentaModelo(int idCuenta, String usuario, String clave, String rol, String nombre, String apellidoPaterno,
			String apellidoMaterno, String email) {
		super();
		this.idCuenta = idCuenta;
		this.usuario = usuario;
		this.clave = clave;
		this.rol = rol;
		this.nombre = nombre;
		this.apellidoPaterno = apellidoPaterno;
		this.apellidoMaterno = apellidoMaterno;
		this.email = email;
	}


	public int getIdCuenta() {
		return idCuenta;
	}

	public void setIdCuenta(int idCuenta) {
		this.idCuenta = idCuenta;
	}

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public String getClave() {
		return clave;
	}

	public void setClave(String clave) {
		this.clave = clave;
	}

	public String getRol() {
		return rol;
	}

	public void setRol(String rol) {
		this.rol = rol;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellidoPaterno() {
		return apellidoPaterno;
	}

	public void setApellidoPaterno(String apellidoPaterno) {
		this.apellidoPaterno = apellidoPaterno;
	}

	public String getApellidoMaterno() {
		return apellidoMaterno;
	}

	public void setApellidoMaterno(String apellidoMaterno) {
		this.apellidoMaterno = apellidoMaterno;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	

}
