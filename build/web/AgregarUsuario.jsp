<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Agregar Usuario</title>

    <!-- FAVICON -->
    <link rel="icon" type="image/x-icon"
          href="<%= request.getContextPath()%>/img/ferremax-sinfondo.ico">

    <!-- BOOTSTRAP 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <!-- BOOTSTRAP ICONS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
          rel="stylesheet">

    <!-- ESTILOS PERSONALIZADOS -->
    <style>
        body {
            min-height: 100vh;
            margin: 0;
            background: linear-gradient(135deg,
                #0b2fa3 0%,
                #123fd1 35%,
                #091f63 70%,
                #050f3a 100%);
            overflow: hidden;
            font-family: 'Segoe UI', sans-serif;
        }

        /* Líneas diagonales */
        body::before {
            content: "";
            position: fixed;
            inset: 0;
            background: repeating-linear-gradient(
                135deg,
                rgba(255,255,255,0.06),
                rgba(255,255,255,0.06) 1px,
                transparent 1px,
                transparent 40px
            );
            pointer-events: none;
            z-index: 0;
        }

        /* Tarjeta tipo vidrio */
        .glass-card {
            background: rgba(255,255,255,0.12);
            backdrop-filter: blur(18px);
            -webkit-backdrop-filter: blur(18px);
            border-radius: 22px;
            box-shadow: 0 25px 60px rgba(0,0,0,0.45);
            padding: 35px;
            color: white;
            position: relative;
            z-index: 1;
        }

        /* Inputs */
        .form-control,
        .form-select {
            background: rgba(255,255,255,0.15);
            border: 1px solid rgba(255,255,255,0.35);
            color: white;
        }

        .form-control::placeholder {
            color: rgba(255,255,255,0.7);
        }

        .form-control:focus,
        .form-select:focus {
            background: rgba(255,255,255,0.25);
            border-color: #fff;
            color: white;
            box-shadow: none;
        }

        /* Labels */
        .form-label {
            color: rgba(255,255,255,0.85);
            font-weight: 500;
        }

        /* Botón principal */
        .btn-custom {
            background: rgba(255,255,255,0.2);
            border: 1px solid rgba(255,255,255,0.4);
            color: white;
            font-weight: 600;
            border-radius: 16px;
        }

        .btn-custom:hover {
            background: rgba(255,255,255,0.35);
            color: white;
        }

        /* Enlaces */
        a {
            color: rgba(255,255,255,0.85);
        }

        a:hover {
            color: white;
        }

        /* Alertas */
        .alert {
            border-radius: 14px;
        }
    </style>
</head>

<body class="d-flex align-items-center justify-content-center">

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6 col-lg-5">

            <!-- TARJETA -->
            <div class="glass-card">

                <h3 class="text-center mb-4 fw-bold">
                    <i class="bi bi-person-plus-fill"></i> Agregar Usuario
                </h3>

                <!-- MENSAJES -->
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

                <!-- FORMULARIO -->
                <form action="UsuarioServlet" method="post">
                    <input type="hidden" name="accion" value="agregar">

                    <div class="mb-3">
                        <label class="form-label">Usuario</label>
                        <input type="text" name="usuario"
                               class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Contraseña</label>
                        <input type="password" name="contrasena"
                               class="form-control" required>
                    </div>

                    <div class="mb-4">
                        <label class="form-label">Rol</label>
                        <select name="rol" class="form-select" required>
                            <option value="administrador">Administrador</option>
                            <option value="empleado">Empleado</option>
                        </select>
                    </div>

                    <div class="d-grid">
                        <button type="submit" class="btn btn-custom btn-lg">
                            <i class="bi bi-check-circle"></i> Agregar Usuario
                        </button>
                    </div>
                </form>

                <!-- VOLVER -->
                <div class="text-center mt-4">
                    <a href="index.jsp" class="text-decoration-none">
                        <i class="bi bi-arrow-left"></i> Volver al panel
                    </a>
                </div>

            </div>

        </div>
    </div>
</div>

<!-- BOOTSTRAP JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
