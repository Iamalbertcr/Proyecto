package servlet;

import dao.UsuarioDAO;
import modelo.Usuario;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String usuario = request.getParameter("usuario");
        String clave = request.getParameter("clave");

        UsuarioDAO dao = new UsuarioDAO();
        Usuario u = dao.validar(usuario, clave);

        if (u != null) {

            // Crear sesión
            HttpSession sesion = request.getSession();
            sesion.setAttribute("usuario", u.getUsuario());
            sesion.setAttribute("rol", u.getRol());

            // Redirige a la página principal
            response.sendRedirect("index.jsp");

        } else {

            // Error en login
            request.setAttribute("error", "Usuario o contraseña incorrectos");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
