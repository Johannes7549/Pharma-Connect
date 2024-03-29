package com.customer;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Random;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;
import org.mindrot.jbcrypt.BCrypt; // Import BCrypt from the JAR

@WebServlet("/CustomerLogin")
public class CustomerLogin extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String uname = request.getParameter("uname");
            String pass = request.getParameter("upass");
      
            String vercode = request.getParameter("vercode");
            String captchaDB = null;
            HttpSession hs = request.getSession();
            String tokens = UUID.randomUUID().toString();
            Random random = new Random();
            int newRandomCaptcha = random.nextInt(9000) + 10000;
            Connection con = DatabaseConnection.getConnection();
            Statement st = con.createStatement();
            ResultSet captchResultSet = DatabaseConnection.getResultFromSqlQuery("select * from tblcaptcha");
            if (captchResultSet.next()) {
                captchaDB = captchResultSet.getString(1);
            }
            if (captchaDB.equals(vercode)) {
                ResultSet resultset = st.executeQuery("select * from tblcustomer where uname='" + uname + "'");
                if (resultset.next()) {
                    String hashedPasswordDB = resultset.getString("upass");


                    // Verify the entered password using BCrypt
                    if (BCrypt.checkpw(pass, hashedPasswordDB)) {
                        hs.setAttribute("customerId", resultset.getInt("id"));
                        hs.setAttribute("uname", resultset.getString("uname"));
                        hs.setAttribute("role", "Customer");
                        hs.setAttribute("email", resultset.getString("email_id"));
                        hs.setAttribute("customer-name", resultset.getString("full_name"));
                        int update = DatabaseConnection.insertUpdateFromSqlQuery("update tblcaptcha set captcha='" + newRandomCaptcha + "'");
                        response.sendRedirect("index.jsp");
                    } else {
                        String message = "You have entered wrong credentials";
                        hs.setAttribute("credential", message);
                        response.sendRedirect("customer-login.jsp");
                        int update = DatabaseConnection.insertUpdateFromSqlQuery("update tblcaptcha set captcha='" + newRandomCaptcha + "'");
                    }
                } else {
                    String message = "You have entered wrong credentials";
                    hs.setAttribute("credential", message);
                    response.sendRedirect("customer-login.jsp");
                    int update = DatabaseConnection.insertUpdateFromSqlQuery("update tblcaptcha set captcha='" + newRandomCaptcha + "'");
                }
            } else {
                String message = "You have entered invalid verification code";
                hs.setAttribute("verificationCode", message);
                response.sendRedirect("customer-login.jsp");
                int update = DatabaseConnection.insertUpdateFromSqlQuery("update tblcaptcha set captcha='" + newRandomCaptcha + "'");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
