<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Faculty Panel</title>
    <link rel="icon" type="image/x-icon" href="photos/logo.png">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
        }
        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            padding: 20px;
        }
        .division {
            flex-basis: 100%;
            padding: 0 10px;
            text-align: center;
            display: flex;
            justify-content: center; /* Center horizontally */
            align-items: center;
            margin-bottom: 20px;
            margin-top: 25vh;
        }
        .card {
            width: 200px;
            height: 200px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            margin: 20px; 
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            transition: box-shadow 0.3s ease;
        }
        .card:hover {
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }
        .card h2 {
            margin: 0;
            font-size: 14px;
            text-align: center;
            padding: 10px;
            color: #333;
        }
        .card p {
            margin: 0;
            text-align: center;
            color: #666;
            font-size: 12px;
        }
        .card-button {
            margin-top: 10px;
            padding: 6px 12px; 
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            font-size: 12px;
        }
        .card-button:hover {
            background-color: #0056b3;
        }
        .navbar {
            background-color: #007bff;
            color: #fff;
            padding: 10px 0;
        }
        .navbar h1 {
            margin: 0;
            font-size: 24px;
        }
        b{
            margin-left: 63vw;
            font-size: large;
        }
    </style>
</head>
<body>

<div class="navbar">
    <h1><img class="logoim" src="photos/logo.png" alt="" style="height: 35px;width: 35px;margin-right: 10px;margin-left: 15px;">Sunshine Jr College <%
        String rn0=(String)session.getAttribute("facname");
        out.println("<b>"+"Welcome "+rn0+"..."+"</b>");
        %></h1>
</div>

<div class="container">
    <!-- Division -->
    <div class="division">
        <div class="card">
            <h2>Term One Entry</h2>
            <p>Add term one marks entry.</p>
            <a href="termone.html"><button class="card-button">Add Entry</button></a>
        </div>

        <div class="card">
            <h2>Sunshine Jr College Faculty</h2>
            <!--<p>Manage faculty members.</p>
            <a href="faculty.html"><button class="card-button">View Faculty</button></a>-->
        </div>

        <div class="card">
            <h2>Term Two Entry</h2>
            <p>Add term two marks entry.</p>
            <a href="termtwo.html"><button class="card-button">Add Entry</button></a>
        </div>
    </div>
</div>

</body>
</html>
