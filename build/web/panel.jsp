<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Panel Principal</title>
        <link rel="stylesheet" href="ClieProdStyle.css">
    </head>
    <body>

        <h1>Panel Principal</h1>

        <hr>

        <!-- Botón para ir a principal.jsp -->
        <a class="btn" href="<%= request.getContextPath()%>/principal.jsp">
            Ir a Principal
        </a>

        <br><br>

        <!-- Botón existente -->
        <a class="btn" href="<%= request.getContextPath()%>/ClienteServlet?accion=listar">
            Gestión de Clientes
        </a>

        <br><br>

        <!-- Aquí luego puedes agregar más módulos -->
        <!-- Productos, Ventas, Usuarios, etc. -->

    </body>
</html>
