package DAO;
import DAO.programasgs;
import conexion.conexion;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import conexion.conexion;


public class programascrudDao {

	// CREATE - Insertar nuevo programa
    public boolean insertarPrograma(programasgs programa) throws SQLException {
        String sql = "INSERT INTO tbl_programasformacion (codigoprograma, nombreprograma, duracionetapalectiva, " +
                    "duracionetapaproductiva, creditos, horas) VALUES (?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = conexion.getConexion();
             PreparedStatement statement = conn.prepareStatement(sql)) {
            
            statement.setInt(1, Integer.parseInt(programa.getCodigoprograma()));
            statement.setString(2, programa.getNombreprograma());
            statement.setInt(3, Integer.parseInt(programa.getDuracionetapalectiva()));
            statement.setInt(4, Integer.parseInt(programa.getDuracionetapaproductiva()));
            statement.setInt(5, Integer.parseInt(programa.getCreditos()));
            statement.setInt(6, Integer.parseInt(programa.getHoras()));
            
            return statement.executeUpdate() > 0;
        }
    }
    
    // READ - Obtener todos los programas
    public List<programasgs> obtenerTodosProgramas() throws SQLException {
        List<programasgs> programas = new ArrayList<>();
        String sql = "SELECT * FROM tbl_programasformacion";
        
        try (Connection conn = conexion.getConexion();
             Statement statement = conn.createStatement();
             ResultSet resultSet = statement.executeQuery(sql)) {
            
            while (resultSet.next()) {
                programasgs programa = new programasgs(
                    String.valueOf(resultSet.getInt("codigoprograma")),
                    resultSet.getString("nombreprograma"),
                    String.valueOf(resultSet.getInt("duracionetapalectiva")),
                    String.valueOf(resultSet.getInt("duracionetapaproductiva")),
                    String.valueOf(resultSet.getInt("creditos")),
                    String.valueOf(resultSet.getInt("horas"))
                );
                programas.add(programa);
            }
        }
        return programas;
    }
    
    // READ - Obtener programa por código
    public programasgs obtenerProgramaPorCodigo(String codigo) throws SQLException {
        String sql = "SELECT * FROM tbl_programasformacion WHERE codigoprograma = ?";
        
        try (Connection conn = conexion.getConexion();
             PreparedStatement statement = conn.prepareStatement(sql)) {
            
            statement.setInt(1, Integer.parseInt(codigo));
            ResultSet resultSet = statement.executeQuery();
            
            if (resultSet.next()) {
                return new programasgs(
                    String.valueOf(resultSet.getInt("codigoprograma")),
                    resultSet.getString("nombreprograma"),
                    String.valueOf(resultSet.getInt("duracionetapalectiva")),
                    String.valueOf(resultSet.getInt("duracionetapaproductiva")),
                    String.valueOf(resultSet.getInt("creditos")),
                    String.valueOf(resultSet.getInt("horas"))
                );
            }
        }
        return null;
    }
    
    // UPDATE - Actualizar programa
    public boolean actualizarPrograma(programasgs programa) throws SQLException {
        String sql = "UPDATE tbl_programasformacion SET nombreprograma = ?, duracionetapalectiva = ?, " +
                    "duracionetapaproductiva = ?, creditos = ?, horas = ? WHERE codigoprograma = ?";
        
        try (Connection conn = conexion.getConexion();
             PreparedStatement statement = conn.prepareStatement(sql)) {
            
            statement.setString(1, programa.getNombreprograma());
            statement.setInt(2, Integer.parseInt(programa.getDuracionetapalectiva()));
            statement.setInt(3, Integer.parseInt(programa.getDuracionetapaproductiva()));
            statement.setInt(4, Integer.parseInt(programa.getCreditos()));
            statement.setInt(5, Integer.parseInt(programa.getHoras()));
            statement.setInt(6, Integer.parseInt(programa.getCodigoprograma()));
            
            return statement.executeUpdate() > 0;
        }
    }
    
    // DELETE - Eliminar programa
    public boolean eliminarPrograma(String codigo) throws SQLException {
        String sql = "DELETE FROM tbl_programasformacion WHERE codigoprograma = ?";
        
        try (Connection conn = conexion.getConexion();
             PreparedStatement statement = conn.prepareStatement(sql)) {
            
            statement.setInt(1, Integer.parseInt(codigo));
            return statement.executeUpdate() > 0;
        }
    }
//BUSCAR
public List<programasgs> buscarProgramas(String keyword) throws SQLException {
    List<programasgs> programas = new ArrayList<>();
    String sql = "SELECT * FROM tbl_programasformacion WHERE nombreprograma LIKE ? OR codigoprograma LIKE ?";
    
    try (Connection conn = conexion.getConexion();
         PreparedStatement statement = conn.prepareStatement(sql)) {
        
        statement.setString(1, "%" + keyword + "%");
        statement.setString(2, "%" + keyword + "%");
        
        ResultSet resultSet = statement.executeQuery();
        
        while (resultSet.next()) {
            programasgs programa = new programasgs(
                String.valueOf(resultSet.getInt("codigoprograma")),
                resultSet.getString("nombreprograma"),
                String.valueOf(resultSet.getInt("duracionetapalectiva")),
                String.valueOf(resultSet.getInt("duracionetapaproductiva")),
                String.valueOf(resultSet.getInt("creditos")),
                String.valueOf(resultSet.getInt("horas"))
            );
            programas.add(programa);
        }
    }
    return programas;
}
}