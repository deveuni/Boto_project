package com.boto.mail;

import javax.mail.PasswordAuthentication;

public class SMTPAuthenticator extends javax.mail.Authenticator {
	public PasswordAuthentication getPasswordAuthentication() {
        
        return new PasswordAuthentication("vividdream0215@naver.com", "dmsdl@0615");
    }
}
