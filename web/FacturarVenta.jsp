<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.ProductosDAO, modelo.Productos" %>
<%@ page import="dao.ClienteDAO, modelo.Cliente" %>
<%@ page import="java.util.List" %>

<%
    // PRODUCTOS
    ProductosDAO pDao = new ProductosDAO();
    List<Productos> productos = pDao.listar();

    // CLIENTES
    ClienteDAO cDao = new ClienteDAO();
    List<Cliente> clientes = cDao.listar();

    out.println("CLIENTES CARGADOS: " + clientes.size());
%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Facturar Venta</title>

        <link rel="icon" type="image/x-icon"
              href="<%= request.getContextPath()%>/img/ferremax-sinfondo.ico">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
              rel="stylesheet">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
              rel="stylesheet">

        <style>
            body {
                min-height: 100vh;
                background: linear-gradient(135deg, #0d47a1, #1565c0, #1e88e5);
            }
            .card {
                border-radius: 1.25rem;
            }
            .card-header {
                background: linear-gradient(135deg, #0d47a1, #1976d2);
            }
            .linea {
                background: #f8f9fa;
                border-radius: .75rem;
                padding: 1rem;
            }
            .form-control:focus, .form-select:focus {
                border-color: #1976d2;
                box-shadow: 0 0 0 .2rem rgba(25,118,210,.25);
            }
            .btn-success {
                background: linear-gradient(135deg, #2e7d32, #43a047);
                border: none;
            }
            .btn-primary {
                background: linear-gradient(135deg, #1565c0, #1e88e5);
                border: none;
            }
        </style>
    </head>

    <body>

        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-xl-9 col-lg-10">

                    <div class="card shadow-lg border-0">

                        <div class="card-header text-white text-center py-4">
                            <h3 class="m-0 fw-bold">
                                <i class="bi bi-receipt"></i> Facturar Venta
                            </h3>
                        </div>

                        <a href="<%= request.getContextPath()%>/index.jsp"
                           class="btn btn-link mt-2">
                            ⬅ Volver al Panel
                        </a>

                        <div class="card-body p-4">

                            <form action="VentasServlet" method="post">

                                <<!-- CLIENTE -->
                                <div class="row linea g-3 align-items-end mb-4">

                                    <div class="col-md-12">
                                        <label class="form-label fw-semibold">Cliente</label>

                                        <select name="clienteId"
                                                class="form-select form-select-lg"
                                                required>
                                            <option value="">Seleccione un cliente</option>

                                            <% for (Cliente c : clientes) {%>
                                            <option value="<%= c.getId()%>">
                                                <%= c.getNombre()%> - <%= c.getCedula()%>
                                            </option>
                                            <% } %>
                                        </select>
                                    </div>

                                </div>



                                <!-- LINEAS -->
                                <div id="lineas">

                                    <div class="row linea g-3 align-items-end mb-3">

                                        <div class="col-md-5">
                                            <label class="form-label fw-semibold">Producto</label>
                                            <select name="productoId[]" class="form-select producto"
                                                    onchange="actualizarPrecio(this)" required>
                                                <option value="">Seleccione un producto</option>
                                                <% for (Productos p : productos) {%>
                                                <option value="<%= p.getId()%>"
                                                        data-precio="<%= p.getPrecio()%>">
                                                    <%= p.getNombre()%>
                                                </option>
                                                <% }%>
                                            </select>
                                        </div>

                                        <div class="col-md-3">
                                            <label class="form-label fw-semibold">Cantidad</label>
                                            <input type="number" name="cantidad[]"
                                                   class="form-control"
                                                   value="1" min="1" required>
                                        </div>

                                        <div class="col-md-2">
                                            <label class="form-label fw-semibold">Precio</label>
                                            <input type="text" class="form-control precio" readonly>
                                        </div>

                                        <div class="col-md-2">
                                            <button type="button"
                                                    class="btn btn-danger w-100"
                                                    onclick="this.closest('.linea').remove()">
                                                <i class="bi bi-trash"></i>
                                            </button>
                                        </div>

                                    </div>
                                </div>

                                <div class="mt-4 d-flex justify-content-between">
                                    <button type="button"
                                            class="btn btn-success btn-lg"
                                            onclick="agregarLinea()">
                                        <i class="bi bi-plus-circle"></i> Agregar línea
                                    </button>

                                    <button type="submit"
                                            class="btn btn-primary btn-lg">
                                        <i class="bi bi-save"></i> Guardar venta
                                    </button>
                                </div>

                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            function actualizarPrecio(select) {
                const linea = select.closest(".linea");
                const precio = select.options[select.selectedIndex].dataset.precio || "";
                linea.querySelector(".precio").value = precio;
            }

            function agregarLinea() {
                const cont = document.getElementById("lineas");
                const original = document.querySelector(".linea");
                const nueva = original.cloneNode(true);

                nueva.querySelector("select").selectedIndex = 0;
                nueva.querySelector(".precio").value = "";
                nueva.querySelector("input[name='cantidad[]']").value = 1;

                cont.appendChild(nueva);
            }
        </script>

    </body>
</html>
