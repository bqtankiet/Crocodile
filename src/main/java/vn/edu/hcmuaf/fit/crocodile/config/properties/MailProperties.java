package vn.edu.hcmuaf.fit.crocodile.config.properties;

import java.util.Properties;

public class MailProperties extends ApplicationProperties{

    public static String sender() {
        return getProperty("mail.sender");
    }

    public static String appPassword() {
        return getProperty("mail.app-pass");
    }

    public static String smtpHost() {
        return getProperty("mail.smtp.host");
    }

    public static String smtpPort() {
        return getProperty("mail.smtp.port");
    }

    public static String smtpAuth() {return getProperty("mail.smtp.auth");}

    public static String smtpSSLTrust() {return getProperty("mail.smtp.ssl.trust");}

    public static String smtpStarttls() {return getProperty("mail.smtp.starttls.enable");}

    public static Properties getGmailProperties() {
        Properties prop = new Properties();
        prop.put("mail.smtp.host", smtpHost());
        prop.put("mail.smtp.port", smtpPort());
        prop.put("mail.smtp.auth", smtpAuth());
        prop.put("mail.smtp.starttls.enable", smtpStarttls());
        prop.put("mail.smtp.ssl.trust", smtpSSLTrust());
        return prop;
    }

    // TEST
    public static void main(String[] args) {
        System.out.println(MailProperties.appPassword());
    }
}
