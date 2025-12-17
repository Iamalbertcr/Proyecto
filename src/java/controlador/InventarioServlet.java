package controlador;

import dao.ProductosDAO;
import modelo.Productos;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/InventarioServlet")
public class InventarioServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ProductosDAO dao = new ProductosDAO();
        List<Productos> lista = dao.listar();

        request.setAttribute("lista", lista);

        // ✅ RUTA Y NOMBRE EXACTOS
        request.getRequestDispatcher("/productos.jsp")
                .forward(request, response);
    }
}
