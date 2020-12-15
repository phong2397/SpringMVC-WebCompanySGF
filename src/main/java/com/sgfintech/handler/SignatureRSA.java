package com.sgfintech.handler;

/**
 * @author lucnguyen.hcmut@gmail.com
 */

import org.apache.commons.lang3.StringEscapeUtils;
import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.bouncycastle.openssl.PEMKeyPair;
import org.bouncycastle.openssl.PEMParser;
import org.bouncycastle.openssl.jcajce.JcaPEMKeyConverter;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.security.*;
import java.util.Base64;

@Service
public class SignatureRSA {

    public String sign(String requestStr) {
        InputStream privatePem = SignatureRSA.class.getClassLoader().getResourceAsStream("mlem.pem");
        String message = StringEscapeUtils.unescapeJava(requestStr);
        PrivateKey privateKey = privateKeyReader(privatePem).getPrivate();
        byte[] messageAsByte = message.getBytes(Charset.forName("UTF-8"));
        byte[] signatureSHA1 = generateSignatureSHA1(messageAsByte, privateKey);
        String sig25664 = Base64.getEncoder().encodeToString(signatureSHA1);
        return sig25664;
    }

    private byte[] generateSignatureSHA1(byte[] requestMessage, PrivateKey privateKey) {
        Signature signature = null;
        try {
            signature = Signature.getInstance("SHA1withRSA");
            signature.initSign(privateKey);
            signature.update(requestMessage);
            return signature.sign();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (SignatureException e) {
            e.printStackTrace();
        } catch (InvalidKeyException e) {
            e.printStackTrace();
        }
        return null;
    }

    private KeyPair privateKeyReader(InputStream privatePem) {
        InputStreamReader ips = new InputStreamReader(privatePem, StandardCharsets.UTF_8);
        Security.addProvider(new BouncyCastleProvider());
        PEMParser pp = new PEMParser(ips);
        try {
            PEMKeyPair pemKeyPair = (PEMKeyPair) pp.readObject();
            KeyPair kp = new JcaPEMKeyConverter().getKeyPair(pemKeyPair);
            return kp;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}
