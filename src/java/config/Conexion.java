package config;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {
    
    public static Connection getConexion() {
        Connection con = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/TU_BASE?useSSL=false&serverTimezone=UTC",
                "root",
                "" // tu password si tienes
            );
        } catch (Exception e) {
            e.printStackTrace();
        }

        return con;
    }
}

