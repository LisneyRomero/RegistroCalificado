<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="conexion.conexion"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SGRCA - SENA</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        
        .header {
            background-color: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 20px;
            text-align: center;
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
        }
        
        .header h1 {
            color: white;
            font-size: 2.5em;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
            margin-bottom: 10px;
        }
        
        .header p {
            color: #e0e0e0;
            font-size: 1.2em;
        }
        
        .main-container {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px 20px;
        }
        
        .dashboard {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 15px;
            padding: 40px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
            text-align: center;
            max-width: 800px;
            width: 100%;
        }
        
        .dashboard h2 {
            color: #333;
            font-size: 2em;
            margin-bottom: 30px;
            border-bottom: 3px solid #667eea;
            padding-bottom: 10px;
        }
        
        .modules-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-top: 30px;
        }
        
        .module-card {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            text-decoration: none;
            color: #333;
            transition: all 0.3s ease;
            border: 2px solid transparent;
        }
        
        .module-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            border-color: #667eea;
        }
        
        .module-icon {
            font-size: 3em;
            margin-bottom: 15px;
            color: #667eea;
        }
        
        .module-title {
            font-size: 1.3em;
            font-weight: bold;
            margin-bottom: 10px;
            color: #333;
        }
        
        .module-description {
            color: #666;
            font-size: 0.9em;
        }
        
        .status-bar {
            background: rgba(255, 255, 255, 0.9);
            padding: 15px;
            margin-top: 30px;
            border-radius: 8px;
            border-left: 4px solid #4CAF50;
        }
        
        .status-connected {
            color: #4CAF50;
            font-weight: bold;
        }
        
        .status-disconnected {
            color: #f44336;
            font-weight: bold;
        }
        
        .footer {
            background-color: rgba(0, 0, 0, 0.8);
            color: white;
            text-align: center;
            padding: 20px;
            margin-top: auto;
        }
        
        @media (max-width: 768px) {
            .modules-grid {
                grid-template-columns: 1fr;
            }
            
            .dashboard {
                padding: 20px;
            }
            
            .header h1 {
                font-size: 2em;
            }
        }
    </style>
</head>
<body>
    <!-- Titulos -->
    <div class="header">
        <h1> Sistema de Gestion de Registro Calificado y Autoevaluacón del Centro de Formación</h1>
        <p>Plataforma integral para la administración de programas de formación</p>
    </div>
    
    <!-- contenedor principal -->
    <div class="main-container">
        <div class="dashboard">
            <h2>📊 Panel de Control</h2>
            
            <div class="modules-grid">
                <!-- Módulo de Programas -->
                <a href="programaForm.jsp" class="module-card">
                    <div class="module-icon">📚</div>
                    <div class="module-title">Gestión de Programas</div>
                    <div class="module-description">
                        Administre los programas de formación, registre nueva información 
                        y consulte los existentes en el sistema.
                    </div>
                </a>
                
               
            </div>
            <div class="modules-grid">
                <!-- Módulo de documentos -->
                <a href="programaForm.jsp" class="module-card">
                    <div class="module-icon">📖</div>
                    <div class="module-title">Gestion de Documentos</div>
                    <div class="module-description">
                        Documentos cargados por los usuarios
                    </div>
                </a>
                
               
            </div>
            
            <!-- conexión -->
            <div class="status-bar">
                <%
                conexion test = new conexion();
                if (!test.getConexion().isClosed()){
                    out.print("<span class='status-connected'>✅ Conectado a la base de datos MySQL</span>");
                } else {
                    out.print("<span class='status-disconnected'>❌ Error de conexión a MySQL</span>");
                }
                %>
                <br>
                <small>Sistema operativo: <%= System.getProperty("os.name") %></small>
            </div>
        </div>
    </div> 
    
    <!-- Footer -->
    <div class="footer">
        <p>© 2025 - Servicio Nacional de Aprendizaje SENA</p>
        <p>Sistema desarrollado para la gestión educativa</p>
    </div>
</body>
</html>