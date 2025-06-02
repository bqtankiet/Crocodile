package com.mservice;

import com.mservice.config.Environment;
import com.mservice.enums.RequestType;
import com.mservice.models.PaymentResponse;
import com.mservice.processor.CreateOrderMoMo;
import com.mservice.shared.utils.LogUtils;

public class CreateMoMoQR {
    public static void main(String[] args) throws Exception {
        LogUtils.init();

        // Khởi tạo order
        String requestId = String.valueOf(System.currentTimeMillis());
        String orderId = String.valueOf(System.currentTimeMillis());
        long amount = 1000;
        String orderInfo = "Thanh toán đơn hàng QR";
        String returnURL = "https://google.com.vn";
        String notifyURL = "https://yourserver.com/api/momo-notify";

        Environment environment = Environment.selectEnv("dev");

        // Gọi API tạo đơn hàng
        PaymentResponse response = CreateOrderMoMo.process(
                environment, orderId, requestId,
                String.valueOf(amount), orderInfo,
                returnURL, notifyURL, "",
                RequestType.CAPTURE_WALLET, true
        );

        // In ra link QR để người dùng quét
        System.out.println("QR Pay URL: " + response.getPayUrl());
    }
}
