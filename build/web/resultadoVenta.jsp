<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="modelo.VentaItem, java.util.List" %>
<%
    List<VentaItem> items = (List<VentaItem>) request.getAttribute("items");
    Double subtotal = (Double) request.getAttribute("subtotal");
    Double iva = (Double) request.getAttribute("iva");
    Double total = (Double) request.getAttribute("total");
    Integer idVenta = (Integer) request.getAttribute("idVenta");
%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>Venta Registrada</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="bg-dark text-light">
<div class="container mt-5">
  <div class="card bg-secondary bg-opacity-25" style="max-width:900px;margin:auto;">
    <div class="card-body">
      <h2 class="text-center mb-4">✅ Venta registrada exitosamente</h2>
      <% if (idVenta != null) { %>
        <h5 class="text-center text-info">ID de venta: <%= idVenta %></h5>
      <% } %>

      <table class="table table-dark table-striped mt-4">
        <thead><tr><th>Producto</th><th>Cant.</th><th>Precio</th><th>Subtotal</th></tr></thead>
        <tbody>
        <% if (items != null) {
             for (VentaItem it : items) {
        %>
          <tr>
            <td><%= it.getProducto() != null ? it.getProducto().getNombre() : "—" %></td>
            <td><%= it.getCantidad() %></td>
            <td>₡ <%= String.format("%.2f", it.getProducto() != null ? it.getProducto().getPrecio(): 0.0) %></td>
            <td>₡ <%= String.format("%.2f", it.getSubtotal()) %></td>
          </tr>
        <%   }
           } %>
        </tbody>
      </table>

      <div class="text-end mt-4">
        <p><strong>Subtotal:</strong> ₡ <%= String.format("%.2f", subtotal) %></p>
        <p><strong>IVA 13%:</strong> ₡ <%= String.format("%.2f", iva) %></p>
        <h3>Total: ₡ <%= String.format("%.2f", total) %></h3>
      </div>

      <div class="d-flex justify-content-center gap-3 mt-4">
        <a href="FacturarVenta.jsp" class="btn btn-success btn-lg">Nueva venta</a>
        <a href="index.jsp" class="btn btn-outline-light btn-lg">Volver al panel</a>
      </div>
    </div>
  </div>
</div>
</body>
</html>
