<%@page import="dao.CuentaJdbc"%>
<%@page import="java.util.List"%>
<%@page import="modelo.CuentaModelo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cuenta</title>
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
					<jsp:param value="cuenta" name="activo" />
				</jsp:include>
				<%
				
			}		
		%>
		

		<div class="clearfix"></div>
		<div class="clearfix"></div>
		<div class="col-md-12">


			<form action="<%=request.getContextPath() + "/CuentaControlador"%>"
				method="post" class="form-horizontal">
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
				<input name="accion" type="hidden" value="registrarCuenta">
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
				<div class="form-group">
					<label for="rol" class="col-sm-2 control-label">Tipo
						de cuenta:</label>
					<div class="col-sm-10">
						<select class="form-control" name="rol" id="rol">
							<option>Administrador</option>
							<option>Vendedor</option>
							<option>Usuario</option>
						</select>
					</div>
				</div>
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


		<div class="col-md-12">
			<br> <br>
			<%
				String eliminar = request.getParameter("eliminar") != null ? request.getParameter("eliminar") : "";
					if (!eliminar.equals("")) {
						String cssClass = eliminar.equals("true") ? "alert-success" : "alert-warning";
			%>
			<div class="form-group">
				<div class="alert <%=cssClass%>" role="alert">
					<%=request.getParameter("mensaje")%>
				</div>
			</div>
			<%
				}
			%>
			<%
				List<CuentaModelo> lista = CuentaJdbc.seleccionarCuentas();
					if (lista.size() > 0) {
			%>
			<div class="">
				<table class="table table-hover">
					<tr class="danger">
						<td colspan="10">Lista de Productos</td>

					</tr>
					<tr class="info text-center">
						<td>idCuenta</td>
						<td>Usuario</td>
						<td>Clave</td>
						<td>Rol</td>
						<td>Nombre</td>
						<td>Apellido paterno</td>
						<td>Apellido materno</td>
						<td>Email</td>
						<td>Editar</td>
						<td>Eliminar</td>
					</tr>
					<%
						for (CuentaModelo cuenta : lista) {
					%>
					<tr class="active text-center">
						<td><%=cuenta.getIdCuenta()%></td>
						<td><%=cuenta.getUsuario()%></td>
						<td><%=cuenta.getClave()%></td>
						<td><%=cuenta.getRol()%></td>
						<td><%=cuenta.getNombre()%></td>
						<td><%=cuenta.getApellidoPaterno()%></td>
						<td><%=cuenta.getApellidoMaterno()%></td>
						<td><%=cuenta.getEmail()%></td>
						<td>
							<form
								action="<%=request.getContextPath() + "/vista/editarCuenta.jsp"%>">
								<input type="hidden" name="idCuenta"
									value="<%=cuenta.getIdCuenta()%>">
								<div class="text-center">
									<button type="submit" class="btn btn-default">
										<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
									</button>
								</div>

							</form>

						</td>
						<td>
							<form action="<%=request.getContextPath() + "/CuentaControlador"%>">
								<input type="hidden" name="idCuenta"
									value="<%=cuenta.getIdCuenta()%>"> <input type="hidden"
									name="accion" value="eliminarCuenta">
								<div class="text-center">
									<button type="submit" class="btn btn-default">
										<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
									</button>
								</div>

							</form>
						</td>
					</tr>
					<%
						}
							}
					%>

				</table>
			</div>
			<div class="clearfix">&nbsp</div>
		<div class="clearfix">&nbsp</div>
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