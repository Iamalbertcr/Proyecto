<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Agregar Producto</title>
        <link rel="stylesheet" href="ClieProdStyle.css">
    </head>

    <body>

        <h2>Agregar Producto</h2>

        <!-- 🔙 Volver al listado -->
        <a class="volverAlpanel" href="ProductoServlet?accion=listar">⬅ Volver</a>

        <br><br>

        <form action="ProductoServlet" method="post">

            <!-- ACCIÓN -->
            <input type="hidden" name="accion" value="agregar">

            <label>Código:</label><br>
            <input type="text" name="codigo" required><br><br>

            <label>Nombre:</label><br>
            <input type="text" name="nombre" required><br><br>

            <label>Precio:</label><br>
            <input type="number" name="precio" step="0.01" required><br><br>

            <label>Cantidad:</label><br>
            <input type="number" name="cantidad" min="0" required><br><br>

            <button type="submit" class="btn btn-add">Guardar</button>
            <a href="ProductoServlet?accion=listar" class="btn btn-danger">Cancelar</a>

        </form>

    </body>
</html>
