package controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ArticuloJdbc;
import dao.GaleriaJdbc;
import modelo.ArticuloModelo;
import modelo.GaleriaModelo;

/**
 * Servlet implementation class ArticuloControlador
 */
@WebServlet("/ArticuloControlador")
public class ArticuloControlador extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ArticuloControlador() {
		super();
		// TODO Auto-generated constructor stub
	}

	private void procesarSolicitud(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String accion = request.getParameter("accion");

		if (accion == null) {
			response.sendRedirect(request.getContextPath() + "/vista/inicio.jsp");
		}
		if (accion.equals("registrar")) {
			this.registrarArticulo(request, response);
		} else {
			if (accion.equals("editar")) {
				this.editarArticulo(request, response);
			} else {
				if (accion.equals("eliminar")) {
					this.eliminarArticulo(request, response);
				} else {
					if (accion.equals("imagen")) {
						this.cargarImagen(request, response);
					} else {
						if (accion.equals("imagenEditar")) {
							this.cargarImagenEditar(request, response);
						} else {
							response.getWriter().println(accion);
						}
					}
				}
			}
		}
	}

	private void cargarImagen(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		GaleriaModelo galeria = GaleriaJdbc.seleccionarGaleria(Integer.parseInt(request.getParameter("idGaleria")));

		if (galeria != null) {
			response.sendRedirect(request.getContextPath() + "/vista/articuloAdministrador.jsp?imagen="
					+ galeria.getUbicacion() + "&idGaleria=" + galeria.getIdGaleria() + "&" + "descripcionLarga="
					+ request.getParameter("descripcionLarga") + "&costo=" + request.getParameter("costo") + "&tipo="
					+ request.getParameter("tipo") + "&descripcionCorta=" + request.getParameter("descripcionCorta")
					+"&estado="+request.getParameter("estado")+"&nombre="+request.getParameter("nombre"));
		} else {
			response.sendRedirect(request.getContextPath() + "/vista/articuloAdministrador.jsp");
		}

	}

	private void cargarImagenEditar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		GaleriaModelo galeria = GaleriaJdbc.seleccionarGaleria(Integer.parseInt(request.getParameter("idGaleria")));

		if (galeria != null) {
			response.sendRedirect(request.getContextPath() + "/vista/editarArticulo.jsp?imagen="
					+ galeria.getUbicacion() + "&idGaleria=" + galeria.getIdGaleria() + "&" + "descripcionLarga="
					+ request.getParameter("descripcionLarga") + "&costo=" + request.getParameter("costo") + "&tipo="
					+ request.getParameter("tipo") + "&descripcionCorta=" + request.getParameter("descripcionCorta")
					+ "&idArticulo=" + request.getParameter("idArticulo")
					+"&estado="+ request.getParameter("estado")+"&nombre="+ request.getParameter("nombre"));
		} else {
			response.sendRedirect(request.getContextPath() + "/vista/articuloAdministrador.jsp");
		}

	}

	private void editarArticulo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArticuloModelo articulo = new ArticuloModelo(
				Integer.parseInt(request.getParameter("idArticulo")),
				Integer.parseInt(request.getParameter("idGaleria")), 
				request.getParameter("descripcionCorta"),
				request.getParameter("descripcionLarga"), 
				Double.valueOf(request.getParameter("costo")),
				request.getParameter("tipo"),
				request.getParameter("estado"),
				request.getParameter("nombre"));

		if (ArticuloJdbc.actualizarArticulo(articulo) > 0) {
			response.sendRedirect(request.getContextPath()
					+ "/vista/articuloAdministrador.jsp?mensaje=Se actualizo correctamente&eliminar=true");
		} else {
			response.sendRedirect(request.getContextPath()
					+ "/vista/articuloAdministrador.jsp?mensaje=Ocurrio un error&eliminar=false");
		}
	}

	private void eliminarArticulo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArticuloModelo articulo = ArticuloJdbc
				.seleccionarArticulo(Integer.parseInt(request.getParameter("idArticulo")));

		if (ArticuloJdbc.eliminarArticulo(articulo) > 0) {
			response.sendRedirect(request.getContextPath()
					+ "/vista/articuloAdministrador.jsp?mensaje=Se elimino correctamente&eliminar=true");
		} else {
			response.sendRedirect(request.getContextPath()
					+ "/vista/articuloAdministrador.jsp?mensaje=Ocurrio un error al eliminar&eliminar=false");
		}

	}

	private void registrarArticulo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			Integer.parseInt(request.getParameter("idCuenta"));
		} catch (Exception e) {
			System.out.println(request.getParameter("idCuenta"));
		}

		ArticuloModelo articulo = new ArticuloModelo(0, Integer.parseInt(request.getParameter("idGaleria")),
				request.getParameter("descripcionCorta"), request.getParameter("descripcionLarga"),
				Double.valueOf(request.getParameter("costo")), request.getParameter("tipo"),
				request.getParameter("estado"),
				request.getParameter("nombre"));
		try {
			if (ArticuloJdbc.insertarArticulo(articulo) > 0) {
				response.sendRedirect(request.getContextPath()
						+ "/vista/articuloAdministrador.jsp?mensaje=Se agrego correctamente&insertar=true");
			} else {
				response.sendRedirect(request.getContextPath()
						+ "/vista/articuloAdministrador.jsp?mensaje=Ocurrio un error al agregar&insertar=false");
			}
		} catch (Exception e) {
			response.sendRedirect(request.getContextPath()
					+ "/vista/articuloAdministrador.jsp?mensaje=Ocurrio un error al agregar&insertar=false");
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// procesarSolicitud(request, response);
		this.procesarSolicitud(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		procesarSolicitud(request, response);
	}

}
