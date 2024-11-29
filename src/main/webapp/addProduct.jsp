<!doctype html>
<%@ include file="header.jsp" %>
<body>
<h1>Add Product</h1>
<form action="addProduct" method="post">
    <label for="name">Name: </label>
    <input type="text" id="name" name="name" required>
    <br>
    <label for="description">Description:</label>
    <input type="text" id="description" name="description" required>
    <br>
    <label for="price">Price:</label>
    <input type="number" id="price" name="price" required>
    <br>
    <label for="image">Image:</label>
    <input type="text" id="image" name="image" required>
    <br>
    <label for="quantity">Quantity: </label>
    <input type="number" id="quantity" name="quantity" required>
    <br>
    <label for="category">Category:</label>
    <select name="category" id="category">Category
        <option value="1">Electronics</option>
        <option value="2">Clothing</option>
        <option value="3">Books</option>
        <option value="4">Home & Kitchen</option>
    </select>
    <br>
    <input type="submit" value="Add Product">
</form>
<%@ include file="footer.jsp" %>
</html>