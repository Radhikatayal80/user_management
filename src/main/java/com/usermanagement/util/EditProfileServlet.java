package com.usermanagement.util;

import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet("/editProfile")
public class EditProfileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session =req.getSession();
        String userId = session.getAttribute("user_id").toString();
        
        String myName = req.getParameter("name");
        String myGender = req.getParameter("gender");
        String myAddress = req.getParameter("address");
        String joiningDate = req.getParameter("joining_date");

       

        try (Connection con = DBConnection.getConnection()) {
        	  String updateQuery = "UPDATE users SET name = ?,  gender = ?, address = ?, joining_date = ? WHERE id = ?";
              PreparedStatement updatePs = con.prepareStatement(updateQuery);
              updatePs.setString(1, myName);
              updatePs.setString(2, myGender);
              updatePs.setString(3, myAddress);
              updatePs.setString(4, joiningDate);
              updatePs.setString(5, userId);

           
            int count = updatePs.executeUpdate();
            
            
            PreparedStatement updatePs1 = con.prepareStatement("select * from users where id=?");
            updatePs1.setString(1, userId);
            ResultSet rs=updatePs1.executeQuery();
            

            if (rs.next() && count>0) {
            	  req.setAttribute("id", rs.getInt("id"));
                  req.setAttribute("uname", rs.getString("name"));
                  
                  req.setAttribute("gender", rs.getString("gender"));
                  req.setAttribute("address", rs.getString("address"));
                  req.setAttribute("joinDate", rs.getDate("joining_date").toString());
               
            } else {
                req.setAttribute("errorMessage", "User not found. Please check your credentials.");
                RequestDispatcher rd = req.getRequestDispatcher("editProfile.jsp");
                rd.forward(req, res);
            }
            rs.close();
            updatePs.close();
            updatePs1.close();
            con.close();
            
        } catch (SQLException e) {
            e.printStackTrace();
            req.setAttribute("errorMessage", "Database connection error: " + e.getMessage());
            RequestDispatcher rd = req.getRequestDispatcher("editProfile.jsp");
            rd.forward(req, res);
        
        }

        RequestDispatcher rd = req.getRequestDispatcher("profile.jsp");
        rd.forward(req, res);
    }
}

