<%@page import="dao.CarritoJdbc"%>
<%@page import="modelo.CarritoModelo"%>
<%@page import="dao.ArticuloJdbc"%>
<%@page import="modelo.ArticuloModelo"%>
<%@page import="carrito.ArticulosSolicitado"%>
<%@page import="dao.GaleriaJdbc"%>
<%@page import="modelo.GaleriaModelo"%>
<%@page import="java.util.List"%>
<%@page import="dao.CuentaJdbc"%>
<%@page import="modelo.CuentaModelo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Carrito</title>
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
					<jsp:param value="carritoAdministrador" name="activo" />
				</jsp:include>
				<%
				
			}
		%>
		
		<div class="clearfix"></div>
		<div class="clearfix"></div>
		<div class="col-md-12">


			<form action="<%=request.getContextPath() + "/CarritoControlador"%>"
				method="post" class="form-horizontal">
				<h1>Agregar articulo</h1>
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
				
				<%
					List<CuentaModelo> cuentas = CuentaJdbc.seleccionarCuentas();
				
				%>
				<div class="form-group">
					<label for="idCuenta" class="col-sm-2 control-label">Cuenta:</label>
					<div class="col-sm-10">
					<select class="form-control" name="idCuenta" id="idCuenta">
					<%
						if(cuentas!=null){
							for(int i=0;i<cuentas.size();i++){
								%>
								<option value="<%=cuentas.get(i).getIdCuenta()%>"><%=cuentas.get(i).getUsuario()%></option>
								<%	
							}			
						}
					%>	
					</select>
					</div>
				</div>
				
				<%
					List<ArticuloModelo> articulos = ArticuloJdbc.seleccionarArticulos();
				%>
				<div class="form-group">
					<label for="idArticulo" class="col-sm-2 control-label">Articulo:</label>
					<div class="col-sm-10">
					<select class="form-control" name="idArticulo" id="idArticulo">
					<%
						if(cuentas!=null){
							for(int i=0;i<articulos.size();i++){
								%>
								<option value="<%=articulos.get(i).getIdArticulo()%>"><%=articulos.get(i).getNombre()%></option>
								<%	
							}			
						}
					%>	
					</select>
					</div>
				</div>
				
				<div class="form-group">
					<label for="estado" class="col-sm-2 control-label">Estado:</label>
					<div class="col-sm-10">
					<select class="form-control" name="estado" id="estado">
						<option>En espera</option>
						<option>Preparando</option>
						<option>Preparado</option>
					</select>
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
				List<CarritoModelo> lista = CarritoJdbc.seleccionarCarritos();
					if (lista.size() > 0) {
			%>
			<div class="">
				<table class="table table-hover">
					<tr class="danger">
						<td colspan="12">Lista de Carritos</td>

					</tr>
					<tr class="info text-center">
						<td>idCarrito</td>
						<td>idCuenta</td>
						<td>Usuario</td>
						<td>idArticulo</td>
						<td>Nombre del articulo</td>
						<td>Imagen</td>
						<td>Estado</td>
						<td>Editar</td>
						<td>Eliminar</td>
					</tr>
					<%
						for (CarritoModelo carrito : lista) {
					%>
					<tr class="active text-center">
						<td><%=carrito.getIdCarrito()%></td>
						<td><%=carrito.getIdCuenta()%></td>
						<td><%=carrito.getCuenta().getUsuario()%></td>
						<td><%=carrito.getIdArticulo()%></td>
						<td><%=carrito.getArticulo().getNombre()%></td>
						<td><img height="50px" alt="<%=carrito.getArticulo().getGaleria().getNombre()%>" src="<%="../img/"+carrito.getArticulo().getGaleria().getUbicacion()%>"> </td>
						<td><%=carrito.getEstado()%></td>
						<td>
							<form
								action="<%=request.getContextPath() + "/vista/editarCarrito.jsp"%>">
								<input type="hidden" name="idCarrito"
									value="<%=carrito.getIdCarrito()%>">
								<div class="text-center">
									<button type="submit" class="btn btn-default">
										<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
									</button>
								</div>

							</form>

						</td>
						<td>
							<form action="<%=request.getContextPath() + "/CarritoControlador"%>">
								<input type="hidden" name="idCarrito"
									value="<%=carrito.getIdCarrito()%>"> <input type="hidden"
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