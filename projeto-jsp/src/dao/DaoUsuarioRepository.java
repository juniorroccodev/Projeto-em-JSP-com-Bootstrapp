package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import connection.SingleConnectionBanco;
import model.ModelLogin;

public class DaoUsuarioRepository {
	
	private Connection connection;
	
	public DaoUsuarioRepository() {
		connection = SingleConnectionBanco.getConnection();
	}
	
	public ModelLogin gravarUsuario(ModelLogin objeto) throws Exception{
		
		if (objeto.isNovo()) {
		
		String sql = "INSERT INTO model_login(login, nome, email, cpf) VALUES (?, ?, ?, ?);";
		PreparedStatement preparedSql = connection.prepareStatement(sql);
		
		preparedSql.setString(1, objeto.getLogin());
		preparedSql.setString(2, objeto.getNome());
		preparedSql.setString(3, objeto.getEmail());
		preparedSql.setString(4, objeto.getCpf());
		
		preparedSql.execute();
		
		connection.commit();
		
	    }else {
			String sql = "UPDATE model_login SET nome=?, email=? cpf=? WHERE id =  "+objeto.getId()+";";
			
			PreparedStatement prepareSql = connection.prepareStatement(sql);
			
			prepareSql.setString(1, objeto.getNome());
			prepareSql.setString(2, objeto.getEmail());
			prepareSql.setString(3, objeto.getCpf());
			
			prepareSql.executeUpdate();
			
			connection.commit();
			
	}
		
		return this.consultaUsuario(objeto.getLogin());
		
	}
	
		public ModelLogin consultaUsuario(String login) throws Exception  {
			
			ModelLogin modelLogin = new ModelLogin();
			
			String sql = "select * from model_login where upper(login) = upper('"+login+"')";
			
			PreparedStatement statement = connection.prepareStatement(sql);
			
			ResultSet resutlado =  statement.executeQuery();
			
			while (resutlado.next()) /*Se tem resultado*/ {
				
			modelLogin.setId(resutlado.getLong("id"));
			modelLogin.setEmail(resutlado.getString("email"));
			modelLogin.setLogin(resutlado.getString("login"));
			modelLogin.setSenha(resutlado.getString("senha"));
			modelLogin.setNome(resutlado.getString("nome"));
			modelLogin.setCpf(resutlado.getNString("cpf"));
				
	    }
		
		return modelLogin;
	}
	
	public boolean validaCpf(String cpf) throws Exception {
		
		String sql = "select count(1) > 0 as existe from model_login where cpf = '" + cpf+ "'";
		PreparedStatement statement = connection.prepareStatement(sql);
		ResultSet resultado = statement.executeQuery();
		resultado.next(); //Pra ele entar no resultado d sql
		
        return resultado.getBoolean("existe");
		
	}
	
	public void deletarUser(String idUser) throws Exception{
		String sql = "DELETE FROM public.model_login WHERE id = ?;";
		PreparedStatement prepareSql = connection.prepareStatement(sql);
		prepareSql.setLong(1, Long.parseLong(idUser));
		
		prepareSql.executeUpdate();
		
		connection.commit();
	}
	

}
