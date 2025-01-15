package vn.edu.hcmuaf.fit.crocodile.model.entity;

import vn.edu.hcmuaf.fit.crocodile.dao.user.UserDaoImpl;

public class Address {
    private int id;
    private int userId;
    private String fullname;
    private String phoneNumber;
    private String province;
    private String district;
    private String ward;
    private String street;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getWard() {
        return ward;
    }

    public void setWard(String ward) {
        this.ward = ward;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public static void main(String[] args) {
        // Giả sử userId đã có từ trước, ví dụ là 1
        int userId = 1;

        // Tạo đối tượng Address với các thông tin cần thiết
        Address address = new Address();
        address.setUserId(userId);
        address.setFullname("Nguyễn Văn A");
        address.setPhoneNumber("0123456789");
        address.setProvince("Hà Nội");
        address.setDistrict("Hoàn Kiếm");
        address.setWard("Phường Hàng Bạc");
        address.setStreet("Số 123, Đường ABC");

        // Gọi phương thức addAddress của UserDaoImpl để thêm địa chỉ vào DB
        UserDaoImpl userDao = new UserDaoImpl();
        try {
            userDao.addAddress(address);
            System.out.println("Địa chỉ đã được thêm thành công!");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Có lỗi xảy ra khi thêm địa chỉ.");
        }
    }
}
