<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<nav class="pcoded-navbar">
	<div class="sidebar_toggle">
		<a href="#"><i class="icon-close icons"></i></a>
	</div>
	<div class="pcoded-inner-navbar main-menu">
		<div class="">
			<div class="main-menu-header">
				<img class="img-80 img-radius" src="<%= request.getContextPath() %>/assets/images/javalogo.jpg"
					alt="User-Profile-Image">
				<div class="user-details">
					<span id="more-details"><%= session.getAttribute("usuario") %><i class="fa fa-caret-down"></i></span>
				</div>
			</div>

			<div class="main-menu-content">
				<ul>
					<li class="more-details"> <a
						href="<%= request.getContextPath() %>/ServletLogin?acao=logout"><i
							class="ti-layout-sidebar-left"></i>SAIR</a></li>
				</ul>
			</div>
		</div>
		<div class="p-15 p-b-0">
			<form class="form-material">
				<div class="form-group form-primary">
					<input type="text" name="footer-email" class="form-control"
						required=""> <span class="form-bar"></span> <label
						class="float-label"><i class="fa fa-search m-r-10"></i>Procure um Amigo</label>
				</div>
			</form>
		</div>
		<div class="pcoded-navigation-label"
			data-i18n="nav.category.navigation">Layout</div>
		<ul class="pcoded-item pcoded-left-item">
			
			<li class="pcoded-hasmenu"><a href="javascript:void(0)"
				class="waves-effect waves-dark"> <span class="pcoded-micon"><i
						class="ti-layout-grid2-alt"></i></span> <span id="componentes" class="pcoded-mtext"
					data-i18n="nav.basic-components.main">Cadastro</span> <span
					class="pcoded-mcaret"></span>
			</a>
				<ul class="pcoded-submenu">
					<li class=" "><a href="<%= request.getContextPath() %>/principal/usuario.jsp"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span id="opcUsuario" class="pcoded-mtext"
							data-i18n="nav.basic-components.alert">Cadastrar Usuário</span> <span
							class="pcoded-mcaret"></span>
					</a></li>

				</ul></li>
		</ul>
		
		
</nav>