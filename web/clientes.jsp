<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, modelo.Cliente" %>
<%
    List<Cliente> lista = (List<Cliente>) request.getAttribute("lista");
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Clientes</title>
        <!-- Carga del CSS -->
        <link rel="stylesheet" href="<%= request.getContextPath()%>/indexStyle.css">
    </head>
    <body>

        <h2>Listado de Clientes</h2>

        <a class="volverAlpanel" href="<%= request.getContextPath()%>/index.jsp"></a>

        <br>

        <a class="btn btn-add" href="ClienteServlet?accion=nuevo">+ Agregar Cliente</a>


        <table>
            <tr>
                <th>ID</th><th>Nombre</th><th>Cédula</th><th>Correo</th><th>Acciones</th>
            </tr>

            <% if (lista != null) {
            for (Cliente c : lista) {%>

            <tr>
                <td><%= c.getId()%></td>
                <td><%= c.getNombre()%></td>
                <td><%= c.getCedula()%></td>
                <td><%= c.getCorreo()%></td>
                <td>
                    <a class="btn" href="ClienteServlet?accion=editar&id=<%=c.getId()%>">Editar</a>
                    <a class="btn btn-danger" href="ClienteServlet?accion=eliminar&id=<%=c.getId()%>">Eliminar</a>
                </td>
            </tr>

            <% }
        }%>

        </table>

        <br>

    </body>
</html>
