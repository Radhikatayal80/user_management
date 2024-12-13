<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Profile - Interra Information Technologies</title>
    <style>
      
        body {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: url('background.jpeg') no-repeat center center fixed;
            background-size: cover;
            overflow-y: auto;
        }

        .glass-container {
            backdrop-filter: blur(10px);
            background: rgba(255, 255, 255, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.3);
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
            border-radius: 15px;
            padding: 30px;
            width: 90%;
            max-width: 400px;
            text-align: center;
            position: relative;
            z-index: 1;
        }

        .glass-container img {
            width: 120px;
            margin-bottom: 20px;
        }

        .glass-container h1 {
            color: #fff;
            font-size: 24px;
            margin-bottom: 1rem;
        }

        label {
            display: block;
            text-align: left;
            margin-bottom: 0.5rem;
            font-weight: bold;
            color: #fff;
        }

        input[type="text"], input[type="email"], input[type="password"], input[type="date"], textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 1rem;
            border: 1px solid rgba(255, 255, 255, 0.5);
            border-radius: 5px;
            font-size: 16px;
            background: rgba(255, 255, 255, 0.2);
            color: #fff;
        }

        textarea {
            resize: vertical;
            height: 100px;
        }

        input::placeholder {
            color: #ddd;
        }

        input:focus, textarea:focus {
            outline: none;
            border: 1px solid #4c8aff;
            box-shadow: 0 0 5px #4c8aff;
        }

        button {
            background: linear-gradient(45deg, #4c8aff, #4caf50);
            color: #fff;
            border: none;
            padding: 12px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
            width: 100%;
        }

        button:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }

    </style>
</head>
<body>
    <div class="glass-container">
        <img src="logo.svg" width="200px" alt="Interra Logo">
        <h1>Edit Profile</h1>
        <form action="editProfile" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" value="<%= session.getAttribute("user_name") %>" required><br>
          
            
            <label for="gender">Gender:</label>
            <input type="radio" id="male" name="gender" value="Male" <% if ("Male".equals(request.getAttribute("gender"))) { %> checked <% } %> required> Male
            <input type="radio" id="female" name="gender" value="Female" <% if ("Female".equals(request.getAttribute("gender"))) { %> checked <% } %> required> Female<br>
            
            <label for="address">Address:</label>
            <textarea id="address" name="address" required><%= session.getAttribute("user_address") %></textarea><br>
            
            <label for="joining_date">Joining Date:</label>
            <input type="date" id="joining_date" name="joining_date" value="<%= session.getAttribute("joining_date") %>" required><br>
            
            <button type="submit">Update Profile</button>
        </form>
    </div>
</body>
</html>
