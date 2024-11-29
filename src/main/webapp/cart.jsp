<%@ page import="java.util.List" %>
<%@ page import="com.example.Product" %>
<%@ page import="com.example.Order" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.example.OrderDAO" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Cart</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<%@ include file="header.jsp" %>

<div class="container mt-5">
    <h1 class="text-center mb-4">Shopping Cart</h1>
    <%
    List<Product> cart = (List<Product>) session.getAttribute("cart");
    if (cart == null || cart.isEmpty()) {
    %>
    <div class="alert alert-warning" role="alert">
        Your cart is empty.
    </div>
    <%
    } else {
    double totalPrice = 0;
    %>

    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">Product Name</th>
            <th scope="col">Price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Total</th>
            <th scope="col">Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
        for (Product product : cart) {
        double total = product.getPrice() * product.getQuantity();
        totalPrice += total;
        %>
        <tr>
            <td><%= product.getName() %></td>
            <td><%= product.getPrice() %> $</td>
            <td>
                <form action="updateCart" method="get" class="form-inline">
                    <input type="hidden" name="productId" value="<%= product.getId() %>">
                    <input type="number" name="quantity" value="<%= product.getQuantity() %>" min="1" class="form-control mr-2" style="width: 80px;">
                    <button type="submit" class="btn btn-warning">Update</button>
                </form>
            </td>
            <td><%= total %> $</td>
            <td>
                <a href="removeFromCart?productId=<%= product.getId() %>" class="btn btn-danger">Remove</a>
            </td>
        </tr>
        <%
        }
        %>
        </tbody>
    </table>

    <h3 class="text-center mt-4">Total: <%= totalPrice %> $</h3>

    <form action="placeOrder" method="post" class="text-center">
        <input type="hidden" name="totalPrice" value="<%= totalPrice %>">
        <button type="submit" class="btn btn-primary">Place Order</button>
    </form>

    <%
    }
    %>
</div>

<%@ include file="footer.jsp" %>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
