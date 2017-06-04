package psw;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.NumberFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import carrito.ArticulosSolicitado;
import carrito.CarritoDeCompras;

@WebServlet("/ComprarServlet")
public class ComprarServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		CarritoDeCompras carrito;

		synchronized (session) {
			carrito = (CarritoDeCompras) session.getAttribute("CarritoDeCompras");
			// Nuevos visitadores obtiene un carrito de compras
			// Los visitantes previos mantienen sus existencias en el carro
			if (carrito == null) {
				carrito = new CarritoDeCompras();
				session.setAttribute("CarritoDeCompras", carrito);
			}
			String idArticulo = request.getParameter("idArticulo");
			if (idArticulo != null) {
				String numArticulosString = request.getParameter("numArticulos");
				if (numArticulosString == null) {
					// Si la solicitud especifica un ID pero no un numero
					// entonces los clientes llegan aqui via boton "Agregar
					// Articulo al Carrito"
					// en la pagina del catalogo
					carrito.agregarArticulo(idArticulo);
				} else {
					/*
					 * Si la solicitud especifico un ID y un numero, los
					 * clientes llegan aqui mediante un botón
					 * "Actualizar pedido" despues de cambiar el numero de
					 * articulos en la orden. Si es especificado un numero de 0,
					 * el elemento se eliminara del carrito.
					 */
					int numArticulos;
					try {
						numArticulos = Integer.parseInt(numArticulosString);
					} catch (NumberFormatException nfe) {
						numArticulos = 1;
					}
					carrito.setNumeroDeOrden(idArticulo, numArticulos);
				}
			}
		}
		// Si el cliente cambia o no el estado de la orden mostrar el estatus
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String title = "Estado de la orden de compra";
		String docType = "<!DOCTYPE>\n";
		out.println(docType + "<html><head><title>" + "Restaurant IS6A" + "</title></head>" +
				"<link href='Css/miEstilo.css' rel='stylesheet' type='text/css' />"+
				"<body id='cuerpo'>"+
				"<header>"+
				"<h1>Restaurant: IS6A</h1>"+
				"</header>"+
				"<nav>"+
				"	<div id='header'>"+
				"		<ul class='nav'>"+
				"			<li><a href='./Inicio.html'>Inicio</a></li>"+
				"			<li><a href='./Contacto.html'>Contacto</a></li>"+
				"			<li><a href='./Galeria.html'>Galeria</a></li>"+
				"			<li><a href='./ServicioProducto.html'>Servicios y productos</a></li>"+
				"			<li><a href='./ListaContactos.html'>Lista de contactos</a></li>"+
				"		</ul>"+
				"	</div>"+
				"</nav>"+
				"<br><br><br><h1>"+title+"</h1><br>");

		synchronized (session) {
			List<ArticulosSolicitado> listaArticulosSolicitados = carrito.getArticulossolicitados();
			if (listaArticulosSolicitados.size() == 0) {
				out.println("<H2><I>Ningun articulo en su carrito...</I></H2>");
			} else {
				// Si hay almenos un articulo en el carrito mostrar la tabla de
				// artidulos solicitados
				out.println("<div id='divCompraCarrito'><TABLE BORDER=1 ALIGN=\"CENTER\">\n" + "<TR BGCOLOR=\"#2ECCFA\">\n"
						+ "  <TH>Id Articulo<TH>Descripcion\n" + "  <TH>Costo Unitario<TH>Number<TH>Costo Total");
				ArticulosSolicitado artSolicitado;
				NumberFormat formatter = NumberFormat.getCurrencyInstance();
				/*
				 * Para cada entrada en el carrito de compras, crear una fila de
				 * la tabla mostrando ID, descripcion, costo por articulo,
				 * numero pedido y costo total. Poner el numero o cantidad
				 * solicitada de articulo en el campo de texto que el usuario
				 * puede cambiar, con el boton "Actualizar pedido" junto a el,
				 * vuelve a enviar a esta misma pagina pero especifica un numero
				 * diferente de elementos.
				 */
				for (int i = 0; i < listaArticulosSolicitados.size(); i++) {
					artSolicitado = listaArticulosSolicitados.get(i); // (ArticulosSolicitado)
																		// cast
					out.println("<TR>\n" + "  <TD>" + artSolicitado.getIdArticulo() + "\n" + " <TD>"
							+ artSolicitado.getDescripcionCorta() + "\n" + " <TD>"
							+ formatter.format(artSolicitado.getCostoUnitario()) + "\n" + " <TD>" + " <FORM>\n" // Enviar
																												// URL
																												// actual
							+ "  <INPUT TYPE=\"HIDDEN\" NAME=\"idArticulo\"\n" + "	VALUE=\""
							+ artSolicitado.getIdArticulo() + "\">\n" + "  <INPUT TYPE=\"TEXT\" NAME=\"numArticulos\"\n"
							+ "    SIZE=3 VALUE=\"" + artSolicitado.getNumArticulo() + "\">\n" + "<SMALL>\n"
							+ "  <INPUT TYPE=\"SUBMIT\"\n " + "	VALUE=\"Actualizar Solicitud\">\n" + "</SMALL>\n"
							+ " </FORM>\n" + " <TD>" + formatter.format(artSolicitado.getConstoTotal()));
				}
				String URLsalida = response.encodeURL("./RegistroDeSalida.html");
				// Boton "Procesar en caja" debajo de la tabla
				out.println("</TABLE>\n" + "<FORM ACTION=\"" + URLsalida + "\">\n" + "<BIG><CENTER>\n"
						+ "		<INPUT TYPE=\"SUBMIT\"\n" + " VALUE=\"Procesar en caja\">\n"
						+ "</CENTER></BIG></FORM>");
			}
			out.println("</div><br><br><footer>Ing. de Software y sistemas computacionales<br></footer><hr></BODY></HTML>");
		}
	}
}
