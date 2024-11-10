<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Paquete de Aventura - Turismo Nacional CR</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('images/image31.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #fff;
            display: flex;
            justify-content: center;
            padding-top: 20px;
        }
        .container {
            background-color: rgba(0, 0, 0, 0.7);
            border-radius: 10px;
            padding: 30px;
            width: 90%;
            max-width: 800px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
            color: #fff;
        }
        h1 {
            text-align: center;
            color: #4CAF50;
        }
        h2, h3 {
            color: #f0f0f0;
        }
        p {
            line-height: 1.6;
            margin: 10px 0;
        }
        .itinerary, .gallery {
            margin-top: 20px;
        }
        .gallery img {
            width: 100px;
            height: 80px;
            border-radius: 8px;
            margin: 5px;
            object-fit: cover;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Paquete de Aventura</h1>
        <p>¡Experimenta la adrenalina en los mejores lugares de Costa Rica con nuestro exclusivo paquete de aventura! Este paquete está diseñado para quienes buscan emociones extremas y un contacto cercano con la naturaleza.</p>

        <h2>Actividades Incluidas</h2>
        <ul>
            <li><strong>Canopy:</strong> Deslízate entre los árboles y disfruta de vistas espectaculares desde las alturas.</li>
            <li><strong>Rafting:</strong> Experimenta la emoción de navegar los rápidos de los ríos más emocionantes de Costa Rica.</li>
            <li><strong>Senderismo:</strong> Explora la naturaleza tropical y descubre fauna y flora únicas en cada paso.</li>
            <li><strong>Rappel:</strong> Desciende cascadas y acantilados en un entorno seguro y controlado.</li>
        </ul>

        <h2>Duración del Paquete</h2>
        <p>Este paquete está diseñado para una experiencia completa de <strong>3 días y 2 noches</strong>, ideal para quienes buscan una escapada corta pero llena de aventura.</p>

        <h2>Itinerario</h2>
        <div class="itinerary">
            <h3>Día 1:</h3>
            <p>Llegada y check-in en el hotel de aventura. Por la tarde, experiencia de canopy y recorrido de senderismo para una introducción a la jungla costarricense.</p>
            
            <h3>Día 2:</h3>
            <p>Desayuno en el hotel. Actividades de rafting en el río y tiempo libre para explorar la zona. Al final del día, sesión de rappel en cascadas cercanas.</p>

            <h3>Día 3:</h3>
            <p>Desayuno y check-out. Mañana libre para disfrutar del entorno y preparar el regreso.</p>
        </div>

        <h2>Precios</h2>
        <p><strong>$450 USD</strong> por persona. El precio incluye alojamiento, todas las actividades mencionadas y desayunos. Descuentos disponibles para grupos de 4 o más personas.</p>

        <h2>Galería de Fotos</h2>
        <div class="gallery">
            <img src="images/canopy.jpg" alt="Canopy">
            <img src="images/rafting.jpg" alt="Rafting">
            <img src="images/senderismo.jpg" alt="Senderismo">
            <img src="images/rappel.jpg" alt="Rappel">
        </div>
    </div>
</body>
</html>
