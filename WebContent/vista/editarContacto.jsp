<%@page import="dao.ContactoJdbc"%>
<%@page import="modelo.ContactoModelo"%>
<%@page import="modelo.CuentaModelo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Editar Contacto</title>
<jsp:include page="../utilerias/librerias.jsp"></jsp:include>
</head>
<body>
<%
if (request.getSession().getAttribute("cuenta") != null) {
%>
	<div class="container">
		
		<%
			if(((CuentaModelo) request.getSession().getAttribute("cuenta")).getRol().toLowerCase().equals("administrador")){
				%>
				<jsp:include page="encabezadoAdministrador.jsp">
					<jsp:param value="contactoAdministrador" name="activo" />
				</jsp:include>
				<%
				
			}		
		%>
		<div class="clearfix"></div>
		<div class="clearfix"></div>
		<div class="col-md-12">


			<form action="<%=request.getContextPath() + "/ContactoControlador"%>"
				method="post" class="form-horizontal">
				<h1>Editar contacto</h1>
				<%
					ContactoModelo contacto = ContactoJdbc.seleccionarContacto(Integer.parseInt(request.getParameter("idContacto")));
					String editar = request.getParameter("editar") != null ? request.getParameter("editar") : "";
						if (!editar.equals("")) {
							String cssClass = editar.equals("true") ? "alert-success" : "alert-warning";
				%>
				<div class="form-group">
					<div class="alert <%=cssClass%>" role="alert">
						<%=request.getParameter("mensaje")%>
					</div>
				</div>
				<%
					}
				%>
				<input name="accion" type="hidden" value="editar">
				<div class="form-group" >
					<label for="idContacto" class="col-sm-2 control-label">idContacto:</label>
					<div class="col-sm-10">
						<input type="text" name="idContacto" id="idContacto"
							placeholder="Usuario:" class="form-control" value="<%=contacto.getIdContacto() %>" readonly="readonly">
					</div>
				</div>
				<div class="form-group">
					<label for="nombre" class="col-sm-2 control-label">Nombre:</label>
					<div class="col-sm-10">
						<input type="text" name="nombre" id="nombre"
							placeholder="Nombre:" class="form-control" value="<%=contacto.getNombre() %>">
					</div>
				</div>
				<div class="form-group">
					<label for="email" class="col-sm-2 control-label">Email:</label>
					<div class="col-sm-10">
						<input type="email" name="email" id="email"
							placeholder="email@email.com" class="form-control" value="<%=contacto.getEmail() %>">
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<input type="submit" class="btn btn-default" value="Editar">
					</div>
				</div>
			</form>

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