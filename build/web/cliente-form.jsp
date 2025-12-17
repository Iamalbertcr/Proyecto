<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="modelo.Cliente" %>

<%
    Cliente c = (Cliente) request.getAttribute("cliente");
    boolean editando = (c != null);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%= editando ? "Editar Cliente" : "Agregar Cliente" %></title>

    <!-- FAVICON -->
    <link rel="icon" type="image/x-icon"
          href="<%= request.getContextPath() %>/img/ferremax-sinfondo.ico">

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

<div class="container mt-5">
    <div class="card shadow-lg border-0 rounded-3">
        <div class="card-header bg-primary text-white text-center">
            <h4 class="m-0">
                <%= editando ? "Editar Cliente" : "Agregar Cliente" %>
            </h4>
        </div>

        <div class="card-body">

            <form action="ClienteServlet" method="post">

                <!-- Acción -->
                <input type="hidden" name="accion"
                       value="<%= editando ? "actualizar" : "agregar" %>">

                <!-- ID solo si edita -->
                <% if (editando) { %>
                    <input type="hidden" name="id" value="<%= c.getId() %>">
                <% } %>

                <!-- Nombre -->
                <div class="mb-3">
                    <label class="form-label fw-bold">Nombre</label>
                    <input type="text" name="nombre" class="form-control"
                           value="<%= editando ? c.getNombre() : "" %>" required>
                </div>

                <!-- Cédula -->
                <div class="mb-3">
                    <label class="form-label fw-bold">Cédula</label>
                    <input type="text" name="cedula" class="form-control"
                           value="<%= editando ? c.getCedula() : "" %>" required>
                </div>

                <!-- Correo -->
                <div class="mb-4">
                    <label class="form-label fw-bold">Correo</label>
                    <input type="email" name="correo" class="form-control"
                           value="<%= editando ? c.getCorreo() : "" %>" required>
                </div>

                <!-- Botones -->
                <div class="d-flex gap-2">
                    <button type="submit" class="btn btn-success">
                        💾 <%= editando ? "Actualizar" : "Guardar" %>
                    </button>

                    <a href="ClienteServlet?accion=listar" class="btn btn-secondary">
                        ❌ Cancelar
                    </a>
                </div>

            </form>

        </div>
    </div>
</div>

</body>
</html>
