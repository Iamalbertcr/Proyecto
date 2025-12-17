<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="modelo.Cliente" %>

<%
    Cliente c = (Cliente) request.getAttribute("cliente");
    boolean editar = (c != null);
%>

<!DOCTYPE html>
<html>
    <head>
        <title><%= editar ? "Editar Cliente" : "Nuevo Cliente"%></title>

        <!-- CSS correctamente enlazado -->
        <link rel="stylesheet" href="<%= request.getContextPath()%>/ClieProdStyle.css">
    </head>
    <body>

        <div class="form-container">

            <h2><%= editar ? "Editar Cliente" : "Agregar Cliente"%></h2>

            <form action="ClienteServlet" method="post">

                <input type="hidden" name="accion" value="<%= editar ? "actualizar" : "agregar"%>">

                <% if (editar) {%>
                <input type="hidden" name="id" value="<%= c.getId()%>">
                <% }%>

                <div class="form-group">
                    <label>Nombre</label>
                    <input type="text" name="nombre" required
                           value="<%= editar ? c.getNombre() : ""%>">
                </div>

                <div class="form-group">
                    <label>Cédula</label>
                    <input type="text" name="cedula" required
                           value="<%= editar ? c.getCedula() : ""%>">
                </div>

                <div class="form-group">
                    <label>Correo</label>
                    <input type="email" name="correo" required
                           value="<%= editar ? c.getCorreo() : ""%>">
                </div>

                <div class="btn-group">
                    <button type="submit" class="btn btn-save">
                        Guardar
                    </button>

                    <!-- Cancelar vuelve al panel principal -->
                    <a href="<%= request.getContextPath()%>/principal.jsp"
                       class="btn btn-cancel">
                        Cancelar
                    </a>
                </div>

            </form>

        </div>

    </body>
</html>
