package com.example;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {


    public void addOrder(Order order) throws SQLException, ClassNotFoundException {
        String sql = "INSERT INTO `order` (user_id, product_id, quantity,  order_date, status) VALUES ( ?, ?, ?, ?, ?)";


        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
        ) {
            stmt.setInt(1, order.getUserId());
            stmt.setInt(2, order.getProductId());
            stmt.setDate(4, new Date(order.getOrderDate().getTime()));
            stmt.setString(5, order.getStatus());
            stmt.setInt(3, order.getQuantity());
            stmt.executeUpdate();


        }
    }


    public List<Order> getOrdersByUserId(int userId) throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM `order` WHERE user_id = ?";
        List<Order> orders = new ArrayList<>();

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getInt("id"));
                order.setUserId(rs.getInt("user_id"));
                order.setProductId(rs.getInt("product_id"));
                order.setOrderDate(rs.getDate("order_date"));
                order.setStatus(rs.getString("status"));
                order.setQuantity(rs.getInt("quantity"));
                orders.add(order);
            }
        }
        return orders;
    }

    public List<Order> getAllOrders() throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM `order`";
        List<Order> orders = new ArrayList<>();

        try (Connection conn = DBUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getInt("id"));
                order.setUserId(rs.getInt("user_id"));
                order.setProductId(rs.getInt("product_id"));
                order.setOrderDate(rs.getDate("order_date"));
                order.setStatus(rs.getString("status"));
                order.setQuantity(rs.getInt("quantity"));
                orders.add(order);
            }
        }
        return orders;
    }


}
