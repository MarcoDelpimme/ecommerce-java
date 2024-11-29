<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Store</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous">

</head>

<body class="container-fluid p-0 m-0"><nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">My Website</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="store">Products</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">About</a>
                </li>

            </ul>

            <ul class="navbar-nav ms-auto ">
                <%
                String loggedUser = (String)session.getAttribute("email");
                String role= (String)session.getAttribute("role");
                String adminLogged = (String)session.getAttribute("adminLogged");
                if(loggedUser != null ){
                %>

                <li class="nav-item">
                <span class="nav-link">
                    Welcome , <%= loggedUser %>
                </span>
                    <%
                    if("admin".equals(role)){
                    %>
                <li class="nav-item">
                    <a class="nav-link" href="dashboardAdmin">Dashboard admin</a>
                </li>
                <%
                } else {
                %>
                <li class="nav-item">
                    <a class="nav-link" href="dashboard">Dashboard</a>
                </li>
                <%
                }
                %>
                <li class="nav-item">
                    <a class="nav-link" href="logout">Logout</a>
                </li>
                <%
                }else{
                %>
                <li class="nav-item">
                    <a class="nav-link" href="login.jsp">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="register.jsp">Register</a>
                </li>
                <%
                }
                %>
            </ul>
        </div>
    </div>
</nav>