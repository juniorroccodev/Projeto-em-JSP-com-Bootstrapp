package tests;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

public class LoginPage {
	
static WebDriver driver;
	
	public LoginPage (WebDriver driver) {
		this.driver = driver;
	}
	
	public void LoginPageXPath() throws Exception{
		WebElement login = driver.findElement(By.xpath("//input[@id, 'login']"));
		WebElement senha = driver.findElement(By.xpath("//input[@id, 'senha']"));
		login.sendKeys("admin");
		senha.sendKeys("admin");
		
		WebElement botaoEnviar = driver.findElement(By.xpath("//button[@id, 'btnEnviar']"));
		botaoEnviar.submit();
	}

}
