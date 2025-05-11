package vn.edu.hcmuaf.fit.crocodile.controller;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDao;
import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDaoImpl;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Address;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Product;
import vn.edu.hcmuaf.fit.crocodile.model.order.Order;
import vn.edu.hcmuaf.fit.crocodile.model.order.OrderItem;
import vn.edu.hcmuaf.fit.crocodile.model.order.ShippingAddress;
import vn.edu.hcmuaf.fit.crocodile.service.ProductService;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/checkout/v2")
public class CheckoutControllerV2 extends HttpServlet {
    private UserDao userDao = new UserDaoImpl();
    private ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        Object userIdRaw = session.getAttribute("userId");
        if(userIdRaw == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        Integer userId = (Integer) userIdRaw;

        Order order = (Order) session.getAttribute("order");
        if (order == null) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        // load danh sách địa chỉ đã lưu // Đã kiểm tra, lấy được danh sách address
        List<Address> savedAddress = userDao.getAddressesByUserId(userId);
        request.setAttribute("savedAddressList", savedAddress);

        request.setAttribute("order", order);
        request.getRequestDispatcher("/views/checkout.jsp").forward(request, response);

//        System.out.println(order.getAddress().getFullAddress());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Object userIdRaw = session.getAttribute("userId");
        if(userIdRaw == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        Integer userId = (Integer) userIdRaw;

        Order order = new Order();
        // load địa chỉ mặc định
        Address defaultAddress = userDao.getDefaultAddressByUserId(userId);
        ShippingAddress address = new ShippingAddress();
        address.setRecipientName(defaultAddress.getFullname());
        address.setRecipientPhone(defaultAddress.getPhoneNumber());
        address.setProvinceName(defaultAddress.getProvince());
        address.setDistrictId(defaultAddress.getDistrictId());
        address.setDistrictName(defaultAddress.getDistrict());
        address.setWardCode(defaultAddress.getWardCode());
        address.setWardName(defaultAddress.getWard());
        address.setStreet(defaultAddress.getStreet());
        order.setAddress(address);

        // load danh sách item
        StringBuilder sb = new StringBuilder();
        BufferedReader reader = request.getReader();
        String line;
        while ((line = reader.readLine()) != null) sb.append(line);
        String requestData = sb.toString();

        JsonObject jsonObject = JsonParser.parseString(requestData).getAsJsonObject();
        JsonArray itemsArray = jsonObject.getAsJsonArray("items");

        List<OrderItem> items = new ArrayList<>();
        for(JsonElement item : itemsArray) {
            JsonObject itemObject = item.getAsJsonObject();
            int variantId = itemObject.get("variantId").getAsInt();
            int quantity = itemObject.get("quantity").getAsInt();
            Product.ProductVariant pv = productService.getProductVariantById(variantId);
            OrderItem oi = new OrderItem();
            oi.setQuantity(quantity);
            oi.setProductName(pv.getProduct().getName());
            oi.setUnitPrice(pv.getProduct().getPrice());
            oi.setVariantId(variantId);
            String option = "";
            if(pv.getpOption1() != null){
                option += pv.getpOption1().getKey() + ": "+pv.getpOption1().getValue();
            }
            if(pv.getpOption2() != null){
                option += ", ";
                option += pv.getpOption2().getKey() + ": "+pv.getpOption2().getValue();
            }
            oi.setVariantOption(option);
            oi.setProductImage(pv.getProduct().getImage());
            items.add(oi);
        }
        order.setItems(items);

        if (order.isValid()) {
            response.setStatus(HttpServletResponse.SC_OK);
            session.setAttribute("order", order);
        } else {
            response.setStatus(HttpServletResponse.SC_NOT_ACCEPTABLE);
        }
    }
}