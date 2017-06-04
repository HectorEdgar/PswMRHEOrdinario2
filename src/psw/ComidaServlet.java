package psw;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ComidaServlet
 */
@WebServlet("/ComidaServlet")
public class ComidaServlet extends CatalogoServlet {
	private static final long serialVersionUID = 1L;  	
	@Override
	public void init() throws ServletException {
		String[] idsArticulos = {"hall001","hall002","lewis001","alexander001","rowling001"};
		setArticulosComida(idsArticulos);
		setTituloComida("Comida ");
	}

}
