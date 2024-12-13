package com.usermanagement.util;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        PrintWriter out = res.getWriter();
        String myName = req.getParameter("name");
        String myEmail = req.getParameter("email");
        String myPassword = req.getParameter("password");
        String myGender = req.getParameter("gender");
        String myAddress = req.getParameter("address");
        String dateOfJoin = req.getParameter("joining_date");

        try (Connection con = DBConnection.getConnection()) {
            String query = "INSERT INTO users (name, email, password, gender, address, joining_date) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, myName);
            ps.setString(2, myEmail);
            ps.setString(3, myPassword);
            ps.setString(4, myGender);
            ps.setString(5, myAddress);
            ps.setString(6, dateOfJoin);

            int count = ps.executeUpdate();

            if (count > 0) {
                res.setContentType("text/html");
                out.print("<h3 style='color:green'>User Registered Successfully</h3>");
                RequestDispatcher rd = req.getRequestDispatcher("/register.jsp");
                rd.include(req, res);
            }
        } catch (Exception e) {
            e.printStackTrace();
            res.setContentType("text/html");
            out.print("<h3 style='color:red'>Exception Occurred: " + e.getMessage() + "</h3>");
            RequestDispatcher rd = req.getRequestDispatcher("/register.jsp");
            rd.include(req, res);
        }
    }
}
