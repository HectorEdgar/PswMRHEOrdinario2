<%@page import="dao.CuentaJdbc"%>
<%@page import="java.util.List"%>
<%@page import="modelo.ComentarioModelo"%>
<%@page import="dao.ComentarioJdbc"%>
<%@page import="modelo.CuentaModelo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Editar Comentario</title>
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
					<jsp:param value="comentarioAdministrador" name="activo" />
				</jsp:include>
				<%
				
			}		
		%>
		<div class="clearfix"></div>
		<div class="clearfix"></div>
		<div class="col-md-12">


			<form action="<%=request.getContextPath() + "/ComentarioControlador"%>"
				method="post" class="form-horizontal">
				<h1>Editar contacto</h1>
				<%
					ComentarioModelo comentario = ComentarioJdbc.seleccionarComentario(Integer.parseInt(request.getParameter("idComentario")));
					String editar = request.getParameter("editar") != null ? request.getParameter("editar") : "";
						if (!editar.equals("")) {
							String cssClass = editar.equals("true") ? "alert-success" : "alert-warning";
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
					<label for="idComentario" class="col-sm-2 control-label">IdComentario:</label>
					<div class="col-sm-10">
						<input type="text" name="idComentario" id="idComentario"
							placeholder="idComentario:" class="form-control" value="<%=comentario.getIdComentario()%>" readonly="readonly">
					</div>
				</div>
				
				<div class="form-group">
					<label for="idCuenta" class="col-sm-2 control-label">Cuenta:</label>
					<div class="col-sm-10">
						<select class="form-control" name="idCuenta" id="idCuenta">
							<%
								List<CuentaModelo> cuentas = CuentaJdbc.seleccionarCuentas();

									for (int i = 0; i < cuentas.size(); i++) {
							%>
							<option value="<%=cuentas.get(i).getIdCuenta()%>" <%=cuentas.get(i).getIdCuenta()==comentario.getIdCuenta()?"selected='selected'":"" %> ><%=cuentas.get(i).getUsuario()%></option>
							<%
								}
							%>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label for="comentario" class="col-sm-2 control-label">Comentario:</label>
					<div class="col-sm-10">
						<textarea name="comentario" id="comentario"
							placeholder="Comentario:" class="form-control" ><%=comentario.getComentario() %></textarea>
					</div>
				</div>
				<div class="form-group">
					<label for="fecha" class="col-sm-2 control-label">Fecha:</label>
					<div class="col-sm-10">
						<input type="date" name="fecha" id="fecha" placeholder=""
							class="form-control" value="<%=comentario.getFecha()%>">
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