<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, modelo.Productos" %>
<%
    List<Productos> lista = (List<Productos>) request.getAttribute("lista");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Productos</title>
    <link rel="stylesheet" href="ClieProdStyle.css">
</head>

<body>

<h2>Listado de Productos</h2>

<a class="volverAlpanel" href="panel.jsp"></a>

<br>

<a class="btn btn-add" href="ProductoServlet?accion=nuevo">+ Agregar Producto</a>

<table>
    <tr>
        <th>ID</th>
        <th>Nombre</th>
        <th>Precio</th>
        <th>Cantidad</th>
        <th>Acciones</th>
    </tr>

    <% 
        if (lista != null) {
            for (Productos p : lista) { 
    %>

    <tr>
        <td><%= p.getId() %></td>
        <td><%= p.getNombre() %></td>
        <td>₡<%= p.getPrecio() %></td>
        <td><%= p.getCantidad() %></td>
        <td>
            <a class="btn" href="ProductoServlet?accion=editar&id=<%=p.getId()%>">Editar</a>
            <a class="btn btn-danger" href="ProductoServlet?accion=eliminar&id=<%=p.getId()%>">Eliminar</a>
        </td>
    </tr>

    <% 
            }
        }
    %>

</table>

<br>
<a href="panel.jsp">⬅ Volver al Panel</a>

</body>
</html>
