<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.CallableStatement, java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // Datos de conexión
    String url = "jdbc:mysql://localhost:3306/administracionturismo"; // Cambia el puerto y el nombre de la base de datos si es necesario
    String username = "root";  // Reemplaza con tu nombre de usuario de MySQL
    String password = "josueProgramacion2";  // Reemplaza con tu contraseña de MySQL

    Connection connection = null;
    CallableStatement callableStatement = null;
    ResultSet resultSet = null;

    try {
        // Cargar el controlador JDBC para MySQL
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establecer la conexión
        connection = DriverManager.getConnection(url, username, password);

        // Llamar al procedimiento almacenado "MostrarTablaGuias"
        String query = "{CALL MostrarTablaGuias()}";
        callableStatement = connection.prepareCall(query);
        resultSet = callableStatement.executeQuery();
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Mostrar Guías</title>
    <style>
        /* Estilos generales */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: url('images/image1.jpg') no-repeat center center fixed; /* Imagen de fondo */
            background-size: cover;
            color: #333;
        }

        /* Estilo del spinner de carga */
        .loader {
            border: 8px solid #f3f3f3;
            border-top: 8px solid #2E8B57;
            border-radius: 50%;
            width: 60px;
            height: 60px;
            animation: spin 1s linear infinite;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        /* Animación del spinner */
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        /* Ocultar el loader después de cargar la página */
        .loader-hidden {
            display: none;
        }

        /* Contenedor principal */
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9); /* Fondo blanco con transparencia */
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        h1 {
            text-align: center;
            color: #2E8B57; /* Verde */
            margin-bottom: 20px;
        }

        /* Tabla estilizada */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        /* Borde animado y resplandor en encabezados */
        th {
            background-color: #2E8B57;
            color: white;
            padding: 12px;
            position: relative;
            overflow: hidden;
        }

        /* Borde animado */
        th::before {
            content: "";
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            border-top: 2px solid rgba(255, 255, 255, 0.5);
            border-bottom: 2px solid rgba(255, 255, 255, 0.5);
            animation: borderMove 2s linear infinite;
        }

        @keyframes borderMove {
            0% { left: -100%; }
            50% { left: 100%; }
            100% { left: -100%; }
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        /* Estilo para el mensaje de error */
        .error-message {
            color: #ff0000;
            text-align: center;
            font-weight: bold;
        }
    </style>
    <script>
        // Oculta el loader cuando la página está completamente cargada
        window.onload = function() {
            document.querySelector('.loader').classList.add('loader-hidden');
        };
    </script>
</head>
<body>
    <!-- Spinner de carga -->
    <div class="loader"></div>

    <!-- Contenido principal -->
    <div class="container">
        <h1>Listado de Guías</h1>
        <table>
            <tr>
                <th>Carne</th>
                <th>Nombre 1</th>
                <th>Nombre 2</th>
                <th>Apellido 1</th>
                <th>Apellido 2</th>
            </tr>
            <%
                while (resultSet.next()) {
            %>
            <tr>
                <td><%= resultSet.getString("carne") %></td>
                <td><%= resultSet.getString("nombre1") %></td>
                <td><%= resultSet.getString("nombre2") %></td>
                <td><%= resultSet.getString("apellido1") %></td>
                <td><%= resultSet.getString("apellido2") %></td>
            </tr>
            <%
                }
            %>
        </table>
    </div>

<%
    } catch (Exception e) {
        out.println("<p class='error-message'>Error al conectar a la base de datos: " + e.getMessage() + "</p>");
    } finally {
        if (resultSet != null) resultSet.close();
        if (callableStatement != null) callableStatement.close();
        if (connection != null) connection.close();
    }
%>

</body>
</html>
