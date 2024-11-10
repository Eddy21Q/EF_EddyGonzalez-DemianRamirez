<%@ page import="java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Eliminar Turista</title>
    <style>
        /* Estilos generales */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background: url('images/iamge14.jpg') no-repeat center center fixed; /* Imagen de fondo */
            background-size: cover;
            color: #333;
        }

        /* Contenedor principal */
        .container {
            max-width: 600px;
            margin: 100px auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
        }

        /* Título */
        h2 {
            text-align: center;
            color: #2E8B57; /* Verde */
            margin-bottom: 20px;
        }

        /* Estilos para el formulario */
        form {
            display: flex;
            flex-direction: column;
        }

        label {
            font-weight: bold;
            margin-bottom: 5px;
        }

        input[type="number"] {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        /* Botón de eliminación */
        .button {
            background-color: #E74C3C; /* Rojo */
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .button:hover {
            background-color: #C0392B; /* Rojo oscuro al pasar el ratón */
        }

        /* Mensajes de éxito o error */
        .message {
            text-align: center;
            margin-top: 20px;
            font-weight: bold;
        }

        .error {
            color: #ff0000;
        }

        .success {
            color: #28a745;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Eliminar Turista</h2>
        <form action="EliminarTurista.jsp" method="post">
            <label for="identificacion">Identificación del Turista:</label>
            <input type="number" id="identificacion" name="identificacion" required>

            <button type="submit" class="button">Eliminar</button>
        </form>

        <%
            // Solo se ejecuta cuando se envían datos desde el formulario
            if (request.getMethod().equalsIgnoreCase("POST")) {
                int identificacion = Integer.parseInt(request.getParameter("identificacion"));

                // Conectar a la base de datos
                Connection conn = null;
                CallableStatement stmt = null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/administracionturismo", "root", "josueProgramacion2");

                    // Llama al procedimiento almacenado
                    stmt = conn.prepareCall("{CALL EliminarTurista(?)}");
                    stmt.setInt(1, identificacion);

                    int filasEliminadas = stmt.executeUpdate();
                    if (filasEliminadas > 0) {
                        out.println("<p class='message success'>Turista eliminado con éxito.</p>");
                    } else {
                        out.println("<p class='message error'>Error al eliminar el turista.</p>");
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
