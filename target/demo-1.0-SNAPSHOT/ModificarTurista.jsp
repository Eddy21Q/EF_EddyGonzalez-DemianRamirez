<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Modificar Datos de Turista</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* Estilos generales */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: url('images/image11.jpg') no-repeat center center fixed; /* Ruta a la imagen de fondo */
            background-size: cover; /* Asegura que la imagen cubra toda la página */
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: white; /* Ajusta el color de texto para que sea legible sobre el fondo */
        }
        .container {
            background-color: rgba(255, 255, 255, 0.8); /* Fondo semitransparente para el formulario */
            border-radius: 10px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px; /* Ajuste de tamaño del contenedor */
            padding: 30px;
            box-sizing: border-box; /* Asegura que el padding no desborde el contenedor */
        }
        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
            font-size: 24px;
        }
        .form-group {
            display: flex;
            flex-direction: column;
            margin-bottom: 1.5rem;
            position: relative;
        }
        .form-group label {
            font-size: 14px;
            font-weight: 600;
            color: #555;
            margin-bottom: 8px;
        }
        .form-group input {
            padding: 12px;
            padding-left: 36px;
            font-size: 14px;
            border: 1px solid #ddd;
            border-radius: 8px;
            width: 100%; /* Asegura que el campo de entrada ocupe todo el ancho */
            background-color: #f9f9f9;
            box-sizing: border-box; /* Asegura que el padding no desborde */
        }
        .form-group i {
            position: absolute;
            left: 10px;
            top: 50%;
            transform: translateY(-50%);
            color: #888;
        }
        .button {
            background-color: #4CAF50;
            color: white;
            padding: 12px;
            font-size: 16px;
            border: none;
            border-radius: 8px;
            width: 100%;
            cursor: pointer;
            transition: background-color 0.3s ease;
            box-sizing: border-box;
        }
        .button:hover {
            background-color: #45a049;
        }
        .message {
            margin-top: 20px;
            text-align: center;
            font-weight: bold;
        }
        .message.error {
            color: #ff3b30;
        }
        .message.success {
            color: #28a745;
        }
        .form-group input:focus {
            border-color: #4CAF50;
            background-color: #fff;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2><i class="fas fa-user-edit"></i> Modificar Datos de Turista</h2>
        <form action="ModificarTurista.jsp" method="post">
            <div class="form-group">
                <label for="identificacion">Identificación:</label>
                <i class="fas fa-id-card"></i>
                <input type="text" id="identificacion" name="identificacion" required>
            </div>
            <div class="form-group">
                <label for="nombre1">Primer Nombre:</label>
                <i class="fas fa-user"></i>
                <input type="text" id="nombre1" name="nombre1" required>
            </div>
            <div class="form-group">
                <label for="nombre2">Segundo Nombre:</label>
                <i class="fas fa-user"></i>
                <input type="text" id="nombre2" name="nombre2">
            </div>
            <div class="form-group">
                <label for="apellido1">Primer Apellido:</label>
                <i class="fas fa-user-tag"></i>
                <input type="text" id="apellido1" name="apellido1" required>
            </div>
            <div class="form-group">
                <label for="apellido2">Segundo Apellido:</label>
                <i class="fas fa-user-tag"></i>
                <input type="text" id="apellido2" name="apellido2">
            </div>
            <button type="submit" class="button"><i class="fas fa-save"></i> Modificar</button>
        </form>

        <%
            if (request.getMethod().equalsIgnoreCase("POST")) {
                String identificacion = request.getParameter("identificacion");
                String nombre1 = request.getParameter("nombre1");
                String nombre2 = request.getParameter("nombre2");
                String apellido1 = request.getParameter("apellido1");
                String apellido2 = request.getParameter("apellido2");

                Connection conn = null;
                CallableStatement stmt = null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/administracionturismo", "root", "josueProgramacion2");
                    stmt = conn.prepareCall("{CALL ModificarDatosTurista(?, ?, ?, ?, ?)}");
                    stmt.setString(1, identificacion);
                    stmt.setString(2, nombre1);
                    stmt.setString(3, nombre2);
                    stmt.setString(4, apellido1);
                    stmt.setString(5, apellido2);

                    int filasModificadas = stmt.executeUpdate();
                    if (filasModificadas > 0) {
                        out.println("<p class='message success'>Registro modificado con éxito.</p>");
                    } else {
                        out.println("<p class='message error'>Error al modificar el registro.</p>");
                    }
                } catch (Exception e) {
                    out.println("<p class='message error'>Error: " + e.getMessage() + "</p>");
                } finally {
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                }
            }
        %>
    </div>
</body>
</html>
