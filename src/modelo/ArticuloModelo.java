package modelo;

public class ArticuloModelo {
	private int idArticulo;
	private int idGaleria;
	private String descripcionCorta;
	private String descripcionLarga;
	private Double costo;
	private String tipo;
	private String estado;
	private String nombre;
	private GaleriaModelo galeria;
	
	

	/**
	 * @param idArticulo
	 * @param idGaleria
	 * @param descripcionCorta
	 * @param descripcionLarga
	 * @param costo
	 * @param tipo
	 * @param estado
	 * @param nombre
	 */
	public ArticuloModelo(int idArticulo, int idGaleria, String descripcionCorta, String descripcionLarga, Double costo,
			String tipo, String estado, String nombre) {
		super();
		this.idArticulo = idArticulo;
		this.idGaleria = idGaleria;
		this.descripcionCorta = descripcionCorta;
		this.descripcionLarga = descripcionLarga;
		this.costo = costo;
		this.tipo = tipo;
		this.estado = estado;
		this.nombre = nombre;
	}

	public ArticuloModelo() {

	}

	public int getIdArticulo() {
		return idArticulo;
	}

	public void setIdArticulo(int idArticulo) {
		this.idArticulo = idArticulo;
	}

	public int getIdGaleria() {
		return idGaleria;
	}

	public void setIdGaleria(int idGaleria) {
		this.idGaleria = idGaleria;
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

	public Double getCosto() {
		return costo;
	}

	public void setCosto(Double costo) {
		this.costo = costo;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public GaleriaModelo getGaleria() {
		return galeria;
	}

	public void setGaleria(GaleriaModelo galeria) {
		this.galeria = galeria;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

}
