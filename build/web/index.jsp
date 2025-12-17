<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    HttpSession sesion = request.getSession(false);

    if (sesion == null || sesion.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String usuario = (String) sesion.getAttribute("usuario");
    String rol = (String) sesion.getAttribute("rol");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Panel</title>

        <!-- FAVICON -->
        <link rel="icon" type="image/x-icon"
              href="<%= request.getContextPath()%>/img/ferremax-sinfondo.ico">

        <!-- CSS -->
        <link rel="stylesheet"
              href="<%= request.getContextPath()%>/indexStyle.css">
    </head>

    <body>

        <div class="panel">
            <h2>Bienvenido <%= usuario%> (Rol: <%= rol%>)</h2>

            <div class="menu-grid">

                <% if ("administrador".equalsIgnoreCase(rol)) {%>
                <a href="<%= request.getContextPath()%>/productos.jsp">📦 Productos</a>
                <a href="ClienteServlet?accion=listar">👥 Usuarios</a>
                <a href="AgregarUsuario.jsp">➕ Agregar usuario</a>
                <a href="ListarVentasServlet">📊 Reportes Ventas</a>
                <% } %>

                <% if ("empleado".equalsIgnoreCase(rol)) {%>
                <a href="InventarioServlet?accion=listar">📦 Inventario</a>
                <a href="ClienteServlet?accion=listar">👥 Usuarios</a>
                <a href="<%= request.getContextPath()%>/FacturarVenta.jsp">🛒 Ventas</a>
                <% }%>

            </div>

            <a class="logout-btn" href="LogoutServlet">⛔ Cerrar sesión</a>
        </div>

    </body>
</html>
