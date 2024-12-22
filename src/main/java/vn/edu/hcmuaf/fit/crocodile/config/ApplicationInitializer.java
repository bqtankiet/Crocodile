package vn.edu.hcmuaf.fit.crocodile.config;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Category;
import vn.edu.hcmuaf.fit.crocodile.service.CategoryService;

import java.util.List;


@WebListener
public class ApplicationInitializer implements ServletContextListener {
    public void contextInitialized(ServletContextEvent sce) {
//        ServletContext servletContext = sce.getServletContext();
    }

    public void contextDestroyed(ServletContextEvent sce) {
    }

}
