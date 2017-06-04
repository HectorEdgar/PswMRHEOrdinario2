package psw;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.html.HTML;

/**
 * Servlet implementation class LogginControladorServlet
 */
@WebServlet("/LoginControladorServlet")
public class LoginControladorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginControladorServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String usuario = request.getParameter("usuario");
		String password = request.getParameter("password");
		String servletFormulario = request.getContextPath()+"/";
		if(usuario != null && password != null){
			
			
			
			if(usuario.equals("root") && password.equals("root")){
				Cookie c = new Cookie("usuario", password);
				c.setMaxAge(60*5);
				c= new Cookie("password", password);
				c.setMaxAge(60*5);
				
				response.sendRedirect(servletFormulario+"Inicio.html");
				

			}else{
				response.sendRedirect(servletFormulario+"Loggin.html");
			}
		}else{
			response.sendRedirect(servletFormulario+"Loggin.html");
			
		}
		
		
		
		//response.getWriter().append("Served at: ").append(request.getContextPath()+request.getContentType());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
