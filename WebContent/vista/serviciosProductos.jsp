<%@page import="psw.ControladorCuenta"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Servicios y productos</title>
<%@ include file="../jsp/librerias.jsp"%>
</head>
<body>
	<div class="container">
		<jsp:useBean id="cuentaBean" class="modelo.CuentaBean" scope="session" />
		<jsp:include page="encabezado.jsp">
			<jsp:param value="inicio" name="activo" />
		</jsp:include>
		<%
			ControladorCuenta.verificarCuenta(response, session);
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
						<a href="<%=request.getContextPath() + "/ControladorCatalogo"%>"><img
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
						<a href="./ControladorCatalogo"><img alt=""
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
						<a href="./ControladorCatalogo"><img alt=""
							src="<%=request.getContextPath() + "/img/img8.jpg"%>"
							class="img-responsive img-thumbnail" alt="Responsive image"
							data-holder-rendered="true"
							style="width: 500px; max-height: 300px;"></a>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>
</html>