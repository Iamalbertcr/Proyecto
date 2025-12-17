<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, modelo.Cliente" %>
<%
    List<Cliente> lista = (List<Cliente>) request.getAttribute("lista");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Clientes</title>

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

        /* Contenedor tipo vidrio */
        .glass-card {
            background: rgba(255,255,255,0.12);
            backdrop-filter: blur(18px);
            -webkit-backdrop-filter: blur(18px);
            border-radius: 22px;
            box-shadow: 0 25px 60px rgba(0,0,0,0.4);
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

        /* Botones */
        .btn-custom {
            background: rgba(255,255,255,0.16);
            border: 1px solid rgba(255,255,255,0.25);
            color: white;
        }

        .btn-custom:hover {
            background: rgba(255,255,255,0.28);
            color: white;
        }

        .btn-outline-light {
            border-color: rgba(255,255,255,0.5);
        }
    </style>
</head>

<body>

<div class="container py-5">

    <!-- PANEL PRINCIPAL -->
    <div class="glass-card">

        <!-- ENCABEZADO -->
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2 class="fw-bold mb-0">Listado de Clientes</h2>

            <a href="<%= request.getContextPath()%>/index.jsp"
               class="btn btn-outline-light">
                ⬅ Volver al Panel
            </a>
        </div>

        <!-- BOTÓN AGREGAR -->
        <div class="mb-3">
            <a href="ClienteServlet?accion=nuevo"
               class="btn btn-custom">
                + Agregar Cliente
            </a>
        </div>

        <!-- TABLA -->
        <div class="table-responsive">
            <table class="table table-hover align-middle text-center mb-0">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Cédula</th>
                    <th>Correo</th>
                    <th>Acciones</th>
                </tr>
                </thead>

                <tbody>
                <% if (lista != null) {
                    for (Cliente c : lista) { %>
                    <tr>
                        <td><%= c.getId() %></td>
                        <td><%= c.getNombre() %></td>
                        <td><%= c.getCedula() %></td>
                        <td><%= c.getCorreo() %></td>
                        <td>
                            <a href="ClienteServlet?accion=editar&id=<%=c.getId()%>"
                               class="btn btn-sm btn-warning me-1">
                                ✏ Editar
                            </a>
                            <a href="ClienteServlet?accion=eliminar&id=<%=c.getId()%>"
                               class="btn btn-sm btn-danger"
                               onclick="return confirm('¿Desea eliminar este cliente?');">
                                🗑 Eliminar
                            </a>
                        </td>
                    </tr>
                <%  }
                } %>
                </tbody>
            </table>
        </div>

    </div>

</div>

<!-- BOOTSTRAP JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
