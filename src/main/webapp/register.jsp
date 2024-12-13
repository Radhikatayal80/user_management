<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register - Interra Information Technologies</title>
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

        input[type="text"],
        input[type="email"],
        input[type="password"],
        input[type="date"],
        textarea {
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

        .error {
            color: #ff4c4c;
            font-size: 14px;
            text-align: left;
            margin-bottom: 10px;
        }
    </style>
    <script>
        function validateForm() {
            let valid = true;

            document.querySelectorAll('.error').forEach(el => el.textContent = "");

            const name = document.getElementById("name").value.trim();
            const email = document.getElementById("email").value.trim();
            const password = document.getElementById("password").value.trim();
            const gender = document.querySelector('input[name="gender"]:checked');
            const address = document.getElementById("address").value.trim();
            const joiningDate = document.getElementById("joining_date").value;

            if (!name) {
                document.getElementById("nameError").textContent = "Name is required.";
                valid = false;
            }

            if (!email) {
                document.getElementById("emailError").textContent = "Email is required.";
                valid = false;
            }

            const passwordRegex = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*()_+={}\[\]:;"'<>,.?/-]).+$/;
            if (!password) {
                document.getElementById("passwordError").textContent = "Password is required.";
                valid = false;
            } else if (!passwordRegex.test(password)) {
                document.getElementById("passwordError").textContent = "Password must contain at least one uppercase letter, one lowercase letter, one digit, and one special character.";
                valid = false;
            }

            if (!gender) {
                document.getElementById("genderError").textContent = "Gender is required.";
                valid = false;
            }

            if (!address) {
                document.getElementById("addressError").textContent = "Address is required.";
                valid = false;
            }

            const today = new Date().toISOString().split('T')[0];
            if (!joiningDate) {
                document.getElementById("joiningDateError").textContent = "Joining Date is required.";
                valid = false;
            } else if (joiningDate > today) {
                document.getElementById("joiningDateError").textContent = "Joining Date cannot be a future date.";
                valid = false;
            }

            if (valid) {
                setTimeout(function() {
                    window.location.href = 'login.jsp';  
                }, 500); 
            }

            return valid;
        }
    </script>
</head>
<body>
    <div class="glass-container">
        <img src="Images/logo.svg" alt="Interra Logo">
        <h1>Register</h1>
        <form action="register" method="post" onsubmit="return validateForm()">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name">
            <span class="error" id="nameError"></span>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email">
            <span class="error" id="emailError"></span>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password">
            <span class="error" id="passwordError"></span>

            <label for="gender">Gender:</label>
            <input type="radio" id="male" name="gender" value="Male"> Male
            <input type="radio" id="female" name="gender" value="Female"> Female
            <span class="error" id="genderError"></span>

            <label for="address">Address:</label>
            <textarea id="address" name="address"></textarea>
            <span class="error" id="addressError"></span>

            <label for="joining_date">Joining Date:</label>
            <input type="date" id="joining_date" name="joining_date">
            <span class="error" id="joiningDateError"></span>

            <button type="submit">Register</button>
        </form>
    </div>
</body>
</html>
