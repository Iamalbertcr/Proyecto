<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="modelo.Productos" %>

<%
    Productos p = (Productos) request.getAttribute("producto");
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Editar Producto</title>
        <link rel="stylesheet" href="ClieProdStyle.css">
    </head>

    <body>

        <h2>Editar Producto</h2>

        <form action="ProductoServlet" method="post">

            <input type="hidden" name="accion" value="actualizar">
            <input type="hidden" name="id" value="<%= p.getId()%>">

            <label>Código:</label><br>
            <input type="text" name="codigo" value="<%= p.getCodigo()%>" required><br><br>

            <label>Nombre:</label><br>
            <input type="text" name="nombre" value="<%= p.getNombre()%>" required><br><br>

            <label>Precio:</label><br>
            <input type="number" step="0.01" name="precio" value="<%= p.getPrecio()%>" required><br><br>

            <label>Cantidad:</label><br>
            <input type="number" name="cantidad" value="<%= p.getCantidad()%>" required><br><br>

            <button type="submit" class="btn">Actualizar</button>
            <a href="ProductoServlet?accion=listar" class="btn btn-danger">Cancelar</a>

        </form>

    </body>
</html>
