<!doctype html>
<%@ include file="header.jsp" %>
<body>
<form action="register" method="POST">
    <input type="text" name="name" placeholder="Nome" required>
    <input type="email" name="email" placeholder="Email" required>
    <input type="password" name="password" placeholder="Password" required>
    <button type="submit">Registrati</button>
</form>
<%@ include file="footer.jsp" %>
</html>