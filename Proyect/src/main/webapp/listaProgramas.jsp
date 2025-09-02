<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, DAO.programasgs" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Programas</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #23554A;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #ddd;
        }
        .btn {
            padding: 5px 10px;
            text-decoration: none;
            border-radius: 4px;
            margin: 2px;
            display: inline-block;
        }
        .btn-editar {
            background-color:#2394D5;
            color: white;
        }
        .btn-eliminar {
            background-color: #D52341 ;
            color: white;
        }
        .btn-nuevo {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            margin-bottom: 20px;
        }
        .btn-cancelar {
            background-color: #ff9800;
            color: white;
        }
        .btn-buscar {
            background-color: #4CAF50;
            color: white;
        }
        .btn-ver {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            margin-bottom: 20px;
        }
        .action-buttons {
            text-align: center;
        }
        .message {
            padding: 10px;
            margin: 10px 0;
            border-radius: 4px;
        }
        .success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }
        .error {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
           }
        .buscar{
        display:flex;
        }
        .form{
        display:flex;
       	
        }
            
        
    </style>
</head>
<body>
    <div class="container" >
        <h1> Programas de Formación</h1>
   
 
        <% String message = (String) request.getAttribute("message"); %>
        <% if (message != null) { %>
            <div class="message success"><%= message %></div>
        <% } %>
        
        <% String error = (String) request.getAttribute("error"); %>
        <% if (error != null) { %>
            <div class="message error"><%= error %></div>
        <% } %>
        
        <a href="programaForm.jsp" class="btn btn-nuevo"> Nuevo Programa</a>
        <a href="proyect.jsp" class="btn btn-cancelar">Volver al Inicio</a>
                      
        <br><br>
        
        <div class="buscar">
    <form action="programasSvl" method="GET" class="form"> 
        <input type="hidden" name="action" value="buscar">
        <input type="text" name="keyword" placeholder="Buscar por nombre o código">
        <input class="btn btn-buscar" type="submit" value="Buscar">
    </form>   
</div>
 <%
String keyword = (String) request.getAttribute("keyword");
if (keyword != null && !keyword.isEmpty()) {
%>
    <div class="resultado-busqueda">
        <p>Resultados de búsqueda para: <strong><%= keyword %></strong></p>
        <a href="programasSvl?action=listar" class="btn btn-ver">Ver todos los programas</a>
    </div>
<%
}
%>
        
        <table>
            <thead>
                <tr>
                    <th>Código</th>
                    <th>Nombre del Programa</th>
                    <th>Duración Lectiva (horas)</th>
                    <th>Duración Productiva (horas)</th>
                    <th>Créditos</th>
                    <th>Horas</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <% 
                List<programasgs> programas = (List<programasgs>) request.getAttribute("programas");
                if (programas != null && !programas.isEmpty()) {
                    for (programasgs programa : programas) {
                %>
                <tr>
                    <td><strong><%= programa.getCodigoprograma() %></strong></td>
                    <td><%= programa.getNombreprograma() %></td>
                    <td><%= programa.getDuracionetapalectiva() %></td>
                    <td><%= programa.getDuracionetapaproductiva() %></td>
                    <td><%= programa.getCreditos() %></td>
                    <td><%= programa.getHoras() %></td>
                    <td class="action-buttons">
                        <a href="programasSvl?action=editar&codigo=<%= programa.getCodigoprograma() %>" 
                           class="btn btn-editar">✏️ Editar</a>
                        <a href="programasSvl?action=eliminar&codigo=<%= programa.getCodigoprograma() %>" 
                           class="btn btn-eliminar" 
                           onclick="return confirm('¿Está seguro de eliminar el programa <%= programa.getNombreprograma() %>?')">🗑️ Eliminar</a>
                    </td>
                </tr>
                <% 
                    }
                } else {
                %>
                <tr>
                    <td colspan="7" style="text-align: center; color: #666;">
                        No hay programas de formación registrados
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
        
        <br>
        <div style="text-align: center;">
            <a href="programaForm.jsp" class="btn btn-nuevo">➕ Agregar Nuevo Programa</a>
            <a href="GenerarPdfSvl" class="btn btn-nuevo" target="_blank">➕ Generar PDF</a>
        </div>
    </div>
</body>
</html>