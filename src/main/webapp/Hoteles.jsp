<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Hoteles Recomendados en Costa Rica</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('images/image28.jpg') no-repeat center center fixed;
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
        }
        h1 {
            text-align: center;
            color: #f5f5f5;
            margin-bottom: 20px;
        }
        .hotel {
            background-color: #fff;
            color: #333;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            display: flex;
            align-items: center;
        }
        .hotel img {
            width: 150px;
            height: 100px;
            border-radius: 8px;
            margin-right: 20px;
            object-fit: cover;
        }
        .hotel-info {
            flex: 1;
        }
        .hotel-info h2 {
            margin-top: 0;
            color: #4CAF50;
        }
        .hotel-info p {
            margin: 5px 0;
            line-height: 1.5;
        }
        .services {
            color: #888;
            font-size: 0.9rem;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Hoteles Recomendados en Costa Rica</h1>

        <!-- Primer hotel -->
        <div class="hotel">
            <img src="images/image25.jpg" alt="Hotel Costa Verde">
            <div class="hotel-info">
                <h2>Hotel Costa Verde</h2>
                <p><strong>Ubicación:</strong> Manuel Antonio, Puntarenas</p>
                <p><strong>Calificación:</strong> ★★★★☆</p>
                <p>Este hotel se encuentra rodeado de la selva tropical y ofrece vistas espectaculares al océano. Ideal para amantes de la naturaleza y aquellos que buscan una experiencia única en la jungla costarricense.</p>
                <p class="services"><strong>Servicios:</strong> Wi-Fi, piscina, restaurante, acceso a la playa, tours ecológicos.</p>
            </div>
        </div>

        <!-- Segundo hotel -->
        <div class="hotel">
            <img src="images/image26.jpg" alt="Arenal Springs Resort">
            <div class="hotel-info">
                <h2>Hotel Arenal Springs Resort</h2>
                <p><strong>Ubicación:</strong> La Fortuna, Alajuela</p>
                <p><strong>Calificación:</strong> ★★★★☆</p>
                <p>Con vistas al Volcán Arenal, este resort es perfecto para quienes buscan relajarse en aguas termales y disfrutar de un entorno volcánico impresionante.</p>
                <p class="services"><strong>Servicios:</strong> Piscinas termales, spa, restaurante, Wi-Fi, tours de aventura.</p>
            </div>
        </div>

        <!-- Tercer hotel -->
        <div class="hotel">
            <img src="images/image27.jpg" alt="Hotel Punta Islita">
            <div class="hotel-info">
                <h2>Hotel Punta Islita</h2>
                <p><strong>Ubicación:</strong> Guanacaste</p>
                <p><strong>Calificación:</strong> ★★★★★</p>
                <p>Un resort de lujo que ofrece privacidad, vistas al mar y experiencias culturales auténticas. Ideal para una escapada romántica o una experiencia costarricense inolvidable.</p>
                <p class="services"><strong>Servicios:</strong> Spa, campo de golf, piscina infinita, actividades al aire libre, Wi-Fi.</p>
            </div>
        </div>

    </div>
</body>
</html>
