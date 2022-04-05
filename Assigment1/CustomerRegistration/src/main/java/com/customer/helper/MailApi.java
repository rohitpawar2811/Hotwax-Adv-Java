package com.customer.helper;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class MailApi {

    public static String from = "rohitpawar28112000@gmail.com";

    public static boolean sendMail(String msg , String subject , String to){
        boolean b=false;
         //variable for gmail
        String host = "smtp.gmail.com";

        //get the system properties
        Properties getPropertie = System.getProperties();
        System.out.print("properties "+getPropertie);

        //setting imp information properti obj

        getPropertie.put("mail.smtp.host",host);
        getPropertie.put("mail.smtp.port","465");
        getPropertie.put("mail.smtp.ssl.enable","true");
        getPropertie.put("mail.smtp.auth","true");

        // getting Session or we can say creating
        Session session=Session.getInstance(getPropertie, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from,"@Rohit28112000");
            }
        });
        //to get error on the console so that we can check it
        session.setDebug(true);

        //Step 2:     Making msg
        MimeMessage messageContainer =new MimeMessage(session);
        try {
//          message sender
            messageContainer.setFrom(from);
//            to whom msg is going
            messageContainer.addRecipients(Message.RecipientType.TO , String.valueOf(new InternetAddress(to)));
            messageContainer.setSubject(subject);
            messageContainer.setText(msg);

            Transport.send(messageContainer);
            b=true;
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return b;
    }



}
