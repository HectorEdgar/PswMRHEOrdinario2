<%@page import="dao.GaleriaJdbc"%>
<%@page import="modelo.GaleriaModelo"%>
<%@page import="java.util.List"%>
<%@page import="modelo.CuentaModelo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Galeria</title>
<jsp:include page="../utilerias/librerias.jsp"></jsp:include>
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
			<jsp:param value="galeriaUsuario" name="activo" />
		</jsp:include>
		<%
			}
		%>

		<div class="clearfix"></div>
		<div class="clearfix"></div>
		<div class="col-md-12">

			<%
				List<GaleriaModelo> lista = GaleriaJdbc.seleccionarGalerias();
					if (lista.size() > 0) {
			%>

			<%
				for (GaleriaModelo galeria : lista) {
			%>

			<div class="col-md-6">
				<img alt="500x500"
					src="<%=request.getContextPath() + "/img/"+galeria.getUbicacion()%>"
					class="img-responsive img-thumbnail" alt="Responsive image"
					data-holder-rendered="true"
					style="width: 500px; max-height: 300px;">
			</div>

			<%
				}
					}
			%>


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