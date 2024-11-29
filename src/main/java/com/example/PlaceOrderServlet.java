package com.example;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

@WebServlet("/placeOrder")
public class PlaceOrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("userId");



        List<Product> cartProducts = (List<Product>) session.getAttribute("cart");

        OrderDAO orderDao = new OrderDAO();
        try {
            for (Product product : cartProducts) {
                Order order = new Order();
                order.setUserId(userId);
                order.setProductId(product.getId());
                order.setOrderDate(new Date());
                order.setStatus("pending");
                order.setQuantity(product.getQuantity());
                orderDao.addOrder(order);
            }
            session.removeAttribute("cart");
            response.sendRedirect("store.jsp");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}









