package com.example;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDao {

	public void addProduct(Product product) throws SQLException, ClassNotFoundException {
		String sql = "INSERT INTO product (name, description, price, image, quantity, category_id) VALUES (?, ?, ?, ?, ?, ?)";

		try (Connection conn = DBUtil.getConnection();
		     PreparedStatement stmt = conn.prepareStatement(sql);
		) {
			stmt.setString(1, product.getName());
			stmt.setString(2, product.getDescription());
			stmt.setDouble(3, product.getPrice());
			stmt.setString(4, product.getImage());
			stmt.setInt(5, product.getQuantity());
			stmt.setInt(6, product.getCategoryId());
			stmt.executeUpdate();
		}
	}

	public List<Product> getAllProducts() {
		String sql = "SELECT * FROM product";
		List<Product> products = new ArrayList<>();
		try (Connection conn = DBUtil.getConnection();
		     Statement stmt = conn.createStatement();
		     ResultSet rs = stmt.executeQuery(sql);
		) {
			while (rs.next()) {
				Product product = new Product();
				product.setId(rs.getInt("id"));
				product.setName(rs.getString("name"));
				product.setDescription(rs.getString("description"));
				product.setPrice(rs.getDouble("price"));
				product.setImage(rs.getString("image"));
				product.setQuantity(rs.getInt("quantity"));
				product.setCategoryId(rs.getInt("category_id"));
				products.add(product);
			}
		} catch (SQLException | ClassNotFoundException e) {
			throw new RuntimeException(e);
		}
		return products;
	}

	public void updateProduct(Product product) {
		String sql = "UPDATE product SET name = ?, description = ?, price = ?, image = ?, quantity = ?, category_id = ? WHERE id = ?";
		try (Connection conn = DBUtil.getConnection();
		     PreparedStatement stmt = conn.prepareStatement(sql);
		) {
			stmt.setString(1, product.getName());
			stmt.setString(2, product.getDescription());
			stmt.setDouble(3, product.getPrice());
			stmt.setString(4, product.getImage());
			stmt.setInt(5, product.getQuantity());
			stmt.setInt(6, product.getCategoryId());
			stmt.setInt(7, product.getId());
			stmt.executeUpdate();
		} catch (SQLException | ClassNotFoundException e) {
			throw new RuntimeException(e);
		}
	}

	public void deleteProduct(int id) {
		String sql = "DELETE FROM product WHERE id = ?";

		try (Connection conn = DBUtil.getConnection();
		     PreparedStatement stmt = conn.prepareStatement(sql);
		) {
			stmt.setInt(1, id);
			stmt.executeUpdate();
		} catch (SQLException | ClassNotFoundException e) {
			throw new RuntimeException(e);
		}
	}

	public Product getProductById(int id) throws SQLException, ClassNotFoundException {
		String sql = "SELECT * FROM product WHERE id=?";

		try (Connection conn = DBUtil.getConnection();
		     PreparedStatement stmt = conn.prepareStatement(sql);
		) {
			stmt.setInt(1, id);
			try (ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
					Product product = new Product();
					product.setId(rs.getInt("id"));
					product.setName(rs.getString("name"));
					product.setDescription(rs.getString("description"));
					product.setPrice(rs.getDouble("price"));
					product.setImage(rs.getString("image"));
					product.setQuantity(rs.getInt("quantity"));
					product.setCategoryId(rs.getInt("category_id"));
					return product;
				}
			}

		}
		return null;
	}
}
