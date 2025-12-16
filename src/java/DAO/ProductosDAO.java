package dao;

import modelo.Productos;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductosDAO {

    public Productos obtenerPorId(int id) {
        Productos p = null;
        String sql = "SELECT id, nombre, precio, cantidad FROM productos WHERE id = ?";

        try (Connection con = Conexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    p = new Productos(
                        rs.getInt("id"),
                        null,  // tu DB no tiene código
                        rs.getString("nombre"),
                        rs.getDouble("precio"),
                        rs.getInt("cantidad")  // se asigna al stock
                    );
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return p;
    }

    public List<Productos> listar() {
        List<Productos> lista = new ArrayList<>();
        String sql = "SELECT id, nombre, precio, cantidad FROM productos";

        try (Connection con = Conexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Productos p = new Productos(
                    rs.getInt("id"),
                    null,
                    rs.getString("nombre"),
                    rs.getDouble("precio"),
                    rs.getInt("cantidad")
                );
                lista.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return lista;
    }

    public void eliminar(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public void agregar(Productos p) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public void actualizar(Productos p) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
