package dao;

import modelo.Cliente;
import java.sql.*;
import java.util.*;

public class ClienteDAO {

    private Connection getConexion() throws SQLException {
        return DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/ferremax",
                "root",
                ""
        );
    }

    // INSERT
    public boolean agregar(Cliente c) {
        String sql = "INSERT INTO clientes(nombre, cedula, correo) VALUES (?,?,?)";
        try (Connection con = getConexion(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, c.getNombre());
            ps.setString(2, c.getCedula());
            ps.setString(3, c.getCorreo());
            ps.executeUpdate();
            return true;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // SELECT *
    public List<Cliente> listar() {
        List<Cliente> lista = new ArrayList<>();
        String sql = "SELECT * FROM clientes";

        try (Connection con = getConexion(); PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Cliente c = new Cliente();
                c.setId(rs.getInt("id"));
                c.setNombre(rs.getString("nombre"));
                c.setCedula(rs.getString("cedula"));
                c.setCorreo(rs.getString("correo"));
                lista.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }

    // SELECT WHERE ID
    public Cliente obtenerPorId(int id) {
        Cliente c = null;
        String sql = "SELECT * FROM clientes WHERE id=?";

        try (Connection con = getConexion(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                c = new Cliente();
                c.setId(rs.getInt("id"));
                c.setNombre(rs.getString("nombre"));
                c.setCedula(rs.getString("cedula"));
                c.setCorreo(rs.getString("correo"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return c;
    }

    // UPDATE
    public boolean actualizar(Cliente c) {
        String sql = "UPDATE clientes SET nombre=?, cedula=?, correo=? WHERE id=?";
        try (Connection con = getConexion(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, c.getNombre());
            ps.setString(2, c.getCedula());
            ps.setString(3, c.getCorreo());
            ps.setInt(4, c.getId());
            ps.executeUpdate();
            return true;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // DELETE
    public boolean eliminar(int id) {
        String sql = "DELETE FROM clientes WHERE id=?";
        try (Connection con = getConexion(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            ps.executeUpdate();
            return true;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
