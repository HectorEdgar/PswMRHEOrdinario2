package controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ContactoJdbc;
import modelo.ContactoModelo;



/**
 * Servlet implementation class ContactoControlador
 */
@WebServlet("/ContactoControlador")
public class ContactoControlador extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContactoControlador() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    private void procesarSolicitud(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String accion = request.getParameter("accion");
		
		if(accion==null){
			response.sendRedirect(request.getContextPath()+"/vista/inicio.jsp");
		}
        if (accion.equals("registrar")) {
        	this.registrarContacto(request, response);
        }else{
        	if(accion.equals("editar")){
        		this.editarContacto(request, response);
        	}else
        	{
        		if(accion.equals("eliminar")){
        			this.eliminarContacto(request, response);
        		}else{
        			response.sendRedirect(request.getContextPath()+"/vista/inicio.jsp");
        		}
        	}
        }
	}
    private void editarContacto(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	ContactoModelo contacto = new ContactoModelo(
    			Integer.parseInt(request.getParameter("idContacto")),
    			request.getParameter("nombre"),
    			request.getParameter("email")
    			);
    	
    	if(ContactoJdbc.actualizarContacto(contacto)>0){
    		response.sendRedirect(request.getContextPath()+"/vista/contactoAdministrador.jsp?mensaje=Se actualizo correctamente&eliminar=true");
    	}else{
    		response.sendRedirect(request.getContextPath()+"/vista/contactoAdministrador.jsp?mensaje=Ocurrio un error&eliminar=false");
    	}
    }
    private void eliminarContacto(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	ContactoModelo contacto = ContactoJdbc.seleccionarContacto(Integer.parseInt(request.getParameter("idContacto")));
    	
    	if(ContactoJdbc.eliminarContacto(contacto)>0){
    		response.sendRedirect(request.getContextPath()+"/vista/contactoAdministrador.jsp?mensaje=Se elimino correctamente&eliminar=true");
    	}else{
    		response.sendRedirect(request.getContextPath()+"/vista/contactoAdministrador.jsp?mensaje=Ocurrio un error al eliminar&eliminar=false");
    	}
    	
    }

    private void registrarContacto(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	ContactoModelo contacto = new ContactoModelo(
    			0,
    			request.getParameter("nombre"),
    			request.getParameter("email")
    			);
    	try {
    		if(ContactoJdbc.insertarContacto(contacto)>0){
        		response.sendRedirect(request.getContextPath()+"/vista/contactoAdministrador.jsp?mensaje=Se agrego correctamente&insertar=true");
        	}else{
        		response.sendRedirect(request.getContextPath()+"/vista/contactoAdministrador.jsp?mensaje=Ocurrio un error al agregar&insertar=false");
        	}
		} catch (Exception e) {
			response.sendRedirect(request.getContextPath()+"/vista/contactoAdministrador.jsp?mensaje=Ocurrio un error al agregar&insertar=false");
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
