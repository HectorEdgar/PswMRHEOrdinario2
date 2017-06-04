package psw;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ContactoControladorServlet
 */
@WebServlet("/ContactoControladorServlet")
public class ContactoControladorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContactoControladorServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nombre= request.getParameter("nombre");
		String email= request.getParameter("email");
		String comentario= request.getParameter("comentario");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		if(nombre != null && email != null && comentario!=null){
			if(!nombre.equals("") && !email.equals("") && !comentario.equals("")){
				
			
			out.println(""+
			"<!DOCTYPE html>"+
			"<html>"+
			"<head>"+
			"<meta charset='ISO-8859-1'>"+
			"<title>Inicio de sesión</title>"+
			"<link href='Css/miEstilo.css' rel='stylesheet type'text/css' />"+
			"</head>"+
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
			"<footer>Ing. de Software y sistemas computacionales</footer>"+
			"<div id='contenido-formulario'>"+
			"<p>"+
			nombre+" su mensaje fue enviado y será respondido en las proximas 24 horas"+
			"</p>"+
			"</div>"+	
			"</body>"+
			"</html>");
			
			}else{
				out.println(""+
						"<!DOCTYPE html>"+
						"<html>"+
						"<head>"+
						"<meta charset='ISO-8859-1'>"+
						"<title>Inicio de sesión</title>"+
						"<link href='Css/miEstilo.css' rel='stylesheet type'text/css' />"+
						"</head>"+
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
						"<footer>Ing. de Software y sistemas computacionales</footer>"+
						"<div id='contenido-formulario'>"+
						"<p>"+
						" Su mensaje no pudo ser procesado"+
						"</p>"+
						"</div>"+	
						"</body>"+
						"</html>");
			}
		}else {
			out.println(""+
					"<!DOCTYPE html>"+
					"<html>"+
					"<head>"+
					"<meta charset='ISO-8859-1'>"+
					"<title>Inicio de sesión</title>"+
					"<link href='Css/miEstilo.css' rel='stylesheet type'text/css' />"+
					"</head>"+
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
					"<footer>Ing. de Software y sistemas computacionales</footer>"+
					"<div id='contenido-formulario'>"+
					"<p>"+
					" Su mensaje no pudo ser procesado"+
					"</p>"+
					"</div>"+	
					"</body>"+
					"</html>");
			
		}
		
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
