<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome - Interra Information Technologies</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Roboto', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            overflow: hidden;
            background: linear-gradient(45deg, #0056b3, #00c6ff, #007bff, #00b7ff);
            background-size: 400% 400%;
            animation: gradientAnimation 15s ease infinite;
            color: #fff;
        }

        @keyframes gradientAnimation {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .glass-container {
            backdrop-filter: blur(15px);
            background: rgba(255, 255, 255, 0.15);
            border: 1px solid rgba(255, 255, 255, 0.3);
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2);
            border-radius: 20px;
            padding: 40px;
            max-width: 700px;
            text-align: center;
            animation: fadeIn 1.5s ease;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: scale(0.9); }
            to { opacity: 1; transform: scale(1); }
        }

        .glass-container img {
            width: 120px;
            margin-bottom: 20px;
            animation: slideDown 1s ease-out;
        }

        @keyframes slideDown {
            from { opacity: 0; transform: translateY(-50px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .glass-container h1 {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 10px;
        }

        .glass-container p {
            font-size: 1rem;
            margin-bottom: 20px;
        }

        .options-container {
            display: flex;
            justify-content: center;
            gap: 20px;
            flex-wrap: wrap;
        }

        .option-card {
            background: rgba(255, 255, 255, 0.25);
            border-radius: 10px;
            padding: 20px;
            text-align: center;
            width: 280px;
            transition: transform 0.3s, box-shadow 0.3s;
            animation: fadeInUp 1.5s ease-out;
        }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(50px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .option-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }

        .option-card h2 {
            font-size: 1.2rem;
            font-weight: 500;
            margin-bottom: 10px;
        }

        .option-card p {
            font-size: 0.95rem;
            margin-bottom: 15px;
        }

        .option-card a {
            display: inline-block;
            padding: 10px 20px;
            font-size: 0.95rem;
            font-weight: 500;
            color: #fff;
            background: linear-gradient(90deg, #00c6ff, #007bff);
            border-radius: 6px;
            text-decoration: none;
            transition: background 0.3s, transform 0.2s;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        .option-card a:hover {
            background: linear-gradient(90deg, #007bff, #00c6ff);
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <div class="glass-container">
        <img src="Images/logo.svg" alt="Interra Logo">
        <h1>Welcome to Interra Information Technologies</h1>
        <p>Partnering in innovation, empowering businesses through IT excellence.</p>

        <div class="options-container">
            <div class="option-card">
                <h2>About Us</h2>
                <p>Discover our mission, values, and the solutions we provide.</p>
                <a href="about.jsp">Learn More</a>
            </div>

            <div class="option-card">
                <h2>Profile Details</h2>
                <p>View your profile and explore personalized information.</p>
                <a href="profile.jsp">View Profile</a>
            </div>
        </div>
    </div>
</body>
</html>
