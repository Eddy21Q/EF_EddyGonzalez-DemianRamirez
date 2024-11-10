<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Modificar Datos de Guía</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* Estilos generales */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: url('images/image12.jpg') no-repeat center center fixed;
            background-size: cover; /* Ajusta la imagen de fondo al tamaño de la pantalla */
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: rgba(255, 255, 255, 0.9); /* Fondo blanco con opacidad para ver la imagen detrás */
            border-radius: 12px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 480px;
            padding: 40px;
            box-sizing: border-box;
        }
        h2 {
            color: #333;
            text-align: center;
            font-size: 26px;
            margin-bottom: 30px;
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
            margin-bottom: 10px;
        }
        .form-group input {
            padding: 14px;
            padding-left: 42px;
            font-size: 15px;
            border: 1px solid #ddd;
            border-radius: 8px;
            width: 100%;
            background-color: #f9f9f9;
            transition: border-color 0.3s ease;
            box-sizing: border-box;
        }
        .form-group i {
            position: absolute;
            left: 12px;
            top: 50%;
            transform: translateY(-50%);
            color: #888;
        }
        .form-group input:focus {
            border-color: #4CAF50;
            background-color: #fff;
        }
        .button {
            background-color: #28a745;
            color: white;
            padding: 14px;
            font-size: 16px;
            border: none;
            border-radius: 8px;
            width: 100%;
            cursor: pointer;
            transition: background-color 0.3s ease;
            box-sizing: border-box;
        }
        .button:hover {
            background-color: #218838;
        }
        .message {
            margin-top: 20px;
            text-align: center;
            font-weight: bold;
        }
        .message.error {
            color: #e74c3c;
        }
        .message.success {
            color: #2ecc71;
        }
        .form-group input:focus,
        .button:focus {
            outline: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2><i class="fas fa-user-edit"></i> Modificar Datos de Guía</h2>
        <form action="ModificarGuia.jsp" method="post">
            <div class="form-group">
                <label for="carne">Carné:</label>
                <i class="fas fa-id-card"></i>
                <input type="text" id="carne" name="carne" required>
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
                String carne = request.getParameter("carne");
                String nombre1 = request.getParameter("nombre1");
                String nombre2 = request.getParameter("nombre2");
                String apellido1 = request.getParameter("apellido1");
                String apellido2 = request.getParameter("apellido2");

                Connection conn = null;
                CallableStatement stmt = null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/administracionturismo", "root", "josueProgramacion2");
                    stmt = conn.prepareCall("{CALL ModificarDatosGuia(?, ?, ?, ?, ?)}");
                    stmt.setString(1, carne);
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
