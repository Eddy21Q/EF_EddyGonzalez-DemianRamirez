<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Lista de Turistas</title>
    <style>
        /* Estilos para la imagen de fondo */
        body {
            font-family: Arial, sans-serif;
            background: url('images/image9.jpg') no-repeat center center fixed; /* Imagen de fondo */
            background-size: cover; /* Hace que la imagen cubra toda la página */
            color: white; /* Color de texto blanco para mejor contraste */
            margin: 0;
            padding: 0;
        }

        /* Estilos para la tabla */
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: rgba(255, 255, 255, 0.85); /* Fondo blanco con opacidad para la tabla */
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 10px;
            text-align: center;
            color: #333; /* Color oscuro para el texto */
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        h2 {
            text-align: center;
            color: #fff; /* Color blanco para el título */
        }

        /* Estilo para los bordes de las celdas */
        td, th {
            border: 1px solid #ddd;
        }
    </style>
</head>
<body>

<h2>Lista de Turistas</h2>

<table>
    <tr>
        <th>Identificación</th>
        <th>Carné</th>
        <th>Primer Nombre</th>
        <th>Segundo Nombre</th>
        <th>Primer Apellido</th>
        <th>Segundo Apellido</th>
    </tr>

    <%
        // Variables de conexión
        Connection conn = null;
        CallableStatement stmt = null;
        ResultSet rs = null;

        try {
            // Conectar a la base de datos
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/administracionturismo", "root", "josueProgramacion2");

            // Llamada al procedimiento almacenado
            stmt = conn.prepareCall("{CALL MostrarTablaTuristas()}");
            rs = stmt.executeQuery();

            // Mostrar los datos en la tabla
            while (rs.next()) {
                String identificacion = rs.getString("identificacion");
                String carne = rs.getString("carne");
                String nombre1 = rs.getString("nombre1");
                String nombre2 = rs.getString("nombre2");
                String apellido1 = rs.getString("apellido1");
                String apellido2 = rs.getString("apellido2");

                %>
                <tr>
                    <td><%= identificacion %></td>
                    <td><%= carne %></td>
                    <td><%= nombre1 %></td>
                    <td><%= nombre2 %></td>
                    <td><%= apellido1 %></td>
                    <td><%= apellido2 %></td>
                </tr>
                <%
            }
        } catch (Exception e) {
            out.println("<p>Error al mostrar la tabla de turistas: " + e.getMessage() + "</p>");
        } finally {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    %>
</table>

</body>
</html>
