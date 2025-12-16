<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Agregar Usuario</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, #f0f2f5, #dfe3e8);
            min-height: 100vh;
        }
        .card {
            border: none;
            border-radius: 1rem;
        }
    </style>
</head>

<body class="d-flex align-items-center justify-content-center">

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6 col-lg-5">

            <div class="card shadow-lg p-4">
                <h3 class="text-center mb-4">
                    <i class="bi bi-person-plus-fill"></i> Agregar Usuario
                </h3>

                <!-- MENSAJES DE EXITO / ERROR -->
                <% if (request.getAttribute("mensaje") != null) { %>
                    <div class="alert alert-success text-center">
                        <%= request.getAttribute("mensaje") %>
                    </div>
                <% } %>

                <% if (request.getAttribute("error") != null) { %>
                    <div class="alert alert-danger text-center">
                        <%= request.getAttribute("error") %>
                    </div>
                <% } %>

                <form action="UsuarioServlet" method="post">
                    <input type="hidden" name="accion" value="agregar">

                    <div class="mb-3">
                        <label class="form-label">Usuario</label>
                        <input type="text" name="usuario" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Contraseña</label>
                        <input type="password" name="contrasena" class="form-control" required>
                    </div>

                    <div class="mb-4">
                        <label class="form-label">Rol</label>
                        <select name="rol" class="form-select" required>
                            <option value="administrador">Administrador</option>
                            <option value="empleado">Empleado</option>
                        </select>
                    </div>

                    <div class="d-grid">
                        <button type="submit" class="btn btn-primary btn-lg">
                            <i class="bi bi-check-circle"></i> Agregar Usuario
                        </button>
                    </div>
                </form>

                <div class="text-center mt-3">
                    <a href="index.jsp" class="text-decoration-none">
                        <i class="bi bi-arrow-left"></i> Volver
                    </a>
                </div>
            </div>

        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
