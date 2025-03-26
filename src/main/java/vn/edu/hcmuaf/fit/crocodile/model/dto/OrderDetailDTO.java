package vn.edu.hcmuaf.fit.crocodile.model.dto;

import java.time.LocalDateTime;

public record OrderDetailDTO(
        int id,
        // Thong tin chung
        String code, int idUser,
        LocalDateTime orderDate, String fullName,
        String paymentMethod, String phoneNumber,
        long total, String email,
        // Thong tin giao hang
        String recipientName, String shippingCompany,
        String recipientPhone, String shippingCode,
        String shippingAddress, boolean isDelete
) {
}
