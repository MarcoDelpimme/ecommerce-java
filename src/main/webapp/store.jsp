<%@ page import="java.util.*" %>
<%@ page import="com.example.Product" %>
<!doctype html>
<%@ include file="header.jsp" %>


<div class="container mt-4">
    <h1 class="text-center mb-4">List of Products</h1>
    <div class="row">
        <%
        List
        <Product> products = (List
            <Product>) request.getAttribute("products");
                if (products != null) {
                for (Product product : products) {
                %>
                <div class="col-md-4 mb-4">
                    <div class="card h-100">
                        <img src="<%= product.getImage() %>" class="card-img-top" alt="Product Image"
                             style="height: 200px; object-fit: cover;">
                        <div class="card-body">
                            <h5 class="card-title"><%= product.getName() %></h5>
                            <!-- mette join con getname dela categoria    -->
                            <p class="card-text"><%= product.getCategoryId() %></p>

                        </div>
                        <div class="card-footer d-flex justify-content-between">
                            <p class="card-text fw-bold">$<%= product.getPrice() %></p>
                            <a href="productDetails?id=<%= product.getId() %>" class="btn btn-secondary">View Details</a>
                        </div>
                    </div>
                </div>
                <%
                }
                } else {
                %>
                <p class="text-center">No products available.</p>
                <% } %>
    </div>
</div>
<%@ include file="footer.jsp" %>
</html>
