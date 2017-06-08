<%@page import="dao.ContactoJdbc"%>
<%@page import="modelo.ContactoModelo"%>
<%@page import="java.util.List"%>
<%@page import="modelo.CuentaModelo"%>
<%@page import="psw.ControladorCuenta"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lista de contactos</title>
<%@ include file="../utilerias/librerias.jsp"%>
</head>
<body>
	<%
if (request.getSession().getAttribute("cuenta") != null) {
%>
	<div class="container">

		<%
			if(((CuentaModelo) request.getSession().getAttribute("cuenta")).getRol().toLowerCase().equals("usuario")){
				%>
		<jsp:include page="encabezado.jsp">
			<jsp:param value="listaContatos" name="activo" />
		</jsp:include>
		<%
				
			}		
		%>

		<div class="clearfix"></div>
		<div class="clearfix"></div>
		<div class="col-md-12">
			<h1>Contactos</h1>
			<div class="clearfix"></div>
			<div class="clearfix"></div>


			<%
				List<ContactoModelo> lista = ContactoJdbc.seleccionarContactos();
					if (lista.size() > 0) {
			%>
			<%
						for (ContactoModelo contacto : lista) {
					%>
			<div class="col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title"><%=contacto.getNombre()%></h3>
					</div>
					<div class="panel-body">Email: <%=contacto.getEmail()%></div>
				</div>
			</div>
			<%
						}
			}
					%>

		</div>
	</div>

	<%
		} else {
			response.sendRedirect(request.getContextPath() + "/vista/inicioSesion.jsp");
			System.out.println("cerrando sesion");
		}
	%>
</body>
</html>
