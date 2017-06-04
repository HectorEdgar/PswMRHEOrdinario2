package psw;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ControladorCuenta {

	//Verifica si hay una sesion iniciada y si no redirecciona a la pagina de inicio de sesión
	public static void verificarCuenta(HttpServletResponse response, HttpSession session) throws IOException{
		
		modelo.CuentaBean bean = (modelo.CuentaBean) session.getAttribute("cuentaBean");
// 		if (!bean.getPassword().equals("") && !bean.getUsuario().equals("")) {
		if (bean!=null) {
			if (bean.getPassword().equals("") || bean.getUsuario().equals("")) {
				response.sendRedirect("./inicioSesion.jsp");
			}
			if(bean.getPassword().equals("root") || bean.getUsuario().equals("root")){
				
			}
		}else{

			response.sendRedirect("./inicioSesion.jsp");
		}
	}
}
