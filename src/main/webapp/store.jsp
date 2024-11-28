<%@ page import="java.util.*" %>
<%@ page import="com.example.Product" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Store</title>
</head>

<body>
    <a href="addProduct.jsp"></a>
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
        List<Product> products = (List<Product>) request.getAttribute("products");
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