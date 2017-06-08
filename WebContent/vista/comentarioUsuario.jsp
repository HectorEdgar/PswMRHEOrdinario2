<%@page import="dao.ComentarioJdbc"%>
<%@page import="modelo.ComentarioModelo"%>
<%@page import="java.util.List"%>
<%@page import="modelo.CuentaModelo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Comentario</title>
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
			<jsp:param value="comentarioUsuario" name="activo" />
		</jsp:include>
		<%
			}
		%>

		<div class="clearfix"></div>
		<div class="clearfix"></div>
		<div class="col-md-12">


			<form
				action="<%=request.getContextPath() + "/ComentarioControlador"%>"
				method="post" class="form-horizontal">
				<h1>Agregar comentario</h1>
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
				<input name="accion" type="hidden" value="registrarUsuario">
				<input name="idCuenta" type="hidden"
					value="<%=((CuentaModelo) request.getSession().getAttribute("cuenta")).getIdCuenta()%>">
				<div class="form-group">
					<label for="comentario" class="col-sm-2 control-label">Comentario:</label>
					<div class="col-sm-10">
						<textarea name="comentario" id="comentario"
							placeholder="Comentario:" class="form-control"></textarea>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<input type="submit" class="btn btn-default" value="Agregar">
					</div>
				</div>
			</form>

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
				List<ComentarioModelo> lista = ComentarioJdbc.seleccionarComentarios();
					if (lista.size() > 0) {
			%>
			<div class="col-md-12">
				<%
					for (ComentarioModelo comentario : lista) {
				%>

				<div class="panel panel-primary">
					<div class="panel-heading"><%=comentario.getCuenta().getUsuario()%></div>
					<div class="panel-body"><%=comentario.getComentario()%></div>

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