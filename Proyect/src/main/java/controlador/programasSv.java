package controlador;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import conexion.conexion;

/**
 * Servlet implementation class prueba
 */
@WebServlet("/prueba")
public class programasSv extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public programasSv() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
        
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 PrintWriter out = response.getWriter();

	        // Obtener parámetros del formulario
	        String codigoprograma = request.getParameter("codigoprograma");
	        String nombreprograma = request.getParameter("nombreprograma");
	        String duracionetapalectiva = request.getParameter("duracionetapalectiva");
	        String duracionetapaproductiva = request.getParameter("duracionetapaproductiva");
	        String creditos = request.getParameter("creditos");
	        String horas = request.getParameter("horas");

	        // Conexión a base de datos
	        try (Connection conn = conexion.getConexion()) {
	            String sql = "INSERT INTO tbl_programasformacion (codigoprograma, nombreprograma, duracionetapalectiva, duracionetapaproductiva, creditos, horas) "
	            		+ "VALUES (?, ?, ?, ?, ?, ?)";

	            PreparedStatement statement = conn.prepareStatement(sql);
	            statement.setInt(1, Integer.parseInt(codigoprograma));
	            statement.setString(2, nombreprograma);
	            statement.setInt(3, Integer.parseInt(duracionetapalectiva));
	            statement.setInt(4, Integer.parseInt(duracionetapaproductiva));
	            statement.setInt(5, Integer.parseInt(creditos));
	            statement.setInt(6, Integer.parseInt(horas));

	            int rowsInserted = statement.executeUpdate();

	            if (rowsInserted > 0) {
	                //out.println("Programa Registrado");
	                response.sendRedirect("/Proyect/proyect.jsp");
	            } else {
	                out.println("Error al registrar el programa.");
	            }

	        } catch (SQLException e) {
	            out.println("Error de conexión o SQL: " + e.getMessage());
	        
	    }
	        
		doGet(request, response);
	}

	
	
}
