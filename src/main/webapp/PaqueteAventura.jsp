<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Paquete de Aventura - Turismo Nacional CR</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            overflow-x: hidden;
            background: linear-gradient(135deg, #1e2a47, #1b1b1b);
            color: #fff;
        }

        .container {
            position: relative;
            z-index: 10;
            background-color: rgba(0, 0, 0, 0.7);
            border-radius: 20px;
            padding: 30px;
            width: 80%;
            max-width: 900px;
            box-shadow: 0 16px 40px rgba(0, 0, 0, 0.6);
            margin: 60px auto;
            animation: fadeIn 1.5s ease-in-out;
        }

        h1 {
            font-size: 3em;
            text-align: center;
            color: #00ffcc;
            text-shadow: 2px 2px 5px rgba(0, 255, 204, 0.7);
            letter-spacing: 2px;
        }

        h2, h3 {
            color: #f0f0f0;
            font-weight: 500;
            margin-bottom: 10px;
        }

        p {
            line-height: 1.6;
            font-size: 1.1em;
            margin-bottom: 20px;
        }

        ul {
            padding-left: 20px;
            list-style-type: none;
        }

        ul li {
            margin-bottom: 12px;
            font-size: 1.2em;
        }

        ul li::before {
            content: '✔';
            color: #00ffcc;
            margin-right: 10px;
        }

        .itinerary {
            margin-top: 30px;
            padding: 20px;
            background-color: rgba(0, 0, 0, 0.6);
            border-radius: 10px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.4);
        }

        .itinerary h3 {
            font-size: 1.5em;
            margin-bottom: 10px;
        }

        .gallery img {
            width: 100%;
            height: auto;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.4);
            transition: transform 0.3s ease-in-out;
        }

        .gallery img:hover {
            transform: scale(1.05);
        }

        .gallery {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 20px;
        }

        .button {
            display: inline-block;
            background: #00ffcc;
            color: #1e1e1e;
            padding: 10px 20px;
            border-radius: 30px;
            font-size: 1.2em;
            text-decoration: none;
            text-align: center;
            margin-top: 20px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 10px rgba(0, 255, 204, 0.3);
        }

        .button:hover {
            background: #1e1e1e;
            color: #00ffcc;
            transform: scale(1.05);
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
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

        <a href="#" class="button">Reserva Ahora</a>
    </div>
</body>
</html>
