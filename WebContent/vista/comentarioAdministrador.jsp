<%@page import="dao.CuentaJdbc"%>
<%@page import="modelo.ComentarioModelo"%>
<%@page import="java.util.List"%>
<%@page import="dao.ComentarioJdbc"%>
<%@page import="modelo.CuentaModelo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Comentario</title>
<jsp:include page="../utilerias/librerias.jsp"></jsp:include>
</head>
<body>
	<%
		if (request.getSession().getAttribute("cuenta") != null) {
	%>
	<div class="container">

		<%
			if (((CuentaModelo) request.getSession().getAttribute("cuenta")).getRol().toLowerCase()
						.equals("administrador")) {
		%>
		<jsp:include page="encabezadoAdministrador.jsp">
			<jsp:param value="comentarioAdministrador" name="activo" />
		</jsp:include>
		<%
			}
		%>

		<div class="clearfix"></div>
		<div class="clearfix"></div>
		<div class="col-md-12">


			<form
				action="<%=request.getContextPath() + "/ComentarioControlador"%>"
				method="post" class="form-horizontal">
				<h1>Agregar comentario</h1>
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
				<input name="accion" type="hidden" value="registrar">
				<div class="form-group">
					<label for="idCuenta" class="col-sm-2 control-label">Cuenta:</label>
					<div class="col-sm-10">
						<select class="form-control" name="idCuenta" id="idCuenta">
							<%
								List<CuentaModelo> cuentas = CuentaJdbc.seleccionarCuentas();

									for (int i = 0; i < cuentas.size(); i++) {
							%>
							<option value="<%=cuentas.get(i).getIdCuenta()%>"><%=cuentas.get(i).getUsuario()%></option>
							<%
								}
							%>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label for="comentario" class="col-sm-2 control-label">Comentario:</label>
					<div class="col-sm-10">
						<textarea name="comentario" id="comentario"
							placeholder="Comentario:" class="form-control"></textarea>
					</div>
				</div>
				<div class="form-group">
					<label for="fecha" class="col-sm-2 control-label">Fecha:</label>
					<div class="col-sm-10">
						<input type="date" name="fecha" id="fecha" placeholder=""
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
				List<ComentarioModelo> lista = ComentarioJdbc.seleccionarComentarios();
					if (lista.size() > 0) {
			%>
			<div class="">
				<table class="table table-hover">
					<tr class="danger">
						<td colspan="10">Lista de Productos</td>

					</tr>
					<tr class="info">
						<td>idComentario</td>
						<td>idContacto</td>
						<td>Nombre</td>
						<td>Comentario</td>
						<td>Email</td>
						<td>Editar</td>
						<td>Eliminar</td>
					</tr>
					<%
						for (ComentarioModelo comentario : lista) {
					%>
					<tr class="active">
						<td><%=comentario.getIdComentario()%></td>
						<td><%=comentario.getIdCuenta()%></td>
						<td><%=comentario.getCuenta().getNombre()%></td>
						<td><%=comentario.getComentario()%></td>
						<td><%=comentario.getFecha()%></td>
						<td>
							<form
								action="<%=request.getContextPath() + "/vista/editarComentario.jsp"%>">
								<input type="hidden" name="idComentario"
									value="<%=comentario.getIdComentario()%>">
								<div class="text-center">
									<button type="submit" class="btn btn-default">
										<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
									</button>
								</div>

							</form>

						</td>
						<td>
							<form
								action="<%=request.getContextPath() + "/ComentarioControlador"%>">
								<input type="hidden" name="idComentario"
									value="<%=comentario.getIdComentario()%>"> <input
									type="hidden" name="accion" value="eliminar">
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