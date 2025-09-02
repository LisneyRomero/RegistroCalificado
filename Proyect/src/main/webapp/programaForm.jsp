<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrar Nuevo Programa</title>
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
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        
        .form-contenedor {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 15px;
            padding: 40px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 600px;
            backdrop-filter: blur(10px);
        }
        
        .title {
            font-size: 28px;
            font-weight: bold;
            color: #333;
            text-align: center;
            margin-bottom: 30px;
            border-bottom: 3px solid #667eea;
            padding-bottom: 15px;
        }
        
        .input-group {
            position: relative;
            margin-bottom: 25px;
        }
        
        .input {
            width: 100%;
            padding: 15px;
            border: 2px solid #ddd;
            border-radius: 8px;
            font-size: 16px;
            background: white;
            transition: all 0.3s ease;
        }
        
        .input:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 10px rgba(102, 126, 234, 0.3);
        }
        
        .user-label {
            position: absolute;
            left: 15px;
            top: 15px;
            color: #666;
            pointer-events: none;
            transition: all 0.3s ease;
            background: white;
            padding: 0 5px;
        }
        
        .input:focus ~ .user-label,
        .input:valid ~ .user-label {
            top: -10px;
            left: 10px;
            font-size: 12px;
            color: #667eea;
            font-weight: bold;
        }
        
        .button {
            padding: 15px 30px;
            margin: 10px 5px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
            text-align: center;
            min-width: 120px;
        }
        
        .button-primary {
            background: linear-gradient(135deg, #4CAF50 0%, #45a049 100%);
            color: white;
        }
        
        .button-primary:hover {
            background: linear-gradient(135deg, #45a049 0%, #3d8b40 100%);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(76, 175, 80, 0.4);
        }
        
        .button-warning {
            background: linear-gradient(135deg, #ff9800 0%, #f57c00 100%);
            color: white;
        }
        
        .button-warning:hover {
            background: linear-gradient(135deg, #f57c00 0%, #ef6c00 100%);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 152, 0, 0.4);
        }
        
        .button-secondary {
            background: linear-gradient(135deg, #2196F3 0%, #1976D2 100%);
            color: white;
        }
        
        .button-secondary:hover {
            background: linear-gradient(135deg, #1976D2 0%, #1565C0 100%);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(33, 150, 243, 0.4);
        }
        
        .button-danger {
            background: linear-gradient(135deg, #f44336 0%, #d32f2f 100%);
            color: white;
        }
        
        .button-danger:hover {
            background: linear-gradient(135deg, #d32f2f 0%, #c62828 100%);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(244, 67, 54, 0.4);
        }
        
        .button-container {
            text-align: center;
            margin-top: 30px;
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 10px;
        }
        
        .form-header {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .form-icon {
            font-size: 3em;
            color: #667eea;
            margin-bottom: 10px;
        }
        
        .input-hint {
            font-size: 12px;
            color: #666;
            margin-top: 5px;
            display: block;
        }
        
        @media (max-width: 768px) {
            .form-contenedor {
                padding: 20px;
            }
            
            .button-container {
                flex-direction: column;
            }
            
            .button {
                width: 100%;
                margin: 5px 0;
            }
        }
        
        /* Mensajes de error */
        .error-message {
            background-color: #ffebee;
            color: #c62828;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
            border-left: 4px solid #f44336;
            display: none;
        }
        
        .success-message {
            background-color: #e8f5e8;
            color: #2e7d32;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
            border-left: 4px solid #4CAF50;
            display: none;
        }
    </style>
</head>
<body>
    <div class="form-contenedor">
        <div class="form-header">
            <div class="form-icon">📚</div>
            <h1 class="title">Nuevo Programa de Formación</h1>
        </div>
        
        <!-- Mensajes de error/success -->
        <div id="errorMessage" class="error-message"></div>
        <div id="successMessage" class="success-message"></div>
        
        <form class="form" action="programasSvl" method="POST" onsubmit="return validarFormulario()">
            <input type="hidden" name="action" value="crear">
            
            <div class="input-group">
                <input required type="number" name="codigoprograma" id="codigoprograma" class="input">
                <label class="user-label" for="codigoprograma">Código del Programa</label>
                <span class="input-hint">Número único identificador del programa</span>
            </div>
            
            <div class="input-group">
                <input required type="text" name="nombreprograma" id="nombreprograma" maxlength="300" class="input">
                <label class="user-label" for="nombreprograma">Nombre del Programa</label>
                <span class="input-hint">Ej: Técnico en Programación de Software</span>
            </div>
            
            <div class="input-group">
                <input required type="number" name="duracionetapalectiva" id="duracionetapalectiva" 
                       class="input" min="1" max="2000">
                <label class="user-label" for="duracionetapalectiva">Duración Etapa Lectiva</label>
                <span class="input-hint">Duración en horas</span>
            </div>
            
            <div class="input-group">
                <input required type="number" name="duracionetapaproductiva" id="duracionetapaproductiva"
                       class="input" min="1" max="2000">
                <label class="user-label" for="duracionetapaproductiva">Duración Etapa Productiva</label>
                <span class="input-hint">Duración en horas</span>
            </div>
            
            <div class="input-group">
                <input required type="number" name="creditos" id="creditos" 
                       class="input" min="1" max="2000">
                <label class="user-label" for="creditos">Total de Créditos</label>
                <span class="input-hint">Número total de créditos académicos</span>
            </div>
            
            <div class="input-group">
                <input required type="number" name="horas" id="horas" 
                       class="input" min="1" max="5000">
                <label class="user-label" for="horas">Total de Horas</label>
                <span class="input-hint">Horas totales del programa</span>
            </div>
            
            
            <div class="button-container">
                <button type="submit" class="button button-primary">💾 Guardar Programa</button>
                <button type="reset" class="button button-warning">🧹 Limpiar</button>
                <a href="programasSvl?action=listar" class="button button-secondary">📋 Ver Programas</a>
                <a href="proyect.jsp" class="button button-danger">🏠 Volver al Inicio</a>
            </div>
        </form>
    </div>
    
    <script>
        function validarFormulario() {
            const codigo = document.getElementById('codigoprograma').value;
            const nombre = document.getElementById('nombreprograma').value;
            const horasLectiva = document.getElementById('duracionetapalectiva').value;
            const horasProductiva = document.getElementById('duracionetapaproductiva').value;
            const creditos = document.getElementById('creditos').value;
            const horasTotales = document.getElementById('horas').value;
            
            const errorMessage = document.getElementById('errorMessage');
            errorMessage.style.display = 'none';
            
            // Validaciones
            if (codigo <= 0) {
                mostrarError('El código del programa debe ser mayor a 0');
                return false;
            }
            
            if (nombre.trim().length < 5) {
                mostrarError('El nombre del programa debe tener al menos 5 caracteres');
                return false;
            }
            
            if (horasLectiva < 10 || horasLectiva > 2000) {
                mostrarError('Las horas lectivas deben estar entre 10 y 2000 horas');
                return false;
            }
            
            if (horasProductiva < 10 || horasProductiva > 2000) {
                mostrarError('Las horas productivas deben estar entre 10 y 2000 horas');
                return false;
            }
            
            if (creditos < 1 || creditos > 2000) {
                mostrarError('Los créditos deben estar entre 1 y 2000');
                return false;
            }
            
            if (horasTotales < 10 || horasTotales > 5000) {
                mostrarError('Las horas totales deben estar entre 10 y 5000 horas');
                return false;
            }
            
             //Validar que horas totales sea mayor o igual a la suma de etapas
            const sumaEtapas = parseInt(horasLectiva) + parseInt(horasProductiva);
            if (parseInt(horasTotales) < sumaEtapas) {
                mostrarError('Las horas totales no pueden ser menores que la suma de horas lectivas + productivas');
                return false;
            }
            
            return true;
        }
        
        function mostrarError(mensaje) {
            const errorMessage = document.getElementById('errorMessage');
            errorMessage.textContent = mensaje;
            errorMessage.style.display = 'block';
            
            // Scroll to error
            errorMessage.scrollIntoView({ behavior: 'smooth' });
        }
        
        // Auto-calcular horas totales
        document.getElementById('duracionetapalectiva').addEventListener('input', calcularHorasTotales);
        document.getElementById('duracionetapaproductiva').addEventListener('input', calcularHorasTotales);
        
        function calcularHorasTotales() {
            const horasLectiva = parseInt(document.getElementById('duracionetapalectiva').value) || 0;
            const horasProductiva = parseInt(document.getElementById('duracionetapaproductiva').value) || 0;
            const horasTotales = horasLectiva + horasProductiva;
            
            if (horasTotales > 0) {
                document.getElementById('horas').value = horasTotales;
            }
        }
        
        // Mostrar mensaje de éxito si viene por parámetro
        const urlParams = new URLSearchParams(window.location.search);
        if (urlParams.has('success')) {
            const successMessage = document.getElementById('successMessage');
            successMessage.textContent = '✅ Programa registrado exitosamente';
            successMessage.style.display = 'block';
            setTimeout(() => {
                successMessage.style.display = 'none';
            }, 5000);
        }
        
        // Auto-focus en el primer campo
        document.getElementById('codigoprograma').focus();
    </script>
</body>
</html>