package servlet;

import dao.UsuarioDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/RecuperarServlet")
public class RecuperarServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String usuario = request.getParameter("usuario");
        UsuarioDAO dao = new UsuarioDAO();

        String clave = dao.obtenerClave(usuario);

        if (clave != null) {
            request.setAttribute("mensaje", "Su contraseña es: " + clave);
        } else {
            request.setAttribute("mensaje", "El usuario no existe.");
        }

        request.getRequestDispatcher("recuperar.jsp").forward(request, response);
    }
}
