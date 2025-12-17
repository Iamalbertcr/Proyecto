package controlador;

import dao.UsuarioDAO;
import modelo.Usuario;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/UsuarioServlet")
public class UsuarioServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");
        UsuarioDAO dao = new UsuarioDAO();

        if ("login".equalsIgnoreCase(accion)) {

            String usuario = request.getParameter("usuario");
            String clave = request.getParameter("clave");

            Usuario u = dao.validar(usuario, clave);

            if (u != null) {
                HttpSession sesion = request.getSession();
                sesion.setAttribute("usuario", u.getUsuario());
                sesion.setAttribute("rol", u.getRol());
                response.sendRedirect("index.jsp");
            } else {
                request.setAttribute("error", "Usuario o contraseña incorrectos");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } else if ("agregar".equalsIgnoreCase(accion)) {

            String usuario = request.getParameter("usuario");
            String clave = request.getParameter("contrasena");
            String rol = request.getParameter("rol");

            Usuario nuevo = new Usuario();
            nuevo.setUsuario(usuario);
            nuevo.setClave(clave);
            nuevo.setRol(rol);

            boolean agregado = dao.agregar(nuevo);

            if (agregado) {
                request.setAttribute("mensaje", "Usuario agregado correctamente");
            } else {
                request.setAttribute("error", "Error al agregar usuario");
            }

            request.getRequestDispatcher("AgregarUsuario.jsp").forward(request, response);
        }
    }
}
