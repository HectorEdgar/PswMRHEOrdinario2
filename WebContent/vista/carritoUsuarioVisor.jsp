<%@page import="dao.CarritoJdbc"%>
<%@page import="modelo.CarritoModelo"%>
<%@page import="java.util.List"%>
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
				List<CarritoModelo> listaCarrito = CarritoJdbc.seleccionarCarritosEnEspera(
							((CuentaModelo) request.getSession().getAttribute("cuenta")).getIdCuenta());
					if (listaCarrito.size() > 0) {
			%>
			<div class="">
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
		

		<%
			List<CarritoModelo> listaCarritoPreparando = CarritoJdbc.seleccionarCarritosPreparando(
						((CuentaModelo) request.getSession().getAttribute("cuenta")).getIdCuenta());
				if (listaCarritoPreparando.size() > 0) {
		%>
		<div class="">
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
		List<CarritoModelo> listaCarritoPreparado = CarritoJdbc.seleccionarCarritosPreparado(
					((CuentaModelo) request.getSession().getAttribute("cuenta")).getIdCuenta());
			if (listaCarritoPreparado.size() > 0) {
	%>
	<div class="">
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
			</tr>
			<%
				}
					}
			%>

		</table>
	</div>
	</div>
	</div>
	<div class="clearfix">&nbsp</div>
	<div class="clearfix">&nbsp</div>
	<%
		} else {
			response.sendRedirect(request.getContextPath() + "/vista/inicioSesion.jsp");
			System.out.println("cerrando sesion");
		}
	%>
</body>
</html>