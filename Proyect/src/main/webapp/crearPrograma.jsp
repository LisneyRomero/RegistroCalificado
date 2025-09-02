<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nuevo Programa</title>
    <link rel="stylesheet" href="../style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }
        .form-contenedor {
            max-width: 600px;
            margin: 0 auto;
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
        }
        .title {
            font-size: 24px;
            font-weight: bold;
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }
        .button {
            padding: 12px 25px;
            margin: 10px 5px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            text-decoration: none;
            display: inline-block;
            text-align: center;
        }
        .button-primary {
            background-color: #4CAF50;
            color: white;
        }
        .button-secondary {
            background-color: #2196F3;
            color: white;
        }
        .button-warning {
            background-color: #ff9800;
            color: white;
        }
    </style>
</head>
<body>
    <div class="form-contenedor">
        <form class="form" action="programasSvl" method="POST">
            <input type="hidden" name="action" value="crear">
            
            <div class="title">➕ Nuevo Programa de Formación</div>
            
            <div class="input-group">
                <input required type="number" name="codigoprograma" id="codigoprograma" class="input">
                <label class="user-label" for="codigoprograma">Código del Programa</label>
            </div>
            <br>

            <div class="input-group">
                <input required type="text" name="nombreprograma" id="nombreprograma" maxlength="300" class="input">
                <label class="user-label" for="nombreprograma">Nombre del Programa</label>
            </div>
            <br>

            <div class="input-group">
                <input required type="number" name="duracionetapalectiva" id="duracionetapalectiva" class="input">
                <label class="user-label" for="duracionetapalectiva">Duración Etapa Lectiva (horas)</label>
            </div>
            <br>

            <div class="input-group">
                <input required type="number" name="duracionetapaproductiva" id="duracionetapaproductiva" class="input">
                <label class="user-label" for="duracionetapaproductiva">Duración Etapa Productiva (horas)</label>
            </div>
            <br>

            <div class="input-group">
                <input required type="number" name="creditos" id="creditos" class="input">
                <label class="user-label" for="creditos">Total de Créditos</label>
            </div>
            <br>

            <div class="input-group">
                <input required type="number" name="horas" id="horas" class="input">
                <label class="user-label" for="horas">Total de Horas</label>
            </div>
            <br>

            <div style="text-align: center;">
                <button type="submit" class="button button-primary">💾 Guardar Programa</button>
                <button type="reset" class="button button-warning">🧹 Limpiar Formulario</button>
                <a href="programasSvl?action=listar" class="button button-secondary">📋 Ver Programas</a>
                <a href="proyect.jsp" class="button button-secondary">🏠 Volver al Inicio</a>
            </div>
        </form>
    </div>
</body>
</html>