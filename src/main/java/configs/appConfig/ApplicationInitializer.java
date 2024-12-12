package configs.appConfig;

import configs.properties.UrlProperties;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import services.CategoryService;

import java.util.HashMap;


@WebListener
public class ApplicationInitializer implements ServletContextListener {
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext servletContext = sce.getServletContext();
        initCategories(servletContext);
        initUrls(servletContext);
    }

    public void contextDestroyed(ServletContextEvent sce) {
    }

    private void initCategories(ServletContext servletContext) {
        CategoryService categoryService = new CategoryService();
        servletContext.setAttribute("categories", categoryService.getAllCategory());
    }

    private void initUrls(ServletContext servletContext) {
        HashMap<String, String> url = new HashMap<>();
        url.put("url.root", servletContext.getContextPath());
        url.put("url.home", UrlProperties.home());
        url.put("url.contact", UrlProperties.about());
        url.put("url.about", UrlProperties.contact());
        url.put("url.category", UrlProperties.category());

        servletContext.setAttribute("url", url);
    }
}
