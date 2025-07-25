package vn.edu.hcmuaf.fit.crocodile_admin.controller.dashboard;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.crocodile.service.DashboardService;

import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet(urlPatterns = "/admin/dashboard/new-products")
public class DashboardNewProducts extends HttpServlet {
    private final DashboardService service = new DashboardService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Map<String, Object>> result = service.getTop10NewProducts();
        List<NewProductDTO> newProducts =  new ArrayList<>();
        for(Map<String, Object> row : result) {
            NewProductDTO newProductDTO = new NewProductDTO();
            newProductDTO.setId(Integer.parseInt(row.get("id").toString()));
            newProductDTO.setName(row.get("name").toString());
            newProductDTO.setImage(row.get("image").toString());
            newProducts.add(newProductDTO);
        }
//        newProducts.add(new NewProductDTO(1, "ABC", null));
//        newProducts.add(new NewProductDTO(1, "ABC", null));
//        newProducts.add(new NewProductDTO(1, "ABC", null));
        req.setAttribute("newProducts", newProducts);
        req.getRequestDispatcher("/admin/views/dashboard/dashboard-new-products.jsp").forward(req, resp);
    }

    public static class NewProductDTO implements Serializable {
        private int id;
        private String name;
        private String image;

        public NewProductDTO() {}

        public NewProductDTO(int id, String name, String image) {
            this.id = id;
            this.name = name;
            this.image = image;
        }

        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public String getImage() {
            return image;
        }

        public void setImage(String image) {
            this.image = image;
        }
    }
}
