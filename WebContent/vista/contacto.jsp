<%@page import="modelo.CuentaModelo"%>
<%@page import="psw.ControladorCuenta"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ include file="../utilerias/librerias.jsp"%>
<title>Contacto</title>
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
					<jsp:param value="contacto" name="activo" />
				</jsp:include>
				<%
				
			}		
		%>
	
		<div class="clearfix"></div>
		<div class="clearfix"></div>
		<div class="container">
			<jsp:useBean id="contactoBean" class="modelo.ContactoBean"
				scope="session" />
			<form action="<%=request.getContextPath()+"/vista/contacto.jsp"%>"
				method="get" class="form-horizontal">
				<h1>Envia un comentario</h1>
				<div class="form-group">
					<label for="nombre" class="col-sm-2 control-label">Nombre:</label>
					<div class="col-sm-10">
						<input type="text" name="nombre" id="nombre" placeholder="Nombre:"
							class="form-control">
					</div>
				</div>
				<div class="form-group">
					<label for="email" class="col-sm-2 control-label">Email:</label>
					<div class="col-sm-10">
						<input type="email" name="email" id="email"
							placeholder="email@email.com" class="form-control">
					</div>
				</div>

				<div class="form-group">
					<label for="comentario" class="col-sm-2 control-label">Comentario:</label>
					<div class="col-sm-10">
						<textarea id="comentario" name="comentario"
							placeholder="Comentario:" class="form-control"></textarea>
					</div>

				</div>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<input type="submit" class="btn btn-default" value="Enviar">
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

