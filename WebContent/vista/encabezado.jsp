<%@page import="modelo.CuentaModelo"%>
<%
	String parametro = (request.getParameter("activo") != null ? request.getParameter("activo") : "");
	CuentaModelo cuenta=(CuentaModelo)request.getSession().getAttribute("cuenta");
%>

<header>
	<h1>Restaurant: IS6A</h1>
</header>
<%-- <div class="masthead">
	<nav>
		<ul class="nav nav-pills pull-right">
			<li class="<%=parametro.equals("inicio") ? "active" : ""%>"><a
				href="<%=request.getContextPath() + "/vista/inicio.jsp?activo=inicio"%>">Inicio</a>
			</li>
			<li class="<%=parametro.equals("contacto") ? "active" : ""%>"><a
				href="/vista/contacto.jsp?activo=contacto">Contacto</a></li>
			<li class="<%=parametro.equals("galeria") ? "active" : ""%>"><a
				href="<%=request.getContextPath() + "/vista/galeria.jsp?activo=galeria"%>">Galeria</a>
			</li>
			<li
				class="<%=parametro.equals("serviciosProductos") ? "active" : ""%>">
				<a
				href="<%=request.getContextPath() + "/vista/serviciosProductos.jsp?activo=serviciosProductos"%>">Servicios
					y productos</a>
			</li>
			<li class="<%=parametro.equals("listaContactos") ? "active" : ""%>">
				<a
				href="<%=request.getContextPath() + "/vista/listaContactos.jsp?activo=listaContactos"%>">Lista
					de contactos</a>
			</li>
			<%
				modelo.CuentaBean bean = (modelo.CuentaBean) session.getAttribute("cuentaBean");
				if (bean != null) {
					if (!bean.getPassword().equals("") && !bean.getUsuario().equals("")) {
						%>
						<li class="<%=parametro.equals("cerrarSesion") ? "active" : ""%>">
							<a
							href="<%=request.getContextPath() + "/vista/inicioSesion.jsp?activo=inicio"%>">Cerrar sesión</a>
						</li>	
						<%
					}
				}
			%>
		</ul>
		
		<%
			
			if (bean != null) {
				if (!bean.getPassword().equals("") && !bean.getUsuario().equals("")) {

					out.println("" + "<h3 class='muted' >Bienvenido: " + "<FONT COLOR='red'>"+bean.getUsuario() + "</font></h3>");
				}
			}
		%>
	</nav>

</div> --%>
<!-- <nav class="navbar navbar-default">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">Project name</a>
		</div>
		<div class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">Home</a></li>
				<li><a href="#about">About</a></li>
				<li><a href="#contact">Contact</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Dropdown <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
						<li role="separator" class="divider"></li>
						<li class="dropdown-header">Nav header</li>
						<li><a href="#">Separated link</a></li>
						<li><a href="#">One more separated link</a></li>
					</ul></li>
			</ul>
		</div>
		/.nav-collapse
	</div>
</nav> -->
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
				<%
				
				if(cuenta!=null){
					if(cuenta.getRol().equals("Administrador")){
				%>
						<li class="<%=parametro.equals("cuenta") ? "active" : ""%>"><a
						href="<%=request.getContextPath() + "/vista/cuenta.jsp?activo=cuenta"%>">Cuenta</a></li>
				<%
					}
				}
				
				%>
				<li class="<%=parametro.equals("contacto") ? "active" : ""%>"><a
					href="<%=request.getContextPath() + "/vista/contacto.jsp?activo=contacto"%>">Contacto</a></li>
				<li class="<%=parametro.equals("galeria") ? "active" : ""%>"><a
					href="<%=request.getContextPath() + "/vista/galeria.jsp?activo=galeria"%>">Galeria</a>
				</li>
				<li
					class="<%=parametro.equals("serviciosProductos") ? "active" : ""%>">
					<a
					href="<%=request.getContextPath() + "/vista/serviciosProductos.jsp?activo=serviciosProductos"%>">Servicios
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
						sesión</a>
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
<footer class="text-center panel-footer ">Universidad
	La Salle Oaxaca: IS6A</footer>
	
</div>
