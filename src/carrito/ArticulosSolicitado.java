package carrito;

public class ArticulosSolicitado {
	private Articulo articulo;
	private int numArticulo;

	public ArticulosSolicitado(Articulo articulo) {
		this.articulo = articulo;
		this.numArticulo = 1;
	}

	public Articulo getArticulo() {
		return articulo;
	}

	public void setArticulo(Articulo articulo) {
		this.articulo = articulo;
	}

	public int getNumArticulo() {
		return numArticulo;
	}

	public void setNumArticulo(int numArticulo) {
		this.numArticulo = numArticulo;
	}

	public String getIdArticulo() {
		return articulo.getIdArticulo();
	}


	public String getDescripcionCorta() {
		return articulo.getDescripcionCorta();
	}

	public String getDescripcionLarga() {
		return articulo.getDescripcionLarga();
	}

	public double getCostoUnitario() {
		return articulo.getCosto();
	}

	public void incrementaNumArticulos() {
		this.numArticulo = this.numArticulo + 1;
	}

	public void cancelarSolicitud() {
		this.numArticulo = 0;
	}
	
	public double getConstoTotal(){
		return this.numArticulo*getCostoUnitario();
	}
}
