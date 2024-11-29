<%@ page import="com.example.Product" %>
<% Product product = (Product) request.getAttribute("product"); %>

<!doctype html>
<%@ include file="header.jsp" %>


<%if(product !=null ){%>
<div class="container">
    <div class="row my-5 border border-secondary p-5">
        <div class="col-4">
            <img src="<%= product.getImage() %>" class="card-img-top" alt="Product Image"
                 style="height: 200px; object-fit: cover;">
        </div>
        <div class="col-8 ">
            <h1><%= product.getName() %></h1>
            <p><%= product.getDescription() %></p>
            <p class="fw-bold"><%= product.getPrice() %> $ </p>
            <a href=" addToCart?id=<%= product.getId() %>&quantity=<%= product.getQuantity() %>" class="btn btn-success">Add to cart</a>

        </div>
    </div>
    <a href="store" class="btn btn-primary"><-- Back to the store</a>
</div>
<% }else { %>
<div class="alert alert-danger" role="alert">Product not found

    <% } %>

    <%@ include file="footer.jsp" %>