<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Paquete Relax - Turismo Nacional CR</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('images/image32.jpg') no-repeat center center fixed;
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
        <h1>Paquete Relax</h1>
        <p>Relájate y recarga energías con nuestro Paquete Relax. Diseñado para aquellos que buscan desconectarse del estrés y disfrutar de experiencias relajantes, este paquete te llevará a algunos de los mejores spas y fuentes termales de Costa Rica.</p>

        <h2>Actividades Incluidas</h2>
        <ul>
            <li><strong>Masajes Terapéuticos:</strong> Disfruta de masajes relajantes realizados por expertos terapeutas en el ambiente más tranquilo.</li>
            <li><strong>Fuentes Termales:</strong> Sumérgete en aguas termales naturales, perfectas para aliviar tensiones y mejorar el bienestar.</li>
            <li><strong>Yoga y Meditación:</strong> Sesiones de yoga al amanecer y meditación guiada para ayudar a calmar la mente y el cuerpo.</li>
            <li><strong>Sauna y Spa:</strong> Relájate en saunas y salas de vapor, ideales para detoxificar y rejuvenecer tu piel.</li>
        </ul>

        <h2>Duración del Paquete</h2>
        <p>Este paquete relax está diseñado para una experiencia de <strong>3 días y 2 noches</strong>, ideal para quienes desean desconectarse y disfrutar de la tranquilidad de Costa Rica.</p>

        <h2>Itinerario</h2>
        <div class="itinerary">
            <h3>Día 1:</h3>
            <p>Llegada y check-in en el resort. Disfruta de una tarde de relajación en las fuentes termales. Al final del día, un masaje terapéutico para comenzar a liberar el estrés.</p>
            
            <h3>Día 2:</h3>
            <p>Inicia el día con una sesión de yoga al amanecer. Luego, disfruta de un día completo de spa con sauna, masajes y un almuerzo ligero. Por la tarde, tiempo libre para disfrutar del entorno natural.</p>

            <h3>Día 3:</h3>
            <p>Comienza con una sesión de meditación y un último baño en las aguas termales antes de hacer el check-out y regresar a casa.</p>
        </div>

        <h2>Precios</h2>
        <p><strong>$450 USD</strong> por persona. El precio incluye alojamiento, todas las actividades mencionadas y desayunos. Descuentos disponibles para grupos o reservas anticipadas.</p>

        <h2>Galería de Fotos</h2>
        <div class="gallery">
            <img src="images/spa.jpg" alt="Spa Relax">
            <img src="images/thermal-pool.jpg" alt="Fuente Termal">
            <img src="images/yoga.jpg" alt="Yoga al Amanecer">
            <img src="images/sauna.jpg" alt="Sauna Relajante">
        </div>
    </div>
</body>
</html>
