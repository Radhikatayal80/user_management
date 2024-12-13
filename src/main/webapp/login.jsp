<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Interra Information Technologies</title>
    <style>
        /* General Styling */
        body {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: url('background.jpeg') no-repeat center center fixed;
            background-size: cover;
        }

        /* Glass Effect Container */
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
        }

        /* Logo */
        .glass-container img {
            width: 120px;
            margin-bottom: 20px;
        }

        /* Form Header */
        .glass-container h1 {
            color: #fff;
            font-size: 24px;
            margin-bottom: 1rem;
        }

        /* Form Inputs */
        label {
            display: block;
            text-align: left;
            margin-bottom: 0.5rem;
            font-weight: bold;
            color: #fff;
        }

        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 1rem;
            border: 1px solid rgba(255, 255, 255, 0.5);
            border-radius: 5px;
            font-size: 16px;
            background: rgba(255, 255, 255, 0.2);
            color: #fff;
        }

        input::placeholder {
            color: #ddd;
        }

        input:focus {
            outline: none;
            border: 1px solid #4c8aff;
            box-shadow: 0 0 5px #4c8aff;
        }

        /* Login Button */
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

        /* Links */
        a {
            color: #fff;
            text-decoration: none;
            font-weight: bold;
            margin-top: 15px;
            display: inline-block;
            transition: color 0.3s ease;
        }

        a:hover {
            color: #4c8aff;
        }

        /* Error Message */
        .error {
            color: #ff4c4c;
            font-size: 14px;
            margin-top: -10px;
            margin-bottom: 10px;
            text-align: left;
        }
    </style>
    <script>
        function validateForm(event) {
            const email = document.getElementById("email").value;
            const password = document.getElementById("password").value;
            let valid = true;

            // Reset all error messages
            document.getElementById("email-error").textContent = "";
            document.getElementById("password-error").textContent = "";

            // Email validation
            const emailError = document.getElementById("email-error");
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!email || !emailRegex.test(email)) {
                emailError.textContent = "Please enter a valid email address.";
                valid = false;
            }

            // Password validation
            const passwordError = document.getElementById("password-error");
            const passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@$!%*?&]{6,}$/;
            if (!password || !passwordRegex.test(password)) {
                passwordError.textContent = "Password must be at least 6 characters long and include at least one letter and one number.";
                valid = false;
            }

            // If validation passes, submit the form and redirect
             if (valid) {
                // Assuming login is successful, redirect to the welcome page
                window.location.href = "welcome.jsp"; // Replace with the correct URL of the welcome page
            } else {
                event.preventDefault(); // Prevent form submission if validation fails
            }
          
        }
    </script>
</head>
<body>
    <div class="glass-container">
        <img src="Images/logo.svg" width="500px" alt="Interra Logo">
        <h1>Welcome Back!</h1>

        <!-- Form action points to the backend login endpoint -->
        <form action="login" method="POST" onsubmit="validateForm(event)">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" placeholder="Enter your email" required>
            <div id="email-error" class="error"></div>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" placeholder="Enter your password" required>
            <div id="password-error" class="error"></div>

            <button type="submit">Login</button>
        </form>

        <a href="register.jsp">Not Registered? Sign Up</a>
    </div>
</body>
</html>
