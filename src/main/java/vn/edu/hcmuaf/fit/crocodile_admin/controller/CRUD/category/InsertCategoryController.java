package vn.edu.hcmuaf.fit.crocodile_admin.controller.CRUD.category;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.crocodile.config.properties.AssetsProperties;
import vn.edu.hcmuaf.fit.crocodile.dao.category.ICategoryDao;
import vn.edu.hcmuaf.fit.crocodile.dao.category.CategoryDao;
import vn.edu.hcmuaf.fit.crocodile.service.CategoryService;
import vn.edu.hcmuaf.fit.crocodile.upload.UploadImage;

import java.io.IOException;

@MultipartConfig
@WebServlet(name = "Insert", value = "/admin/category/insert")
public class InsertCategoryController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/admin/views/crud/category/insert.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Part part = request.getPart("image");
        String uploadWebAppPath = "D:/PROJECT/crocodile/src/main/webapp/assets/images/categories-img";

        String uploadServerPath = getServletContext().getRealPath(AssetsProperties.categoriesImageDir());

        String uniqueFileName = UploadImage.uploadImage(part, uploadWebAppPath, uploadServerPath);

        CategoryService categoryService = new CategoryService();
        String name = request.getParameter("name");
        int active = Integer.parseInt(request.getParameter("active"));
        categoryService.insertCategory(name, uniqueFileName, active);
        response.sendRedirect(request.getContextPath() + "/admin/category");
    }
}
