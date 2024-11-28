<%@ page import="com.example.Product" %>
<%
Product product = (Product) request.getAttribute("product");
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Update product</title>
</head>
<body>
<form action="updateProduct" method="post">
    <input type="hidden" name="id" value="<%= product.getId() %>">
    <label for="name">Name:</label>
    <input type="text" id="name" name="name" value="<%= product.getName() %>" required>
    <br>
    <label for="description">Description: </label>
    <input type="text" id="description" name="description" value="<%= product.getDescription() %>" required>
    <br>
    <label for="price">Price:</label>
    <input type="number" id="price" name="price" value="<%= product.getPrice() %>" required>
    <br>
    <label for="image">Image:</label>
    <input type="text" id="image" name="image" value="<%= product.getImage() %>" required>
    <br>
    <label for="quantity">Quantity:</label>
    <input type="number" id="quantity" name="quantity" value="<%= product.getQuantity() %>" required>
    <br>
    <label for="category">Category:</label>
    <select name="category" id="category">Category
        <option value="1">Electronics</option>
        <option value="2">Clothing</option>
        <option value="3">Books</option>
        <option value="4">Home & Kitchen</option>
    </select>
    <br>
    <button type="submit">Update</button>
</form>
</body>
</html>