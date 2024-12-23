package vn.edu.hcmuaf.fit.crocodile_admin.controller.CRUD.category;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.crocodile.config.properties.AssetsProperties;
import vn.edu.hcmuaf.fit.crocodile.dao.category.CategoryDao;
import vn.edu.hcmuaf.fit.crocodile.dao.category.CategoryDaoImpl;
import vn.edu.hcmuaf.fit.crocodile.upload.UploadImage;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

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
        System.out.println(uniqueFileName);
        System.out.println(request.getContextPath());
        System.out.println(getServletContext().getRealPath(""));

        CategoryDao dao = new CategoryDaoImpl();
        String name = request.getParameter("name");
        int active = Integer.parseInt(request.getParameter("active"));
        dao.insertCategory(name, uniqueFileName, active);
        System.out.println("Insert Category Successfully");
        response.sendRedirect(request.getContextPath() + "/admin/category");
    }
}
