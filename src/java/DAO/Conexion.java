package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {

    private static final String URL = "jdbc:mysql://localhost:3306/ferremax";
    private static final String USER = "root";
    private static final String PASS = "";

    public static Connection getConexion() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(URL, USER, PASS);
            return con;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
