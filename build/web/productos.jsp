<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, modelo.Productos" %>

<%
    List<Productos> lista = (List<Productos>) request.getAttribute("lista");
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Productos</title>

    </head>

    <body>

        <h2>Listado de Productos</h2>

        <a class="volverAlpanel" href="<%= request.getContextPath()%>/index.jsp"></a>
        <br><br>

        <!-- ✅ ÚNICO BOTÓN AGREGAR -->
        <a class="btn btn-add" href="ProductoServlet?accion=nuevo">
            + Agregar Producto
        </a>

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
                <td><%= p.getId()%></td>
                <td><%= p.getNombre()%></td>
                <td>₡<%= p.getPrecio()%></td>
                <td><%= p.getCantidad()%></td>
                <td>
                    <a class="btn"
                       href="ProductoServlet?accion=editar&id=<%=p.getId()%>">
                        Editar
                    </a>

                    <a class="btn btn-danger"
                       href="ProductoServlet?accion=eliminar&id=<%=p.getId()%>"
                       onclick="return confirm('¿Desea eliminar este producto?');">
                        Eliminar
                    </a>
                </td>
            </tr>
            <%
                    }
                }
            %>

        </table>

    </body>
</html>
