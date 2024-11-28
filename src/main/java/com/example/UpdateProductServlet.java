package com.example;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/updateProduct")
public class UpdateProductServlet extends HttpServlet {
	ProductDao productDao = new ProductDao();



	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String description = request.getParameter("description");
		double price = Double.parseDouble(request.getParameter("price"));
		String image = request.getParameter("image");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		int categoryId = Integer.parseInt(request.getParameter("category"));

		Product product = new Product();
		product.setId(Integer.parseInt(id));
		product.setName(name);
		product.setDescription(description);
		product.setPrice(price);
		product.setImage(image);
		product.setQuantity(quantity);
		product.setCategoryId(categoryId);

		ProductDao productDao = new ProductDao();
		productDao.updateProduct(product);
		response.sendRedirect("dashboardAdmin");
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Product product = productDao.getProductById(Integer.parseInt(request.getParameter("id")));
			if (product != null) {
				request.setAttribute("product", product);
				request.getRequestDispatcher("updateProduct.jsp").forward(request, response);
			}
		} catch (SQLException | ClassNotFoundException e) {
			throw new RuntimeException(e);
		}
	}
}
