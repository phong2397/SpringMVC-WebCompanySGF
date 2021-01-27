package com.sgfintech.util;


import org.apache.commons.io.IOUtils;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.Properties;

public class MailUtil {


    public static void SendEmailTLS(String toemail, String token) {

        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", true);
        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        prop.put("mail.smtp.starttls.enable", true); //TLS

        final String username = ConfigGateway.getEmailUser();
        final String password = ConfigGateway.getEmailPassword();


        Session session = Session.getInstance(prop,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });
        try {
            MimeMessage mailMessage = new MimeMessage(session);
            mailMessage.setFrom(new InternetAddress(username));
            mailMessage.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse(toemail)
            );
            mailMessage.setSubject("SGFintech - Yêu cầu RESET mật khẩu");
            InputStream input = MailUtil.class.getClassLoader().getResourceAsStream("email.html");
            assert input != null;
            InputStreamReader is = new InputStreamReader(input, StandardCharsets.UTF_8);
            String textMail = IOUtils.toString(is);
            textMail = textMail.replaceAll("######", token);
            BodyPart messageBodyPart = new MimeBodyPart();
            messageBodyPart.setContent(textMail, "text/html; charset=utf-8");
            Multipart _multipart = new MimeMultipart();
            _multipart.addBodyPart(messageBodyPart);
            mailMessage.setContent(_multipart);
            Transport.send(mailMessage);
            System.out.println("Done send email =================================================================================");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }


}
