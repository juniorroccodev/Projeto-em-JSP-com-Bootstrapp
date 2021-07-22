package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoUsuarioRepository;
import model.ModelLogin;


@WebServlet("/ServeletUsuarioController")
public class ServeletUsuarioController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private DaoUsuarioRepository daoUsuarioRepository = new DaoUsuarioRepository();
       
    public ServeletUsuarioController() {
        super(); 
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
		
		String acao = request.getParameter("acao");
		
		if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("deletar")) {
			String idUser = request.getParameter("id");
			daoUsuarioRepository.deletarUser(idUser);
			
			request.setAttribute("msg", "Cadastro excluido com sucesso!");
			
		}
		
		request.getRequestDispatcher("usuario.jsp").forward(request, response);
		    
		}catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher redirecionar = request.getRequestDispatcher("erro.jsp");
			request.setAttribute("msg", e.getMessage());
			redirecionar.forward(request, response);
		}
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
		String msg = "Operação realizada com sucesso!";
			
		String id = request.getParameter("id");
		String login = request.getParameter("login");
		String nome = request.getParameter("nome");
		String email = request.getParameter("email");
		String cpf = request.getParameter("cpf");
		String senha = request.getParameter("senha");
		
		
		ModelLogin modelLogin = new ModelLogin();
		
		modelLogin.setId(id != null && !id.isEmpty() ? Long.parseLong(id) : null);
		modelLogin.setLogin(login);
		modelLogin.setNome(nome);
		modelLogin.setEmail(email);
		modelLogin.setCpf(cpf);
		modelLogin.setSenha(senha);
		
		if (daoUsuarioRepository.validaCpf(modelLogin.getCpf()) && modelLogin.getId() == null) {
			msg = "Já existe usuário com o mesmo CPF, informe outro CPF;";
			
		}else {
			if (modelLogin.isNovo()) {
				msg = "Cadastro gravado com sucesso!";
			}else {
				msg= "Atualizado com sucesso!";
			}
			
		    modelLogin = daoUsuarioRepository.gravarUsuario(modelLogin);
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("modelLogin", modelLogin);
		request.getRequestDispatcher("usuario.jsp").forward(request, response);
		
		} catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher redirecionar = request.getRequestDispatcher("erro.jsp");
			request.setAttribute("msg", e.getMessage());
			redirecionar.forward(request, response);
		}
		
	}

}
