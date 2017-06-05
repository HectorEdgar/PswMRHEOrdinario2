
<%@page import="modelo.CuentaModelo"%>
<%
	if (request.getSession().getAttribute("cuenta") != null
			&& ((CuentaModelo) request.getSession().getAttribute("cuenta")).getRol().toLowerCase()
					.equals("administrador")) {
%>

<%
	String parametro = (request.getParameter("activo") != null ? request.getParameter("activo") : "");
		CuentaModelo cuenta = (CuentaModelo) request.getSession().getAttribute("cuenta");
%>

<header>
	<h1>Restaurant: IS6A</h1>
</header>
<nav class="navbar navbar-default">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">Restaurant IS6A</a>
		</div>
		<div class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li class="<%=parametro.equals("inicio") ? "active" : ""%>"><a
					href="<%=request.getContextPath() + "/vista/inicio.jsp?activo=inicio"%>">Inicio</a>
				</li>
				
				<li class="<%=parametro.equals("cuenta") ? "active" : ""%>"><a
					href="<%=request.getContextPath() + "/vista/cuenta.jsp?activo=cuenta"%>">Cuenta</a>
				</li>
					
				<li class="<%=parametro.equals("contactoAdministrador") ? "active" : ""%>"><a
					href="<%=request.getContextPath() + "/vista/contactoAdministrador.jsp?activo=contactoAdministrador"%>">Contacto</a>
				</li>
					
				<li class="<%=parametro.equals("galeriaAdministrador") ? "active" : ""%>"><a
					href="<%=request.getContextPath() + "/vista/galeriaAdministrador.jsp?activo=galeriaAdministrador"%>">Galeria</a>
				</li>
				
				<li	class="<%=parametro.equals("serviciosProductos") ? "active" : ""%>">
					<a href="<%=request.getContextPath() + "/vista/serviciosProductos.jsp?activo=serviciosProductos"%>">Servicios
						y productos</a>
				</li>
				
				<li class="<%=parametro.equals("listaContactos") ? "active" : ""%>">
					<a
					href="<%=request.getContextPath() + "/vista/listaContactos.jsp?activo=listaContactos"%>">Lista
						de contactos</a>
				</li>
				<%
					if (cuenta != null) {
				%>
				<li class="<%=parametro.equals("cerrarSesion") ? "active" : ""%>">
					<a
					href="<%=request.getContextPath() + "/vista/inicioSesion.jsp?activo=inicio"%>">Cerrar
						sesi�n</a>
				</li>
				<%
					}
				%>
			</ul>


		</div>
		<%
			if (cuenta != null) {
					out.println("" + "<h3 class='muted' >Bienvenido: " + "<FONT COLOR='red'>" + cuenta.getNombre()
							+ "</font></h3>");

				}
		%>
	</div>
</nav>
<div class="navbar-fixed-bottom">
	<footer class="text-center panel-footer ">Universidad La Salle
		Oaxaca: IS6A</footer>

</div>

<%
	} else {
		response.sendRedirect(request.getContextPath() + "/vista/inicioSesion.jsp");
		System.out.println("cerrando sesion");
	}
%>