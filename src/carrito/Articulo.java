package carrito;

public class Articulo {
	
	private String idArticulo;
	private String descripcionCorta;
	private String descripcionLarga;
	private String direccionimagen;
	private double costo;
	
	public Articulo(String idArticulo, String descripcionCorta,String descripcionLarga, double costo,String direccionimagen){
		this.idArticulo = idArticulo;
		this.descripcionCorta = descripcionCorta;
		this.descripcionLarga = descripcionLarga;
		this.costo = costo;
		this.direccionimagen = direccionimagen;	
	}

	public String getDireccionimagen() {
		return direccionimagen;
	}

	public void setDireccionimagen(String direccionimagen) {
		this.direccionimagen = direccionimagen;
	}

	public String getIdArticulo() {
		return idArticulo;
	}

	public void setIdArticulo(String idArticulo) {
		this.idArticulo = idArticulo;
	}

	public String getDescripcionCorta() {
		return descripcionCorta;
	}

	public void setDescripcionCorta(String descripcionCorta) {
		this.descripcionCorta = descripcionCorta;
	}

	public String getDescripcionLarga() {
		return descripcionLarga;
	}

	public void setDescripcionLarga(String descripcionLarga) {
		this.descripcionLarga = descripcionLarga;
	}

	public double getCosto() {
		return costo;
	}

	public void setCosto(double costo) {
		this.costo = costo;
	}
	
	
}
