package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import modelo.Usuario;

public class UsuarioDAO {

    // -------- VALIDAR USUARIO Y RETORNAR OBJETO --------
    public Usuario validar(String usuario, String clave) {

        String sql = "SELECT * FROM usuarios WHERE usuario=? AND clave=?";

        try (Connection con = Conexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, usuario);
            ps.setString(2, clave);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Usuario u = new Usuario();
                u.setId(rs.getInt("id"));
                u.setUsuario(rs.getString("usuario"));
                u.setClave(rs.getString("clave"));
                u.setRol(rs.getString("rol"));
                return u;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null; // login incorrecto
    }

    // -------- OBTENER CONTRASEÑA --------
    public String obtenerClave(String usuario) {

        String sql = "SELECT clave FROM usuarios WHERE usuario=?";

        try (Connection con = Conexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, usuario);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getString("clave");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null; // usuario no existe
    }

    // -------- AGREGAR NUEVO USUARIO --------
    public boolean agregar(Usuario u) {

    String sql = "INSERT INTO usuarios(usuario, clave, rol) VALUES (?, ?, ?)";

    try (Connection con = Conexion.getConexion();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setString(1, u.getUsuario());
        ps.setString(2, u.getClave());
        ps.setString(3, u.getRol());

        return ps.executeUpdate() > 0; // más claro

    } catch (Exception e) {
        e.printStackTrace();
        return false;
    }
}

}
