package com.sgfintech.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * @author lucnguyen.hcmut@gmail.com
 */
public class ConfigGateway {
    private static String GATEWAY_URL = "";

    private static String EMAIL_USER = "thanhphong2497@gmail.com";

    private static String EMAIL_PASSWORD = "thanhphong2397";

    public static String getEmailUser() {
        return EMAIL_USER;
    }

    public static String getEmailPassword() {
        return EMAIL_PASSWORD;
    }

    public static String getGatewayUrl() {
        return GATEWAY_URL;
    }

    static {
        Properties prop = new Properties();
        try (InputStream input = ConfigGateway.class.getClassLoader().getResourceAsStream("paymentgateway.properties")) {
            prop.load(input);
            GATEWAY_URL = prop.getProperty("payment.url");
            EMAIL_USER = prop.getProperty("email.user");
            EMAIL_PASSWORD = prop.getProperty("email.password");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
