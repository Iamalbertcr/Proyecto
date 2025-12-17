package servlet;

import dao.ProductosDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import modelo.Productos;

@WebServlet(name = "ProductoServlet", urlPatterns = {"/ProductoServlet"})
public class ProductoServlet extends HttpServlet {

    private ProductosDAO dao = new ProductosDAO();

    // =========================
    // GET
    // =========================
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String accion = req.getParameter("accion");

        try {
            if ("listar".equals(accion)) {

                req.setAttribute("lista", dao.listar());
                req.getRequestDispatcher("productos.jsp").forward(req, resp);

            } else if ("nuevo".equals(accion)) {

                req.getRequestDispatcher("agregarProducto.jsp").forward(req, resp);

            } else if ("editar".equals(accion)) {

                int id = Integer.parseInt(req.getParameter("id"));
                Productos p = dao.obtenerPorId(id);

                req.setAttribute("producto", p);
                req.getRequestDispatcher("editarProducto.jsp").forward(req, resp);

            } else if ("eliminar".equals(accion)) {

                int id = Integer.parseInt(req.getParameter("id"));
                dao.eliminar(id);

                resp.sendRedirect("ProductoServlet?accion=listar");

            } else {

                resp.sendRedirect("ProductoServlet?accion=listar");
            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("ProductoServlet?accion=listar");
        }
    }

    // =========================
    // POST
    // =========================
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String accion = req.getParameter("accion");

        try {
            if ("agregar".equals(accion)) {

                Productos p = new Productos();
                p.setCodigo(req.getParameter("codigo"));
                p.setNombre(req.getParameter("nombre"));
                p.setPrecio(Double.parseDouble(req.getParameter("precio")));
                p.setCantidad(Integer.parseInt(req.getParameter("cantidad")));

                dao.agregar(p);

                resp.sendRedirect("ProductoServlet?accion=listar");

            } else if ("actualizar".equals(accion)) {

                Productos p = new Productos();
                p.setId(Integer.parseInt(req.getParameter("id")));
                p.setCodigo(req.getParameter("codigo"));
                p.setNombre(req.getParameter("nombre"));
                p.setPrecio(Double.parseDouble(req.getParameter("precio")));
                p.setCantidad(Integer.parseInt(req.getParameter("cantidad")));

                dao.actualizar(p);

                resp.sendRedirect("ProductoServlet?accion=listar");

            } else {

                resp.sendRedirect("ProductoServlet?accion=listar");
            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("ProductoServlet?accion=listar");
        }
    }
}
