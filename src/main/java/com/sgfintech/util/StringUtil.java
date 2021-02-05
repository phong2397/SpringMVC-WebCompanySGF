package com.sgfintech.util;

import com.sgfintech.entity.SaRequest;
import com.sgfintech.handler.MergeDataOrder;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLOutput;
import java.text.Normalizer;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

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
                ZoneId.systemDefault());
        return ldt;
    }

    public static String messageSign(String j) {
        return null;
    }

    public static String replaceName(String name) {
        return Normalizer
                .normalize(name, Normalizer.Form.NFD)
                .replaceAll("[^\\p{ASCII}]", "");
    }

    public static Integer countBorrow(List<MergeDataOrder> lst, String phone) {
        Calendar cal = Calendar.getInstance();
        int month = cal.get(Calendar.MONTH) + 1;
        int count = 0;
        for (MergeDataOrder m : lst) {
            if (m.getSaRequest().getCustomerPhone().equals(phone) && m.getSaRequest().getStatus().equals("done") && m.getSaRequest().getCreatedDate().getMonth().getValue() == month) {
                count += 1;
            }
        }
        return count;
    }

}
