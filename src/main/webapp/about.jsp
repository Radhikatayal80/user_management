<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Interra</title>
    <style>
        /* Global Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f4f4f9;
            color: #333;
            line-height: 1.6;
            margin: 0;
            padding: 0;
        }

        header {
            background: #004aad;
            color: #fff;
            text-align: center;
            padding: 20px 0;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        header h1 {
            font-size: 2.5rem;
            text-transform: uppercase;
            margin-bottom: 5px;
        }

        header p {
            font-size: 1.2rem;
            margin: 0;
        }

        .section-title {
            text-align: center;
            font-size: 2rem;
            color: #004aad;
            margin: 30px 0 15px;
            font-weight: bold;
        }

        section {
            margin: 0 auto;
            max-width: 1200px;
            padding: 20px;
        }

        .services-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }

        .service-card {
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: transform 0.3s, box-shadow 0.3s;
            width: calc(33% - 20px);
            min-width: 300px;
            text-align: center;
        }

        .service-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
        }

        .service-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .service-card h3 {
            font-size: 1.5rem;
            color: #004aad;
            margin: 15px 0 10px;
        }

        .service-card p {
            font-size: 1rem;
            color: #666;
            padding: 0 10px 20px;
        }

        footer {
            background: #004aad;
            color: #fff;
            text-align: center;
            padding: 15px 0;
            margin-top: 30px;
            font-size: 0.9rem;
        }

        footer a {
            color: #ffdd57;
            text-decoration: none;
        }

        footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>
    <!-- Header Section -->
    <header>
        <h1>About Us</h1>
        <p>Empowering Businesses with Innovative Solutions</p>
    </header>

    <!-- What We Do Section -->
    <section>
        <h2 class="section-title">What We Do</h2>
        <div class="services-container">
            <div class="service-card">
                <img src="Images/customSoftwareSolution.jpg" alt="Custom Software Development">
                <h3>Custom Software Development</h3>
                <p>Tailored solutions to meet your unique business needs with a focus on quality and scalability.</p>
            </div>
            <div class="service-card">
                <img src="Images/cloudSolutions.jpg" alt="Cloud Solutions">
                <h3>Cloud Solutions</h3>
                <p>Seamless cloud integration and management to ensure agility, security, and cost efficiency.</p>
            </div>
            <div class="service-card">
                <img src="Images/AI.jpg" alt="AI and Data Analytics">
                <h3>AI and Data Analytics</h3>
                <p>Leverage artificial intelligence and advanced analytics for smarter decision-making and automation.</p>
            </div>
            <div class="service-card">
                <img src="Images/mobileApp.jpg" alt="Mobile App Development">
                <h3>Mobile App Development</h3>
                <p>Designing scalable, intuitive, and engaging mobile applications for various platforms.</p>
            </div>
            <div class="service-card">
                <img src="Images/UI.jpg" alt="UI/UX Design">
                <h3>UI/UX Design</h3>
                <p>Creating user-centric, aesthetically pleasing interfaces that enhance the user experience.</p>
            </div>
            <div class="service-card">
                <img src="Images/cyberSecurity.jpg" alt="Cybersecurity">
                <h3>Cybersecurity</h3>
                <p>Protect your business with comprehensive security solutions tailored to your needs.</p>
            </div>
        </div>
    </section>

   
    <footer>
        &copy; 2024 Interra. All Rights Reserved.</a>
    </footer>
</body>

</html>
