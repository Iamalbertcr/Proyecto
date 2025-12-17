<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="modelo.Productos" %>

<%
    Productos p = (Productos) request.getAttribute("producto");
    boolean editar = (p != null);
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title><%= editar ? "Editar Producto" : "Agregar Producto" %></title>

    <!-- FAVICON -->
    <link rel="icon" type="image/x-icon"
          href="<%= request.getContextPath()%>/img/ferremax-sinfondo.ico">

    <!-- BOOTSTRAP 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <!-- ICONOS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
          rel="stylesheet">

    <!-- ESTILOS CREATIVOS -->
    <style>
        body {
            min-height: 100vh;
            margin: 0;
            background: linear-gradient(135deg,
                #050f3a 0%,
                #091f63 30%,
                #123fd1 60%,
                #0b2fa3 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Segoe UI', sans-serif;
        }

        /* Tarjeta con borde luminoso */
        .product-card {
            background: rgba(255,255,255,0.10);
            backdrop-filter: blur(20px);
            border-radius: 26px;
            padding: 40px;
            width: 100%;
            max-width: 520px;
            color: white;
            position: relative;
            box-shadow: 0 30px 70px rgba(0,0,0,0.5);
        }

        .product-card::before {
            content: "";
            position: absolute;
            inset: 0;
            border-radius: 26px;
            padding: 2px;
            background: linear-gradient(135deg,
                rgba(255,255,255,0.5),
                rgba(255,255,255,0.05));
            -webkit-mask:
                linear-gradient(#fff 0 0) content-box,
                linear-gradient(#fff 0 0);
            -webkit-mask-composite: xor;
            mask-composite: exclude;
        }

        /* Título */
        .product-title {
            text-align: center;
            font-weight: 700;
            margin-bottom: 30px;
        }

        /* Inputs flotantes */
        .form-floating > .form-control {
            background: rgba(255,255,255,0.15);
            border: 1px solid rgba(255,255,255,0.35);
            color: white;
            border-radius: 14px;
        }

        .form-floating > label {
            color: rgba(255,255,255,0.7);
        }

        .form-control:focus {
            background: rgba(255,255,255,0.25);
            border-color: #fff;
            color: white;
            box-shadow: none;
        }

        /* Botones */
        .btn-save {
            background: linear-gradient(135deg, #00c6ff, #0072ff);
            border: none;
            border-radius: 18px;
            padding: 14px;
            font-weight: 600;
            color: white;
        }

        .btn-save:hover {
            opacity: 0.9;
        }

        .btn-cancel {
            color: rgba(255,255,255,0.85);
            text-decoration: none;
        }

        .btn-cancel:hover {
            color: white;
            text-decoration: underline;
        }

        /* Ícono superior */
        .icon-box {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            background: rgba(255,255,255,0.18);
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px;
            font-size: 30px;
        }
    </style>
</head>

<body>

<div class="product-card">

    <!-- ICONO -->
    <div class="icon-box">
        <i class="bi bi-box-seam"></i>
    </div>

    <!-- TÍTULO -->
    <h3 class="product-title">
        <%= editar ? "Editar Producto" : "Agregar Producto" %>
    </h3>

    <!-- FORMULARIO -->
    <form action="ProductoServlet" method="post">

        <input type="hidden" name="id"
               value="<%= editar ? p.getId() : "" %>">

        <div class="form-floating mb-3">
            <input type="text" name="nombre" class="form-control"
                   placeholder="Nombre"
                   required
                   value="<%= editar ? p.getNombre() : "" %>">
            <label>Nombre del producto</label>
        </div>

        <div class="form-floating mb-3">
            <input type="number" step="0.01" name="precio" class="form-control"
                   placeholder="Precio"
                   required
                   value="<%= editar ? p.getPrecio() : "" %>">
            <label>Precio (₡)</label>
        </div>

        <div class="form-floating mb-4">
            <input type="number" name="cantidad" class="form-control"
                   placeholder="Cantidad"
                   required
                   value="<%= editar ? p.getCantidad() : "" %>">
            <label>Cantidad en inventario</label>
        </div>

        <div class="d-grid mb-3">
            <button type="submit" class="btn btn-save btn-lg">
                <i class="bi bi-save"></i> Guardar Producto
            </button>
        </div>

        <div class="text-center">
            <a href="InventarioServlet" class="btn-cancel"></a>
        </div>

    </form>

</div>

</body>
</html>
