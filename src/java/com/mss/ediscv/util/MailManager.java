 /*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mss.ediscv.util;

import java.io.File;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.BodyPart;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMultipart;
import java.util.Properties;
import java.util.StringTokenizer;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

/**
 *
 * @author miracle1
 */
public class MailManager {

    private static final String SMTP_AUTH_USER = "mscvp_alerts@miraclesoft.com";
    private static final String SMTP_AUTH_PWD = "Miracle@123";
    private static final String SMTP_HOST = "smtp.miraclesoft.com";
    private static final String PORT = "587";

    /* private static final String SMTP_AUTH_USER = "hbethireddy@miraclesoft.com";
    private static final String SMTP_AUTH_PWD = "Likesh@1613";
    private static final String SMTP_HOST = "smtp.miraclesoft.com";
    private static final String PORT = "587";*/
    /**
     *  DESC: Mailing for Ticketing system :: send a alert to asigned users
     *  Method: send mail
     * 
     */
    private static class SMTPAuthenticator extends javax.mail.Authenticator {

        public PasswordAuthentication getPasswordAuthentication() {
            String username = SMTP_AUTH_USER;
            String password = SMTP_AUTH_PWD;
            return new PasswordAuthentication(username, password);
        }
    }

    public static void sendUserIdPwd(String loginId, String userName, String password) {

        // SUBSTITUTE YOUR EMAIL ADDRESSES HERE!!!
        /** The to is used for storing the user mail id to send details. */
        String to = loginId + "@miraclesoft.com";

        /** The from is used for storing the from address. */
        String from = "hubbleapp@miraclesoft.com";

        // SUBSTITUTE YOUR ISP'S MAIL SERVER HERE!!!

        /**The host is used for storing the IP address of mail */
        /**The props is instance variabel to <code>Properties</code> class */
        Properties props = new Properties();

        /**Here set smtp protocal to props */
        props.setProperty("mail.transport.protocol", "smtp");

        //**Here set the address of the host to props */
        props.setProperty("mail.host", SMTP_HOST);
        props.put("mail.smtp.starttls.enable", "true");
        /** Here set the authentication for the host **/
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", PORT);
        Authenticator auth = new SMTPAuthenticator();
        // Session mailSession = Session.getDefaultInstance(props, null);
        Session mailSession = Session.getDefaultInstance(props, auth);
        mailSession.setDebug(true);
        Transport transport;
        try {
            transport = mailSession.getTransport();
            MimeMessage message = new MimeMessage(mailSession);
            message.setSubject("Miracle Supply Chain Visibility Portal Password Details");
            message.setFrom(new InternetAddress(from));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.addRecipient(Message.RecipientType.BCC, new InternetAddress("nseerapu@miraclesoft.com"));


            // This HTML mail have to 2 part, the BODY and the embedded image
            //
            MimeMultipart multipart = new MimeMultipart("related");

            // first part  (the html)
            BodyPart messageBodyPart = new MimeBodyPart();
            StringBuilder htmlText = new StringBuilder();
            htmlText.append("<html><head><title>Mail From Miracle Suuply Chain Visibility Portal</title>");
            htmlText.append("</head><body><font color='blue' size='2' face='Arial'>");
            htmlText.append("<p>Hello " + userName + "</p>");

            htmlText.append("<p><u><b>Your Login Details :</b></u><br><br>");
            htmlText.append("Login Id : <b>" + loginId + "</b><br>");
            htmlText.append("Password : <b>" + password + "</b><br><br>");
            htmlText.append("URL :&nbsp;&nbsp;&nbsp;&nbsp;");

            htmlText.append("<a href='http://192.168.1.179:8084/ediscv'>192.168.1.179:8084/ediscv</a><br><br>");

            htmlText.append("<b>Please Note:</b><br>");
            htmlText.append("To better protect ");
            htmlText.append("your account, make sure that your password is memorable ");
            htmlText.append("for you but difficult for others to guess. Never ");
            htmlText.append("use the same password that you have used in the past,");
            htmlText.append(" and do not share your password with anyone.<br></br><br>");
            htmlText.append("<b>Regards,</b><br>");
            htmlText.append("Miracle Supply Chain Visibility Portal Team,</p></font><br>");
            htmlText.append("<font color='red', size='2' face='Arial'>*Note:Please do not reply to this e-mail.  It was generated by our System.</font>");
            htmlText.append("</body></html>");

            messageBodyPart.setContent(htmlText.toString(), "text/html");

            // add it
            multipart.addBodyPart(messageBodyPart);

            // second part (the image)
            //messageBodyPart = new MimeBodyPart();
            //DataSource fds = new FileDataSource("C:\\Documents and Settings\\miracle1\\Desktop\\ProjectFiles\\Mailer\\mailTemplate_600x800.jpg");
            // messageBodyPart.setDataHandler(new DataHandler(fds));
            // messageBodyPart.setHeader("Content-ID","<image>");

            // add it
            //multipart.addBodyPart(messageBodyPart);

            // put everything together
            message.setContent(multipart);

            transport.connect();
            transport.sendMessage(message,
                    message.getRecipients(Message.RecipientType.TO));
            transport.sendMessage(message,
                    message.getRecipients(Message.RecipientType.BCC));
            transport.close();
        } catch (NoSuchProviderException ex) {
            ex.printStackTrace();
        } catch (MessagingException ex) {
            ex.printStackTrace();
        }

    }

