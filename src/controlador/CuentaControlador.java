package controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CuentaJdbc;
import modelo.CuentaModelo;

/**
 * Servlet implementation class ControladorCuenta
 */
@WebServlet("/CuentaControlador")
public class CuentaControlador extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CuentaControlador() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    private void procesarSolicitud(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String accion = request.getParameter("accion");
		
		if(accion==null){
			response.sendRedirect(request.getContextPath()+"/vista/inicio.jsp");
		}
        if (accion.equals("inicioSesion")) {
            this.inicioSesion(request, response); 
        }else{
        	if(accion.equals("registrarCuenta")){
        		this.registrarCuenta(request, response);
        	}else
        	{
        		if(accion.equals("editarCuenta")){
        			this.editarCuenta(request, response);
        		}else{
        			if(accion.equals("eliminarCuenta")){
        				this.eliminarCuenta(request, response);
        			}else{
        				if(accion.equals("registrarNuevoUsuario")){
        					this.registrarNuevoUsuario(request, response);
        				}
        			}
        		}
        	}
        }
	}
    private void editarCuenta(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	CuentaModelo cuenta = new CuentaModelo(
    			Integer.parseInt(request.getParameter("idCuenta")),
    			request.getParameter("usuario"),
    			request.getParameter("clave"),
    			request.getParameter("rol"),
    			request.getParameter("nombre"),
    			request.getParameter("apellidoPaterno"),
    			request.getParameter("apellidoMaterno"),
    			request.getParameter("email")
    			);
    	
    	if(CuentaJdbc.actualizarCuenta(cuenta)>0){
    		response.sendRedirect(request.getContextPath()+"/vista/cuenta.jsp?mensaje=Se actualizo correctamente&eliminar=true");
    	}else{
    		response.sendRedirect(request.getContextPath()+"/vista/cuenta.jsp?mensaje=Ocurrio un error&eliminar=false");
    	}
    }
    private void eliminarCuenta(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	CuentaModelo cuenta = CuentaJdbc.seleccionarCuenta(Integer.parseInt(request.getParameter("idCuenta")));
    	
    	if(CuentaJdbc.eliminarCuenta(cuenta)>0){
    		response.sendRedirect(request.getContextPath()+"/vista/cuenta.jsp?mensaje=Se elimino correctamente&eliminar=true");
    	}else{
    		response.sendRedirect(request.getContextPath()+"/vista/cuenta.jsp?mensaje=Ocurrio un error al eliminar&eliminar=false");
    	}
    	
    }
    private void registrarNuevoUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	CuentaModelo cuenta = new CuentaModelo(
    			0,
    			request.getParameter("usuario"),
    			request.getParameter("clave"),
    			request.getParameter("rol"),
    			request.getParameter("nombre"),
    			request.getParameter("apellidoPaterno"),
    			request.getParameter("apellidoMaterno"),
    			request.getParameter("email")
    			);
    	try {
    		if(CuentaJdbc.insertarCuenta(cuenta)>0){
        		response.sendRedirect(request.getContextPath()+"/vista/inicioSesion.jsp?mensaje=Se agrego correctamente&insertar=true");
        	}else{
        		response.sendRedirect(request.getContextPath()+"/vista/inicioSesion.jsp?mensaje=Ocurrio un error al agregar&insertar=false");
        	}
		} catch (Exception e) {
			response.sendRedirect(request.getContextPath()+"/vista/inicioSesion.jsp?mensaje=Ocurrio un error al agregar&insertar=false");
		}
    	
    	
    	
    	
    }
    private void registrarCuenta(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	CuentaModelo cuenta = new CuentaModelo(
    			0,
    			request.getParameter("usuario"),
    			request.getParameter("clave"),
    			request.getParameter("rol"),
    			request.getParameter("nombre"),
    			request.getParameter("apellidoPaterno"),
    			request.getParameter("apellidoMaterno"),
    			request.getParameter("email")
    			);
    	try {
    		if(CuentaJdbc.insertarCuenta(cuenta)>0){
        		response.sendRedirect(request.getContextPath()+"/vista/cuenta.jsp?mensaje=Se agrego correctamente&insertar=true");
        	}else{
        		response.sendRedirect(request.getContextPath()+"/vista/cuenta.jsp?mensaje=Ocurrio un error al agregar&insertar=false");
        	}
		} catch (Exception e) {
			response.sendRedirect(request.getContextPath()+"/vista/cuenta.jsp?mensaje=Ocurrio un error al agregar&insertar=false");
		}
    	
    	
    	
    	
    }
    private void inicioSesion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	CuentaModelo cuenta = CuentaJdbc.seleccionarCuenta(request.getParameter("usuario"), request.getParameter("clave"));
		if(cuenta!=null){
			request.getSession().setAttribute("cuenta",cuenta);
			response.sendRedirect(request.getContextPath()+"/vista/inicio.jsp?");
		}else{
			response.sendRedirect(request.getContextPath()+"/vista/inicioSesion.jsp?mensaje=Usuario o clave incorrectos&insertar=false");
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
