package vn.edu.hcmuaf.fit.crocodile.api.user.profile;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.crocodile.dao.address.AddressDao;
import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDao;
import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDaoImpl;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Address;

import java.io.IOException;
import java.util.List;

@WebServlet("/api/user/profile/address")
public class AddressApi extends HttpServlet {
    private UserDao userDao;
    private Gson gson;

    @Override
    public void init() throws ServletException {
        userDao = new UserDaoImpl();
        gson = new Gson();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JsonObject json = new JsonObject();
        int userId = Integer.parseInt(request.getSession().getAttribute("userId").toString());

        json.addProperty("status", "success");
        json.addProperty("code", 200);
        json.addProperty("message", "success");

        try {
            String paramId = request.getParameter("id");
            if (paramId == null) {
                List<Address> addressList = userDao.getAddressesByUserId(userId);
                json.add("data", gson.toJsonTree(addressList));
            }
            int addressId = Integer.parseInt(request.getParameter("id"));
            Address address = new AddressDao().getAddressByIdAndUserId(addressId, userId);
            json.add("data", gson.toJsonTree(address));
        } catch (NumberFormatException e) {
            json.addProperty("status", "error");
            json.addProperty("code", 400);
            json.addProperty("message", "Invalid id");
        }

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.setStatus(HttpServletResponse.SC_OK);
        response.getWriter().write(gson.toJson(json));
    }
}
