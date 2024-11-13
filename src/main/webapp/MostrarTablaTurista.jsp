<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Lista de Turistas</title>
    <style>
        /* Fondo y fuente */
        body {
            font-family: Arial, sans-serif;
            background: url('images/image9.jpg') no-repeat center center fixed;
            background-size: cover;
            color: white;
            margin: 0;
            padding: 0;
        }

        h2 {
            text-align: center;
            color: #fff;
            margin-top: 20px;
        }

        /* Tabla estilizada */
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: rgba(255, 255, 255, 0.85);
        }

        th, td {
            padding: 12px;
            text-align: center;
            color: #333;
            border: 1px solid #ddd;
        }

        /* Efecto de borde animado en encabezados */
        th {
            background-color: #4CAF50;
            color: white;
            position: relative;
            overflow: hidden;
        }

        /* Borde animado y resplandor */
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

        /* Fila alternada */
        tr:nth-child(even) {
            background-color: rgba(242, 242, 242, 0.8);
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
        Connection conn = null;
        CallableStatement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/administracionturismo", "root", "josueProgramacion2");
            stmt = conn.prepareCall("{CALL MostrarTablaTuristas()}");
            rs = stmt.executeQuery();

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
