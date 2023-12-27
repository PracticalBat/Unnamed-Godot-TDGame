/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package testverschluss;

import java.io.BufferedWriter;
import java.io.FileWriter;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import java.security.spec.KeySpec;
import java.util.Base64;
import java.nio.file.Files;
import java.io.IOException;
import java.nio.file.Paths;
import javax.swing.JOptionPane;

/**
 *
 * @author Jakob
 */
public class Testverschluss {

    /**
     * @param args the command line arguments
     */
    private static final String ALGORITHM = "AES";
    private static final int ITERATION_COUNT = 65536;
    private static final int KEY_LENGTH = 128;
    
    public static void main(String[] args) {
        try {
        encrypt();}
        catch(Exception e){
            System.out.println(e);
        }
    }
    public static void encrypt() throws Exception {
        String password = "admin12345";
        String valueToEnc = "Hallo mein Freund";
        SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");
        KeySpec spec = new PBEKeySpec(password.toCharArray(), "Salt".getBytes(), ITERATION_COUNT, KEY_LENGTH);
        SecretKeySpec key = new SecretKeySpec(factory.generateSecret(spec).getEncoded(), ALGORITHM);
        Cipher cipher = Cipher.getInstance(ALGORITHM);
        cipher.init(Cipher.ENCRYPT_MODE, key);
        byte[] encValue = cipher.doFinal(valueToEnc.getBytes());
        String encryptedValue = Base64.getEncoder().encodeToString(encValue);
        System.out.println(encryptedValue);
  }
    
}
