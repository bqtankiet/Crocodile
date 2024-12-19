package vn.edu.hcmuaf.fit.crocodile.config;

import vn.edu.hcmuaf.fit.crocodile.config.properties.UrlProperties;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Category;
import vn.edu.hcmuaf.fit.crocodile.service.CategoryService;
import vn.edu.hcmuaf.fit.crocodile.util.MyLogger;

import java.util.HashMap;
import java.util.List;


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
        List<Category> categories = categoryService.getAllCategory();
        servletContext.setAttribute("categories", categories);
    }
}
