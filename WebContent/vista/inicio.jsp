<%@page import="modelo.CuentaModelo"%>
<%@page import="psw.ControladorCuenta"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Inicio</title>
<jsp:include page="../utilerias/librerias.jsp"></jsp:include>
</head>
<body>
<%
if (request.getSession().getAttribute("cuenta") != null) {
%>
	<div class="container">
		
		<%
			if(((CuentaModelo) request.getSession().getAttribute("cuenta")).getRol().toLowerCase().equals("administrador")){
				%>
				<jsp:include page="encabezadoAdministrador.jsp">
					<jsp:param value="inicio" name="activo" />
				</jsp:include>
				<%
				
			}else{
				if(((CuentaModelo) request.getSession().getAttribute("cuenta")).getRol().toLowerCase().equals("vendedor")){
					%>
					<jsp:include page="encabezadoVendedor.jsp">
						<jsp:param value="inicio" name="activo" />
					</jsp:include>
					<%
				}else{
					if(((CuentaModelo) request.getSession().getAttribute("cuenta")).getRol().toLowerCase().equals("usuario")){
					%>
					<jsp:include page="encabezado.jsp">
						<jsp:param value="inicio" name="activo" />
					</jsp:include>
					<%
					
					}
				}
			}
		
		%>
		
		
		<div class="clearfix"></div>
		<div class="clearfix"></div>
		<div class="col-md-6">
			<h2>Bienvenido al restaurant IS6A</h2>
			<p>
				El restaurant IS6A ofrece distintos tipos de comidas: <br>
				Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Phasellus
				ullamcorper velit eu ipsum. Ut pellentesque, est in volutpat cursus,
				risus mi viverra augue, at pulvinar turpis leo sed orci. Donec
				ipsum. Curabitur felis dui, ultrices ut, sollicitudin vel, rutrum
				at, tellus.
			</p>
			<p>
				<a class="btn btn-default" href="#" role="button">Ver detalles »</a>
			</p>
		</div>
		<div class="col-md-6">
			<h2>Ubicación</h2>
			<p>
				El restaurant IS6A se encuentra ubicado en: <br> Lorem ipsum
				dolor sit amet, consectetuer adipiscing elit. Phasellus ullamcorper
				velit eu ipsum. Ut pellentesque, est in volutpat cursus, risus mi
				viverra augue, at pulvinar turpis leo sed orci. Donec ipsum.
				Curabitur felis dui, ultrices ut, sollicitudin vel, rutrum at,
				tellus.
			</p>
			<p>
				<a class="btn btn-default" href="#" role="button">Ver detalles »</a>
			</p>
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