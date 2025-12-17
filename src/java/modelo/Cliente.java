package modelo;

public class Cliente {

    private int id;
    private String nombre;
    private String cedula;
    private String correo;

    // constructor, getters y setters
    public Cliente() {
    }

    public Cliente(int id, String nombre, String cedula, String correo) {
        this.id = id;
        this.nombre = nombre;
        this.cedula = cedula;
        this.correo = correo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String n) {
        this.nombre = n;
    }

    public String getCedula() {
        return cedula;
    }

    public void setCedula(String c) {
        this.cedula = c;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String c) {
        this.correo = c;
    }
}
