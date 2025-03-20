package vn.edu.hcmuaf.fit.crocodile.api.user.address;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.crocodile.api.util.Authentication;
import vn.edu.hcmuaf.fit.crocodile.dao.address.AddressDao;
import vn.edu.hcmuaf.fit.crocodile.model.entity.Address;

import java.io.IOException;

@WebServlet("/api/user/address")
public class UserAddressAPI extends HttpServlet {
    private AddressDao addressDao;
    private Gson gson;


    @Override
    public void init() throws ServletException {
        addressDao = new AddressDao();
        gson = new Gson();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JsonObject jsonResponse = new JsonObject();

        int userId = new Authentication().authenticate(request);
        if (userId == -1) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }

        int addressId = tryToGetAddressId(request);
        Address address = addressDao.getAddressByIdAndUserId(addressId, userId);

        if (address == null) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            jsonResponse.addProperty("error", "address not found");
        } else {
            response.setStatus(HttpServletResponse.SC_OK);
            jsonResponse.add("data", gson.toJsonTree(address));
        }
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(gson.toJson(jsonResponse));
    }

    private int tryToGetAddressId(HttpServletRequest request) {
        String idParam = request.getParameter("id");
        int id;
        try {
            id = Integer.parseInt(idParam);
        } catch (NumberFormatException e) {
            id = -1;
        }
        return id;
    }
}
