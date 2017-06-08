<%@page import="modelo.CarritoModelo"%>
<%@page import="dao.CarritoJdbc"%>
<%@page import="dao.ArticuloJdbc"%>
<%@page import="modelo.ArticuloModelo"%>
<%@page import="dao.CuentaJdbc"%>
<%@page import="modelo.CuentaModelo"%>
<%@page import="java.util.List"%>
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
				<input name="accion" type="hidden" value="editar">
				
				<%
					List<CuentaModelo> cuentas = CuentaJdbc.seleccionarCuentas();
					CarritoModelo carrito= CarritoJdbc.seleccionarCarrito(Integer.parseInt(request.getParameter("idCarrito")));
				
				%>
				<div class="form-group">
					<label for="idCarrito" class="col-sm-2 control-label">idCarrito:</label>
					<div class="col-sm-10">
						<input type="text" name="idCarrito" id="idCarrito"
							placeholder="idCarrito:" class="form-control" readonly="readonly" value="<%=carrito.getIdCarrito()%>">
					</div>
				</div>
				<div class="form-group">
					<label for="idCuenta" class="col-sm-2 control-label">Cuenta:</label>
					<div class="col-sm-10">
					<select class="form-control" name="idCuenta" id="idCuenta">
					<%
						if(cuentas!=null){
							for(int i=0;i<cuentas.size();i++){
								%>
								<option value="<%=cuentas.get(i).getIdCuenta()%>" 
								<%=cuentas.get(i).getIdCuenta()== carrito.getIdCuenta()?"selected='selected'":"" %> ><%=cuentas.get(i).getUsuario()%></option>
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
								<option value="<%=articulos.get(i).getIdArticulo()%>"
								<%=articulos.get(i).getIdArticulo()==carrito.getIdArticulo()?"selected='selected'":"" %> ><%=articulos.get(i).getNombre()%></option>
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
						<option <%=carrito.getEstado().equals("Preparando")?"selected='selected'":"" %>>Preparando</option>
						<option <%=carrito.getEstado().equals("Preparado")?"selected='selected'":"" %>>Preparado</option>
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

	<%
		} else {
			response.sendRedirect(request.getContextPath() + "/vista/inicioSesion.jsp");
			System.out.println("cerrando sesion");
		}
	%>
</body>
</html>