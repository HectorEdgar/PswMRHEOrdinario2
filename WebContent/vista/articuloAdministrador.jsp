<%@page import="dao.ArticuloJdbc"%>
<%@page import="modelo.ArticuloModelo"%>
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
<title>Articulo</title>
<jsp:include page="../utilerias/librerias.jsp"></jsp:include>
</head>
<body>
<body>
<%
if (request.getSession().getAttribute("cuenta") != null) {
%>
	<div class="container">
		
		<%
			if(((CuentaModelo) request.getSession().getAttribute("cuenta")).getRol().toLowerCase().equals("administrador")){
				%>
				<jsp:include page="encabezadoAdministrador.jsp">
					<jsp:param value="articuloAdministrador" name="activo" />
				</jsp:include>
				<%
				
			}else{
				if(((CuentaModelo) request.getSession().getAttribute("cuenta")).getRol().toLowerCase().equals("vendedor")){
					%>
					<jsp:include page="encabezadoVendedor.jsp">
						<jsp:param value="articuloAdministrador" name="activo" />
					</jsp:include>
					<%
					
				}
			}
		%>
		
		<div class="clearfix"></div>
		<div class="clearfix"></div>
		<div class="col-md-12">


			<form action="<%=request.getContextPath() + "/ArticuloControlador"%>"
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
				<div class="form-group">
					<label for="nombre" class="col-sm-2 control-label">Nombre:</label>
					<div class="col-sm-10">
						<input type="text" name="nombre" id="nombre"
							placeholder="Nombre del articulo:" class="form-control" value="<%=request.getParameter("nombre")!=null?request.getParameter("nombre"):""%>">
					</div>
				</div>
				<div class="form-group">
					<label for="estado" class="col-sm-2 control-label">Estado:</label>
					<div class="col-sm-10">
					<select class="form-control" name="estado" id="estado">
					<option>Disponible</option>
					<option <%=request.getParameter("estado")!=null && request.getParameter("estado").equals("Agotado")?"selected='selected'":""%>>Agotado</option>
					</select>
					</div>
				</div>
				
				<div class="form-group">
					<label for="idGaleria" class="col-sm-2 control-label">Galeria:</label>
					<div class="col-sm-10">
						<select class="form-control" name="idGaleria" id="idGaleria" onchange="cambiarImagen(this)">
							<%
								List<GaleriaModelo> galeria = GaleriaJdbc.seleccionarGalerias();
							Integer idGaleria=null;
							if(request.getParameter("idGaleria")!=null){
								
								idGaleria=Integer.parseInt(request.getParameter("idGaleria"));		
							}
									for (int i = 0; i < galeria.size(); i++) {
							%>
							
							<option <%=idGaleria!=null&&idGaleria==galeria.get(i).getIdGaleria()?"selected='selected'":""%> value="<%=galeria.get(i).getIdGaleria()%>"  style="background-image: url(<%=request.getServletContext().getContextPath() + "/img" + "/" +galeria.get(i).getUbicacion()%>) no-repeat center left; padding-left:20px;"><%=galeria.get(i).getNombre()%></option>
							<%
								}
							%>
						</select>
						<% 
					if(request.getParameter("imagen")!=null){
						%>
						<img alt="" src="<%="../img/"+request.getParameter("imagen") %>" name="imagen" id="imagen" height="50px">
						<%
					}else{
						if(galeria!=null && galeria.size()>0){
							%>
							<img alt="" src="<%="../img/"+galeria.get(0).getUbicacion() %>" name="imagen" id="imagen" height="50px">
							<%
						}
					}
					
					%>
					</div>
					
				</div>
				
				<div class="form-group">
					<label for="descripcionCorta" class="col-sm-2 control-label">Descripción corta:</label>
					<div class="col-sm-10">
						<input type="text" name="descripcionCorta" id="descripcionCorta"
							placeholder="Descripción corta:" class="form-control" value="<%=request.getParameter("descripcionCorta")!=null?request.getParameter("descripcionCorta"):""%>">
					</div>
				</div>
				<div class="form-group">
					<label for="descripcionLarga" class="col-sm-2 control-label">Descripción larga:</label>
					<div class="col-sm-10">
						<input type="text" name="descripcionLarga" id="descripcionLarga"
							placeholder="Descripción larga:" class="form-control" value="<%=request.getParameter("descripcionLarga")!=null?request.getParameter("descripcionLarga"):""%>">
					</div>
				</div>
				<div class="form-group">
					<label for="costo" class="col-sm-2 control-label">Costo:</label>
					<div class="col-sm-10">
						<input type="number" step="2" min="0" name="costo" id="costo"
							placeholder="Costo:" class="form-control" value="<%=request.getParameter("costo")!=null?request.getParameter("costo"):""%>">
					</div>
				</div>
				<div class="form-group"> 
					<label for="tipo" class="col-sm-2 control-label">Tipo de articulo:</label>
					<div class="col-sm-10">
						<select class="form-control" name="tipo" id="tipo">
							<option>Comida</option>
							<option  <%=request.getParameter("tipo")!=null && request.getParameter("tipo").equals("Bebida")?"selected='selected'":""%>>Bebida</option>						
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
				List<ArticuloModelo> lista = ArticuloJdbc.seleccionarArticulos();
					if (lista.size() > 0) {
			%>
			<div class="">
				<table class="table table-hover">
					<tr class="danger">
						<td colspan="12">Lista de Articulos</td>

					</tr>
					<tr class="info text-center">
						<td>idArticulo</td>
						<td>Nombre</td>
						<td>Estado</td>
						<td>idGaleria</td>
						<td>Imagen</td>
						<td>Descricpión corta</td>
						<td>Descripción larga</td>
						<td>Costo</td>
						<td>Tipo</td>
						<td>Editar</td>
						<td>Eliminar</td>
					</tr>
					<%
						for (ArticuloModelo articulo : lista) {
					%>
					<tr class="active text-center">
						<td><%=articulo.getIdArticulo()%></td>
						<td><%=articulo.getNombre()%></td>
						<td><%=articulo.getEstado()%></td>
						<td><%=articulo.getEstado()%></td>
						<td><img height="50px" alt="<%=articulo.getGaleria().getNombre()%>" src="<%="../img/"+articulo.getGaleria().getUbicacion()%>"> </td>
						<td><%=articulo.getDescripcionCorta()%></td>
						<td><%=articulo.getDescripcionLarga()%></td>
						<td>$<%=articulo.getCosto()%></td>
						<td><%=articulo.getTipo()%></td>
						<td>
							<form
								action="<%=request.getContextPath() + "/vista/editarArticulo.jsp"%>">
								<input type="hidden" name="idArticulo"
									value="<%=articulo.getIdArticulo()%>">
								<div class="text-center">
									<button type="submit" class="btn btn-default">
										<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
									</button>
								</div>

							</form>

						</td>
						<td>
							<form action="<%=request.getContextPath() + "/ArticuloControlador"%>">
								<input type="hidden" name="idArticulo"
									value="<%=articulo.getIdArticulo()%>"> <input type="hidden"
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

	<script type="text/javascript">
		function cambiarImagen(evt) {
			//$("#imagen").attr("src","../img/"+evt.value);
			window.location.href = "../ArticuloControlador?accion=imagen&idGaleria="+evt.value+"&descripcionLarga="+$("#descripcionLarga").val()+
					"&descripcionCorta="+$("#descripcionCorta").val()+"&costo="+$("#costo").val()+"&tipo="+$("#tipo").val()+
					"&nombre="+$("#nombre").val()+"&estado="+$("#estado").val(); 
		}
	</script>
	<%
		} else {
			response.sendRedirect(request.getContextPath() + "/vista/inicioSesion.jsp");
			System.out.println("cerrando sesion");
		}
	%>
		
</body>
</html>