package com.example;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

	public void addUser(User user) {
		String sql = "INSERT INTO user (name, email, password, role) VALUES (?,?,?,?)";
		try (Connection conn = DBUtil.getConnection();
		     PreparedStatement stmt = conn.prepareStatement(sql)) {

			stmt.setString(1, user.getName());
			stmt.setString(2, user.getEmail());
			stmt.setString(3, user.getPassword());
			stmt.setString(4, user.getRole());
			stmt.executeUpdate();
		} catch (SQLException | ClassNotFoundException e) {
			throw new RuntimeException(e);
		}
	}

	public List<User> getAllUsers() throws SQLException, ClassNotFoundException {
		List<User> users = new ArrayList<>();
		String sql = "SELECT * FROM user";

		try (Connection conn = DBUtil.getConnection();
		     Statement stmt = conn.createStatement();
		     ResultSet rs = stmt.executeQuery(sql)) {

			while (rs.next()) {
				User user = new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				users.add(user);
			}

		}
		return users;
	}

	public User getUserById(int id) throws SQLException, ClassNotFoundException {
		String sql = "SELECT * FROM user WHERE id=?";
		User user = new User();

		try (Connection conn = DBUtil.getConnection();
		     PreparedStatement stmt = conn.prepareStatement(sql);
		) {
			stmt.setInt(1, id);
			try (ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
					user.setId(rs.getInt("id"));
					user.setName(rs.getString("name"));
					user.setEmail(rs.getString("email"));
				}
			}

		}
		return user;
	}

	public void updateUser(User user) {
		String sql = "UPDATE user SET name = ?, email = ? WHERE id = ?";

		try (
				Connection conn = DBUtil.getConnection();
				PreparedStatement stmt = conn.prepareStatement(sql)
		) {
			stmt.setString(1, user.getName());
			stmt.setString(2, user.getEmail());
			stmt.setInt(3, user.getId());
			stmt.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			throw new RuntimeException(e);
		}

	}

	public void deleteUserById(int id) {
		String sql = "DELETE FROM user WHERE id = ?";

		try (
				Connection conn = DBUtil.getConnection();
				PreparedStatement stmt = conn.prepareStatement(sql)
		) {
			stmt.setInt(1, id);
			stmt.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			throw new RuntimeException(e);
		}

	}


}
