package conexion;

	
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.mysql.cj.xdevapi.Statement;

public class conexion {
	


    // Nombre de la base de datos
    private static final String database = "bd_registrocalificado";
    
    // Nombre de usuario
    private static final String username = "root";

    // Clave de usuario
    public static final String password = "2556229";

    // Ruta de nuestra base de datos
    private static final String url = "jdbc:mysql://localhost:3306/" + database;
    
  

    

    	public static  Connection getConexion() {
        
    	Connection conn = null;
    	
        try {
        	// Cargar el driver de MYSQL
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Establecer conexion
            conn =DriverManager.getConnection(url, username, password);
            
            System.out.println("Conexion exitosa a la BD");
			
		} catch (ClassNotFoundException e) {
			System.out.println("Error: Driver no encontrado");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("Error: en la conexion a la base de datos");
			e.printStackTrace();
		}
        return conn;
        
   }






    
    
}