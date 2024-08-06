<%@ page import="java.sql.*, java.io.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Students List</title>
    <link rel="icon" type="image/x-icon" href="photos/logo.png">
    <style>
         body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0; /* Reset padding */
            background-color: #f5f5f5; /* Light background color */
            color: #333; /* Dark text color */
            display: flex;
            flex-direction: column; /* Adjusted to column layout */
            min-height: 100vh;
            background-image: url(trans.jpg);
            background-repeat: no-repeat;
            background-size: cover;
        }
        nav {
            background-color: #007bff; /* Navbar background color */
            color: #fff; /* Navbar text color */
            padding: 10px 20px; /* Adjusted padding */
            text-align: center; /* Center align text */
        }
        .content-wrapper {
            display: flex;
            flex-direction: column;
            align-items: center;
            background-color: rgba(255, 255, 255, 0.9); /* Semi-transparent white background */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Adjusted box shadow color */
            margin-top: 20px; /* Added margin-top */
        }
        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd; /* Light border color */
            text-align: left;
            padding: 8px;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2; /* Lighter background color for even rows */
        }
        form {
            margin-bottom: 20px;
        }
        form label {
            margin-right: 10px;
        }
        form input[type="text"] {
            padding: 5px;
        }
        form input[type="submit"] {
            padding: 5px 10px;
            cursor: pointer;
            background-color: #007bff; /* Button background color */
            color: #fff; /* Button text color */
            border: none;
            border-radius: 4px;
        }
        #searchInput {
            display: none;
        }
        .redirect-button {
            text-align: center;
            margin-top: 20px;
        }
        .redirect-button button {
            padding: 10px 20px;
            background-color: #45a049; /* Button background color */
            color: #fff; /* Button text color */
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <nav>
        <h1>Sunshine Jr College</h1>
    </nav>
    <div class="content-wrapper">
        <h2>Student Details</h2>
        <form action="" method="GET">
            

            <label for="course">Filter by Course:</label>
            <select id="course" name="course">
                <option value="">All</option>
                <!-- Add options dynamically from the database or provide static options -->
                <option value="MPC">MPC</option>
                <option value="BiPC">Bipc</option>
            </select><br><br>
                                
            <label for="year">Filter by Studying Year:</label>
            <select id="year" name="year">
                <option value="">All</option>
                <!-- Add options dynamically from the database or provide static options -->
                <option value="1">Year 1</option>
                <option value="2">Year 2</option>
            </select><br><br>
                                
            <input type="submit" value="Filter">
            
                
        </form>
        
        <table>
            <tr>
                <th>Registration number</th>
                <th>Name</th>
                <th>Email</th>
                <th>Course</th>
                <th>Year</th>
            </tr>
            <% 
            try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "kiran", "2105");
                String filterCourse = request.getParameter("course");
String filterYear = request.getParameter("year");

// Modify the SQL query accordingly
String query = "SELECT * FROM student WHERE 1=1";

if (filterCourse.equals("MPC") && filterYear.equals("1")) {
    query += " AND course = '"+filterCourse+"' and year='"+filterYear+"'";
}
if (filterCourse.equals("MPC") && filterYear.equals("2")) {
    query += " AND course = '"+filterCourse+"' and year='"+filterYear+"'";
}
if (filterCourse.equals("BiPC") && filterYear.equals("1")) {
    query += " AND course = '"+filterCourse+"' and year='"+filterYear+"'";
}
if (filterCourse.equals("BiPC") && filterYear.equals("2")) {
    query += " AND course = '"+filterCourse+"' and year='"+filterYear+"'";
}


PreparedStatement p1 = con.prepareStatement(query);

                
                ResultSet rs = p1.executeQuery();
                while (rs.next()) {
            %>
                    <tr>
                        <td><%= rs.getString(1) %></td>
                        <td><%= rs.getString(2) %></td>
                        <td><%= rs.getString(8) %></td>
                        <td><%= rs.getString(4)%></td>
                        <td><%= rs.getString(5) %></td>
                    </tr>
            <% 
                }
                con.close();
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
            %>
        </table>
        
        <script>
            document.getElementById("course").addEventListener("change", function() {
                var courseInput = document.getElementById("course");
                var yearInput = document.getElementById("year");
                if (courseInput.value !== "") {
                    yearInput.disabled = false; // Enable year dropdown
                } else {
                    yearInput.disabled = true; // Disable year dropdown if course is not selected
                    yearInput.value = ""; // Reset year dropdown value
                }
            });
        </script>
        

    </div>

</body>
</html>