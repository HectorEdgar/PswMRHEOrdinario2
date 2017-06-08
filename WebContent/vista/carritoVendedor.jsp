<%@page import="java.util.List"%>
<%@page import="dao.CarritoJdbc"%>
<%@page import="modelo.CarritoModelo"%>
<%@page import="modelo.CuentaModelo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Carrito</title>
<%@ include file="../utilerias/librerias.jsp"%>
</head>
<body>
	<%
		if (request.getSession().getAttribute("cuenta") != null) {
	%>
	<div class="container">

		<%
			if (((CuentaModelo) request.getSession().getAttribute("cuenta")).getRol().toLowerCase()
						.equals("vendedor")) {
		%>
		<jsp:include page="encabezadoVendedor.jsp">
			<jsp:param value="carritoVendedor" name="activo" />
		</jsp:include>
		<%
			}
		%>

		<div class="clearfix"></div>
		<div class="clearfix"></div>
		<div class="col-md-12">
			<%
				if (request.getParameter("excel") != null) {
						response.setHeader("Content-Disposition", "attachment;filename=\"Reporte.xls\"");
					}
			%>
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
				List<CarritoModelo> listaCarrito = CarritoJdbc.seleccionarCarritosEnEspera();
					if (listaCarrito.size() > 0) {
			%>
			<div class="col-md-12">
				<table class="table table-hover">
					<tr class="danger">
						<td colspan="12">Lista de Carritos en espera</td>

					</tr>
					<tr class="info text-center">
						<td>idCarrito</td>
						<td>Usuario</td>
						<td>idArticulo</td>
						<td>Nombre del articulo</td>
						<td>Imagen</td>
						<td>Estado</td>
						<td>Editar</td>
						<td>Eliminar</td>
					</tr>
					<%
						for (CarritoModelo carrito : listaCarrito) {
					%>
					<tr class="active text-center">
						<td><%=carrito.getIdCarrito()%></td>
						<td><%=carrito.getCuenta().getUsuario()%></td>
						<td><%=carrito.getIdArticulo()%></td>
						<td><%=carrito.getArticulo().getNombre()%></td>
						<td><img height="50px"
							alt="<%=carrito.getArticulo().getGaleria().getNombre()%>"
							src="<%="../img/" + carrito.getArticulo().getGaleria().getUbicacion()%>">
						</td>
						<td><%=carrito.getEstado()%></td>
						<td>
							<form
								action="<%=request.getContextPath() + "/vista/editarCarrito.jsp"%>">
								<input type="hidden" name="idCarrito"
									value="<%=carrito.getIdCarrito()%>">
								<div class="text-center">
									<button type="submit" class="btn btn-default">
										<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
									</button>
								</div>

							</form>

						</td>
						<td>
							<form
								action="<%=request.getContextPath() + "/CarritoControlador"%>">
								<input type="hidden" name="idCarrito"
									value="<%=carrito.getIdCarrito()%>"> <input
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


			<%
				List<CarritoModelo> listaCarritoPreparando = CarritoJdbc.seleccionarCarritosPreparando();
					if (listaCarritoPreparando.size() > 0) {
			%>
			<div class="col-md-12">
				<table class="table table-hover">
					<tr class="danger">
						<td colspan="12">Lista de Carritos en estado preparando</td>

					</tr>
					<tr class="info text-center">
						<td>idCarrito</td>
						<td>Usuario</td>
						<td>idArticulo</td>
						<td>Nombre del articulo</td>
						<td>Imagen</td>
						<td>Estado</td>
						<td>Editar</td>
						<td>Eliminar</td>
					</tr>
					<%
						for (CarritoModelo carrito : listaCarritoPreparando) {
					%>
					<tr class="active text-center">
						<td><%=carrito.getIdCarrito()%></td>
						<td><%=carrito.getCuenta().getUsuario()%></td>
						<td><%=carrito.getIdArticulo()%></td>
						<td><%=carrito.getArticulo().getNombre()%></td>
						<td><img height="50px"
							alt="<%=carrito.getArticulo().getGaleria().getNombre()%>"
							src="<%="../img/" + carrito.getArticulo().getGaleria().getUbicacion()%>">
						</td>
						<td><%=carrito.getEstado()%></td>
						<td>
							<form
								action="<%=request.getContextPath() + "/vista/editarCarrito.jsp"%>">
								<input type="hidden" name="idCarrito"
									value="<%=carrito.getIdCarrito()%>">
								<div class="text-center">
									<button type="submit" class="btn btn-default">
										<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
									</button>
								</div>

							</form>

						</td>
						<td>
							<form
								action="<%=request.getContextPath() + "/CarritoControlador"%>">
								<input type="hidden" name="idCarrito"
									value="<%=carrito.getIdCarrito()%>"> <input
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

			<%
				List<CarritoModelo> listaCarritoPreparado = CarritoJdbc.seleccionarCarritosPreparado();
					if (listaCarritoPreparado.size() > 0) {
			%>
			<div class="col-md-12">
				<table class="table table-hover">
					<tr class="danger">
						<td colspan="12">Lista de Carritos en estado preparado</td>

					</tr>
					<tr class="info text-center">
						<td>idCarrito</td>
						<td>Usuario</td>
						<td>idArticulo</td>
						<td>Nombre del articulo</td>
						<td>Imagen</td>
						<td>Estado</td>
						<td>Editar</td>
						<td>Eliminar</td>
					</tr>
					<%
						for (CarritoModelo carrito : listaCarritoPreparado) {
					%>
					<tr class="active text-center">
						<td><%=carrito.getIdCarrito()%></td>
						<td><%=carrito.getCuenta().getUsuario()%></td>
						<td><%=carrito.getIdArticulo()%></td>
						<td><%=carrito.getArticulo().getNombre()%></td>
						<td><img height="50px"
							alt="<%=carrito.getArticulo().getGaleria().getNombre()%>"
							src="<%="../img/" + carrito.getArticulo().getGaleria().getUbicacion()%>">
						</td>
						<td><%=carrito.getEstado()%></td>
						<td>
							<form
								action="<%=request.getContextPath() + "/vista/editarCarrito.jsp"%>">
								<input type="hidden" name="idCarrito"
									value="<%=carrito.getIdCarrito()%>">
								<div class="text-center">
									<button type="submit" class="btn btn-default">
										<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
									</button>
								</div>

							</form>

						</td>
						<td>
							<form
								action="<%=request.getContextPath() + "/CarritoControlador"%>">
								<input type="hidden" name="idCarrito"
									value="<%=carrito.getIdCarrito()%>"> <input
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
				<div class="clearfix">&nbsp</div>
				
				<button class="btn-primary col-md-12" onclick="Excel()">Generar
					Reporte</button>
			</div>

		</div>

	</div>

	<div class="clearfix">&nbsp</div>
	<div class="clearfix">&nbsp</div>
	<div class="clearfix">&nbsp</div>
	<div class="clearfix">&nbsp</div>
	<script type="text/javascript">
		function Excel() {
			excel = window
					.open("carritoVendedor.jsp?excel=excel", "",
							"status=0,location=0,menubar=0,resisable=0,width=400,height=200");
		}
	</script>
	<%
		} else {
			response.sendRedirect(request.getContextPath() + "/vista/inicioSesion.jsp");
			System.out.println("cerrando sesion");
		}
	%>

</body>
</html>