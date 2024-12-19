package vn.edu.hcmuaf.fit.crocodile_admin.config;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import vn.edu.hcmuaf.fit.crocodile_admin.config.properties.UrlProperties;

import java.util.HashMap;

@WebListener
public class ApplicationInitializer implements ServletContextListener {
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext servletContext = sce.getServletContext();
        initUrls(servletContext);
    }

    private void initUrls(ServletContext servletContext) {
        HashMap<String, String> urls = new HashMap<>();
        urls.put("admin.root", servletContext.getContextPath() + "/admin");
        urls.put("admin.account", UrlProperties.account());
        urls.put("admin.category", UrlProperties.category());
        urls.put("admin.product", UrlProperties.product());
        urls.put("admin.order", UrlProperties.order());
        urls.put("admin.user", UrlProperties.user());

        // CRUD URL
        urls.put("admin.category.delete", UrlProperties.delCate());

        servletContext.setAttribute("urls", urls);
    }
}
