<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="modelo.Productos" %>

<%
    Productos p = (Productos) request.getAttribute("producto");
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Producto</title>
    </head>
    <body>

        <h2><%= (p == null) ? "Agregar Producto" : "Editar Producto"%></h2>

        <form action="ProductoServlet" method="post">

            <input type="hidden" name="id" value="<%= (p != null) ? p.getId() : ""%>">

            Nombre:
            <input type="text" name="nombre" required
                   value="<%= (p != null) ? p.getNombre() : ""%>"><br><br>

            Precio:
            <input type="number" step="0.01" name="precio" required
                   value="<%= (p != null) ? p.getPrecio() : ""%>"><br><br>

            Cantidad:
            <input type="number" name="cantidad" required
                   value="<%= (p != null) ? p.getCantidad() : ""%>"><br><br>

            <button type="submit">Guardar</button>
            <a href="InventarioServlet">Cancelar</a>

        </form>

    </body>
</html>
