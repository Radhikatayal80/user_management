<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Page</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(to right, #eef2f3, #8e9eab);
            color: #333;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
        }

        header {
            background: #004aad;
            color: #fff;
            padding: 15px 0;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 1000;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
        }

        .header-container {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        header h1 {
            font-size: 2.5rem;
            margin: 0;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.5);
        }

        header nav {
            margin-top: 10px;
        }

        header nav a {
            color: #fff;
            font-size: 1rem;
            margin: 0 15px;
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 25px;
            transition: background 0.3s ease, transform 0.3s ease;
        }

        header nav a:hover {
            background: #002f6c;
            transform: scale(1.05);
        }

        main {
            margin-top: 100px;
            padding: 20px;
            width: 100%;
            max-width: 900px;
        }

        .profile-container {
            background: #fff;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            animation: fadeIn 0.6s ease-out;
        }

        .profile-container h2 {
            font-size: 2rem;
            margin-bottom: 20px;
            color: #004aad;
        }

        .user-details {
            width: 100%;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
        }

        .user-details p {
            background: #f0f4f8;
            padding: 15px;
            border-radius: 10px;
            font-size: 1.1rem;
            display: flex;
            align-items: center;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
        }

        .user-details p:hover {
            transform: translateY(-3px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .user-details p strong {
            color: #004aad;
            margin-right: 10px;
        }

        .user-details p::before {
            content: '\2022';
            margin-right: 10px;
            color: #004aad;
            font-size: 1.2rem;
        }

        footer {
            background: #004aad;
            color: #fff;
            text-align: center;
            padding: 15px;
            position: fixed;
            bottom: 0;
            width: 100%;
            font-size: 0.9rem;
            box-shadow: 0 -4px 6px rgba(0, 0, 0, 0.2);
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @media (max-width: 600px) {
            header h1 {
                font-size: 1.8rem;
            }

            .user-details {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <header>
        <div class="header-container">
            <h1>Your Profile</h1>
            <nav>
                <a href="welcome.jsp">Home</a>
                <a href="about.jsp">About</a>
                <a href="editProfile.jsp">Edit Profile</a>
                <a href="login.jsp">Logout</a>
            </nav>
        </div>
    </header>
    <main>
        <div class="profile-container">
            <h2>Profile Details</h2>
            <c:if test="${not empty errorMessage}">
                <p class="error" style="color: red;">${errorMessage}</p>
            </c:if>
            <div class="user-details">
                <p><strong>ID:</strong> ${id}</p>
                <p><strong>Name:</strong> ${uname}</p>
                <p><strong>Email:</strong> ${uemail}</p>
                <p><strong>Gender:</strong> ${gender}</p>
                <p><strong>Address:</strong> ${address}</p>
                <p><strong>Date of Joining:</strong> ${joinDate}</p>
            </div>
        </div>
    </main>
  <footer>
        &copy; 2024 Interra. All Rights Reserved.</a>
    </footer>
</body>
</html>
