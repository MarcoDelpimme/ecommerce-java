<!doctype html>
<%@ include file="header.jsp" %>
<body>
<%
    if(session != null && session.getAttribute("username") != null){
        response.sendRedirect("welcome.jsp");
        return;
    }
%>
<form action="login" method="post">
    <h2>Login</h2>
    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required>
    <br>
    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required>
    <br>
    <button type="submit">Accedi</button>
</form>
<%
    String error = (String) request.getAttribute("error");
    if(error != null){
      out.println("<p style='color: red;'>" + error + "</p>");
    }
%>
<%@ include file="footer.jsp" %>
</html>