<%@page import="dao.CuentaJdbc"%>
<%@page import="modelo.CuentaModelo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Editar Cuenta</title>
<jsp:include page="../utilerias/librerias.jsp"></jsp:include>
</head>
<body>
	<%
		if (request.getSession().getAttribute("cuenta") != null
				&& ((CuentaModelo) request.getSession().getAttribute("cuenta")).getRol().toLowerCase().equals("administrador")) {
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


			<form action="<%=request.getContextPath() + "/CuentaControlador"%>"
				method="post" class="form-horizontal">
				<h1>Editar cuenta</h1>
				<%
					CuentaModelo cuenta = CuentaJdbc.seleccionarCuenta(Integer.parseInt(request.getParameter("idCuenta")));
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
				<input name="accion" type="hidden" value="editarCuenta">
				<div class="form-group" >
					<label for="idCuenta" class="col-sm-2 control-label">idCuenta:</label>
					<div class="col-sm-10">
						<input type="text" name="idCuenta" id="idCuenta"
							placeholder="Usuario:" class="form-control" value="<%=cuenta.getIdCuenta() %>" readonly="readonly">
					</div>
				</div>
				<div class="form-group">
					<label for="usuario" class="col-sm-2 control-label">Usuario:</label>
					<div class="col-sm-10">
						<input type="text" name="usuario" id="usuario"
							placeholder="Usuario:" class="form-control" value="<%=cuenta.getUsuario() %>">
					</div>
				</div>
				<div class="form-group">
					<label for="contraseña" class="col-sm-2 control-label">Contraseña:</label>
					<div class="col-sm-10">
						<input type="password" name="clave" id="clave"
							placeholder="******" class="form-control" value="<%=cuenta.getClave() %>">
					</div>
				</div>
				<div class="form-group">
					<label for="contraseña" class="col-sm-2 control-label">Tipo
						de cuenta:</label>
					<div class="col-sm-10">
						<select class="form-control" name="rol" id="rol" >
							<option  <%=cuenta.getRol().toLowerCase().equals("administrador")?"selected='selected'":"" %>>Administrador</option>
							<option <%=cuenta.getRol().toLowerCase().equals("vendedor")?"selected='selected'":""%>>Vendedor</option>
							<option <%=cuenta.getRol().toLowerCase().equals("usuario")?"selected='selected'":"" %>>Usuario</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label for="nombre" class="col-sm-2 control-label">Nombre:</label>
					<div class="col-sm-10">
						<input type="text" name="nombre" id="nombre" placeholder="Nombre:"
							class="form-control" value="<%=cuenta.getNombre()%>">
					</div>
				</div>
				<div class="form-group">
					<label for="apellidoPaterno" class="col-sm-2 control-label">Apellido
						paterno:</label>
					<div class="col-sm-10">
						<input type="text" name="apellidoPaterno" id="apellidoPaterno"
							placeholder="Apellido paterno:" class="form-control" value="<%=cuenta.getApellidoPaterno()%>">
					</div>
				</div>
				<div class="form-group">
					<label for="apellidoMaterno" class="col-sm-2 control-label">Apellido
						materno:</label>
					<div class="col-sm-10">
						<input type="text" name="apellidoMaterno" id="apellidoMaterno"
							placeholder="Apellido materno:" class="form-control" value="<%=cuenta.getApellidoMaterno()%>">
					</div>
				</div>
				<div class="form-group">
					<label for="email" class="col-sm-2 control-label">Email:</label>
					<div class="col-sm-10">
						<input type="email" name="email" id="email" placeholder="Email:"
							class="form-control" value="<%=cuenta.getEmail() %>">
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
		}
	%>
</body>
</html>