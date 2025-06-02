package vn.edu.hcmuaf.fit.crocodile.config.firebase;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

import java.io.IOException;
import java.io.InputStream;

@WebListener
public class FirebaseConfig implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        try {
            // Sử dụng getResourceAsStream thay vì FileInputStream để tránh lỗi path
            InputStream serviceAccount = getClass().getClassLoader()
                    .getResourceAsStream("crocodile-bd209-firebase-adminsdk-fbsvc-e40dedfe36.json");

            if (serviceAccount == null) {
                System.err.println("Error: Firebase service account file not found in resources!");
                System.err.println("Make sure 'crocodile-bd209-firebase-adminsdk-fbsvc-e40dedfe36.json' is in src/main/resources/");
                return;
            }

            FirebaseOptions options = FirebaseOptions.builder()
                    .setCredentials(GoogleCredentials.fromStream(serviceAccount))
                    .build();

            // Kiểm tra xem Firebase đã được khởi tạo chưa
            if (FirebaseApp.getApps().isEmpty()) {
                FirebaseApp.initializeApp(options);
                System.out.println("Firebase initialized successfully!");
            } else {
                System.out.println("Firebase already initialized");
            }

            // Đóng stream
            serviceAccount.close();

        } catch (IOException e) {
            System.err.println("Error initializing Firebase: " + e.getMessage());
            e.printStackTrace();
        } catch (Exception e) {
            System.err.println("Unexpected error during Firebase initialization: " + e.getMessage());
            e.printStackTrace();
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // Clean up Firebase apps when context is destroyed
        FirebaseApp.getApps().forEach(app -> {
            try {
                app.delete();
                System.out.println("Firebase app deleted: " + app.getName());
            } catch (Exception e) {
                System.err.println("Error deleting Firebase app: " + e.getMessage());
            }
        });
    }
}