package modelo;

public class VentaItem {
    private Productos producto;
    private int cantidad;

    

    public VentaItem(Productos producto, int cantidad) {
        this.producto = producto;
        this.cantidad = cantidad;
    }

    public Productos getProducto() { return producto; }
    public void setProducto(Productos producto) { this.producto = producto; }
    public int getCantidad() { return cantidad; }
    public void setCantidad(int cantidad) { this.cantidad = cantidad; }

    public double getSubtotal() {
        if (producto == null) return 0;
        return producto.getPrecio() * cantidad;
    }
}
