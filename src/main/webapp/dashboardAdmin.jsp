<!doctype html>
<%@ page import="java.util.List" %>
<%@ page import="com.example.User" %>
<%@ page import="com.example.Product" %>
<% if (session==null || session.getAttribute("role")==null || !"admin".equals(session.getAttribute("role")))
{ response.sendRedirect("login.jsp"); return; } %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Lista Utenti</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
</head>

<body class="container mt-5">

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
<a href="addProduct.jsp">Muori di cacnro</a>
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
</body>

</html>