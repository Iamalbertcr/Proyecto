<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Agregar Producto</title>

    <!-- FAVICON -->
    <link rel="icon" type="image/x-icon"
          href="<%= request.getContextPath()%>/img/ferremax-sinfondo.ico">

    <!-- BOOTSTRAP 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <!-- ICONOS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
          rel="stylesheet">

    <!-- ESTILO PERSONALIZADO (AZUL MODERNO) -->
    <style>
        body {
            min-height: 100vh;
            background: linear-gradient(135deg, #0d47a1, #1565c0, #1e88e5);
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .card {
            border: none;
            border-radius: 1.5rem;
        }

        .card-header {
            background: transparent;
            border-bottom: none;
        }

        .form-control:focus {
            border-color: #1e88e5;
            box-shadow: 0 0 0 .2rem rgba(30,136,229,.25);
        }
    </style>
</head>

<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-7 col-lg-5">

            <div class="card shadow-lg p-4">

                <!-- TITULO -->
                <div class="card-header text-center mb-3">
                    <h3 class="fw-bold text-primary">
                        <i class="bi bi-box-seam"></i> Agregar Producto
                    </h3>
                </div>

                <!-- FORMULARIO -->
                <form action="ProductoServlet" method="post">

                    <!-- ACCIÓN -->
                    <input type="hidden" name="accion" value="agregar">

                    <div class="mb-3">
                        <label class="form-label fw-semibold">Código</label>
                        <input type="text" name="codigo" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-semibold">Nombre</label>
                        <input type="text" name="nombre" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-semibold">Precio (₡)</label>
                        <input type="number" step="0.01" name="precio"
                               class="form-control" required>
                    </div>

                    <div class="mb-4">
                        <label class="form-label fw-semibold">Cantidad</label>
                        <input type="number" name="cantidad" min="0"
                               class="form-control" required>
                    </div>

                    <!-- BOTONES -->
                    <div class="d-grid gap-2">
                        <button type="submit" class="btn btn-primary btn-lg">
                            <i class="bi bi-check-circle"></i> Guardar Producto
                        </button>

                        <a href="ProductoServlet?accion=listar"
                           class="btn btn-outline-danger">
                            <i class="bi bi-arrow-left-circle"></i> Cancelar
                        </a>
                    </div>

                </form>

            </div>

        </div>
    </div>
</div>

<!-- BOOTSTRAP JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
