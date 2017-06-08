package controlador;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ComentarioJdbc;
import modelo.ComentarioModelo;



/**
 * Servlet implementation class ComentarioControlador
 */
@WebServlet("/ComentarioControlador")
public class ComentarioControlador extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ComentarioControlador() {
        super();
        // TODO Auto-generated constructor stub
    }

    private void procesarSolicitud(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String accion = request.getParameter("accion");
		
		if(accion==null){
			response.sendRedirect(request.getContextPath()+"/vista/inicio.jsp");
		}
        if (accion.equals("registrar")) {
        	this.registrarComentario(request, response);
        }else{
        	if(accion.equals("editar")){
        		this.editarComentario(request, response);
        	}else
        	{
        		if(accion.equals("eliminar")){
        			this.eliminarComentario(request, response);
        		}else{
        			if(accion.equals("registrarUsuario")){
            			this.registrarComentarioUsuario(request, response);
            		}else{
            			response.sendRedirect(request.getContextPath()+"/vista/inicio.jsp");
            		}
        		}
        	}
        }
	}
    private void editarComentario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	ComentarioModelo comentario = new ComentarioModelo(
    			Integer.parseInt(request.getParameter("idComentario")),
    			Integer.parseInt(request.getParameter("idCuenta")),
    			request.getParameter("comentario"),
    			Date.valueOf(request.getParameter("fecha"))
    			);
    	
    	if(ComentarioJdbc.actualizarComentario(comentario)>0){
    		response.sendRedirect(request.getContextPath()+"/vista/comentarioAdministrador.jsp?mensaje=Se actualizo correctamente&eliminar=true");
    	}else{
    		response.sendRedirect(request.getContextPath()+"/vista/comentarioAdministrador.jsp?mensaje=Ocurrio un error&eliminar=false");
    	}
    }
    private void eliminarComentario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	ComentarioModelo comentario = ComentarioJdbc.seleccionarComentario(Integer.parseInt(request.getParameter("idComentario")));
    	
    	if(ComentarioJdbc.eliminarComentario(comentario)>0){
    		response.sendRedirect(request.getContextPath()+"/vista/comentarioAdministrador.jsp?mensaje=Se elimino correctamente&eliminar=true");
    	}else{
    		response.sendRedirect(request.getContextPath()+"/vista/comentarioAdministrador.jsp?mensaje=Ocurrio un error al eliminar&eliminar=false");
    	}
    	
    }
    private void registrarComentarioUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	try {
    		Integer.parseInt(request.getParameter("idCuenta"));
		} catch (Exception e) {
			System.out.println(request.getParameter("idCuenta"));
		}
    	
    	ComentarioModelo comentario = new ComentarioModelo(
    			0,
    			Integer.parseInt(request.getParameter("idCuenta")),
    			request.getParameter("comentario"),
    			new Date(new java.util.Date().getTime())
    			);
    	try {
    		if(ComentarioJdbc.insertarComentario(comentario)>0){
        		response.sendRedirect(request.getContextPath()+"/vista/comentarioUsuario.jsp?mensaje=Se agrego correctamente&insertar=true");
        	}else{
        		response.sendRedirect(request.getContextPath()+"/vista/comentarioUsuario.jsp?mensaje=Ocurrio un error al agregar&insertar=false");
        	}
		} catch (Exception e) {
			response.sendRedirect(request.getContextPath()+"/vista/comentarioUsuario.jsp?mensaje=Ocurrio un error al agregar&insertar=false");
		}  	
    	
    }
    private void registrarComentario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	try {
    		Integer.parseInt(request.getParameter("idCuenta"));
		} catch (Exception e) {
			System.out.println(request.getParameter("idCuenta"));
		}
    	
    	ComentarioModelo comentario = new ComentarioModelo(
    			0,
    			Integer.parseInt(request.getParameter("idCuenta")),
    			request.getParameter("comentario"),
    			Date.valueOf(request.getParameter("fecha"))
    			);
    	try {
    		if(ComentarioJdbc.insertarComentario(comentario)>0){
        		response.sendRedirect(request.getContextPath()+"/vista/comentarioAdministrador.jsp?mensaje=Se agrego correctamente&insertar=true");
        	}else{
        		response.sendRedirect(request.getContextPath()+"/vista/comentarioAdministrador.jsp?mensaje=Ocurrio un error al agregar&insertar=false");
        	}
		} catch (Exception e) {
			response.sendRedirect(request.getContextPath()+"/vista/comentarioAdministrador.jsp?mensaje=Ocurrio un error al agregar&insertar=false");
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
