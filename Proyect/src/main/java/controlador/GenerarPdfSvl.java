package controlador;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import conexion.conexion;
/**
 * Servlet implementation class GenerarPdfSvl
 */
@WebServlet("/GenerarPdfSvl")
public class GenerarPdfSvl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	// Fuentes para el documento
    private static final Font TITLE_FONT = FontFactory.getFont(FontFactory.TIMES_BOLDITALIC, 18);
    private static final Font HEADER_FONT = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12);
    private static final Font NORMAL_FONT = FontFactory.getFont(FontFactory.HELVETICA, 10);

	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GenerarPdfSvl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	    response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=\"programas_formacion.pdf\"");
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet resultSet = null;
        
        Document document = new Document();
        
        try {
            // Obtener conexión a la base de datos
            conn = new conexion().getConexion();
            
            // Configurar el PDF para que se descargue
            PdfWriter.getInstance(document, response.getOutputStream());
            document.open();
            
            // Título del documento
            Paragraph title = new Paragraph("REPORTE DE PROGRAMAS DE FORMACIÓN", TITLE_FONT);
            title.setAlignment(Element.ALIGN_CENTER);
            title.setSpacingAfter(20);
            title.getFont().setColor(BaseColor.GREEN);
            document.add(title);
            
            // Crear tabla con 6 columnas
            PdfPTable table = new PdfPTable(6);
            table.setWidthPercentage(100);
            table.setSpacingBefore(10f);
            table.setSpacingAfter(10f);
            
            // Encabezados de la tabla
            String[] headers = {
                "Código Programa", 
                "Nombre Programa", 
                "Duración Etapa Lectiva", 
                "Duración Etapa Productiva", 
                "Créditos", 
                "Horas"
            };
            
            for (String header : headers) {
                PdfPCell cell = new PdfPCell(new Phrase(header, HEADER_FONT));
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                cell.setPadding(5);
                table.addCell(cell);
            }
            
            // Consulta a la base de datos
            String sql = "SELECT codigoprograma, nombreprograma, duracionetapalectiva, " +
                        "duracionetapaproductiva, creditos, horas FROM tbl_programasformacion";
            
            pstmt = conn.prepareStatement(sql);
            resultSet = pstmt.executeQuery();
            
            // Llenar la tabla con los datos
            while (resultSet.next()) {
                table.addCell(createCell(resultSet.getString("codigoprograma")));
                table.addCell(createCell(resultSet.getString("nombreprograma")));
                table.addCell(createCell(resultSet.getString("duracionetapalectiva")));
                table.addCell(createCell(resultSet.getString("duracionetapaproductiva")));
                table.addCell(createCell(resultSet.getString("creditos")));
                table.addCell(createCell(resultSet.getString("horas")));
            }
            
            document.add(table);
            
            // Pie de página con fecha y hora
            Paragraph footer = new Paragraph("Reporte generado el: " + new java.util.Date(), NORMAL_FONT);
            footer.setAlignment(Element.ALIGN_RIGHT);
            footer.setSpacingBefore(20);
            document.add(footer);
            
            System.out.println("PDF creado exitosamente");
            
        } catch (DocumentException e) {
            System.err.println("Error al crear el documento PDF: " + e.getMessage());
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("Error en la consulta SQL: " + e.getMessage());
            e.printStackTrace();
        } catch (Exception e) {
            System.err.println("Error general: " + e.getMessage());
            e.printStackTrace();
        } finally {
            // Cerrar recursos
            if (document != null && document.isOpen()) {
                document.close();
            }
            try {
                if (resultSet != null) resultSet.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.err.println("Error al cerrar recursos: " + e.getMessage());
            }
        }
    }
    
    
    //Método auxiliar para crear celdas con formato consistente
    
		private PdfPCell createCell(String content) {
        PdfPCell cell = new PdfPCell(new Phrase(content != null ? content : "", NORMAL_FONT)); 
        cell.setPadding(5);
        return cell;
	
    }
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
