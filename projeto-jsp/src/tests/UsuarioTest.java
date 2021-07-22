package tests;

import java.util.concurrent.TimeUnit;

import org.junit.jupiter.api.Test;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

import model.ModelLogin;

class UsuarioTest {
	
	@Test
	void test() throws Exception {
		ModelLogin modelLogin = new ModelLogin();
		modelLogin.setNome("User automatizado");
		modelLogin.setEmail("user@teste.com");
		modelLogin.setCpf("60957513143");
		System.setProperty("webdriver.chrome.driver", "C:\\Users\\norbe\\OneDrive\\Documentos\\chromedriver_win32\\chromedriver.exe");
		WebDriver driver = new ChromeDriver();
		driver.get("http://localhost:8080/projeto-jsp");
		
		LoginPage loginPage = new LoginPage(driver);
		loginPage.LoginPageXPath();
		
		Thread.sleep(2000);
		
		UsuarioPage usuarioPage = new UsuarioPage(driver);
		usuarioPage.UsuarioPageXPath(modelLogin);
		
	}

}
