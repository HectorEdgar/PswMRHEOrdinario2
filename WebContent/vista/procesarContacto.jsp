<%@page import="modelo.ContactoBean"%>
<%@page import="psw.ControladorCuenta"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../jsp/librerias.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Procesar Contacto</title>
</head>
<body>
	<div class="container">
		<jsp:useBean id="cuentaBean" class="modelo.CuentaBean" scope="session" />
		<jsp:include page="encabezado.jsp">
			<jsp:param value="contacto" name="activo" />
		</jsp:include>
		<%
			ControladorCuenta.verificarCuenta(response, session);
		%>
		<div class="clearfix"></div>
		<div class="clearfix"></div>


		<jsp:useBean id="contactoBean" class="modelo.ContactoBean"
			scope="session"></jsp:useBean>
		<div class="alert alert-success" role="alert">

			<%
				ContactoBean bean = (ContactoBean) session.getAttribute("contactoBean");
				if (bean != null) {
					out.println("<strong>" + contactoBean.getNombre() + "</strong>"
							+ " su mensaje fue enviado y será respondido en las proximas 24 horas");
				}
			%>


		</div>
	</div>
</body>
</html>