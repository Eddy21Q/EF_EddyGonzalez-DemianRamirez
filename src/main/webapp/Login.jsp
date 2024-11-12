<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    boolean isAuthenticated = false;

    if (username != null && password != null) {
        String jdbcUrl = "jdbc:mysql://localhost/administracionturismo";
        String dbUser = "root";
        String dbPassword = "josueProgramacion2";
        
        Connection conn = null;
        CallableStatement stmt = null;
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            stmt = conn.prepareCall("{CALL sp_verificarCredenciales(?, ?, ?)}");
            stmt.setString(1, username);
            stmt.setString(2, password);
            stmt.registerOutParameter(3, java.sql.Types.INTEGER);

            stmt.execute();

            int resultado = stmt.getInt(3);
            if (resultado == 1) {
                isAuthenticated = true;
                session.setAttribute("user", username);
                response.sendRedirect("PaginaMenu.jsp");
                return;
            } else {
                request.setAttribute("error", "Usuario o contraseña incorrectos.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stmt != null) try { stmt.close(); } catch (SQLException ignored) {}
            if (conn != null) try { conn.close(); } catch (SQLException ignored) {}
        }
    }

    String user = (String) session.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title><%= user == null ? "Iniciar Sesión" : "Página Principal" %></title>
    <!-- Importa Font Awesome para usar iconos -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            background-image: url('images/image2.jpg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }

        form {
            background: rgba(0, 0, 0, 0.7);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 255, 255, 0.6);
            max-width: 400px;
            width: 100%;
            display: none;
            color: white;
            position: relative;
        }

        form::before {
            content: "";
            position: absolute;
            top: -5px;
            left: -5px;
            right: -5px;
            bottom: -5px;
            background: linear-gradient(45deg, cyan, magenta);
            z-index: -1;
            border-radius: 10px;
            filter: blur(15px);
        }

        form h1 {
            font-size: 24px;
            margin-bottom: 20px;
            color: cyan;
        }

        label {
            display: block;
            margin: 10px 0 5px;
            color: #ddd;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px 35px 10px 10px; /* Espacio adicional para el ícono */
            margin: 5px 0 10px;
            border: 1px solid #333;
            border-radius: 3px;
            background-color: #222;
            color: #ddd;
            box-sizing: border-box; /* Asegura que el padding no cause desbordamiento */
        }

        input[type="text"]::placeholder,
        input[type="password"]::placeholder {
            color: #888;
        }

        button {
            background: linear-gradient(90deg, #007BFF, #00FFDD);
            color: white;
            padding: 10px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }
        
        button i {
            font-size: 1.2em;
        }

        /* Estilo para el spinner */
        .loading-icon {
            display: none;
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }

        .error-message {
            color: red;
            margin-top: 10px;
            font-weight: bold;
        }

        .container {
            text-align: center;
            background-color: rgba(0, 0, 0, 0.8);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 255, 255, 0.2);
            display: none;
            color: white;
        }

        /* Estilo para el ícono del ojo */
        .toggle-password {
            position: absolute;
            right: 10px; /* Ajuste para que el ícono quede alineado */
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: #ddd;
        }
    </style>
    <script>
        function mostrarCargando() {
            const boton = document.getElementById('loginButton');
            const textoBoton = document.getElementById('loginText');
            const spinner = document.getElementById('spinnerIcon');
            textoBoton.style.display = 'none';
            spinner.style.display = 'inline-block';
            boton.disabled = true; // Desactiva el botón mientras se envía el formulario
        }

        // Función para mostrar y ocultar la contraseña
        function togglePassword() {
            const passwordField = document.getElementById('password');
            const eyeIcon = document.getElementById('eyeIcon');
            if (passwordField.type === "password") {
                passwordField.type = "text";
                eyeIcon.classList.remove("fa-eye-slash");
                eyeIcon.classList.add("fa-eye");
            } else {
                passwordField.type = "password";
                eyeIcon.classList.remove("fa-eye");
                eyeIcon.classList.add("fa-eye-slash");
            }
        }
    </script>
</head>
<body>
    <%
        if (user == null) {
    %>
        <form action="Login.jsp" method="post" style="display: block;" onsubmit="mostrarCargando()">
            <h1>Iniciar Sesión</h1>
            <label for="username">Usuario:</label>
            <input type="text" id="username" name="username" placeholder="Ingrese su usuario" required>
            
            <label for="password">Contraseña:</label>
            <div style="position: relative;">
                <input type="password" id="password" name="password" placeholder="Ingrese su contraseña" required>
                <i id="eyeIcon" class="fas fa-eye-slash toggle-password" onclick="togglePassword()"></i>
            </div>
            
            <!-- Botón con indicador de carga -->
            <button type="submit" id="loginButton">
                <span id="loginText"><i class="fas fa-sign-in-alt"></i> Iniciar Sesión</span>
                <i id="spinnerIcon" class="fas fa-spinner loading-icon"></i>
            </button>
            
            <% 
                String error = (String) request.getAttribute("error"); 
                if (error != null) { 
            %>
                <p class="error-message"><%= error %></p>
            <% } %>
        </form>
    <%
        } else {
    %>
        <div class="container" style="display: block;">
            <h1>Bienvenido, <%= user %>!</h1>
        </div>
    <%
        }
    %>
</body>
</html>
