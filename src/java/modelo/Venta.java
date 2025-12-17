package modelo;

import java.util.List;

public class Venta {

    private int idVenta;
    private String fecha;
    private String cliente;
    private double total;
    private List<VentaItem> items;
    private int clienteId;

    public Venta(String fecha, int clienteId, double total, List<VentaItem> items) {
    this.fecha = fecha;
    this.clienteId = clienteId;
    this.total = total;
    this.items = items;
}


    public Venta() {

    }

    public int getIdVenta() {
        return idVenta;
    }

    public void setIdVenta(int idVenta) {
        this.idVenta = idVenta;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getCliente() {
        return cliente;
    }

    public void setCliente(String cliente) {
        this.cliente = cliente;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public List<VentaItem> getItems() {
        return items;
    }

    public void setItems(List<VentaItem> items) {
        this.items = items;
    }
}
