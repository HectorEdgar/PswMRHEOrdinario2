package controlador;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CarritoJdbc;
import modelo.CarritoModelo;



/**
 * Servlet implementation class CarritoControlador
 */
@WebServlet("/CarritoControlador")
public class CarritoControlador extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CarritoControlador() {
        super();
        // TODO Auto-generated constructor stub
    }

    private void procesarSolicitud(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String accion = request.getParameter("accion");
		
		if(accion==null){
			response.sendRedirect(request.getContextPath()+"/vista/inicio.jsp");
		}
        if (accion.equals("registrar")) {
        	this.registrarCarrito(request, response);
        }else{
        	if(accion.equals("editar")){
        		this.editarCarrito(request, response);
        	}else
        	{
        		if(accion.equals("eliminar")){
        			this.eliminarCarrito(request, response);
        		}else{
        			response.sendRedirect(request.getContextPath()+"/vista/inicio.jsp");
        		}
        	}
        }
	}
    private void editarCarrito(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	CarritoModelo carrito = new CarritoModelo(
    			Integer.parseInt(request.getParameter("idCarrito")),
    			Integer.parseInt(request.getParameter("idCuenta")),
    			Integer.parseInt(request.getParameter("idArticulo")),
    			request.getParameter("estado")
    			);
    	
    	if(CarritoJdbc.actualizarCarrito(carrito)>0){
    		response.sendRedirect(request.getContextPath()+"/vista/carritoAdministrador.jsp?mensaje=Se actualizo correctamente&eliminar=true");
    	}else{
    		response.sendRedirect(request.getContextPath()+"/vista/carritoAdministrador.jsp?mensaje=Ocurrio un error&eliminar=false");
    	}
    }
    private void eliminarCarrito(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	CarritoModelo carrito = CarritoJdbc.seleccionarCarrito(Integer.parseInt(request.getParameter("idCarrito")));
    	
    	if(CarritoJdbc.eliminarCarrito(carrito)>0){
    		response.sendRedirect(request.getContextPath()+"/vista/carritoAdministrador.jsp?mensaje=Se elimino correctamente&eliminar=true");
    	}else{
    		response.sendRedirect(request.getContextPath()+"/vista/carritoAdministrador.jsp?mensaje=Ocurrio un error al eliminar&eliminar=false");
    	}
    	
    }

    private void registrarCarrito(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	
    	CarritoModelo carrito = new CarritoModelo(
    			0,
    			Integer.parseInt(request.getParameter("idCuenta")),
    			Integer.parseInt(request.getParameter("idArticulo")),
    			request.getParameter("estado")
    			);
    	try {
    		if(CarritoJdbc.insertarCarrito(carrito)>0){
        		response.sendRedirect(request.getContextPath()+"/vista/carritoAdministrador.jsp?mensaje=Se agrego correctamente&insertar=true");
        	}else{
        		response.sendRedirect(request.getContextPath()+"/vista/carritoAdministrador.jsp?mensaje=Ocurrio un error al agregar&insertar=false");
        	}
		} catch (Exception e) {
			response.sendRedirect(request.getContextPath()+"/vista/carritoAdministrador.jsp?mensaje=Ocurrio un error al agregar&insertar=false");
		}
    	
    	
    	
    	
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//procesarSolicitud(request, response);
		this.procesarSolicitud(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		procesarSolicitud(request, response);
	}

}
