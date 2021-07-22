package tests;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import model.ModelLogin;

public class UsuarioPage {
	
	static WebDriver driver;
	
	public UsuarioPage (WebDriver driver) {
		this.driver = driver;
	}
	
	public void UsuarioPageXPath(ModelLogin modelLogin) throws Exception{
		WebElement menu = driver.findElement(By.xpath("//*[contains(@class, 'ti-menu')]"));
		menu.click();
		
		WebElement componentes = driver.findElement(By.xpath("//*[contains(@id, 'componentes')]"));
		componentes.click();
		
		WebElement usuarios =  driver.findElement(By.xpath("//*[contains(@id, 'opcUsuario')]"));
		usuarios.click();
		
		WebElement nome = driver.findElement(By.xpath("//input[@id, 'nome']"));
		WebElement email = driver.findElement(By.xpath("//input[@id, 'email']"));
		WebElement cpf = driver.findElement(By.xpath("//input[@id, 'cpf']"));
		nome.sendKeys(modelLogin.getNome());
		email.sendKeys(modelLogin.getEmail());
		cpf.sendKeys(modelLogin.getCpf());
		
		WebElement botaoSalvar = driver.findElement(By.xpath("//button[@id, 'btnSalvar']"));
		botaoSalvar.submit();
		
	}

}
