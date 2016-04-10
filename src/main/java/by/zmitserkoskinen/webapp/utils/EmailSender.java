package by.zmitserkoskinen.webapp.utils;


import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class EmailSender {


    private static final String fromEmail = "mytimetable11@gmail.com"; //requires valid gmail id
    private static final String password = "mytimetable123"; // correct password for gmail id
    private static final String toEmail = "timetable11recipient@gmail.com"; // can be any email id
    private static Properties props;


    private static final EmailSender MAIL_SENDER = new EmailSender();
    private EmailSender() {
        props = new Properties();
        props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
        props.put("mail.smtp.port", "587"); //TLS Port
        props.put("mail.smtp.auth", "true"); //enable authentication
        props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS
    }

    public static EmailSender getInstance(){
        return MAIL_SENDER;
    }

    public void sendEmail(String subject, String text) {
        try {
            Authenticator auth = new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            };
            Session session = Session.getInstance(props, auth);
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            message.setSubject(subject);
            message.setText(text);
            Transport.send(message);
        } catch (Exception ex) {
            System.out.println("Mail fail");
            System.out.println(ex);
        }
    }
}
