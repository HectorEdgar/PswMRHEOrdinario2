package modelo;

public class GaleriaModelo {
	private int idGaleria;
	private String nombre;
	private String ubicacion;
	
	public GaleriaModelo() {
		
	}

	
	/**
	 * @param idGaleria
	 * @param nombre
	 * @param ubicacion
	 */
	public GaleriaModelo(int idGaleria, String nombre, String ubicacion) {
		super();
		this.idGaleria = idGaleria;
		this.nombre = nombre;
		this.ubicacion = ubicacion;
	}


	public int getIdGaleria() {
		return idGaleria;
	}

	public void setIdGaleria(int idGaleria) {
		this.idGaleria = idGaleria;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getUbicacion() {
		return ubicacion;
	}

	public void setUbicacion(String ubicacion) {
		this.ubicacion = ubicacion;
	}
	
}
