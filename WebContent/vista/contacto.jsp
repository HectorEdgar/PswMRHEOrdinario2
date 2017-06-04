<%@page import="psw.ControladorCuenta"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ include file="../jsp/librerias.jsp"%>
<title>Contacto</title>
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
		String nombre=(request.getParameter("nombre"))!=null?request.getParameter("nombre"):"";
		String email=(request.getParameter("email"))!=null?request.getParameter("email"):"";
		String comentario=(request.getParameter("comentario"))!=null?request.getParameter("comentario"):"";
			
		if(!email.equals("") && !comentario.equals("") & !nombre.equals("")){
			%>
	<jsp:setProperty property="nombre" name="contactoBean"
		value="<%=nombre%>" />
	<jsp:setProperty property="email" name="contactoBean"
		value="<%=email%>" />
	<jsp:setProperty property="comentario" name="contactoBean"
		value="<%=comentario%>" />


	<jsp:forward page="procesarContacto.jsp">
		<jsp:param value="contacto" name="activo" />
	</jsp:forward>
	<%
		}
	%>
</body>
</html>

