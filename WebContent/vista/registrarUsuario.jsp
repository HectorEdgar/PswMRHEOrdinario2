<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registro de usuario</title>
<jsp:include page="../utilerias/librerias.jsp"></jsp:include>

</head>
<body>
	<div class="container">

		<jsp:include page="encabezado.jsp">
			<jsp:param value="cuenta" name="activo" />
		</jsp:include>

		<div class="clearfix"></div>
		<div class="clearfix"></div>
		<div class="col-md-12">


			<form action="<%=request.getContextPath() + "/CuentaControlador"%>"
				method="get" class="form-horizontal">
				<h1>Agregar cuenta</h1>
				<%
					String insertar = request.getParameter("insertar") != null ? request.getParameter("insertar") : "";
					if (!insertar.equals("")) {
						String cssClass = insertar.equals("true") ? "alert-success" : "alert-warning";
				%>
				<div class="form-group">
					<div class="alert <%=cssClass%>" role="alert">
						<%=request.getParameter("mensaje")%>
					</div>
				</div>
				<%
					}
				%>
				<input name="accion" type="hidden" value="registrarNuevoUsuario">
				<div class="form-group">
					<label for="usuario" class="col-sm-2 control-label">Usuario:</label>
					<div class="col-sm-10">
						<input type="text" name="usuario" id="usuario"
							placeholder="Usuario:" class="form-control">
					</div>
				</div>
				<div class="form-group">
					<label for="contraseña" class="col-sm-2 control-label">Contraseña:</label>
					<div class="col-sm-10">
						<input type="password" name="clave" id="clave"
							placeholder="******" class="form-control">
					</div>
				</div>

				<input type="hidden" value="Usuario" name="rol" id="rol">

				<div class="form-group">
					<label for="nombre" class="col-sm-2 control-label">Nombre:</label>
					<div class="col-sm-10">
						<input type="text" name="nombre" id="nombre" placeholder="Nombre:"
							class="form-control">
					</div>
				</div>
				<div class="form-group">
					<label for="apellidoPaterno" class="col-sm-2 control-label">Apellido
						paterno:</label>
					<div class="col-sm-10">
						<input type="text" name="apellidoPaterno" id="apellidoPaterno"
							placeholder="Apellido paterno:" class="form-control">
					</div>
				</div>
				<div class="form-group">
					<label for="apellidoMaterno" class="col-sm-2 control-label">Apellido
						materno:</label>
					<div class="col-sm-10">
						<input type="text" name="apellidoMaterno" id="apellidoMaterno"
							placeholder="Apellido materno:" class="form-control">
					</div>
				</div>
				<div class="form-group">
					<label for="email" class="col-sm-2 control-label">Email:</label>
					<div class="col-sm-10">
						<input type="email" name="email" id="email" placeholder="Email:"
							class="form-control">
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<input type="submit" class="btn btn-default" value="Agregar">
					</div>
				</div>
			</form>

		</div>
	</div>
</body>
</html>