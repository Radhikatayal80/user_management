package com.usermanagement.util;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        PrintWriter out = response.getWriter();

        if (email == null || email.isEmpty() || password == null || password.isEmpty()) {
            out.print("<h3 style='color:red'>Please enter both email and password.</h3>");
            response.setContentType("text/html");
            RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
            rd.include(request, response);
            return;
        }

        System.out.println("Email: " + email);
        System.out.println("Password: " + password);

        try (Connection con = DBConnection.getConnection()) {
           
            String query = "SELECT * FROM users WHERE email = ? AND password = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

          
            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("user_id", rs.getString("id"));
                session.setAttribute("user_name", rs.getString("name"));
                session.setAttribute("userEmail", email);
                session.setAttribute("userPassword", password);
                session.setAttribute("user_gender", rs.getString("gender"));
                session.setAttribute("user_address", rs.getString("address"));
                session.setAttribute("joining_date", rs.getString("joining_date"));

            
                System.out.println("Session Name: " + session.getAttribute("session_name"));
               
                RequestDispatcher rd = request.getRequestDispatcher("/welcome.jsp");
                
              
                rd.forward(request, response);
            } else {
                response.setContentType("text/html");
                out.print("<h3 style='color:red'>Email ID or Password does not match</h3>");
                RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
                rd.include(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html");
            out.print("<h3 style='color:red;'>Error Occurred: " + e.getMessage() + "</h3>");
            RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
            rd.include(request, response);
        }
    }
}
