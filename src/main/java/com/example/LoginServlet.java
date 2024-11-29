package com.example;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");


        try (Connection conn = DBUtil.getConnection()) {
            String query = "SELECT * FROM user WHERE email = ? AND password = ?";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setString(1, email);
                stmt.setString(2, password);
                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                    int id = rs.getInt("id");
                    String role = rs.getString("role");

                    HttpSession session = request.getSession();
                    session.setMaxInactiveInterval(1000);
                    session.setAttribute("email", email);
                    session.setAttribute("role", role);
                    session.setAttribute("userId", id);


                    if ("admin".equals(role)) {
                        response.sendRedirect("dashboardAdmin");
                    } else {
                        response.sendRedirect("store");
                    }

                } else {

                    request.setAttribute("error", "Invalid username or password");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
                    dispatcher.forward(request, response);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Errore durante la connessione al database");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}