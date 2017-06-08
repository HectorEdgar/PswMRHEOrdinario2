package modelo;

import java.sql.Date;

public class ComentarioModelo {
	private int idComentario;
	private int idCuenta;
	private String comentario;
	private Date fecha;
	private CuentaModelo cuenta;

	public ComentarioModelo() {

	}
	/**
	 * @param idComentario
	 * @param idCuenta
	 * @param comentario
	 * @param fecha
	 */
	public ComentarioModelo(int idComentario, int idCuenta, String comentario, Date fecha) {
		super();
		this.idComentario = idComentario;
		this.idCuenta = idCuenta;
		this.comentario = comentario;
		this.fecha = fecha;
	}

	public int getIdComentario() {
		return idComentario;
	}

	public void setIdComentario(int idComentario) {
		this.idComentario = idComentario;
	}

	public int getIdCuenta() {
		return idCuenta;
	}

	public void setIdCuenta(int idCuenta) {
		this.idCuenta = idCuenta;
	}

	public String getComentario() {
		return comentario;
	}

	public void setComentario(String comentario) {
		this.comentario = comentario;
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public CuentaModelo getCuenta() {
		return cuenta;
	}

	public void setCuenta(CuentaModelo cuenta) {
		this.cuenta = cuenta;
	}

}
