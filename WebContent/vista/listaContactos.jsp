<%@page import="psw.ControladorCuenta"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lista de contactos</title>
<%@ include file="../jsp/librerias.jsp"%>
</head>
<body>
	<div class="container">
		<jsp:useBean id="cuentaBean" class="modelo.CuentaBean" scope="session" />
		<jsp:include page="encabezado.jsp">
			<jsp:param value="listaContactos" name="activo" />
		</jsp:include>
		<%
			ControladorCuenta.verificarCuenta(response, session);
		%>
		<div class="clearfix"></div>
		<div class="clearfix"></div>
		<div class="col-md-12">
			<h1>Contactos</h1>
			<div class="clearfix"></div>
			<div class="clearfix"></div>
			<div class="col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Héctor Edgar Matias Rodriguez</h3>
					</div>
					<div class="panel-body">Email: hetorbite@gmail.com</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Yu ban Mena Zabala</h3>
					</div>
					<div class="panel-body">Email: yu@gmail.com</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Fernandez Perez Pedro Antonio</h3>
					</div>
					<div class="panel-body">Email: peter@gmail.com</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Olmedo Carbajar Jair Cristhian</h3>
					</div>
					<div class="panel-body">Email: jair@gmail.com</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Alonso Tobar Angel Daniel</h3>
					</div>
					<div class="panel-body">Email: angel@gmail.com</div>
				</div>

			</div>
		</div>
	</div>
</body>
</html>
