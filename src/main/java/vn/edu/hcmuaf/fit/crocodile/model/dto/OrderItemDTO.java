package vn.edu.hcmuaf.fit.crocodile.model.dto;

public record OrderItemDTO(
        int id,
        String name,
        long unitPrice,
        int amount,
        int total,
        // Phân loại variant
        String o1Key, String o1Value,
        String o2Key, String o2Value
) {
}
