<%@page import="dao.CarritoJdbc"%>
<%@page import="modelo.CarritoModelo"%>
<%@page import="dao.ArticuloJdbc"%>
<%@page import="modelo.ArticuloModelo"%>
<%@page import="java.util.List"%>
<%@page import="modelo.CuentaModelo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Comprar en linea</title>
<%@ include file="../utilerias/librerias.jsp"%>
</head>
<body>
	<%
		if (request.getSession().getAttribute("cuenta") != null) {
	%>
	<div class="container">

		<%
			if (((CuentaModelo) request.getSession().getAttribute("cuenta")).getRol().toLowerCase()
						.equals("usuario")) {
		%>
		<jsp:include page="encabezado.jsp">
			<jsp:param value="serviciosProductos" name="activo" />
		</jsp:include>
		<%
			}
		%>

		<div class="clearfix"></div>
		<div class="clearfix"></div>
		<div class="col-md-12">


			<div class="col-md-12">
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
			<br>
				<%
					List<ArticuloModelo> lista = ArticuloJdbc.seleccionarArticulosComidaDisponible();
						if (lista.size() > 0) {
				%>
				<h2>Comidas</h2>
				<%
					for (ArticuloModelo articulo : lista) {
				%>

				<div class="col-md-6">
					<div class="panel panel-default">
						<!-- Default panel contents -->
						<div class="panel-heading"><%=articulo.getNombre()%></div>
						<div class="panel-body">
							<p><%=articulo.getDescripcionLarga()%></p>
						</div>

						<!-- Table -->
						<div class="panel-body">
							<img alt="500x500"
								src="<%=request.getContextPath() + "/img/" + articulo.getGaleria().getUbicacion()%>"
								class="img-responsive img-thumbnail" alt="Responsive image"
								data-holder-rendered="true"
								style="width: 500px; max-height: 300px;">
						</div>
						<div class="panel-footer">
							<form
								action="<%=request.getContextPath() + "/CarritoControlador"%>"
								method="post" class="form-horizontal">
								<input name="accion" type="hidden" value="registrarUsuario">
								<input name="idCuenta" type="hidden"
									value="<%=((CuentaModelo) request.getSession().getAttribute("cuenta")).getIdCuenta()%>">
								<input name="idArticulo" type="hidden"
									value="<%=articulo.getIdArticulo()%>">
								<div class="form-group">
									<label for="cantidad" class="col-sm-2 control-label">Cantidad:</label>
									<div class="col-sm-10">
										<input type="number" name="cantidad" id="cantidad"
											placeholder="Precio:$<%=articulo.getCosto()%>"
											class="form-control">
									</div>
								</div>

								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
										<input type="submit" class="btn btn-default" value="Comprar">
									</div>
								</div>
							</form>
						</div>
					</div>

				</div>

				<%
					}
						}
				%>


			</div>
			<div class="col-md-12">

				<%
					List<ArticuloModelo> listaBebidas = ArticuloJdbc.seleccionarArticulosBebidaDisponible();
						if (listaBebidas.size() > 0) {
				%>
				<h2>Bebidas</h2>
				<%
					for (ArticuloModelo articulo : listaBebidas) {
				%>

				<div class="col-md-6">
					<div class="panel panel-default">
						<!-- Default panel contents -->
						<div class="panel-heading"><%=articulo.getNombre()%></div>
						<div class="panel-body">
							<p><%=articulo.getDescripcionLarga()%></p>
						</div>

						<!-- Table -->
						<div class="panel-body">
							<img alt="500x500"
								src="<%=request.getContextPath() + "/img/" + articulo.getGaleria().getUbicacion()%>"
								class="img-responsive img-thumbnail" alt="Responsive image"
								data-holder-rendered="true"
								style="width: 500px; max-height: 300px;">
						</div>
						<div class="panel-footer">
							<form
								action="<%=request.getContextPath() + "/CarritoControlador"%>"
								method="post" class="form-horizontal">
								<input name="accion" type="hidden" value="registrarUsuario">
								<input name="idCuenta" type="hidden"
									value="<%=((CuentaModelo) request.getSession().getAttribute("cuenta")).getIdCuenta()%>">
								<input name="idArticulo" type="hidden"
									value="<%=articulo.getIdArticulo()%>">
								<div class="form-group">
									<label for="cantidad" class="col-sm-2 control-label">Cantidad:</label>
									<div class="col-sm-10">
										<input type="number" name="cantidad" id="cantidad"
											placeholder="Precio:$<%=articulo.getCosto()%>"
											class="form-control">
									</div>
								</div>

								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
										<input type="submit" class="btn btn-default" value="Comprar">
									</div>
								</div>
							</form>
						</div>

					</div>

				</div>

				<%
					}
						}
				%>


			</div>
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
				List<CarritoModelo> listaCarrito = CarritoJdbc.seleccionarCarritos(((CuentaModelo) request.getSession().getAttribute("cuenta")).getIdCuenta());
					if (listaCarrito.size() > 0) {
			%>
			<div class="">
				<table class="table table-hover">
					<tr class="danger">
						<td colspan="12">Lista de Carritos</td>

					</tr>
					<tr class="info text-center">
						<td>idCarrito</td>
						<td>Usuario</td>
						<td>idArticulo</td>
						<td>Nombre del articulo</td>
						<td>Imagen</td>
						<td>Estado</td>
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