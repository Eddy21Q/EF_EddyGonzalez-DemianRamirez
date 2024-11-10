<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Paquetes de Turismo</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('images/image29.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #fff;
            display: flex;
            justify-content: center;
            padding-top: 20px;
            text-align: center;
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
            color: #f5f5f5;
        }
        .package {
            background-color: #fff;
            color: #333;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .package h2 {
            color: #4CAF50;
        }
        .package p {
            line-height: 1.5;
        }
        .package a {
            display: inline-block;
            margin-top: 10px;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
        }
        .package a:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Paquetes de Turismo en Costa Rica</h1>
        
        <!-- Paquete de Aventura -->
        <div class="package">
            <h2>Paquete de Aventura</h2>
            <p>Este paquete está diseñado para los amantes de la adrenalina. Disfruta de actividades como tirolesa, rafting, senderismo y mucho más en los lugares más exóticos de Costa Rica.</p>
            <a href="PaqueteAventura.jsp">Ver Paquete de Aventura</a>
        </div>

        <!-- Paquete de Relax -->
        <div class="package">
            <h2>Paquete de Relax</h2>
            <p>Si buscas desconectar y relajarte, este paquete es perfecto para ti. Incluye acceso a spas, aguas termales y playas paradisiacas para que puedas descansar y revitalizarte.</p>
            <a href="PaqueteRelax.jsp">Ver Paquete de Relax</a>
        </div>

        <!-- Paquete Cultural -->
        <div class="package">
            <h2>Paquete Cultural</h2>
            <p>Descubre la rica cultura de Costa Rica. Este paquete incluye visitas a sitios históricos, tours culturales y experiencias únicas con comunidades locales.</p>
            <a href="PaqueteCultural.jsp">Ver Paquete Cultural</a>
        </div>
        
    </div>
</body>
</html>
