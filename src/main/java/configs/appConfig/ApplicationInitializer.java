package configs.appConfig;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import services.CategoryService;


@WebListener
public class ApplicationInitializer implements ServletContextListener {
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext servletContext = sce.getServletContext();
        initCategories(servletContext);
    }

    public void contextDestroyed(ServletContextEvent sce) {
    }

    private void initCategories(ServletContext servletContext) {
        CategoryService categoryService = new CategoryService();
        servletContext.setAttribute("categories", categoryService.getAllCategory());
    }
}
