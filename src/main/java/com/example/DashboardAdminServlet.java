package com.example;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/dashboardAdmin")
public class DashboardAdminServlet extends HttpServlet {
	private UserDAO userDAO = new UserDAO();
	private ProductDao productDao = new ProductDao();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			List<Product> products = productDao.getAllProducts();
			List<User> users = userDAO.getAllUsers();
			request.setAttribute("products", products);
			request.setAttribute("users", users);
		} catch (SQLException | ClassNotFoundException e) {
			throw new RuntimeException(e);
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("dashboardAdmin.jsp");
		dispatcher.forward(request, response);
	}
}

