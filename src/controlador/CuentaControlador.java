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
        if (accion.equals("inicioSesion")) {
            this.inicioSesion(request, response); 
        }else{
        	if(accion.equals("registrarCuenta")){
        		this.registrarCuenta(request, response);
        	}
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
    	
    	if(CuentaJdbc.insertarCuenta(cuenta)>0){
    		response.sendRedirect(request.getContextPath()+"/vista/cuenta.jsp?mensaje=Se agrego correctamente");
    	}else{
    		response.sendRedirect(request.getContextPath()+"/vista/cuenta.jsp?mensaje=Ocurrio un error al agregar");
    	}
    	
    	
    	
    }
    private void inicioSesion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	CuentaModelo cuenta = CuentaJdbc.seleccionarCuenta(request.getParameter("usuario"), request.getParameter("clave"));
		if(cuenta!=null){
			request.getSession().setAttribute("cuenta",cuenta);
			response.sendRedirect(request.getContextPath()+"/vista/inicio.jsp?");
		}else{
			response.sendRedirect(request.getContextPath()+"/vista/inicioSesion.jsp?mensaje=Usuario o clave incorrectos");
		}
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//procesarSolicitud(request, response);
		inicioSesion(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		procesarSolicitud(request, response);
	}

}
