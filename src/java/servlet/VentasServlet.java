package servlet;

import dao.ProductosDAO;
import dao.VentaDAO;
import modelo.Productos;
import modelo.Venta;
import modelo.VentaItem;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/VentasServlet")
public class VentasServlet extends HttpServlet {

    private ProductosDAO productoDAO = new ProductosDAO();
    private VentaDAO ventaDAO = new VentaDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String cliente = request.getParameter("cliente");
        String[] productoIds = request.getParameterValues("productoId[]"); // ids from form
        String[] cantidades = request.getParameterValues("cantidad[]");

        List<VentaItem> items = new ArrayList<>();
        double total = 0;

        if (productoIds != null) {
            for (int i = 0; i < productoIds.length; i++) {
                try {
                    int idProd = Integer.parseInt(productoIds[i]);
                    int cant = Integer.parseInt(cantidades[i]);

                    Productos prod = productoDAO.obtenerPorId(idProd);
                    if (prod != null) {
                        VentaItem it = new VentaItem(prod, cant);
                        items.add(it);
                        total += it.getSubtotal();
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        }

        String fecha = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        Venta venta = new Venta(fecha, cliente, total, items);

        int idVenta = ventaDAO.registrarVenta(venta);

        // Calculo de subtotal e IVA simple
        double iva = total * 0.13;
        double subtotal = total - iva;

        request.setAttribute("items", items);
        request.setAttribute("subtotal", subtotal);
        request.setAttribute("iva", iva);
        request.setAttribute("total", total);
        request.setAttribute("idVenta", idVenta);

        RequestDispatcher rd = request.getRequestDispatcher("resultadoVenta.jsp");
        rd.forward(request, response);
    }
}
