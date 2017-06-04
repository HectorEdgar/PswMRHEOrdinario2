<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Iniciar Sesión</title>
<%-- <%@ include "librerias.jsp"%> --%>
<jsp:include page="../utilerias/librerias.jsp"></jsp:include>
</head>
<body>

	<div class="container">
		<%
			HttpSession ses = request.getSession();
			ses.removeAttribute("cuenta");
			ses.invalidate();

			response.setContentType("text/html");
			response.setHeader("Cache-Control", "no-cache, no-store,must-revalidate");
			response.setHeader("Pragma", "no-cache");
			response.setDateHeader("Expires", 0);
		%>
		<jsp:include page="encabezado.jsp">
			<jsp:param value="inicio" name="activo" />
		</jsp:include>
		<!-- 		<div class="clearfix">&nbsp</div> -->
		<!-- 		<div class="clearfix">&nbsp</div> -->
		<!-- 		<div class="clearfix">&nbsp</div> -->

		<div id="loginbox" style="margin-top: 50px;"
			class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
			<div class="panel panel-info">
				<div class="panel-heading">
					<div class="panel-title">Inicio de Sesión</div>
					<div
						style="float: right; font-size: 80%; position: relative; top: -10px"
						class="">
						<a href="#">¿Olvidaste tu contraseña?</a>
					</div>
				</div>
				<div class="panel-body">
					<div style="display: <%=request.getParameter("mensaje")!=null?"inline":"none" %>;" id="login-alert"
						class="alert alert-danger col-sm-12">
						<%=request.getParameter("mensaje")%>
						</div>
					<form
						action="<%=request.getContextPath() + "/CuentaControlador"%>"
						class="form-horizontal">
						<input name="accion" type="hidden" value="inicioSesion">
						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span> <input type="text"
								class="form-control" id="usuario" name="usuario"
								placeholder="Usuario">
						</div>
						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-lock"></i></span> <input type="password"
								class="form-control" id="clave" name="clave"
								placeholder="******">
						</div>

						<div class="form-group text-center">

							<div class="">
								<input type="submit" value="Iniciar Sesión"
									class="btn btn-primary">
							</div>
						</div>

					</form>
					<div class="col-md-12 footer">
						<br> ¿Aun no tienes una cuenta? <a class=""
							href="<%=request.getContextPath() + "/registrarUsuario.jsp"%>">Registrate</a>

					</div>

				</div>
			</div>
		</div>
	</div>
</body>
</html>