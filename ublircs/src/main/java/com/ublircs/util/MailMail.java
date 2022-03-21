package com.ublircs.util;

import org.springframework.core.io.ByteArrayResource;
import org.springframework.mail.MailParseException;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

/**
 * Created by Administrator on 3/24/2017.
 */
public class MailMail {

    private JavaMailSender javaMailSender;
    private MailSender mailSender;

    public void setMailSender(JavaMailSender javaMailSender) {
        this.javaMailSender = javaMailSender;
    }

    public void sendMail(String from, String to, String subject, String msg,String fileName, byte[] content) {

        String[] ccEmails = {"sidra.nasir@ublinsurers.com","m.mughal@ublinsurers.com"};

        MimeMessage mailMessage = javaMailSender.createMimeMessage();

        try {
            MimeMessageHelper helper = new MimeMessageHelper(mailMessage, true);

            helper.setFrom(from);
            helper.setTo(to);
            helper.setCc(ccEmails);
            helper.setSubject(subject);
            helper.setText(msg);
            helper.addAttachment(fileName, new ByteArrayResource(content));

        } catch (MessagingException e) {
            throw new MailParseException(e);
        }

        javaMailSender.send(mailMessage);
    }

    public void sendMailToRI(String from, String to, String subject, String msg) {

        String[] ccEmails = {"sidra.nasir@ublinsurers.com","m.mughal@ublinsurers.com"/*,"usman.siddiq@ublinsurers.com"*/};

        MimeMessage mailMessage = javaMailSender.createMimeMessage();

        try {
            MimeMessageHelper helper = new MimeMessageHelper(mailMessage, true);

            helper.setFrom(from);
            helper.setTo(to);
            helper.setCc(ccEmails);
            helper.setSubject(subject);
            helper.setText(msg);


        } catch (MessagingException e) {
            throw new MailParseException(e);
        }



        javaMailSender.send(mailMessage);
    }

    public void sendMailScheduler(String from, String to, String subject, String msg) {

        String[] ccEmails = {"sidra.nasir@ublinsurers.com","m.mughal@ublinsurers.com"/*,"usman.siddiq@ublinsurers.com","haider.anjum@ublinsurers.com"*/};

        MimeMessage mailMessage = javaMailSender.createMimeMessage();

        try {
            MimeMessageHelper helper = new MimeMessageHelper(mailMessage, true);

            helper.setFrom(from);
            helper.setTo(to);
            helper.setCc(ccEmails);
            helper.setSubject(subject);
            helper.setText(msg);

        } catch (MessagingException e) {
            throw new MailParseException(e);
        }

        javaMailSender.send(mailMessage);
    }

    public void sendMailScheduler2(String from, String to, String subject, String msg) {

        String[] ccEmails = {"sidra.nasir@ublinsurers.com","m.mughal@ublinsurers.com"/*,"usman.siddiq@ublinsurers.com","haider.anjum@ublinsurers.com"*/};

        MimeMessage mailMessage = javaMailSender.createMimeMessage();

        try {
            MimeMessageHelper helper = new MimeMessageHelper(mailMessage, true);

            helper.setFrom(from);
            helper.setTo(to);
            helper.setCc(ccEmails);
            helper.setSubject(subject);
            helper.setText(msg);

        } catch (MessagingException e) {
            throw new MailParseException(e);
        }

        javaMailSender.send(mailMessage);
    }

    public void sendMailBranch(String from, String to, String subject, String msg,String fileName, byte[] content) {

        String[] ccEmails = {"mathew.joel@ublinsurers.com","shaikh.qadir@ublinsurers.com","nadeem.ansar@ublinsurers.com","naresh.kumar@ublinsurers.com","mohammad.r@ublinsurers.com","zeeshan.shad@ublinsurers.com","kumar.rahul@ublinsurers.com"};

        MimeMessage mailMessage = javaMailSender.createMimeMessage();

        try {
            MimeMessageHelper helper = new MimeMessageHelper(mailMessage, true);

            helper.setFrom(from);
            helper.setTo(to);
            helper.setCc(ccEmails);
            helper.setSubject(subject);
            helper.setText(msg);
            helper.addAttachment(fileName, new ByteArrayResource(content));

        } catch (MessagingException e) {
            throw new MailParseException(e);
        }

        javaMailSender.send(mailMessage);
    }

}
