<jsp:useBean id="cuentaBean" class="modelo.CuentaBean" scope="session"></jsp:useBean>
<%
		modelo.CuentaBean bean = (modelo.CuentaBean) session.getAttribute("cuentaBean");
// 		if (!bean.getPassword().equals("") && !bean.getUsuario().equals("")) {
		if (bean!=null) {
			if (!bean.getPassword().equals("") && !bean.getUsuario().equals("")) {
		
		%>
<h1>hola0</h1>
<h3 class="muted">Bienvenido:</h3>
<h3 class="muted"><jsp:getProperty property='usuario'
		name='cuentaBean' /></h3>
<%
			} else {
				
		%>
<h1>hola1</h1>
<%
		response.sendRedirect("./inicioSesion.jsp");
			}
		}else{
			
			%>
<h1>hola2</h1>
<%
			response.sendRedirect("./inicioSesion.jsp");
		}
	%>