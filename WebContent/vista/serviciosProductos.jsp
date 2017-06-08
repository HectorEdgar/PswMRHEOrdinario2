<%@page import="modelo.CuentaModelo"%>
<%@page import="psw.ControladorCuenta"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Servicios y productos</title>
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
			<div class="col-md-6">
				<div class="panel panel-danger">
					<div class="panel-heading">
						<h3 class="panel-title">Visualiza que hay en el menu</h3>
					</div>
					<div class="panel-body">
						<a href="<%=request.getContextPath() + "/vista/articulosUsuario.jsp"%>"><img
							alt="" src="<%=request.getContextPath() + "/img/img6.jpg"%>"
							class="img-responsive img-thumbnail" alt="Responsive image"
							data-holder-rendered="true"
							style="width: 500px; max-height: 300px;"></a>
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="panel panel-danger">
					<div class="panel-heading">
						<h3 class="panel-title">Pide tu orden en linea</h3>
					</div>
					<div class="panel-body">
						<a href=<%=request.getContextPath() + "/vista/carritoUsuario.jsp"%>><img alt=""
							src="<%=request.getContextPath() + "/img/img7.jpg"%>"
							class="img-responsive img-thumbnail" alt="Responsive image"
							data-holder-rendered="true"
							style="width: 500px; max-height: 300px;"></a>
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="panel panel-danger">
					<div class="panel-heading">
						<h3 class="panel-title">Checa el estado de tu orden</h3>
					</div>
					<div class="panel-body">
						<a href="<%=request.getContextPath() + "/vista/carritoUsuarioVisor.jsp"%>"><img alt=""
							src="<%=request.getContextPath() + "/img/img8.jpg"%>"
							class="img-responsive img-thumbnail" alt="Responsive image"
							data-holder-rendered="true"
							style="width: 500px; max-height: 300px;"></a>
					</div>
				</div>
			</div>
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