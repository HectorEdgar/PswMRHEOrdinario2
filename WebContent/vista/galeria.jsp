<%@page import="psw.ControladorCuenta"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Galeria</title>
<%@ include file="../jsp/librerias.jsp"%>
</head>
<body>
	<div class="container">
		<jsp:useBean id="cuentaBean" class="modelo.CuentaBean" scope="session" />
		<jsp:include page="encabezado.jsp">
			<jsp:param value="galeria" name="activo" />
		</jsp:include>
		<%
			ControladorCuenta.verificarCuenta(response, session);
		%>
		<div class="clearfix"></div>
		<div class="clearfix"></div>
		<div class="col-md-12">
			<div class="col-md-6">
				<img alt="500x500"
					src="<%=request.getContextPath() + "/img/img1.jpg"%>"
					class="img-responsive img-thumbnail" alt="Responsive image"
					data-holder-rendered="true"
					style="width: 500px; max-height: 300px;">
			</div>
			<div class="col-md-6">
				<img alt="" src="<%=request.getContextPath() + "/img/img2.jpg"%>"
					class="img-responsive img-thumbnail" alt="Responsive image"
					data-holder-rendered="true"
					style="width: 500px; max-height: 300px;">
			</div>
			<div class="col-md-6">
				<img alt="" src="<%=request.getContextPath() + "/img/img3.jpg"%>"
					class="img-responsive img-thumbnail" alt="Responsive image"
					data-holder-rendered="true"
					style="width: 500px; max-height: 300px;">
			</div>
			<div class="col-md-6">
				<img alt="" src="<%=request.getContextPath() + "/img/img4.jpg"%>"
					class="img-responsive img-thumbnail" alt="Responsive image"
					data-holder-rendered="true"
					style="width: 500px; max-height: 300px;">
			</div>
			<div class="col-md-6">
				<img alt="" src="<%=request.getContextPath() + "/img/img5.jpg"%>"
					class="img-responsive img-thumbnail" alt="Responsive image"
					data-holder-rendered="true"
					style="width: 500px; max-height: 300px;">
			</div>
		</div>

	</div>

</body>
</html>