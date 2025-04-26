package vn.edu.hcmuaf.fit.crocodile_admin.controller.dashboard;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = "/admin/dashboard/top-sale/*")
public class DashboardTopSaleProducts extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();
        List<TopSaleProductDTO> topSaleProducts = new ArrayList<>();
        switch (pathInfo) {
            case "/lastweek":
                topSaleProducts = getLastWeekSale();
                break;
            case "/lastmonth":
                topSaleProducts = getLastMonthSale();
                break;
            case "/lastyear":
                topSaleProducts = getLastYearSale();
                break;
            default: break;
        }
        req.setAttribute("topSaleProducts", topSaleProducts);
        req.getRequestDispatcher("/admin/views/dashboard/dashboard-top-sale.jsp").forward(req, resp);
    }

    private List<TopSaleProductDTO> getLastYearSale() {
        List<TopSaleProductDTO> topSaleProducts = new ArrayList<>();
        topSaleProducts.add(new TopSaleProductDTO(3, "123", 1000, 23, null));
        topSaleProducts.add(new TopSaleProductDTO(1, "ABC", 1000, 23, null));
        topSaleProducts.add(new TopSaleProductDTO(2, "DEF", 1000, 23, null));
        return topSaleProducts;
    }

    private List<TopSaleProductDTO> getLastMonthSale() {
        List<TopSaleProductDTO> topSaleProducts = new ArrayList<>();
        topSaleProducts.add(new TopSaleProductDTO(2, "DEF", 1000, 23, null));
        topSaleProducts.add(new TopSaleProductDTO(3, "123", 1000, 23, null));
        topSaleProducts.add(new TopSaleProductDTO(3, "123", 1000, 23, null));
        return topSaleProducts;
    }

    private List<TopSaleProductDTO> getLastWeekSale() {
        List<TopSaleProductDTO> topSaleProducts = new ArrayList<>();
        topSaleProducts.add(new TopSaleProductDTO(1, "ABC", 1000, 23, null));
        topSaleProducts.add(new TopSaleProductDTO(2, "DEF", 1000, 23, null));
        topSaleProducts.add(new TopSaleProductDTO(3, "123", 1000, 23, null));
        return topSaleProducts;
    }

    public static class TopSaleProductDTO implements Serializable {
        private int id;
        private String name;
        private int saleAmount;
        private double salePercent;
        private String image;

        public TopSaleProductDTO() {
        }

        public TopSaleProductDTO(int id, String name, int saleAmount, double salePercent, String image) {
            this.id = id;
            this.name = name;
            this.saleAmount = saleAmount;
            this.salePercent = salePercent;
            this.image = image;
        }

        public String getImage() {
            return image;
        }

        public void setImage(String image) {
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

        public int getSaleAmount() {
            return saleAmount;
        }

        public void setSaleAmount(int saleAmount) {
            this.saleAmount = saleAmount;
        }

        public double getSalePercent() {
            return salePercent;
        }

        public void setSalePercent(double salePercent) {
            this.salePercent = salePercent;
        }
    }

}
