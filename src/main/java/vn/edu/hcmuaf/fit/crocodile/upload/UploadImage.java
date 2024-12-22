package vn.edu.hcmuaf.fit.crocodile.upload;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.util.UUID;

public class UploadImage {

    public static String uploadImage(Part part, String webAppDirectory, String serverDirectory) {
        String fileName = part.getSubmittedFileName();
        String uniqueFileName = UUID.randomUUID().toString() + "_" + fileName;

        Path webAppPath = Path.of(webAppDirectory, uniqueFileName);
        Path serverPath = Path.of(serverDirectory, uniqueFileName);

        try {
            Files.copy(part.getInputStream(), webAppPath, StandardCopyOption.REPLACE_EXISTING);
            Files.copy(part.getInputStream(), serverPath, StandardCopyOption.REPLACE_EXISTING);
        } catch (IOException e) {
            e.printStackTrace();
        }

        return uniqueFileName;

    }
}
