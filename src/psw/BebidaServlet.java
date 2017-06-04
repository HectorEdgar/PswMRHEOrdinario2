package psw;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BebidaServlet
 */
@WebServlet("/BebidaServlet")
public class BebidaServlet extends CatalogoServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void init() throws ServletException {
		String[] idsArticulos = {"pepsi","cocaCola"};
		setArticulosBebida(idsArticulos);
		setTituloBebida("Bebida");
	}
}
