package modelo;

public class CarritoModelo {
	private int idCarrito;
	private int idCuenta;
	private int idArticulo;
	private String estado;
	
	private CuentaModelo cuenta;
	private ArticuloModelo articulo;
	
	public CarritoModelo() {
		
	}

	/**
	 * @param idCarrito
	 * @param idCuenta
	 * @param idArticulo
	 * @param estado
	 */
	public CarritoModelo(int idCarrito, int idCuenta, int idArticulo, String estado) {
		super();
		this.idCarrito = idCarrito;
		this.idCuenta = idCuenta;
		this.idArticulo = idArticulo;
		this.estado = estado;
	}

	public int getIdCarrito() {
		return idCarrito;
	}

	public void setIdCarrito(int idCarrito) {
		this.idCarrito = idCarrito;
	}

	public int getIdCuenta() {
		return idCuenta;
	}

	public void setIdCuenta(int idCuenta) {
		this.idCuenta = idCuenta;
	}

	public int getIdArticulo() {
		return idArticulo;
	}

	public void setIdArticulo(int idArticulo) {
		this.idArticulo = idArticulo;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public CuentaModelo getCuenta() {
		return cuenta;
	}

	public void setCuenta(CuentaModelo cuenta) {
		this.cuenta = cuenta;
	}

	public ArticuloModelo getArticulo() {
		return articulo;
	}

	public void setArticulo(ArticuloModelo articulo) {
		this.articulo = articulo;
	}
	
	

}
