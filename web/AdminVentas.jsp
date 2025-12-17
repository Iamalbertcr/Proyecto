<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Venta"%>
<%@page import="modelo.VentaItem"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ReporteVentas</title>
        <!-- FAVICON -->
        <link rel="icon" type="image/x-icon"
              href="<%= request.getContextPath()%>/img/ferremax-sinfondo.ico">
        <link rel="stylesheet" href="ClieProdStyle.css">
    </head>
    <body>
        <h2>Listado de Ventas</h2>
        <a class="volverAlpanel" href="index.jsp"></a> <!-- Este es el volver al panel pero con icono 
                                                                para que salga al principio de la pagina -->

        <br> 



        <table border="1">
            <tr>
                <th>ID</th>
                <th>Cliente</th>
                <th>Fecha</th>
                <th>Total</th>
            </tr>

            <%
                List<Venta> lista = (List<Venta>) request.getAttribute("ventas");

                if (lista != null && !lista.isEmpty()) {
                    for (Venta v : lista) {
            %>
            <tr>
                <td><%= v.getIdVenta()%></td>
                <td><%= v.getCliente()%></td>
                <td><%= v.getFecha()%></td>
                <td>₡ <%= v.getTotal()%></td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="4">No hay ventas registradas</td>
            </tr>
            <%
                }
            %>
        </table>

        <br>
        <a href="index.jsp">⬅ Volver al Panel</a>


    </body>
</html>