    /**
     * @param assignedBy
     * @param assignTo
     * @param category
     * @param priority
     * @param devTime
     * @param summary
     * @param desc
     * @throws ServiceLocatorException 
     */
    public static void sendCreatedIssueDetails(String assignedBy, String assignTo, String category, String priority, String devTime, String summary, String desc) throws ServiceLocatorException {



        String cc = assignedBy + "@miraclesoft.com";
        String from = "hubbleapp@miraclesoft.com";

        Properties props = new Properties();

        /**Here set smtp protocal to props */
        props.setProperty("mail.transport.protocol", "smtp");

        //**Here set the address of the host to props */
        props.setProperty("mail.host", SMTP_HOST);
        /** Here set the authentication for the host **/
        props.put("mail.smtp.auth", "true");

        Authenticator auth = new SMTPAuthenticator();
        //  Session mailSession = Session.getDefaultInstance(props, null);
        Session mailSession = Session.getDefaultInstance(props, auth);
        mailSession.setDebug(true);
        Transport transport;
        try {
            transport = mailSession.getTransport();
            MimeMessage message = new MimeMessage(mailSession);
            message.setSubject("Reg : Miracle Supply Chain Visibility Portal Issue Assigned ");
            message.setFrom(new InternetAddress(from));
            StringTokenizer st = new StringTokenizer(assignTo, ",");
            while (st.hasMoreTokens()) {
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(st.nextToken() + "@miraclesoft.com"));
            }
            message.addRecipient(Message.RecipientType.CC, new InternetAddress(cc));
            message.addRecipient(Message.RecipientType.BCC, new InternetAddress("atummapala@miraclesoft.com"));

            MimeMultipart multipart = new MimeMultipart("related");

            // first part  (the html)
            BodyPart messageBodyPart = new MimeBodyPart();
            StringBuilder htmlText = new StringBuilder();

            htmlText.append("<html><head><title>Mail from MSCVP</title>");
            htmlText.append("</head><body><font color='blue' size='2' face='Arial'>");
            htmlText.append("<p>Hello,</p>");
            htmlText.append("<p>These are the current issue details</p>");
            htmlText.append("<br>------------------------------------------------------<br>");
            htmlText.append("Category : " + category + "<br>");
            htmlText.append("Priority: " + priority + "<br>");
            htmlText.append("Development Time: " + devTime + "<br>");
            htmlText.append("Summary: " + summary + "<br>");
            htmlText.append("Description: <br>");
            htmlText.append("------------------------------------------------------<br>");
            htmlText.append(desc + "<br><br>");
            htmlText.append("To view more details of this issue, or to update it, please visit the following URL: http://192.168.1.179:8084/ediscv/<br>");
            htmlText.append("<br>");
            htmlText.append("Thank you.</p></font>");
            htmlText.append("<font color='red', size='2' face='Arial'>*Note:Please do not reply to this e-mail.  It was generated by Issue Tracking System.</font>");
            htmlText.append("</body></html>");


            messageBodyPart.setContent(htmlText.toString(), "text/html");

            // add it
            multipart.addBodyPart(messageBodyPart);

            // put everything together
            message.setContent(multipart);

            transport.connect();
            transport.sendMessage(message, message.getRecipients(Message.RecipientType.TO));


            transport.sendMessage(message, message.getRecipients(Message.RecipientType.CC));
            //transport.sendMessage(message,message.getRecipients(Message.RecipientType.BCC));

            transport.sendMessage(message, message.getRecipients(Message.RecipientType.BCC));
            transport.close();
        } catch (NoSuchProviderException ex) {
            ex.printStackTrace();
        } catch (MessagingException ex) {
            ex.printStackTrace();
        }
    }

    public static String sendMail(String loginId, String fname) {
        String to = loginId;
        //String fname=filename; 
        System.out.println("EMAIL in sendMail===================================" + to);
        System.out.println("EMAIL in sendMail===================================" + fname);
        //  String oggedInEmpName = HttpServletRequest.getSession(false).getAttribute(AppConstants.SES_USER_NAME).toString();
        // String userName = httpServletRequest.getSession(false).getAttribute(AppConstants.SES_USER_NAME).toString();      
        //   System.out.println("EMAIL in sendMail==================================="+Username);
        //String to ="hbethireddy@miraclesoft.com";
        //String to =loginId+"@miraclesoft.com";
        String from = "hubbleapp@miraclesoft.com";
        Properties props = new Properties();
        props.setProperty("mail.transport.protocol", "smtp");
        props.setProperty("mail.host", SMTP_HOST);
        props.put("mail.smtp.auth", "true");

        Authenticator auth = new SMTPAuthenticator();
        // Session mailSession = Session.getDefaultInstance(props, null);
        Session mailSession = Session.getDefaultInstance(props, auth);
        mailSession.setDebug(true);
        Transport transport;
        // WeekelyReport wrg= new DailyRepot();
        // String proPath="";
        String proPath = com.mss.ediscv.util.Properties.getProperty("mscvp.logisticsDocCreationPath") + fname;
        MimeMessage message = new MimeMessage(mailSession);
        try {
            transport = mailSession.getTransport();
            // MimeMessage message = new MimeMessage(mailSession);
            message.setSubject("Miracle Supply Chain Visibility Portal Status Report");
            message.setFrom(new InternetAddress(from));
            StringTokenizer st = new StringTokenizer(loginId, "|");
            while (st.hasMoreTokens()) {
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(st.nextToken()));
            }
            //  message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
            message.addRecipient(Message.RecipientType.BCC, new InternetAddress("hbethireddy@miraclesoft.com"));

            MimeMultipart multipart = new MimeMultipart("related");

            // first part  (the html)
            BodyPart messageBodyPart = new MimeBodyPart();
            StringBuilder htmlText = new StringBuilder();
            htmlText.append("<html><head><title>Mail From Miracle Suuply Chain Visibility Portal</title>");
            htmlText.append("</head><body><font color='blue' size='2' face='Arial'>");
            //htmlText.append("<p>Hello "+userName+",</p>");
            htmlText.append("<p>Hello,</p>");
            htmlText.append("<p><u><b>Please find the Weekely status report. :</b></u><br><br>");
            //htmlText.append("Login Id : <b>hbethireddy</b><br>");
            //htmlText.append("Password : <b>123</b><br><br>");
            // htmlText.append("URL :&nbsp;&nbsp;&nbsp;&nbsp;");

            // htmlText.append("<a href=\"../partner/getSchedularsearch.action\">Download</a></td></tr><br><br>");
            // htmlText.append("74.218.204.46/ediscv</a><br><br>");
            //htmlText.append("<a href=\"../download/getAttachment.action?locationAvailable="+proPath+"\">Download</a><br><br>");
            //htmlText.append("<b>Please Find Attachment:</b><br><br>");
            // htmlText.append("To better protect <br></br><br>");             
            htmlText.append("<b>Regards,</b><br>");
            htmlText.append("Miracle Supply Chain Visibility Portal Team,</p></font><br>");
            htmlText.append("<font color='red', size='2' face='Arial'>*Note:Please do not reply to this e-mail.  It was generated by our System.</font>");
            htmlText.append("</body></html>");

            messageBodyPart.setContent(htmlText.toString(), "text/html");
            BodyPart messageBodyPart1 = new MimeBodyPart();

            DataSource source = new FileDataSource(proPath);
            messageBodyPart1.setDataHandler(new DataHandler(source));
            System.out.println("filename" + proPath);
            messageBodyPart1.setFileName(proPath.substring(proPath.lastIndexOf(File.separator) + 1, proPath.length()));
            // add it .substring(filename.lastIndexOf(File.separator)+1,filename.length())
            multipart.addBodyPart(messageBodyPart);
            multipart.addBodyPart(messageBodyPart1);
            message.setContent(multipart);

            transport.connect();
            transport.sendMessage(message,
                    message.getRecipients(Message.RecipientType.TO));
            transport.sendMessage(message,
                    message.getRecipients(Message.RecipientType.BCC));
            transport.close();
        } catch (NoSuchProviderException ex) {

            ex.printStackTrace();
            return "failure";
        } catch (MessagingException ex) {
            ex.printStackTrace();
            return "failure";
        }

        return "succcess";

    }

    public static void tpoDetails(int partnerId, String partnerName, String contactName, String email, String Phone, String Country, String protocol, String transferMode, String filepath, String sslFilepath, Map mp, boolean ib850, boolean ib855, boolean ib856, boolean ib810, boolean ob850, boolean ob855, boolean ob856, boolean ob810, String flag) {
        // SUBSTITUTE YOUR EMAIL ADDRESSES HERE!!!
        /** The to is used for storing the user mail id to send details. */
        String to = email;
        /** The from is used for storing the from address. */
        String from = "mscvp_alerts@miraclesoft.com";
        // SUBSTITUTE YOUR ISP'S MAIL SERVER HERE!!!
        /**The host is used for storing the IP address of mail */
        /**The props is instance variabel to <code>Properties</code> class */
        Properties props = new Properties();
        /**Here set smtp protocal to props */
        props.setProperty("mail.transport.protocol", "smtp");
        //**Here set the address of the host to props */
        props.setProperty("mail.host", SMTP_HOST);
        props.put("mail.smtp.starttls.enable", "true");
        /** Here set the authentication for the host **/
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", PORT);
        Authenticator auth = new SMTPAuthenticator();
        // Session mailSession = Session.getDefaultInstance(props, null);
        Session mailSession = Session.getDefaultInstance(props, auth);
        mailSession.setDebug(true);
        Transport transport;
        try {
            Map ptotoMap = mp;
            Collection<String> keys = ptotoMap.keySet();
            Collection<String> vals = ptotoMap.values();
            String[] key = keys.toArray(new String[keys.size()]);
            String[] val = vals.toArray(new String[vals.size()]);
            int i = 0;
            Iterator<Map.Entry<String, String>> li = ptotoMap.entrySet().iterator();
            while (li.hasNext()) {
                Map.Entry<String, String> r = li.next();
                key[i] = r.getKey();
                val[i] = r.getValue();
                i++;
            }
            transport = mailSession.getTransport();
            MimeMessage message = new MimeMessage(mailSession);
            message.setSubject("Miracle Trading Partner Onboarding Details");
            message.setFrom(new InternetAddress(from));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.addRecipient(Message.RecipientType.CC, new InternetAddress("skunibilli@miraclesoft.com"));
            message.addRecipient(Message.RecipientType.BCC, new InternetAddress("rpulleboina@miraclesoft.com"));
            // This HTML mail have to 2 part, the BODY and the embedded image
            MimeMultipart multipart = new MimeMultipart("related");
            // first part  (the html)
            BodyPart messageBodyPart = new MimeBodyPart();
            MimeBodyPart messageBodyPart2 = null;
            MimeBodyPart messageBodyPart3 = null;
            StringBuilder htmlText = new StringBuilder();
            htmlText.append("<html><head><title>Mail From Miracle Trading Partner Onboarding Portal</title>");
            htmlText.append("</head><body><font color='blue' size='2' face='Arial'>");
            htmlText.append("<p>Hello " + partnerName + "</p>");
            if (flag.equalsIgnoreCase("Insert")) {
                htmlText.append("<p><u><b>Trading Partner Information :</b></u><br><br>");
            } else {
                htmlText.append("<p><u><b>Updated Trading Partner Information :</b></u><br><br>");
            }
            htmlText.append("Partner Name &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <b>" + partnerName + "</b><br>");
            htmlText.append("Contact Name &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <b>" + contactName + "</b><br>");
            htmlText.append("Email &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <b>" + email + "</b><br>");
            htmlText.append("Phone no &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <b>" + Phone + "</b><br>");
            htmlText.append("Country &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <b>" + Country + "</b><br>");
            htmlText.append("<p><u><b> Server Details :</b></u><br><br>");
            htmlText.append("Selected Protocol : <b>" + protocol + "</b><br>");
            if (!"".equals(transferMode) && transferMode != null && !"AS2".equals(protocol) && !"SMTP".equals(protocol)) {
                htmlText.append("Transfer Mode : <b>" + transferMode + "</b><br>");
            }
            htmlText.append("<br>");
            htmlText.append(key[0] + "         : <b>" + val[0] + "</b><br>");
            htmlText.append(key[1] + "         : <b>" + val[1] + "</b><br>");
            htmlText.append(key[2] + "         : <b>" + val[2] + "</b><br>");
            htmlText.append(key[3] + "         : <b>" + val[3] + "</b><br>");
            htmlText.append(key[4] + "         : <b>" + val[4] + "</b><br>");
            if ((protocol.equalsIgnoreCase("AS2"))) {
             //   htmlText.append(key[5] + "         : <b>" + val[5] + "</b><br>");
                if (filepath != null) {
                    messageBodyPart2 = new MimeBodyPart();
                    String filename = filepath;//change accordingly 
                    DataSource source = new FileDataSource(filename);
                    messageBodyPart2.setDataHandler(new DataHandler(source));
                    messageBodyPart2.setFileName((partnerName + "_" + partnerId + "_TRUSTEDCERT") + ".cer");
                }
                if ((sslFilepath != null)) {
                    messageBodyPart3 = new MimeBodyPart();
                    String filename = sslFilepath;//change accordingly 
                    DataSource source = new FileDataSource(filename);
                    messageBodyPart3.setDataHandler(new DataHandler(source));
                    messageBodyPart3.setFileName((partnerName + "_" + partnerId + "_CACERT") + ".cer");
                }
            }
            if ((protocol.equalsIgnoreCase("SFTP")) && (filepath != null)) {
                messageBodyPart2 = new MimeBodyPart();
                String filename = filepath;//change accordingly 
                DataSource source = new FileDataSource(filename);
                messageBodyPart2.setDataHandler(new DataHandler(source));
                messageBodyPart2.setFileName((partnerName + "_" + partnerId + "_PUBLICKEY") + ".cer");
            }
            if ((protocol.equalsIgnoreCase("FTP") || protocol.equalsIgnoreCase("HTTP")) && (sslFilepath != null)) {
                messageBodyPart2 = new MimeBodyPart();
                String filename = sslFilepath;//change accordingly 
                DataSource source = new FileDataSource(filename);
                messageBodyPart2.setDataHandler(new DataHandler(source));
                messageBodyPart2.setFileName((partnerName + "_" + partnerId + "_CACERT") + ".cer");
            }
            htmlText.append("<p><u><b> Below transactions are entered by you.</b></u><br><br>");
            htmlText.append("Inbound Transactions : <b>");
            if (ib850 == true) {
                htmlText.append(" 850 ");
            }
            if (ib855 == true) {
                htmlText.append(" 855 ");
            }
            if (ib856 == true) {
                htmlText.append(" 856 ");
            }
            if (ib810 == true) {
                htmlText.append(" 810 ");
            }
            htmlText.append("</b><br>");
            htmlText.append("Outbound Transactions : <b>");
            if (ob850 == true) {
                htmlText.append(" 850 ");
            }
            if (ob855 == true) {
                htmlText.append(" 855 ");
            }
            if (ob856 == true) {
                htmlText.append(" 856 ");
            }
            if (ob810 == true) {
                htmlText.append(" 810 ");
            }
            htmlText.append("</b><br><br><br><table border='0' cellpadding='0' cellspacing='0' style='background-color:#338dff; border:1px solid #353535; border-radius:5px;'>");
            htmlText.append("<tr><td align='center' valign='middle' style='color:#FFFFFF; font-family:Helvetica, Arial, sans-serif; font-size:16px; font-weight:bold; letter-spacing:-.5px; line-height:150%; padding-top:5px; padding-right:20px; padding-bottom:5px; padding-left:20px;'>");
            htmlText.append("<a href='http://192.168.1.179:8084/ediscv' target='_blank' style='color:#FFFFFF; text-decoration:none;'>Click here to login</a></td></tr></table><br><br>");
            htmlText.append("<b>Please Note:</b><br>");
            htmlText.append("To better protect ");
            htmlText.append("your account, make sure that your password is memorable ");
            htmlText.append("for you but difficult for others to guess. Never ");
            htmlText.append("use the same password that you have used in the past,");
            htmlText.append(" and do not share your password with anyone.<br></br><br>");
            htmlText.append("<b>Regards,</b><br>");
            htmlText.append("Miracle Trading Partner Onboarding Portal Team,</p></font><br>");
            htmlText.append("<font color='red', size='2' face='Arial'>*Note:Please do not reply to this e-mail.  It was generated by our System.</font>");
            htmlText.append("</body></html>");

            messageBodyPart.setContent(htmlText.toString(), "text/html");

            // add it
            multipart.addBodyPart(messageBodyPart);
            if (messageBodyPart2 != null) {
                multipart.addBodyPart(messageBodyPart2);
            }
            if (messageBodyPart3 != null) {
                multipart.addBodyPart(messageBodyPart3);
            }

            // second part (the image)
            //messageBodyPart = new MimeBodyPart();
            //DataSource fds = new FileDataSource("C:\\Documents and Settings\\miracle1\\Desktop\\ProjectFiles\\Mailer\\mailTemplate_600x800.jpg");
            // messageBodyPart.setDataHandler(new DataHandler(fds));
            // messageBodyPart.setHeader("Content-ID","<image>");

            // add it
            //multipart.addBodyPart(messageBodyPart);

            // put everything together
            message.setContent(multipart);

            transport.connect();
            transport.sendMessage(message,
                    message.getRecipients(Message.RecipientType.TO));
            transport.sendMessage(message,
                    message.getRecipients(Message.RecipientType.CC));
            transport.sendMessage(message,
                    message.getRecipients(Message.RecipientType.BCC));
            transport.close();
        } catch (NoSuchProviderException ex) {
            ex.printStackTrace();
        } catch (MessagingException ex) {
            ex.printStackTrace();
        }

    }

    public static void tpoUserIdPwd(String regContactName,String regPartName, String email, String loginId, String password) {
        // SUBSTITUTE YOUR EMAIL ADDRESSES HERE!!!
        /** The to is used for storing the user mail id to send details. */
        String to = email;
        /** The from is used for storing the from address. */
        String from = "mscvp_alerts@miraclesoft.com";
        // SUBSTITUTE YOUR ISP'S MAIL SERVER HERE!!!
        /**The host is used for storing the IP address of mail */
        /**The props is instance variabel to <code>Properties</code> class */
        Properties props = new Properties();
        /**Here set smtp protocal to props */
        props.setProperty("mail.transport.protocol", "smtp");
        //**Here set the address of the host to props */
        props.setProperty("mail.host", SMTP_HOST);
        props.put("mail.smtp.starttls.enable", "true");
        /** Here set the authentication for the host **/
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", PORT);
        Authenticator auth = new SMTPAuthenticator();
        Session mailSession = Session.getDefaultInstance(props, auth);
        mailSession.setDebug(true);
        Transport transport;
        try {
            transport = mailSession.getTransport();
            MimeMessage message = new MimeMessage(mailSession);
            message.setSubject("Miracle Trading Partner Onboarding Password Details");
            message.setFrom(new InternetAddress(from));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.addRecipient(Message.RecipientType.CC, new InternetAddress("skunibilli@miraclesoft.com"));
            message.addRecipient(Message.RecipientType.BCC, new InternetAddress("rpulleboina@miraclesoft.com"));
            // This HTML mail have to 2 part, the BODY and the embedded image
            MimeMultipart multipart = new MimeMultipart("related");
            // first part  (the html)
            BodyPart messageBodyPart = new MimeBodyPart();
            StringBuilder htmlText = new StringBuilder();
            htmlText.append("<html><head><title>Mail From Miracle Trading Partner Onboarding Portal</title>");
            htmlText.append("</head><body><font color='blue' size='2' face='Arial'>");
            htmlText.append("<p>Hello " + regContactName + "</p>");
            htmlText.append("<p><u><b>Your Login Details :</b></u><br><br>");
            htmlText.append("Login Id : <b>" + loginId + "</b><br>");
            htmlText.append("Password : <b>" + password + "</b><br><br>");
            htmlText.append("<table border='0' cellpadding='0' cellspacing='0' style='background-color:#338dff; border:1px solid #353535; border-radius:5px;'>");
            htmlText.append("<tr><td align='center' valign='middle' style='color:#FFFFFF; font-family:Helvetica, Arial, sans-serif; font-size:16px; font-weight:bold; letter-spacing:-.5px; line-height:150%; padding-top:5px; padding-right:20px; padding-bottom:5px; padding-left:20px;'>");
            htmlText.append("<a href='http://192.168.1.179:8084/ediscv' target='_blank' style='color:#FFFFFF; text-decoration:none;'>Click here to login</a></td></tr></table><br><br>");
            htmlText.append("<b>Please Note:</b><br>");
            htmlText.append("To better protect ");
            htmlText.append("your account, make sure that your password is memorable ");
            htmlText.append("for you but difficult for others to guess. Never ");
            htmlText.append("use the same password that you have used in the past,");
            htmlText.append(" and do not share your password with anyone.<br></br><br>");
            htmlText.append("<b>Regards,</b><br>");
            htmlText.append("Miracle Trading Partner Onboarding Portal Team,</p></font><br>");
            htmlText.append("<font color='red', size='2' face='Arial'>*Note:Please do not reply to this e-mail.  It was generated by our System.</font>");
            htmlText.append("</body></html>");

            messageBodyPart.setContent(htmlText.toString(), "text/html");

            multipart.addBodyPart(messageBodyPart);

            message.setContent(multipart);
            transport.connect();
            transport.sendMessage(message,
                    message.getRecipients(Message.RecipientType.TO));
            transport.sendMessage(message,
                    message.getRecipients(Message.RecipientType.CC));
            transport.sendMessage(message,
                    message.getRecipients(Message.RecipientType.BCC));
            transport.close();
        } catch (NoSuchProviderException ex) {
            ex.printStackTrace();
        } catch (MessagingException ex) {
            ex.printStackTrace();
        }

    }
}
