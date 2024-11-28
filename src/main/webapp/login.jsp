<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login</title>
</head>
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
</body>
</html>