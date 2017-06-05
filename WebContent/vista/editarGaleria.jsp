<%@page import="dao.GaleriaJdbc"%>
<%@page import="modelo.GaleriaModelo"%>
<%@page import="modelo.CuentaModelo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Editar Galeria</title>
<jsp:include page="../utilerias/librerias.jsp"></jsp:include>
</head>
<body>
<body>
	<%
		if (request.getSession().getAttribute("cuenta") != null) {
	%>
	<div class="container">

		<%
			if (((CuentaModelo) request.getSession().getAttribute("cuenta")).getRol().toLowerCase()
						.equals("administrador")) {
		%>
		<jsp:include page="encabezadoAdministrador.jsp">
			<jsp:param value="galeriaAdministrador" name="activo" />
		</jsp:include>
		<%
			}
		%>

		<div class="clearfix"></div>
		<div class="clearfix"></div>
		<div class="col-md-12">


			<form action="<%=request.getContextPath() + "/GaleriaControlador"%>"
				method="post" class="form-horizontal" enctype="multipart/form-data">
				<h1>Agregar a galeria</h1>
				<%
					GaleriaModelo galeria = GaleriaJdbc
								.seleccionarGaleria(Integer.parseInt(request.getParameter("idGaleria")));
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
				<input name="accion" type="hidden" value="editar">
				<div class="form-group">
					<label for="nombre" class="col-sm-2 control-label">Nombre:</label>
					<div class="col-sm-10">
						<input type="text" name="nombre" id="nombre" placeholder="Nombre:"
							class="form-control" readonly="readonly"
							value="<%=galeria.getIdGaleria()%>">
					</div>
				</div>
				<div class="form-group">
					<label for="nombre" class="col-sm-2 control-label">Nombre:</label>
					<div class="col-sm-10">
						<input type="text" name="nombre" id="nombre" placeholder="Nombre:"
							class="form-control" value="<%=galeria.getNombre()%>">
					</div>
				</div>
				<div class="form-group">
					<label for="ubicacion" class="col-sm-2 control-label">Ubicacion:</label>
					<div class="col-sm-10">
						<input type="text" name="ubicacion" id="ubicacion" placeholder=""
							class="form-control" value="<%=galeria.getUbicacion()%>"
							readonly="readonly"> <input type="file" name="ubicacion2"
							id="ubicacion2" onclick="$('#ubicacion');"
							onchange="setUbicacion(this.value)">
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<input type="submit" class="btn btn-default" value="Editar">
					</div>
				</div>
			</form>
			<script type="text/javascript">
			function setUbicacion(fic) {
				  fic = fic.split('\\');
				  $("#ubicacion").val(fic[fic.length-1]);
				}
			</script>

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