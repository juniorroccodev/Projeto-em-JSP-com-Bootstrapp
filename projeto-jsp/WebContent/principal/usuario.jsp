<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">

<jsp:include page="head.jsp"></jsp:include>

<body>
	<!-- Theme Loader -->
	<jsp:include page="theme-loader.jsp"></jsp:include>

	<!-- Pre-loader end -->
	<div id="pcoded" class="pcoded">
		<div class="pcoded-overlay-box"></div>
		<div class="pcoded-container navbar-wrapper">

			<!-- Navbar -->
			<jsp:include page="navbar.jsp"></jsp:include>


			<div class="pcoded-main-container">
				<div class="pcoded-wrapper">

					<!-- NavBarMenu -->
					<jsp:include page="navbarmainmenu.jsp"></jsp:include>

					<div class="pcoded-content">

						<!-- Page Header -->
						<jsp:include page="page-header.jsp"></jsp:include>

						<!-- Page-header end -->
						<div class="pcoded-inner-content">

							<!-- Main-body start -->
							<div class="main-body">
								<div class="page-wrapper">
									<!-- Page-body start -->
									<div class="page-body">

										<div class="row">
											<div class="col-sm-12">
												<!-- Basic Form Inputs card start -->
												<div class="card">
													<div class="card-header">
														<div class="card-block">
															<h4 class="sub-title">CADASTRO DE USUÁRIO</h4>

															<form class="form-material"
																onsubmit="return TestaCPF()? true : false"
																action="<%=request.getContextPath()%>/ServeletUsuarioController"
																method="post" id="formUser">

																<input type="hidden" name="acao" id="acao" value="">

																<div class="form-group form-default form-static-label">
																	<input type="text" name="id" id="id"
																		class="form-control" readonly="readonly"
																		value="${modelLogin.id}"> <span
																		class="form-bar"></span> <label class="float-label">Id:</label>
																</div>

																<div class="form-group form-default form-static-label">
																	<input type="text" name="nome" id="nome"
																		class="form-control" required="required"
																		autocomplete="off" value="${modelLogin.nome}">
																	<span class="form-bar"></span> <label
																		class="float-label">Nome:</label>
																</div>


																<div class="form-group form-default form-static-label">
																	<input type="email" name="email" id="email"
																		class="form-control" autocomplete="off"
																		value="${modelLogin.email}"> <span
																		class="form-bar"></span> <label class="float-label">Email:</label>
																</div>

																<div class="form-group form-default form-static-label">
																	<input type="text" name="cpf" id="cpf"
																		class="form-control" required="required"
																		onblur="TestaCPF()" autocomplete="off"
																		value="${modelLogin.cpf}"> <span
																		class="form-bar"></span> <label class="float-label">CPF:</label>
																</div>


															</form>
															<div class="form-row">
																<div class="form-group col-md-6">
																	<label for="inputCity">Naturalidade</label> <input
																		type="text" class="form-control" id="naturalidade" value="${modelLogin.naturalidade}">
																</div>
																<div class="form-group col-md-6">
																	<label for="inputState">Nacionalidade</label> <select
																		id="nacionalidade" class="form-control" value="${modelLogin.nacionalidade}">
																		<option selected>Choose...</option>
																		<option>...</option>
																	</select>
																</div>

																<div class="input-group-prepend">
																	<label class="input-group-text" value="${modelLogin.sexo}"
																		id="sexo" for="inputGroupSelect01">Sexo</label>
																</div>
																<select class="custom-select" id="inputGroupSelect01">
																	
																	<option value="1">Masculino</option>
																	<option value="2">Feminino</option>
																</select>
															</div>


														</div>
														<button type="button"
															class="btn waves-effect waves-light btn-grd-primary"
															onclick="limparForm">Novo</button>

														<button id="btnSalvar"
															class="btn waves-effect waves-light btn-grd-success">Salvar
														</button>

														<button type="button"
															class="btn waves-effect waves-light btn-grd-danger"
															onclick="criarDelete();">Remover</button>

														<button type="button"
															class="btn waves-effect waves-light btn-grd-warning"
															data-toggle="modal" data-target="#exampleModalUsuario">Consultar
														</button>


													</div>
												</div>
											</div>
										</div>
										<span>${msg}</span>

									</div>
									<!-- Page-body end -->
								</div>
								<div id="styleSelector"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<!-- Java File -->
	<jsp:include page="javafile.jsp"></jsp:include>


	<!-- Modal -->
	<div class="modal fade" id="exampleModalUsuario" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Pesquisa de
						Usuário</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<div class="input-group mb-3">
						<input type="text" class="form-control" placeholder="Nome"
							aria-label="Nome" id="nomeBusca" aria-describedby="basic-addon2">
						<div class="input-group-append">
							<button class="btn btn-primary" type="button"
								onclick="buscarUsuario();">Buscar</button>
						</div>
					</div>

					<table class="table">
						<thead>
							<tr>
								<th scope="col">ID</th>
								<th scope="col">Nome</th>
								<th scope="col">Resultado</th>
							</tr>
						</thead>
						<tbody>

						</tbody>
					</table>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">Fechar</button>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">


function criarDelete(){
	if (confirm('Deseja realmente excluir os dados?')){
	document.getElementById("FormUser").method = 'get';
	document.getElementById("acao").value = 'deletar';
	document.getElementById("formUser").submit();
	
	}
}

function limparForm(){
  var elementos = document.getElementById("formUser").elements; /*Retorna o elemento html dentro do form*/
  
  for (p = 0;  elementos.length; p ++){
	  elementos[p].value = '';
	  
  }
}
	
</script>

	<script> 

function buscarUsuario(){
	 var nomeBusca = document.getElementById('nomeBusca').value;
	 
	 if (nomeBusca != null && nomeBusca != '' && nomeBusca.trim() != ''){
		 alert(nomeBusca);
	 }
}	

</script>


	<script>
function TestaCPF() {
    var Soma;
    var Resto;
    var cpf = document.getElementById("cpf").value;
    Soma = 0;
  if (cpf == "00000000000"){
	  alert("CPF inválido");
	  return false;
  }
  for (i=1; i<=9; i++) Soma = Soma + parseInt(cpf.substring(i-1, i)) * (11 - i);
  Resto = (Soma * 10) % 11;

    if ((Resto == 10) || (Resto == 11))  Resto = 0;
    if (Resto != parseInt(cpf.substring(9, 10)) ){
    	alert("CPF inválido");
    	return false;
    }
  Soma = 0;
    for (i = 1; i <= 10; i++) Soma = Soma + parseInt(cpf.substring(i-1, i)) * (12 - i);
    Resto = (Soma * 10) % 11;

    if ((Resto == 10) || (Resto == 11))  Resto = 0;
    if (Resto != parseInt(cpf.substring(10, 11) ) ){
    	alert("CPF inválido");
    	return false;
    }
    return true;
}

</script>
</body>

</html>
