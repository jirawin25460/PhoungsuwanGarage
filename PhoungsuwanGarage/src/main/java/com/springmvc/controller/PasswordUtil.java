package com.springmvc.controller;

import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;

public class PasswordUtil implements Serializable {
    private static final long serialVersionUID = 1L;
    private final int DEFAULT_SIZE = 32;
    private static PasswordUtil instance;

    public static PasswordUtil getInstance() {
        if (instance != null)
            return instance;

        instance = new PasswordUtil();
        return instance;
    }

    public String createSalt() throws NoSuchAlgorithmException {
        return Base64.getEncoder().encodeToString(getSalt(32));
    }

    private byte[] getSalt(int size) throws NoSuchAlgorithmException {
        SecureRandom sr = SecureRandom.getInstance("SHA1PRNG");
        final byte[] salt;
        if (size < 32) {
            salt = new byte[DEFAULT_SIZE];
        } else {
            salt = new byte[size];
        }
        sr.nextBytes(salt);
        return salt;
    }

    public String createPassword(String password)
            throws NoSuchAlgorithmException, UnsupportedEncodingException {
        return sha256(password.concat(createSalt()));
    }

    public String createPassword(String password, String salt)
            throws NoSuchAlgorithmException, UnsupportedEncodingException {
        return sha256(password.concat(salt));
    }

    public String sha256(String base)
            throws NoSuchAlgorithmException, UnsupportedEncodingException {
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        byte[] hash = digest.digest(base.getBytes("UTF-8"));
        StringBuilder hexString = new StringBuilder();

        for (byte b : hash) {
            String hex = Integer.toHexString(0xff & b);
            if (hex.length() == 1)
                hexString.append('0');
            hexString.append(hex);
        }
        return hexString.toString();
    }
}
