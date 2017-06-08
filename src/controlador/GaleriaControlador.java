package controlador;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.GaleriaJdbc;
import modelo.GaleriaModelo;

/**
 * Servlet implementation class GaleriaControlador
 */
@WebServlet("/GaleriaControlador")
@MultipartConfig
public class GaleriaControlador extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GaleriaControlador() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	private void procesarSolicitud(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String accion = request.getParameter("accion");
		request.setCharacterEncoding("utf-8");
		if (accion == null) {
			response.sendRedirect(request.getContextPath() + "/vista/inicio.jsp");
		} else {
			if (accion.equals("registrar")) {
				this.registrarGaleria(request, response);
			} else {
				if (accion.equals("editar")) {
					this.editarGaleria(request, response);
				} else {
					if (accion.equals("eliminar")) {
						this.eliminarGaleria(request, response);
					} else {
						response.getWriter().println(accion);
					}
				}
			}
		}
	}

	private void editarGaleria(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Part archivo = request.getPart("ubicacion2");

		int idGaleria=Integer.parseInt(request.getParameter("idGaleria"));
		GaleriaModelo galeria = new GaleriaModelo(
				idGaleria,
				request.getParameter("nombre"),
				archivo.getSubmittedFileName());

		GaleriaModelo galeria2 = GaleriaJdbc.seleccionarGaleria(idGaleria);
		
		if (!galeria.getUbicacion().equals(galeria2.getUbicacion())) {
			InputStream is = archivo.getInputStream();
			String ruta = request.getServletContext().getRealPath("/") + "/img" + "/" + archivo.getSubmittedFileName();
			
			FileOutputStream fos = new FileOutputStream(new File(ruta));
			int dato = is.read();
			while (dato != -1) {
				fos.write(dato);
				dato = is.read();
			}
			File file = new File(request.getServletContext().getRealPath("/") + "/img" + "/" +galeria2.getUbicacion());
			file.delete();
			fos.close();
			is.close();
		}

		if (GaleriaJdbc.actualizarGaleria(galeria) > 0) {
			response.sendRedirect(request.getContextPath()
					+ "/vista/galeriaAdministrador.jsp?mensaje=Se actualizo correctamente&eliminar=true");
		} else {
			response.sendRedirect(request.getContextPath()
					+ "/vista/galeriaAdministrador.jsp?mensaje=Ocurrio un error&eliminar=false");
		}
	}

	private void eliminarGaleria(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		GaleriaModelo galeria = GaleriaJdbc.seleccionarGaleria(Integer.parseInt(request.getParameter("idGaleria")));

		if (GaleriaJdbc.eliminarGaleria(galeria) > 0) {
			String ruta = request.getServletContext().getRealPath("/") + "/img" + "/" + galeria.getUbicacion();
			File file = new File(ruta);
			file.delete();
			response.sendRedirect(request.getContextPath()
					+ "/vista/galeriaAdministrador.jsp?mensaje=Se elimino correctamente&eliminar=true");
		} else {
			response.sendRedirect(request.getContextPath()
					+ "/vista/galeriaAdministrador.jsp?mensaje=Ocurrio un error al eliminar&eliminar=false");
		}

	}

	private void registrarGaleria(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Part archivo = request.getPart("ubicacion");
		InputStream is = archivo.getInputStream();
		String ruta = request.getServletContext().getRealPath("/") + "img" + "/" + archivo.getSubmittedFileName();
		FileOutputStream fos = new FileOutputStream(new File(ruta));
		int dato = is.read();
		while (dato != -1) {
			fos.write(dato);
			dato = is.read();
		}
		fos.close();
		is.close();

		GaleriaModelo galeria = new GaleriaModelo(0, request.getParameter("nombre"), archivo.getSubmittedFileName());
		try {
			if (GaleriaJdbc.insertarGaleria(galeria) > 0) {
				System.out.println(ruta);
				response.sendRedirect(request.getContextPath()
						+ "/vista/galeriaAdministrador.jsp?mensaje=Se agrego correctamente&insertar=true");
			} else {
				response.sendRedirect(request.getContextPath()
						+ "/vista/galeriaAdministrador.jsp?mensaje=Ocurrio un error al agregar&insertar=false");
			}
		} catch (Exception e) {
			response.sendRedirect(request.getContextPath()
					+ "/vista/galeriaAdministrador.jsp?mensaje=Ocurrio un error al agregar&insertar=false");
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
