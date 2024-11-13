<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String user = (String) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Turismo Nacional</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <style>
        /* Estilos generales */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #0a0a0a; /* Fondo gris oscuro */
            color: #fff;
            transition: background-color 4s ease;
        }

        /* Estilo para el header */
        header {
            background: linear-gradient(90deg, rgba(0, 123, 255, 1) 0%, rgba(0, 204, 255, 1) 100%);
            color: white;
            padding: 15px 0;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            margin-bottom: 20px;
        }

        header nav {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 20px;
        }

        header nav a {
            color: white;
            text-decoration: none;
            font-size: 18px;
            text-transform: uppercase;
            transition: color 0.3s ease;
        }

        header nav a:hover {
            color: #00ffcc;
        }

        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #333;
            min-width: 160px;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .dropdown-content a {
            color: white;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            transition: background-color 0.3s ease;
        }

        .dropdown-content a:hover {
            background-color: #0056b3;
        }

        /* Galería */
        .gallery {
            display: flex;
            overflow-x: scroll;
            padding: 20px 0;
            scroll-behavior: smooth;
            gap: 10px;
            margin-bottom: 40px;
        }

        .gallery-item {
            flex: 0 0 auto;
            width: 60%;
            max-height: 300px;
            border-radius: 10px;
            box-shadow: none;
        }

        .gallery-item img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 10px;
        }

        .gallery::-webkit-scrollbar {
            height: 8px;
        }

        .gallery::-webkit-scrollbar-thumb {
            background: #007bff;
            border-radius: 4px;
        }

        .gallery::-webkit-scrollbar-track {
            background: #f1f1f1;
        }

        /* Paquetes turísticos */
        .packages {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            padding: 30px;
            gap: 30px;
        }

        .package {
            width: 30%;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            transition: transform 0.3s ease-in-out;
        }

        .package img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 10px;
        }

        .package:hover {
            transform: scale(1.03);
        }

        .package .content {
            padding: 20px;
            text-align: center;
        }

        .package .content h3 {
            font-size: 22px;
            margin-bottom: 10px;
            color: #00ffcc;
        }

        .package .content p {
            font-size: 16px;
            color: #ddd;
        }

        .package .content a {
            display: inline-block;
            margin-top: 15px;
            padding: 10px 20px;
            background-color: #0056b3;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .package .content a:hover {
            background-color: #00cc99;
        }

        /* Footer */
        footer {
            background: linear-gradient(135deg, #343a40, #007bff);
            color: white;
            padding: 20px;
            text-align: center;
            border-radius: 10px;
            margin-top: 40px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        footer a {
            color: #00ffcc;
            text-decoration: none;
        }

        footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <!-- Menú superior -->
    <header>
        <nav>
            <a href="PaginaMenu.jsp">Inicio</a>
            <a href="Paquetes.jsp">Paquetes</a>
            <a href="Hoteles.jsp">Hoteles</a>
            <a href="Contacto.jsp">Contacto</a>
            <a href="AcercaDe.jsp">Acerca de</a>

            <div class="dropdown">
                <a href="javascript:void(0)">Mantenimiento de Tablas</a>
                <div class="dropdown-content">
                    <a href="MantenimientoGuias.jsp?tipo=guia">Tabla Guias</a>
                    <a href="MantenimientoTuristas.jsp?tipo=turista">Tabla Turistas</a>
                </div>
            </div>
        </nav>
    </header>

    <!-- Galería de imágenes -->
    <div class="gallery">
        <div class="gallery-item"><img src="images/image18.jpg" alt="Destino 1"></div>
        <div class="gallery-item"><img src="images/image19.jpg" alt="Destino 2"></div>
        <div class="gallery-item"><img src="images/image20.jpg" alt="Destino 3"></div>
        <div class="gallery-item"><img src="images/image21.jpg" alt="Destino 4"></div>
        <div class="gallery-item"><img src="images/image22.jpg" alt="Destino 5"></div>
    </div>

    <!-- Paquetes turísticos -->
    <div class="packages">
        <div class="package">
            <img src="images/image17.jpg" alt="Paquete Aventura">
            <div class="content">
                <h3>Paquete Aventura</h3>
                <p>Explora las montañas y disfruta de un trekking único.</p>
                <a href="PaqueteAventura.jsp">Ver Más</a>
            </div>
        </div>

        <div class="package">
            <img src="images/image15.jpg" alt="Paquete Relax">
            <div class="content">
                <h3>Paquete Relax</h3>
                <p>Disfruta de un tiempo relajante en la playa con todo incluido.</p>
                <a href="PaqueteRelax.jsp">Ver Más</a>
            </div>
        </div>

        <div class="package">
            <img src="images/image16.jpg" alt="Paquete Cultural">
            <div class="content">
                <h3>Paquete Cultural</h3>
                <p>Sumérgete en la cultura local con visitas guiadas y más.</p>
                <a href="PaqueteCultural.jsp">Ver Más</a>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2024 Turismo Nacional | <a href="Contacto.jsp">Contáctanos</a></p>
    </footer>

</body>
</html>
