<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Venta"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Reporte de Ventas</title>

    <!-- FAVICON -->
    <link rel="icon" type="image/x-icon"
          href="<%= request.getContextPath()%>/img/ferremax-sinfondo.ico">

    <!-- BOOTSTRAP 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
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
            overflow-x: hidden;
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

        /* Tarjeta principal */
        .glass-card {
            background: rgba(255,255,255,0.12);
            backdrop-filter: blur(18px);
            -webkit-backdrop-filter: blur(18px);
            border-radius: 22px;
            box-shadow: 0 25px 60px rgba(0,0,0,0.45);
            padding: 30px;
            color: white;
            position: relative;
            z-index: 1;
        }

        /* Tabla */
        .table {
            color: white;
        }

        .table thead {
            background: rgba(255,255,255,0.18);
        }

        .table-hover tbody tr:hover {
            background: rgba(255,255,255,0.15);
        }

        /* Botón volver */
        .btn-volver {
            border: 1px solid rgba(255,255,255,0.5);
            color: white;
        }

        .btn-volver:hover {
            background: rgba(255,255,255,0.25);
            color: white;
        }
    </style>
</head>

<body>

<div class="container py-5">

    <!-- CONTENEDOR -->
    <div class="glass-card">

        <!-- ENCABEZADO -->
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2 class="fw-bold mb-0">Reporte de Ventas</h2>

            <a href="index.jsp" class="btn btn-volver">
                ⬅ Volver al Panel
            </a>
        </div>

        <!-- TABLA -->
        <div class="table-responsive">
            <table class="table table-hover align-middle text-center mb-0">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Cliente</th>
                        <th>Fecha</th>
                        <th>Total</th>
                    </tr>
                </thead>

                <tbody>
                    <%
                        List<Venta> lista = (List<Venta>) request.getAttribute("ventas");

                        if (lista != null && !lista.isEmpty()) {
                            for (Venta v : lista) {
                    %>
                    <tr>
                        <td><%= v.getIdVenta() %></td>
                        <td><%= v.getCliente() %></td>
                        <td><%= v.getFecha() %></td>
                        <td>₡ <%= v.getTotal() %></td>
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
                </tbody>
            </table>
        </div>

    </div>

</div>

<!-- BOOTSTRAP JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
