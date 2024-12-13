package com.usermanagement.util;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String email = (String) session.getAttribute("userEmail"); 

        if (email == null) {
            res.sendRedirect("login.jsp"); 
            return;
        }

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = DBConnection.getConnection();

           
            String query = "SELECT * FROM users WHERE email = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, email);

            rs = ps.executeQuery();

            if (rs.next()) {
       
                req.setAttribute("id", rs.getInt("id"));
                req.setAttribute("uname", rs.getString("name"));
                req.setAttribute("uemail", rs.getString("email"));
                req.setAttribute("gender", rs.getString("gender"));
                req.setAttribute("address", rs.getString("address"));
                req.setAttribute("joinDate", rs.getDate("joining_date").toString());
            } else {
                
                req.setAttribute("errorMessage", "User not found. Please check your credentials.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            req.setAttribute("errorMessage", "Database connection error: " + e.getMessage());
        } finally {
          
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

     
        RequestDispatcher rd = req.getRequestDispatcher("profile.jsp");
        rd.forward(req, res);
    }
}
