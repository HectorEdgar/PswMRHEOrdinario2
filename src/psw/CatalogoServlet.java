package psw;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import carrito.Articulo;
import carrito.Catalogo;

@WebServlet("/CatalogoServlet")
public class CatalogoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Articulo[] articulosComida;
	private String[] idsArticulosComida;
	private String tituloComida;

	private Articulo[] articulosBebida;
	private String[] idsArticulosBebida;
	private String tituloBebida;

	public void setArticulosBebida(String[] idsArticulosBebida) {
		if (idsArticulosBebida != null) {
			if (idsArticulosBebida.length > 0) {
				this.idsArticulosBebida = idsArticulosBebida;
				articulosBebida = new Articulo[idsArticulosBebida.length];
				for (int i = 0; i < idsArticulosBebida.length; i++) {
					articulosBebida[i] = Catalogo.getArticulo(idsArticulosBebida[i]);
				}
			}
		}

	}

	public void setArticulosComida(String[] idsArticulosComida) {
		if (idsArticulosComida != null) {
			if (idsArticulosComida.length > 0) {
				this.idsArticulosComida = idsArticulosComida;
				articulosComida = new Articulo[idsArticulosComida.length];
				for (int i = 0; i < idsArticulosComida.length; i++) {
					articulosComida[i] = Catalogo.getArticulo(idsArticulosComida[i]);
				}
			}
		}

	}

	protected void setTituloComida(String tituloComida) {
		this.tituloComida = tituloComida;
	}

	protected void setTituloBebida(String tituloBebida) {
		this.tituloBebida = tituloBebida;
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CatalogoServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (articulosComida == null && articulosBebida == null) {
			response.sendError(response.SC_NOT_FOUND, "Articulos olvidados");
			return;
		}

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String docType = "<!DOCTYPE>\n";
		out.println(docType + "<html><head><title>" + "Restaurant IS6A" + "</title></head>"
				+ "<link href='Css/miEstilo.css' rel='stylesheet' type='text/css' />" + "<body id='cuerpo'>"
				+ "<header>" + "<h1>Restaurant: IS6A</h1>" + "</header>" + "<nav>" + "	<div id='header'>"
				+ "		<ul class='nav'>" + "			<li><a href='./Inicio.html'>Inicio</a></li>"
				+ "			<li><a href='./Contacto.html'>Contacto</a></li>"
				+ "			<li><a href='./Galeria.html'>Galeria</a></li>"
				+ "			<li><a href='./ServicioProducto.html'>Servicios y productos</a></li>"
				+ "			<li><a href='./ListaContactos.html'>Lista de contactos</a></li>" + "		</ul>"
				+ "	</div>" + "</nav>");
		if (articulosComida != null) {
			out.println("<br><br><br><hr>");
			out.println("<H1  ALIGN='CENTER'>" + "Comidas" + "</h1>");
			out.println("<hr>");
			Articulo objArticuloComida;
			for (int i = 0; i < articulosComida.length; i++) {

				objArticuloComida = articulosComida[i];
				if (objArticuloComida == null) {
					out.print("<font color='red'>Id del articulo desconocido" + idsArticulosComida[i] + "</font>");
				} else {
					out.println();
					String formURL = "./ComprarServlet";
					formURL = response.encodeURL(formURL);
					out.println("<div id='divForm'>" + "<Form action='./" + formURL + "'>"
							+ "<INPUT TYPE='hidden' name='idArticulo'" + "value='" + objArticuloComida.getIdArticulo()
							+ "'/>" + "<h2>" + objArticuloComida.getDescripcionCorta() + "($"
							+ objArticuloComida.getCosto() + ")</h2>" + objArticuloComida.getDescripcionLarga()
							+ "<p><center><input type='submit' value='Agregar al carrito de compra'></center></form>"
							+ "</div>");
				}

			}
		}

		if (articulosBebida != null) {
			out.println("<hr>");
			out.println("<H1  ALIGN='CENTER'>" + "Bebidas" + "</h1>");
			out.println("<hr>");
			Articulo objArticuloBebida;
			for (int i = 0; i < articulosBebida.length; i++) {

				objArticuloBebida = articulosBebida[i];
				if (objArticuloBebida == null) {
					out.print("<font color='red'>Id del articulo desconocido" + idsArticulosComida[i] + "</font>");
				} else {
					out.println();
					String formURL = "./ComprarServlet";
					formURL = response.encodeURL(formURL);
					out.println("<div id='divForm'>" + "<Form action='./" + formURL + "'>"
							+ "<INPUT TYPE='hidden' name='idArticulo'" + "value='" + objArticuloBebida.getIdArticulo()
							+ "'/>" + "<h2>" + objArticuloBebida.getDescripcionCorta() + "($"
							+ objArticuloBebida.getCosto() + ")</h2>" + objArticuloBebida.getDescripcionLarga()
							+ "<p><center><input type='submit' value='Agregar al carrito de compra'></center></form>"
							+ "</div>");
				}

			}
		}

		out.println("<br><br><footer>Ing. de Software y sistemas computacionales<br></footer><hr></body></html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
