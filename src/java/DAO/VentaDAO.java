package dao;

import modelo.Venta;
import modelo.VentaItem;
import modelo.Productos;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class VentaDAO {

    public int registrarVenta(Venta venta) {
        int idVenta = 0;
        String sqlVenta = "INSERT INTO ventas(fecha, cliente, total) VALUES(?,?,?)";
        String sqlDetalle = "INSERT INTO detalle_venta(idVenta, producto_id, producto_nombre, cantidad, precio, subtotal) VALUES(?,?,?,?,?,?)";

        try (Connection con = Conexion.getConexion(); PreparedStatement psVenta = con.prepareStatement(sqlVenta, Statement.RETURN_GENERATED_KEYS); PreparedStatement psDet = con.prepareStatement(sqlDetalle)) {

            con.setAutoCommit(false);

            // Insert venta
            psVenta.setString(1, venta.getFecha());
            psVenta.setString(2, venta.getCliente());
            psVenta.setDouble(3, venta.getTotal());
            psVenta.executeUpdate();

            try (ResultSet rs = psVenta.getGeneratedKeys()) {
                if (rs.next()) {
                    idVenta = rs.getInt(1);
                }
            }

            if (idVenta == 0) {
                throw new SQLException("No se obtuvo id generado para la venta.");
            }

            // Insertar detalles
            List<VentaItem> items = venta.getItems();
            for (VentaItem item : items) {
                Productos prod = item.getProducto();

                psDet.setInt(1, idVenta);
                if (prod != null) {
                    psDet.setInt(2, prod.getId());
                    psDet.setString(3, prod.getNombre());
                    psDet.setInt(4, item.getCantidad());
                    psDet.setDouble(5, prod.getPrecio());
                    psDet.setDouble(6, item.getSubtotal());
                } else {
                    // si no hay producto (caso raro), insertar nulls/valores por defecto
                    psDet.setNull(2, Types.INTEGER);
                    psDet.setNull(3, Types.VARCHAR);
                    psDet.setInt(4, item.getCantidad());
                    psDet.setDouble(5, 0.0);
                    psDet.setDouble(6, 0.0);
                }
                psDet.addBatch();
            }

            psDet.executeBatch();
            con.commit();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return idVenta;
    }

    public List<Venta> obtenerVentas() {
        List<Venta> lista = new ArrayList<>();
        String sql = "SELECT idVenta, fecha, cliente, total FROM ventas";

        try (
                Connection con = Conexion.getConexion(); 
                PreparedStatement ps = con.prepareStatement(sql); 
                ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Venta v = new Venta();
                v.setIdVenta(rs.getInt("idVenta"));
                v.setFecha(rs.getString("fecha"));
                v.setCliente(rs.getString("cliente"));
                v.setTotal(rs.getDouble("total"));

                lista.add(v);
            }

        } 
        catch (Exception e) {
            e.printStackTrace();
        }
        System.out.print(lista.size());
        return lista;
        
        
    }

    

}
