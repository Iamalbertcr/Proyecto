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

@WebServlet(name = "ListarVentasServlet", urlPatterns = {"/ListarVentasServlet"})
public class ListarVentasServlet extends HttpServlet {

    VentaDAO ventaDAO = new VentaDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Venta> ventas = ventaDAO.obtenerVentas();

        request.setAttribute("ventas", ventas);

        RequestDispatcher rd = request.getRequestDispatcher("AdminVentas.jsp");
        rd.forward(request, response);

    }

}
