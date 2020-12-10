package com.sgfintech.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * @author lucnguyen.hcmut@gmail.com
 */
public class ConfigGateway {
    private static String GATEWAY_URL = "";

    public static String getGatewayUrl() {
        return GATEWAY_URL;
    }

    static {
        Properties prop = new Properties();
        try (InputStream input = ConfigGateway.class.getClassLoader().getResourceAsStream("paymentgateway.properties")) {
            prop.load(input);
            GATEWAY_URL = prop.getProperty("payment.url");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
