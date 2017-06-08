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
				<input name="accion" type="hidden" value="editar">
				<%
				ArticuloModelo articulo = ArticuloJdbc.seleccionarArticulo(Integer.parseInt(request.getParameter("idArticulo")));
				
				
				%>
				<div class="form-group">
					<label for="idArticulo" class="col-sm-2 control-label">idArticulo:</label>
					<div class="col-sm-10">
						<input type="text" name="idArticulo" id="idArticulo"
							placeholder="idArticulo:" class="form-control" value="<%=articulo.getIdArticulo()%>" readonly="readonly">
					</div>
				</div>
				<div class="form-group">
					<label for="nombre" class="col-sm-2 control-label">Nombre:</label>
					<div class="col-sm-10">
						<input type="text" name="nombre" id="nombre"
							placeholder="Descripción corta:" class="form-control" value="<%=request.getParameter("nombre")!=null?request.getParameter("nombre"):articulo.getNombre()%>">
					</div>
				</div>
				<div class="form-group">
					<label for="estado" class="col-sm-2 control-label">Estado:</label>
					<div class="col-sm-10">
					<select class="form-control" name="estado" id="estado">
						<option>Disponible</option>
						<%
						if(request.getParameter("estado")!=null){
							%>
							<option <%=request.getParameter("estado").equals("Agotado")?"selected='selected'":" "%>>Agotado</option>
							<% 
						}else{
							%>
								<option <%=articulo.getEstado().equals("Agotado")?"selected='selected'":" "%>>Agotado</option>
							<% 
						}
						
						%>
						
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
									if(idGaleria!=null){
										%>						
										<option <%=galeria.get(i).getIdGaleria()==idGaleria?"selected='selected'":""%> value="<%=galeria.get(i).getIdGaleria()%>" ><%=galeria.get(i).getNombre()%></option>
										<%
									}else{
										%>						
										<option <%=articulo!=null&&articulo.getIdGaleria()==galeria.get(i).getIdGaleria()?"selected='selected'":""%> value="<%=galeria.get(i).getIdGaleria()%>" ><%=galeria.get(i).getNombre()%></option>
										<%
									}				
							
								}
							%>
						</select>
						<% 
					if(request.getParameter("imagen")!=null){
						%>
						<img alt="" src="<%="../img/"+request.getParameter("imagen") %>" name="imagen" id="imagen" height="50px">
						<%
					}else{
						for (int i = 0; i < galeria.size(); i++) {
							if(articulo!=null&&articulo.getIdGaleria()==galeria.get(i).getIdGaleria()){
								%>
								<img alt="" src="<%="../img/"+galeria.get(i).getUbicacion() %>" name="imagen" id="imagen" height="50px">
								<%
							}
							
						}
					}
					
					%>
					</div>
					
				</div>
				
				<div class="form-group">
					<label for="descripcionCorta" class="col-sm-2 control-label">Descripción corta:</label>
					<div class="col-sm-10">
						<input type="text" name="descripcionCorta" id="descripcionCorta"
							placeholder="Descripción corta:" class="form-control" value="<%=request.getParameter("descripcionCorta")!=null?request.getParameter("descripcionCorta") : articulo.getDescripcionCorta()%>">
					</div>
				</div>
				<div class="form-group">
					<label for="descripcionLarga" class="col-sm-2 control-label">Descripción larga:</label>
					<div class="col-sm-10">
						<input type="text" name="descripcionLarga" id="descripcionLarga"
							placeholder="Descripción larga:" class="form-control" value="<%=request.getParameter("descripcionLarga")!=null?request.getParameter("descripcionLarga"):articulo.getDescripcionLarga()%>">
					</div>
				</div>
				<div class="form-group">
					<label for="costo" class="col-sm-2 control-label">Costo:</label>
					<div class="col-sm-10">
						<input type="text" name="costo" id="costo"
							placeholder="Costo:" class="form-control" value="<%=request.getParameter("costo")!=null?request.getParameter("costo"): articulo.getCosto()%>">
					</div>
				</div>
				<div class="form-group"> 
					<label for="tipo" class="col-sm-2 control-label">Tipo de articulo:</label>
					<div class="col-sm-10">
						<select class="form-control" name="tipo" id="tipo">
							<option>Comida</option>
							<%
							if(request.getParameter("tipo")!=null){
								%>
								<option  <%=request.getParameter("tipo").equals("Bebida")?"selected='selected'":""%>>Bebida</option>	
								<%
							}else{
								%>
								<option  <%=articulo.getTipo().equals("Bebida")?"selected='selected'":""%>>Bebida</option>
								<%
							}
							
							%>
												
						</select>
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<input type="submit" class="btn btn-default" value="Editar">
					</div>
				</div>
			</form>
	</div>		
</div>

	<script type="text/javascript">
		function cambiarImagen(evt) {
			//$("#imagen").attr("src","../img/"+evt.value);
			window.location.href = "../ArticuloControlador?accion=imagenEditar&idGaleria="+evt.value+"&descripcionLarga="+$("#descripcionLarga").val()+
					"&descripcionCorta="+$("#descripcionCorta").val()+"&costo="+$("#costo").val()+"&tipo="+$("#tipo").val()+"&idArticulo="+$("#idArticulo").val()+
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