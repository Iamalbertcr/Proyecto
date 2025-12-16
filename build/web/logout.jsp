<%@ page session="true"%>
<%
    String usuario = (String) session.getAttribute("usuario");
    if (usuario == null) {
        response.sendRedirect("login.html");
    }
%>

<h1>Bienvenido a Ferremax</h1>
<p>Usuario conectado: <%= usuario %></p>

<a href="logout.html">Cerrar sesión</a>
