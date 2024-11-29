<%@ page import="java.util.List" %>
<%@ page import="com.example.User" %>
<%@ page import="com.example.Product" %>

<% List
<Product> CartProducts = (List
    <Product>) session.getAttribute("cart");
        if(cartProducts != null){

        cartProducts=new ArrayList<>();

        }
        %>

        <%@ include file="header.jsp" %>


        <div class="container mt-5">
            <h1 class="text-center mb-4">Order Summary</h1>
            <table class="table table-striped">
                <thead>
                <tr>
                    <th scope="col">Product Name</th>
                    <th scope="col">Price</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Total</th>
                </tr>
                </thead>
                <tbody>
                <%
                double totalPrice=0;
                for (Product product : cartProducts) {
                double total = product.getPrice() * product.getQuantity();
                totalPrice += total;
                %>
                <tr>
                    <td><%= product.getName() %></td>
                    <td><%= product.getPrice() %></td>
                    <td><%= product.getQuantity() %></td>
                    <td><%= total %></td>
                </tr>
                <%
                }
                %>
                </tbody>
            </table>
            <h2 class="text-center mt-4">Total: $ <%= totalPrice %></h2>

            <form action="placeOrder" method="post">
                <input type="hidden" name="totalPrice" value="<%= totalPrice %>">
                <button type="submit" class="btn btn-primary">Place Order</button>
            </form>
        </div>

        <%@ include file="footer.jsp" %>