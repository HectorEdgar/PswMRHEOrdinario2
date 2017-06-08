<%@page import="dao.GaleriaJdbc"%>
<%@page import="modelo.GaleriaModelo"%>
<%@page import="java.util.List"%>
<%@page import="modelo.CuentaModelo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Galeria</title>
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
				<input name="accion" type="hidden" value="registrar">
				<div class="form-group">
					<label for="nombre" class="col-sm-2 control-label">Nombre:</label>
					<div class="col-sm-10">
						<input type="text" name="nombre" id="nombre"
							placeholder="Nombre:" class="form-control">
					</div>
				</div>
				<div class="form-group">
					<label for="ubicacion" class="col-sm-2 control-label">Ubicacion:</label>
					<div class="col-sm-10">
						<input type="file" name="ubicacion" id="ubicacion"
							placeholder="" class="">
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
				List<GaleriaModelo> lista = GaleriaJdbc.seleccionarGalerias();
					if (lista.size() > 0) {
			%>
			<div class="">
				<table class="table table-hover">
					<tr class="danger">
						<td colspan="10">Lista de Productos</td>

					</tr>
					<tr class="info">
						<td>idGaleria</td>
						<td>Imagen</td>
						<td>Nombre</td>
						<td>Ubicacion</td>
						<td>Editar</td>
						<td>Eliminar</td>
					</tr>
					<%
						for (GaleriaModelo galeria : lista) {
					%>
					<tr class="active">
						<td><%=galeria.getIdGaleria()%></td>
						<td><img alt="" src="<%="../img/"+galeria.getUbicacion()%>" class="" height="50px"></td>
						<td><%=galeria.getNombre()%></td>
						<td><%=galeria.getUbicacion()%></td>
						<td>
							<form
								action="<%=request.getContextPath() + "/vista/editarGaleria.jsp"%>">
								<input type="hidden" name="idGaleria"
									value="<%=galeria.getIdGaleria()%>">
								<div class="text-center">
									<button type="submit" class="btn btn-default">
										<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
									</button>
								</div>

							</form>

						</td>
						<td>
							<form action="<%=request.getContextPath() + "/GaleriaControlador"%>">
								<input type="hidden" name="idGaleria"
									value="<%=galeria.getIdGaleria()%>"> <input type="hidden"
									name="accion" value="eliminar">
								<div class="text-center">
									<button type="submit" class="btn btn-default">
										<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
									</button>
								</div>

							</form>
						</td>
					</tr>
					<%
						}
							}
					%>

				</table>
			</div>
			<div class="clearfix">&nbsp</div>
			<div class="clearfix">&nbsp</div>
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