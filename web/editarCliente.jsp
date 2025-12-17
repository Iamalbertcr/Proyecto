<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="modelo.Cliente" %>

<%
    Cliente c = (Cliente) request.getAttribute("cliente");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editar Cliente</title>

    <!-- FAVICON -->
    <link rel="icon" type="image/x-icon"
          href="<%= request.getContextPath() %>/img/ferremax-sinfondo.ico">

    <!-- BOOTSTRAP -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <!-- ICONOS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
          rel="stylesheet">
</head>

<body class="bg-light">

<div class="container mt-5">
    <div class="card shadow-lg border-0 rounded-4">

        <!-- HEADER -->
        <div class="card-header bg-warning text-dark text-center rounded-top-4">
            <h4 class="mb-0">
                <i class="bi bi-pencil-square"></i> Editar Cliente
            </h4>
        </div>

        <!-- BODY -->
        <div class="card-body p-4">

            <!-- VOLVER -->
            <a href="ClienteServlet?accion=listar" class="btn btn-outline-secondary mb-4">
                ⬅ Volver
            </a>

            <form action="ClienteServlet" method="post">

                <!-- ACCIÓN -->
                <input type="hidden" name="accion" value="actualizar">
                <input type="hidden" name="id" value="<%= c.getId() %>">

                <!-- NOMBRE -->
                <div class="mb-3">
                    <label class="form-label fw-semibold">Nombre</label>
                    <input type="text" name="nombre" class="form-control"
                           value="<%= c.getNombre() %>" required>
                </div>

                <!-- CÉDULA -->
                <div class="mb-3">
                    <label class="form-label fw-semibold">Cédula</label>
                    <input type="text" name="cedula" class="form-control"
                           value="<%= c.getCedula() %>" required>
                </div>

                <!-- CORREO -->
                <div class="mb-4">
                    <label class="form-label fw-semibold">Correo</label>
                    <input type="email" name="correo" class="form-control"
                           value="<%= c.getCorreo() %>" required>
                </div>

                <!-- BOTONES -->
                <div class="d-flex gap-3">
                    <button type="submit" class="btn btn-warning">
                        💾 Actualizar
                    </button>

                    <a href="ClienteServlet?accion=listar" class="btn btn-danger">
                        ❌ Cancelar
                    </a>
                </div>

            </form>
        </div>
    </div>
</div>

</body>
</html>
