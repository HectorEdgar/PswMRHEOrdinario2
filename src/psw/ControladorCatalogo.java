package psw;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ControladorCatalogo
 */
@WebServlet("/ControladorCatalogo")
public class ControladorCatalogo extends CatalogoServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void init() throws ServletException {

		String[] idsArticulosComida = { "hall001", "hall002", "lewis001", "alexander001", "rowling001" };
		setArticulosComida(idsArticulosComida);
		setTituloComida("Comida ");
		String[] idsArticulosBebida = { "pepsi", "cocaCola" };
		setArticulosBebida(idsArticulosBebida);
		setTituloBebida("Bebida");
	}

}
