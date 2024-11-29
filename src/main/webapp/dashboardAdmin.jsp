<!doctype html>
<%@ page import="java.util.List" %>
<%@ page import="com.example.User" %>
<%@ page import="com.example.Product" %>
<%@ page import="com.example.Order" %>
<%@ page import="com.example.OrderDAO" %>

<%

if (session==null || session.getAttribute("role")==null || !"admin".equals(session.getAttribute("role")))
{ response.sendRedirect("login.jsp");
return;
}

%>


<%@ include file="header.jsp" %>


<% OrderDAO orderDao = new OrderDAO();
List
<Order> orders = orderDao.getAllOrders();
    %>

    <h1 class="mb-4 text-center">Lista Utenti</h1>
    <table class="table table-bordered table-striped">
        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Email</th>
            <th>Azioni</th>
        </tr>
        </thead>
        <tbody>
        <% List
        <User> users = (List
            <User>) request.getAttribute("users");
                if (users != null && !users.isEmpty()) {
                for (User user : users) {
                %>
                <tr>
                    <td>
                        <%= user.getId() %>
                    </td>
                    <td>
                        <%= user.getName() %>
                    </td>
                    <td>
                        <%= user.getEmail() %>
                    </td>
                    <td>
                        <a href="updateUser?id=<%= user.getId() %>"
                           class="btn btn-warning btn-sm">Update</a>
                        <a href="delete?id=<%= user.getId() %>"
                           class="btn btn-danger btn-sm">Delete</a>
                    </td>
                </tr>
                <% } } else { %>
                <tr>
                    <td colspan="4" class="text-center">No users found.</td>
                </tr>
                <% } %>
        </tbody>
    </table>
    <a href="addProduct.jsp">Add Product</a>
    <h1>List of Product: </h1>
    <table>
        <tr>
            <th>
                ID
            </th>
            <th>
                Name
            </th>
            <th>
                description
            </th>
            <th>
                price
            </th>
            <th>
                image
            </th>
            <th>
                quantity
            </th>
            <th>
                category
            </th>
        </tr>
        <%
        List
        <Product> products = (List
            <Product>) request.getAttribute("products");
                if(products != null) {
                for(Product product : products) { %>
                <tr>
                    <td><%= product.getId() %></td>
                    <td><%= product.getName() %></td>
                    <td><%= product.getDescription() %></td>
                    <td><%= product.getPrice() %></td>
                    <td><%= product.getImage() %></td>
                    <td><%= product.getQuantity() %></td>
                    <td><%= product.getCategoryId() %></td>
                    <td>
                        <a href="updateProduct?id=<%= product.getId() %>"
                           class="btn btn-warning btn-sm">Update</a>
                        <a href="deleteProduct?id=<%=product.getId()%>"
                           class="btn btn-danger btn-sm">Delete</a>
                    </td>
                </tr>
                <% }
                } else { %>
                <tr>
                    <td>No product</td>
                </tr>
                <% } %>
    </table>

    <div class="container mt-5">
        <h2>Order Summary</h2>
        <table class="table table-striped">
            <thead>
            <tr>
                <th>Order ID</th>
                <th>User ID</th>
                <th>Product ID</th>
                <th>Status</th>
                <th>Order Date</th>
                <th>Quantity</th>

            </tr>
            </thead>
            <tbody>
            <% for (Order order : orders) { %>
            <tr>
                <td><%= order.getId() %></td>
                <td><%= order.getUserId() %></td>
                <td><%= order.getProductId() %></td>
                <td><%= order.getStatus() %></td>
                <td><%= order.getOrderDate() %></td>
                <td><%= order.getQuantity() %></td>

            </tr>
            <% } %>
            </tbody>
        </table>


    </div>
    <%@ include file="footer.jsp" %>

    </html>