package servlet;

import dao.ClienteDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modelo.Cliente;

import java.io.IOException;

@WebServlet("/ClienteServlet")
public class ClienteServlet extends HttpServlet {

    private ClienteDAO dao = new ClienteDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String accion = req.getParameter("accion");
        if (accion == null) {
            accion = "listar";
        }

        switch (accion) {

            case "listar":
                req.setAttribute("lista", dao.listar());
                req.getRequestDispatcher("clientes.jsp").forward(req, resp);
                break;

            case "nuevo":
                req.getRequestDispatcher("cliente-form.jsp").forward(req, resp);
                break;

            case "editar":
                int idEd = Integer.parseInt(req.getParameter("id"));
                Cliente cli = dao.obtenerPorId(idEd);
                req.setAttribute("cliente", cli);
                req.getRequestDispatcher("cliente-form.jsp").forward(req, resp);
                break;

            case "eliminar":
                int idE = Integer.parseInt(req.getParameter("id"));
                dao.eliminar(idE);
                resp.sendRedirect("ClienteServlet?accion=listar");
                break;

            default:
                resp.sendRedirect("ClienteServlet?accion=listar");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String accion = req.getParameter("accion");

        if ("agregar".equals(accion)) {
            Cliente c = new Cliente();
            c.setNombre(req.getParameter("nombre"));
            c.setCedula(req.getParameter("cedula"));
            c.setCorreo(req.getParameter("correo"));

            dao.agregar(c);
            resp.sendRedirect("ClienteServlet?accion=listar");

        } else if ("actualizar".equals(accion)) {
            Cliente c = new Cliente();
            c.setId(Integer.parseInt(req.getParameter("id")));
            c.setNombre(req.getParameter("nombre"));
            c.setCedula(req.getParameter("cedula"));
            c.setCorreo(req.getParameter("correo"));

            dao.actualizar(c);
            resp.sendRedirect("ClienteServlet?accion=listar");
        }
    }
}
