package com.sgfintech.util;

import com.google.gson.JsonObject;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;

/**
 * @author lucnguyen.hcmut@gmail.com
 */
public class StringUtil {
    public static boolean isEmpty(Object o) {
        return "".equals(o) || o == null;
    }

    public static String hashPw(String pw) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messageDigest = md.digest(pw.getBytes());
            return convertByteToHex(messageDigest);
        } catch (NoSuchAlgorithmException ex) {
            return null;
        }
    }

    public static String convertByteToHex(byte[] data) {
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < data.length; i++) {
            sb.append(Integer.toString((data[i] & 0xff) + 0x100, 16).substring(1));
        }
        return sb.toString();
    }

    public static LocalDateTime convertToLocalDateViaInstant(Date dateToConvert) {
        LocalDateTime ldt = LocalDateTime.ofInstant(dateToConvert.toInstant(),
                ZoneId.systemDefault()) ;
        return ldt;
    }

    public static String messageSign(String j) {
        return null;
    }

}
