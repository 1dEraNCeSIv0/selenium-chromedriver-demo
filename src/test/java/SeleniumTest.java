import org.junit.jupiter.api.Test;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

public class SeleniumTest {

	@Test
	void headlessNew() {
		ChromeDriver driver = createChromeDriver(HeadlessMode.NEW);
		driver.navigate().to("https://www.google.com");
	}

	@Test
	void headlessOld() {
		ChromeDriver driver = createChromeDriver(HeadlessMode.OLD);
		driver.navigate().to("https://www.google.com");
	}

	private ChromeDriver createChromeDriver(HeadlessMode headlessMode) {
		System.setProperty("webdriver.chrome.driver", "/usr/bin/chromedriver");

		ChromeOptions options = new ChromeOptions();
		options.addArguments("--no-sandbox");
		options.addArguments("--disable-search-engine-choice-screen");
		options.addArguments(headlessMode.argument);
		return new ChromeDriver(options);
	}

	private enum HeadlessMode {
		NEW("--headless=new"),
		OLD("--headless=old");

		private String argument;

		HeadlessMode(String argument) {
			this.argument = argument;
		}
	}

}
