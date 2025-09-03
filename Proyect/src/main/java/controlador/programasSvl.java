package controlador;

import jakarta.mail.MessagingException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import conexion.conexion;
import DAO.programascrudDao;
import DAO.programasgs;
import controlador.Correo;



/**
 * Servlet implementation class programasSvl
 */
@WebServlet("/programasSvl")
public class programasSvl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 Correo enviarCorreo = new Correo();

	
	 private programascrudDao programascrudDao;
	 @Override
	    public void init() throws ServletException {
	        super.init();
	        programascrudDao = new programascrudDao();
	 }
    /**
     * @see HttpServlet#HttpServlet()
     */
    public programasSvl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String action = request.getParameter("action");
	        
	        if (action == null) {
	            action = "listar";
	        }
	        
	        try {
	            switch (action) {
	                case "editar":
	                    mostrarFormularioEdicion(request, response);
	                    break;
	                case "buscar":  
	                    buscarProgramas(request, response);
	                    break;
	             
	                case "eliminar":
	                    eliminarPrograma(request, response);
	                    break;
	                case "listar":
	                default:
	                    listarProgramas(request, response);
	                    break;
	            }
	        } catch (SQLException e) {
	            throw new ServletException("Error en la operación: " + e.getMessage(), e);
	        }
	    }
	
	//Buscador 
	private void buscarProgramas(HttpServletRequest request, HttpServletResponse response) 
	        throws SQLException, ServletException, IOException {
	    
	    String keyword = request.getParameter("keyword");
	    List<programasgs> programas = programascrudDao.buscarProgramas(keyword);
	    
	    request.setAttribute("programas", programas);
	    request.setAttribute("keyword", keyword); // Para mostrar en la vista
	    request.getRequestDispatcher("/listaProgramas.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String action = request.getParameter("action");
	        
	        if (action == null) {
	            action = "crear";
	        }
	        
	        try {
	            switch (action) {
	                case "crear":
	                    crearPrograma(request, response);
	                    break;
	                case "actualizar":
	                    actualizarPrograma(request, response);
	                    break;
	            }
	        } catch (SQLException e) {
	            throw new ServletException("Error en la operación: " + e.getMessage(), e);
	        }
	    }

	    private void listarProgramas(HttpServletRequest request, HttpServletResponse response) 
	            throws SQLException, ServletException, IOException {
	        
	        List<programasgs> programas = programascrudDao.obtenerTodosProgramas();
	        request.setAttribute("programas", programas);
	        request.getRequestDispatcher("/listaProgramas.jsp").forward(request, response);
	    }

	    private void crearPrograma(HttpServletRequest request, HttpServletResponse response) 
	            throws SQLException, IOException {
	        
	        PrintWriter out = response.getWriter();
	        
	        String codigoprograma = request.getParameter("codigoprograma");
	        String nombreprograma = request.getParameter("nombreprograma");
	        String duracionetapalectiva = request.getParameter("duracionetapalectiva");
	        String duracionetapaproductiva = request.getParameter("duracionetapaproductiva");
	        String creditos = request.getParameter("creditos");
	        String horas = request.getParameter("horas");

	        programasgs programa = new programasgs(codigoprograma, nombreprograma, 
	                duracionetapalectiva, duracionetapaproductiva, creditos, horas);

	        if (programascrudDao.insertarPrograma(programa)) {
	            response.sendRedirect(request.getContextPath() + "/programasSvl?action=listar");
	            try {
	            	
	            	enviarCorreo.EnviarCorreo("Actualización de lista", "Se ha añadido un nuevo programa de formación");//notificacion al correo
					
				} catch (MessagingException e) {
					
				}
	        } else {
	            out.println("Error al registrar el programa.");
	        }
	    }

	    private void mostrarFormularioEdicion(HttpServletRequest request, HttpServletResponse response) 
	            throws SQLException, ServletException, IOException {
	        
	        String codigo = request.getParameter("codigo");
	        programasgs programa = programascrudDao.obtenerProgramaPorCodigo(codigo);
	        
	        if (programa != null) {
	            request.setAttribute("programa", programa);
	            request.getRequestDispatcher("/editarPrograma.jsp").forward(request, response);
	        } else {
	            response.sendRedirect(request.getContextPath() + "/programasSvl?action=listar");
	        }
	    }

	    private void actualizarPrograma(HttpServletRequest request, HttpServletResponse response) 
	            throws SQLException, IOException {
	        
	        String codigoprograma = request.getParameter("codigoprograma");
	        String nombreprograma = request.getParameter("nombreprograma");
	        String duracionetapalectiva = request.getParameter("duracionetapalectiva");
	        String duracionetapaproductiva = request.getParameter("duracionetapaproductiva");
	        String creditos = request.getParameter("creditos");
	        String horas = request.getParameter("horas");

	        programasgs programa = new programasgs(codigoprograma, nombreprograma, 
	                duracionetapalectiva, duracionetapaproductiva, creditos, horas);

	        if (programascrudDao.actualizarPrograma(programa)) {
	            response.sendRedirect(request.getContextPath() + "/programasSvl?action=listar");
	        } else {
	            response.getWriter().println("Error al actualizar el programa.");
	        }
	    }

	    private void eliminarPrograma(HttpServletRequest request, HttpServletResponse response) 
	            throws SQLException, IOException {
	        
	        String codigo = request.getParameter("codigo");
	        
	        if (programascrudDao.eliminarPrograma(codigo)) {
	            response.sendRedirect(request.getContextPath() + "/programasSvl?action=listar");
	        } else {
	            response.getWriter().println("Error al eliminar el programa.");
	        }
	    }
	}
	

