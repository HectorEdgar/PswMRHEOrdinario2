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
<title>Articulos</title>
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
					List<ArticuloModelo> lista = ArticuloJdbc.seleccionarArticulosComida();
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
					</div>
					
				</div>

				<%
					}
						}
				%>


			</div>
			<div class="col-md-12">

				<%
					List<ArticuloModelo> listaBebidas = ArticuloJdbc.seleccionarArticulosBebida();
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
					</div>
					
				</div>

				<%
					}
						}
				%>


			</div>
		</div>
		<div class="clearfix">&nbsp</div>
		<div class="clearfix">&nbsp</div>
	</div>
	<%
		} else {
			response.sendRedirect(request.getContextPath() + "/vista/inicioSesion.jsp");
			System.out.println("cerrando sesion");
		}
	%>

</body>
</html>